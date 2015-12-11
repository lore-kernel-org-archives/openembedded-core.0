Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8AF60796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:24:14 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id l68so21229859wml.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=6xx4JjIzJz3LzQJgScnFEA+IqQfFSMf0oyYNx0XBqmg=;
	b=NmsfvlTA7HVHXCSOt6iZnVJ537aAfvSGLP6oqYqP+ISknOHTdW/jNBNBPn9vtM9fs6
	dAvl6Yq+xRC+98OaLSWCCkZHJO2SnrfBaiP+PsGoIF5jWOTZ207uiVdMuSTIf8K65OTR
	uQDLAsD3uQTlwFFe4CjIFetkyOGT8iDMnzg37vBRguNVVQv4HxoCWG5bJU18i8skAa7R
	ho/SgGJlXcZu/EQuogMa22jENv9vsdLCK0zFY162XkoGbZqHTWPknr7FxUSYKcvr5TRR
	snAZsFhM6o+Od4A934IlXS8T6yOIWGozCeom4LOcdENbPBmwbhKMy3oGg7nKd2R4Y1JS
	vD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=6xx4JjIzJz3LzQJgScnFEA+IqQfFSMf0oyYNx0XBqmg=;
	b=f3JaF9oZxTORIGMNDOEqTZV+Cf6jD7Q9RKdf63Exw6EIzVLDL29+pqxnC4bW6nuCUD
	fO4/iVa8TeUNhDuzUEkQpP9Y92BoEk8a8uzdRkMgtfE6nR8KDzp/S92V9Snr0TT5HpyS
	T9i4ELkXLgFvHY19bnkuzfH2+LLKuZI7dghelcsrl9zzwaHFe2HO+rKFrJLgtGiRzk3+
	w9GB9bFVD3QV+O/UhPQwQDvmcLS9AbdmeqffV3Hm99RkJHnVQx6FEsRfSn+IacDL1iuX
	ZshI0MF2rv/hOGZDwAcfUHFI6ay0rqvdcdb0kb7uNPsZYp/syqggE38d6PBSxcNQvJu4
	FqLw==
X-Gm-Message-State: ALoCoQm6H/q2MA5ahJ3qGJhsdAXmYF40NtjlrXUfqMdgtqQe1+KJwjUmTsddEvrs2VbxqrlVWw7nfyEhxDMkOD1nl3ECxZy7FQ==
X-Received: by 10.194.209.195 with SMTP id mo3mr21142694wjc.16.1449851055058; 
	Fri, 11 Dec 2015 08:24:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m190sm932133wma.5.2015.12.11.08.24.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 08:24:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 16:24:11 +0000
Message-Id: <cover.1449850996.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 00/57] Consolidated pull for master
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
X-List-Received-Date: Fri, 11 Dec 2015 16:24:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Here is a consolidated pull for master featuring upgrades, fixes, and the first
stage of musl integration.

Ross

