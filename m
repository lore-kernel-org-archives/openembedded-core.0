Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2C4C54735
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:36:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.75486.1724758571636351795
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:36:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yanb+QYQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5befe420fc2so6685159a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 04:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724758570; x=1725363370; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lb9N2uqXXjOpNMr5Hk+dwG0iYrbmVHWHIhVFGQ1NdG8=;
        b=Yanb+QYQiUyiadWLLkFscqtSrrIyA6ALZzNomdf0N58wtnipfQzLYj1Q/aSg890HLn
         FOWh3ry99RTSCiuJnQDVog56Pyb502UgC6iE/ZG6hAq8gmE+/oSofUb1zs9RwdPRThPT
         R+xvgK63OuXJ/uGaux8oMYvC+SFkxAgBN3R46jMRJxbBocZgwcLe8D/P5kqyT/xezL3r
         uzJ88HdlX6dNx8e52VeP3TqRtw9QKGa9BkUjmHXlZLxba3EuFwB/BDMQnTVM+RFvUjN2
         P484MpDNOAi8rX2m1pmnRpsgOWvlUgik9EzWc9LODvikq8mjl5hnwNj4LknApgnQeP4q
         sK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758570; x=1725363370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb9N2uqXXjOpNMr5Hk+dwG0iYrbmVHWHIhVFGQ1NdG8=;
        b=eX6N7u764KtMUJLlMsCyeGMltJkJ6/S/Gzd7MAYhbo4Ogw+KKwqxDTnsCPIQ9icqer
         IcbCNoVxVYPQffl7BF+7GlxnvWrpqkWauFbsJG+zHaq9rszLekNyR9N8UZU4Jtu5l4tu
         aoZU0yBVurPd5H9NKvIGzBeIIaAWtynsYadobn5B4bm94IAvCWqaqrZgY7YGz2piLVmz
         ny8GyEGJ0MA7S4CTdNmAZ6P9exiOkQ+mmSe6uuP1oDKPT6dtZtJhmula78y/nZOEAtOv
         L1AHUQJhz5DNpBU5SvOtl+AFA9gpDoqUFCuqpKGJl/mI1AZj/EtHPOCzTW+2s35VBi8M
         pOBw==
X-Gm-Message-State: AOJu0YxKYT4QkLpwu9Kdu5p5sa9vN3+Csyyzgsk8wupm5E8zE/Hy+cmI
	eYzK4+sEZ7nd5SIitx5vVjq6t1rqCmYGl+4zIRsW5GwnGmumTsg5MNCmVIeBQYE3aH75YEcHmPw
	qfytv4th3v2iCGQDlnkjTtFfFj10=
X-Google-Smtp-Source: AGHT+IExEOTxjOao/dJRstBnL2QP87RjP+gH/sd1npai17elbl+qO5jWxfifG+ml+K4K6giQGr95Cxt4RAgvVkSSzVg=
X-Received: by 2002:a05:6402:1ecc:b0:5be:fa43:8017 with SMTP id
 4fb4d7f45d1cf-5c08916617emr9943596a12.16.1724758569174; Tue, 27 Aug 2024
 04:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240827100930.127469-1-dmitry.baryshkov@linaro.org> <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de>
In-Reply-To: <e93464b1-51e2-4058-afa5-3811975de62e@cherry.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 27 Aug 2024 14:35:57 +0300
Message-ID: <CALT56yP2tgC8RoW2UzzMhTW8m48-s-6icgGSRdgVJdwDrxPrvA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] linux-firmware: package qcom-vpu firmware
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:36:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203832

Hi Quentin,

Excuse me, I missed your review before sending v2.

On Tue, 27 Aug 2024 at 13:25, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 8/27/24 12:09 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > Release 20240811 has restructured the locations of Qualcomm VPU
> > firmware. Follow those changes and implement a single
> > linux-firmware-qcom-vpu package holding all VPU firmware files. Use
> > RPROVIDES to provide previously defined names.
> >
>
> It'd be nice to hint at the commits in linux-firmware that do this reorg
> for reference?

Ack

>
> It's also not necessarily required to merge those together as we could
> probably still have two different packages to avoid bringing in files we
> don't need (I assume the same SoC doesn't have both a VPU 1.0 and a VPU
> 2.0 ?).

