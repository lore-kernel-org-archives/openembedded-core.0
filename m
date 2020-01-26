Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C043B6C132
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 09:36:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b6so7348939wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2020 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=M8aCWdrak/C4T04V9VYjlHtjC+TCxKqSP5tqVPvE2g0=;
	b=FnnV7t9Z+7xagrsewTFGZXFXCe6ddRlyEWJW5pJJgSQjPNkMVO1MWpMYRSPBKsnQcc
	8hcvBKCrzOwAb5JbEynxM9OjVSH0NvGqKqqljnSBREhCrOmcl+zfPCnvczPV6EYwW6ZZ
	62+XuvEx3L0c7Q23V+GgbmJyIDcl9/15/Xf67EdKxagBqMygAVT5bVrR9egt+FKg7jH1
	/B2bsKcAImVCBvvtow+KtH/UjP4A/ZyNFP2z9St7TxnaGhKpkyoM4h3Kz1lggqKTkb2n
	AJinH6hPRV/HrU0e+VOXdZOoHf6fyzfaf3Acsw2UycaZbJnwG2/A9TdfvXHuhMzHWLwj
	db3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=M8aCWdrak/C4T04V9VYjlHtjC+TCxKqSP5tqVPvE2g0=;
	b=mQRYxPJMWgelCsF8S4wD2nt0zx+1BMEVdiDbhNgnLIYRM7v3RnSgx8xbVX4gzYttUa
	pCSyybmcYrutEFk2nd58kV52L6DMBMc0Ld+CUeYo8vBY2k1WDN+bHEN7/jHAs593Vr9V
	eU/QkqFAPre8oN2xooQGX/MwdyW6heWfoHbDecIu8Z++hUCgOfeO2cFbE/Un6zQ/wLGK
	5BbRZZv5rWXh9thRgIfXoSka0o4MHuSWmK3HYdw+J+puDJFcbt1k/39AfHEQ1G8/iMmj
	IwjbSuhwmNJU/EkGst3Vfad7nL7aGiys3T5zTto3hbEbYQLebt28HgJo6xAnCvlJDm6w
	1d0Q==
X-Gm-Message-State: APjAAAWq6i/+p5/n4lITh8Z01D7twuPV6Gik0mg+qXWD7CpqgO1Ynt/c
	f6iNyHKuao3GYF8ZbzqaZTs=
X-Google-Smtp-Source: APXvYqxeDIjhUsoe/aOseTDMSNO7kRvpdPjzly8UD3fyz+wkxLvfFqghj/jj4xEXZQ/2LD940gUrcw==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr14277002wrw.391.1580031366271;
	Sun, 26 Jan 2020 01:36:06 -0800 (PST)
Received: from localhost ([109.238.218.228])
	by smtp.gmail.com with ESMTPSA id 21sm4573849wmo.8.2020.01.26.01.36.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 01:36:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 26 Jan 2020 10:36:04 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200126093604.s4teivajlr5xlqg6@jama>
References: <cover.1579809439.git.raj.khem@gmail.com>
	<1fe572e7afe84276d14a22eb46b35ceadcdd91aa.1579809439.git.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1fe572e7afe84276d14a22eb46b35ceadcdd91aa.1579809439.git.raj.khem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jan 2020 09:36:06 -0000
X-Groupsio-MsgNum: 134162
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ge7dbkjzgws56bz2"
Content-Disposition: inline

--ge7dbkjzgws56bz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 12:00:40PM -0800, Khem Raj wrote:
> Use NSS_USE_ARM_HW_CRYPTO to detect USE_ARM_GCM, since there are
> dependent, without this we control the crypto code function inclusion in
> build but do not control the call sites, which can result in undefined
> symbols e.g.
>=20
> Linux_SINGLE_SHLIB/gcm.o: in function `gcmHash_InitContext':
> /usr/src/debug/nss/3.49.1-r0/nss-3.49.1/nss/lib/freebl/gcm.c:112: undefin=
ed reference to `gcm_HashInit_hw'

Fixes the errors I'm seeing since nss upgrade, thanks!

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...figure-option-to-disable-ARM-HW-cryp.patch | 25 ++++++++++++++++---
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-opt=
ion-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl=
-add-a-configure-option-to-disable-ARM-HW-cryp.patch
> index fe29d19882..803c06b218 100644
> --- a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> +++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-=
disable-ARM-HW-cryp.patch
> @@ -12,20 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
>   nss/lib/freebl/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
> =20
> -diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
> -index 06506f0..a8b015d 100644
>  --- a/nss/lib/freebl/Makefile
>  +++ b/nss/lib/freebl/Makefile
> -@@ -125,6 +125,8 @@ else
> +@@ -125,6 +125,9 @@ else
>           DEFINES +=3D -DNSS_X86
>   endif
>   endif
>  +
>  +ifdef NSS_USE_ARM_HW_CRYPTO
> ++    DEFINES +=3D -DNSS_USE_ARM_HW_CRYPTO
>   ifeq ($(CPU_ARCH),aarch64)
>       DEFINES +=3D -DUSE_HW_AES
>       EXTRA_SRCS +=3D aes-armv8.c gcm-aarch64.c
> -@@ -145,6 +147,7 @@ ifeq ($(CPU_ARCH),arm)
> +@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
>           endif
>       endif
>   endif
> @@ -33,3 +32,21 @@ index 06506f0..a8b015d 100644
>  =20
>   ifeq ($(OS_TARGET),OSF1)
>       DEFINES +=3D -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
> +--- a/nss/lib/freebl/gcm.c
> ++++ b/nss/lib/freebl/gcm.c
> +@@ -17,6 +17,7 @@
> +=20
> + #include <limits.h>
> +=20
> ++#ifdef NSS_USE_ARM_HW_CRYPTO
> + /* old gcc doesn't support some poly64x2_t intrinsic */
> + #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
> +     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
> +@@ -28,6 +29,7 @@
> +  * that compiler uses -mfpu=3Dneon only. */
> + #define USE_ARM_GCM
> + #endif
> ++#endif
> +=20
> + /* Forward declarations */
> + SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
> --=20
> 2.25.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--ge7dbkjzgws56bz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXi1dgwAKCRA3VSO3ZXaA
HBwlAKCdUNbNg2y3QrM6CBIUm4LguYrsWwCfcTSe4B8WfhuwkIxaP2RfULdZGzE=
=mR7U
-----END PGP SIGNATURE-----

--ge7dbkjzgws56bz2--
