Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1623F6D16E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 08:17:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2014 00:17:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,500,1389772800"; d="scan'208";a="485062090"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2014 00:17:38 -0800
Received: from irsmsx151.ger.corp.intel.com (163.33.192.59) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 18 Feb 2014 08:17:34 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX151.ger.corp.intel.com ([169.254.4.192]) with mapi id
	14.03.0123.003; Tue, 18 Feb 2014 08:17:34 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "Patches and discussions about the oe-core
	layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6] eglibc upgrade 2.19,	uclibc upgrade and
	fixes
Thread-Index: AQHPLEHZybZnXibxYkSNCjDyrHVpq5q6qiZw
Date: Tue, 18 Feb 2014 08:17:33 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16D00704@IRSMSX105.ger.corp.intel.com>
References: <cover.1392665521.git.raj.khem@gmail.com>
	<CAMKF1srgvRkaJejybGLp9o64GYVobzGXs7QoAcb6tQenBUoFWg@mail.gmail.com>
In-Reply-To: <CAMKF1srgvRkaJejybGLp9o64GYVobzGXs7QoAcb6tQenBUoFWg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH 0/6] eglibc upgrade 2.19, uclibc upgrade and fixes
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
X-List-Received-Date: Tue, 18 Feb 2014 08:17:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Reverting commit http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=
=3D3f49597225a58965124503ca5f3cc4011b04b3c0
Has the effect of fixing the build at do_rootfs stage.
Also, the commit in question looks strange to my eyes...
Appends should not be easily switchable without side-effects...
Usually.
Regards,
Cristian Iorga
YP
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Tuesday, February 18, 2014 2:39 AM
To: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH 0/6] eglibc upgrade 2.19, uclibc upgrade and =
fixes

On Mon, Feb 17, 2014 at 11:33 AM, Khem Raj <raj.khem@gmail.com> wrote:
> This is consolidated patchsets that I have sent over past couple of=20
> weeks Upgrades eglibc to 2.19 Upgrades uclibc to latest git Fix for=20
> building uclibc images binutils is fixed to accomodate gold linker and=20
> sstate icu is fixed for QT5 runtime-issue reported by many developers=20
> over mailing list
>
> I have built and booted systemd-image for eglibc/uclibc on all qemu=20
> machines, beaglebone, overo and build only tested for  p1020ds
>

Updated the pull tree.
I have addressed RPs feedback into icu patch and additionally added a fix t=
hat surfaced after 9d9bca8785911e8ae06d507bbfb99d6a811f072e
when generating .tar.gz or tar.bz2 images

