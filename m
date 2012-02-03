Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtOZ9-0006Fz-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 20:12:59 +0100
Received: by lahc1 with SMTP id c1so1985192lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=iPliizEzuIToDjCDN/WZK5/jltSu6UF1f+dWnwMNDaY=;
	b=UTOhwGcQwtjnskLgKvGiTIyjnRdbKdcCNRZMbyLkuvO+UxE+BAhkzf+W+e/7/soxNm
	TFRa7qUnGTfW+/BVCrVVmYaRludy0VgKWTWZIzY7lT5rUDIxpRf4SCiijFH3HZ4el3Jq
	Mib0Kk7tAic5QnRWWrHuHbb4W8s3B7NvV0xA0=
Received: by 10.112.86.67 with SMTP id n3mr2186519lbz.29.1328295901274; Fri,
	03 Feb 2012 11:05:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Fri, 3 Feb 2012 11:04:31 -0800 (PST)
In-Reply-To: <cover.1328257913.git.raj.khem@gmail.com>
References: <cover.1328257913.git.raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Feb 2012 11:04:31 -0800
Message-ID: <CAMKF1soqdt1uG4HeS4AvQeU-EeQGaWHpnoss=FaoaHYUSRzVSw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/14] uclibc upgrade, initial kmod and thumb tune
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
X-List-Received-Date: Fri, 03 Feb 2012 19:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 3, 2012 at 12:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Some of these patches are resent with this request.
> kmod changes are experimental. I am looking for folks to try it out
> uclibc,zlib upgrade and other uclibc related changes are well tested

I have updated kmod so documentation builds for it.
uclibc needed a patch for ltp to compile.

>
> The following changes since commit 70e1226e8c10bf07d6c7b1e13d745ad603f2ec=
73:
>
> =C2=A0meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST =
section (2012-02-02 22:04:54 +0000)
>
> are available in the git repository at:
> =C2=A0git://git.openembedded.org/openembedded-core-contrib kraj/misc
> =C2=A0http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dkraj/misc
>
> Khem Raj (14):
> =C2=A0task-core-tools: Divide it into 3 recipes
> =C2=A0Enable options needed for ltp to compile
> =C2=A0arm/tune: Correct the logic which added thumb-interwork to OVERRIDE=
S
> =C2=A0tunearch/arm: Differentiate between thumb code generation and thumb
> =C2=A0 =C2=A0capability
> =C2=A0tune-thumb.inc: Delete
> =C2=A0uclibc: Get the thumb features from tune flags
> =C2=A0kmod: Add recipes
> =C2=A0module-init-tools: Delete
> =C2=A0image.bbclass,kernel.bbclass: Use kmod-native instead of
> =C2=A0 =C2=A0module-init-tools-cross
> =C2=A0pseudo: Wrap renameat and opendir
> =C2=A0uclibc: Upgrade recipes from 0.9.32 -> 0.9.33
> =C2=A0zlib: Upgrade 1.2.5 -> 1.2.6
> =C2=A0runqemu-internal: qemuarm can handle 256M
> =C2=A0gconf,consolekit: Avoid polkit when compiling with uclibc
>
> =C2=A0meta/classes/image.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/classes/kernel.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +-
> =C2=A0.../conf/distro/include/distro_tracking_fields.inc | =C2=A0 26 +-
> =C2=A0meta/conf/distro/include/tcmode-default.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../conf/machine/include/arm/feature-arm-thumb.inc | =C2=A0 20 +-
> =C2=A0meta/conf/machine/include/tune-strongarm1100.inc =C2=A0 | =C2=A0 =
=C2=A04 +-
> =C2=A0meta/conf/machine/include/tune-thumb.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 32 --
> =C2=A0meta/conf/multilib.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +-
> =C2=A0meta/recipes-core/tasks/task-core-tools-debug.bb =C2=A0 | =C2=A0 26=
 ++
> =C2=A0...sk-core-tools.bb =3D> task-core-tools-profile.bb} | =C2=A0 81 +-=
--
> =C2=A0.../recipes-core/tasks/task-core-tools-testapps.bb | =C2=A0 46 ++
> =C2=A0...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch | =C2=A0 29 --
> =C2=A0...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch | =C2=A0 33 --
> =C2=A0.../uclibc-0.9.32/detect-bx-availibility.patch =C2=A0 =C2=A0 | =C2=
=A0 75 ----
> =C2=A0.../uclibc/uclibc-0.9.32/epoll-asm-fix.patch =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 25 --
> =C2=A0.../uclibc/uclibc-0.9.32/include-arm-asm.h.patch =C2=A0 | =C2=A0 65=
 ---
