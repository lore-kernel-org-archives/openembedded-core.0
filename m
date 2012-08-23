Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T4QPI-0006tq-89
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 07:56:40 +0200
Received: by wibhq4 with SMTP id hq4so441065wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 22:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZFa75AkpQ3YiGKEnpthmNDb37+3WnVRmTI1sYAWyQQk=;
	b=MAvKhlUTrbCkDDXcSdPKfKLPrmE1pA40epe9N/urNB5emeYja1zCd6JaocZt/eZzGD
	Wdnbh8tnboHrbWUZK0BLArIq8Oy/XWOsnv55AVxlrekrcdjRR9tkH5/MfDuu0Wfi7fkk
	eKRlnkPcIvgM9yQZAcCu56GFjtRNnGD9TJzg9zUpH8yR3TunnC8dEyINV5eAh++wEbb/
	UH4MIYqgGwiciBmS8bnYopCR+rNPSp5xK/dDxR8PndpcL/kSbWXFM34Cnd3pqzNfSLnq
	nnXCjDfO2fziN+koga5KCadNZZ9I5Szfb+D1aM2RQs8NXPeFXr+txKBGjnV+O/RJVHqx
	n+5w==
Received: by 10.180.14.8 with SMTP id l8mr1080221wic.6.1345700674117;
	Wed, 22 Aug 2012 22:44:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k20sm43087915wiv.11.2012.08.22.22.44.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Aug 2012 22:44:33 -0700 (PDT)
Date: Thu, 23 Aug 2012 07:44:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120823054439.GI3029@jama.jama.net>
References: <cover.1345694080.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1345694080.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/22] Bugfixes and Features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 05:56:40 -0000
X-Groupsio-MsgNum: 28112
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Az4VpBrmI9+OyhK/"
Content-Disposition: inline

--Az4VpBrmI9+OyhK/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2012 at 08:56:15PM -0700, Saul Wold wrote:
> Richard,
>=20
> This set has a number of bug fixes and cleanups along
> with some updates.  This includes an update to BusyBox
> which has a cooresponding update in meta-yocto, please
> pull both.
>=20
> I have also included Robert's feature to install external
> binary packages, please review these.
>=20
> Thanks
>         Sau!
>=20
> The following changes since commit e3b0925f4c861393e436deb6b1912f9f1f325d=
1e:
>=20
>   libtool: normalize link paths before considering for RPATH (2012-08-22 =
14:22:51 +0100)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>=20
> Andreas M=FCller (1):
>   pixman: merge meta-oe append into oe-core

Those updated patches don't work properly. Andreas is working on v2.

Cheers,

