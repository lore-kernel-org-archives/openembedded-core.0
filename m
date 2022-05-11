Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365F8C433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 17:47:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.47.1652291256894657079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 10:47:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NUXfqNxp;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id n10so2623318qvi.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 10:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4FCIDFVL0gHzvS4Isc0KxLnowAgWN23nthn1iHCW2II=;
        b=NUXfqNxpuhoKICCb1dAr0BEzdlmKqzHTK/5Scy5CKJdGISjxL0fH8RLkdKEVhhcZy9
         N5Z4J0RLDrze0wFp/ZyTJMpeeO5B7h0bSDzGAjD6rkw3CLFfvbMr9MWX3oDR3SHnoEAa
         nTX+UsqMQjRgvoThM/RmzzXFHYcx7WpgRpEfZGyqnZvsxV7CVZKfAlx5d/kKUIBGlnsC
         G1EYJQuyUQt+yqCS3wZOEgevvl85uXwadWraVpsuUlQajoLqc9bYtBSoS/llxZ4Ph8Tl
         f6EqNRdrmHZbnTIYzZFe1ucLAPTb2txr4yEJNsXH/rdojmKNDgg0m9TM2NOIhs8EkaWm
         Be4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4FCIDFVL0gHzvS4Isc0KxLnowAgWN23nthn1iHCW2II=;
        b=eFhqTt7Ghc5T3tArbTlNkbj7ZXrF889lfNeLK9XYJxUbXNNJzAVvJLwVB/ed+pZ+pR
         UmBkqsj1i7fqPkfLp1wcuZO1gOARxPstkJdsoibQrkv8caK8NZ4owXmsGXVLVhedDj5R
         IshLMjWiIYOr1/DsyOiBRbt/x+rnZAET9i9q33wI76v4OTHyo4N1whQePJspJXnHFK1F
         RMb11Nxfd1/DC+eRkKjBBDEQxt6a9IYKP7NUXGx6Fk3W4eUd0Zms9VJavQBl9iB6mEWT
         4K8EgGqDWXmjthzwS5tHOvI3Hh2MUKB4BA/nxAv7RfExAwNmO02kzP7jY6Q3laD+ruBU
         HYbA==
X-Gm-Message-State: AOAM533G9cOX0JrfPuUIPYxBXMy/bpuxsLr5NZ4nbRbXpcukEM4WSMMY
	hxf+rF/OLQw2bGLv/xVPDE/4nufZiONGJqWBKRc=
X-Google-Smtp-Source: 
 ABdhPJzLjxCpkcAw6wWZE80GycXhCZxIpV0GUWVKj2erhSPiqnQljXaKQE38d4PyQ3O/5jHqPNgDPCD2CmTQUNrTt/0=
X-Received: by 2002:a05:6214:e6b:b0:45b:1ee:86ec with SMTP id
 jz11-20020a0562140e6b00b0045b01ee86ecmr16793664qvb.36.1652291255820; Wed, 11
 May 2022 10:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220510153942.2436401-1-dmitry.baryshkov@linaro.org>
 <20220510153942.2436401-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220510153942.2436401-2-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 May 2022 10:47:10 -0700
Message-ID: 
 <CAMKF1so5P3PaH+XJxY_-kB-pAAxYR4T8ZuDtCj=d913EwdOgrg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] linux-firmware: package new Qualcomm
 firmware
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 17:47:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165505

I am seeing these errors seems to be related to this changeset

https://errors.yoctoproject.org/Errors/Details/656617/
https://errors.yoctoproject.org/Errors/Details/656615/
https://errors.yoctoproject.org/Errors/Details/656616/
https://errors.yoctoproject.org/Errors/Details/656618/

On Tue, May 10, 2022 at 8:39 AM Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
>
> Create separate packages with firmware files for APQ8096 SoC and for
> Adreno 2xx/4xx. Include A330 firmware into the 3xx package.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../linux-firmware/linux-firmware_20220509.bb       | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
> index 7d238e661899..6e328e57260a 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
> @@ -307,8 +307,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
>               ${PN}-qcom-license \
>               ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 \
>               ${PN}-qcom-vpu-1.0 ${PN}-qcom-vpu-2.0 \
> -             ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a530 \
> +             ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
>               ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 \
> +             ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>               ${PN}-qcom-sdm845-audio ${PN}-qcom-sdm845-compute ${PN}-qcom-sdm845-modem \
>               ${PN}-qcom-sm8250-audio ${PN}-qcom-sm8250-compute \
>               ${PN}-amlogic-vdec-license ${PN}-amlogic-vdec \
> @@ -965,11 +966,15 @@ FILES:${PN}-qcom-venus-5.2 = "${nonarch_base_libdir}/firmware/qcom/venus-5.2/*"
>  FILES:${PN}-qcom-venus-5.4 = "${nonarch_base_libdir}/firmware/qcom/venus-5.4/*"
>  FILES:${PN}-qcom-vpu-1.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-1.0/*"
>  FILES:${PN}-qcom-vpu-2.0 = "${nonarch_base_libdir}/firmware/qcom/vpu-2.0/*"
> -FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a300_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
> +FILES:${PN}-qcom-adreno-a2xx = "${nonarch_base_libdir}/firmware/qcom/leia_*.fw"
> +FILES:${PN}-qcom-adreno-a3xx = "${nonarch_base_libdir}/firmware/qcom/a3*_*.fw ${nonarch_base_libdir}/firmware/a300_*.fw"
> +FILES:${PN}-qcom-adreno-a4xx = "${nonarch_base_libdir}/firmware/qcom/a4*_*.fw"
>  FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.*"
>  FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/a630*.*"
>  FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.* ${nonarch_base_libdir}/firmware/qcom/sm8250/a650*.*"
>  FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.*"
> +FILES:${PN}-qcom-apq8096-audio = "${nonarch_base_libdir}/firmware/qcom/apq8096/adsp*.*"
> +FILES:${PN}-qcom-apq8096-modem = "${nonarch_base_libdir}/firmware/qcom/apq8096/mba.mbn ${nonarch_base_libdir}/firmware/qcom/apq8096/modem*.* ${nonarch_base_libdir}/firmware/qcom/apq8096/wlanmdsp.mbn"
>  FILES:${PN}-qcom-sdm845-audio = "${nonarch_base_libdir}/firmware/qcom/sdm845/adsp*.*"
>  FILES:${PN}-qcom-sdm845-compute = "${nonarch_base_libdir}/firmware/qcom/sdm845/cdsp*.*"
>  FILES:${PN}-qcom-sdm845-modem = "${nonarch_base_libdir}/firmware/qcom/sdm845/mba.mbn ${nonarch_base_libdir}/firmware/qcom/sdm845/modem*.* ${nonarch_base_libdir}/firmware/qcom/sdm845/wlanmdsp.mbn"
> @@ -981,11 +986,15 @@ RDEPENDS:${PN}-qcom-venus-5.2 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-venus-5.4 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-vpu-1.0 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-vpu-2.0 = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-adreno-a2xx = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a3xx = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-adreno-a4xx = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-apq8096-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-apq8096-modem = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-sdm845-modem = "${PN}-qcom-license"
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165461): https://lists.openembedded.org/g/openembedded-core/message/165461
> Mute This Topic: https://lists.openembedded.org/mt/91015911/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

