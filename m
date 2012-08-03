Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SxHSj-0001gR-6E
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 14:58:41 +0200
Received: by weyr6 with SMTP id r6so367227wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2012 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OFk9Xk5tO42j1pEcX1Inj4YTkh+Z/anoBpNvjuil5Ug=;
	b=i483hhqW8bEzejQxHK9J6fzkdTwxeZSmiBnkFMY2gaGKrjO7Jpt8XfcSPkTXKgKdN+
	ZbEdbg1AzI0UHB1pq7Q/voAOO67CVhr5AsZd6Ur7FGGMj7UydzNqm3pyNLm4rpUSdoOn
	DVyU5hlZ9q0Ds725Ppf5e7+bBouCZxMbnQ5HttnBXwz3wSfGI9QsA0Luz9kSXvo8dbls
	2WnqIjVg1MTQtGFVO17kPv5uXUHp9weCqCrjIMsez006IE1NoyPCUGGelXg/y7vx7+Vg
	BRIYd5DPjkeyKdjIGw7mr07lMqt/cOAsDQ80hlWA7d0I3OY+PuBcruo5q6k51/0dn84I
	BxKw==
Received: by 10.180.103.4 with SMTP id fs4mr4127705wib.16.1343998020498;
	Fri, 03 Aug 2012 05:47:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cl8sm39371168wib.10.2012.08.03.05.46.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Aug 2012 05:46:59 -0700 (PDT)
Date: Fri, 3 Aug 2012 14:46:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120803124658.GC30148@jama.jama.net>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
MIME-Version: 1.0
In-Reply-To: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 12:58:41 -0000
X-Groupsio-MsgNum: 26869
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TiqCXmo5T1hvSQQg"
Content-Disposition: inline

--TiqCXmo5T1hvSQQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2012 at 03:38:42PM +0300, Radu Moisan wrote:
> Building u-boot requires UBOOT_MACHINE. In the u-boot README file
> building u-boot is achieved with "make NAME_config" and then
> "make all". I assumend UBOOT_MACHINE to be the "NAME" part and thus,
> the "_config" addition in u-boot.inc
> NAME is the machine name, and choices area vailable in boards.conf,
> I used for testing coreboot-x86.

=46rom this description I don't see why _config is now appended when
probably all BSPs had it included in UBOOT_MACHINE variable before

meta-nokia/recipes-bsp/u-boot/u-boot_git.bb:UBOOT_MACHINE_nokia900 =3D "nok=
ia_rx51_config"
meta-openmoko/conf/machine/om-gta04.conf:UBOOT_MACHINE =3D "omap3_gta04_con=
fig"
meta-openmoko/recipes-bsp/u-boot/u-boot_git.bb:UBOOT_MACHINE_om-gta04 =3D "=
omap3_gta04_config"
conf/machine/am180x-evm.conf:UBOOT_MACHINE =3D "da850evm_config"
conf/machine/am335x-evm.conf:UBOOT_MACHINE =3D "am335x_evm_config"
conf/machine/am3517-evm.conf:UBOOT_MACHINE =3D "am3517_evm_config"
conf/machine/am37x-evm.conf:UBOOT_MACHINE =3D "omap3_evm_config"
conf/machine/beagleboard.conf:UBOOT_MACHINE =3D "omap3_beagle_config"
conf/machine/beaglebone.conf:UBOOT_MACHINE =3D "am335x_evm_config"
conf/machine/hawkboard.conf:UBOOT_MACHINE =3D "da850_omapl138_evm_config"
conf/machine/include/davinci.inc:UBOOT_MACHINE =3D "davinci_dvevm_config"
conf/machine/include/ti814x.inc:UBOOT_MACHINE =3D "ti8148_evm_config_nand"
conf/machine/include/ti816x.inc:UBOOT_MACHINE =3D "ti8168_evm_config"
conf/machine/omap3-touchbook.conf:UBOOT_MACHINE =3D "omap3_beagle_config"
conf/machine/omap3evm.conf:UBOOT_MACHINE =3D "omap3_evm_config"
conf/machine/pandaboard.conf:UBOOT_MACHINE =3D "omap4_panda_config"