> =C2=A0.../uclibc/uclibc-0.9.32/mount.h-update.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 85 ----
> =C2=A0.../uclibc-0.9.32/remove-eabi-oabi-selection.patch | =C2=A0 91 ----
> =C2=A0.../uclibc-0.9.32/remove-sub-arch-variants.patch =C2=A0 | =C2=A0215=
 ---------
> =C2=A0.../uclibc/uclibc-0.9.32/rtld_no.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0215 ---------
> =C2=A0.../uclibc/uclibc-0.9.32/select-force-thumb.patch =C2=A0| =C2=A0172=
 --------
> =C2=A0.../uclibc/uclibc-0.9.32/sync_file_range2.patch =C2=A0 =C2=A0| =C2=
=A0 47 --
> =C2=A0.../uclibc-0.9.32/transform-eabi-oabi-choice.patch | =C2=A0 71 ---
> =C2=A0.../uclibc-0.9.32/uclibc-arm-ftruncate64.patch =C2=A0 =C2=A0 | =C2=
=A0 13 -
> =C2=A0.../uclibc-0.9.32/uclibc_scheduler_update.patch =C2=A0 =C2=A0| =C2=
=A0455 --------------------
> =C2=A0...0001-stat-Use-stat64-syscall-if-available.patch | =C2=A0 95 ++++
> =C2=A0.../argp-headers.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0.../argp-support.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +
> =C2=A0.../compile-arm-fork-with-O2.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0.../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch =C2=A0 =C2=A0| =C2=
=A0 25 ++
> =C2=A0meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch =C2=A0| =C2=A0 37=
 ++
> =C2=A0...so_use_arm_dl_linux_resolve_in_thumb_mode.patch | =C2=A0 =C2=A06=
 +
> =C2=A0.../libc_symbols_include_bits_uclibc_config.patch =C2=A0| =C2=A0 19=
 +
> =C2=A0.../mips/uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../orign_path.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 94 ++-=
-
> =C2=A0.../powerpc_copysignl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +
> =C2=A0.../remove_attribute_optimize_Os.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 17 +-
> =C2=A0.../{uclibc-0.9.32 =3D> uclibc-0.9.33}/uClibc.distro | =C2=A0 =C2=
=A08 +-
> =C2=A0.../uClibc.machine =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A00
> =C2=A0.../uclibc-execvpe.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +
> =C2=A0.../uclibc_enable_log2_test.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A05 +
> =C2=A0meta/recipes-core/uclibc/uclibc-config.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A04 +-
> =C2=A0meta/recipes-core/uclibc/uclibc-git/uClibc.distro =C2=A0| =C2=A0 =
=C2=A05 +
> =C2=A0...-initial_0.9.32.bb =3D> uclibc-initial_0.9.33.bb} | =C2=A0 =C2=
=A00
> =C2=A0meta/recipes-core/uclibc/uclibc.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0.../uclibc/{uclibc_0.9.32.bb =3D> uclibc_0.9.33.bb} =C2=A0| =C2=A0 =
25 +-
> =C2=A0meta/recipes-core/zlib/files/Makefile.am =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A09 -
> =C2=A0meta/recipes-core/zlib/files/configure.ac =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 48 --
> =C2=A0.../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch =C2=A0 | =C2=A0 20=
 -
> =C2=A0meta/recipes-core/zlib/zlib_1.2.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 41 --
> =C2=A0meta/recipes-core/zlib/zlib_1.2.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 26 ++
> =C2=A0meta/recipes-devtools/pseudo/pseudo/opendir.patch =C2=A0| =C2=A0 92=
 ++++
