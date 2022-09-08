Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C29FC54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 14:09:11 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.6077.1662646150849006720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 07:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m3sbp6w2;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id l65so18041953pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=O4/PkbG36D7gf9IO26CtJnquBQRrXrDdWnfHwBL6J+o=;
        b=m3sbp6w2Tji3/RD4XstXocnDTTigheP0hJoLfZ7GBN5XjPSxLBVPjhZPTGyk1NTCT4
         /4XgsVUBSPKyaPwmI5ZampI8C02vdeXo+OLN8NE27A1UlqutvIzH4D2cxyLRoI3k2+UG
         lrMLdpqB08Eofqd6f/j8SP4OEvu7kQ4xAcQwk+Fw0HK0sfVHbz2GTzkV5YY6Ab+YhVBA
         LAGVpmK6889Bv26raHC3IN8hEGxCPlI+VJT1vWCZ28G7o130qlCUNXa0OIYtZ3dCmp0m
         U+J1IMA2JND6gKgwvMarmol9CNtTr7xNidTEoOOJTrTlyaD3Q1FUVfy7K/lvWQKBfJM2
         OYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=O4/PkbG36D7gf9IO26CtJnquBQRrXrDdWnfHwBL6J+o=;
        b=4PglOoJh4sUXgS68cdFWnlm2xrD5QwsZHzHXwcv1VpVAAzq005zHAwNYDFJxEHuPzh
         Tn1V3MKfRu8w1eavK4xq5zkbM+VvW8xnYGcLUVY2KPZWOcykJbrIDsc0g4kk3Cx6U+AO
         Pkm9lHgWDJ3g5F2lCz4GlxtAwdWfi1pfyPjs+hRPFHBsfAzm5VOVgX8qAzm5p/agRrRx
         qNLDftuKdIFA4PsPU581Uw5WAQIgfzt+fsDn2EOglZy4w/JD1+nauPQm8dDrF+BT3enw
         NvtDVwyd8NMSz7fXRrzy/q1w/BlGIkcvlsA+ZpgmAjH5H41nYm+0X5E9QGeYMwZV/z1L
         8fXQ==
X-Gm-Message-State: ACgBeo25wCKbCcrFguxXwJzEFlGffS/JYGOWLHz+B4pWHXKWkSrj05OW
	Jp7X6U2rr8hJey19WSgo7RHzsJ4z4ABm4JEaUw4=
X-Google-Smtp-Source: 
 AA6agR5MWkS8PFRUCpL1KoNID2wVKEWRD2/D8NNu0Ix408PQ1dHYOdvGZi3qDpBq1Ch5z/ckBOs1HN2Joe+h4qnZ+Sw=
X-Received: by 2002:a05:6a00:e8a:b0:535:cc5c:3d87 with SMTP id
 bo10-20020a056a000e8a00b00535cc5c3d87mr9345269pfb.24.1662646150255; Thu, 08
 Sep 2022 07:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220907220535.3017588-1-raj.khem@gmail.com>
 <YxnypGsRgsp6Uaxt@mail.local>
In-Reply-To: <YxnypGsRgsp6Uaxt@mail.local>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Sep 2022 10:08:58 -0400
Message-ID: 
 <CADkTA4P4MKW6XG1Sdeac-NQHuk_mMWDPuhjXj4HN-wnOw4z0rw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: Enable mdio for qemu
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 14:09:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170461

On Thu, Sep 8, 2022 at 9:48 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi,
>
> This caused many failures like this one:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5847/steps/11/logs/stdio
>

Technically not an error, only an error in the eyes of the stricter testing.

Khem: Let me queue the patch here, and I'll add a mask for that
warning, since in this case =y is as good as =m

Bruce

> On 07/09/2022 15:05:35-0700, Khem Raj wrote:
> > There are package like mdio-netlink in meta-oe which need this feature
> > to be available, it has started to fail with 5.19
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto_5.19.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.19.bb b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > index 0ff28aa952..e96395d1bb 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.19.bb
> > @@ -56,7 +56,7 @@ COMPATIBLE_MACHINE = "^(qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemuppc64|qe
> >  # Functionality flags
> >  KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
> >  KERNEL_FEATURES:append = " ${KERNEL_EXTRA_FEATURES}"
> > -KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc"
> > +KERNEL_FEATURES:append:qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc cfg/net/mdio.scc"
> >  KERNEL_FEATURES:append:qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >  KERNEL_FEATURES:append:qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
> >  KERNEL_FEATURES:append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
> > --
> > 2.37.3
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170431): https://lists.openembedded.org/g/openembedded-core/message/170431
> > Mute This Topic: https://lists.openembedded.org/mt/93535950/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