> The following changes since commit 9d9bca8785911e8ae06d507bbfb99d6a811f07=
2e:
>
>   lib/oe/image.py: fix working directory (2014-02-17 15:37:13 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib misc
>  =20
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h
> =3Dkraj/misc
>
> Khem Raj (6):
>   eglibc: Upgrade from 2.18 -> 2.19
>   valgrind: Add glibc 2.19 awareness
>   rootfs.py: Check for LDCONFIGDEPEND being empty string
>   icu: Disable the default LDFLAGSICUDT for target compile
>   binutils: ld-is-gold should not affect native and crosssdk recipes
>   uclibc: Update to git tip
>
>  meta/classes/libc-common.bbclass                   |    2 +-
>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>  meta/lib/oe/rootfs.py                              |    2 +-
>  ...tive_2.18.bb =3D> cross-localedef-native_2.19.bb} |   10 +-
>  .../0001-ARM-Pass-dl_hwcap-to-IFUNC-resolver.patch |   43 ------
>  meta/recipes-core/eglibc/eglibc-2.18/make-4.patch  |   31 ----
>  .../eglibc/eglibc-2.18/tzselect-awk.patch          |   42 ------
>  .../eglibc/eglibc-2.18/tzselect-sh.patch           |  156 --------------=
------
>  .../0001-R_ARM_TLS_DTPOFF32.patch                  |    0
>  .../0001-eglibc-menuconfig-support.patch           |  122 +++++++-------=
-
>  ...n-libm-err-tab.pl-with-specific-dirs-in-S.patch |    0
>  ...0002-eglibc-menuconfig-hex-string-options.patch |    0
>  ...0003-eglibc-menuconfig-build-instructions.patch |    0
>  .../GLRO_dl_debug_mask.patch                       |    0
>  .../IO-acquire-lock-fix.patch                      |    0
>  .../add_resource_h_to_wait_h.patch                 |    0
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>  .../eglibc_fix_findidx_parameters.patch            |    0
>  .../{eglibc-2.18 =3D> eglibc-2.19}/etc/ld.so.conf    |    0
>  .../fileops-without-wchar-io.patch                 |    0
>  .../fix-tibetian-locales.patch                     |    0
>  .../fix_for_centos_5.8.patch                       |    0
>  .../fsl-ppc-no-fsqrt.patch                         |    0
>  .../generate-supported.mk                          |    0
>  .../glibc.fix_sqrt2.patch                          |    0
>  .../initgroups_keys.patch                          |    0
>  .../ld-search-order.patch                          |    0
>  .../mips-rld-map-check.patch                       |    0
>  .../multilib_readlib.patch                         |    0
>  .../ppc-sqrt_finite.patch                          |    0
>  .../ppc_slow_ieee754_sqrt.patch                    |    0
>  .../relocatable_sdk.patch                          |    0
>  .../relocatable_sdk_fix_openpath.patch             |    0
>  ...libc-initial_2.18.bb =3D> eglibc-initial_2.19.bb} |    0
>  ...eglibc-locale_2.18.bb =3D> eglibc-locale_2.19.bb} |    0
>  ...eglibc-mtrace_2.18.bb =3D> eglibc-mtrace_2.19.bb} |    0
>  ...libc-scripts_2.18.bb =3D> eglibc-scripts_2.19.bb} |    0
>  .../eglibc/{eglibc_2.18.bb =3D> eglibc_2.19.bb}      |   14 +-
>  meta/recipes-core/uclibc/uclibc-git.inc            |    3 +-
>  .../0001-add-posix_fadvise-for-arm.patch           |   68 ---------
>  meta/recipes-devtools/binutils/binutils.inc        |    8 +-
>  .../valgrind/valgrind/glibc-2.19.patch             |   23 +++
>  meta/recipes-devtools/valgrind/valgrind_3.9.0.bb   |    1 +
>  .../0001-Disable-LDFLAGSICUDT-for-Linux.patch      |   28 ++++
>  meta/recipes-support/icu/icu_51.2.bb               |    3 +
>  45 files changed, 136 insertions(+), 422 deletions(-)  rename=20
> meta/recipes-core/eglibc/{cross-localedef-native_2.18.bb =3D>=20
> cross-localedef-native_2.19.bb} (73%)  delete mode 100644=20
> meta/recipes-core/eglibc/eglibc-2.18/0001-ARM-Pass-dl_hwcap-to-IFUNC-r
> esolver.patch  delete mode 100644=20
> meta/recipes-core/eglibc/eglibc-2.18/make-4.patch
>  delete mode 100644=20
> meta/recipes-core/eglibc/eglibc-2.18/tzselect-awk.patch
>  delete mode 100644=20
> meta/recipes-core/eglibc/eglibc-2.18/tzselect-sh.patch
>  rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/0001-R_ARM_TLS_DTPOFF32.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/0001-eglibc-menuconfig-support.patch (93%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/0001-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.p
> atch (100%)  rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/0002-eglibc-menuconfig-hex-string-options.patch (100%) =20
> rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/0003-eglibc-menuconfig-build-instructions.patch (100%) =20
> rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/GLRO_dl_debug_mask.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/IO-acquire-lock-fix.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/add_resource_h_to_wait_h.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%) =20
> rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/eglibc_fix_findidx_parameters.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D> eglibc-2.19}/etc/ld.so.conf=20
> (100%)  rename meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/fileops-without-wchar-io.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/fix-tibetian-locales.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/fix_for_centos_5.8.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/fsl-ppc-no-fsqrt.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/generate-supported.mk (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/glibc.fix_sqrt2.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/initgroups_keys.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/ld-search-order.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/mips-rld-map-check.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/multilib_readlib.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/ppc-sqrt_finite.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/ppc_slow_ieee754_sqrt.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/relocatable_sdk.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-2.18 =3D>=20
> eglibc-2.19}/relocatable_sdk_fix_openpath.patch (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-initial_2.18.bb =3D>=20
> eglibc-initial_2.19.bb} (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-locale_2.18.bb =3D>=20
> eglibc-locale_2.19.bb} (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-mtrace_2.18.bb =3D>=20
> eglibc-mtrace_2.19.bb} (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc-scripts_2.18.bb =3D>=20
> eglibc-scripts_2.19.bb} (100%)  rename=20
> meta/recipes-core/eglibc/{eglibc_2.18.bb =3D> eglibc_2.19.bb} (90%) =20
> delete mode 100644=20
> meta/recipes-core/uclibc/uclibc-git/0001-add-posix_fadvise-for-arm.pat
> ch  create mode 100644=20
> meta/recipes-devtools/valgrind/valgrind/glibc-2.19.patch
>  create mode 100644=20
> meta/recipes-support/icu/icu-51.2/0001-Disable-LDFLAGSICUDT-for-Linux.
> patch
>
> --
> 1.7.10.4
>
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

