Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8AC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:09:56 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.33161.1660763391605754791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=klL47rcv;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id o2so20216172lfb.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mp1SMav7/ZgiQxBeUrp9x3/m/p/daFYSqvlBjiboUr0=;
        b=klL47rcvUAfDluGKMYrdzAHitAlYCTMpYqL0cclV3v2flJbOzsiUENV1139X3IQvVs
         AlM/hh1iuLAPPXj8BNMgC+aodlIwkroGlNUUzcg/J7S/0AlUGK4JgeHGWuZtMMeVNFe5
         w7u9WJLu0d1oGv83WGfKkTZhPSCZoYRw2BU3s63LEFv72aoJl817nWBJFFohoew8PZlw
         UHuFmz+4kCrKY4k8Onwyn6swjlRN7562ytXQp42juKrl+W9nBVyEf8Pa5WT/L911a5ZI
         3AVS80OKeXjllbhGixu/Fs2B5AQMMnjlM21mdW/EltwKagYRLnDq65Xmi4hHZHN9rx0W
         7OtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mp1SMav7/ZgiQxBeUrp9x3/m/p/daFYSqvlBjiboUr0=;
        b=qc4IRELETcbY5sPO5hjRF8U7oY0ck3+McMPkvfes0DrpFN1x7m/PkddqLOHy9RmF2E
         jvc+oHLzbWpjK1/ou8UbjlxVcXDA/aXDD9nfAAvDeH/wMB6DG549AdRlKHEDMRn0o8jx
         RUM4yiebTS5I/m9hNCS44dvTGi83jNPopYL/eDUQ9J0wtMf7kcBHq40XoDOZEB1AUBl1
         nZyeFBaZGr4IzLMCbkLL9aYFcyrQqsrLQvZgVljEeDuS+/eKtWfFydgE0sBZKF6uhmKK
         kz6DXTkTTf3M8rlfjxjm6V0OxhgBG7U2lbOWK7KZzJhW/iywIHoEkpbXTZJDCh0MIYqe
         XzJw==
X-Gm-Message-State: ACgBeo200Bk73M2PaaeQ2HM17RuqFccx4BLFWH2kElr3sptJgp8Z6oTh
	ac37fpUYmXuXJezJjxViukKDnenxmpAmU/AkUXU=
X-Google-Smtp-Source: 
 AA6agR7SxWRRKdx8uohC6Bn6g53fXDJ392TlMA1u6e3ife7ylQ+4c+7E719NgvAI3RpWEjjsKDx//GD/21M4gKsGmnU=
X-Received: by 2002:a05:6512:33d4:b0:48b:3a5f:e6e7 with SMTP id
 d20-20020a05651233d400b0048b3a5fe6e7mr8721576lfg.665.1660763389697; Wed, 17
 Aug 2022 12:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220817190124.2126652-1-jstephan@baylibre.com>
In-Reply-To: <20220817190124.2126652-1-jstephan@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Aug 2022 21:09:37 +0200
Message-ID: 
 <CANNYZj_VxXe6aZKXstZVNov9aeQJ-2beBY1=WojSPA-gvXQqvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-samples: enable network during do_unpack
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 19:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169501

This has not been observed on the autobuilder or independently
reported, can you show how to reproduce or the failure log?

Alex

On Wed, 17 Aug 2022 at 21:01, Julien STEPHAN <jstephan@baylibre.com> wrote:
>
> vulkan-samples uses git submodules and one of the submodules uses lfs
> objects. During the unpack step, the lfs objects are retrieved leading to
> a network failure.
>
> The correct fix is to fetch lfs objects during the fetch step, but let's
> workaround this issue for now
>
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> ---
>  meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> index 41cb4a437d..b45ee22a69 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
> @@ -11,6 +11,11 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
>             file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
>             "
>
> +# Workaround for network access issue during the do_unpack step
> +# this needs to be fixed in the recipes buildsystem to move
> +# this such that it can be accomplished during do_fetch task
> +do_unpack[network] = "1"
> +
>  UPSTREAM_CHECK_COMMITS = "1"
>  SRCREV = "ee6c1522af8ba9b56f8416c2eedafb440f681085"
>
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169500): https://lists.openembedded.org/g/openembedded-core/message/169500
> Mute This Topic: https://lists.openembedded.org/mt/93089137/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

