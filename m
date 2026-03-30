Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2002DFF495C
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 07:33:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45745.1774855986027709127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 00:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p4iQxR4+;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4870206f73bso24546495e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 00:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774855984; x=1775460784; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFpJYM/xbWxxflp81vGHMjkEPCzZCAZM+EjTGHsxLBk=;
        b=p4iQxR4+KB+3sllgT2ZlxCj3lMRb8k7ZJRtyUJ/ecfNePJ64YWjXgErmDpoHy5t5rt
         tjR3Tz2b5xqKaTvamHb1Z89a0bBjzGFApgtQP16/KFIJ4umqhEgkfkQR/BD64YHtFZt+
         6wjZrUVwplY/NqvIq29rygnJdBGhFQzM0zAxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774855984; x=1775460784;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFpJYM/xbWxxflp81vGHMjkEPCzZCAZM+EjTGHsxLBk=;
        b=dArjGrfXfpTDiHZBIwE5Qn2d7oriwjaks2A7FLl2mehUtOLuj3K4ZC9NPF6u4jrq8P
         91bN6Phh7XKeW5BppRTLdTf/gD5P1EHB3CBBJh8piP7c47jQFXh5moqz14VCMEoHAIMh
         D76C97sz0ulxDRWEEpzMqTrE7yvP0xUWx+K69zeIzIrfN7WaWEsV5GGiKIX2zD4u8sNc
         OX/rpus4ByBYuFpWMUI9lEwGTEj/NTI0NcukShez1Sro1fQDjy8J3OMyRYT6hVYqIKWB
         zNZp+w/JHMwO6gun8GHaS99L8iboOGAs0fnll24eRhA41Sq4YAqJQN8ysnbmlrq1MhAI
         U3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCW7dEAjxli8cn1+AptXZ62jS1zB4A99SlamMrt1jxCsnJLR/6ycMLR+SwSAz735t0EAqve1r5M7qXZO4qwgoUi5Xw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhpIpv+Zp5a8+EtZengNuNtYbMo/0p9j2GTje7Q2kdy/UBazBX
	3XWpFvOeHyBVTgJ122qOGmH92Tz6rdfp9NS94qJru34v8g/d8/yQMWl4ONwWSzLqJK8=
X-Gm-Gg: ATEYQzxSo19OEdUOaN/yrlBwChIVQjZo5EA1RAe8HDve7hIP0GLt2pY9n2LNtXaDRMp
	lO50oWs4qbWkSx66pV/5c37NBA66KwUr1YQUYH6OkVoM+h5SDQhvTe47M5By2QPq6lfI6B44KWU
	nSHxRHi2qxU3aVsCYkeNE/Y5Du8GF8EuhXLctmqS7kotwc+C9acGtZEzdiHPqHRBZAQ2Vx8wHLm
	X74TjcsoDMxatynD4cZk4WczELSzqmNesq0cMj1nye52EdGfYs5If+INjXbO5B/SNGM16Y2yHAN
	szS10arC7THb52MdDenyvij976lzvW0+XoLTKKKa2zpK4vmTbcn9alIEn2CzP3NjVQvbqJJnno7
	MILjDXh5DsI7r8uOXy0y4b35dP3SrARLqctBm7djAc9mfAajTFnFZnMtSSeB/uoHI4tam0rNBFL
	FrACu1f15SI68lLRyVZ89kdghYQAqUQyrt6SusjAE+pbXOXk8vfytUTRJ+GytXfbrYH4z7Mx2c+
	wLk58KYii5Ge7bcW2Nwjw==
X-Received: by 2002:a05:600c:6091:b0:487:13d:4e77 with SMTP id 5b1f17b1804b1-487280a9d07mr179608355e9.27.1774855984331;
        Mon, 30 Mar 2026 00:33:04 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm240045235e9.4.2026.03.30.00.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:33:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 09:33:03 +0200
