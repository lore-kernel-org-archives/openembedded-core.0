Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9C83160119
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 19:21:49 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id i10so177161098wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 11:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sIuIRmEn36A8OTyaBhwW8CwYi1WSPjaJhwJbyc5+4BY=;
	b=SCQFO5crKrJdnNNIesn2hmhWU4K4Nweqzh3oLnkzpimiJVc/bzgTIk0UJeP9nSLiTS
	gh049dyc7f6XYZvDqVJTQYYRDi4i7KeMiI1ZBNyQl6EvW//7FIIORvlqaKBMGxw6pA7A
	1fuaXAbzd+bSxDlC2FdBH7cIDmzE4hyy/GqIxvw1oz9b4jphjCqXplNnkZ5JbPKlyunc
	CBQCH3KYHQ7IOvhJ64q8sFFHJbOqZvRzqv8mgNANHLhskbSu/r+yfKTrHyVAF/t76dz0
	zIHzSmZSBg4A9fFgph5OhgG/fS2eeuvXz5XiK3he20+d2LmeZLqYpradUOtaCzuhMBmn
	KIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sIuIRmEn36A8OTyaBhwW8CwYi1WSPjaJhwJbyc5+4BY=;
	b=V9/7EJhkouT+Ihi/eUMy0N+1xs+9DRP9BjHhGAZT2QnTJf4jrf2Jclhs6R47iyPa76
	Qny0YmBpUEHsxVLkGJc/R7EmA54vocYy15t45ytMQjlgVrkpNsMA/xwcP7vXhu4TgKmB
	esBEyH3cfQ1OM5Cq1pUSG1/sQh+/sCOltOxRYR+X20G1T6tLfcOjIFcJ3osSQUIlzQ7h
	BlKt1k7yN63eYyZZ8DnImCUtpsuS08Hapy3Mh7j0LUg42pcIH+hQwQ55T1z2tAthDqIc
	kU9KG4yTNyGielpRT3cNzec6lkOC7W78dnD26iCgBgZDjNO1VVwpw5gWG6P08MR+z8KC
	Dvkg==
X-Gm-Message-State: AMke39lvmMeWdgdYD0v7plRZ60Hdo5fStbrnjeo/T2Q3KGpxtY6sLUJt+UPIjiN/Z+5T0gFb
X-Received: by 10.223.155.135 with SMTP id d7mr24505419wrc.99.1487100108329;
	Tue, 14 Feb 2017 11:21:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id g71sm2427514wmc.9.2017.02.14.11.21.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Feb 2017 11:21:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 19:21:45 +0000
Message-Id: <cover.1487099932.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/90] Consolidated Pull
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
X-List-Received-Date: Tue, 14 Feb 2017 19:21:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Enclosed is a consolidated pull which was mostly green on the autobuilder, apart
from some MIPS failures that were isolated to the Linux 4.9 switch which has now
been removed from the series.

Ross

The following changes since commit a3826786b6e76c17198dcd38e0e6fdafb4476d33:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.9 (2017-02-13 02:57:46 -0800)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to d0c5119e3ea1dd6b41b6f5ac59fa448ab36f4d00:

  wic: direct: move creation of PartitionedImage to __init__ (2017-02-14 19:17:31 +0000)

----------------------------------------------------------------
Alexander Kanavin (1):
      gpgme: allow building -native variant

Amarnath Valluri (1):
      package_deb.bbclass: Ignore file paths in RPROVIDES

Andrea Adami (1):
      kernel.bbclass: Make symbol to vmlinuz.bin in boot directory

Andreas Horsthemke (1):
      xz: upgrade to 5.2.3

Andreas Oberritter (1):
      python: Don't use getentropy on Linux

Andrej Valek (1):
      lighttpd: Upgrade 1.4.43 -> 1.4.45

Benjamin Esquivel (1):
      selftest: remove result file log awkward checking

California Sullivan (1):
      kernel.bbclass: Make sanity check opt-out and provide easy opt-out

Chen Qi (2):
      console-tools: fix string formatting issue
      security_flags: enable string formatting check for console tools

Dalon Westergreen (1):
      uboot-extlinux-config.bbclass: add support for timeout & default

Ed Bartosh (22):
      wic: partitionedfs: merged __format_disks and create
      wic: partitionedfs: get rid of __add_partition
      wic: partitionedfs: rename __create_partition and __add_disk
      wic: direct: get rid of _get_parts getter
      wic: use the same partition object in direct and partitionedfs
      wic: make sure layout_partitions is called once
      wic: direct: remove unused plugin attributes
      wic: direct: remove unused import
      wic: remove unused argument scripts_path
      wic: move disk operations to PartitionImage class
      wic: move PartitionedImage class to direct.py
      wic: remove utils/oe/__init__.py
      wic: ksparser: set default disk to 'sda'
      wic: direct: remove set_bootimg_dir setter
      wic: direct: don't catch ImagerError
      wic: direct: remove useless code
      wic: direct: add 'realnum' attribute to partition
      wic: direct: move UUID generation to PartitionedImage
      wic: direct: set bootloader.source in the __init__
      wic: direct: add PartitionedImage.prepare method
      wic: direct: move generation of part.realnum to PartitionedImage
      wic: direct: move creation of PartitionedImage to __init__