The following changes since commit 9cab798490100f0d1223abfe51f9f19dab40ab14:

  toolchain-shar-extract.sh: fix ~ not working in path (2015-12-11 11:23:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to b861da2a7bc1910b07c7cf3d87636977dcd8fecf:

  attr: Add patch to account for use of internal glibc header (2015-12-11 16:22:53 +0000)

----------------------------------------------------------------
Alexander Kanavin (9):
      weston-init: add a native systemd unit file
      openssl: update to 1.0.2e
      python-setuptools: update to 18.7.1
      nspr: update to 4.11
      mobile-broadband-provider-info: update to current commit
      mirrors: replace references to archive.apache.org
      json-c: add manual upstream version check
      subversion: update to 1.9.2
      slang: update upstream URI to (official) jedsoft.org

Andre McCurdy (6):
      kernel.bbclass: drop unnecessary 'eval' from kernel_do_configure()
      linux-libc-headers.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
      linux-libc-headers: update default KORG_ARCHIVE_COMPRESSION bz2 -> xz
      dropbear: update 2015.70 -> 2015.71
      dropbear.inc: drop legacy CFLAGS and LD tweaks
      valgrind: import Debian link_tool patch for MIPS

Aníbal Limón (1):
      dev-manual: Fix errata in new kvm-vhost.

Armin Kuster (1):
      linux-firmware: update to latest

Benjamin Esquivel (2):
      oeqa/systemd: journalctl helper function
      oeqa/systemd: get runtest target boot time and log

Chen Qi (1):
      cpio: fix test case of symlink-bad-length

Cristian Iorga (1):
      bluez5: upgrade to 5.36

Daniel Istrate (1):
      scripts: oe-selftest Added new features.

Dmitry Eremin-Solenikov (2):
      gcc-5.2: import patch fixing compilation in thumb mode
      gcc-4.9: import patch fixing compilation in thumb mode

Fan Xin (1):
      sudo: upgrade to 1.8.15

Hongxu Jia (1):
      bash: fix testcase run-coproc/run-execscript/run-test/run-heredoc failed

Humberto Ibarra (1):
      scripts/yocto-layer: Avoids duplication of "meta-" prefix

Jackie Huang (1):
      python: Fix cross compiling issue

Juro Bystricky (3):
      oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
      insane: in libdir test allow libraries in libexecdir
      buildtools-tarball.bb: 32bit tools need pseudo 32bit library

Jussi Kukkonen (1):
      dropbear: Upgrade 2015.68 -> 2015.70

Khem Raj (13):
      gcc: Add support for building musl configuration
      autoconf: Add musl support
      gdb: Fix build with musl
      mtd-utils: Backport and create patches to support musl
      squashfs-tools: Define FNM_EXTMATCH if not defined
      mtools: Use proper glibc override to add glibc packages to recommendations
      musl: Add recipe
      sysvinit: Fix build with musl
      gettext: Delete libintl.h and charset.alias
      busybox: Add config for musl
      openssl: Add musl configuration support
      libpam: Fix build with musl
      attr: Add patch to account for use of internal glibc header

Mariano Lopez (1):
      rootfs.py: Change logic to unistall packages

Mark Hatle (1):
      rpm: Enable MIPS64 N32 transactions

Martin Jansa (1):
      texinfo: don't create dependency on INHERIT variable

Mike Crowe (2):
      icu: Upgrade 55.1 -> 56.1
      gstreamer1.0: Split bash completion information into separate package

Otavio Salvador (1):
      lttng-tools: Revert wrong enforcement of Python 3.0 use

Robert Yang (1):
      rpm: fix file conflicts for MIPS64 N32

Ross Burton (4):
      cooker: use in instead of count
      libsdl: expand PACKAGECONFIG and enable native builds
      sudo: remove libdir INSANE_SKIP
      attr: add attr dependency to attr-ptest

Yuanjie Huang (1):
      gcc-cross-initial: make dependency on gnu-config-native and autoconf-native explicit

 bitbake/lib/bb/cooker.py                           |    2 +-
 documentation/dev-manual/dev-manual-qemu.xml       |    8 +-
 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/kernel.bbclass                        |    3 +-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/rootfs.py                              |   41 +-
 meta/lib/oeqa/runtime/systemd.py                   |   75 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |    1 +
 ...e-Fix-possible-crash-when-registering-pro.patch |   54 +
 .../bluez5/{bluez5_5.33.bb => bluez5_5.36.bb}      |    4 +-
 .../mobile-broadband-provider-info_git.bb          |    4 +-
 meta/recipes-connectivity/openssl/openssl.inc      |    4 +-
 .../openssl/openssl/configure-musl-target.patch    |   27 +
 .../{openssl_1.0.2d.bb => openssl_1.0.2e.bb}       |    5 +-
 meta/recipes-core/busybox/busybox/musl.cfg         |   12 +
 meta/recipes-core/busybox/busybox_1.24.1.bb        |    1 +
 meta/recipes-core/dropbear/dropbear.inc            |    3 -
 .../dropbear/0005-dropbear-enable-pam.patch        |   26 +-
 meta/recipes-core/dropbear/dropbear_2015.68.bb     |    4 -
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |    5 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    5 +
 meta/recipes-core/gettext/gettext_0.19.4.bb        |    4 +
 meta/recipes-core/meta/buildtools-tarball.bb       |    6 +
 meta/recipes-core/musl/musl.inc                    |   26 +
 meta/recipes-core/musl/musl_git.bb                 |   58 +
 meta/recipes-core/sysvinit/sysvinit/realpath.patch |   78 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    1 +
 .../autoconf/autoconf/add_musl_config.patch        |   26 +
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    5 +
 .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        |  267 +++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     |  205 ++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |   21 +
 .../gcc/gcc-4.9/0070-libstdc-musl.patch            |   32 +
 meta/recipes-devtools/gcc/gcc-5.2.inc              |    5 +
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |   32 +
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        |  267 +++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     |  198 ++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |   22 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    3 +
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch |   54 +
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    3 +
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |   53 +
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch |   56 +
 .../mtd/mtd-utils/010-fix-rpmatch.patch            |   24 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 +
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    4 +-
 ...uptools_18.2.bb => python-setuptools_18.7.1.bb} |    5 +-
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |   31 +
 ...ptools_18.2.bb => python3-setuptools_18.7.1.bb} |    5 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |    1 +
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 +
 .../squashfs-tools/squashfs-tools/fix-compat.patch |   63 +
 .../squashfs-tools/squashfs-tools_git.bb           |    1 +
 .../subversion/subversion-1.8.13/libtool2.patch    |   15 -
 .../subversion-CVE-2015-3184.patch                 | 2094 --------------------
 .../subversion-CVE-2015-3187.patch                 |  346 ----
 .../0001-Fix-libtool-name-in-configure.ac.patch    |   29 +
 .../disable_macos.patch                            |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |   14 +-
 .../{subversion_1.8.13.bb => subversion_1.9.2.bb}  |   12 +-
 .../valgrind/valgrind/11_mips-link-tool.patch      |   37 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    1 +
 meta/recipes-extended/bash/bash.inc                |    3 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch |  169 ++
 meta/recipes-extended/bash/bash/run-ptest          |    2 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 .../0001-fix-testcase-of-symlink-bad-length.patch  |   57 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |    1 +
 ...upport-for-defining-missing-funcitonality.patch |   68 +
 .../pam/libpam/include_paths_header.patch          |   59 +
 meta/recipes-extended/pam/libpam_1.2.1.bb          |    5 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 meta/recipes-extended/sudo/sudo.inc                |    5 -
 ...rrect-path-to-init.d-and-tmpfiles.d-files.patch |   31 -
 .../sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb}      |    5 +-
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |    2 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   37 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   13 +-
 .../wayland/weston-init/weston.service             |   15 +
 .../linux-firmware/linux-firmware_git.bb           |   33 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    5 +-
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |    3 -
 ...d-look-for-python-3.0-when-building-pytho.patch |   30 +
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |    1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |    5 +-
 meta/recipes-support/attr/attr.inc                 |    4 +-
 meta/recipes-support/attr/attr_2.4.47.bb           |    4 +-
 .../attr/files/dont-use-decl-macros.patch          |   56 +
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  |   24 +
 .../icu/{icu_55.1.bb => icu_56.1.bb}               |    5 +-
 .../nspr/{nspr_4.10.8.bb => nspr_4.11.bb}          |    9 +-
 scripts/oe-buildenv-internal                       |    6 +-
 scripts/oe-selftest                                |  218 +-
 scripts/yocto-layer                                |    6 +-
 100 files changed, 2803 insertions(+), 2617 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (92%)
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
 rename meta/recipes-devtools/python/{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb} (84%)
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
 rename meta/recipes-devtools/python/{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb} (91%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-Fix-libtool-name-in-configure.ac.patch
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (59%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.9.2.bb} (90%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch
 delete mode 100644 meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb} (86%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
 create mode 100644 meta/recipes-support/attr/files/dont-use-decl-macros.patch
 create mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_55.1.bb => icu_56.1.bb} (78%)
 rename meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} (93%)

