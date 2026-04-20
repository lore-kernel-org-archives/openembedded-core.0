Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A633F588F0
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 16:18:28 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23804.1776701903435131957
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Apr 2026 09:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XIQqN8mW;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso36914895e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776701902; x=1777306702; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh/3zC8Xpn9LA+kT+r+ACmT1ygWauhugYqlSaIwK/9c=;
        b=XIQqN8mWaUwqG8wUmD+4sh06lJxnB4ZgDdQxKFwH5KOv4QgrgZbjnsJ8DdlDxILppW
         3RLxaakzfsXWTmBQBiXCmGEpAXKxtek7brBPtJqbZ4anHEQ1skB3OTuVT7hrvSmAnQiI
         Lw07ceCD567ZVqy413MCzlw3AwBucfiD2fTLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776701902; x=1777306702;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh/3zC8Xpn9LA+kT+r+ACmT1ygWauhugYqlSaIwK/9c=;
        b=Vq8ZbSOiG9n2lPwQQli58+wCLlbvaCr0H408Xl9brhdTij9OxulAMLYCPA3YhQr3vu
         ldMfcr6wmZ+PYT+Mha0QQuYj3VO+A+WuhTkhJU+UpV9FO76cSIasce0xpUE2texfG8uj
         ik5VIQmsnf6avwdSxerD7mK3U5r+bI1o3gaG98ioHB95if6dCEIUXYMK5uh66bkdWz6U
         8nLlZd+gUuAlzQUryMAkVM0U9NO8L653x0aLMXJpOwS0SNGM7xYyReXxQVmfLgSqou+C
         iE6yVPzT1MD2aOV9anNlAYY441rnAp1wSmkxjK5CemFwNkbVLkpvGztnMEAOHJ6aMWha
         XR+g==
X-Forwarded-Encrypted: i=1; AFNElJ/CvWja9F92XszNI+E3Ap2OYgb4m0hwS5eNctxz5y1JplgbE0BJmwdfBXNyP4d4q4XMLevSbfrR2HK0+CYIvDhm4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxE1XwZW0prla//3xGr6PWvuedzl+6wRPU1j4UgVPs2NF9hXuLQ
	6BCti7XcXMUcWHHU2wSPIbkEjEXDDPLK2Njjo+luzfdHMP8aLD7/iN1IqlDxB/AQW2c=
X-Gm-Gg: AeBDievqUqJCxUay6bMgyqrIj5i8/YG6D90ee2wRm4ifGjXMWRzEcSwsqXR+SR4FQvX
	MnnIa+sBRi3mtorYwAoCy4PqG/2ZufGuGV9K1q/yOqEl1P/OjKHJ1vUxS4gocKASMo6RkPxRmgw
	yDkLQBiqqeHIf0I1DFFznkLP0exKv2yibEBjLzOB7xVntUXJW9POBR2RcCMRpqVQHXUp55n87a0
	ZPk/Fe7t5/hq3lHjSiHO2kmonECmiqp4VUl6Od/aF5XDLyaJZ0Kctc7YUV0lYtyG1BQ5r45QGfb
	sZWimd47E5NY5kw2LBBPZcihRiSvJWZFyRzZH0UXXDxzyMH+3yn5zv8pccNHWPaWf8g1sCdt7W4
	MoW3mSfrhWD0muWg9K9UQWQhVGJaTvne0UgC59VWDH7PiTkTUqrmTs/oXiidR8BBSz3dkQ+arSo
	ED2OjwukxVju5NTZ2BTbKRMB4jvsSBKMBdU9A6uR0MmCCfeKTSqyBXDMaYOxDJ5ssKsh8Mchgrs
	EYFhmwO/h/+9PDF7kRyCA==
X-Received: by 2002:a05:600c:19d4:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a5339ef15mr20744795e9.3.1776701901529;
        Mon, 20 Apr 2026 09:18:21 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f82bbsm486582715e9.3.2026.04.20.09.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 09:18:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 18:18:20 +0200
Message-Id: <DHY49DB6KXVW.QWKU1AUDS79F@smile.fr>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun Apr 19 23:58:36
 2026
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "OE-Core ML"
 <openembedded-core@lists.openembedded.org>, "Yocto Security ML"
 <yocto-security@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <20260420070750.2093171-1-yoann.congal@smile.fr>
 <20260420070750.2093171-4-yoann.congal@smile.fr>
 <AS1PR10MB5697D1AC518B640243633925FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697D1AC518B640243633925FD2F2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Apr 2026 16:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235574