> =C2=A0meta/recipes-devtools/pseudo/pseudo/renameat.patch | =C2=A0227 ++++=
++++++
> =C2=A0meta/recipes-devtools/pseudo/pseudo_1.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A06 +-
> =C2=A0meta/recipes-gnome/gnome/gconf_3.2.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +-
> =C2=A0meta/recipes-kernel/kmod/kmod-native_git.bb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 16 +
> =C2=A0meta/recipes-kernel/kmod/kmod.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 35 ++
> =C2=A0...001-depmod-Dont-use-errno-unconditionally.patch | =C2=A0101 ++++=
+
> =C2=A0meta/recipes-kernel/kmod/kmod/depmod-search.conf =C2=A0 | =C2=A0 =
=C2=A06 +
> =C2=A0meta/recipes-kernel/kmod/kmod_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 62 +++
> =C2=A0.../module-init-tools/files/disable_man.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 25 --
> =C2=A0.../files/grab_module_memset.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 21 -
> =C2=A0.../files/modutils_extension.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 25 --
> =C2=A0.../module-init-tools-cross_3.16.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 -
> =C2=A0.../module-init-tools/module-init-tools.inc =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 24 -
> =C2=A0.../module-init-tools/module-init-tools_3.16.bb =C2=A0 =C2=A0| =C2=
=A0 42 --
> =C2=A0.../files/PD.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A00
> =C2=A0.../files/modutils.sh =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../modutils-initscripts.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
> =C2=A0.../recipes-support/consolekit/consolekit_0.4.5.bb | =C2=A0 11 +-
> =C2=A0scripts/runqemu-internal =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 13 +-
> =C2=A071 files changed, 1010 insertions(+), 2059 deletions(-)
> =C2=A0delete mode 100644 meta/conf/machine/include/tune-thumb.inc
> =C2=A0create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
> =C2=A0rename meta/recipes-core/tasks/{task-core-tools.bb =3D> task-core-t=
ools-profile.bb} (48%)
> =C2=A0create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps=
.bb
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-Conf=
ig.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips=
-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx=
-availibility.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm=
-fix.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/include-a=
rm-asm.h.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-u=
pdate.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-ea=
bi-oabi-selection.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-su=
b-arch-variants.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.p=
atch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/select-fo=
rce-thumb.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file=
_range2.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/transform=
-eabi-oabi-choice.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-ar=
m-ftruncate64.patch
> =C2=A0delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_sc=
heduler_update.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-stat=
-Use-stat64-syscall-if-available.patch
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
argp-headers.patch (99%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
argp-support.patch (99%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
compile-arm-fork-with-O2.patch (97%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MS=
G_CMSG_CLOEXEC.patch
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patc=
h
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (86%)
> =C2=A0create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symb=
ols_include_bits_uclibc_config.patch
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
mips/uClibc.machine (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
orign_path.patch (64%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
powerpc_copysignl.patch (96%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
remove_attribute_optimize_Os.patch (93%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
uClibc.distro (96%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
uClibc.machine (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
uclibc-execvpe.patch (99%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-0.9.32 =3D> uclibc-0.9.33}/=
uclibc_enable_log2_test.patch (81%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc-initial_0.9.32.bb =3D> ucli=
bc-initial_0.9.33.bb} (100%)
> =C2=A0rename meta/recipes-core/uclibc/{uclibc_0.9.32.bb =3D> uclibc_0.9.3=
3.bb} (45%)
> =C2=A0delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
> =C2=A0delete mode 100644 meta/recipes-core/zlib/files/configure.ac
> =C2=A0delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.L=
FS.logic.patch
> =C2=A0delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
> =C2=A0create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.patc=
h
> =C2=A0create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.pat=
ch
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod.inc
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-u=
se-errno-unconditionally.patch
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/files/disa=
ble_man.patch
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/files/grab=
_module_memset.patch
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/files/modu=
tils_extension.patch
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/module-ini=
t-tools-cross_3.16.bb
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/module-ini=
t-tools.inc
> =C2=A0delete mode 100644 meta/recipes-kernel/module-init-tools/module-ini=
t-tools_3.16.bb
> =C2=A0rename meta/recipes-kernel/{module-init-tools =3D> modutils-initscr=
ipts}/files/PD.patch (100%)
> =C2=A0rename meta/recipes-kernel/{module-init-tools =3D> modutils-initscr=
ipts}/files/modutils.sh (100%)
> =C2=A0rename meta/recipes-kernel/{module-init-tools =3D> modutils-initscr=
ipts}/modutils-initscripts.bb (100%)
>
> --
> 1.7.5.4
>