Alexander Kanavin (9):
  weston-init: add a native systemd unit file
  openssl: update to 1.0.2e
  python-setuptools: update to 18.7.1
  nspr: update to 4.11
  mobile-broadband-provider-info: update to current commit
  mirrors: replace references to archive.apache.org
  json-c: add manual upstream version check
  subversion: update to 1.9.2
  slang: update upstream URI to (official) jedsoft.org

Andre McCurdy (6):
  kernel.bbclass: drop unnecessary 'eval' from kernel_do_configure()
  linux-libc-headers.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
  linux-libc-headers: update default KORG_ARCHIVE_COMPRESSION bz2 -> xz
  dropbear: update 2015.70 -> 2015.71
  dropbear.inc: drop legacy CFLAGS and LD tweaks
  valgrind: import Debian link_tool patch for MIPS

Aníbal Limón (1):
  dev-manual: Fix errata in new kvm-vhost.

Armin Kuster (1):
  linux-firmware: update to latest

Benjamin Esquivel (2):
  oeqa/systemd: journalctl helper function
  oeqa/systemd: get runtest target boot time and log

Chen Qi (1):
  cpio: fix test case of symlink-bad-length

Cristian Iorga (1):
  bluez5: upgrade to 5.36

Daniel Istrate (1):
  scripts: oe-selftest Added new features.

