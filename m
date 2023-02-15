Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E40C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 17:29:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.21593.1676482156819508947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 09:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A9WtwqdQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so2095814wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 09:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMsKSPbObYlF0hKCC99GA5Vx7dqlsWnbm3W/GDEc0jI=;
        b=A9WtwqdQztRYicGVTJ++b9zHRA2slUX0egzZvOREqndYyRDO3ixjlsqQNX64oeJPSB
         t+9MyZIAgHzCWMLPRNKHmWNIIGEDFdfo/ZXbnb0MxfAjGfL9nP8RwodT/Yt0hR06x5XZ
         tRp3Z7ZnK+6XsUk+6nFq13tOM65pKhGD+Tgwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMsKSPbObYlF0hKCC99GA5Vx7dqlsWnbm3W/GDEc0jI=;
        b=i8BCfpDBrXDy7c7Xu4Lei7AICgqwQTlZ1kM8xrf2CW2chFyEw2V4O44WYK+Jr8MjD4
         WiCdCJQqVk2OexOHT1zOYpJSe8kD2CRgudi45HVJZDN3zxsJ2HVx6lMKrXoSA4dUxUjN
         qYyOuRQr8frTbqzQ6yAum5jFzjFM8K7B8xYtawVaDQ42IA29IZJVDkAANhp2j9QOV+5/
         39KlRFe8unRktH2+VKVqtQG8BUShf8yEArpYduR//UGq0YrhzNgWJsfnVqC++5dTRtfZ
         hasYuZw57JaSmreTMWlUZN8lLyiUQ4CGG+XkbYWeVDFn4MmxVuqpVjYU/ZGBU8uW6l6n
         r6Mg==
X-Gm-Message-State: AO0yUKX/RdFJZ1EeqojP80dnR+AMMFhae1KeYNS6/HLr4jhiMTep94Uc
	q8UKs7OZjf5HMKLp1giN0A4Brg==
X-Google-Smtp-Source: AK7set+tJcfrnZ/NfpR09UJtoGf+maReo3r5lKvoJQ0BkoMfmDe8/sLWh9W3HXJgfYS8V2W18v49tw==
X-Received: by 2002:a05:600c:2b46:b0:3df:f85a:472f with SMTP id e6-20020a05600c2b4600b003dff85a472fmr2759055wmf.13.1676482155222;
        Wed, 15 Feb 2023 09:29:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fcb8:24dc:acf7:61c1? ([2001:8b0:aba:5f3c:fcb8:24dc:acf7:61c1])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c2e8800b003dc3f195abesm2586984wmn.39.2023.02.15.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 09:29:14 -0800 (PST)
Message-ID: <a9578e7702bd71a6ec9f771a353ae9f13b39d04e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] libssh2: Update patch to apply and fix
 malformed Upstream-Status
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, changqing.li@windriver.com
Date: Wed, 15 Feb 2023 17:29:14 +0000
In-Reply-To: <20230215171832.635085-1-Martin.Jansa@gmail.com>
References: <20230215171832.635085-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 17:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177208

On Wed, 2023-02-15 at 18:18 +0100, Martin Jansa wrote:
> * I've noticed this, because patchreview.py reports Malformed
>   Upstream-Status in this one now, but the QA check in insane.bbclass
>   wasn't reporting it before
>=20
> * the reason why insane.bbclass doesn't report it is because:
>   SRC_URI:append:ptest =3D " file://0001-Don-t-let-host-enviroment-to-dec=
ide-if-a-test-is-bui.patch"
>   doesn't work and probably never did as "ptest" is not an override
>   and patch-status-core checks only the .patch files which are really
>   in SRC_URI.
>=20
> * I've added it directly to SRC_URI and it also didn't apply:
>   http://errors.yoctoproject.org/Errors/Details/689955/
>   as the "endif" at the end was removed in 1.10.0 version:
>   https://github.com/libssh2/libssh2/commit/ecd6a74e44562797a1e92186ad4a4=
02c5641720e#diff-32103f666ff2fb42b025a47ccf1b959bbcc6db89f217e5943b1de73c81=
a4f9db
>=20
>   after updating the patch to apply I got expected patch-status-core fail=
ure:
>   http://errors.yoctoproject.org/Errors/Details/689956/
>   ERROR: QA Issue: Malformed Upstream-Status in patch
>   TOPDIR/openembedded-core/meta/recipes-support/libssh2/files/0001-Don-t-=
let-host-enviroment-to-decide-if-a-test-is-bui.patch
>   Please correct according to https://www.openembedded.org/wiki/Commit_Pa=
tch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status :
>   Upstream-Status: Inappropriate[oe specific] [patch-status-core]
>=20
> * so the mystery is solved, but what should be do with this never-used
>   patch, I think we should just delete it together with
>   SRC_URI:append:ptest, but please Changqing Li confirm it's not needed
>=20
> * it was originally added by Changqing Li in meta-oe with:
>   https://git.openembedded.org/meta-openembedded/commit/?id=3Dd7aa7173405=
c3b36235af736cd31dbe110708787
>   then imported to oe-core by Randy MacLeod with:
>   https://git.openembedded.org/openembedded-core/commit/?id=3D57df134b1be=
56a688f41851e5ff014dd859c0bc3
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...nviroment-to-decide-if-a-test-is-bui.patch | 22 ++++++-------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-envir=
oment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files=
/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
> index b1204e49eb..e0000b2658 100644
> --- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-t=
o-decide-if-a-test-is-bui.patch
> +++ b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-t=
o-decide-if-a-test-is-bui.patch
> @@ -1,24 +1,23 @@
> -From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
> -From: Your Name <you@example.com>
> +From 7ffa1773be8d262bed0f5c8bdcb4dd8f906de095 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
>  Date: Mon, 28 Dec 2020 02:08:03 +0000
>  Subject: [PATCH] Don't let host enviroment to decide if a test is build
> =20
>  test ssh2.sh need sshd, for cross compile, we need it on target, so
>  don't use SSHD on host to decide weither to build a test
> =20
> -Upstream-Status: Inappropriate[oe specific]
> +Upstream-Status: Inappropriate [oe specific]
> =20
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>

The patch is to fix ssh2.sh as a test. The test was disabled here:

https://git.yoctoproject.org/poky/commit/meta/recipes-support/libssh2?id=3D=
af067d427fc1000c2dcce84c5578ea26f9048208

referencing:

https://github.com/libssh2/libssh2/issues/630

which is now fixed.

The autobuilder doesn't currently run the test:

https://autobuilder.yocto.io/pub/non-release/20230215-12/testresults/qemux8=
6-64-ptest/libssh2.log

I don't know if the test still needs the patch to fix it.

Cheers,

Richard

