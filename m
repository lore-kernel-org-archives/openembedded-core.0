Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7662371E21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 19:51:45 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id x23so5417341pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bMeh83oL0FVgZVmiKIcgOplaHChgDpdN0+sV8axpntk=;
	b=UDhq4ZVWRrtQPvTxJlMePtcZDog3m2aZYapHgDkSc+Z3NhHP3NBr5f+UU3cYl1ISGA
	Y7LCdnXVQmpS36JB5KwG7xOoSz/wK95+3kAlxbJIunvtVzmnwxQoJLJiHNCgd8xRyXis
	zbNUV349Qo9mzKvcnjrqzQev4Wh2vhgWyIuoR7sveNjMEY6a2+EX6mZNPyiw6nN6K4V+
	k/Djv0l0O9qaogpAVFzz2dh7NSWgq256ZnBSKiUAgQbuR2wuvouvWa+0wi6YYPCBmM7r
	8P60dgV+VQ1WtVwq53JKltfw9l/7YHKq/m8rJh45Tu5VaNpObEiz+Cpr8ZDv3BTXbDA6
	fbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bMeh83oL0FVgZVmiKIcgOplaHChgDpdN0+sV8axpntk=;
	b=AyOrES5dZWgOkUqccQd7t4RawdxZIKeSrHdIFjHH26DWS/TZ6Xo1sP61XrV1e4zIZe
	eTfXDMnmaPfaZ76+IcOH6MBWnOL8QSgHJwKNE0cJmOLFqAVLvn0D2N9+vyDw4Qqr27vg
	aQQSd9EXTJIBK4Pthwtytx5pkf8iwVcqTanEvSsV60lVxUwZ8O5Ngwy8Q5V4xPm9BIxN
	jQ/c/UMe8IL3Pr6fc9ycZvJKAmbKfbf3mXQcAuV+zGZ52RTh/DqTvVqWYQp2e23Qo4d3
	BS3DozYhP58r2SgKRZ8UKqn2bKQHiGe+fdiCWuMPku62yGSTA8bmvxI+1JXzf/g4PyK0
	lCKA==
X-Gm-Message-State: AKaTC01xxtwGr1zibWzO7FCZ27rs22qak7iA2levbGFOyRJCZOwJ03TzNtgfKpwQpGnZyA==
X-Received: by 10.99.137.66 with SMTP id v63mr179422411pgd.117.1481658706915; 
	Tue, 13 Dec 2016 11:51:46 -0800 (PST)
Received: from Pahoa2.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:14e6:567c:25ef:8428])
	by smtp.gmail.com with ESMTPSA id
	z9sm82285037pge.44.2016.12.13.11.51.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Dec 2016 11:51:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 11:50:12 -0800
Message-Id: <cover.1481658342.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/91] Morty pull request
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
X-List-Received-Date: Tue, 13 Dec 2016 19:51:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Cover letter only.

Please consider these changes for Morty-next.

