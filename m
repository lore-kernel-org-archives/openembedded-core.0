Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59EAECAAD8
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:05:52 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8771.1661843149269533374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:05:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nIDIUUuI;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id m2so10488369lfp.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=XO1uLdJbM0uPc6IyIZxHeIK4B3Trd6FRtuKAN31j4DI=;
        b=nIDIUUuIbGVG6HX7OAfZrlYXPBvFBVMadtJkpqATkZCyYfwdv/YIi6ayq295i3eT2A
         eyjVpJjdV+I9zDyqB6AhvJ8uZjJtl+lbc9Q7AAW3aNoCXWXdNLet4MtM3ZnzAb5xE7cC
         nwIvYQ6d6ywM58lL4xbyD0L7pPxDj6IDM7LA9haWoig5UCdUOHk9xcT5VbOHN49PDWKJ
         Y1kapZdNQ3JVUIIoDmBrX1i6xDoKfmmX/Nmwqci7dNgsU9XM1dlUNs5ZGjhSatlRwIOR
         EZK8DKU0kXOlpXiCFmBfbAHqWNYK5qzBUvDcfuiORzqsgWv+KDSvLxdUf9UkmjjboMRj
         UeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=XO1uLdJbM0uPc6IyIZxHeIK4B3Trd6FRtuKAN31j4DI=;
        b=8E3NVCX1bswrA+kU83cOxBeHWOt7gDOrL3jGwMwmNmcy+W587MsHnXIzkykzqU4waY
         +6/wYrBVzHzaKJMrP3aNEOnJgigJQxwPZhgN9uebWY9f4EyTXNRKEYhwCEqBkOfLU79n
         5Cv+tAKZgyNj5/FSTcunsCYY2LAhxdEzepBdMnFD8eDifvIGGpSWxjX0eVIOVAdDdHjr
         9u6Q5Ss/ezloZGTCckCZKkrgjrQAn/oIZWDMma26VavLaHpHMgKo71X/bW/Sr8ghqqzv
         rtIk210g73oid+m669PatkU4/ZdR5vRpAG3TTBaL8/iLSO8j1wtWD3rGDA1zSjcAYwcu
         cyDA==
X-Gm-Message-State: ACgBeo3yW4admJVsZv1ngXDIxPPQjJlIrRguMndReuWumWOfV78QnBZJ
	nEUkzREdUT3yknnO2+fECoVTjXeWdU35yJjVNmI=
X-Google-Smtp-Source: 
 AA6agR4IUI4KWSqYwjTh5IMSYqY5geEmEQfxh1g6zVPyxWPeKfa5eA/cSaxxmX6flBZj3VEjlW7TB598pDHR1BWXk6Q=
X-Received: by 2002:a05:6512:687:b0:492:ee7c:5953 with SMTP id
 t7-20020a056512068700b00492ee7c5953mr8125080lfe.673.1661843147234; Tue, 30
 Aug 2022 00:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <1661833494-12657-1-git-send-email-wangmy@fujitsu.com>
 <1661833494-12657-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1661833494-12657-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 Aug 2022 09:05:33 +0200
Message-ID: 
 <CANNYZj9OVYTbSUqPRP+kON9skthsaNy7_ovgDtfFNrCNC-3vfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-headers: upgrade 1.3.216.0 -> 1.3.225
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 07:05:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170066

We only take sdk-x.y.z updates for vulkan (as seen in
UPSTREAM_CHECK_GITTAGREGEX), not regular point releases. So you need
to take what 'devtool latest-version' suggests. Also, all vulkan
recipes should be updated in a single commit for bisectability, those
are:

meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
meta/recipes-graphics/vulkan/vulkan-loader_1.3.216.0.bb
meta/recipes-graphics/vulkan/vulkan-tools_1.3.216.0.bb
meta/recipes-graphics/glslang/glslang_1.3.216.0.bb
meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb

Alex

On Tue, 30 Aug 2022 at 06:25, wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.225.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.216.0.bb => vulkan-headers_1.3.225.bb} (93%)
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
> similarity index 93%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
> index 5f7917ae82..64b9ad22c8 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.216.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.225.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
>
> -SRCREV = "3ef4c97fd6ea001d75a8e9da408ee473c180e456"
> +SRCREV = "715673702f5b18ffb8e5832e67cf731468d32ac6"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170058): https://lists.openembedded.org/g/openembedded-core/message/170058
> Mute This Topic: https://lists.openembedded.org/mt/93342915/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