Dmitry Eremin-Solenikov (2):
  gcc-5.2: import patch fixing compilation in thumb mode
  gcc-4.9: import patch fixing compilation in thumb mode

Fan Xin (1):
  sudo: upgrade to 1.8.15

Hongxu Jia (1):
  bash: fix testcase run-coproc/run-execscript/run-test/run-heredoc
    failed

Humberto Ibarra (1):
  scripts/yocto-layer: Avoids duplication of "meta-" prefix

Jackie Huang (1):
  python: Fix cross compiling issue

Juro Bystricky (3):
  oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
  insane: in libdir test allow libraries in libexecdir
  buildtools-tarball.bb: 32bit tools need pseudo 32bit library

Jussi Kukkonen (1):
  dropbear: Upgrade 2015.68 -> 2015.70

Khem Raj (13):
  gcc: Add support for building musl configuration
  autoconf: Add musl support
  gdb: Fix build with musl
  mtd-utils: Backport and create patches to support musl
  squashfs-tools: Define FNM_EXTMATCH if not defined
  mtools: Use proper glibc override to add glibc packages to
    recommendations
  musl: Add recipe
  sysvinit: Fix build with musl
  gettext: Delete libintl.h and charset.alias
  busybox: Add config for musl
  openssl: Add musl configuration support
  libpam: Fix build with musl
  attr: Add patch to account for use of internal glibc header

Mariano Lopez (1):
  rootfs.py: Change logic to unistall packages

Mark Hatle (1):
  rpm: Enable MIPS64 N32 transactions

Martin Jansa (1):
  texinfo: don't create dependency on INHERIT variable

Mike Crowe (2):
  icu: Upgrade 55.1 -> 56.1
  gstreamer1.0: Split bash completion information into separate package

Otavio Salvador (1):
  lttng-tools: Revert wrong enforcement of Python 3.0 use

Robert Yang (1):
  rpm: fix file conflicts for MIPS64 N32

Ross Burton (4):
  cooker: use in instead of count
  libsdl: expand PACKAGECONFIG and enable native builds
  sudo: remove libdir INSANE_SKIP
  attr: add attr dependency to attr-ptest

