Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtSKz-000377-Gt for openembedded-core@lists.openembedded.org;
	Sat, 04 Feb 2012 00:14:37 +0100
Received: from g225173220.adsl.alicedsl.de ([92.225.173.220]
	helo=[192.168.178.43])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RtSDU-0001j3-L4 for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 23:06:52 +0000
Message-ID: <1328310400.4220.60.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 04 Feb 2012 00:06:40 +0100
In-Reply-To: <1328309610-12397-1-git-send-email-tom.rini@gmail.com>
References: <1328309610-12397-1-git-send-email-tom.rini@gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] u-boot-fw-utils: Initial version
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
X-List-Received-Date: Fri, 03 Feb 2012 23:14:37 -0000
X-Groupsio-MsgNum: 17020
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-TYn+4mHeyK3yCjA5HJZh"

--=-TYn+4mHeyK3yCjA5HJZh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Tom,


Am Freitag, den 03.02.2012, 15:53 -0700 schrieb Tom Rini:
> From: Tom Rini <trini@ti.com>

please add the version in the commit summary.

> This provides the 'fw_setenv' and 'fw_getenv' programs for the target
> so that the U-Boot environment can be modified from Linux.  These
> programs are system-agnostic and rely on a config file that a given BSP
> will provide (and RRECOMMEND this be installed).

I do not understand the addition in the parentheses.

> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |   26 ++++++++++++++=
++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/re=
cipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> new file mode 100644
> index 0000000..3185cbd
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE =3D "GPLv2+"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a5651=
ecb \
> +                    file://README;beginline=3D1;endline=3D22;md5=3D5ba42=
18ac89af7846802d0348df3fb90"
> +SECTION =3D "bootloader"

Is this the standard ordering? Is there also a homepage for theses
utils?

> +
> +PR =3D "r0"
> +

Was a decision made if `PR =3D "r0"` should be set?

> +SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
> +SRC_URI[sha256sum] =3D "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa1=
5596f43af310ba8b"
> +
> +S =3D "${WORKDIR}/u-boot-${PV}"

Is that the default? I always forget.

> +
> +EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
> +
> +do_compile () {
> +  oe_runmake env
> +}
> +
> +do_install () {
> +  install -d ${D}${base_sbindir}
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_print=
env
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_seten=
v
> +}


Thanks,

Paul

--=-TYn+4mHeyK3yCjA5HJZh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEUEABECAAYFAk8saIAACgkQPX1aK2wOHVh7HQCWI1Di8Q7lsjgVjomOTBmDjxr9
xwCfZ/N3LM9VGfK9CXl5V+NSAXU8Oyc=
=3VMD
-----END PGP SIGNATURE-----

--=-TYn+4mHeyK3yCjA5HJZh--