And any sensible is to append it to *MACHINE* variable as default:
recipes-bsp/u-boot/u-boot.inc:UBOOT_MACHINE ?=3D "${MACHINE}_config"

Cheers,

>=20
> For u-boot-fw-utils fw_enc.c was changed and it requires a header
> file config.h which is autogenerated at config so it requires a
> "make NAME_config".
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>  ...ls_2012.04.01.bb =3D> u-boot-fw-utils_2012.07.bb} |    7 ++++---
>  ...age_2012.04.01.bb =3D> u-boot-mkimage_2012.07.bb} |    6 +++---
>  meta/recipes-bsp/u-boot/u-boot.inc                 |    2 +-
>  .../{u-boot_2012.04.01.bb =3D> u-boot_2012.07.bb}    |    8 ++++----
>  4 files changed, 12 insertions(+), 11 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2012.04.01.bb =3D> u-boo=
t-fw-utils_2012.07.bb} (83%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2012.04.01.bb =3D> u-boot=
-mkimage_2012.07.bb} (84%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2012.04.01.bb =3D> u-boot_2012.07=
=2Ebb} (82%)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta=
/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb
> similarity index 83%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb
> index fe3422a..2fa3b71 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.07.bb
> @@ -9,12 +9,12 @@ DEPENDS =3D "mtd-utils"
>  # make it default
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -# This revision corresponds to the tag "v2012.04.01"
> +# This revision corresponds to the tag "v2012.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
> +SRCREV =3D "190649fb4309d1bc0fe7732fd0f951cb6440f935"
> =20
> -PV =3D "v2012.04.01+git${SRCPV}"
> +PV =3D "2012.07"
> =20
>  SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
> =20
> @@ -23,6 +23,7 @@ S =3D "${WORKDIR}/git"
>  EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
> =20
>  do_compile () {
> +  oe_runmake ${UBOOT_MACHINE}_config
>    oe_runmake env
>  }
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/=
recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
> similarity index 84%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
> index aa107fe..752efcb 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
> @@ -7,12 +7,12 @@ SECTION =3D "bootloader"
>  # make it default
>  DEFAULT_PREFERENCE =3D "-1"
> =20
> -# This revision corresponds to the tag "v2012.04.01"
> +# This revision corresponds to the tag "v2012.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
> +SRCREV =3D "190649fb4309d1bc0fe7732fd0f951cb6440f935"
> =20
> -PV =3D "v2012.04.01+git${SRCPV}"
> +PV =3D "2012.07"
> =20
>  SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 42bdde9..58a8192 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -40,7 +40,7 @@ do_compile () {
>  	unset LDFLAGS
>  	unset CFLAGS
>  	unset CPPFLAGS
> -	oe_runmake ${UBOOT_MACHINE}
> +	oe_runmake ${UBOOT_MACHINE}_config
>  	oe_runmake ${UBOOT_MAKE_TARGET}
>  }
> =20
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-=
bsp/u-boot/u-boot_2012.07.bb
> similarity index 82%
> rename from meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2012.07.bb
> index c4ec50d..7ccee30 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2012.07.bb
> @@ -14,13 +14,13 @@ DEFAULT_PREFERENCE =3D "-1"
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb"
> =20
> -# This revision corresponds to the tag "v2012.04.01"
> +# This revision corresponds to the tag "v2012.07"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV =3D "415d386877df49eb051b85ef74fa59a16dc17c7d"
> +SRCREV =3D "190649fb4309d1bc0fe7732fd0f951cb6440f935"
> =20
> -PV =3D "v2012.04.01+git${SRCPV}"
> -PR =3D "r1"
> +PV =3D "2012.07"
> +PR =3D "r0"
> =20
>  SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TiqCXmo5T1hvSQQg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAbyEIACgkQN1Ujt2V2gByMRQCgu1NnxMjy8dqWTjeMi3uX1SD8
F6wAnRIAbsasdOZrX2hFsUwsQq3I295S
=MGbw
-----END PGP SIGNATURE-----

--TiqCXmo5T1hvSQQg--
