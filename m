Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T4P0U-0005lf-M2
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 06:26:58 +0200
Received: by qcad10 with SMTP id d10so223554qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 21:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=63yccgqjUfxlnO5DHPonSfqiML+dWy3GWv3+6Ad+n6E=;
	b=cQoN+vRFurLGh8tBW62XO1a3k3fCJAVVjsTVwZDdA9MIGCrPLTHdcgv6EicgSzy42Q
	7neELxJC4IiB3bdqK7sN4+DnQ09q5ehm7qgJsjQBJMPKbO3e9ncklKNuz/pfVpgn44P1
	Um6+YEo4GfvivmcGKhhxRPHSFQFCKCpxkMBTFOoEw7x5utNyg1rZyI/t3f+Mm9+k6uwi
	N4PvMcvuy/7Djjes3OGyyvvUGs5zDeFv93yId+cDMYh2ce8kKd8wC2o6ehCd4OFf8yVN
	Rx4tNW7golL6kb1QSXrtEXA6cIYJwqpyZSGymPRP797s2SKyEiwUkXX+QeZaasdKiRU8
	OySQ==
MIME-Version: 1.0
Received: by 10.229.106.36 with SMTP id v36mr56866qco.92.1345695292193; Wed,
	22 Aug 2012 21:14:52 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 22 Aug 2012 21:14:52 -0700 (PDT)
In-Reply-To: <CADkTA4M3_GzpQ5Lt5sLrDOOfaUh2Tn_rV1Mm5v7VqCvmTo_j+Q@mail.gmail.com>
References: <cover.1345694080.git.sgw@linux.intel.com>
	<CADkTA4M3_GzpQ5Lt5sLrDOOfaUh2Tn_rV1Mm5v7VqCvmTo_j+Q@mail.gmail.com>
Date: Thu, 23 Aug 2012 00:14:52 -0400
Message-ID: <CADkTA4Ok7sy6d003oOCeATejFFW5QKgFG+BXMo=c7RDmdaR-MA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/22] Bugfixes and Features (cover letter only)
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
X-List-Received-Date: Thu, 23 Aug 2012 04:26:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 23, 2012 at 12:11 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Aug 22, 2012 at 11:56 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> Richard,
>>
>> This set has a number of bug fixes and cleanups along
>> with some updates.  This includes an update to BusyBox
>> which has a cooresponding update in meta-yocto, please
>> pull both.
>>
>> I have also included Robert's feature to install external
>> binary packages, please review these.
>>
>> Thanks
>>         Sau!
>>
>> The following changes since commit e3b0925f4c861393e436deb6b1912f9f1f325=
d1e:
>>
>>   libtool: normalize link paths before considering for RPATH (2012-08-22=
 14:22:51 +0100)
>>
>> are available in the git repository at:
>>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>>
>> Andreas M=FCller (1):
>>   pixman: merge meta-oe append into oe-core
>>
>> Christopher Larson (1):
>>   task-base: pull in the bluez asound module when appropriate
>>
>> Khem Raj (5):
>>   runqemu: Honor KERNEL and ROOTFS settings from environment
>>   linux-yocto: Remove parens from COMPATIBLE_MACHINE regexp
>>   kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
>
> I had a few comments on this one .. it would have been appropriate to wai=
t a

s/would/might/

bah. 'night.

Bruce

