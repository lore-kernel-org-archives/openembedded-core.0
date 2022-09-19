Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D557ECAAD3
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 21:23:43 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web12.4632.1663622619136306875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 14:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DQPPYLX5;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1278624b7c4so1344681fac.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 14:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=bc86yxqMY7AhimolJR9kyESuwd+XVYgJ7uLFe+GN4Bg=;
        b=DQPPYLX5tHEtnqYJzAVDxhABbBHLTfuAzv1CM5HPhtAiPurId56eBJRtx8kSEsj1a7
         wVfyt96x4rFAwJFKRcq7oB80xkEE1cRBnZvdPhQv/Hpla+nbkSAxKzloCmCmFP7Uyl7r
         dcC0TCvCTZbwOY3wM9Rb3LASylcyD2z/PCgDHydNUDs/ONWwMhXL8eGDPe/jwo0vjS7y
         d8IFwUPkcsGMVwBSNbwunr3w67zBmphFRbcDKmuM0n9XcCGJvNMoLxpv24ECDConL9WQ
         isj+svTspHJq08x11sCG+fGgNHP/Ru23BSF8B9zLWCEU268Nh9czcHTaHdFe1m4Z3ayT
         Nltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=bc86yxqMY7AhimolJR9kyESuwd+XVYgJ7uLFe+GN4Bg=;
        b=pvh/+DK1k9l5Egw3UDkCqP9eDDaYwawmIqOl6YnO+sWAe68hbYsdwJ94z12h6sgXJp
         aLm8hUP3FR7HiApfb72mEVga8aFVKhhTOVNB+mRQEz9tKFgUV8iY3MviSpYc9C3SFT9w
         6mXAqY2JImgqb0z2NLmyDI7ntYoRL9d5+PU2AMwPCZnC4fugzBI4AElfdHk3p1F98JS+
         s6y6hU5dkPb5wdKNfIY+qA3NSc2+4De6+StHyPbCz0lV44gFvia/yIPD0M1RypBaiMPD
         N3PLPD3UxsgzcPXqr8wrvuFeVD7rH1JObAVRct+rntEbW/VPzIH0Zl2JdN4u7QOzLI2l
         T7hw==
X-Gm-Message-State: ACrzQf36Uc+DBr4OaAdjVjoTE9KHVIpOOeb1B2ErfmHy0XIe2SQ2WHF+
	ATMj30G7u7+qC/9V0+hD8ZTlZsKvns9uC942LSI=
X-Google-Smtp-Source: 
 AMsMyM7f1pGma36wzftI+dY4cyfYfiRdFgtHlT7p+wEqNGGi3YFEC2RKrUmYtzZK6TQ5XUN3BM76wuQ1f/3RqKmfNoo=
X-Received: by 2002:a05:6870:9107:b0:12c:e448:c5fd with SMTP id
 o7-20020a056870910700b0012ce448c5fdmr96134oae.55.1663622618427; Mon, 19 Sep
 2022 14:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1663597409.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1663597409.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Sep 2022 17:23:12 -0400
Message-ID: 
 <CAMKF1sp39gGsjvpPh0Wa8DOYYJja=Tb9SrwhzWneHoazGO32PQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/9] kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 21:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170882

On Mon, Sep 19, 2022 at 10:28 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> Here's the next set of -stable updates to the active reference kernels.
> I also have updates back to 5.4 that I'll send to the various stable
> branches shortly.
>
> I also have a couple of kern-tools fixes. One to solve a problem reported
> on the list about some directory structures (typically created from KAS)
> to break the meta-data phase of the kernel build. I've fixed that issue,
> then fixed the other regressions that fix caused, and have everything
> passing sanity. There shouldn't be any fallout, but I'll be keeping a
> close eye on things.
>
> I also have Khem's MDIO configuration change in the queue, along with
> a previously hidden kern-tools feature that allows it to not warn if
> something is 'enabled' (y or m).

Cool. Thanks for keeping this in. I am not able to do much this week
due to travel, but I will try to test it out nevertheless.

>
> Cheers,
>
> Bruce
>
> The following changes since commit fa86bfd3617b54dbf7e44093ae0e6f35538bdabc:
>
>   diffoscope: upgrade 220 -> 221 (2022-09-17 07:47:08 +0100)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (8):
>   linux-yocto/5.15: update to v5.15.63
>   linux-yocto/5.19: update to v5.19.5
>   linux-yocto/5.19: update to v5.19.7
>   linux-yocto/5.15: update to v5.15.65
>   kern-tools: fix queue processing in relative TOPDIR configurations
>   kern-tools: allow 'y' or 'm' to avoid config audit warnings
>   linux-yocto/5.19: update to v5.19.9
>   linux-yocto/5.15: update to v5.15.68
>
> Khem Raj (1):
>   linux-yocto: Enable mdio for qemu
>
>  .../kern-tools/kern-tools-native_git.bb       |  2 +-
>  .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
>  .../linux/linux-yocto-rt_5.19.bb              |  6 ++--
>  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
>  .../linux/linux-yocto-tiny_5.19.bb            |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++++++---------
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 28 +++++++++----------
>  7 files changed, 40 insertions(+), 40 deletions(-)
>
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170863): https://lists.openembedded.org/g/openembedded-core/message/170863
> Mute This Topic: https://lists.openembedded.org/mt/93782003/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