Yuanjie Huang (1):
  gcc-cross-initial: make dependency on gnu-config-native and
    autoconf-native explicit

 bitbake/lib/bb/cooker.py                           |    2 +-
 documentation/dev-manual/dev-manual-qemu.xml       |    8 +-
 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/kernel.bbclass                        |    3 +-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/lib/oe/rootfs.py                              |   41 +-
 meta/lib/oeqa/runtime/systemd.py                   |   75 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |    1 +
 ...e-Fix-possible-crash-when-registering-pro.patch |   54 +
 .../bluez5/{bluez5_5.33.bb => bluez5_5.36.bb}      |    4 +-
 .../mobile-broadband-provider-info_git.bb          |    4 +-
 meta/recipes-connectivity/openssl/openssl.inc      |    4 +-
 .../openssl/openssl/configure-musl-target.patch    |   27 +
 .../{openssl_1.0.2d.bb => openssl_1.0.2e.bb}       |    5 +-
 meta/recipes-core/busybox/busybox/musl.cfg         |   12 +
 meta/recipes-core/busybox/busybox_1.24.1.bb        |    1 +
 meta/recipes-core/dropbear/dropbear.inc            |    3 -
 .../dropbear/0005-dropbear-enable-pam.patch        |   26 +-
 meta/recipes-core/dropbear/dropbear_2015.68.bb     |    4 -
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |    5 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    5 +
 meta/recipes-core/gettext/gettext_0.19.4.bb        |    4 +
 meta/recipes-core/meta/buildtools-tarball.bb       |    6 +
 meta/recipes-core/musl/musl.inc                    |   26 +
 meta/recipes-core/musl/musl_git.bb                 |   58 +
 meta/recipes-core/sysvinit/sysvinit/realpath.patch |   78 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    1 +
 .../autoconf/autoconf/add_musl_config.patch        |   26 +
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    5 +
 .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        |  267 +++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     |  205 ++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |   21 +
 .../gcc/gcc-4.9/0070-libstdc-musl.patch            |   32 +
 meta/recipes-devtools/gcc/gcc-5.2.inc              |    5 +
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |   32 +
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        |  267 +++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     |  198 ++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |   22 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    3 +
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch |   54 +
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    3 +
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |   53 +
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch |   56 +
 .../mtd/mtd-utils/010-fix-rpmatch.patch            |   24 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    4 +
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    4 +-
 ...uptools_18.2.bb => python-setuptools_18.7.1.bb} |    5 +-
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |   31 +
 ...ptools_18.2.bb => python3-setuptools_18.7.1.bb} |    5 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |    1 +
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    4 +
 .../squashfs-tools/squashfs-tools/fix-compat.patch |   63 +
 .../squashfs-tools/squashfs-tools_git.bb           |    1 +
 .../subversion/subversion-1.8.13/libtool2.patch    |   15 -
 .../subversion-CVE-2015-3184.patch                 | 2094 --------------------
 .../subversion-CVE-2015-3187.patch                 |  346 ----
 .../0001-Fix-libtool-name-in-configure.ac.patch    |   29 +
 .../disable_macos.patch                            |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |   14 +-
 .../{subversion_1.8.13.bb => subversion_1.9.2.bb}  |   12 +-
 .../valgrind/valgrind/11_mips-link-tool.patch      |   37 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    1 +
 meta/recipes-extended/bash/bash.inc                |    3 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch |  169 ++
 meta/recipes-extended/bash/bash/run-ptest          |    2 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 .../0001-fix-testcase-of-symlink-bad-length.patch  |   57 +
 meta/recipes-extended/cpio/cpio_2.11.bb            |    1 +
 ...upport-for-defining-missing-funcitonality.patch |   68 +
 .../pam/libpam/include_paths_header.patch          |   59 +
 meta/recipes-extended/pam/libpam_1.2.1.bb          |    5 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 meta/recipes-extended/sudo/sudo.inc                |    5 -
 ...rrect-path-to-init.d-and-tmpfiles.d-files.patch |   31 -
 .../sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb}      |    5 +-
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |    2 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   37 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   13 +-
 .../wayland/weston-init/weston.service             |   15 +
 .../linux-firmware/linux-firmware_git.bb           |   33 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    5 +-
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |    3 -
 ...d-look-for-python-3.0-when-building-pytho.patch |   30 +
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |    1 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |    5 +-
 meta/recipes-support/attr/attr.inc                 |    4 +-
 meta/recipes-support/attr/attr_2.4.47.bb           |    4 +-
 .../attr/files/dont-use-decl-macros.patch          |   56 +
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  |   24 +
 .../icu/{icu_55.1.bb => icu_56.1.bb}               |    5 +-
 .../nspr/{nspr_4.10.8.bb => nspr_4.11.bb}          |    9 +-
 scripts/oe-buildenv-internal                       |    6 +-
 scripts/oe-selftest                                |  218 +-
 scripts/yocto-layer                                |    6 +-
 100 files changed, 2803 insertions(+), 2617 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (92%)
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
 rename meta/recipes-devtools/python/{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb} (84%)
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
 rename meta/recipes-devtools/python/{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb} (91%)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-Fix-libtool-name-in-configure.ac.patch
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (59%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.9.2.bb} (90%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch
 delete mode 100644 meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb} (86%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
 create mode 100644 meta/recipes-support/attr/files/dont-use-decl-macros.patch
 create mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_55.1.bb => icu_56.1.bb} (78%)
 rename meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} (93%)

-- 
2.1.4


