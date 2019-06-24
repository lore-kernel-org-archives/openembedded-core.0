Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C71507E3F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 18:14:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r16so14889664wrl.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 11:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cszVpk8gknAVesihAw6sL/OFDKkCLMM4WBHpczjzOUc=;
	b=LMIF3uaRneB3wnng9GZfBaIFHT8xUgVR8J+6CvRqSBkwUQG7pootw19ef10uou+2Hp
	QFYwmwqGDYiQSr+JKWUY3OwVcbWbHGfGqHdmFHX2kr5eK4TI7IC9czw6RMQDYQfrk3Gm
	yiqZLiVT+uU0WeDbdz/gjv8h24u9eWFzzPSerzdpxA891bAMk5QtZ5dDZuR3YeafUhl5
	126iYREamz0cqovQ3J4lvaQs1+KrlkfEqZZU/wnEOTpaVD0pfoss2UjAuy4oKTyoOufK
	SlGnQ3I19rJCiVCA3W8WgHZo2bCa+DDHwxX/+3HUYome5irtv1zS5G7cNRueHNFe2k/C
	Ng1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cszVpk8gknAVesihAw6sL/OFDKkCLMM4WBHpczjzOUc=;
	b=o8UiPbtXvoCuSdPmW9vJUjlgxVE+VkI8l4B6xrZc7FZD80QFGgor7q1h89E+NK/L7A
	7o+S9mNsm3PDjGt0dtaCORXnqfPgH9mo+qgEPkZwYR0ApHEKXUv/+WPliiqMobAtN+4D
	DUpuPzHoSFDee5DXlw3dpZx/DrVGN+BZBEGc5r/oOB1xrvNopTO8nG+qTjWIlhXRa2aY
	6MpOXKUXcTlz8s5vOSatGl5bwlYJhTjl2Hw0FAKFsRWQCUYle7lRkgEHcKxcw31A4SpM
	EUDzCXNpfHPYHGmoZLq/6XPpGaym38ZQdOtAsqGFnWeBMzLsIxx6tFvowRw76B/FD6ca
	u+/w==
X-Gm-Message-State: APjAAAVr7m6NpHIyBVC+GdKB/zlZFXCrGSWl1ApncMrJX/Lk/hzPCsTg
	zUt4uoZQPdj2/jMmsRfgiVg=
X-Google-Smtp-Source: APXvYqzseaY/aibCE4/5R3idQE43oJJKKj/q8lCtlpJ7IFWRQNTjxXC9/ir+02pCnA0FdEwUQmiTfw==
X-Received: by 2002:adf:efcb:: with SMTP id i11mr10259483wrp.188.1561400054458;
	Mon, 24 Jun 2019 11:14:14 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t14sm8620785wrr.33.2019.06.24.11.14.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 11:14:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 24 Jun 2019 20:14:15 +0200
To: bruce.ashfield@gmail.com
Message-ID: <20190624181415.GA1509@jama>
References: <cover.1561379933.git.bruce.ashfield@gmail.com>
	<d3d3d374e985ccfe061a986d2735791476b24511.1561379933.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
In-Reply-To: <d3d3d374e985ccfe061a986d2735791476b24511.1561379933.git.bruce.ashfield@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/5.0: make scsci-debug include scsci core configs
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
X-List-Received-Date: Mon, 24 Jun 2019 18:14:14 -0000
X-Groupsio-MsgNum: 126176
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline

--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2019 at 08:44:42AM -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Updating the scsci-debug fragment to include the core scsci config
> options. This allows standalone use of the fragment, since all
> supporting options will be enabled simply by including the top
> level config in a BSP.
>=20
> This also removes a configuration warning on qemuarm, since we
> will no longer have missing / unavailable options during the
> config audit.

4 typos in commit summary and commit message scsci should probably be
scsi, I didn't check the commit in the meta repository, maybe more
scsci's there :).

> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_5.0.bb
> index c5bd342d5b..35f2350d52 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -12,7 +12,7 @@ python () {
>  }
> =20
>  SRCREV_machine ?=3D "9c1e84c9b81b6bf1df55f26f2e0517266c37f7eb"
> -SRCREV_meta ?=3D "97eac3146504a2348543b8b8859f44a7b8f0d590"
> +SRCREV_meta ?=3D "eb6ef084f987441359145c41cadcbdd768eeb012"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-5.0;destsuffix=3D${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_5.0.bb
> index d6e45c69c0..96cfb3dcd1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
>  SRCREV_machine_qemuarm ?=3D "fabee455f397ba8054f35a3ad5f2250bbad93bef"
>  SRCREV_machine ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> -SRCREV_meta ?=3D "97eac3146504a2348543b8b8859f44a7b8f0d590"
> +SRCREV_meta ?=3D "eb6ef084f987441359145c41cadcbdd768eeb012"
> =20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-=
kernel/linux/linux-yocto_5.0.bb
> index 5bc2d54916..d4d30853f0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?=3D "00638cdd8f92869a0f89ebe328=
9fdbd856ba9458"
>  SRCREV_machine_qemux86-64 ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
>  SRCREV_machine_qemumips64 ?=3D "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
>  SRCREV_machine ?=3D "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> -SRCREV_meta ?=3D "97eac3146504a2348543b8b8859f44a7b8f0d590"
> +SRCREV_meta ?=3D "eb6ef084f987441359145c41cadcbdd768eeb012"
> =20
>  # remap qemuarm to qemuarma15 for the 5.0 kernel
>  # KMACHINE_qemuarm ?=3D "qemuarma15"
> --=20
> 2.19.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXRES9gAKCRA3VSO3ZXaA
HNI5AKCFL1DoWeL0P6RVcib3OoprO7Rj5QCfWzzgat+743k5gGCpEXYb8OtLC+g=
=l5fq
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
