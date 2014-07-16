Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EB9B27059E;
	Wed, 16 Jul 2014 15:41:28 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id z12so1061086wgg.12
	for <multiple recipients>; Wed, 16 Jul 2014 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=15ERHHLinwV59fPwdlTC9yQvDkOncdutlOmny+0HIxY=;
	b=zpXhLUrODF8Y70ZlP1Vjm63b1DLVi3QuF2VvetSJ95IjiaQPTOlUQwhjiCV9NaX5sW
	voXEpprxAqK4cyYwXxDxbbcfr4XFN2Nfz49IwQl+QCHUaaxcXUkZRSLo3sq5LSt+KnHr
	1SYkl9OLkjjQLUqiZH0sYDDBw7FWGN8/PXUnclSDQfe+SS5vzxHX7TDCzB25EGFXHcWW
	lLvEBU31kfhjpKI/w3hwop4D5lsx5jpETcPQGinxVGrbAUd82D8+ojL/iiyUaC/uc/a1
	oJEBTX2NWT7aeLfwVLrWfxHb88fVKGJxb4OFvJDCuS2djFroI0g/K0It8rLF8Xmhx/3p
	N9fQ==
X-Received: by 10.194.82.106 with SMTP id h10mr21386895wjy.115.1405525286660; 
	Wed, 16 Jul 2014 08:41:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o12sm57800955wiw.5.2014.07.16.08.41.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jul 2014 08:41:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 16 Jul 2014 17:41:36 +0200
To: openembedded-core@lists.openembedded.org,
	Valentin Popa <valentin.popa@intel.com>
Message-ID: <20140716154136.GF2433@jama>
References: <20140511112816.77E4B50485@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140511112816.77E4B50485@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Valentin Popa : icu: upgrade to 53.1
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
X-List-Received-Date: Wed, 16 Jul 2014 15:41:38 -0000
X-Groupsio-MsgNum: 55063
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u2SGZJvfJjPItuJA"
Content-Disposition: inline

--u2SGZJvfJjPItuJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2014 at 11:28:16AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: cce150502fada2068ef1ab92b88a08ed0b64d766
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dcce150502fada2068ef1ab92b88a08ed0b64d766
>=20
> Author: Valentin Popa <valentin.popa@intel.com>
> Date:   Tue May  6 17:25:04 2014 +0300
>=20
> icu: upgrade to 53.1
>=20
> Removed patches:
> (*) add_buffer_length_check_to_UTF_16_or_32_detector.patch
>     - not needed anymore
>=20
> License is the same. BSD-like copyright inserted for lao-dictionary.
>=20
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Someone else seeing ICEs when thumb is enabled since this upgrade?

armv5te
|
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/icu/53.1-r0/ic=
u/source/common/ubidiwrt.c:
In function 'ubidi_writeReordered_53':
|
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/icu/53.1-r0/ic=
u/source/common/ubidiwrt.c:643:1:
internal compiler error: in patch_jump_insn, at cfgrtl.c:1275
|  }
|  ^
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| *** Failed compilation command follows:
----------------------------------------------------------
| arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mthumb -mthumb-interwork
-mtune=3Dxscale --sysroot=3D/OE/build/shr-core/tmp-eglibc/sysroots/spitz
-D_REENTRANT -DU_HAVE_ELF_H=3D1 -DU_HAVE_ATOMIC=3D1
-I/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/icu/53.1-r0/=
icu/source/common
-DDEFAULT_ICU_PLUGINS=3D"/usr/lib/icu"  -DU_ATTRIBUTE_DEPRECATED=3D
-DU_COMMON_IMPLEMENTATION -O2 -pipe -g -feliminate-unused-debug-types
-std=3Dc99 -Wall -pedantic -Wshadow -Wpointer-arith -Wmissing-prototypes
-Wwrite-strings -c -DPIC -fPIC -o ubidiwrt.o
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/icu/53.1-r0/ic=
u/source/common/ubidiwrt.c
| --- ( rebuild with "make VERBOSE=3D1 all" to show all parameters )
--------
|
/OE/build/shr-core/tmp-eglibc/work/xscalete-oe-linux-gnueabi/icu/53.1-r0/ic=
u/source/config/mh-linux:44:
recipe for target 'ubidiwrt.o' failed
| make[1]: *** [ubidiwrt.o] Error 1

