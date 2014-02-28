Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0E1066AFB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 16:08:59 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so420091eek.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 08:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QiVOTpd/gJ3iRd3B0ySHydoaPBkn7LhhKeYCq9zXWJU=;
	b=PHQQCdHI/x51KzSi3hbo+xmgNMZNtbFQw9NiOjNq+LAM3EmW9mp8X2gBUtmvvBMjF6
	DXdFtB6Nt88B+wIzHyElLjow09hc73P3UkG7qxpETZon9l4rwem2EbfmN9JY9thuzQiP
	wpflWYXQrpHnNCfjjKfnUrBAM2XldbkZM11zGDo3aioyN2N1YnB8Aq+amtdWUZlG7seU
	vDRQVuxmlKhDCniPL1IGG4dx+bLdeSQyzvZJ3qUj3tlyFtCUc3meHtGijROBp30TH/BR
	r5lUBT2s2E23FJrJMkBgd+GHcSHVk/iQIopg1avMY29SWr7RFeBpYJup8t9oeiXkmdwm
	g7vw==
X-Received: by 10.14.177.135 with SMTP id d7mr22430951eem.33.1393603739807;
	Fri, 28 Feb 2014 08:08:59 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m1sm12083781een.7.2014.02.28.08.08.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Feb 2014 08:08:56 -0800 (PST)
Date: Fri, 28 Feb 2014 17:08:57 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
Message-ID: <20140228160857.GL26981@jama>
References: <20140228135521.C895C50390@opal>
MIME-Version: 1.0
In-Reply-To: <20140228135521.C895C50390@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Alexandru-Cezar Sardan : gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Fri, 28 Feb 2014 16:09:02 -0000
X-Groupsio-MsgNum: 50719
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PnXnnR/daWGQjfKI"
Content-Disposition: inline

--PnXnnR/daWGQjfKI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2014 at 01:55:21PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 97f2a81d6796ddaf7bbaab86c2ab9039673c732c
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D97f2a81d6796ddaf7bbaab86c2ab9039673c732c
>=20
> Author: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> Date:   Thu Feb 27 14:17:35 2014 +0200
>=20
> gcc: Enable SPE & AltiVec generation on powepc*linux target.
>=20
> [ADT bug #5761] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D57=
61
>=20
> Also this patch adds symlinks to libgcc such that a GCC configured
> by passing the target parameter without LIBCEXTENSION and ABIEXTENSION
> specifiers to find the correct startup files from a libgcc configured
> with these variables.
>=20
> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> ---
>=20
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
>  ...AltiVec-generation-on-powepc-linux-target.patch | 42 ++++++++++++++++=
++++++
>  meta/recipes-devtools/gcc/libgcc.inc               | 24 ++++++++++++-
>  3 files changed, 66 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtool=
s/gcc/gcc-4.8.inc
> index fdd0c12..f5e583d 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -69,6 +69,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>  	   file://0046-libatomic-deptracking.patch \
>  	   file://0047-repomembug.patch \
>  	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
> +	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.pat=
ch \=20
>  	  "
>  SRC_URI[md5sum] =3D "a3d7d63b9cb6b6ea049469a0c4a43c9d"
>  SRC_URI[sha256sum] =3D "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e=
1d773ce2d7e3cdc8"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-ge=
neration-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-4.8/0=
049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> new file mode 100644
> index 0000000..b98f8ff
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-generatio=
n-on-powepc-linux-target.patch
> @@ -0,0 +1,42 @@
> +From 9e0e19eac2562f73858602fe26e2044eb8b20c47 Mon Sep 17 00:00:00 2001
> +From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> +Date: Wed, 5 Feb 2014 16:52:31 +0200
> +Subject: [PATCH] Enable SPE & AltiVec generation on powepc*linux target
> +
> +When is configured with --target=3Dpowerpc-linux, the resulting GCC will=
=20
> +not be able to generate code for SPE targets (e500v1/v2).
> +GCC configured with --target=3Dpowerpc-linuxspe will not be able to
> +generate AltiVec instructions (for e6500).
> +This patch modifies the configured file such that SPE or AltiVec code
> +can be generated when gcc is configured with --target=3Dpowerpc-linux.
> +The ABI and speciffic instructions can be selected through the
> +"-mabi=3Dspe or -mabi=3Daltivec" and the "-mspe or -maltivec" parameters.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> +---
> + gcc/config.gcc |    7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/gcc/config.gcc b/gcc/config.gcc
> +index cb7a94e..d392c2b 100644
> +--- a/gcc/config.gcc
> ++++ b/gcc/config.gcc
> +@@ -2068,7 +2068,12 @@ powerpc-*-rtems*)
> + 	tmake_file=3D"rs6000/t-fprules rs6000/t-rtems t-rtems rs6000/t-ppccomm"
> + 	;;
> + powerpc*-*-linux*)
> +-	tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
> ++	case ${target} in
> ++	    powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
> ++		tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"=
 ;;
