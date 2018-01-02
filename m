Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 03BF96076F;
	Tue,  2 Jan 2018 19:15:58 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id y9so7340902wrb.5;
	Tue, 02 Jan 2018 11:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=H2aUebNrKorh43d/hdWxkcwSzsIHwmStTa5XoKPRi0I=;
	b=paRdwLDcmlXGTxGU6Ls5taV3qbXEFT7+G8wwljHIkpEtUaLA81Nb83V+/L3tTJuJuE
	p9AiXcbvYQDjpWgs4bRar6A9r+XwYAeJaIk5rW6eYgrhhCr8T3CuK67KOQzCM8OQGGdC
	a6OYDgBsobb5TC/iptKw3qISVdrfUVaY21K6rpVPbhWZ7QV7S242I/xbrzx25WM5k9f3
	aLA1yOlCRfW1W1NnIUJymsWz/zNPV0bqQVFMlujqgdbSLSXWgDNYZfHhCN2PsjTF/y8L
	jlnXUZyzrAzq95+v2LTcCT5BRfazldKJEcBOmN81tbv5w1Pc/rD91VzBRUbg/wSjO1hR
	t7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=H2aUebNrKorh43d/hdWxkcwSzsIHwmStTa5XoKPRi0I=;
	b=cdycxvRZ3Bv+EiwX/6TC/VYYQ4PoogyCrsJm6MBDvoohoS3sncVAKN4CBYTL9A/Dbs
	ZTVt1RZaVXnoIvY0uenmS64HwkZLfCySpSf9fY6G1cElq8nwBI7i7c5tHYOHlbYGwI4Y
	SzjuggnG+4zcylatiBwlJgyCwvanYx313aHWYaszguQWwGTC1W9GRa/E/gUZRxCiQy+i
	kfFnR97jAYUKlV8T3RDwMmsFwAI9KIukfgrUcx5idT7hwPl9re/tbKeBKKzU0dYXbZ+M
	aGPHdTR5elD53UvQ8M72Ehv4dJvr9MVVD3yfN9tLaA/z5rk5Wbw77jx33MEQe6SOxN09
	VPjw==
X-Gm-Message-State: AKGB3mJ1cOaxpPbPF4t9MM/GWzOuWoTnRG+kIUOhyYg185kPa1rkbTPy
	9IOamc3sZMa69/6Jct0DvCcrVw==
X-Google-Smtp-Source: ACJfBovGNHdShGWVG3Gt+S+PzOroi9WAGIPEs98ocsGdqVtVDz1875LSEPaL79sdyYBD8Zl0chj/mg==
X-Received: by 10.223.154.241 with SMTP id a104mr42471075wrc.48.1514920559398; 
	Tue, 02 Jan 2018 11:15:59 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	i17sm29976428wrf.71.2018.01.02.11.15.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:15:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 2 Jan 2018 20:15:59 +0100
To: openembedded-core@lists.openembedded.org,
	Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <20180102191559.GA4180@localhost>
References: <151491408002.12536.9555639223209873731@git.openembedded.org>
	<20180102172800.BCD4523561F@git.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20180102172800.BCD4523561F@git.openembedded.org>
User-Agent: Mutt/1.9.2 (2017-12-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 13/44: u-boot-fw-utils: Fix broken makefile in v2017.11.
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
X-List-Received-Date: Tue, 02 Jan 2018 19:15:59 -0000
X-Groupsio-MsgNum: 106577
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 02, 2018 at 05:28:13PM +0000, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
>=20
> rpurdie pushed a commit to branch master
> in repository openembedded-core.

Looks like older version of this patch was merged.

This version https://patchwork.openembedded.org/patch/146668/

adds the Upstream-Status from the commit message to the .patch file
where it belongs.

> commit bb6a45bc7e122c61386d0657e7c97895d1697bd7
> Author: Kristian Amlie <kristian.amlie@northern.tech>
> AuthorDate: Wed Dec 13 15:03:27 2017 +0100
>=20
>     u-boot-fw-utils: Fix broken makefile in v2017.11.
>    =20
>     See the patch for details. This patch has already been applied
>     upstream, but we need it for v2017.11.
>    =20
>     Upstream-Status: Accepted [http://git.denx.de/?p=3Du-boot.git;a=3Dcom=
mit;h=3Dded84f90a1066eef5f34daa4539273de64f7b811]
>    =20
>     Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../u-boot/files/v2017.11-fw-utils-build-fix.patch | 37 ++++++++++++++++=
++++++
>  meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc  |  1 +
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.pa=
tch b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
> new file mode 100644
> index 0000000..fe89735
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/v2017.11-fw-utils-build-fix.patch
> @@ -0,0 +1,37 @@
> +From ded84f90a1066eef5f34daa4539273de64f7b811 Mon Sep 17 00:00:00 2001
> +From: Stefan Agner <stefan.agner@toradex.com>
> +Date: Tue, 14 Nov 2017 15:47:18 +0100
> +Subject: [PATCH 1/1] envtools: make sure version/timestamp header file a=
re
> + available
> +
> +With commit 84d46e7e8948 ("tools: env: allow to print U-Boot version")
> +the fw_env utilities need the version.h header file. Building only
> +the envtools in a pristine build directory will fail due to missing
> +header files.
> +
> +Make sure the header files are a dependency of the envtools target.
> +
> +Fixes: 84d46e7e8948 ("tools: env: allow to print U-Boot version")
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> +Tested-by: Peter Robinson <pbrobinson@gmail.com>
> +Reviewed-by: Simon Glass <sjg@chromium.org>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 61fd973..f8c66a2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1447,7 +1447,7 @@ checkarmreloc: u-boot
> + 		false; \
> + 	fi
> +=20
> +-envtools: scripts_basic
> ++envtools: scripts_basic $(version_h) $(timestamp_h)
> + 	$(Q)$(MAKE) $(build)=3Dtools/env
> +=20
> + tools-only: scripts_basic $(version_h) $(timestamp_h)
> +--=20
> +2.7.4
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc b/meta/rec=
ipes-bsp/u-boot/u-boot-common_2017.11.inc
> index bfdf1a0..65f1228 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.11.inc
> @@ -12,6 +12,7 @@ SRCREV =3D "c253573f3e269fd9a24ee6684d87dd91106018a5"
>  SRC_URI =3D "git://git.denx.de/u-boot.git \
>      file://MPC8315ERDB-enable-DHCP.patch \
>      file://10m50-update-device-tree.patch \
> +    file://v2017.11-fw-utils-build-fix.patch \
>  "
> =20
>  S =3D "${WORKDIR}/git"
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWkvabgAKCRA3VSO3ZXaA
HF0RAJ9HWDQAtwgI0nNyuFEIZsjD6Cxd7wCgsyxhqaVpYxZtwkXD+fVTb/K0V3o=
=qS/m
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
