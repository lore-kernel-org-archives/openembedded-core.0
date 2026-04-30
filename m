Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBF2FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:08:30 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16666.1777543701285645842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=E7YGOgw2;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so3937695e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 03:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777543699; x=1778148499; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQdTnkq7VquIFWziYlP3yppxFWL3F0Lz0sgXX255kDA=;
        b=E7YGOgw2zq1TWKrUCRFbzSBx4rp7l1cqCz+FVlDGM4iT95e78fnzG+Lv0+crmNxsBp
         PY4jDVqbjlyqENLxOKKENRvby3jDsSHicawl7M/Ryu4PW3EFveiBI75IpHuBo/ZsEP3W
         SqXZYQY+EaM4Qn71F0pAgqSdvYSyTcr3oQmUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777543699; x=1778148499;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQdTnkq7VquIFWziYlP3yppxFWL3F0Lz0sgXX255kDA=;
        b=nc6Y749jYPKeYzszAF7G1MgZ9WisSw2y7vlgbzCSIFR4KhWkXu1liWUWyusKSoVCnN
         kmoAJo3X1ppkWK4B4DKI63vfieYXORDjCH395SUOXEl5x4AFqHNvWMwe7T7UUmfsLWU0
         W0AID0lGg4kGWpBvqBWpRfjvPFFoNfkRHTwUtvIfZtv+aZH1jO5PrI1fI1Lwz4yCQOqD
         iMaybK7iuBCOKi+q4JMVqZOOpzq4r4B48NLUD1Hb4QvSPJ3RzQ83kCntpSwJiuOfZCKk
         qALtpGicSORT66oIBYeb7OwcKacmDPw3v6X3563yV+3xboam/gutZZ7yofuHFrpfY6YB
         xtEw==
X-Forwarded-Encrypted: i=1; AFNElJ8ECC9bU1DMtx3ogp7L28so4rbMcmryn2cvcENVKxChAXGSVFpixbm4hI6BkkKWc6S/J8UuPrYuhWVyvrO8SGtRDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2rQd7nF/RdSsbD2FwPe+GqkBHysG2Ig/BPPiDxAQDz4/bQPY7
	45gZCL9ewZYiZP084/RCNHuBMZ5oc20b0oPOqt1lGTRF+O9HfPylN/igoF2FuNdv3LvV9BUgbqK
	S5V1xEmo=
X-Gm-Gg: AeBDiesmgbOMaVSP9qbn2X/fVa9geR42lOjy4ERIeXv86/BAWMHvGtkYSK2UCVUgPRq
	D+ISJ+AkYN9r7/q/baevNNK/4klbhzK02XGS6qq6l2ckKwL/j1qqkMDA32bJbcxYBiTNqFTpmHp
	khM8oCqSQ5Al6wb433Hbwa5rQNAehzU4BRD0X/9lAo80zwejWpY1PNIH5OKHARfp764fbeOEgpi
	SlKmexku+rLH9ARkWyzSiDutEzbTLaGRvD6IZbxusAcljP9UprBvr6b/1g1GzjA6bf+1ptRtoC9
	Qhv29JKfTaX8Eq6yDDNIxmtZ5hCezlYgrB5oC/o2oz5CylxwzyUVRf2yirQoBvMNVIzEn3juZoP
	giW3YoDziSRL4fcJEViXEthjzqM4d8goUxgRAFJ8KEmMXvbW/PfZ682LUvBwQYQheoBmaGDjlZc
	3dRDU8qY8+8U2+NTvz4NplOwSdvw1VxNi0HGu2XuA//1yRv5ZpPV9J15Wy5NO2MnsE+3Zp8mGWZ
	OprMmm/jgq/vQsQPxb3KbiEd58=
X-Received: by 2002:a05:600d:8451:b0:489:1c09:6c4b with SMTP id 5b1f17b1804b1-48a83f6e2camr29699215e9.6.1777543699113;
        Thu, 30 Apr 2026 03:08:19 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822be9b4sm52769665e9.9.2026.04.30.03.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 03:08:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 12:08:18 +0200
Message-Id: <DI6ENHOQ21ZX.2P6T7E2G61S67@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: set CVE_STATUS for
 CVE-2025-69649
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260427064951.2603944-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260427064951.2603944-1-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 10:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236155

On Mon Apr 27, 2026 at 8:49 AM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Set CVE_STATUS for CVE-2025-69649, as this CVE only affects binutils 2.46=
.
> binutils 2.42 is not vulnerable.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 839d31242e..ed079c0349 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "binutils-(?P<pver>\d+_(=
\d_?)*)"
> =20
>  CVE_STATUS[CVE-2023-25584] =3D "cpe-incorrect: Applies only for version =
2.40 and earlier"
>  CVE_STATUS[CVE-2025-1180] =3D "patched: fixed by patch for CVE-2025-1176=
"=20
> +CVE_STATUS[CVE-2025-69649] =3D "cpe-incorrect: Applies only for version =
2.46"
> =20
>  SRCREV ?=3D "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
>  BINUTILS_GIT_URI ?=3D "git://sourceware.org/git/binutils-gdb.git;branch=
=3D${SRCBRANCH};protocol=3Dhttps"

Hi Harish,

I'm filling in for Yoann while he's on leave.

From what I've read on [1], the CPE of this CVE indicates=20
"up to and including version 2.46". So it's seems to me that
this CVE applies to our version 2.42.

I can't find any information that contradicts the NIST CPE.
Can you give me more information?=20

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-69649
--=20
Fabien Thomas
Smile ECS