armv4t:
ERROR: Function failed: do_compile (log file is located at /OE/build/shr-co=
re/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compil=
e.21570)
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/arm=
920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_compile.21570
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function do_compile
| NOTE: make
| Note: rebuild with "make VERBOSE=3D1 " to show all compiler parameters.
| make[0]: Making `all' in `stubdata'
| make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-=
oe-linux-gnueabi/icu/53.1-r0/build/stubdata'
| make[1]: Nothing to be done for 'all'.
| make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-o=
e-linux-gnueabi/icu/53.1-r0/build/stubdata'
| make[0]: Making `all' in `common'
| make[1]: Entering directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-=
oe-linux-gnueabi/icu/53.1-r0/build/common'
|    arm-oe-linux-gnueabi-gcc    ...  /OE/build/shr-core/tmp-eglibc/work/ar=
m920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/=
icu/source/common/ubidiwrt.c: In function 'ubidi_writeReordered_53':
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/=
icu/source/common/ubidiwrt.c:643:1: internal compiler error: in patch_jump_=
insn, at cfgrtl.c:1275
|  }
|  ^
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| *** Failed compilation command follows: ---------------------------------=
-------------------------
| arm-oe-linux-gnueabi-gcc -march=3Darmv4t -mthumb -mthumb-interwork -mtune=
=3Darm920t --sysroot=3D/OE/build/shr-core/tmp-eglibc/sysroots/om-gta02 -D_R=
EENTRANT -DU_HAVE_ELF_H=3D1 -DU_HAVE_ATOMIC=3D1 -I/OE/build/shr-core/tmp-eg=
libc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/icu/source/common -DDEFAULT=
_ICU_PLUGINS=3D"/usr/lib/icu"  -DU_ATTRIBUTE_DEPRECATED=3D -DU_COMMON_IMPLE=
MENTATION -O2 -pipe -g -feliminate-unused-debug-types -std=3Dc99 -Wall -ped=
antic -Wshadow -Wpointer-arith -Wmissing-prototypes -Wwrite-strings -c -DPI=
C -fPIC -o ubidiwrt.o /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-=
gnueabi/icu/53.1-r0/icu/source/common/ubidiwrt.c
| --- ( rebuild with "make VERBOSE=3D1 all" to show all parameters ) ------=
--
| /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/=
icu/source/config/mh-linux:44: recipe for target 'ubidiwrt.o' failed
| make[1]: *** [ubidiwrt.o] Error 1
| make[1]: Leaving directory '/OE/build/shr-core/tmp-eglibc/work/arm920tt-o=
e-linux-gnueabi/icu/53.1-r0/build/common'
| Makefile:141: recipe for target 'all-recursive' failed
| make: *** [all-recursive] Error 2
| ERROR: oe_runmake failed
| WARNING: /OE/build/shr-core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu=
/53.1-r0/temp/run.do_compile.21570:1 exit 1 from
|   exit 1
| ERROR: Function failed: do_compile (log file is located at /OE/build/shr-=
core/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/icu/53.1-r0/temp/log.do_comp=
ile.21570)
NOTE: recipe icu-53.1-r0: task do_compile: Failed
ERROR: Task 6803 (/OE/build/shr-core/openembedded-core/meta/recipes-support=
/icu/icu_53.1.bb, do_compile) failed with exit code '1'
NOTE: recipe luajit-2.0.3-r0: task do_compile: Started
ERROR: Function failed: do_compile (log file is located at /OE/build/shr-co=
re/tmp-eglibc/work/arm920tt-oe-linux-gnueabi/luajit/2.0.3-r0/temp/log.do_co=
mpile.21586)
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/arm=
920tt-oe-linux-gnueabi/luajit/2.0.3-r0/temp/log.do_compile.21586



