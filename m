Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 48C5165DA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 12:42:38 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so2786596eek.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Apr 2014 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+vIAX+msfQwk8CA8tyBLQPWGaEkdzhL1Iu4dCe2HSyg=;
	b=ZHK+EKFbm8xZdFtdAudP3+J4csglzc0tnHSRXfWt69CJMrYoBznAaJ6MmlO+GDFP56
	q4EijUpWcOrd9zyaoJeLwPIAulmVr3afW9teUV2n+3a8cdwwo/l43Z6vC1iykdsZtMkB
	jDl29Z2Wny9Gbn6wazJblpFd9drQIkXCMzktgUe5zYgkKbSO1tTMp1JdJD43IfgXQ8Rn
	KFMomDCqhDhcFmMliGXZvIbSsgEDXAAMhEJ0OWxxoLwgrYiJ20Evv3o2y5vn4wydMFOs
	f6up7Dzrk6O2ihu0+rBGhW3i91fBrpxj4LXlj+0ZxHSTrjh4lcx7uUwlMb47XTbVc6FI
	55Ig==
X-Received: by 10.15.98.68 with SMTP id bi44mr459042eeb.97.1398429759643;
	Fri, 25 Apr 2014 05:42:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm24572384eew.19.2014.04.25.05.42.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Apr 2014 05:42:38 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Apr 2014 14:42:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Message-ID: <20140425124248.GX2486@jama>
References: <1398402986-28121-1-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
In-Reply-To: <1398402986-28121-1-git-send-email-changhyeok.bae@lge.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] mirrors.bbclass: Add mirror site for savannah
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
X-List-Received-Date: Fri, 25 Apr 2014 12:42:45 -0000
X-Groupsio-MsgNum: 52601
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="puacTriGDskFP02p"
Content-Disposition: inline