On Mon Apr 20, 2026 at 9:35 AM CEST, Peter Marko wrote:
> Hello Yoann,
>
> Could you please add following to your build configuration to match what =
valkyrie metrics is showing?
> LICENSE_FLAGS_ACCEPTED +=3D "commercial"
>
> Currently this report is missing ffmpeg recipe vulnerabilities.

Thanks Peter!

I've updated my script and sent an updated mail for the week.

Regards,

>
> Thanks,
>   Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Monday, April 20, 2026 9:08 AM
>> To: OE-Core ML <openembedded-core@lists.openembedded.org>; Yocto
>> Security ML <yocto-security@lists.yoctoproject.org>
>> Subject: [OE-core] OE-core CVE metrics for master on Sun Apr 19 23:58:36=
 2026
>>=20
>> Note: The CVE list generation was switched from cve-check to sbom-cve-ch=
eck
>> class. There are slight differences in CVE filtering/handling. This is w=
hy "old"
>> CVEs appear this week.
>>=20
>> Branch: master
>>=20
>> New this week: 134 CVEs
>> CVE-2023-53012 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53012 *
>> CVE-2023-53187 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53187 *
>> CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-2236 *
>> CVE-2024-47850 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47850 *
>> CVE-2024-49854 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49854 *
>> CVE-2024-58251 (CVSS3: N/A): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58251 *
>> CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-14876 *
>> CVE-2025-38656 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38656 *
>> CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-50422 *
>> CVE-2025-66382 (CVSS3: N/A): expat:expat-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66382 *
>> CVE-2025-68195 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68195 *
>> CVE-2025-71145 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71145 *
>> CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0665 *
>> CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2243 *
>> CVE-2026-23327 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23327 *
>> CVE-2026-23328 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23328 *
>> CVE-2026-23355 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23355 *
>> CVE-2026-23371 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23371 *
>> CVE-2026-23374 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23374 *
>> CVE-2026-23377 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23377 *
>> CVE-2026-23389 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23389 *
>> CVE-2026-23391 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23391 *
>> CVE-2026-23392 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23392 *
>> CVE-2026-23393 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23393 *
>> CVE-2026-23394 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23394 *
>> CVE-2026-23395 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23395 *
>> CVE-2026-23396 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23396 *
>> CVE-2026-23397 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23397 *
>> CVE-2026-23398 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23398 *
>> CVE-2026-23399 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23399 *
>> CVE-2026-23401 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23401 *
>> CVE-2026-23402 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23402 *
>> CVE-2026-23412 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23412 *
>> CVE-2026-23413 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23413 *
>> CVE-2026-23414 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23414 *
>> CVE-2026-23415 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23415 *
>> CVE-2026-23416 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23416 *
>> CVE-2026-23417 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23417 *
>> CVE-2026-23427 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23427 *
>> CVE-2026-23428 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23428 *
>> CVE-2026-23430 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23430 *
>> CVE-2026-23431 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23431 *
>> CVE-2026-23434 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23434 *
>> CVE-2026-23436 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23436 *
>> CVE-2026-23437 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23437 *
>> CVE-2026-23438 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23438 *
>> CVE-2026-23439 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23439 *
>> CVE-2026-23440 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23440 *
>> CVE-2026-23441 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23441 *
>> CVE-2026-23442 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23442 *
>> CVE-2026-23443 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23443 *
>> CVE-2026-23444 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23444 *
>> CVE-2026-23445 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23445 *
>> CVE-2026-23446 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23446 *
>> CVE-2026-23447 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23447 *
>> CVE-2026-23448 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23448 *
>> CVE-2026-23449 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23449 *
>> CVE-2026-23450 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23450 *
>> CVE-2026-23451 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23451 *
>> CVE-2026-23452 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23452 *
>> CVE-2026-23454 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23454 *
>> CVE-2026-23455 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23455 *
>> CVE-2026-23456 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23456 *
>> CVE-2026-23457 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23457 *
>> CVE-2026-23458 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23458 *
>> CVE-2026-23459 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23459 *
>> CVE-2026-23460 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23460 *
>> CVE-2026-23461 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23461 *
>> CVE-2026-23462 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23462 *
>> CVE-2026-23463 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23463 *
>> CVE-2026-23464 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23464 *
>> CVE-2026-23465 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23465 *
>> CVE-2026-23466 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23466 *
>> CVE-2026-23467 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23467 *
>> CVE-2026-23468 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23468 *
>> CVE-2026-23469 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23469 *
>> CVE-2026-23470 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23470 *
>> CVE-2026-23472 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23472 *
>> CVE-2026-23473 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23473 *
>> CVE-2026-23474 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23474 *
>> CVE-2026-23475 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23475 *
>> CVE-2026-25645 (CVSS3: N/A): python3-requests
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
>> CVE-2026-31389 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31389 *
>> CVE-2026-31390 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31390 *
>> CVE-2026-31391 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31391 *
>> CVE-2026-31392 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31392 *
>> CVE-2026-31393 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31393 *
>> CVE-2026-31394 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31394 *
>> CVE-2026-31395 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31395 *
>> CVE-2026-31396 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31396 *
>> CVE-2026-31397 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31397 *
>> CVE-2026-31398 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31398 *
>> CVE-2026-31399 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31399 *
>> CVE-2026-31400 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31400 *
>> CVE-2026-31401 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31401 *
>> CVE-2026-31402 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31402 *
>> CVE-2026-31403 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31403 *
>> CVE-2026-31404 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31404 *
>> CVE-2026-31406 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31406 *
>> CVE-2026-31407 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31407 *
>> CVE-2026-31408 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31408 *
>> CVE-2026-31409 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31409 *
>> CVE-2026-31410 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31410 *
>> CVE-2026-31413 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31413 *
>> CVE-2026-31414 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31414 *
>> CVE-2026-31415 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31415 *
>> CVE-2026-31416 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31416 *
>> CVE-2026-31417 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31417 *
>> CVE-2026-31418 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31418 *
>> CVE-2026-31419 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31419 *
>> CVE-2026-31420 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31420 *
>> CVE-2026-31421 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31421 *
>> CVE-2026-31422 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31422 *
>> CVE-2026-31423 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31423 *
>> CVE-2026-31424 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31424 *
>> CVE-2026-31425 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31425 *
>> CVE-2026-31426 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31426 *
>> CVE-2026-31427 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31427 *
>> CVE-2026-31428 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31428 *
>> CVE-2026-31788 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31788 *
>> CVE-2026-34743 (CVSS3: N/A): xz:xz-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34743 *
>> CVE-2026-34933 (CVSS3: N/A): avahi
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34933 *
>> CVE-2026-34978 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34978 *
>> CVE-2026-34979 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34979 *
>> CVE-2026-34980 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34980 *
>> CVE-2026-34990 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34990 *
>> CVE-2026-39314 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39314 *
>> CVE-2026-39316 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39316 *
>> CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39837 *
>> CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39839 *
>> CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39840 *
>> CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39841 *
>> CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41035 *
>> CVE-2026-41080 (CVSS3: N/A): expat:expat-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41080 *
>>=20
>> Removed this week: 17 CVEs
>> CVE-2008-6713 (CVSS3: N/A): wic:wic-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2008-6713 *
>> CVE-2025-12801 (CVSS3: N/A): nfs-utils
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-12801 *
>> CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-61662 *
>> CVE-2025-69649 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
>> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-
>> 2025-69649 *
>> CVE-2025-69693 (CVSS3: N/A): ffmpeg
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-69693 *
>> CVE-2026-1467 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1467 *
>> CVE-2026-1536 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1536 *
>> CVE-2026-1539 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1539 *
>> CVE-2026-1801 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-1801 *
>> CVE-2026-2443 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2443 *
>> CVE-2026-25645 (CVSS3: N/A): python3-requests:python3-requests-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
>> CVE-2026-33416 (CVSS3: N/A): libpng:libpng-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33416 *
>> CVE-2026-33636 (CVSS3: N/A): libpng:libpng-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-33636 *
>> CVE-2026-34714 (CVSS3: N/A): vim
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34714 *
>> CVE-2026-35093 (CVSS3: N/A): libinput
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35093 *
>> CVE-2026-35094 (CVSS3: N/A): libinput
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35094 *
>> CVE-2026-35414 (CVSS3: N/A): openssh
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-35414 *
>>=20
>> Full list:  Found 161 unpatched CVEs
>> CVE-2019-14899 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2019-14899 *
>> CVE-2021-3714 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3714 *
>> CVE-2021-3864 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3864 *
>> CVE-2022-0400 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-0400 *
>> CVE-2022-1247 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1247 *
>> CVE-2022-4543 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-4543 *
>> CVE-2023-3397 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3397 *
>> CVE-2023-3640 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3640 *
>> CVE-2023-4010 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4010 *
>> CVE-2023-53012 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53012 *
>> CVE-2023-53187 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-53187 *
>> CVE-2023-6238 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6238 *
>> CVE-2023-6240 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-6240 *
>> CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-2236 *
>> CVE-2024-47850 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-47850 *
>> CVE-2024-49854 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-49854 *
>> CVE-2024-50613 (CVSS3: N/A): libsndfile1
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-50613 *
>> CVE-2024-58251 (CVSS3: N/A): busybox
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-58251 *
>> CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
>> CVE-2025-14876 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-14876 *
>> CVE-2025-38656 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-38656 *
>> CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-50422 *
>> CVE-2025-52194 (CVSS3: N/A): libsndfile1
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-52194 *
>> CVE-2025-59529 (CVSS3: N/A): avahi
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-59529 *
>> CVE-2025-66382 (CVSS3: N/A): expat:expat-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-66382 *
>> CVE-2025-68195 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-68195 *
>> CVE-2025-69652 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
>> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-
>> 2025-69652 *
>> CVE-2025-71074 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71074 *
>> CVE-2025-71145 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2025-71145 *
>> CVE-2026-0665 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-0665 *
>> CVE-2026-2243 (CVSS3: N/A): qemu:qemu-native:qemu-system-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-2243 *
>> CVE-2026-23327 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23327 *
>> CVE-2026-23328 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23328 *
>> CVE-2026-23355 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23355 *
>> CVE-2026-23371 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23371 *
>> CVE-2026-23374 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23374 *
>> CVE-2026-23377 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23377 *
>> CVE-2026-23389 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23389 *
>> CVE-2026-23391 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23391 *
>> CVE-2026-23392 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23392 *
>> CVE-2026-23393 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23393 *
>> CVE-2026-23394 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23394 *
>> CVE-2026-23395 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23395 *
>> CVE-2026-23396 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23396 *
>> CVE-2026-23397 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23397 *
>> CVE-2026-23398 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23398 *
>> CVE-2026-23399 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23399 *
>> CVE-2026-23401 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23401 *
>> CVE-2026-23402 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23402 *
>> CVE-2026-23412 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23412 *
>> CVE-2026-23413 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23413 *
>> CVE-2026-23414 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23414 *
>> CVE-2026-23415 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23415 *
>> CVE-2026-23416 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23416 *
>> CVE-2026-23417 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23417 *
>> CVE-2026-23427 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23427 *
>> CVE-2026-23428 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23428 *
>> CVE-2026-23430 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23430 *
>> CVE-2026-23431 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23431 *
>> CVE-2026-23434 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23434 *
>> CVE-2026-23436 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23436 *
>> CVE-2026-23437 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23437 *
>> CVE-2026-23438 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23438 *
>> CVE-2026-23439 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23439 *
>> CVE-2026-23440 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23440 *
>> CVE-2026-23441 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23441 *
>> CVE-2026-23442 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23442 *
>> CVE-2026-23443 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23443 *
>> CVE-2026-23444 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23444 *
>> CVE-2026-23445 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23445 *
>> CVE-2026-23446 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23446 *
>> CVE-2026-23447 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23447 *
>> CVE-2026-23448 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23448 *
>> CVE-2026-23449 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23449 *
>> CVE-2026-23450 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23450 *
>> CVE-2026-23451 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23451 *
>> CVE-2026-23452 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23452 *
>> CVE-2026-23454 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23454 *
>> CVE-2026-23455 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23455 *
>> CVE-2026-23456 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23456 *
>> CVE-2026-23457 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23457 *
>> CVE-2026-23458 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23458 *
>> CVE-2026-23459 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23459 *
>> CVE-2026-23460 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23460 *
>> CVE-2026-23461 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23461 *
>> CVE-2026-23462 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23462 *
>> CVE-2026-23463 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23463 *
>> CVE-2026-23464 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23464 *
>> CVE-2026-23465 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23465 *
>> CVE-2026-23466 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23466 *
>> CVE-2026-23467 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23467 *
>> CVE-2026-23468 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23468 *
>> CVE-2026-23469 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23469 *
>> CVE-2026-23470 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23470 *
>> CVE-2026-23472 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23472 *
>> CVE-2026-23473 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23473 *
>> CVE-2026-23474 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23474 *
>> CVE-2026-23475 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-23475 *
>> CVE-2026-25645 (CVSS3: N/A): python3-requests
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-25645 *
>> CVE-2026-3099 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3099 *
>> CVE-2026-31389 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31389 *
>> CVE-2026-31390 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31390 *
>> CVE-2026-31391 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31391 *
>> CVE-2026-31392 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31392 *
>> CVE-2026-31393 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31393 *
>> CVE-2026-31394 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31394 *
>> CVE-2026-31395 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31395 *
>> CVE-2026-31396 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31396 *
>> CVE-2026-31397 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31397 *
>> CVE-2026-31398 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31398 *
>> CVE-2026-31399 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31399 *
>> CVE-2026-31400 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31400 *
>> CVE-2026-31401 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31401 *
>> CVE-2026-31402 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31402 *
>> CVE-2026-31403 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31403 *
>> CVE-2026-31404 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31404 *
>> CVE-2026-31406 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31406 *
>> CVE-2026-31407 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31407 *
>> CVE-2026-31408 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31408 *
>> CVE-2026-31409 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31409 *
>> CVE-2026-31410 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31410 *
>> CVE-2026-31413 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31413 *
>> CVE-2026-31414 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31414 *
>> CVE-2026-31415 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31415 *
>> CVE-2026-31416 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31416 *
>> CVE-2026-31417 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31417 *
>> CVE-2026-31418 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31418 *
>> CVE-2026-31419 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31419 *
>> CVE-2026-31420 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31420 *
>> CVE-2026-31421 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31421 *
>> CVE-2026-31422 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31422 *
>> CVE-2026-31423 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31423 *
>> CVE-2026-31424 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31424 *
>> CVE-2026-31425 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31425 *
>> CVE-2026-31426 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31426 *
>> CVE-2026-31427 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31427 *
>> CVE-2026-31428 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31428 *
>> CVE-2026-31788 (CVSS3: N/A): linux-yocto
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-31788 *
>> CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
>> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-
>> 2026-3441 *
>> CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
>> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-
>> 2026-3442 *
>> CVE-2026-34743 (CVSS3: N/A): xz:xz-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34743 *
>> CVE-2026-34933 (CVSS3: N/A): avahi
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34933 *
>> CVE-2026-34978 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34978 *
>> CVE-2026-34979 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34979 *
>> CVE-2026-34980 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34980 *
>> CVE-2026-34990 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-34990 *
>> CVE-2026-3632 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3632 *
>> CVE-2026-3633 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3633 *
>> CVE-2026-3634 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-3634 *
>> CVE-2026-39314 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39314 *
>> CVE-2026-39316 (CVSS3: N/A): cups
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39316 *
>> CVE-2026-39837 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39837 *
>> CVE-2026-39839 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39839 *
>> CVE-2026-39840 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39840 *
>> CVE-2026-39841 (CVSS3: N/A): cargo:cargo-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-39841 *
>> CVE-2026-4046 (CVSS3: N/A): glibc
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4046 *
>> CVE-2026-41035 (CVSS3: N/A): rsync:rsync-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41035 *
>> CVE-2026-41080 (CVSS3: N/A): expat:expat-native
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-41080 *
>> CVE-2026-4271 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-4271 *
>> CVE-2026-4647 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-
>> native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-
>> 2026-4647 *
>> CVE-2026-5119 (CVSS3: N/A): libsoup
>> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-5119 *
>>=20
>> Summary of CVE counts by recipe:
>>   linux-yocto: 123
>>   cups: 7
>>   libsoup: 6
>>   binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
>>   cargo:cargo-native: 4
>>   qemu:qemu-native:qemu-system-native: 4
>>   avahi: 2
>>   expat:expat-native: 2
>>   libsndfile1: 2
>>   busybox: 1
>>   cairo:cairo-native: 1
>>   glibc: 1
>>   libgcrypt:libgcrypt-native: 1
>>   python3-requests: 1
>>   rsync:rsync-native: 1
>>   xz:xz-native: 1
>>=20
>> For further information see: https://valkyrie.yocto.io/pub/non-release/p=
atchmetrics/


--=20
Yoann Congal
Smile ECS


