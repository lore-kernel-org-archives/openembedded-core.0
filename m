Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91ED2C0502A
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:17:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.890.1661962668484384464
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lB+h63F8;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id m7so11743752lfq.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=q947AM1AwkAS+hw8/lIp1uKu+FxoKSEUBSXIAe7lH0s=;
        b=lB+h63F8omkqc+bF8Qtb4LD22ULyavPUofOgU4z7LrAY5TdB6pK/d13eCr+6zcM/eF
         o9Zuu76QMqRc18RFT2jMqH/zMs6D0L0UrXpGk+X5iJ/k5KEts7F2hzQ5TQsTj6bqVdCd
         IEnAubcrjvNZLB2e5Ef8/EWW/dj3MnxOHiQxmngaT6qfp0YuOJRSWvHWQwepmvFL7/La
         99KVPd3wnsezpoVZZi+mdVmVBlaTDFI3/K2LFzv++sUvAK3/u94NE2v9imMXbS+o+1x1
         xQJiBoSsIlmbwbUc34u6JWS0leAOdS78f0GR4oSXJY1IKw0i8xrDVybxX7ThoAjJBQMV
         zXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=q947AM1AwkAS+hw8/lIp1uKu+FxoKSEUBSXIAe7lH0s=;
        b=Fz2+MOfTWxG90OJTCIWcTSNigeGRPSeKL7mIG6YoU04qvwfGF2KEEBUOzFVKRLOzZN
         ZWLZtkmsuTAU5VuRfMy9sY7HO2bidUrzFs6L7/D2msu7WqcrFB/ufJ42lSxarUQdA/X0
         Zygw4IHIfHvF1yZYov9zrcqsxukKBj5xc8U2WT/Fq/Da16IDmgcaGWfZ5GOB5xY6xE99
         Dyyt5Kno7DyQMc8NuD6M2qcMgbQudEXR8NCRpupWre++5wZl3FHPif61aR0hUQR9A4oO
         YqMRuL429HkrK10+nbpgLBOLklQe0OSWyH4ggeWb75IJqbR5RvGmxWTb1PpDTWzQQAZ7
         Q9LQ==
X-Gm-Message-State: ACgBeo0mliWUB8IQXzO5w65RPgEFftxjq3nYInRIFElprO7UjBj+ZxV3
	BTkX3m+dij3FcJfQ6eZiye+DqEjUzp4pd4SrzQM=
X-Google-Smtp-Source: 
 AA6agR60jhiwS8gWUs/pMMX376aqQTWyvsqkjfYkGraXnzD5WyoDNx5Dhfqwq9WXTnxgolOaUpn97FqI6VfkXVce7IQ=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr9218137lfb.665.1661962666685; Wed, 31
 Aug 2022 09:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Aug 2022 18:17:35 +0200
Message-ID: 
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170135

I have to wonder, what is really going on there? :-) This never ending
stream of CVEs makes vim formally the most insecure item in core. Does
anyone know?

Alex

On Wed, 31 Aug 2022 at 18:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Addresses CVE-2022-2980, CVE-2022-2946 and CVE-2022-2982.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-support/vim/vim.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 5b95ab2625c..33a82992433 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://no-path-adjust.patch \
>             "
>
> -PV .= ".0242"
> -SRCREV = "171c683237149262665135c7d5841a89bb156f53"
> +PV .= ".0341"
> +SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170134): https://lists.openembedded.org/g/openembedded-core/message/170134
> Mute This Topic: https://lists.openembedded.org/mt/93374420/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

