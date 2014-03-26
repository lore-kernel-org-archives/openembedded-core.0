Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 67A206F6F0;
	Wed, 26 Mar 2014 20:18:35 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id b15so2092992eek.34
	for <multiple recipients>; Wed, 26 Mar 2014 13:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/GFX/7QSDkICsejiz6WiZF6gudm3KGJ0rZINg8BheE8=;
	b=kBDn9GLPW6FV1Y9x8/KUSruN6oNKzxDT9z19js30qpvKvx6tke40PrdOJgtMO+Fifn
	Sr6wGP6ZgGutwRMDp1xDC8l7zDZ8D6jprrSt8AHNkMCQuWrzgktpS/XFAjCIXShXqrAx
	JhuhhfsdpZMFtTFK/H/KqJqz2hzyErCNKYbtGd7lAZ8tRscHznBshGCT++CMPENIGGmN
	7sp8rWUM0c5NOcDQ/ifpirXxwaOZX4ScwRCVEyUJ2Ug/eET0/IgNze1oLZ7CAXcNP1OG
	iCceOI+CKpj4z3w0mwW2cu8WeuKyx4iFL2uBiE/t3QyW2x/bmzkYa62QnjIipC24d772
	4OwA==
X-Received: by 10.14.115.195 with SMTP id e43mr10434866eeh.76.1395865115428;
	Wed, 26 Mar 2014 13:18:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm49345318eeg.8.2014.03.26.13.18.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 13:18:34 -0700 (PDT)
Date: Wed, 26 Mar 2014 21:18:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Stefan Stanacar <stefanx.stanacar@intel.com>,
	openembedded-core@lists.openembedded.org
Message-ID: <20140326201833.GI3709@jama>
References: <20140311162355.554E95039B@opal>
MIME-Version: 1.0
In-Reply-To: <20140311162355.554E95039B@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Stefan Stanacar : recipes-bsp: Add gummiboot recipe
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
X-List-Received-Date: Wed, 26 Mar 2014 20:18:38 -0000
X-Groupsio-MsgNum: 51673
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4LwthZj+AV2mq5CX"
Content-Disposition: inline

--4LwthZj+AV2mq5CX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2014 at 04:23:55PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 8f95d0598c31fff76e2a58fecb6c96197121a044
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D8f95d0598c31fff76e2a58fecb6c96197121a044
>=20
> Author: Stefan Stanacar <stefanx.stanacar@intel.com>
> Date:   Fri Feb 21 12:17:35 2014 +0200

COMPATIBLE_HOST =3D "(x86_64.*|i.86.*)-linux"

matching with gnu-efi on which it depends?

Right now it causes ugly error in "bitbake world"

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'gnu-efi' (but /home/jenkins/oe/shr-core-branches/s=
hr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.bb DEPEN=
DS on or otherwise requires it)
ERROR: gnu-efi was skipped: incompatible with host arm-oe-linux-gnueabi (no=
t in COMPATIBLE_HOST)
ERROR: Nothing RPROVIDES 'gummiboot-dev' (but /home/jenkins/oe/shr-core-bra=
nches/shr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.b=
b RDEPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'gummiboot-dev'
NOTE: Runtime target 'gummiboot-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gummiboot-dev']
ERROR: Nothing RPROVIDES 'gummiboot' (but /home/jenkins/oe/shr-core-branche=
s/shr-core/openembedded-core/meta/recipes-bsp/gummiboot/gummiboot_git.bb RD=
EPENDS on or otherwise requires it)
ERROR: No eligible RPROVIDERs exist for 'gummiboot'
NOTE: Runtime target 'gummiboot' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gummiboot']


>=20
> recipes-bsp: Add gummiboot recipe
>=20
> gummiboot is a simple UEFI boot manager.
>=20
> Recipe imported from meta-intel with these changes:
>  - drop PR and update configure options
>  - upgraded to latest version
>=20
> A couple of notes:
>  - If you wish you can install the gummiboot package on the target and
> use 'gummiboot install' to add the payload to the ESP (see gummiboot --he=
lp,
> just make sure the ESP partition has the boot flag on as gummiboot won't =
accept it
> otherwise). However the point of this recipe is to be used by bootimg.bbc=
lass and
> generate images with gummiboot instead of grub-efi.
>  - You need a kernel which has CONFIG_EFI_STUB=3Dy at least
>  - The default linux-yocto kernel config does not enable that, easiest way
> to enable is to build with KERNEL_FEATURES_append =3D " cfg/efi-ext" in l=
ocal.conf
>=20
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-bsp/gummiboot/gummiboot_git.bb | 25 +++++++++++++++++++++++=
++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/gummiboot/gummiboot_git.bb b/meta/recipes-b=
sp/gummiboot/gummiboot_git.bb
> new file mode 100644
> index 0000000..5868a23
> --- /dev/null
> +++ b/meta/recipes-bsp/gummiboot/gummiboot_git.bb
> @@ -0,0 +1,25 @@
> +SUMMARY =3D "Gummiboot is a simple UEFI boot manager which executes conf=
igured EFI images."
> +HOMEPAGE =3D "http://freedesktop.org/wiki/Software/gummiboot"
> +
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b3645=
16c"
> +
> +DEPENDS =3D "gnu-efi util-linux"
> +
> +inherit autotools
> +inherit deploy
> +
> +PV =3D "43+git${SRCPV}"
> +SRCREV =3D "4062c51075ba054d4949c714fe06123f9ad3097d"
> +SRC_URI =3D "git://anongit.freedesktop.org/gummiboot"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECONF =3D "--disable-manpages --with-efi-includedir=3D${STAGING_I=
NCDIR} \
> +                --with-efi-ldsdir=3D${STAGING_LIBDIR} \
> +                --with-efi-libdir=3D${STAGING_LIBDIR}"
> +
> +do_deploy () {
> +        install ${B}/gummiboot*.efi ${DEPLOYDIR}
> +}
> +addtask deploy before do_build after do_compile
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4LwthZj+AV2mq5CX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMzNhkACgkQN1Ujt2V2gBwDEQCgid0zcCCRLeujzGckW+RhzUu+
AUcAn0k1YuTIuCr2nikdXwk2uBN5hS1z
=juie
-----END PGP SIGNATURE-----

--4LwthZj+AV2mq5CX--