>=20
> Christopher Larson (1):
>   task-base: pull in the bluez asound module when appropriate
>=20
> Khem Raj (5):
>   runqemu: Honor KERNEL and ROOTFS settings from environment
>   linux-yocto: Remove parens from COMPATIBLE_MACHINE regexp
>   kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
>   eglibc-2.15: Delete
>   iputils: Fix postinst to run on cross rootfs generation
>=20
> Paul Eggleton (1):
>   scripts/combo-layer: specify branch when getting current revision
>=20
> Radu Moisan (3):
>   grub: Update to upstream stable 2.00
>   grub-efi-native: Update to version 2.00
>   busybox: Upgrade to upstream 1.20.2
>=20
> Richard Purdie (1):
>   gmp-4.2.1: Set CC_FOR_BUILD to ensure the host system compiler is
>     used, not the target one
>=20
> Robert Yang (5):
>   bitbake.conf: add STAMPS_DIR for constructing STAMP
>   bitbake-whatchanged: print what is about to happen
>   rpm: install external binary packages
>   ipk: install external binary packages
>   deb: install external binary packages
>=20
> Roy.Li (1):
>   bitbake: compile tar-replacement firstly
>=20
> Saul Wold (2):
>   cups: disable pdftops
>   external-python-tarball: Blacklist recipe if ipk is not in the
>     PACKAGE_CLASSES list
>=20
> Wenzong Fan (1):
>   coreutils: fix do_configure error with long TMPDIR
>=20
> Xin Ouyang (1):
>   grub-1.99: Add flex-native to DEPENDS
>=20
>  meta/classes/external_package.bbclass              |   91 ++++
>  meta/classes/kernel.bbclass                        |    9 +-
>  meta/classes/module-base.bbclass                   |    9 +-
>  meta/classes/package_deb.bbclass                   |   44 +-
>  meta/classes/package_ipk.bbclass                   |   22 +-
>  meta/classes/package_rpm.bbclass                   |   13 +-
>  meta/classes/rootfs_deb.bbclass                    |    2 +-
>  meta/classes/rootfs_ipk.bbclass                    |    2 +-
>  meta/classes/rootfs_rpm.bbclass                    |    2 +-
>  meta/conf/bitbake.conf                             |    3 +-
>  ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ------
>  ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 --
>  .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 --
>  .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  179 -------
>  ...2man.patch =3D> grub-2.00-disable-help2man.patch} |  117 +----
>  ...grub-2.00-fix-enable_execute_stack-check.patch} |    8 +-
>  ...ix.patch =3D> grub-2.00-fpmath-sse-387-fix.patch} |    0
>  .../grub/files/grub-no-unused-result.patch         |   18 +
>  .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ---
>  .../grub/{grub-1.99 =3D> grub-2.00}/40_custom        |    0
>  .../{grub-1.99 =3D> grub-2.00}/grub-install.in.patch |    0
>  .../{grub-1.99 =3D> grub-2.00}/remove-gets.patch     |    0
>  ...-efi-native_1.99.bb =3D> grub-efi-native_2.00.bb} |   18 +-
>  .../grub/{grub_1.99.bb =3D> grub_2.00.bb}            |   20 +-
>  .../B921600.patch                                  |    0
>  .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   25 +
>  .../busybox-appletlib-dependency.patch             |    0
>  .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>  .../busybox-udhcpc-no_deconfig.patch               |   37 +-
>  .../{busybox-1.19.4 =3D> busybox-1.20.2}/defconfig   |   39 +-
>  .../fix-for-spurious-testsuite-failure.patch       |    0
>  .../get_header_tar.patch                           |    0
>  .../run-parts.in.usr-bin.patch                     |    0
>  .../sys_resource.patch                             |    0
>  .../watch.in.usr-bin.patch                         |    0
>  .../wget_dl_dir_fix.patch                          |    0
>  .../{busybox_1.19.4.bb =3D> busybox_1.20.2.bb}       |    9 +-
>  meta/recipes-core/coreutils/coreutils_8.14.bb      |    4 +-
>  .../eglibc/cross-localedef-native_2.15.bb          |   44 --
>  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ----
>  .../eglibc/eglibc-2.15/IO-acquire-lock-fix.patch   |   17 -
>  .../eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch  |   28 -
>  .../eglibc-2.15/eglibc-rpc-export-again.patch      |   72 ---
>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
>  .../eglibc_fix_findidx_parameters.patch            |   38 --
>  .../eglibc/eglibc-2.15/generate-supported.mk       |   11 -
>  .../eglibc-2.15/glibc-2.14-libdl-crash.patch       |  133 -----
>  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 -
>  .../eglibc/eglibc-2.15/ld-search-order.patch       |   56 --
>  .../eglibc/eglibc-2.15/ldso_arm_hf_support.patch   |  338 ------------
>  .../eglibc/eglibc-2.15/mips-rld-map-check.patch    |   26 -
>  .../eglibc/eglibc-2.15/multilib_readlib.patch      |   17 -
>  .../recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch |  538 --------------=
------
>  .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 ----
>  .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   81 ---
>  .../eglibc/eglibc-2.15/stack-protector-test.patch  |   35 --
>  .../use-localstatedir-for-vardbdir.patch           |   21 -
>  .../eglibc-2.15/use-sysroot-cxx-headers.patch      |   42 --
>  .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   36 --
>  meta/recipes-core/eglibc/eglibc-initial_2.15.bb    |    6 -
>  meta/recipes-core/eglibc/eglibc-locale_2.15.bb     |    1 -
>  meta/recipes-core/eglibc/eglibc_2.15.bb            |  239 ---------
>  meta/recipes-core/meta/external-python-tarball.bb  |    5 +
>  meta/recipes-core/tasks/task-base.bb               |    5 +-
>  meta/recipes-extended/cups/cups14.inc              |    1 +
>  meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
>  meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +-
>  ...lated-workarounds-in-cpu-features-detecti.patch |  145 ++++++
>  ...mplementation-of-pixman_blt-with-overlapp.patch |  127 +++++
>  meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb    |   11 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
>  meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +
>  scripts/bitbake                                    |    7 +-
>  scripts/bitbake-whatchanged                        |  342 +++++++++++++
>  scripts/combo-layer                                |    5 +-
>  scripts/oe-buildenv-internal                       |    5 +-
>  scripts/runqemu                                    |    4 +-
>  79 files changed, 946 insertions(+), 2724 deletions(-)
>  create mode 100644 meta/classes/external_package.bbclass
>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-stric=
t-aliasing-errors.patch
>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-unini=
tialized-var-errors.patch
>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patch
>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automak=
e_1.11.2.patch
>  rename meta/recipes-bsp/grub/files/{grub-1.99-disable-help2man.patch =3D=
> grub-2.00-disable-help2man.patch} (54%)
>  rename meta/recipes-bsp/grub/files/{grub-1.99-fix-enable_execute_stack-c=
heck.patch =3D> grub-2.00-fix-enable_execute_stack-check.patch} (92%)
>  rename meta/recipes-bsp/grub/files/{grub-1.99-fpmath-sse-387-fix.patch =
=3D> grub-2.00-fpmath-sse-387-fix.patch} (100%)
>  create mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.pat=
ch
>  delete mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.p=
atch
>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/40_custom (100%)
>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/grub-install.in.=
patch (100%)
>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/remove-gets.patc=
h (100%)
>  rename meta/recipes-bsp/grub/{grub-efi-native_1.99.bb =3D> grub-efi-nati=
ve_2.00.bb} (80%)
>  rename meta/recipes-bsp/grub/{grub_1.99.bb =3D> grub_2.00.bb} (64%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/B9=
21600.patch (100%)
>  create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20=
=2E2-kernel_ver.patch
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/bu=
sybox-appletlib-dependency.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/bu=
sybox-mkfs-minix-tests_bigendian.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/bu=
sybox-udhcpc-no_deconfig.patch (78%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/de=
fconfig (98%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/fi=
x-for-spurious-testsuite-failure.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/ge=
t_header_tar.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/ru=
n-parts.in.usr-bin.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/sy=
s_resource.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/wa=
tch.in.usr-bin.patch (100%)
>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/wg=
et_dl_dir_fix.patch (100%)
>  rename meta/recipes-core/busybox/{busybox_1.19.4.bb =3D> busybox_1.20.2.=
bb} (79%)
>  delete mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.15.=
bb
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_ma=
sk.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-=
fix.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/add_HAVE_ARM_PCS=
_VFP.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-expor=
t-again.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-arm-l=
owlevellock-include-tls.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_findi=
dx_parameters.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/generate-support=
ed.mk
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl=
-crash.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys.=
patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.=
patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ldso_arm_hf_supp=
ort.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-che=
ck.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/multilib_readlib=
=2Epatch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.=
patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk.=
patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/stack-protector-=
test.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/use-localstatedi=
r-for-vardbdir.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-=
headers.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.15.bb
>  delete mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.15.bb
>  delete mode 100644 meta/recipes-core/eglibc/eglibc_2.15.bb
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-r=
elated-workarounds-in-cpu-features-detecti.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C-=
implementation-of-pixman_blt-with-overlapp.patch
>  create mode 100755 scripts/bitbake-whatchanged
>=20
> --=20
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Az4VpBrmI9+OyhK/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA1w0cACgkQN1Ujt2V2gBwzzgCghLtxS1G4fk9IXnQBua6YZbe6
0gsAoJHS9b2g0bGxjbgyTzxq17uBFscD
=eXhk
-----END PGP SIGNATURE-----

--Az4VpBrmI9+OyhK/--
