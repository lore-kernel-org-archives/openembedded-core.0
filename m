Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7788.1794751356800016417
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 06:02:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=FWWWXWLG;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb61185057so7737365e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 06:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794751355; x=1795356155; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aAeFTn6j6tybdXqUkMuL420f4+w4tFogD3Gr7GkD7xI=;
        b=FWWWXWLGsG2xTb1ACeVjv/Mf8dSCumpnlL13BuSC1qEv5tOisKRNmabVCTWIuBJLgk
         gIk3kdQNF+M6UpE8hohaddYP499xnsqTGFO8fFuLY0AMaWD7sYzX5Pp4F/aDMhna4jSK
         hObKOFncLhEXBWmtKyaGDK+rJ7PNbjo9UnO7fvMy56qaudGeQhD6WxrkELNWSYtWRCIH
         AQ0+fjKQ+Qd40VLgr744QMV0cHR6tAcLZK29R2D8yNWjgLr817PE0XrgRUCQRFB6E6lY
         0LEn6VSQPPv8jjpWA+8kzooxsvCEtn5WkX4KGQfaLmyB9Q5nFEG/dI4qX8YFZeJeErJk
         FJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794751355; x=1795356155;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAeFTn6j6tybdXqUkMuL420f4+w4tFogD3Gr7GkD7xI=;
        b=QG488xt/lhGfRnUsJzws0Zx72nmG/671irvPl9on4QG7SRba6uDZ55PUvd+u/Bfq5p
         boH5CPpcZJczP0vQ5zFdccyWpGPF9LjQg/bGPdZLKDdvYC2TQMI2Ns3MKGBWr9xyEF87
         xQjUrxJwNQV5QXx8VKJTWxvy/9eoD1zyPrZTp9/mViyL/WuPm1ksWnraCggb2oRZ0SP0
         CosH51TvF6sSt4XsNJfKl0G/ltJY6y+dBcx8iU3OQTo5rxqkeKskxCP0/txb9V5qyE7s
         M/KSiZb41YmWtRbnbej0UiFMu4OGjacGVarrleSJ2m/fycrUJwORslw8i1hLqX+Le9qy
         FAMA==
X-Forwarded-Encrypted: i=1; AL+hErF27HW6r+050i42/3FSznwb5E2VNS2n9yQOKdsp59kZFrMZ7UkdJuLZHlD7qRzwjfTd4TsxZmfHea18DhTZ4EwX5Q==@lists.openembedded.org
X-Gm-Message-State: APuU4Z908clFk1fPgFCP0Knxayg9PS4Uu4fTsukvRTeVKrnA+my24r6q
	d4v3rJvDq9e0S6LFrgQIUS6hofNOcdtfrj5WgLaYK1WbNX3RPm9S9/OpRDoOgJFaPX0=
X-Gm-Gg: AYBFou2RNVCaTE4WJnkrHhCr1jbVbxU8WmrcLr9guqpYqeXnjqv8C3RbJZHIs3cnCS+
	0DmSnCuROuH8LzjMNsdBl7mK5pbnlWLVtza7l6M7aAf0RZc3t5LSK5NEtmbIliKBwO1D6b/k6nc
	NTE/HluGkiKf2wkECBBOcAIuukgiriaOxNd/nOrzooscp2PmhQhm9b7kego9tXgv1SbUWEs2oGr
	bkAYBNugBQ09eEKYBI4Sq+HIKuKl/a4bAmMleFxT5iwH/VGl5bksy1+YpuuXXmBBq5mHemO9WeQ
	uYQOsrN8Wl1RqIg7dU6gQFfYVYUzymRHK2Uas5mWmpScA4HEdky4dAzVjIZq4J4/Yy+G9nYM30q
	iQosKw1JHrdg2qe/zLerS17pXD7luKd/o1GK8fLOnbmT+T4Jk0P9cKuiO9+a0bhsWvle4qCOt00
	Mf0wNlPDmR+shDvT/XshZutBlDa2MJguuiUQlwfONwYxRkJmryL2VUrmpiFUrXb8BpmxfSoQyDB
	pUol38veaQS8OFXXPaEwxQ0/htd2qNSkCpzwADkdJgXI7Q09nQnhCcXo7xJWZQGTzzWFTelWyHr
	wUGUDC8yqnN9gdWMd4q/3tvHNuY0LCgYNTI3FQh99jjbSatdzDmyOFXXY0Y5GEjMxXLWCerO4hU
	AGiE5OqjXb8yZMTY/
