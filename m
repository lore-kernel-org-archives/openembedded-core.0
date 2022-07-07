Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286E2C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:07:37 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.243.1657213650833336877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bma5l6aD;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id r2so23629429qta.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3DE2b+aFSJpYbz9QNit+dJ0LofzZT6y2l+DYZaYXI1M=;
        b=Bma5l6aDj83cNXC8Y/SokawHzPqpuM50kKQi5O5Atwft343CG0muy5/ldJ0WuQc0at
         eSi3PWLA8jdvFYCOzO+2QtU/jqa8gbha0YmQWrQgiMoDblTI0YSzTbbWdO6j27wxwyV3
         jqJIXUzIPSB+3HN0+exjhQvGSvfO55dm9oZGw1pFMS6/EpOT+A7TumnMoB7WDm2sZjQE
         kG/C/B+BiWjjqGMn94+Rzhk7RO16CF4pem0s/ZtzurZ41UlJzldOZOqlBZpZvK8pEa3N
         +mOBpPUyIm980A92wiwkydD+VCBQq49KCIqsd43SqQBbB+kNSEExtip+EhXqxt8tC+L1
         sENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3DE2b+aFSJpYbz9QNit+dJ0LofzZT6y2l+DYZaYXI1M=;
        b=rbAyCRTkyraFGrlFiEFBLq62tEZRiCwYXM6S+LkQYOw0N0UWoeaYzRvCjzdhbsNNl/
         8zv/7+C6mwfaT2fdRqDg4HgXeeB5mJqMlqq6j3Z1h7Xh/VBcMykSsOJtxNqML6Jm0TQH
         J0MWNaB8ascNCwpLcM33AvNkT6o9PTWl3u9BC5VQnWayGp5xhozepKLBJbupmgg3u3zd
         a5/pGb5oQ/K9snz3cRI8qBeRdjOGWZCpzpthXvxiTLouAqSKDKav5T/MXsggglWYWht1
         Za73fkI4+y2s40zrFmURu2pInKfCGbYPj827eiFOWjl5mOK0RJj2uSW5i6qyQ46G8z8u
         zs6w==
X-Gm-Message-State: AJIora9aht+WGt6p1spkIwQMA59jVJQDPRGZSTnqWKOqxgHgFzsCX99i
	TWS/gCP+3oMJffnXuvmodsZNwg+O2G42+0yTD2E=
X-Google-Smtp-Source: 
 AGRyM1vKDN3AMbI7pXj3/HWX4TpcO8oNteCtZ4r5sOzvgqWiqnt0pUjMKe3Cyzpo4WInLkd6VKGza9oxuTquQp7XiRY=
X-Received: by 2002:ad4:5bea:0:b0:473:301:3859 with SMTP id
 k10-20020ad45bea000000b0047303013859mr13005358qvc.16.1657213649741; Thu, 07
 Jul 2022 10:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220707164313.2697033-1-ross.burton@arm.com>
In-Reply-To: <20220707164313.2697033-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2022 13:07:03 -0400
Message-ID: 
 <CAMKF1soLdhA3CbLqJ=qhiYinnBW+Esn1gkTy_EJ3Xa627T5+wQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: remove open-posix-testsuite build logs
To: Ross Burton <ross.burton@arm.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 17:07:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167793

On Thu, Jul 7, 2022 at 12:43 PM Ross Burton <ross.burton@arm.com> wrote:
>
> We don't need to package the open-posix-testsuite build logs. Typically
> these are just lines of "SUCCESS" but sometimes there will be compile
> warnings, which will include build paths.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-extended/ltp/ltp_20220527.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220527.bb
> index b3ef8f59105..e3abfd01e1c 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -79,6 +79,9 @@ do_install(){
>      # The controllers memcg_stree test seems to cause us hangs and takes 900s
>      # (maybe we expect more regular output?), anyhow, skip it
>      sed -e '/^memcg_stress/d' -i ${D}${prefix}/runtest/controllers
> +
> +    # We don't need to ship the compile logs that open_posix_testsuite writes
> +    rm -f ${D}${prefix}/testcases/open_posix_testsuite/logfile.*
>  }
>

i was seeing build QA warnings this should help. Is this the only file
though I wonder since i saw a bunch of messages
>  RDEPENDS:${PN} = "\
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167792): https://lists.openembedded.org/g/openembedded-core/message/167792
> Mute This Topic: https://lists.openembedded.org/mt/92232580/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

