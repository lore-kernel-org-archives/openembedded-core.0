Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72C3C47258
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 09:41:13 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.13693.1706175665406149018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 01:41:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RyHip9RA;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cdfa8e69b5so70998511fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 01:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706175663; x=1706780463; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tuobynRgQylgpL0Oz2O1aeh7fukrlzcjNPkCDfSaUTI=;
        b=RyHip9RA+cvKfyffL2UFLeJ6HZrGQPOXEP77LpwK8MgDWRK8LrZdr9VaiXu2luU65D
         ce4joMbr1OR3D+6n3/4nvXTIFP02Jvab+9GsEbLB03DPVeHXGOAvixAoAnl8Qe/1lOVB
         gnkpi0nkO0/A0waT4eR6dmal5joZvHGtdL5BzKtFyz0SQ7uWbfPIEln+iX8YojMz7kDh
         gvliSpHmYi7o2kDD+XFD/OcEbIqiOyxrJPy2neSaC9N3X0OId3IA4PGwfiGws6zK/439
         58ZPORGQ0OUKWkdtJucUgufpFVBmO+jQb8aS3Wqhx/eOKC1P2Us9OU04peksAsljCkXg
         MNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175663; x=1706780463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tuobynRgQylgpL0Oz2O1aeh7fukrlzcjNPkCDfSaUTI=;
        b=ggTgXk/Ua8HT0GSlSuuFx083XYhnenEEeT8vL96CwQt7l5Dp6WR64oYCQfhm55BCHk
         v/Y8yuCfekNaROmrN7p10FAT4yGwu2qK3e9vg1w1G//Ec4mcphs8dp0hjWeYo6BsLEFp
         oGxnGD5fr/DdtN3r6oK23E0yqM8i0cHsTB3kAH33byMb/P8w7RV/dVKxTjGWjHX6n19S
         eNGkRswmgOr3E5pE4/MTnXJFoXa4KXBHUinlPviGx1CVBQXQ6zArXpudI1cLTLCgZ+8P
         Eo4ASWF1zEsJTLz2aviGOqHExRKjtU+HQeLnTFYvnyQTBoh0EIpVWT6Pqe/N9tqfyzd1
         IpoA==
X-Gm-Message-State: AOJu0YzG01d0bfLkxtGmov1YvPpKc8Pwo1pNLa+7BDydvetLS8hWIYte
	ED5caHmF5M4iao4nMtlxw3fn92/f6qSSmx3vk7bF6FTyIptTSJXxsOYV9qZEIUcZVNhrAtDujcP
	q/2W3iqCBg0BwQL4pxsoH1vZ3jNc=
X-Google-Smtp-Source: AGHT+IEP/EYhVH3JF8br/LdApalJlcfnaITsoG+6RqmB4Lu/rydSnm7ZjMLz9aA5EakT6wxt/bz+a84ya93q0aqej/s=
X-Received: by 2002:a19:a409:0:b0:50e:b1fa:8645 with SMTP id
 q9-20020a19a409000000b0050eb1fa8645mr194254lfc.109.1706175663236; Thu, 25 Jan
 2024 01:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20240125092554.3657475-1-mingli.yu@windriver.com> <20240125092554.3657475-2-mingli.yu@windriver.com>
In-Reply-To: <20240125092554.3657475-2-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Jan 2024 10:40:51 +0100
Message-ID: <CANNYZj8_bH5B5rq7Bn_wJm8kMcs4cuvWTpZvcGe3uTNguDtcYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] icu: Make the version consistent
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 09:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194314

This breaks upstream version check and automated updates, I can't accept that:

$ devtool latest-version icu
INFO: Current version: 74.1
INFO: Latest version: 74-2

It also breaks PV monotonically increasing.

Alex

On Thu, 25 Jan 2024 at 10:26, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Update the version in the bb name to make the version consistent.
> Before the patch:
>  # rpm -qa | grep icu
>  icu-74+1-r0.core2_64
>  # rpm -ql icu
>  /usr
>  /usr/bin
>  /usr/bin/derb
>  [snip]
>  # derb --version
>  derb version 1.1 (ICU version 74.1).
>   Copyright (C) 2016 and later: Unicode, Inc. and others. License & terms of use: http://www.unicode.org/copyright.html
>
> After the patch:
>  # rpm -qa | grep icu
>  icu-74.1-r0.core2_64
>  # rpm -ql icu
>  /usr
>  /usr/bin
>  /usr/bin/derb
>  [snip]
>  # derb --version
>  derb version 1.1 (ICU version 74.1).
>   Copyright (C) 2016 and later: Unicode, Inc. and others. License & terms of use: http://www.unicode.org/copyright.html
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-support/icu/{icu_74-1.bb => icu_74.1.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/icu/{icu_74-1.bb => icu_74.1.bb} (96%)
>
> diff --git a/meta/recipes-support/icu/icu_74-1.bb b/meta/recipes-support/icu/icu_74.1.bb
> similarity index 96%
> rename from meta/recipes-support/icu/icu_74-1.bb
> rename to meta/recipes-support/icu/icu_74.1.bb
> index 88ded166b5..196b3dc579 100644
> --- a/meta/recipes-support/icu/icu_74-1.bb
> +++ b/meta/recipes-support/icu/icu_74.1.bb
> @@ -14,7 +14,7 @@ S = "${WORKDIR}/icu/source"
>  SPDX_S = "${WORKDIR}/icu"
>  STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
>
> -ICU_MAJOR_VER = "${@d.getVar('PV').split('-')[0]}"
> +ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
>
>  inherit autotools pkgconfig github-releases
>
> @@ -81,15 +81,15 @@ BBCLASSEXTEND = "native nativesdk"
>  LIC_FILES_CHKSUM = "file://../LICENSE;md5=08dc3852df8fffa807301902ad899ff8"
>
>  def icu_download_version(d):
> -    pvsplit = d.getVar('PV').split('-')
> +    pvsplit = d.getVar('PV').split('.')
>      return pvsplit[0] + "_" + pvsplit[1]
>
>  def icu_download_folder(d):
> -    pvsplit = d.getVar('PV').split('-')
> +    pvsplit = d.getVar('PV').split('.')
>      return pvsplit[0] + "-" + pvsplit[1]
>
>  def icu_install_folder(d):
> -    pvsplit = d.getVar('PV').split('-')
> +    pvsplit = d.getVar('PV').split('.')
>      return pvsplit[0] + "." + pvsplit[1]
>
>  ICU_PV = "${@icu_download_version(d)}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194311): https://lists.openembedded.org/g/openembedded-core/message/194311
> Mute This Topic: https://lists.openembedded.org/mt/103950928/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

