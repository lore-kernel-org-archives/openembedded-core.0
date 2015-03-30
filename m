Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id C50A3736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 18:48:57 +0000 (UTC)
Received: by wibg7 with SMTP id g7so113396793wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 11:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QqZOMmrbethvIuijMghNXhzhcTLUrqLA2qd/1QIzfrA=;
	b=iaOZtsnM0eVlqkXClEMFA/CTXzutGPxzDcMf3v1QIv/qse96CZeNYYnKAJ23vGoei8
	FyaKmqOPYvPsUjUsBcjHw/ay0pAg8E53y9UgXVUVFmPyiwpp84QzkVD8Uba5ApbfMws1
	cB1/HvNCaytcbjZSCk2IudKs/NG6vw4PMlThixbN2L4LS+CrmicQjBIC3yiRXiL/v9I5
	aLLYuZEW0Bzf7/3Zc+Ap6wmDplbfwXtO48F9UwAXDLgPlTTXAzPBrtN/FyHGPBtITpEe
	fm7YhjuyVzKIY0eUGZT0KMkwKXSLhoRvSDBAc32lbdRneCoIGYtt+aODF+E/5tbpIYWM
	76qA==
X-Received: by 10.180.76.148 with SMTP id k20mr25435343wiw.71.1427741338704;
	Mon, 30 Mar 2015 11:48:58 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gt4sm16872174wib.21.2015.03.30.11.48.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Mar 2015 11:48:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 20:49:20 +0200
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20150330184920.GE14928@jama>
References: <cover.1427729801.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1427729801.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/17] meta-core Dizzy next
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
X-List-Received-Date: Mon, 30 Mar 2015 18:48:59 -0000
X-Groupsio-MsgNum: 63846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qOrJKOH36bD5yhNe"
Content-Disposition: inline

--qOrJKOH36bD5yhNe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2015 at 09:41:05AM -0700, Armin Kuster wrote:
> please consider these changes for Dizzy next
>=20
> The following changes since commit ec75238f6cc2d2d8d40e0268f6d2acc070cbe9=
a4:
>=20
>   Revert "file: Update CVE patch to ensure file gets built correctly" (20=
15-03-28 10:56:50 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib akuster/dizzy-next
>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dakuster/dizzy-next
>=20
> An=EDbal Lim=F3n (1):
>   files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in
>     environment setup file
>=20
> Bian Naimeng (1):
>   gcc-4.9: fix bug of 0056-top-level-reorder_gcc-bug-61144.patch
>=20
> Bruce Ashfield (3):
>   linux-yocto/3.10: update to v3.10.65
>   linux-yocto/3.14: update to 3.14.29
>   linux-yocto/3.17: update to v3.17.8
>=20
> Chen Qi (1):
>   package_manager.py: fix rootfs failure with multilib enabled
>=20
> Enrico Scholz (1):
>   serf: fix 'ccache' builds
>=20
> Martin Jansa (2):
>   xorg-driver: add x11 to required DISTRO_FEATURES
>   piglit: add x11 to required DISTRO_FEATURES

I don't feel very strongly about these, but without remaining
required DISTRO_FEATURES patches it doesn't buy much, maybe stage them
for a bit longer and then backport all of them in some next batch?

> Patrick Ohly (2):
>   binconfig-disabled: try harder to prevent usage of config scripts
>   binconfig-disabled: install config scripts in sysroot

IIRC this was breaking some recipes in other layers, I'm not sure if
it's worth it.

> Richard Purdie (1):
>   gcc-target: Don't install target gcc libdir files
>=20
> Robert Yang (2):
>   dpkg: add perl to RDEPENDS
>   which 2.18: fix SRC_URI
>=20
> Ross Burton (2):
>   bitbake: tests/data: add test for incorrect remove behaviour
>   bitbake: data_smart: split expanded removal values when handling
>     _remove
>=20
> Saul Wold (1):
>   linux-yocto-tiny_3.17: Update to actually use 3.17 git repo
>=20
>  bitbake/lib/bb/data_smart.py                       |  3 +-
>  bitbake/lib/bb/tests/data.py                       |  7 ++++
>  meta/classes/binconfig-disabled.bbclass            | 13 +++++++
>  meta/files/toolchain-shar-template.sh              |  1 +
>  meta/lib/oe/package_manager.py                     |  5 ++-
>  meta/recipes-devtools/dpkg/dpkg.inc                |  2 +-
>  .../0056-top-level-reorder_gcc-bug-61144.patch     | 42 ++++++++++------=
------
>  meta/recipes-devtools/gcc/gcc-target.inc           |  9 +++++
>  meta/recipes-extended/which/which_2.18.bb          |  2 +-
>  meta/recipes-graphics/piglit/piglit_git.bb         |  4 ++-
>  .../xorg-driver/xorg-driver-common.inc             |  4 ++-
>  meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb |  8 ++---
>  meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_3.17.bb      | 18 +++++-----
>  meta/recipes-support/serf/serf/env.patch           | 28 +++++++++++++++
>  meta/recipes-support/serf/serf_1.3.7.bb            |  8 ++---
>  21 files changed, 139 insertions(+), 79 deletions(-)
>  create mode 100644 meta/recipes-support/serf/serf/env.patch
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qOrJKOH36bD5yhNe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUZmrAACgkQN1Ujt2V2gBwt5wCgthKGnAetkGPlhyAk0XhUWfTA
NS0AoLAjc2ShUjXNz9Yn+kb+dwRi12Gy
=pqKd
-----END PGP SIGNATURE-----

--qOrJKOH36bD5yhNe--