Fabio Berton (1):
      watchdog: Add RCONFLICTS to watchdog-keepalive and split RDEPENDS

Gary Thomas (1):
      usbutils: allow udev-hwdb to be optional

He Zhe (1):
      ltp: Fix containers/userns05 failure for lib32

Herve Jourdain (1):
      smartpm: if RPM transaction fails with an empty list of problems in attempt mode, ignore it!

Hongxu Jia (10):
      pax-utils: 1.1.6 -> 1.2.2
      socat: 1.7.3.1 -> 1.7.3.2
      libgcrypt: 1.7.3 -> 1.7.6
      man-pages: 4.08 -> 4.09
      rpcbind: 0.2.3 -> 0.2.4
      gnupg: 2.1.14 -> 2.1.18
      gpgme: 1.6.0 -> 1.8.0
      libgpg-error: 1.25 -> 1.26
      elfutils: 0.166 -> 0.168
      elfutils: update homepage and upstream souce

Joshua Lock (1):
      pseudo: update to 1.8.2

Joshua Watt (1):
      classes/license: Respect beginline and endline

Jussi Kukkonen (4):
      cve-check.bbclass: Fix dependencies
      cve-check-tool: Fixes for recipe sysroots
      cve-check-tool: Use CA cert bundle in correct sysroot
      libxslt: Add build fix (with ld-is-gold)

Khem Raj (2):
      glibc: Update to 2.25 release
      libcap: Add gperf-native to depends

Kristian Amlie (2):
      wic: Add --exclude-path option to rootfs source plugin.
      selftest/wic: Add tests for --exclude-dir option.

Li Zhou (1):
      bash: fix CVE-2016-9401

Mariano Lopez (2):
      testimage.bbclass: Add check for empty test suite
      insane.bbclass: Add missing dependencies

Markus Lehtonen (8):
      oeqa/buildperf: don't archive stdout/stderr of commands
      oeqa.utils.git: add git_dir property
      scripts: Implement oe-git-archive
      oeqa.utils.git: support bare repos
      scripts/oe-git-archive: support creating bare repositories
      build-perf-test-wrapper.sh: use oe-git-archive
      oe-build-perf-test: drop --commit-results
      build-perf-test-wrapper.sh: fix issues with non-existing path arguments

Nathan Rossi (1):
      image.bbclass: Use 'populate_sdk_base' for non-linux targets

Paul Eggleton (1):
      classes/copyleft_filter: include AGPL in default included list

Philip Balister (1):
      sanity.bbclass: Add which to SANITY_REQUIRED_UTILITIES.

Robert Yang (10):
      e2fsprogs: 1.43.3 -> 1.43.4
      git: 2.11.0 -> 2.11.1
      gnu-efi: 3.0.4 -> 3.0.5
      hdparm: 9.50 -> 9.51
      libpcre: 8.39 -> 8.40
      wget: 1.18 -> 1.19
      strace: 4.14 -> 4.15
      strace: fix gawk's path
      mklibs-native: 0.1.41 -> 0.1.43
      m4: 1.4.17 -> 1.4.18

Ross Burton (5):
      libepoxy: upgrade to 1.4.0
      lttng-tools: no need to delete libxml.m4
      security_flags: disable -pie for gpgme
      dbus: remove pointless cd
      m4: use wildcard for selftest bbappend

Scott Rifenbark (1):
      bitbake: bitbake-user-manual: Removed pn-buildlist, package-depends.dot and pn-depends.dot

Stefan Müller-Klieser (1):
      perf: add PACKAGECONFIG for jvmti

Stephano Cetola (1):
      insane.bbclass: print QA message correctly