X-Received: by 2002:a05:6000:4a03:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-49c6fd932fcmr16399808f8f.11.1794751354572;
        Sun, 15 Nov 2026 06:02:34 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5ff2be55sm17000697f8f.28.2026.11.15.06.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 06:02:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 15:02:33 +0100
Message-Id: <DMVU99KK0OIS.XC4NZF0E3TR8@smile.fr>
Subject: Re: [OE-core] [PATCH 03/45] acl: upgrade 2.3.2 -> 2.4.0
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Alexander Kanavin" <alex@linutronix.de>
To: <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
 <20260706171701.70536-3-alex.kanavin@gmail.com>
In-Reply-To: <20260706171701.70536-3-alex.kanavin@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 14:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250277

On Mon Jul 6, 2026 at 7:16 PM CEST, Alexander Kanavin via lists.openembedde=
d.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> Backport a patch to tar to avoid name clashes.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...0001-Avoid-acl_-prefix-for-functions.patch | 90 +++++++++++++++++++
>  meta/recipes-extended/tar/tar_1.35.bb         | 22 ++---
>  ...t_uid-fix-memory-wasting-loop-if-use.patch | 49 ----------
>  ...isc.test-Don-t-mix-stdout-and-stderr.patch | 35 --------
>  .../attr/{acl_2.3.2.bb =3D> acl_2.4.0.bb}       |  4 +-
>  5 files changed, 102 insertions(+), 98 deletions(-)
>  create mode 100644 meta/recipes-extended/tar/tar/0001-Avoid-acl_-prefix-=
for-functions.patch
>  delete mode 100644 meta/recipes-support/attr/acl/0001-libmisc-__acl_get_=
uid-fix-memory-wasting-loop-if-use.patch
>  delete mode 100644 meta/recipes-support/attr/acl/0001-test-misc.test-Don=
-t-mix-stdout-and-stderr.patch
>  rename meta/recipes-support/attr/{acl_2.3.2.bb =3D> acl_2.4.0.bb} (90%)

Hello Alex,

I think this upgrade resulted in a silent ptest regression:

Regression report for yocto-6.1_M2 (target master, base yocto-6.1_M1):
https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-6.1_M2/t=
estresults/testresult-regressions-report.txt
|Regression:  runtime_core-image-ptest-acl_qemux86-64_20260609020141
|             runtime_core-image-ptest-acl_qemux86-64_20260723201535
|    Total: 9 new regression(s):
|    9 regression(s) for ptestresult.acl
|        ptestresult.acl.cp.test: PASSED -> No matching test result
|        ptestresult.acl.getfacl-lfs.test: PASSED -> No matching test resul=
t
|        ptestresult.acl.getfacl-noacl.test: PASSED -> No matching test res=
ult
|        ptestresult.acl.getfacl-recursive.test: PASSED -> No matching test=
 result
|        ptestresult.acl.malformed-restore.test: PASSED -> No matching test=
 result
|        ptestresult.acl.misc.test: PASSED -> No matching test result
|        ptestresult.acl.sbits-restore.test: PASSED -> No matching test res=
ult
|        ptestresult.acl.setfacl-X.test: PASSED -> No matching test result
|        ptestresult.acl.utf8-filenames.test: PASSED -> No matching test re=
sult
|    Additionally, 1 new test(s) is/are present

Because upstream commit f55ec6b "Use .run as the filename extension for
"run" test scripts" [0] changed tests filenames but our run-ptest calls:
| for f in *.test; do
|     LD_PRELOAD=3D$(pwd)/libtestlookup.so ./run $f
Which, in case of no file matching "*.test", will call literally "./run
'*.test'" and this succeed for having no failing tests (but no tests at
all).

[0]: https://github.com/sailfishos-mirror/acl/commit/f55ec6b2e6b9094414b41d=
f67bd19cbbfd48e8be (random working mirror)

Regards,
--=20
Yoann Congal
Smile ECS

