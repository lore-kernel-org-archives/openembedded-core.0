Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D624E6F091
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 21:20:15 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.5160.1730496012096304371
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 14:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0diTCjv;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a1b71d7ffso370006266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 14:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730496010; x=1731100810; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5JOjvOArmazYE+v8qmjInU9QG+gZSXAXBaST0Y3CQ=;
        b=S0diTCjvZLO8Hv8JNBz1ByGiXpIRgiCle9NqRM3kTsFxVdAxxfbXwOz74Kqk0SkPbq
         AJnsJoV4J2U+F33u6b0bNK0HK2jiAbTwpiCbjm9nxGjIZqGL31KjjOatrDbndptLLHe9
         IDL7iXls7S6IyRAwnHmYn9wfdod1j3M+twVP/7k38BGmivHwWBTuZc12KAjLr2DVwpGA
         BQrINvedn1Q63HCPnwL/AxTZ9KeF8syDcEjOj6Y20fNANqTkftayUetH68aQGkbBTKXl
         yBhTaMyuTwG3X57hfJELbw3k6qxUgmiydfF2vAa0H2U9RUCUEtxy6iWmnwjgb3Q1FpyD
         pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730496010; x=1731100810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sW5JOjvOArmazYE+v8qmjInU9QG+gZSXAXBaST0Y3CQ=;
        b=GwdAtXUkjpUU44GO+xnYWz8qXNbFLwdbmjg+ab5lrYpI4HlrhxbJOKJhe9oHoczRZp
         l5ebVaTZb2a1MvUYGgDX5caQMC12ycdVWiugi/ils+mgZNiuTEvHDNeRhrQzJubya9dM
         W+PS0Ga9Gy48F99lwJ2y2MYExe0GXTESdY9tqpILlxTb025E6BAWz+NxoBnTp5kLdvry
         cZID6IV55O7uxjcihp/Mgkfr4BZvAKBYC9cx+Ckcb0sv+68aLMsOo3DYLBspBzeSgwYU
         MIxYPJ4haPjen158TNnGQmLGszP12P54P9ec+K8m+ALEMIczQll5Tb6Gn5gKWUmhhwpb
         Ed9A==
X-Gm-Message-State: AOJu0Yx45Yw9Mmi5yPncmVUoC2GGEg41HO2qqQGOw63jm7CarwssaR+v
	TJQEejzKRpInrdJhHzlPvBdFImknrfjpo661GuHioCRisBSvcTiearsiPF1CbX20ulJlhNuE1aX
	wqDHPDSI6EQm8WghMa3ThrAgDEHM=
X-Google-Smtp-Source: AGHT+IEQICQ75myXMBddY5vxN6RvDWqkXFqr8s8mecfIOsytjUFu3wfdSaxXKUUGiXLwhFUyqUHoAAxfCJZXjxc3BW8=
X-Received: by 2002:a17:907:1c88:b0:a99:f92a:7a66 with SMTP id
 a640c23a62f3a-a9e3a61dee0mr1083894966b.30.1730496010255; Fri, 01 Nov 2024
 14:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20241027170726.3487765-1-quic_vpuar@quicinc.com>
In-Reply-To: <20241027170726.3487765-1-quic_vpuar@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 1 Nov 2024 23:19:52 +0200
Message-ID: <CALT56yMm_mq2aHRTsMbfVg=fzMoqeeCBzCyq-qMxXa+D9waYRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: Add qcom-adreno-a663 package
To: quic_vpuar@quicinc.com, nicolas.dechesne@oss.qualcomm.com, 
	rsalveti@quicinc.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 21:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206636

On Sun, 27 Oct 2024 at 19:08, Vivek Puar via lists.openembedded.org
<quic_vpuar=quicinc.com@lists.openembedded.org> wrote:
>
> Adding new package containing firmware for Adreno
> A633 GPU
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  .../linux-firmware/linux-firmware_20241017.bb              | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index 60d24efca4..9dcb0313a9 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -403,8 +403,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
>               ${PN}-qcom-vpu \
>               ${PN}-qcom-adreno-a2xx ${PN}-qcom-adreno-a3xx ${PN}-qcom-adreno-a4xx ${PN}-qcom-adreno-a530 \
> -             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a702 \
> -             ${PN}-qcom-adreno-g750 \
> +             ${PN}-qcom-adreno-a630 ${PN}-qcom-adreno-a650 ${PN}-qcom-adreno-a660 ${PN}-qcom-adreno-a663 \
> +             ${PN}-qcom-adreno-a702 ${PN}-qcom-adreno-g750 \
>               ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>               ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
> @@ -1431,6 +1431,7 @@ LICENSE:${PN}-qcom-adreno-a530 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-adreno-a630 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-adreno-a650 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-adreno-a660 = "Firmware-qcom"
> +LICENSE:${PN}-qcom-adreno-a663 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-adreno-a702 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-adreno-g750 = "Firmware-qcom"
>  LICENSE:${PN}-qcom-apq8016-modem = "Firmware-qcom"
> @@ -1485,6 +1486,7 @@ FILES:${PN}-qcom-adreno-a530 = "${nonarch_base_libdir}/firmware/qcom/a530*.fw*"
>  FILES:${PN}-qcom-adreno-a630 = "${nonarch_base_libdir}/firmware/qcom/a630*.*"
>  FILES:${PN}-qcom-adreno-a650 = "${nonarch_base_libdir}/firmware/qcom/a650*.*"
>  FILES:${PN}-qcom-adreno-a660 = "${nonarch_base_libdir}/firmware/qcom/a660*.* ${nonarch_base_libdir}/firmware/qcom/qcm6490/a660_zap.mbn*"
> +FILES:${PN}-qcom-adreno-a663 = "${nonarch_base_libdir}/firmware/qcom/a663*.* ${nonarch_base_libdir}/firmware/qcom/sa8775p/a663_zap.mbn*"

Same issue, platform-specific firmware in a generic package.

>  FILES:${PN}-qcom-adreno-a702 = "${nonarch_base_libdir}/firmware/qcom/a702*.*"
>  FILES:${PN}-qcom-adreno-g750 = "${nonarch_base_libdir}/firmware/qcom/gen70500_*.*"
>  FILES:${PN}-qcom-apq8016-modem = "${nonarch_base_libdir}/firmware/qcom/apq8016/mba.mbn* ${nonarch_base_libdir}/firmware/qcom/apq8016/modem.mbn*"
> @@ -1535,6 +1537,7 @@ RDEPENDS:${PN}-qcom-adreno-a530 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a630 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a650 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a660 = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-adreno-a663 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-a702 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-adreno-g750 = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-apq8016-modem = "${PN}-qcom-license"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206408): https://lists.openembedded.org/g/openembedded-core/message/206408
> Mute This Topic: https://lists.openembedded.org/mt/109242791/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