> ++	    *)
> ++		tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h =
rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h" ;;
> ++	esac
> + 	extra_options=3D"${extra_options} rs6000/sysv4.opt"
> + 	tmake_file=3D"rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-p=
pccomm"
> + 	case ${target} in
> +--=20
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools=
/gcc/libgcc.inc
> index fe98238..b185660 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -17,7 +17,8 @@ FILES_${PN}-dev =3D " \
>    ${libdir}/${TARGET_SYS}/${BINV}/32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/x32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/n32 \
> -  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> +  ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
> +  ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '', '$=
{libdir}/${TARGET_SYS_NO_EXTENSION}', d)}"
>  FILES_libgcov-dev =3D " \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    "
> @@ -141,3 +142,24 @@ python do_multilib_install() {
>              os.unlink(dest)
>          os.symlink(src, dest)
>  }
> +
> +addtask extra_symlinks after do_multilib_install before do_package do_po=
pulate_sysroot
> +python do_extra_symlinks() {
> +    targetsysnoext =3D d.getVar('TARGET_SYS_NO_EXTENSION', True)
> +
> +    if targetsysnoext !=3D d.getVar('TARGET_SYS', True):
> +        dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' + =
targetsysnoext
> +        src =3D d.getVar('TARGET_SYS', True)
> +        if not os.path.lexists(dest):
> +            os.symlink(src, dest)
> +}
> +
> +python () {
> +    targetsysnoext =3D d.getVar('TARGET_SYS', True)
> +
> +    for suffix in [d.getVar('ABIEXTENSION', True), d.getVar('LIBCEXTENSI=
ON', True)]:
> +        if suffix and targetsysnoext.endswith(suffix):
> +            targetsysnoext =3D targetsysnoext[:-len(suffix)]
> +
> +    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
> +}

This seems to trigger some issues (probably caused by rm_work) when it
tries to run new do_extra_symlinks task in already removed directories

in first build it somehow passed, but created empty libgcc packages (instea=
d of populated libgcc1)
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 250 of 6994 (ID: 72, /OE/build/shr-core/openembedded-cor=
e/meta/recipes-kernel/linux/linux-yocto_3.10.bb, do_fetch)
NOTE: Running task 1300 of 6994 (ID: 2432, /OE/build/shr-core/openembedded-=
core/meta/recipes-devtools/gcc/libgcc_4.8.bb, do_extra_symlinks)
NOTE: recipe linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0: task =
do_fetch: Started
NOTE: recipe libgcc-4.8.2-r0: task do_extra_symlinks: Started
NOTE: recipe libgcc-4.8.2-r0: task do_extra_symlinks: Succeeded
NOTE: Running task 1301 of 6994 (ID: 2435, /OE/build/shr-core/openembedded-=
core/meta/recipes-devtools/gcc/libgcc_4.8.bb, do_populate_sysroot)
NOTE: recipe libgcc-4.8.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcc-4.8.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1429 of 6994 (ID: 2442, /OE/build/shr-core/openembedded-=
core/meta/recipes-devtools/gcc/libgcc_4.8.bb, do_package)
NOTE: recipe libgcc-4.8.2-r0: task do_package: Started
NOTE: recipe linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0: task =
do_fetch: Succeeded
=2E..
| WARNING: The license listed LGPLv2.1 was not in the licenses collected fo=
r eglibc-locale
| WARNING: The license listed CC-BY-SA was not in the licenses collected fo=
r fso-sounds
| ls: cannot access /OE/build/shr-core/tmp-eglibc/sysroots/qemux86-64/pkgda=
ta/runtime-reverse/libgcc1: No such file or directory
| readlink: missing operand
| Try 'readlink --help' for more information.
| basename: missing operand
| Try 'basename --help' for more information.
| WARNING: /OE/build/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/shr-image=
/2.0-r20/temp/run.license_create_manifest.13979:1 exit 1 from
|   pkged_name=3D"$(basename $(readlink ${filename}))"
| DEBUG: Python function do_rootfs finished
| ERROR: Function failed: license_create_manifest (log file is located at /=
OE/build/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/shr-image/2.0-r20/tem=
p/log.do_rootfs.13979)
NOTE: recipe shr-image-2.0-r20: task do_rootfs: Failed

and in 2nd build (just different MACHINE) it failed soon enough:
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Running task 267 of 7022 (ID: 72, /OE/build/shr-core/openembedded-cor=
e/meta/recipes-kernel/linux/linux-yocto_3.10.bb, do_fetch)
NOTE: Running task 1307 of 7022 (ID: 2361, /OE/build/shr-core/openembedded-=
core/meta/recipes-devtools/gcc/libgcc_4.8.bb, do_extra_symlinks)
NOTE: recipe linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0: task =
do_fetch: Started
NOTE: recipe libgcc-4.8.2-r0: task do_extra_symlinks: Started
ERROR: Error executing a python function in /OE/build/shr-core/openembedded=
-core/meta/recipes-devtools/gcc/libgcc_4.8.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'do_extra_symlinks', lineno: 12, function: <module>
     0008:        if not os.path.lexists(dest):
     0009:            os.symlink(src, dest)
     0010:
     0011:
 *** 0012:do_extra_symlinks(d)
     0013:
File: 'do_extra_symlinks', lineno: 9, function: do_extra_symlinks
     0005:    if targetsysnoext !=3D d.getVar('TARGET_SYS', True):
     0006:        dest =3D d.getVar('D', True) + d.getVar('libdir', True) +=
 '/' + targetsysnoext
     0007:        src =3D d.getVar('TARGET_SYS', True)
     0008:        if not os.path.lexists(dest):
 *** 0009:            os.symlink(src, dest)
     0010:
     0011:
     0012:do_extra_symlinks(d)
     0013:
Exception: OSError: [Errno 2] No such file or directory

ERROR: Function failed: do_extra_symlinks
ERROR: Logfile of failure stored in: /OE/build/shr-core/tmp-eglibc/work/xsc=
alete-oe-linux-gnueabi/libgcc/4.8.2-r0/temp/log.do_extra_symlinks.29190
NOTE: recipe libgcc-4.8.2-r0: task do_extra_symlinks: Failed
ERROR: Task 2361 (/OE/build/shr-core/openembedded-core/meta/recipes-devtool=
s/gcc/libgcc_4.8.bb, do_extra_symlinks) failed with exit code '1'
NOTE: recipe linux-yocto-3.10.32+gitAUTOINC+7b3b87d4d5_78afd3095c-r0: task =
do_fetch: Succeeded

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PnXnnR/daWGQjfKI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMQtJkACgkQN1Ujt2V2gBwPtACcCjGrM6qdZQDGGT1ZMOp4IKA2
c84AoK15zylohGqGGZlCymgSKvQC9zem
=BB50
-----END PGP SIGNATURE-----

--PnXnnR/daWGQjfKI--
