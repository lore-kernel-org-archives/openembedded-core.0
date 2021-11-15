Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5910DC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 20:31:54 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web09.188.1637008313248135109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:31:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AA4APdbL;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id v22so12178034qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 12:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBTknLXxZd3M/mhATDQ8nu7A+xora9a5HPsYrW/3fpI=;
        b=AA4APdbLitaJAthHE4LwyWG9mi+MtgvXHAzgO0mp2ssDChB87TytwqnvLKJQi6wv/F
         r7WII+RyAMchMmP13czCw8TzRrwjImHN1pe/0ccmzQkdI57fhGF4jDSO3Eg7S0fiWmmC
         GSp4CorBmSXYrMPcDAOsJ6XDIhV3BIfuGIkRpUIaRkZCMXCKXA1EJ7vp9pSExluXCUb8
         6n4ZMv9oPyR+6e4HzjAMyyinSUGBtVBwsUQcZaWNFK7G+AhVmCgRQgQepg0Ni6Gxmiqj
         UJ8AVS3Qu/yFdSyrWaqCJFxcukOZN8yjpvbadRvrr/DZt9DdL3s6T9RL+ozXjX/9JReT
         AgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBTknLXxZd3M/mhATDQ8nu7A+xora9a5HPsYrW/3fpI=;
        b=dK5lnr3z/WaD3wC+TGQVhc3IaoIZaMojbDBWFbeZ45ro67wXNwd9/pRpGvdHM0vEk1
         SplIIqQ3kpCbmm2M8/RtRFt5oVM3fB72epn6uy5DDbd3skCgalYfvSrJRSz/PMytNpUt
         FxNIjIVtjwxDfsyLgKjWsWzM3e8e+qbRHf5aMULk8NbC69G1tg2Vc3EPnTZ9x6NchpVc
         j+Nj1MS6A1pGpgen4+D2ukMN9IpUoWidwmqJ2bkLuB6/X6oNeT64jA7TJ6seweuAf4Me
         f2eWZL1N8IfQgUCLD/ZgXCQYP6XaWH788vsgqvgXCKZyQ85bZK4thTHnjJ/LMc612jUe
         +uFg==
X-Gm-Message-State: AOAM533t1SNYaBqf5b7br1xGPvc/SSo69DHuu4hu/2sMEe/FgYBwrzwv
	/yGJJ5D1uyW5sv7ho23JrWwUQS0ZSaoDwRbx/gQ=
X-Google-Smtp-Source: 
 ABdhPJyd2TFXyAeVfi6DoAv9kRPYqcMrY/79QKGpLlPxyomtOjeIEWIZi2vMQmLraWGgEhC2osuvMIGugoonE77vx+U=
X-Received: by 2002:a05:622a:15c5:: with SMTP id
 d5mr1888949qty.227.1637008312375;
 Mon, 15 Nov 2021 12:31:52 -0800 (PST)
MIME-Version: 1.0
References: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Nov 2021 12:31:26 -0800
Message-ID: 
 <CAMKF1srh1A3LY0mGtGcKMvvj14iaSHNUtaWJeorYgbmR-ikQyg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ethtool: upgrade 5.14 -> 5.15
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 20:31:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158314

seeing

WARNING: ethtool-5.15-r0 do_patch: Fuzz detected:

Applying patch avoid_parallel_tests.patch
patching file configure.ac
Hunk #1 succeeded at 2 with fuzz 1.


The context lines in the patches can be updated with devtool:

    devtool modify ethtool
    devtool finish --force-patch-refresh ethtool <layer_path>

Don't forget to review changes done by devtool!

WARNING: ethtool-5.15-r0 do_patch: QA Issue: Patch log indicates that
patches do not apply cleanly. [patch-fuzz]

On Mon, Nov 15, 2021 at 7:03 AM wangmy <wangmy@fujitsu.com> wrote:
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../ethtool/{ethtool_5.14.bb => ethtool_5.15.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-extended/ethtool/{ethtool_5.14.bb => ethtool_5.15.bb} (93%)
>
> diff --git a/meta/recipes-extended/ethtool/ethtool_5.14.bb b/meta/recipes-extended/ethtool/ethtool_5.15.bb
> similarity index 93%
> rename from meta/recipes-extended/ethtool/ethtool_5.14.bb
> rename to meta/recipes-extended/ethtool/ethtool_5.15.bb
> index 28a49f4f8a..4192dec300 100644
> --- a/meta/recipes-extended/ethtool/ethtool_5.14.bb
> +++ b/meta/recipes-extended/ethtool/ethtool_5.15.bb
> @@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
>             file://avoid_parallel_tests.patch \
>             "
>
> -SRC_URI[sha256sum] = "9868604c913e5483000c00d5dcb2bb3169a05252de47f62174702ff19cf6de7a"
> +SRC_URI[sha256sum] = "a6a1638192209269ca74a29d73903f28531ebdf0794f3e0bdfdbdee2dc75d98b"
>
>  UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158295): https://lists.openembedded.org/g/openembedded-core/message/158295
> Mute This Topic: https://lists.openembedded.org/mt/87070875/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