Tanu Kaskinen (1):
      pulseaudio: 9.0 -> 10.0

 .../bitbake-user-manual-intro.xml                  |   16 +-
 .../m4/{m4_1.4.17.bbappend => m4_%.bbappend}       |    0
 meta/classes/copyleft_filter.bbclass               |    2 +-
 meta/classes/cve-check.bbclass                     |    2 +-
 meta/classes/image.bbclass                         |    4 +-
 meta/classes/insane.bbclass                        |    7 +-
 meta/classes/kernel.bbclass                        |   11 +-
 meta/classes/license.bbclass                       |   34 +-
 meta/classes/package_deb.bbclass                   |    4 +
 meta/classes/sanity.bbclass                        |    2 +-
 meta/classes/testimage.bbclass                     |    4 +
 meta/classes/uboot-extlinux-config.bbclass         |   18 +
 meta/conf/distro/include/security_flags.inc        |    2 +-
 meta/lib/oeqa/buildperf/base.py                    |   29 +-
 meta/lib/oeqa/buildperf/test_basic.py              |   10 +-
 meta/lib/oeqa/selftest/wic.py                      |  104 ++
 meta/lib/oeqa/utils/decorators.py                  |    7 +-
 meta/lib/oeqa/utils/git.py                         |   20 +-
 .../aarch64-initplat.c-fix-const-qualifier.patch   |   35 -
 .../gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} |    5 +-
 meta/recipes-bsp/usbutils/usbutils_008.bb          |    2 +-
 .../socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb}   |    4 +-
 ...001-Fix-format-security-compilation-error.patch |   57 +
 .../console-tools/console-tools_0.3.2.bb           |    1 +
 meta/recipes-core/dbus/dbus_1.10.14.bb             |    1 -
 .../glibc/cross-localedef-native_2.25.bb           |    5 +-
 ...k-IFUNC-definition-in-unrelocated-shared-.patch |   98 --
 meta/recipes-core/glibc/glibc_2.25.bb              |    6 +-
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |    7 +-
 ...ow-overriding-default-CA-certificate-file.patch |  215 ++++
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |    9 +-
 .../{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb}   |    6 +-
 ...de-alternatives-for-glibc-assumptions-hel.patch | 1163 --------------------
 .../elfcmp-fix-self-comparision.patch              |   41 -
 .../elfutils/elfutils-0.166/m68k_backend.diff      |  492 ---------
 .../elfutils/elfutils-0.166/uclibc-support.patch   |  128 ---
 ...de-alternatives-for-glibc-assumptions-hel.patch | 1051 ++++++++++++++++++
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |    0
 .../0001-fix-a-stack-usage-warning.patch           |    0
 .../0001-remove-the-unneed-checking.patch          |    0
 .../aarch64_uio.patch                              |    0
 ...ferences-between-mips-machine-identifiers.patch |   13 +-
 ...-support-for-mips64-abis-in-mips_retval.c.patch |    3 +
 .../0003-Add-mips-n64-relocation-format-hack.patch |   35 +-
 .../debian}/arm_backend.diff                       |   55 +-
 .../debian}/hppa_backend.diff                      |   63 +-
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |   17 +
 .../elfutils-0.168/debian/ignore_strmerge.diff     |   14 +
 .../debian}/kfreebsd_path.patch                    |   11 +-
 .../debian}/mips_backend.diff                      |   75 +-
 .../debian}/mips_readelf_w.patch                   |   11 +-
 .../debian}/testsuite-ignore-elflint.diff          |   17 +-
 .../fixheadercheck.patch                           |    0
 .../shadow.patch                                   |    0
 .../{elfutils_0.166.bb => elfutils_0.168.bb}       |   34 +-
 meta/recipes-devtools/git/git_2.11.0.bb            |   11 -
 meta/recipes-devtools/git/git_2.11.1.bb            |   11 +
 .../m4/{m4-1.4.17.inc => m4-1.4.18.inc}            |    5 +-
 .../{m4-native_1.4.17.bb => m4-native_1.4.18.bb}   |    0
 meta/recipes-devtools/m4/m4/remove-gets.patch      |   15 +-
 .../m4/{m4_1.4.17.bb => m4_1.4.18.bb}              |    0
 ...bs-native_0.1.41.bb => mklibs-native_0.1.43.bb} |    8 +-
 .../{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb}     |    6 +-
 .../files/0001-Don-t-send-SIGUSR1-to-init.patch    |   48 -
 ...t-diagnostics-during-startup-for-pseudo-d.patch |   54 -
 .../files/0002-Use-correct-file-descriptor.patch   |   53 -
 ...nameat-parallel-to-previous-fix-to-rename.patch |   64 --
 .../pseudo/files/Fix-xattr-performance.patch       |  117 --
 .../pseudo/files/More-correctly-fix-xattrs.patch   |   37 -
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |   17 -
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |   11 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
 .../python/python-smartpm/smart-attempt.patch      |   14 +-
 .../python/Don-t-use-getentropy-on-Linux.patch     |   41 +
 meta/recipes-devtools/python/python_2.7.12.bb      |    1 +
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     |   49 +
 .../strace/{strace_4.14.bb => strace_4.15.bb}      |    5 +-
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |   50 +
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 .../hdparm/{hdparm_9.50.bb => hdparm_9.51.bb}      |    4 +-
 .../{lighttpd_1.4.43.bb => lighttpd_1.4.45.bb}     |    4 +-
 ...039-fcntl-fix-the-time-def-to-use-time_t.patch} |    0
 ...iners-userns05-use-unsigned-int-for-ns-id.patch |   60 +
 meta/recipes-extended/ltp/ltp_20160126.bb          |    3 +-
 .../{man-pages_4.08.bb => man-pages_4.09.bb}       |    4 +-
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch |  221 ----
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |   43 -
 .../rpcbind/rpcbind/cve-2015-7236.patch            |   84 --
 .../rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} |    7 +-
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |    9 +-
 meta/recipes-extended/wget/wget.inc                |    2 -
 .../wget/{wget_1.18.bb => wget_1.19.bb}            |    4 +-
 .../xz/{xz_5.2.2.bb => xz_5.2.3.bb}                |    4 +-
 ...-platforms-based-on-configuration-results.patch |  128 ---
 ...0002-add-an-option-to-disable-glx-support.patch |   42 -
 .../libepoxy/libepoxy/no-need-for-python3.patch    |   20 -
 .../{libepoxy_git.bb => libepoxy_1.4.0.bb}         |   16 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |    1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |    1 -
 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb     |    5 -
 meta/recipes-kernel/perf/perf.bb                   |    1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   80 +-
 ...oth-fail-if-user-requested-profile-doesn-.patch |   61 -
 ...ard-don-t-allow-the-CARD_NEW-hook-to-fail.patch |   37 -
 ...-move-profile-selection-after-pa_card_new.patch |  429 --------
 ...rd-remove-pa_card_new_data.active_profile.patch |   72 --
 ...vailability-for-some-unavailable-profiles.patch |   79 --
 .../pulseaudio/pulseaudio_10.0.bb                  |   14 +
 .../pulseaudio/pulseaudio_9.0.bb                   |   19 -
 .../gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb}     |    8 +-
 meta/recipes-support/gpgme/gpgme/gpgme.pc          |   10 -
 meta/recipes-support/gpgme/gpgme/pkgconfig.patch   |   42 +-
 .../gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb}       |   22 +-
 meta/recipes-support/libcap/libcap_2.25.bb         |    2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb  |    4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb  |    4 +
 .../{libgpg-error_1.25.bb => libgpg-error_1.26.bb} |    5 +-
 .../libpcre/{libpcre_8.39.bb => libpcre_8.40.bb}   |    6 +-
 .../libxslt/0001-Link-libraries-with-libm.patch    |   48 +
 meta/recipes-support/libxslt/libxslt_1.1.29.bb     |    1 +
 scripts/contrib/build-perf-test-wrapper.sh         |   22 +-
 scripts/lib/wic/engine.py                          |    7 +-
 scripts/lib/wic/help.py                            |    6 +
 scripts/lib/wic/ksparser.py                        |    3 +-
 scripts/lib/wic/partition.py                       |    3 +
 scripts/lib/wic/plugins/imager/direct.py           |  509 ++++++---
 scripts/lib/wic/plugins/source/bootimg-efi.py      |    2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |    4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   10 +-
 scripts/lib/wic/plugins/source/rootfs.py           |   43 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |    4 +-
 scripts/lib/wic/utils/oe/__init__.py               |   22 -
 scripts/lib/wic/utils/partitionedfs.py             |  386 -------
 scripts/oe-build-perf-test                         |  104 --
 scripts/oe-git-archive                             |  247 +++++
 scripts/wic                                        |    4 +-
 136 files changed, 2893 insertions(+), 4661 deletions(-)
 rename meta-selftest/recipes-test/m4/{m4_1.4.17.bbappend => m4_%.bbappend} (100%)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} (92%)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb} (89%)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0001-Ignore-differences-between-mips-machine-identifiers.patch (78%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (98%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0003-Add-mips-n64-relocation-format-hack.patch (90%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/arm_backend.diff (94%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/hppa_backend.diff (95%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/kfreebsd_path.patch (60%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_readelf_w.patch (73%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/testsuite-ignore-elflint.diff (70%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.166.bb => elfutils_0.168.bb} (75%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 rename meta/recipes-devtools/m4/{m4-1.4.17.inc => m4-1.4.18.inc} (75%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.17.bb => m4-native_1.4.18.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.17.bb => m4_1.4.18.bb} (100%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb} (72%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb} (86%)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
 create mode 100644 meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 rename meta/recipes-devtools/strace/{strace_4.14.bb => strace_4.15.bb} (88%)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 rename meta/recipes-extended/hdparm/{hdparm_9.50.bb => hdparm_9.51.bb} (89%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.43.bb => lighttpd_1.4.45.bb} (96%)
 rename meta/recipes-extended/ltp/ltp/{fcntl-fix-the-time-def-to-use-time_t.patch => 0039-fcntl-fix-the-time-def-to-use-time_t.patch} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch
 rename meta/recipes-extended/man-pages/{man-pages_4.08.bb => man-pages_4.09.bb} (86%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} (87%)
 rename meta/recipes-extended/wget/{wget_1.18.bb => wget_1.19.bb} (53%)
 rename meta/recipes-extended/xz/{xz_5.2.2.bb => xz_5.2.3.bb} (90%)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_git.bb => libepoxy_1.4.0.bb} (58%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_10.0.bb
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_9.0.bb
 rename meta/recipes-support/gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb} (80%)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/gpgme.pc
 rename meta/recipes-support/gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb} (67%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.25.bb => libgpg-error_1.26.bb} (89%)
 rename meta/recipes-support/libpcre/{libpcre_8.39.bb => libpcre_8.40.bb} (92%)
 create mode 100644 meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
 delete mode 100644 scripts/lib/wic/utils/oe/__init__.py
 delete mode 100644 scripts/lib/wic/utils/partitionedfs.py
 create mode 100755 scripts/oe-git-archive

Alexander Kanavin (1):
  gpgme: allow building -native variant

Amarnath Valluri (1):
  package_deb.bbclass: Ignore file paths in RPROVIDES

Andrea Adami (1):
  kernel.bbclass: Make symbol to vmlinuz.bin in boot directory

Andreas Horsthemke (1):
  xz: upgrade to 5.2.3

Andreas Oberritter (1):
  python: Don't use getentropy on Linux

Andrej Valek (1):
  lighttpd: Upgrade 1.4.43 -> 1.4.45

Benjamin Esquivel (1):
  selftest: remove result file log awkward checking

California Sullivan (1):
  kernel.bbclass: Make sanity check opt-out and provide easy opt-out

Chen Qi (2):
  console-tools: fix string formatting issue
  security_flags: enable string formatting check for console tools

Dalon Westergreen (1):
  uboot-extlinux-config.bbclass: add support for timeout & default

Ed Bartosh (22):
  wic: partitionedfs: merged __format_disks and create
  wic: partitionedfs: get rid of __add_partition
  wic: partitionedfs: rename __create_partition and __add_disk
  wic: direct: get rid of _get_parts getter
  wic: use the same partition object in direct and partitionedfs
  wic: make sure layout_partitions is called once
  wic: direct: remove unused plugin attributes
  wic: direct: remove unused import
  wic: remove unused argument scripts_path
  wic: move disk operations to PartitionImage class
  wic: move PartitionedImage class to direct.py
  wic: remove utils/oe/__init__.py
  wic: ksparser: set default disk to 'sda'
  wic: direct: remove set_bootimg_dir setter
  wic: direct: don't catch ImagerError
  wic: direct: remove useless code
  wic: direct: add 'realnum' attribute to partition
  wic: direct: move UUID generation to PartitionedImage
  wic: direct: set bootloader.source in the __init__
  wic: direct: add PartitionedImage.prepare method
  wic: direct: move generation of part.realnum to PartitionedImage
  wic: direct: move creation of PartitionedImage to __init__

Fabio Berton (1):
  watchdog: Add RCONFLICTS to watchdog-keepalive and split RDEPENDS

Gary Thomas (1):
  usbutils: allow udev-hwdb to be optional

He Zhe (1):
  ltp: Fix containers/userns05 failure for lib32

Herve Jourdain (1):
  smartpm: if RPM transaction fails with an empty list of problems in
    attempt mode, ignore it!

Hongxu Jia (10):
  pax-utils: 1.1.6 -> 1.2.2
  socat: 1.7.3.1 -> 1.7.3.2
  libgcrypt: 1.7.3 -> 1.7.6
  man-pages: 4.08 -> 4.09
  rpcbind: 0.2.3 -> 0.2.4
  gnupg: 2.1.14 -> 2.1.18
  gpgme: 1.6.0 -> 1.8.0
  libgpg-error: 1.25 -> 1.26
  elfutils: 0.166 -> 0.168
  elfutils: update homepage and upstream souce

Joshua Lock (1):
  pseudo: update to 1.8.2

Joshua Watt (1):
  classes/license: Respect beginline and endline

Jussi Kukkonen (4):
  cve-check.bbclass: Fix dependencies
  cve-check-tool: Fixes for recipe sysroots
  cve-check-tool: Use CA cert bundle in correct sysroot
  libxslt: Add build fix (with ld-is-gold)

Khem Raj (2):
  glibc: Update to 2.25 release
  libcap: Add gperf-native to depends

Kristian Amlie (2):
  wic: Add --exclude-path option to rootfs source plugin.
  selftest/wic: Add tests for --exclude-dir option.

Li Zhou (1):
  bash: fix CVE-2016-9401

Mariano Lopez (2):
  testimage.bbclass: Add check for empty test suite
  insane.bbclass: Add missing dependencies

Markus Lehtonen (8):
  oeqa/buildperf: don't archive stdout/stderr of commands
  oeqa.utils.git: add git_dir property
  scripts: Implement oe-git-archive
  oeqa.utils.git: support bare repos
  scripts/oe-git-archive: support creating bare repositories
  build-perf-test-wrapper.sh: use oe-git-archive
  oe-build-perf-test: drop --commit-results
  build-perf-test-wrapper.sh: fix issues with non-existing path
    arguments

Nathan Rossi (1):
  image.bbclass: Use 'populate_sdk_base' for non-linux targets

Paul Eggleton (1):
  classes/copyleft_filter: include AGPL in default included list

Philip Balister (1):
  sanity.bbclass: Add which to SANITY_REQUIRED_UTILITIES.

Robert Yang (10):
  e2fsprogs: 1.43.3 -> 1.43.4
  git: 2.11.0 -> 2.11.1
  gnu-efi: 3.0.4 -> 3.0.5
  hdparm: 9.50 -> 9.51
  libpcre: 8.39 -> 8.40
  wget: 1.18 -> 1.19
  strace: 4.14 -> 4.15
  strace: fix gawk's path
  mklibs-native: 0.1.41 -> 0.1.43
  m4: 1.4.17 -> 1.4.18

Ross Burton (5):
  libepoxy: upgrade to 1.4.0
  lttng-tools: no need to delete libxml.m4
  security_flags: disable -pie for gpgme
  dbus: remove pointless cd
  m4: use wildcard for selftest bbappend

Scott Rifenbark (1):
  bitbake: bitbake-user-manual: Removed pn-buildlist,
    package-depends.dot and pn-depends.dot

Stefan Müller-Klieser (1):
  perf: add PACKAGECONFIG for jvmti

Stephano Cetola (1):
  insane.bbclass: print QA message correctly

Tanu Kaskinen (1):
  pulseaudio: 9.0 -> 10.0

 .../bitbake-user-manual-intro.xml                  |  16 +-
 .../m4/{m4_1.4.17.bbappend => m4_%.bbappend}       |   0
 meta/classes/copyleft_filter.bbclass               |   2 +-
 meta/classes/cve-check.bbclass                     |   2 +-
 meta/classes/image.bbclass                         |   4 +-
 meta/classes/insane.bbclass                        |   7 +-
 meta/classes/kernel.bbclass                        |  11 +-
 meta/classes/license.bbclass                       |  34 +-
 meta/classes/package_deb.bbclass                   |   4 +
 meta/classes/sanity.bbclass                        |   2 +-
 meta/classes/testimage.bbclass                     |   4 +
 meta/classes/uboot-extlinux-config.bbclass         |  18 +
 meta/conf/distro/include/security_flags.inc        |   2 +-
 meta/lib/oeqa/buildperf/base.py                    |  29 +-
 meta/lib/oeqa/buildperf/test_basic.py              |  10 +-
 meta/lib/oeqa/selftest/wic.py                      | 104 +++
 meta/lib/oeqa/utils/decorators.py                  |   7 +-
 meta/lib/oeqa/utils/git.py                         |  20 +-
 .../aarch64-initplat.c-fix-const-qualifier.patch   |  35 -
 .../gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} |   5 +-
 meta/recipes-bsp/usbutils/usbutils_008.bb          |   2 +-
 .../socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb}   |   4 +-
 ...001-Fix-format-security-compilation-error.patch |  57 ++
 .../console-tools/console-tools_0.3.2.bb           |   1 +
 meta/recipes-core/dbus/dbus_1.10.14.bb             |   1 -
 .../glibc/cross-localedef-native_2.25.bb           |   5 +-
 ...k-IFUNC-definition-in-unrelocated-shared-.patch |  98 ---
 meta/recipes-core/glibc/glibc_2.25.bb              |   6 +-
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   7 +-
 ...ow-overriding-default-CA-certificate-file.patch | 215 ++++++
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch |   9 +-
 .../{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb}   |   6 +-
 .../elfcmp-fix-self-comparision.patch              |  41 --
 .../elfutils/elfutils-0.166/m68k_backend.diff      | 492 -------------
 .../elfutils/elfutils-0.166/uclibc-support.patch   | 128 ----
 ...de-alternatives-for-glibc-assumptions-hel.patch | 772 +++++++++------------
 ...m-Silence-Werror-maybe-uninitialized-fals.patch |   0
 .../0001-fix-a-stack-usage-warning.patch           |   0
 .../0001-remove-the-unneed-checking.patch          |   0
 .../aarch64_uio.patch                              |   0
 ...ferences-between-mips-machine-identifiers.patch |  13 +-
 ...-support-for-mips64-abis-in-mips_retval.c.patch |   3 +
 .../0003-Add-mips-n64-relocation-format-hack.patch |  35 +-
 .../debian}/arm_backend.diff                       |  55 +-
 .../debian}/hppa_backend.diff                      |  63 +-
 .../elfutils/elfutils-0.168/debian/hurd_path.patch |  17 +
 .../elfutils-0.168/debian/ignore_strmerge.diff     |  14 +
 .../debian}/kfreebsd_path.patch                    |  11 +-
 .../debian}/mips_backend.diff                      |  75 +-
 .../debian}/mips_readelf_w.patch                   |  11 +-
 .../debian}/testsuite-ignore-elflint.diff          |  17 +-
 .../fixheadercheck.patch                           |   0
 .../shadow.patch                                   |   0
 .../{elfutils_0.166.bb => elfutils_0.168.bb}       |  34 +-
 meta/recipes-devtools/git/git_2.11.0.bb            |  11 -
 meta/recipes-devtools/git/git_2.11.1.bb            |  11 +
 .../m4/{m4-1.4.17.inc => m4-1.4.18.inc}            |   5 +-
 .../{m4-native_1.4.17.bb => m4-native_1.4.18.bb}   |   0
 meta/recipes-devtools/m4/m4/remove-gets.patch      |  15 +-
 .../m4/{m4_1.4.17.bb => m4_1.4.18.bb}              |   0
 ...bs-native_0.1.41.bb => mklibs-native_0.1.43.bb} |   8 +-
 .../{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb}     |   6 +-
 .../files/0001-Don-t-send-SIGUSR1-to-init.patch    |  48 --
 ...t-diagnostics-during-startup-for-pseudo-d.patch |  54 --
 .../files/0002-Use-correct-file-descriptor.patch   |  53 --
 ...nameat-parallel-to-previous-fix-to-rename.patch |  64 --
 .../pseudo/files/Fix-xattr-performance.patch       | 117 ----
 .../pseudo/files/More-correctly-fix-xattrs.patch   |  37 -
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  17 -
 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  11 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |   4 +-
 .../python/python-smartpm/smart-attempt.patch      |  14 +-
 .../python/Don-t-use-getentropy-on-Linux.patch     |  41 ++
 meta/recipes-devtools/python/python_2.7.12.bb      |   1 +
 .../0001-caps-abbrev.awk-fix-gawk-s-path.patch     |  49 ++
 .../strace/{strace_4.14.bb => strace_4.15.bb}      |   5 +-
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 ++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   1 +
 .../hdparm/{hdparm_9.50.bb => hdparm_9.51.bb}      |   4 +-
 .../{lighttpd_1.4.43.bb => lighttpd_1.4.45.bb}     |   4 +-
 ...039-fcntl-fix-the-time-def-to-use-time_t.patch} |   0
 ...iners-userns05-use-unsigned-int-for-ns-id.patch |  60 ++
 meta/recipes-extended/ltp/ltp_20160126.bb          |   3 +-
 .../{man-pages_4.08.bb => man-pages_4.09.bb}       |   4 +-
 ...001-Avoid-use-of-glibc-sys-cdefs.h-header.patch | 221 ------
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch |  43 --
 .../rpcbind/rpcbind/cve-2015-7236.patch            |  84 ---
 .../rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} |   7 +-
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |   9 +-
 meta/recipes-extended/wget/wget.inc                |   2 -
 .../wget/{wget_1.18.bb => wget_1.19.bb}            |   4 +-
 .../xz/{xz_5.2.2.bb => xz_5.2.3.bb}                |   4 +-
 ...-platforms-based-on-configuration-results.patch | 128 ----
 ...0002-add-an-option-to-disable-glx-support.patch |  42 --
 .../libepoxy/libepoxy/no-need-for-python3.patch    |  20 -
 .../{libepoxy_git.bb => libepoxy_1.4.0.bb}         |  16 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb       |   1 +
 meta/recipes-kernel/linux/linux-yocto.inc          |   1 -
 meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb     |   5 -
 meta/recipes-kernel/perf/perf.bb                   |   1 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |  80 ++-
 ...oth-fail-if-user-requested-profile-doesn-.patch |  61 --
 ...ard-don-t-allow-the-CARD_NEW-hook-to-fail.patch |  37 -
 ...-move-profile-selection-after-pa_card_new.patch | 429 ------------
 ...rd-remove-pa_card_new_data.active_profile.patch |  72 --
 ...vailability-for-some-unavailable-profiles.patch |  79 ---
 .../{pulseaudio_9.0.bb => pulseaudio_10.0.bb}      |   9 +-
 .../gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb}     |   8 +-
 meta/recipes-support/gpgme/gpgme/gpgme.pc          |  10 -
 meta/recipes-support/gpgme/gpgme/pkgconfig.patch   |  42 +-
 .../gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb}       |  22 +-
 meta/recipes-support/libcap/libcap_2.25.bb         |   2 +-
 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb  |   4 -
 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb  |   4 +
 .../{libgpg-error_1.25.bb => libgpg-error_1.26.bb} |   5 +-
 .../libpcre/{libpcre_8.39.bb => libpcre_8.40.bb}   |   6 +-
 .../libxslt/0001-Link-libraries-with-libm.patch    |  48 ++
 meta/recipes-support/libxslt/libxslt_1.1.29.bb     |   1 +
 scripts/contrib/build-perf-test-wrapper.sh         |  22 +-
 scripts/lib/wic/engine.py                          |   7 +-
 scripts/lib/wic/help.py                            |   6 +
 scripts/lib/wic/ksparser.py                        |   3 +-
 scripts/lib/wic/partition.py                       |   3 +
 scripts/lib/wic/plugins/imager/direct.py           | 509 +++++++++-----
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  10 +-
 scripts/lib/wic/plugins/source/rootfs.py           |  43 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |   4 +-
 scripts/lib/wic/utils/oe/__init__.py               |  22 -
 scripts/lib/wic/utils/partitionedfs.py             | 386 -----------
 scripts/oe-build-perf-test                         | 104 ---
 scripts/oe-git-archive                             | 247 +++++++
 scripts/wic                                        |   4 +-
 134 files changed, 2160 insertions(+), 3928 deletions(-)
 rename meta-selftest/recipes-test/m4/{m4_1.4.17.bbappend => m4_%.bbappend} (100%)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} (92%)
 rename meta/recipes-connectivity/socat/{socat_1.7.3.1.bb => socat_1.7.3.2.bb} (89%)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Fix-format-security-compilation-error.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0028-Revert-Check-IFUNC-definition-in-unrelocated-shared-.patch
 create mode 100644 meta/recipes-devtools/cve-check-tool/files/0001-curl-allow-overriding-default-CA-certificate-file.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/elfcmp-fix-self-comparision.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/m68k_backend.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.166/uclibc-support.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch (47%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-fix-a-stack-usage-warning.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/0001-remove-the-unneed-checking.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/aarch64_uio.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0001-Ignore-differences-between-mips-machine-identifiers.patch (78%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0002-Add-support-for-mips64-abis-in-mips_retval.c.patch (98%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/0003-Add-mips-n64-relocation-format-hack.patch (90%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/arm_backend.diff (94%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/hppa_backend.diff (95%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/hurd_path.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.168/debian/ignore_strmerge.diff
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/kfreebsd_path.patch (60%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_backend.diff (92%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/mips_readelf_w.patch (73%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168/debian}/testsuite-ignore-elflint.diff (70%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.166 => elfutils-0.168}/shadow.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.166.bb => elfutils_0.168.bb} (75%)
 delete mode 100644 meta/recipes-devtools/git/git_2.11.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.11.1.bb
 rename meta/recipes-devtools/m4/{m4-1.4.17.inc => m4-1.4.18.inc} (75%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.17.bb => m4-native_1.4.18.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.17.bb => m4_1.4.18.bb} (100%)
 rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.41.bb => mklibs-native_0.1.43.bb} (72%)
 rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.6.bb => pax-utils_1.2.2.bb} (86%)
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Quiet-diagnostics-during-startup-for-pseudo-d.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0002-Use-correct-file-descriptor.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0003-Fix-renameat-parallel-to-previous-fix-to-rename.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/Fix-xattr-performance.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/More-correctly-fix-xattrs.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
 create mode 100644 meta/recipes-devtools/python/python/Don-t-use-getentropy-on-Linux.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 rename meta/recipes-devtools/strace/{strace_4.14.bb => strace_4.15.bb} (88%)
 create mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 rename meta/recipes-extended/hdparm/{hdparm_9.50.bb => hdparm_9.51.bb} (89%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.43.bb => lighttpd_1.4.45.bb} (96%)
 rename meta/recipes-extended/ltp/ltp/{fcntl-fix-the-time-def-to-use-time_t.patch => 0039-fcntl-fix-the-time-def-to-use-time_t.patch} (100%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0040-containers-userns05-use-unsigned-int-for-ns-id.patch
 rename meta/recipes-extended/man-pages/{man-pages_4.08.bb => man-pages_4.09.bb} (86%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.3.bb => rpcbind_0.2.4.bb} (87%)
 rename meta/recipes-extended/wget/{wget_1.18.bb => wget_1.19.bb} (53%)
 rename meta/recipes-extended/xz/{xz_5.2.2.bb => xz_5.2.3.bb} (90%)
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-select-platforms-based-on-configuration-results.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0002-add-an-option-to-disable-glx-support.patch
 delete mode 100644 meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
 rename meta/recipes-graphics/libepoxy/{libepoxy_git.bb => libepoxy_1.4.0.bb} (58%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0005-alsa-set-availability-for-some-unavailable-profiles.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_9.0.bb => pulseaudio_10.0.bb} (41%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.14.bb => gnupg_2.1.18.bb} (80%)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/gpgme.pc
 rename meta/recipes-support/gpgme/{gpgme_1.6.0.bb => gpgme_1.8.0.bb} (67%)
 delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.3.bb
 create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.6.bb
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.25.bb => libgpg-error_1.26.bb} (89%)
 rename meta/recipes-support/libpcre/{libpcre_8.39.bb => libpcre_8.40.bb} (92%)
 create mode 100644 meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
 delete mode 100644 scripts/lib/wic/utils/oe/__init__.py
 delete mode 100644 scripts/lib/wic/utils/partitionedfs.py
 create mode 100755 scripts/oe-git-archive

-- 
2.8.1


