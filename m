Return-Path: <alexandru.sardan@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0183.outbound.protection.outlook.com [207.46.163.183])
	by mail.openembedded.org (Postfix) with ESMTP id 37BDF6F57D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 15:31:20 +0000 (UTC)
Received: from BLUPR03MB357.namprd03.prod.outlook.com (10.141.75.151) by
	BLUPR03MB360.namprd03.prod.outlook.com (10.141.75.155) with Microsoft
	SMTP Server (TLS) id 15.0.883.10; Mon, 3 Mar 2014 15:31:20 +0000
Received: from BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) by
	BLUPR03MB357.namprd03.prod.outlook.com ([10.141.75.151]) with mapi id
	15.00.0883.010; Mon, 3 Mar 2014 15:31:20 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux
	target.
Thread-Index: AQHPNvUwCmh/Srh/DU+Yl3r6z5oNP5rPfQPg
Date: Mon, 3 Mar 2014 15:31:19 +0000
Message-ID: <67abf64e39fc417fb65fed532afe0b4c@BLUPR03MB357.namprd03.prod.outlook.com>
References: <20140228160857.GL26981@jama>
	<1393860475-31036-1-git-send-email-alexandru.sardan@freescale.com>
In-Reply-To: <1393860475-31036-1-git-send-email-alexandru.sardan@freescale.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(189002)(199002)(377454003)(51704005)(13464003)(87936001)(74366001)(87266001)(74706001)(77982001)(56776001)(76482001)(49866001)(51856001)(53806001)(47736001)(2656002)(63696002)(81542001)(74502001)(66066001)(74876001)(80022001)(47976001)(54356001)(95666003)(19580395003)(85306002)(76796001)(76576001)(83322001)(90146001)(74662001)(76786001)(19580405001)(93136001)(56816005)(95416001)(65816001)(83072002)(85852003)(15975445006)(33646001)(46102001)(93516002)(92566001)(31966008)(54316002)(59766001)(50986001)(81342001)(575784001)(81686001)(94946001)(94316002)(69226001)(86362001)(47446002)(4396001)(80976001)(81816001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB360;
	H:BLUPR03MB357.namprd03.prod.outlook.com; CLIP:192.88.166.1;
	FPR:28AD701F.E1399E6D.3ED39F10.42EF7941.2055B; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux target.
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
X-List-Received-Date: Mon, 03 Mar 2014 15:31:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've added an additional check to make sure the symlink is not created in
a non-existent directory.

Alex

> -----Original Message-----
> From: Alexandru-Cezar Sardan [mailto:alexandru.sardan@freescale.com]
> Sent: Monday, March 03, 2014 5:28 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Sardan Alexandru Cezar-B41700; Saul Wold; Richard Purdie
> Subject: [PATCH] gcc: Enable SPE & AltiVec generation on powepc*linux
> target.
>=20
> [ADT bug #5761] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D57=
61
>=20
> Also this patch adds symlinks to libgcc such that a GCC configured
> by passing the target parameter without LIBCEXTENSION and ABIEXTENSION
> specifiers to find the correct startup files from a libgcc configured
> with these variables.
>=20
> (From OE-Core rev: 97f2a81d6796ddaf7bbaab86c2ab9039673c732c)
>=20
> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
>  ...AltiVec-generation-on-powepc-linux-target.patch |   42
> ++++++++++++++++++++
>  meta/recipes-devtools/gcc/libgcc.inc               |   24 ++++++++++-
>  3 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-
> AltiVec-generation-on-powepc-linux-target.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-
> devtools/gcc/gcc-4.8.inc
> index fdd0c12..f5e583d 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -69,6 +69,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-
> ${PV}.tar.bz2 \
>  	   file://0046-libatomic-deptracking.patch \
>  	   file://0047-repomembug.patch \
>  	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
> +	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-
> target.patch \
>  	  "
>  SRC_URI[md5sum] =3D "a3d7d63b9cb6b6ea049469a0c4a43c9d"
>  SRC_URI[sha256sum] =3D
> "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-
> generation-on-powepc-linux-target.patch b/meta/recipes-devtools/gcc/gcc-
> 4.8/0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
> new file mode 100644
> index 0000000..b98f8ff
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0049-Enable-SPE-AltiVec-
> generation-on-powepc-linux-target.patch
> @@ -0,0 +1,42 @@
> +From 9e0e19eac2562f73858602fe26e2044eb8b20c47 Mon Sep 17 00:00:00 2001
> +From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> +Date: Wed, 5 Feb 2014 16:52:31 +0200
> +Subject: [PATCH] Enable SPE & AltiVec generation on powepc*linux target
> +
> +When is configured with --target=3Dpowerpc-linux, the resulting GCC will
> +not be able to generate code for SPE targets (e500v1/v2).
> +GCC configured with --target=3Dpowerpc-linuxspe will not be able to
> +generate AltiVec instructions (for e6500).
> +This patch modifies the configured file such that SPE or AltiVec code
> +can be generated when gcc is configured with --target=3Dpowerpc-linux.
> +The ABI and speciffic instructions can be selected through the
> +"-mabi=3Dspe or -mabi=3Daltivec" and the "-mspe or -maltivec" parameters=
.
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
> + 	tmake_file=3D"rs6000/t-fprules rs6000/t-rtems t-rtems rs6000/t-
> ppccomm"
> + 	;;
> + powerpc*-*-linux*)
> +-	tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h rs6000/sysv4.h"
> ++	case ${target} in
> ++	    powerpc*-*-linux*spe* | powerpc*-*-linux*altivec*)
> ++		tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h
> rs6000/sysv4.h" ;;
> ++	    *)
> ++		tm_file=3D"${tm_file} dbxelf.h elfos.h freebsd-spec.h
> rs6000/sysv4.h rs6000/linuxaltivec.h rs6000/linuxspe.h rs6000/e500.h" ;;
> ++	esac
> + 	extra_options=3D"${extra_options} rs6000/sysv4.opt"
> + 	tmake_file=3D"rs6000/t-fprules rs6000/t-ppcos ${tmake_file} rs6000/t-
> ppccomm"
> + 	case ${target} in
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-
> devtools/gcc/libgcc.inc
> index fe98238..96f1969 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -17,7 +17,8 @@ FILES_${PN}-dev =3D " \
>    ${libdir}/${TARGET_SYS}/${BINV}/32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/x32 \
>    ${libdir}/${TARGET_SYS}/${BINV}/n32 \
> -  ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> +  ${libdir}/${TARGET_SYS}/${BINV}/libgcc* \
> +  ${@base_conditional('TARGET_SYS_NO_EXTENSION', '${TARGET_SYS}', '',
> '${libdir}/${TARGET_SYS_NO_EXTENSION}', d)}"
>  FILES_libgcov-dev =3D " \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    "
> @@ -141,3 +142,24 @@ python do_multilib_install() {
>              os.unlink(dest)
>          os.symlink(src, dest)
>  }
> +
> +addtask extra_symlinks after do_multilib_install before do_package
> do_populate_sysroot
> +python do_extra_symlinks() {
> +    targetsysnoext =3D d.getVar('TARGET_SYS_NO_EXTENSION', True)
> +
> +    if targetsysnoext !=3D d.getVar('TARGET_SYS', True):
> +        dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' +
> targetsysnoext
> +        src =3D d.getVar('TARGET_SYS', True)
> +        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D',
> True) + d.getVar('libdir', True)):
> +            os.symlink(src, dest)
> +}
> +
> +python () {
> +    targetsysnoext =3D d.getVar('TARGET_SYS', True)
> +
> +    for suffix in [d.getVar('ABIEXTENSION', True),
> d.getVar('LIBCEXTENSION', True)]:
> +        if suffix and targetsysnoext.endswith(suffix):
> +            targetsysnoext =3D targetsysnoext[:-len(suffix)]
> +
> +    d.setVar('TARGET_SYS_NO_EXTENSION', targetsysnoext)
> +}
> --
> 1.7.9.5
>=20


