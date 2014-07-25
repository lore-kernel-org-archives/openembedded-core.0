Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id DDDCD70684
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 13:21:42 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so949923wib.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 06:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Jr2tHIbQHYkSoChURmHJBA0orPPX6xN86O9htahfOLY=;
	b=ihqYkpU4AFJiW328UEQp1YuvgadzaWleCabRxy1Y+CLUXv5+sS8v/Pvkbld5o9oH7X
	PLiSV6T8wsitNBq1EoRzMfPk/e2X52mueVCG5Qp8LYdxwwyKwVFOcEkghEAfTwlKQtz+
	WYiLzr26J/kj1wJBFU85dA3AlHy/qI8QtPGCsQfnGQVBf9R/JnjURE69E5luRP/p8oAD
	D2J8Ugapx+ANngVNFV1ClIIWQttiIhlhMhTGhfh8Juo/2ybExPuEctnIml7+hYwBoMaf
	8UN61+7LIP1Ftv8kcLl50jiDHXckL7I30ZQ/d9xKS+cW8euuqyxWvZ+DSU1DAvit/ZxJ
	Znng==
X-Received: by 10.194.238.6 with SMTP id vg6mr21484874wjc.24.1406294500442;
	Fri, 25 Jul 2014 06:21:40 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w10sm5891988wie.22.2014.07.25.06.21.38 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Jul 2014 06:21:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Jul 2014 15:21:58 +0200
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140725132158.GU2492@jama>
References: <cover.1406234258.git.bruce.ashfield@windriver.com>
	<48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <48ca1900cd8400421948c4a2c33c722b979f3292.1406234258.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] lttng-modules: update to 2.5.0
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
X-List-Received-Date: Fri, 25 Jul 2014 13:21:43 -0000
X-Groupsio-MsgNum: 55563
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nynJ8Zgemp8dhn89"
Content-Disposition: inline

--nynJ8Zgemp8dhn89
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2014 at 04:41:48PM -0400, Bruce Ashfield wrote:
> During the uprev of the yocto kernel to 3.16, lttng-modules failed to bui=
ld.
> To grab the latest stable content, we update to 2.5.0, and add two patches
> to also make it build against 3.16+.
>=20
> We also drop the older 2.3.3 lttng-modules, since it is no longer required
> to support ARM builds.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...compaction-instrumentation-to-3.16-kernel.patch | 83 ++++++++++++++++=
++++++
>  ...ate-vmscan-instrumentation-to-3.16-kernel.patch | 70 ++++++++++++++++=
++
>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   | 36 ----------
>  ...tng-modules_2.4.1.bb =3D> lttng-modules_2.5.0.bb} |  7 +-
>  4 files changed, 157 insertions(+), 39 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-compac=
tion-instrumentation-to-3.16-kernel.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/Update-vmscan=
-instrumentation-to-3.16-kernel.patch
>  delete mode 100644 meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
>  rename meta/recipes-kernel/lttng/{lttng-modules_2.4.1.bb =3D> lttng-modu=
les_2.5.0.bb} (85%)
>=20

=2E..

> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.5.0.bb
> similarity index 85%
> rename from meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> rename to meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> index 5e05ffc69853..5a99a5adae8b 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.4.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb
> @@ -10,14 +10,15 @@ DEPENDS =3D "virtual/kernel"

Is the LICENSE =3D "LGPLv2.1 & GPLv2" correct?

git/LICENSE says:

* MIT-style license

These files are licensed under an MIT-style license. See mit-license.txt
for details.

lib/prio_heap/lttng_prio_heap.h
lib/prio_heap/lttng_prio_heap.c
lib/bitfield.h


> =20
>  inherit module
> =20
> -SRCREV =3D "a0383def517e3aebbbcebae61fe2bcfb50d31e71"
> -PV =3D "2.4.1"
> +SRCREV =3D "789fd1d06d07aeb9a403bdce1b3318560cfc6eca"
> =20
>  # lttng currently blacklists arm with gcc-4.8
>  COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|aarch64|mips).*-linux'
> =20
> -SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.4 \
> +SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.5 \
>             file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> +           file://Update-compaction-instrumentation-to-3.16-kernel.patch=
 \
> +           file://Update-vmscan-instrumentation-to-3.16-kernel.patch \
>             "
> =20
>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nynJ8Zgemp8dhn89
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPSWfYACgkQN1Ujt2V2gBwjeQCdF73exoNpwsvRnCGbJhq8SUDe
tGIAn0EHkR6Nh8SSFiT0ne+aZKH/rjkO
=ub4l
-----END PGP SIGNATURE-----

--nynJ8Zgemp8dhn89--
