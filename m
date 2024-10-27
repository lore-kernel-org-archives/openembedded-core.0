Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60ECCD1356F
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 16:06:34 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.32280.1730045186957956679
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 09:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NdzMiJQj;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5ffea2699so2293972b6e.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 09:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730045186; x=1730649986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwXrKU2BNPYjxn606ijUCos8C5ZfYT91oYf1wzZR0x4=;
        b=NdzMiJQjoOwsJlf5ElT8uOq/zeMO1vTrbkkEcNs/9nqz0lOko8kTghQ6H3dbmh8bwL
         0gTGyNpkfGXKpDUF0Y+t8BKHRBREn4fTCUv9ynuRIuZIpZQEV81HBbACmF/Byto1ZIQ/
         1S/cRHbkQpzEV1ctc/lGFvCih0B3RAWbcxuDtr7uSInEivBPiFGWjz8g1/+ZhCVHAVi0
         427i+fBpApZLo4sWjWLIQoqY1GBbd+divLCqjhkSPXL9JDypbDVNCRkQdiqasWbt4Pmv
         dwR53ctxnmmgxh/5D6jkpZpw//1+J98oNXESnnkpsvrAci0sgkEX4Y0CsXUa+ExD1wv3
         erGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730045186; x=1730649986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwXrKU2BNPYjxn606ijUCos8C5ZfYT91oYf1wzZR0x4=;
        b=gBoOiYr2bNGXV9LSqaFEiKEDB5Er4auWvZqbCFqvnj4TsXMIUvEuduuRlrptBBoBMQ
         TX2Vvro3joGmup14Lmc/2puqF0bahtWWsEj4owAT+OR3tKim5kSYElIWhHxcchM1GflE
         rnCdB9kRH79AgX7SyKKesgpKXb4goKcDbS/XIe8yLnK6jyB0XkAuMAPtD7DWZf0WCtFx
         VwTv9aiSGC5o0oQUArHZbqBHz7D7RVQtDOviaa+PqYXxeE/W6sYfkYn70nI6AXP/Y6mu
         H3KWBPnOKhfUtkx/iAWlm+/gSzbmcqKeOGOauDQco+rSJWuaDNqFT4ymvJytYhaKq9h6
         Bshg==
X-Gm-Message-State: AOJu0Yyle0WjtOlq7YvQcECn147bKCiE4N+XD0Oe1iRl8+1rOfn/QiS7
	toKdi9lTk15gUo72+tIZ2WLdyjxIlXleKzdT4MFaq2wH/m7/E/NglDfejvvBI0O4s7uBa9AbcjJ
	M8iDUjTsJZSpi1ugqIixzsOAj80rD70ouznA=
X-Google-Smtp-Source: AGHT+IH7v2UX/OAwRhT/UVM6wqZwTuZ/1Bx8LUyCGUgDv5JBg7BnoeXTi93qOLNST7EJ/vDlerf9c09S+8pecmE/5oA=
X-Received: by 2002:a05:6808:14cb:b0:3e5:2ee9:3a with SMTP id
 5614622812f47-3e62c5aba53mr6242457b6e.19.1730045185986; Sun, 27 Oct 2024
 09:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241027112013.DD95910040D@builder.sakoman.com>
In-Reply-To: <20241027112013.DD95910040D@builder.sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2024 09:05:59 -0700
Message-ID: <CAMKF1sqYyQRD5bOY3FV8DF2L696bzn1dk4W9zMdTM6qJHN8puw@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 27 Oct 2024
 01:00:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 16:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206405

On Sun, Oct 27, 2024 at 4:20=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Branch: master
>
> New this week: 50 CVEs
> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-48795 *

when was this run ?
The CVE is patched in libssh2 1.11.1 which was updated in master on Oct 24t=
h
https://git.yoctoproject.org/poky/commit/?id=3D3fa461da7c43a945542294f0aaba=
4824deb60810