The following changes since commit 5aa481dfedfd089f0d6e8a3bae1b84134d5dff4c:

  ref-manual: Added KERNEL_IMAGE_BASE_NAME change to 2.2 migration (2016-12-08 16:36:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/morty-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/morty-next

Alejandro Hernandez (3):
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.1
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.4
  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.8

Alexander Kanavin (1):
  grub2: enforce -no-pie if supported by compiler

Alexandre Belloni (1):
  insane: Add aarch64 baremetal mappings to the QA arch test

Andreas Oberritter (5):
  kernel.bbclass: allow uncompressed initramfs archives
  kernel.bbclass: Use real filenames in kernel packages
  kernel.bbclass: Avoid wildcards for kernel images
  kernel.bbclass: do not copy bundled initramfs to /boot
  kernel.bbclass: fix kernel_do_compile for KERNEL_IMAGETYPE =
    "vmlinux.gz" on mips

André Draszik (2):
  cve-check.bbclass: CVE-2014-2524 / readline v5.2
  openssl: fix bashism in c_rehash shell script

Aníbal Limón (1):
  perl: Fix ptest update hash of ExtUtils/Liblist/Kid.pm in
    customized.dat

Armin Kuster (2):
  tzcode: update to 2016i
  tzdata: update to 2016i

Bruce Ashfield (20):
  linux-yocto/4.8: update to 4.8.6
  linux-yocto/4.8: fix cryptodev compilation error
  linux-yocto/4.4: update to v4.4.30
  linux-yocto/4.1: update to v4.1.35
  linux-yocto/4.8: update to v4.8.6-rt5
  linux-yocto/4.8: update from v4.8.6 -> v4.8.8
  linux-yocto/4.4: update to v4.4.32
  kern-tools: error checking and tree generation fixes
  linux-yocto/4.8: update to v4.8.10
  linux-yocto-dev: update to 4.9-rcX
  kern-tools: fix processing for no branch meta-data
  kernel-yocto: exit on non-zero return code
  linux-yocto/4.8: aufs warning and ixgbe calltrace
  linux-yocto/4.4/4.8: Fix remaining kernel_configcheck warnings in
    Intel BSPs
  linux-yoct/4.1: update to v4.1.36
  linux-yocto/4.4: update to v4.4.36
  linux-yocto/4.8: update to v4.8.12
  kern-tools: ensure that no shared directories are used
  linux-yocto-rt/4.4: update to -rt43
  linux-yocto/4.x: CVE-2016-8655

California Sullivan (1):
  parselogs.py: Whitelist iwlwifi firmware load error messages

Daniel Díaz (1):
  weston: Add no-input-device patch to 1.11.0.

David Vincent (1):
  slang: Disable parallel make install

Ed Bartosh (2):
  systemd-bootdisk.wks: use PARTUUID
  qemux86*.conf: set wic-related parameters

Fabio Berton (1):
  binutils: Fix build for c293pcie PPC machine

Jair Gonzalez (1):
  parselogs: Whitelist GPT warnings as the device is fully functional

Kai Kang (3):
  openssh: fix CVE-2016-8858
  qemu: fix CVE-2016-7909
  qemu: update run-ptest script

Kevin Hao (1):
  meta-yocto-bsp: bump to the latest stable linux kernel for the non-x86
    BSPs

Khem Raj (3):
  libbsd: Fix build with musl
  cmake.bbclass: Set CXXFLAGS and CFLAGS
  arch-arm64.inc: Include arch-armv7ve.inc

Koen Kooi (1):
  libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk

Li Zhou (1):
  db: disable the ARM assembler mutex code

Maciej Borzecki (3):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos

Mark Asselstine (1):
  systemd.bbclass: don't block on service restart

Martin Vuille (1):
  terminal.py: Pass string instead of bytes to ExecutionError to avoid
    exception

Mingli Yu (3):
  tiff: Security fix CVE-2016-9535
  tiff: Security fix CVE-2016-9538
  tiff: Fix several CVE issues

Patrick Ohly (2):
  pseudo: include fix for xattr corruption
  scripts/send-pull-request: Avoid multiple chain headers

Paul Eggleton (1):
  recipetool: fix encoding-related errors creating python recipes

Richard Purdie (7):
  bitbake: bitbake-worker: Handle cooker/worker IO deadlocking
  staging: Drop unused SYSROOT_LOCK
  attr: Convert SSTATEPOSTINSTFUNCS to a do_install_append
  subversion: Fix issues in LDFLAGS sed manipulation
  bitbake: utils: Avoid traceback errors
  bitbake: cooker: Fix world taskgraph generation issue
  bitbake: cooker: Handle inofity queue overflows more gracefully

Robert Yang (2):
  qemuarm64.conf: make runqemu's graphics work
  diffutils: do_configure: fix "Argument list too long"

Ross Burton (11):
  Revert "libwnck3: remove the recipe"
  Revert "epiphany: remove unnecessary libwnck3 dependency"
  lib/oe/qa: handle binaries with segments outside the first 4kb
  systemtap: remove explicit msgfmt check
  systemtap: fix native linking on recent Ubuntu
  conf: add C++ flags for uninative interoperatility
  insane: fix expanded-d test
  insane: factor out the test matrix processing
  insane: add QAPKGTEST, a package-wide equivilant to QAPATHTEST
  insane: rewrite the expanded-d test as a QAPKGTEST
  tiff: set CVE NAME

Samuli Piippo (1):
  mesa: make sure GLES3 headers are installed

T.O. Radzy Radzykewycz (1):
  OpenSSL: CVE-2004-2761 replace MD5 hash algorithm

Yi Zhao (4):
  openssl: Security fix CVE-2016-7055
  nfs-utils: fix protocol minor version fall-back
  tiff: Security fix CVE-2016-3632
  libxml2: Security fix CVE-2016-5131

Zhixiong Chi (3):
  tiff: Security fix CVE-2016-3658
  tiff: Security fix CVE-2016-9540
  tiff: Security fix CVE-2016-9539

 bitbake/bin/bitbake-worker                         |  52 ++-
 bitbake/lib/bb/cooker.py                           |  22 +-
 bitbake/lib/bb/utils.py                            |   2 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |  20 +-
 .../recipes-kernel/linux/linux-yocto_4.4.bbappend  |  20 +-
 .../recipes-kernel/linux/linux-yocto_4.8.bbappend  |  20 +-
 meta/classes/cmake.bbclass                         |   2 +
 meta/classes/cve-check.bbclass                     |   2 +-
 meta/classes/insane.bbclass                        | 101 +++--
 meta/classes/kernel-yocto.bbclass                  |   1 -
 meta/classes/kernel.bbclass                        |  15 +-
 meta/classes/staging.bbclass                       |   1 -
 meta/classes/systemd.bbclass                       |   2 +-
 meta/classes/uninative.bbclass                     |  11 -
 meta/conf/distro/defaultsetup.conf                 |   3 +-
 meta/conf/distro/include/uninative-flags.inc       |   9 +
 meta/conf/machine/include/arm/arch-arm64.inc       |   2 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/conf/machine/qemux86-64.conf                  |   3 +
 meta/conf/machine/qemux86.conf                     |   3 +
 meta/lib/oe/qa.py                                  |  82 ++--
 meta/lib/oe/terminal.py                            |   2 +
 meta/lib/oeqa/runtime/parselogs.py                 |   6 +-
 ...nforce-no-pie-if-the-compiler-supports-it.patch |  45 +++
 meta/recipes-bsp/grub/grub2.inc                    |   1 +
 .../fix-protocol-minor-version-fall-back.patch     |  55 +++
 .../nfs-utils/nfs-utils_1.3.3.bb                   |   1 +
 .../openssh/openssh/fix-CVE-2016-8858.patch        |  39 ++
 meta/recipes-connectivity/openssh/openssh_7.3p1.bb |   1 +
 .../openssl/openssl/CVE-2016-7055.patch            |  43 +++
 .../Use-SHA256-not-MD5-as-default-digest.patch     |  69 ++++
 .../openssl/openssl/openssl-c_rehash.sh            |   2 +-
 .../recipes-connectivity/openssl/openssl_1.0.2j.bb |   1 +
 .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 +++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
 meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
 ...01-ppc-apuinfo-for-spe-parsed-incorrectly.patch |  37 ++
 .../perl/perl/perl-test-customized.patch           |   2 +-
 .../pseudo/files/More-correctly-fix-xattrs.patch   |  37 ++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   2 +-
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         |  42 ++
 meta/recipes-devtools/qemu/qemu/run-ptest          |   8 +-
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |   1 +
 .../subversion/subversion/serfmacro.patch          |  22 ++
 .../subversion/subversion_1.9.4.bb                 |   1 +
 meta/recipes-extended/diffutils/diffutils_3.4.bb   |   3 +
 meta/recipes-extended/slang/slang_2.3.0.bb         |   1 +
 ...code-native_2016h.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016h.bb => tzdata_2016i.bb}    |   4 +-
 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb     |   4 +-
 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb      |  19 +
 meta/recipes-graphics/mesa/mesa.inc                |   3 +
 ...on-1.11-config-option-for-no-input-device.patch | 123 ++++++
 meta/recipes-graphics/wayland/weston_1.11.0.bb     |   1 +
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.8.bb       |  20 +-
 .../systemtap/systemtap/fix-monitor-linking.patch  |  41 ++
 .../systemtap/systemtap/no-msgfmt-check.patch      |  15 +
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   2 +
 .../libtiff/files/CVE-2016-3632.patch              |  34 ++
 .../libtiff/files/CVE-2016-3658.patch              | 111 ++++++
 .../libtiff/files/CVE-2016-9535-1.patch            | 423 +++++++++++++++++++++
 .../libtiff/files/CVE-2016-9535-2.patch            |  67 ++++
 .../libtiff/files/CVE-2016-9538.patch              |  67 ++++
 .../libtiff/files/CVE-2016-9539.patch              |  60 +++
 .../libtiff/files/CVE-2016-9540.patch              |  60 +++
 .../libtiff/files/Fix_several_CVE_issues.patch     | 281 ++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |  10 +
 meta/recipes-support/attr/ea-acl.inc               |  47 ++-
 meta/recipes-support/db/db_6.0.35.bb               |   9 -
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 363 ++++++++++++++++++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  55 +++
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch | 130 +++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |   7 +
 scripts/lib/recipetool/create_buildsys_python.py   |   4 +-
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks    |   2 +-
 scripts/lib/wic/partition.py                       |  16 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   4 +-
 scripts/send-pull-request                          |   9 +-
 91 files changed, 2791 insertions(+), 273 deletions(-)
 create mode 100644 meta/conf/distro/include/uninative-flags.inc
 create mode 100644 meta/recipes-bsp/grub/files/0001-Enforce-no-pie-if-the-compiler-supports-it.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/fix-protocol-minor-version-fall-back.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-7055.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/Use-SHA256-not-MD5-as-default-digest.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-ppc-apuinfo-for-spe-parsed-incorrectly.patch
 create mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/serfmacro.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)
 create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
 create mode 100644 meta/recipes-graphics/wayland/weston/weston-1.11-config-option-for-no-input-device.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3632.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3658.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9535-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9538.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9539.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-9540.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/Fix_several_CVE_issues.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch

-- 
2.3.5


