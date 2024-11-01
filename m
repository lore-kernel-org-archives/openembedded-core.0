Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0BAE6F08C
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 21:18:15 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.5100.1730495889282410709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 14:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g03xYGEN;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9a16b310f5so352248566b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730495888; x=1731100688; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3wyjc0SXoOpIPKmUSASklqCSo0KGBNppf8fGgw88WOg=;
        b=g03xYGENFhGO4ouMVYNCz4BYZ+bh6fj/kXDn/Fdxc1EHBH149HNkIOZhQn05MAm9KI
         Nmh1M7qF0QSRHoWuNbbRuH/CVEHxK8WypBwvAdNqTrp2RIDBzSUVH7gkpwo9CP5ND7yS
         hsmJVnn+mo4mvLBnXIYSDXTWixjw0radZGYcAi4utvDlEOsPQXbri0vSOi1NH9qgcN9F
         RuTYmnGE+jiYablxvp+WAFQ8Ycuf4Oqlxwl8gba0GFgQCVlHi+VAcanDPYPuH9XRg9qx
         efA8OlXwDmmTLixnB+OQ797DClFunSV0E4J0wY86i8EeGCHX9qSbtkZ+6RLwE2An+sso
         IQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730495888; x=1731100688;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3wyjc0SXoOpIPKmUSASklqCSo0KGBNppf8fGgw88WOg=;
        b=EKMSSQHysn5JhmKkGuW2RyAdD+XLiIDIPTqb7lEuED4Ar5mN5H6JL8nR6qiQlBwzer
         HMHYUZHRd4JZQO7a+1v6nI+dvNS4OmOiDmqZsdniWSy33xv2OVyfC4O+wBpd+Y4bdLMp
         40lvJZgn71f9nobCIEVNA2FTDdRcNpYyg3YY7Q/h3CFyfk5fdmTlyQDQyPwpV12FCz3Z
         jmdJ6NHpsLoRVdW68klKZ+4UEY71AwnHfjQxEV0YaVb5bomA6t7V7vY/LJ0qyDVQ9W3s
         cXNDAPWvtGdZ+jDnTaxarTBRh7CoQ3TzdUyJYy6UYfeQjxvF74toKhnrzoMGwCb50avB
         K0iw==
X-Gm-Message-State: AOJu0Yx+QdIu06s0FX4i8eik4NuYies/OjAjuD83hBkfb4U2gADqH+kG
	WLOokMy8GhILcccSzw7NyKPLOiOgZqQlRQUaALRDNJj2MWk3Phe7XP9jc6UvrtttPWYnPKPLF8C
	u4GNY5kEWXqwK3VQdGZZGQlttQVY5sK6F
X-Google-Smtp-Source: AGHT+IH3hDm0h8qNCQTfYC1bOnlD8pBJl6PeFvfzm4IhmKDrzVa8XM9339wOjORiylCnCFaQjBTcYdtqOb8Qb0FBWCo=
X-Received: by 2002:a17:907:3e82:b0:a9a:6bc2:c0a3 with SMTP id
 a640c23a62f3a-a9e508ac369mr704188566b.7.1730495887420; Fri, 01 Nov 2024
 14:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20241022172149.539237-1-quic_vpuar@quicinc.com>
In-Reply-To: <20241022172149.539237-1-quic_vpuar@quicinc.com>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Fri, 1 Nov 2024 23:17:55 +0200
Message-ID: <CALT56yN1KKshXVGUOJXd=7uk=kXedQ4gQaD0nwvv8ScBf2b6bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-firmware: Add qcom-qcm6490-{audio,compute}
 firmware packages
To: quic_vpuar@quicinc.com, nicolas.dechesne@oss.qualcomm.com, 
	rsalveti@quicinc.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 21:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206635

On Tue, 22 Oct 2024 at 20:22, Vivek Puar via lists.openembedded.org
<quic_vpuar=quicinc.com@lists.openembedded.org> wrote:
>
> linux-firmware-qcom-qcm6490-{audio,compute} contains
> ADSP and CDSP firmware for qcom QCM6490 variant
>
> Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
> ---
>  .../linux-firmware/linux-firmware_20241017.bb          | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> index d18e7414db..60d24efca4 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
> @@ -408,8 +408,8 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
>               ${PN}-qcom-apq8016-modem ${PN}-qcom-apq8016-wifi \
>               ${PN}-qcom-apq8096-adreno ${PN}-qcom-apq8096-audio ${PN}-qcom-apq8096-modem \
>               ${PN}-qcom-qcm2290-adreno ${PN}-qcom-qcm2290-audio ${PN}-qcom-qcm2290-modem \
> -             ${PN}-qcom-qrb4210-adreno ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute \
> -             ${PN}-qcom-qrb4210-modem \
> +             ${PN}-qcom-qcm6490-audio ${PN}-qcom-qcm6490-compute ${PN}-qcom-qrb4210-adreno \
> +             ${PN}-qcom-qrb4210-audio ${PN}-qcom-qrb4210-compute ${PN}-qcom-qrb4210-modem \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-compat \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-audio \
>               ${PN}-qcom-sc8280xp-lenovo-x13s-adreno \
> @@ -1442,6 +1442,8 @@ LICENSE:${PN}-qcom-qcm2290-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm2290-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm2290-modem = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qcm2290-wifi = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-audio = "Firmware-qcom"
> +LICENSE:${PN}-qcom-qcm6490-compute  = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-adreno = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-audio = "Firmware-qcom"
>  LICENSE:${PN}-qcom-qrb4210-compute  = "Firmware-qcom"
> @@ -1494,6 +1496,8 @@ FILES:${PN}-qcom-qcm2290-adreno = "${nonarch_base_libdir}/firmware/qcom/qcm2290/
>  FILES:${PN}-qcom-qcm2290-audio = "${nonarch_base_libdir}/firmware/qcom/qcm2290/adsp*.*"
>  FILES:${PN}-qcom-qcm2290-modem = "${nonarch_base_libdir}/firmware/qcom/qcm2290/modem*.*"
>  FILES:${PN}-qcom-qcm2290-wifi = "${nonarch_base_libdir}/firmware/qcom/qcm2290/wlanmdsp.mbn* ${nonarch_base_libdir}/firmware/ath10k/WCN3990/hw1.0/qcm2290/*"
> +FILES:${PN}-qcom-qcm6490-audio = "${nonarch_base_libdir}/firmware/qcom/qcm6490/adsp*.*"

You've missed battmgr.jsn.

> +FILES:${PN}-qcom-qcm6490-compute = "${nonarch_base_libdir}/firmware/qcom/qcm6490/cdsp*.*"
>  FILES:${PN}-qcom-qrb4210-adreno = "${nonarch_base_libdir}/firmware/qcom/qrb4210/a610_zap.mbn*"
>  FILES:${PN}-qcom-qrb4210-audio = "${nonarch_base_libdir}/firmware/qcom/qrb4210/adsp*.*"
>  FILES:${PN}-qcom-qrb4210-compute = "${nonarch_base_libdir}/firmware/qcom/qrb4210/cdsp*.*"
> @@ -1542,6 +1546,8 @@ RDEPENDS:${PN}-qcom-qcm2290-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm2290-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm2290-modem = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qcm2290-wifi = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcm6490-audio = "${PN}-qcom-license"
> +RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
>  RDEPENDS:${PN}-qcom-qrb4210-compute = "${PN}-qcom-license"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206170): https://lists.openembedded.org/g/openembedded-core/message/206170
> Mute This Topic: https://lists.openembedded.org/mt/109156111/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