> CVE-2024-47711 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-47711 *
> CVE-2024-47726 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-47726 *
> CVE-2024-47729 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-47729 *
> CVE-2024-49865 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-49865 *
> CVE-2024-49893 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49893 *
> CVE-2024-49899 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49899 *
> CVE-2024-49906 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49906 *
> CVE-2024-49908 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49908 *
> CVE-2024-49910 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49910 *
> CVE-2024-49914 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49914 *
> CVE-2024-49916 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49916 *
> CVE-2024-49920 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49920 *
> CVE-2024-49921 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49921 *
> CVE-2024-49941 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49941 *
> CVE-2024-50019 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50019 *
> CVE-2024-50020 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50020 *
> CVE-2024-50021 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50021 *
> CVE-2024-50022 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50022 *
> CVE-2024-50023 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50023 *
> CVE-2024-50024 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50024 *
> CVE-2024-50025 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50025 *
> CVE-2024-50026 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50026 *
> CVE-2024-50027 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50027 *
> CVE-2024-50028 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50028 *
> CVE-2024-50029 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50029 *
> CVE-2024-50030 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50030 *
> CVE-2024-50031 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50031 *
> CVE-2024-50032 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50032 *
> CVE-2024-50033 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50033 *
> CVE-2024-50035 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50035 *
> CVE-2024-50036 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50036 *
> CVE-2024-50038 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50038 *
> CVE-2024-50039 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50039 *
> CVE-2024-50040 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50040 *
> CVE-2024-50041 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50041 *
> CVE-2024-50043 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50043 *
> CVE-2024-50044 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2024-50044 *
> CVE-2024-50045 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50045 *
> CVE-2024-50046 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50046 *
> CVE-2024-50047 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50047 *
> CVE-2024-50048 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50048 *
> CVE-2024-50049 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50049 *
> CVE-2024-50055 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50055 *
> CVE-2024-50057 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2024-50057 *
> CVE-2024-50058 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50058 *
> CVE-2024-50059 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50059 *
> CVE-2024-50061 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50061 *
> CVE-2024-50062 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50062 *
> CVE-2024-50064 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50064 *
>
> Removed this week: 1 CVEs
> CVE-2024-45306 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2024-45306 *
>
> Full list:  Found 68 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-48795 (CVSS3: 5.9 MEDIUM): libssh2:libssh2-native https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-48795 *
> CVE-2023-52904 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-52904 *
> CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-6240 *
> CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-6535 *
> CVE-2024-38381 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-38381 *
> CVE-2024-47711 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-47711 *
> CVE-2024-47726 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-47726 *
> CVE-2024-47729 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-47729 *
> CVE-2024-49865 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-49865 *
> CVE-2024-49893 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49893 *
> CVE-2024-49899 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49899 *
> CVE-2024-49906 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49906 *
> CVE-2024-49908 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49908 *
> CVE-2024-49910 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49910 *
> CVE-2024-49914 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49914 *
> CVE-2024-49916 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49916 *
> CVE-2024-49920 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49920 *
> CVE-2024-49921 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49921 *
> CVE-2024-49941 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-49941 *
> CVE-2024-50019 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50019 *
> CVE-2024-50020 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50020 *
> CVE-2024-50021 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50021 *
> CVE-2024-50022 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50022 *
> CVE-2024-50023 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50023 *
> CVE-2024-50024 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50024 *
> CVE-2024-50025 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50025 *
> CVE-2024-50026 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50026 *
> CVE-2024-50027 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50027 *
> CVE-2024-50028 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50028 *
> CVE-2024-50029 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50029 *
> CVE-2024-50030 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50030 *
> CVE-2024-50031 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50031 *
> CVE-2024-50032 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50032 *
> CVE-2024-50033 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50033 *
> CVE-2024-50035 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50035 *
> CVE-2024-50036 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50036 *
> CVE-2024-50038 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50038 *
> CVE-2024-50039 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50039 *
> CVE-2024-50040 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50040 *
> CVE-2024-50041 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50041 *
> CVE-2024-50043 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50043 *
> CVE-2024-50044 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2024-50044 *
> CVE-2024-50045 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50045 *
> CVE-2024-50046 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50046 *
> CVE-2024-50047 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50047 *
> CVE-2024-50048 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50048 *
> CVE-2024-50049 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50049 *
> CVE-2024-50055 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50055 *
> CVE-2024-50057 (CVSS3: 3.3 LOW): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2024-50057 *
> CVE-2024-50058 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50058 *
> CVE-2024-50059 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50059 *
> CVE-2024-50061 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2024-50061 *
> CVE-2024-50062 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50062 *
> CVE-2024-50064 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2024-50064 *
> CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6505 *
> CVE-2024-8354 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-8354 *
>
> Summary of CVE counts by recipe:
>   linux-yocto: 64
>   qemu:qemu-native:qemu-system-native: 3
>   libssh2:libssh2-native: 1
>
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206397): https://lists.openembedded.org/g/openembedde=
d-core/message/206397
> Mute This Topic: https://lists.openembedded.org/mt/109237750/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