> bit longer before queuing it for merge.
>
> Cheers,
>
> Bruce
>
>>   eglibc-2.15: Delete
>>   iputils: Fix postinst to run on cross rootfs generation
>>
>> Paul Eggleton (1):
>>   scripts/combo-layer: specify branch when getting current revision
>>
>> Radu Moisan (3):
>>   grub: Update to upstream stable 2.00
>>   grub-efi-native: Update to version 2.00
>>   busybox: Upgrade to upstream 1.20.2
>>
>> Richard Purdie (1):
>>   gmp-4.2.1: Set CC_FOR_BUILD to ensure the host system compiler is
>>     used, not the target one
>>
>> Robert Yang (5):
>>   bitbake.conf: add STAMPS_DIR for constructing STAMP
>>   bitbake-whatchanged: print what is about to happen
>>   rpm: install external binary packages
>>   ipk: install external binary packages
>>   deb: install external binary packages
>>
>> Roy.Li (1):
>>   bitbake: compile tar-replacement firstly
>>
>> Saul Wold (2):
>>   cups: disable pdftops
>>   external-python-tarball: Blacklist recipe if ipk is not in the
>>     PACKAGE_CLASSES list
>>
>> Wenzong Fan (1):
>>   coreutils: fix do_configure error with long TMPDIR
>>
>> Xin Ouyang (1):
>>   grub-1.99: Add flex-native to DEPENDS
>>
>>  meta/classes/external_package.bbclass              |   91 ++++
>>  meta/classes/kernel.bbclass                        |    9 +-
>>  meta/classes/module-base.bbclass                   |    9 +-
>>  meta/classes/package_deb.bbclass                   |   44 +-
>>  meta/classes/package_ipk.bbclass                   |   22 +-
>>  meta/classes/package_rpm.bbclass                   |   13 +-
>>  meta/classes/rootfs_deb.bbclass                    |    2 +-
>>  meta/classes/rootfs_ipk.bbclass                    |    2 +-
>>  meta/classes/rootfs_rpm.bbclass                    |    2 +-
>>  meta/conf/bitbake.conf                             |    3 +-
>>  ...rub-1.99-gcc-4.7.0-strict-aliasing-errors.patch |  147 ------
>>  ...b-1.99-gcc-4.7.0-uninitialized-var-errors.patch |   41 --
>>  .../grub/files/grub-1.99-gcc-4.7.0.patch           |   34 --
>>  .../files/grub-1.99_fix_for_automake_1.11.2.patch  |  179 -------
>>  ...2man.patch =3D> grub-2.00-disable-help2man.patch} |  117 +----
>>  ...grub-2.00-fix-enable_execute_stack-check.patch} |    8 +-
>>  ...ix.patch =3D> grub-2.00-fpmath-sse-387-fix.patch} |    0
>>  .../grub/files/grub-no-unused-result.patch         |   18 +
>>  .../grub/grub-1.99/grub-1.99-lazy_stat.patch       |   64 ---
>>  .../grub/{grub-1.99 =3D> grub-2.00}/40_custom        |    0
>>  .../{grub-1.99 =3D> grub-2.00}/grub-install.in.patch |    0
>>  .../{grub-1.99 =3D> grub-2.00}/remove-gets.patch     |    0
>>  ...-efi-native_1.99.bb =3D> grub-efi-native_2.00.bb} |   18 +-
>>  .../grub/{grub_1.99.bb =3D> grub_2.00.bb}            |   20 +-
>>  .../B921600.patch                                  |    0
>>  .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   25 +
>>  .../busybox-appletlib-dependency.patch             |    0
>>  .../busybox-mkfs-minix-tests_bigendian.patch       |    0
>>  .../busybox-udhcpc-no_deconfig.patch               |   37 +-
>>  .../{busybox-1.19.4 =3D> busybox-1.20.2}/defconfig   |   39 +-
>>  .../fix-for-spurious-testsuite-failure.patch       |    0
>>  .../get_header_tar.patch                           |    0
>>  .../run-parts.in.usr-bin.patch                     |    0
>>  .../sys_resource.patch                             |    0
>>  .../watch.in.usr-bin.patch                         |    0
>>  .../wget_dl_dir_fix.patch                          |    0
>>  .../{busybox_1.19.4.bb =3D> busybox_1.20.2.bb}       |    9 +-
>>  meta/recipes-core/coreutils/coreutils_8.14.bb      |    4 +-
>>  .../eglibc/cross-localedef-native_2.15.bb          |   44 --
>>  .../eglibc/eglibc-2.15/GLRO_dl_debug_mask.patch    |  108 ----
>>  .../eglibc/eglibc-2.15/IO-acquire-lock-fix.patch   |   17 -
>>  .../eglibc/eglibc-2.15/add_HAVE_ARM_PCS_VFP.patch  |   28 -
>>  .../eglibc-2.15/eglibc-rpc-export-again.patch      |   72 ---
>>  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 -
>>  .../eglibc_fix_findidx_parameters.patch            |   38 --
>>  .../eglibc/eglibc-2.15/generate-supported.mk       |   11 -
>>  .../eglibc-2.15/glibc-2.14-libdl-crash.patch       |  133 -----
>>  .../eglibc/eglibc-2.15/initgroups_keys.patch       |   20 -
>>  .../eglibc/eglibc-2.15/ld-search-order.patch       |   56 --
>>  .../eglibc/eglibc-2.15/ldso_arm_hf_support.patch   |  338 ------------
>>  .../eglibc/eglibc-2.15/mips-rld-map-check.patch    |   26 -
>>  .../eglibc/eglibc-2.15/multilib_readlib.patch      |   17 -
>>  .../recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch |  538 -------------=
-------
>>  .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 ----
>>  .../eglibc/eglibc-2.15/relocatable_sdk.patch       |   81 ---
>>  .../eglibc/eglibc-2.15/stack-protector-test.patch  |   35 --
>>  .../use-localstatedir-for-vardbdir.patch           |   21 -
>>  .../eglibc-2.15/use-sysroot-cxx-headers.patch      |   42 --
>>  .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   36 --
>>  meta/recipes-core/eglibc/eglibc-initial_2.15.bb    |    6 -
>>  meta/recipes-core/eglibc/eglibc-locale_2.15.bb     |    1 -
>>  meta/recipes-core/eglibc/eglibc_2.15.bb            |  239 ---------
>>  meta/recipes-core/meta/external-python-tarball.bb  |    5 +
>>  meta/recipes-core/tasks/task-base.bb               |    5 +-
>>  meta/recipes-extended/cups/cups14.inc              |    1 +
>>  meta/recipes-extended/cups/cups_1.4.6.bb           |    2 +-
>>  meta/recipes-extended/iputils/iputils_s20101006.bb |    6 +-
>>  ...lated-workarounds-in-cpu-features-detecti.patch |  145 ++++++
>>  ...mplementation-of-pixman_blt-with-overlapp.patch |  127 +++++
>>  meta/recipes-graphics/xorg-lib/pixman_0.27.2.bb    |   11 +-
>>  meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
>>  meta/recipes-kernel/linux/linux-yocto_3.2.bb       |    2 +-
>>  meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
>>  meta/recipes-support/gmp/gmp_4.2.1.bb              |    2 +
>>  scripts/bitbake                                    |    7 +-
>>  scripts/bitbake-whatchanged                        |  342 +++++++++++++
>>  scripts/combo-layer                                |    5 +-
>>  scripts/oe-buildenv-internal                       |    5 +-
>>  scripts/runqemu                                    |    4 +-
>>  79 files changed, 946 insertions(+), 2724 deletions(-)
>>  create mode 100644 meta/classes/external_package.bbclass
>>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-stri=
ct-aliasing-errors.patch
>>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0-unin=
itialized-var-errors.patch
>>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99-gcc-4.7.0.patc=
h
>>  delete mode 100644 meta/recipes-bsp/grub/files/grub-1.99_fix_for_automa=
ke_1.11.2.patch
>>  rename meta/recipes-bsp/grub/files/{grub-1.99-disable-help2man.patch =
=3D> grub-2.00-disable-help2man.patch} (54%)
>>  rename meta/recipes-bsp/grub/files/{grub-1.99-fix-enable_execute_stack-=
check.patch =3D> grub-2.00-fix-enable_execute_stack-check.patch} (92%)
>>  rename meta/recipes-bsp/grub/files/{grub-1.99-fpmath-sse-387-fix.patch =
=3D> grub-2.00-fpmath-sse-387-fix.patch} (100%)
>>  create mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.pa=
tch
>>  delete mode 100644 meta/recipes-bsp/grub/grub-1.99/grub-1.99-lazy_stat.=
patch
>>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/40_custom (100%=
)
>>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/grub-install.in=
.patch (100%)
>>  rename meta/recipes-bsp/grub/{grub-1.99 =3D> grub-2.00}/remove-gets.pat=
ch (100%)
>>  rename meta/recipes-bsp/grub/{grub-efi-native_1.99.bb =3D> grub-efi-nat=
ive_2.00.bb} (80%)
>>  rename meta/recipes-bsp/grub/{grub_1.99.bb =3D> grub_2.00.bb} (64%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/B=
921600.patch (100%)
>>  create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.2=
0.2-kernel_ver.patch
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/b=
usybox-appletlib-dependency.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/b=
usybox-mkfs-minix-tests_bigendian.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/b=
usybox-udhcpc-no_deconfig.patch (78%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/d=
efconfig (98%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/f=
ix-for-spurious-testsuite-failure.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/g=
et_header_tar.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/r=
un-parts.in.usr-bin.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/s=
ys_resource.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/w=
atch.in.usr-bin.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox-1.19.4 =3D> busybox-1.20.2}/w=
get_dl_dir_fix.patch (100%)
>>  rename meta/recipes-core/busybox/{busybox_1.19.4.bb =3D> busybox_1.20.2=
.bb} (79%)
>>  delete mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.15=
.bb
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/GLRO_dl_debug_m=
ask.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock=
-fix.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/add_HAVE_ARM_PC=
S_VFP.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-expo=
rt-again.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-arm-=
lowlevellock-include-tls.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/eglibc_fix_find=
idx_parameters.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/generate-suppor=
ted.mk
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libd=
l-crash.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/initgroups_keys=
.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ld-search-order=
.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ldso_arm_hf_sup=
port.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-ch=
eck.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/multilib_readli=
b.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite=
.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/relocatable_sdk=
.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/stack-protector=
-test.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/use-localstated=
ir-for-vardbdir.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx=
-headers.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.15.bb
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.15.bb
>>  delete mode 100644 meta/recipes-core/eglibc/eglibc_2.15.bb
>>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-ARM-qemu-=
related-workarounds-in-cpu-features-detecti.patch
>>  create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0002-Generic-C=
-implementation-of-pixman_blt-with-overlapp.patch
>>  create mode 100755 scripts/bitbake-whatchanged
>>
>> --
>> 1.7.7.6
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