Message-Id: <DHFXXQNJKP5G.31KDQNTQW73NG@smile.fr>
Subject: Re: [OE-core][scarthgap 00/11] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1774824253.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1774824253.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 07:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234201

On Mon Mar 30, 2026 at 12:46 AM CEST, Yoann Congal wrote:
> Please review this set of changes for scarthgap and have comments back by
> end of day Tuesday, March 31.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3546
> Note: This particular build had a gnutls patch that I removed because it =
needed a small change[0].
> Build (currently running) without the gnutls patch: https://autobuilder.y=
octoproject.org/valkyrie/#/builders/29/builds/3551

That second build is successful. (Only a warning from VNC integration on
autobuilder, I'll send a patch)

> [0]: https://lore.kernel.org/openembedded-core/DHFLXG1K82R7.3EOQRZ2H6KW8Q=
@smile.fr/T/#t
>
> The following changes since commit 41597b5260fb5ca811d0fb4ae7e65246d61734=
eb:
>
>   Revert "scripts/install-buildtools: Update to 5.0.16" (2026-03-26 09:48=
:20 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>
> for you to fetch changes up to e6f3b2e043259650d80fb6f761797c5cf5587eb5:
>
>   python3-pyopenssl: Fix CVE-2026-27459 (2026-03-30 00:09:38 +0200)
>
> ----------------------------------------------------------------
>
> Jo=C3=A3o Marcos Costa (Schneider Electric) (1):
>   spdx: add option to include only compiled sources
>
> Martin Jansa (3):
>   dtc: backport fix for build with glibc-2.43
>   elfutils: don't add -Werror to avoid discarded-qualifiers
>   binutils: backport patch to fix build with glibc-2.43 on host
>
> Michael Halstead (2):
>   yocto-uninative: Update to 5.0 for needed patchelf updates
>   yocto-uninative: Update to 5.1 for glibc 2.43
>
> Nguyen Dat Tho (1):
>   python3-cryptography: Fix CVE-2026-26007
>
> Paul Barker (1):
>   tzdata,tzcode-native: Upgrade 2025b -> 2025c
>
> Richard Purdie (1):
>   pseudo: Add fix for glibc 2.43
>
> Vijay Anusuri (2):
>   python3-pyopenssl: Fix CVE-2026-27448
>   python3-pyopenssl: Fix CVE-2026-27459
>
>  meta/classes/spdx-common.bbclass              |   3 +
>  meta/conf/distro/include/yocto-uninative.inc  |  10 +-
>  meta/lib/oe/spdx30_tasks.py                   |  12 ++
>  .../binutils/binutils-2.42.inc                |   1 +
>  ...tect-against-standard-library-macros.patch |  31 ++++
>  .../elfutils/elfutils_0.191.bb                |   1 +
>  ...001-config-eu.am-do-not-force-Werror.patch |  34 ++++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
>  .../python3-cryptography/CVE-2026-26007.patch | 149 ++++++++++++++++++
>  .../python/python3-cryptography_42.0.5.bb     |   1 +
>  .../python3-pyopenssl/CVE-2026-27448.patch    | 124 +++++++++++++++
>  .../python3-pyopenssl/CVE-2026-27459.patch    | 109 +++++++++++++
>  .../python/python3-pyopenssl_24.0.0.bb        |   5 +
>  meta/recipes-extended/timezone/timezone.inc   |   6 +-
>  .../0001-Fix-discarded-const-qualifiers.patch |  85 ++++++++++
>  meta/recipes-kernel/dtc/dtc_1.7.0.bb          |   1 +
>  16 files changed, 565 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0022-gprofng-=
protect-against-standard-library-macros.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.a=
m-do-not-force-Werror.patch
>  create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE=
-2026-26007.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-20=
26-27448.patch
>  create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-20=
26-27459.patch
>  create mode 100644 meta/recipes-kernel/dtc/dtc/0001-Fix-discarded-const-=
qualifiers.patch


--=20
Yoann Congal
Smile ECS