First of all, the original naming seems to be incorrect as
demonstrated by the new file names:

 qcom/{vpu-1.0/venus.mbn => vpu/vpu20_p4.mbn}    | Bin
 qcom/{vpu-2.0/venus.mbn => vpu/vpu20_p1.mbn}    | Bin
qcom/{vpu-3.0/vpu30_4v.mbn => vpu/vpu30_p4.mbn} | Bin

It is possible to split one file per package and let users pick up
packages one by one, but granted that the whole size of the directory
(4 different firmware files) is 4.3 MiB, it doesn't seem to make sense
to me.

> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v1:
> >   - Dropped unrelated (audio topology) change.
> >
> > ---
> >   .../linux-firmware/linux-firmware_20240811.bb    | 16 ++++++++++------
> >   1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> > index b6fb0f9a4560..d55ac9267d8f 100644
> > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240811.bb
> > @@ -382,7 +382,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
> >                ${PN}-qed \
> >                ${PN}-qcom-license ${PN}-qcom-yamato-license \
> >                ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
> > -             ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
> > +             ${PN}-qcom-vpu \
> >                ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
> >                ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
> >                ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
> > @@ -1368,8 +1368,7 @@ LICENSE:${PN}-qcom-venus-4.2 = "Firmware-qcom"
> >   LICENSE:${PN}-qcom-venus-5.2 = "Firmware-qcom"
> >   LICENSE:${PN}-qcom-venus-5.4 = "Firmware-qcom"
> >   LICENSE:${PN}-qcom-venus-6.0 = "Firmware-qcom"
> > -LICENSE:${PN}-qcom-vpu-1.0 = "Firmware-qcom"
> > -LICENSE:${PN}-qcom-vpu-2.0 = "Firmware-qcom"
> > +LICENSE:${PN}-qcom-vpu = "Firmware-qcom"
> >   LICENSE:${PN}-qcom-adreno-a2xx = "Firmware-qcom Firmware-qcom-yamato"
> >   LICENSE:${PN}-qcom-adreno-a3xx = "Firmware-qcom"
> >   LICENSE:${PN}-qcom-adreno-a4xx = "Firmware-qcom"
> > @@ -1413,7 +1412,11 @@ FILES:${PN}-qcom-venus-4.2 = "${nonarch_base_libdir}/firmware/qcom/venus-4.2/*"
> >   FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
> >   FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
> >   FILES:${PN}-qcom-venus-6.0 = "${nonarch_base_libdir}/firmware/qcom/venus-6.0/*"
> > -FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
> > +FILES:${PN}-qcom-vpu = " \
> > +    ${nonarch_base_libdir}/firmware/qcom/vpu/* \
> > +    ${nonarch_base_libdir}/firmware/qcom/vpu-1.0/* \
> > +    ${nonarch_base_libdir}/firmware/qcom/vpu-2.0/* \
> > +"
> >   FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
>
> If we're deleting qcom-vpu-* PACKAGES, then you missed this one line to
> delete.

Ack

>
> >   FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw ${nonarch_base_libdir}/firmware/qcom/yamato_*.fw"
> >   FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
> > @@ -1458,8 +1461,7 @@ RDEPENDS:${PN}-qcom-venus-4.2 = "${PN}-qcom-license"
> >   RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
> >   RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
> >   RDEPENDS:${PN}-qcom-venus-6.0 = "${PN}-qcom-license"
> > -RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
> > -RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
> > +RDEPENDS:${PN}-qcom-vpu = "${PN}-qcom-license"
> >   RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license ${PN}-qcom-yamato-license"
> >   RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
> >   RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
> > @@ -1503,6 +1505,8 @@ RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-adreno = "${PN}-qcom-sc8280xp-lenovo
> >   RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-compute = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
> >   RRECOMMENDS:${PN}-qcom-sc8280xp-lenovo-x13s-sensors = "${PN}-qcom-sc8280xp-lenovo-x13s-compat"
> >
> > +RPROVIDES:${PN}-qcom-vpu = "${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0"
> > +
>
> I'm of the opinion this does not make sense in master branch, backward
> compatibility is not required in master branch so we can just not have
> this line and let people update their dependencies if needed. I'll let
> maintainers decide here what's best :)

Yeah, let's drop it unless maintainers disagree.

-- 
With best wishes
Dmitry