--puacTriGDskFP02p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2014 at 02:16:25PM +0900, Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases and
>   http://download.savannah.gnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
> * Add SAVANNAH_GNU_MIRROR & SAVANNAH_NONGNU_MIRROR variable in bitbake.co=
nf.
> * Change the SRC_URI using the new variable.
>=20
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta/classes/mirrors.bbclass                      |    2 ++
>  meta/conf/bitbake.conf                            |    2 ++
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |    2 +-
>  meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |    2 +-
>  meta/recipes-devtools/quilt/quilt-0.61.inc        |    2 +-
>  meta/recipes-extended/ed/ed_0.5.bb                |    2 +-
>  meta/recipes-extended/texi2html/texi2html_5.0.bb  |    2 +-
>  meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb     |    2 +-
>  meta/recipes-support/attr/acl.inc                 |    2 +-
>  meta/recipes-support/attr/attr.inc                |    2 +-
>  10 files changed, 12 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 1fd7cd8..5c5f8b6 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -45,6 +45,8 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://=
sunsite.ualberta.ca/pub/M
>  ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.ne=
t/pub/security/host-security/lsof/ \n \
>  http://www.apache.org/dist  http://archive.apache.org/dist \n \
>  http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc=
/ \n \
> +${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases =
\n \
> +${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.gnu.org/releas=
es \n \

Shouldn't this one point to nongnu download-mirror? Or is there only one
with both sources?

>  cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>  svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
>  git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index b3786a7..4a08fac 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -568,6 +568,8 @@ KERNELORG_MIRROR =3D "http://kernel.org/pub"
>  SOURCEFORGE_MIRROR =3D "http://downloads.sourceforge.net"
>  XLIBS_MIRROR =3D "http://xlibs.freedesktop.org/release"
>  XORG_MIRROR =3D "http://xorg.freedesktop.org/releases"
> +SAVANNAH_GNU_MIRROR =3D "http://download.savannah.gnu.org/releases"
> +SAVANNAH_NONGNU_MIRROR =3D "http://download.savannah.nongnu.org/releases"
> =20
>  # You can use the mirror of your country to get faster downloads by putt=
ing
>  #  export DEBIAN_MIRROR =3D "ftp://ftp.de.debian.org/debian/pool"
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipe=
s-core/sysvinit/sysvinit_2.88dsf.bb
> index 34e0a54..3080c08 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -9,7 +9,7 @@ PR =3D "r13"
> =20
>  RDEPENDS_${PN} =3D "${PN}-inittab"
> =20
> -SRC_URI =3D "http://download.savannah.gnu.org/releases-noredirect/sysvin=
it/sysvinit-${PV}.tar.bz2 \
> +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
>             file://install.patch \
>             file://crypt-lib.patch \
>             file://pidof-add-m-option.patch \
> diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/rec=
ipes-devtools/dmidecode/dmidecode_2.12.bb
> index 61779fe..3e3a350 100644
> --- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> +++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.nongnu.org/dmidecode/"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D393a5ca445f6965873eca0259a17f=
833"
> =20
> -SRC_URI =3D "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
> +SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.bz2"
> =20
>  COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm|powerpc).*-linux"
> =20
> diff --git a/meta/recipes-devtools/quilt/quilt-0.61.inc b/meta/recipes-de=
vtools/quilt/quilt-0.61.inc
> index 4d915bf..9ae4377 100644
> --- a/meta/recipes-devtools/quilt/quilt-0.61.inc
> +++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
> @@ -4,7 +4,7 @@ SECTION =3D "devel"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -SRC_URI =3D "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}=
=2Etar.gz \
> +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
>          file://install.patch \
>          file://run-ptest \
>          file://Makefile \
> diff --git a/meta/recipes-extended/ed/ed_0.5.bb b/meta/recipes-extended/e=
d/ed_0.5.bb
> index a696c0c..927124c 100644
> --- a/meta/recipes-extended/ed/ed_0.5.bb
> +++ b/meta/recipes-extended/ed/ed_0.5.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ddd5335ef96fb=
858a138230af773710 \
>                      file://main.c;beginline=3D1;endline=3D17;md5=3D36d4b=
85e5ae9028e918d1cc775c2475e"
> =20
>  PR =3D "r2"
> -SRC_URI =3D "http://download.savannah.gnu.org/releases-noredirect/ed/ed-=
${PV}.tar.bz2"
> +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/ed/ed-${PV}.tar.bz2"
> =20
>  SRC_URI[md5sum] =3D "4ee21e9dcc9b5b6012c23038734e1632"
>  SRC_URI[sha256sum] =3D "edef2bbde0fbf0d88232782a0eded323f483a0519d6fde9a=
3b1809056fd35f3e"
> diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/reci=
pes-extended/texi2html/texi2html_5.0.bb
> index a22b981..86cbc58 100644
> --- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
> +++ b/meta/recipes-extended/texi2html/texi2html_5.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b=
29e73d4adb9f9f6552"
> =20
>  PR =3D "r2"
> =20
> -SRC_URI     =3D "http://download.savannah.gnu.org/releases/texi2html/${B=
PN}-${PV}.tar.bz2 \
> +SRC_URI     =3D "${SAVANNAH_GNU_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
>                 file://fix_gettext_version.patch"
> =20
>  SRC_URI[md5sum] =3D "f15ac876fcdc8be865b16535f480aa54"
> diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes=
-sato/leafpad/leafpad_0.8.18.1.bb
> index f124be9..830c053 100644
> --- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> +++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba3=
6caa9b7df079bae19f \
> =20
>  DEPENDS =3D "gtk+ intltool-native"
>  DEPENDS_append_poky =3D " libowl"
> -SRC_URI =3D "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar=
=2Egz \
> +SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>  	   file://leafpad.desktop"
> =20
>  SRC_URI[md5sum] =3D "254a72fc67505e3aa52884c729cd7b97"
> diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/att=
r/acl.inc
> index 355dbdd..bc9fd6d 100644
> --- a/meta/recipes-support/attr/acl.inc
> +++ b/meta/recipes-support/attr/acl.inc
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Dc781d70ed2=
b4d48995b790403217a249 \
>                      file://doc/COPYING.LGPL;md5=3D9e9a206917f8af112da634=
ce3ab41764"
> =20
>  DEPENDS =3D "attr"
> -SRC_URI =3D "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar=
=2Egz \
> +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
>             file://run-ptest \
>             file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
>  "
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/at=
tr/attr.inc
> index 873c1ff..3468d0c 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3D2d0aa14b=
3fce4694e4f615e30186335f \
>                      file://attr/attr.c;endline=3D17;md5=3Dbe0403261f0847=
e5f43ed5b08d19593c \
>                      file://libattr/libattr.c;endline=3D17;md5=3D7970f770=
49f8fa1199fff62a7ab724fb"
> =20
> -SRC_URI =3D "http://download.savannah.gnu.org/releases/attr/${BP}.src.ta=
r.gz \
> +SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/attr/${BP}.src.tar.gz \
>             file://run-ptest \
>  "
> =20
> --=20
> 1.7.9.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--puacTriGDskFP02p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNaWEgACgkQN1Ujt2V2gByucACeLxVJ1RDiolJwdL3+RSzJA/Qd
v9sAoJpAKc7CmspLhO5Y6kpxCU0fS0Wu
=wV9X
-----END PGP SIGNATURE-----

--puacTriGDskFP02p--