>=20
> ---
>=20
>  ...fer_length_check_to_UTF_16_or_32_detector.patch | 33 ----------------=
------
>  .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |  0
>  .../{icu-51.2 =3D> icu}/icu-pkgdata-large-cmd.patch  |  0
>  meta/recipes-support/icu/icu_51.2.bb               | 16 -----------
>  meta/recipes-support/icu/icu_53.1.bb               | 21 ++++++++++++++
>  5 files changed, 21 insertions(+), 49 deletions(-)
>=20
> diff --git a/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to=
_UTF_16_or_32_detector.patch b/meta/recipes-support/icu/icu-51.2/add_buffer=
_length_check_to_UTF_16_or_32_detector.patch
> deleted file mode 100644
> index ad4d61c..0000000
> --- a/meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16=
_or_32_detector.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> ---- source/i18n/csrucode.cpp
> -+++ source/i18n/csrucode.cpp
> -@@ -33,8 +33,9 @@ UBool CharsetRecog_UTF_16_BE::match(Inpu
> - {
> -     const uint8_t *input =3D textIn->fRawInput;
> -     int32_t confidence =3D 0;
> -+    int32_t length =3D textIn->fRawLength;
> -=20
> --    if (input[0] =3D=3D 0xFE && input[1] =3D=3D 0xFF) {
> -+    if (length >=3D2 && input[0] =3D=3D 0xFE && input[1] =3D=3D 0xFF) {
> -         confidence =3D 100;
> -     }
> -=20
> -@@ -57,8 +58,9 @@ UBool CharsetRecog_UTF_16_LE::match(Inpu
> - {
> -     const uint8_t *input =3D textIn->fRawInput;
> -     int32_t confidence =3D 0;
> -+    int32_t length =3D textIn->fRawLength;
> -=20
> --    if (input[0] =3D=3D 0xFF && input[1] =3D=3D 0xFE && (input[2] !=3D =
0x00 || input[3] !=3D 0x00)) {
> -+    if (length >=3D 4 && input[0] =3D=3D 0xFF && input[1] =3D=3D 0xFE &=
& (input[2] !=3D 0x00 || input[3] !=3D 0x00)) {
> -         confidence =3D 100;
> -     }
> -=20
> -@@ -81,7 +83,7 @@ UBool CharsetRecog_UTF_32::match(InputTe
> -     bool hasBOM =3D FALSE;
> -     int32_t confidence =3D 0;
> -=20
> --    if (getChar(input, 0) =3D=3D 0x0000FEFFUL) {
> -+    if (limit > 0 && getChar(input, 0) =3D=3D 0x0000FEFFUL) {
> -         hasBOM =3D TRUE;
> -     }
> -=20
> diff --git a/meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-=
for-Linux.patch b/meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-fo=
r-Linux.patch
> similarity index 100%
> rename from meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-f=
or-Linux.patch
> rename to meta/recipes-support/icu/icu/0001-Disable-LDFLAGSICUDT-for-Linu=
x.patch
> diff --git a/meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patc=
h b/meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
> similarity index 100%
> rename from meta/recipes-support/icu/icu-51.2/icu-pkgdata-large-cmd.patch
> rename to meta/recipes-support/icu/icu/icu-pkgdata-large-cmd.patch
> diff --git a/meta/recipes-support/icu/icu_51.2.bb b/meta/recipes-support/=
icu/icu_51.2.bb
> deleted file mode 100644
> index 2d1fd42..0000000
> --- a/meta/recipes-support/icu/icu_51.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require icu.inc
> -
> -LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D443a74288a72fad9069a7=
4e7637192c1"
> -
> -
> -BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4=
c-51_2-src.tgz"
> -SRC_URI =3D "${BASE_SRC_URI} \
> -           file://icu-pkgdata-large-cmd.patch \
> -           file://add_buffer_length_check_to_UTF_16_or_32_detector.patch=
 \
> -          "
> -
> -SRC_URI_append_class-target =3D "\
> -           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> -          "
> -SRC_URI[md5sum] =3D "072e501b87065f3a0ca888f1b5165709"
> -SRC_URI[sha256sum] =3D "deb027a05f1b3bec03298b96fb93b28c84e9683c22e6f94e=
ffa67fdc7bd704cc"
> diff --git a/meta/recipes-support/icu/icu_53.1.bb b/meta/recipes-support/=
icu/icu_53.1.bb
> new file mode 100644
> index 0000000..d93af68
> --- /dev/null
> +++ b/meta/recipes-support/icu/icu_53.1.bb
> @@ -0,0 +1,21 @@
> +require icu.inc
> +
> +LIC_FILES_CHKSUM =3D "file://../license.html;md5=3D8b139ac5b93769623bd34=
3318048238c"
> +
> +def icu_download_version(d):
> +    pvsplit =3D d.getVar('PV', True).split('.')
> +    return pvsplit[0] + "_" + pvsplit[1]
> +
> +ICU_PV =3D "${@icu_download_version(d)}"
> +
> +BASE_SRC_URI =3D "http://download.icu-project.org/files/icu4c/${PV}/icu4=
c-${ICU_PV}-src.tgz"
> +SRC_URI =3D "${BASE_SRC_URI} \
> +           file://icu-pkgdata-large-cmd.patch \
> +          "
> +
> +SRC_URI_append_class-target =3D "\
> +           file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
> +          "
> +
> +SRC_URI[md5sum] =3D "b73baa6fbdfef197608d1f69300919b9"
> +SRC_URI[sha256sum] =3D "6fa74fb5aac070c23eaba1711a7178fe582c59867484c5ec=
07c49002787a9a28"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u2SGZJvfJjPItuJA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPGnTAACgkQN1Ujt2V2gBy0BQCghyv9jObZb4r9Uy5s3fhoH3kl
2TEAmgIZeWI1oBQhYKErw76dUIPMjxtB
=/LFt
-----END PGP SIGNATURE-----

--u2SGZJvfJjPItuJA--
