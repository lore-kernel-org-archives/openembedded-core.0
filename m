Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD76719B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 08:55:49 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f82so154161137wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 00:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2wH6ajH8lUPNqMnv09y24lEU1pctYCcHw5eVVCGXl/s=;
	b=umuJ+Y+mfRXre2/mgkFXhN56BFy5CyELM/VErY69E6PX4eFD0Y3AAwv5Lkbc7jwACz
	GerXwIH4qGx0FlPpjoMv6CtJ1YCsl6QfebdDDU166AJq8MHAw2uKa5O5doA8NGnW9EX2
	1PLxOg8IuUFVM7nVE8fyZyrlvPPNNd9xG5Aua4CR8Zrqrga+Ho30BqDQ/a+7eLldbyo7
	q1JuMKHlkTBtdDMuoVTszM4WUucB0Hzn/LaGYVp6KeQbtVf3XvxkaYrHkZAJZLCb9XaB
	q+Uqs45wyZmURiSRbQmQB9RwBNN6bha2m3ntqrWqS0MBCfhlCKuQIgVy1Hs5Xl9wtLi7
	6UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2wH6ajH8lUPNqMnv09y24lEU1pctYCcHw5eVVCGXl/s=;
	b=k4K3xa9tBQzY+/4QiH8tJAu+x142ahdwvnyWRbrOTuwbQM92SNr50rXfTsVPyU69sO
	+RwpzsdN4/To39PYrEpGdNYsyzhBPyVQucvDaVdzEzWV5oS3X7S78TR+C/k9muWw3BaJ
	3kSjKotiUWdKd5CNtRbpGg2yLDzEu4M1tfnUTSQ+o2/ukjpZyODoON7hTzDKmq3FYGyu
	qjEyGZ1xSYzEdL2DhrwuH+iGPhZOZA8viabCyFafXpkCdy0muztHt9JMw/dGQlWZf/U4
	1WiVLXOtMldpjgvsBgZZy6HJ5tXCEo2731HpJ60fbwE0tx85IFmAzVCgTt/oLAV5fqXw
	kBhw==
X-Gm-Message-State: ABUngvcZ1VmJDzfubuLofA9qproWLTBDJbOThT824cJLaBv9sF6dodKi7jveaROkh383+f+2
X-Received: by 10.28.63.3 with SMTP id m3mr2482502wma.113.1479200150335;
	Tue, 15 Nov 2016 00:55:50 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ua15sm33430000wjb.1.2016.11.15.00.55.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Nov 2016 00:55:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 08:55:45 +0000
Message-Id: <cover.1479200037.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 00/57] Consolidated Pull
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
X-List-Received-Date: Tue, 15 Nov 2016 08:55:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Consolidated pull, generally green on the AB.  The last build run failed in
qemumips64 sanity testing but has previously passed so this appears to be a new
transient failure.  oe-core runs are failing in eSDK creation but this needs
modifications to the autobuiler itself.

Ross

The following changes since commit 43e652f3d1fee5ce7fad67e6400315eab1b34270:

  devtool: add "rename" subcommand (2016-11-07 11:04:22 +0000)

are available in the git repository at:

  ssh://git@git.yoctoproject.org/poky-contrib ross/mut

for you to fetch changes up to cb4f6ebe47032fba4d63259524aa4f3d36e1b0aa:

  maintainers.inc: remove libwnck3 recipe (2016-11-15 08:49:49 +0000)

----------------------------------------------------------------
Alexander Kanavin (1):
      maintainers.inc: remove libwnck3 recipe

Alistair Francis (1):
      runqemu: Split out the base name of QB_DEFAULT_KERNEL

André Draszik (2):
      image-buildinfo: treat staged changes as modified branch, too
      cve-check.bbclass: CVE-2014-2524 / readline v5.2

Armin Kuster (2):
      tzcode: update to 2016i
      tzdata: update to 2016i

Brad Bishop (1):
      libyaml: Enable nativesdk bake

Carlos Alberto Lopez Perez (1):
      webkitgtk: drop patch 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

Ed Bartosh (1):
      systemd-bootdisk.wks: use PARTUUID

Fabio Berton (5):
      serf: Update to version 1.3.9
      grep: Update to version 2.26
      curl: Update to version 7.51.0
      gawk: Update to version 4.1.4
      libpcap: Update to version 1.8.1

Fathi Boudra (1):
      wayland: upgrade from 1.11.1 to 1.12.0

Jackie Huang (1):
      classes/cpan-base: fix for PERLVERSION

Joe Konno (1):
      initrdscripts: add support for NVME target install

Joshua Lock (5):
      lib/oe/path: remove duplicate import
      lib/oe/lsb: make the release dict keys consistent regardless of source
      lib/oe/lsb: prefer /etc/os-release for distribution data
      lib/oe/lsb: attempt to ensure consistent distro id regardless of source
      poky: update SANITY_TEST_DISTROS for new format

Jussi Kukkonen (1):
      conf: Remove legacy X input drivers

Khem Raj (3):
      libbsd: Fix build with musl
      glibc-2.0: Detect pthread_getname_np() before use
      x264: Update to latest on stable branch

Koen Kooi (1):
      libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk

Li Zhou (1):
      db: disable the ARM assembler mutex code

Maciej Borzecki (5):
      wic: make sure that partition size is always an integer in internal processing
      wic: use partition size when creating empty partition files
      wic: check that filesystem is specified for a rootfs partition
      wic: fix function comment typos
      oe-selftest: fix handling of test cases without ID in --list-tests-by

Markus Lehtonen (1):
      sanity.bbclass: fix logging of an error

Maxin B. John (1):
      ref-images.xml: remove core-image-directfb reference

Richard Purdie (1):
      chrpath: Remove standard search paths from RPATHS

Robert Yang (2):
      qemuarm64.conf: make runqemu's graphics work
      populate_sdk_ext.bbclass: check unfsd before create it

Ross Burton (6):
      conf/distro/include/maintainers: move toolchain to Khem Raj
      Revert "oeqa/selftest/kernel.py: Add new file destined for kernel related tests"
      distro_check: MeeGo is long dead, compare against Clear Linux instead
      lib/oe/qa: handle binaries with segments outside the first 4kb
      systemtap: remove explicit msgfmt check
      systemtap: fix native linking on recent Ubuntu

Zubair Lutfullah Kakakhel (13):
      arch-mips: Add o32 in TUNE_FEATURES for MIPS32R6
      arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
      bitbake.conf: Reduce duplication in MIPS variants
      fts: Reduce duplication in MIPS variants.
      glibc: Reduce duplication in MIPS variants
      packagegroup: Reduce duplication in MIPS variants.
      gcc-runtime: Reduce duplication in MIPS variants.
      gdb: Reduce duplication in MIPS variants.
      mmc-utils: Reduce duplication in MIPS variants.
      valgrind: Reduce duplication in MIPS variants.
      ghostscript: Reduce duplication in MIPS variants.
      mdadm: Reduce duplication in MIPS variants.
      webkit: Reduce duplication in MIPS variants.

 documentation/ref-manual/ref-images.xml            |   3 -
 meta-poky/conf/distro/include/maintainers.inc      |  59 ++--
 meta-poky/conf/distro/poky.conf                    |  24 +-
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   4 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   1 -
 meta/classes/chrpath.bbclass                       |  13 +-
 meta/classes/cpan-base.bbclass                     |   2 +-
 meta/classes/cve-check.bbclass                     |   2 +-
 meta/classes/image-buildinfo.bbclass               |   4 +-
 meta/classes/populate_sdk_ext.bbclass              |   5 +-
 meta/classes/sanity.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |  11 +-
 meta/conf/machine/include/mips/README              |   3 +
 meta/conf/machine/include/mips/arch-mips.inc       |  12 +
 meta/conf/machine/include/tune-mips32r6.inc        |   8 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/lib/oe/distro_check.py                        |  16 +-
 meta/lib/oe/lsb.py                                 |  73 +++--
 meta/lib/oe/path.py                                |   1 -
 meta/lib/oe/qa.py                                  |  82 ++---
 meta/lib/oeqa/selftest/kernel.py                   |  29 --
 meta/recipes-connectivity/libpcap/libpcap.inc      |   5 +-
 .../libpcap/libpcap/aclocal.patch                  | 167 ----------
 .../libpcap/libpcap-pkgconfig-support.patch        |  32 +-
 .../libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} |  13 +-
 meta/recipes-core/fts/fts.bb                       |   5 +-
 ...st-for-pthread_getname_np-before-using-it.patch |  70 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb      |   1 +
 meta/recipes-core/glibc/glibc-ld.inc               |  17 +-
 .../initrdscripts/files/init-install-efi.sh        |   5 +-
 .../initrdscripts/files/init-install.sh            |   5 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   5 +-
 .../packagegroup-core-tools-profile.bb             |  10 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   9 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   7 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |   4 +-
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 .../gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest      |   0
 .../test-arrayind1-Remove-hashbang-line.patch      |  30 ++
 .../gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}          |   5 +-
 .../ghostscript/ghostscript_9.19.bb                |   3 +-
 .../grep/{grep_2.25.bb => grep_2.26.bb}            |   4 +-
 meta/recipes-extended/mdadm/mdadm_3.4.bb           |   4 +-
 ...code-native_2016h.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016h.bb => tzdata_2016i.bb}    |   4 +-
 ...0001-scanner-Use-unit32_t-instead-of-uint.patch |  30 --
 .../{wayland_1.11.1.bb => wayland_1.12.0.bb}       |   5 +-
 .../systemtap/systemtap/fix-monitor-linking.patch  |  41 +++
 .../systemtap/systemtap/no-msgfmt-check.patch      |  15 +
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   2 +
 .../don-t-default-to-cortex-a9-with-neon.patch     |  13 +-
 meta/recipes-multimedia/x264/x264_git.bb           |  11 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 181 ----------
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb       |   4 +-
 .../curl/{curl_7.50.1.bb => curl_7.51.0.bb}        |   4 +-
 meta/recipes-support/db/db_6.0.35.bb               |   9 -
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 363 +++++++++++++++++++++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  55 ++++
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch | 130 ++++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |   7 +
 meta/recipes-support/libyaml/libyaml_0.1.7.bb      |   2 +-
 .../serf/{serf_1.3.8.bb => serf_1.3.9.bb}          |   8 +-
 .../target/arch/arm/conf/machine/machine.conf      |   4 +-
 .../target/arch/mips/conf/machine/machine.conf     |   1 -
 .../target/arch/mips64/conf/machine/machine.conf   |   1 -
 .../target/arch/powerpc/conf/machine/machine.conf  |   1 -
 .../target/arch/qemu/conf/machine/machine.conf     |   3 -
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks    |   2 +-
 scripts/lib/wic/partition.py                       |  20 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   4 +-
 scripts/oe-selftest                                |  13 +-
 scripts/runqemu                                    |   5 +-
 74 files changed, 998 insertions(+), 714 deletions(-)
 delete mode 100644 meta/lib/oeqa/selftest/kernel.py
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} (67%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
 rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest (100%)
 create mode 100644 meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
 rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (85%)
 rename meta/recipes-extended/grep/{grep_2.25.bb => grep_2.26.bb} (88%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
 rename meta/recipes-graphics/wayland/{wayland_1.11.1.bb => wayland_1.12.0.bb} (88%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
 delete mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 rename meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} (94%)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
 rename meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} (67%)

Alexander Kanavin (1):
  maintainers.inc: remove libwnck3 recipe

Alistair Francis (1):
  runqemu: Split out the base name of QB_DEFAULT_KERNEL

André Draszik (2):
  image-buildinfo: treat staged changes as modified branch, too
  cve-check.bbclass: CVE-2014-2524 / readline v5.2

Armin Kuster (2):
  tzcode: update to 2016i
  tzdata: update to 2016i

Brad Bishop (1):
  libyaml: Enable nativesdk bake

Carlos Alberto Lopez Perez (1):
  webkitgtk: drop patch
    0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch

Ed Bartosh (1):
  systemd-bootdisk.wks: use PARTUUID

Fabio Berton (5):
  serf: Update to version 1.3.9
  grep: Update to version 2.26
  curl: Update to version 7.51.0
  gawk: Update to version 4.1.4
  libpcap: Update to version 1.8.1

Fathi Boudra (1):
  wayland: upgrade from 1.11.1 to 1.12.0

Jackie Huang (1):
  classes/cpan-base: fix for PERLVERSION

Joe Konno (1):
  initrdscripts: add support for NVME target install

Joshua Lock (5):
  lib/oe/path: remove duplicate import
  lib/oe/lsb: make the release dict keys consistent regardless of source
  lib/oe/lsb: prefer /etc/os-release for distribution data
  lib/oe/lsb: attempt to ensure consistent distro id regardless of
    source
  poky: update SANITY_TEST_DISTROS for new format

Jussi Kukkonen (1):
  conf: Remove legacy X input drivers

Khem Raj (3):
  libbsd: Fix build with musl
  glibc-2.0: Detect pthread_getname_np() before use
  x264: Update to latest on stable branch

Koen Kooi (1):
  libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk

Li Zhou (1):
  db: disable the ARM assembler mutex code

Maciej Borzecki (5):
  wic: make sure that partition size is always an integer in internal
    processing
  wic: use partition size when creating empty partition files
  wic: check that filesystem is specified for a rootfs partition
  wic: fix function comment typos
  oe-selftest: fix handling of test cases without ID in --list-tests-by

Markus Lehtonen (1):
  sanity.bbclass: fix logging of an error

Maxin B. John (1):
  ref-images.xml: remove core-image-directfb reference

Richard Purdie (1):
  chrpath: Remove standard search paths from RPATHS

Robert Yang (2):
  qemuarm64.conf: make runqemu's graphics work
  populate_sdk_ext.bbclass: check unfsd before create it

Ross Burton (6):
  conf/distro/include/maintainers: move toolchain to Khem Raj
  Revert "oeqa/selftest/kernel.py: Add new file destined for kernel
    related tests"
  distro_check: MeeGo is long dead, compare against Clear Linux instead
  lib/oe/qa: handle binaries with segments outside the first 4kb
  systemtap: remove explicit msgfmt check
  systemtap: fix native linking on recent Ubuntu

Zubair Lutfullah Kakakhel (13):
  arch-mips: Add o32 in TUNE_FEATURES for MIPS32R6
  arch-mips: Add MACHINEOVERRIDES variables to reduce duplication
  bitbake.conf: Reduce duplication in MIPS variants
  fts: Reduce duplication in MIPS variants.
  glibc: Reduce duplication in MIPS variants
  packagegroup: Reduce duplication in MIPS variants.
  gcc-runtime: Reduce duplication in MIPS variants.
  gdb: Reduce duplication in MIPS variants.
  mmc-utils: Reduce duplication in MIPS variants.
  valgrind: Reduce duplication in MIPS variants.
  ghostscript: Reduce duplication in MIPS variants.
  mdadm: Reduce duplication in MIPS variants.
  webkit: Reduce duplication in MIPS variants.

 documentation/ref-manual/ref-images.xml            |   3 -
 meta-poky/conf/distro/include/maintainers.inc      |  59 ++--
 meta-poky/conf/distro/poky.conf                    |  24 +-
 meta-yocto-bsp/conf/machine/beaglebone.conf        |   4 +-
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |   1 -
 meta/classes/chrpath.bbclass                       |  13 +-
 meta/classes/cpan-base.bbclass                     |   2 +-
 meta/classes/cve-check.bbclass                     |   2 +-
 meta/classes/image-buildinfo.bbclass               |   4 +-
 meta/classes/populate_sdk_ext.bbclass              |   5 +-
 meta/classes/sanity.bbclass                        |   2 +-
 meta/conf/bitbake.conf                             |  11 +-
 meta/conf/machine/include/mips/README              |   3 +
 meta/conf/machine/include/mips/arch-mips.inc       |  12 +
 meta/conf/machine/include/tune-mips32r6.inc        |   8 +-
 meta/conf/machine/qemuarm64.conf                   |   2 +-
 meta/lib/oe/distro_check.py                        |  16 +-
 meta/lib/oe/lsb.py                                 |  73 +++--
 meta/lib/oe/path.py                                |   1 -
 meta/lib/oe/qa.py                                  |  82 ++---
 meta/lib/oeqa/selftest/kernel.py                   |  29 --
 meta/recipes-connectivity/libpcap/libpcap.inc      |   5 +-
 .../libpcap/libpcap/aclocal.patch                  | 167 ----------
 .../libpcap/libpcap-pkgconfig-support.patch        |  32 +-
 .../libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} |  13 +-
 meta/recipes-core/fts/fts.bb                       |   5 +-
 ...st-for-pthread_getname_np-before-using-it.patch |  70 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb      |   1 +
 meta/recipes-core/glibc/glibc-ld.inc               |  17 +-
 .../initrdscripts/files/init-install-efi.sh        |   5 +-
 .../initrdscripts/files/init-install.sh            |   5 +-
 .../packagegroups/packagegroup-core-sdk.bb         |   5 +-
 .../packagegroup-core-tools-profile.bb             |  10 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc          |   9 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |   7 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |   4 +-
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |   3 +-
 .../gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest      |   0
 .../test-arrayind1-Remove-hashbang-line.patch      |  30 ++
 .../gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}          |   5 +-
 .../ghostscript/ghostscript_9.19.bb                |   3 +-
 .../grep/{grep_2.25.bb => grep_2.26.bb}            |   4 +-
 meta/recipes-extended/mdadm/mdadm_3.4.bb           |   4 +-
 ...code-native_2016h.bb => tzcode-native_2016i.bb} |   8 +-
 .../tzdata/{tzdata_2016h.bb => tzdata_2016i.bb}    |   4 +-
 ...0001-scanner-Use-unit32_t-instead-of-uint.patch |  30 --
 .../{wayland_1.11.1.bb => wayland_1.12.0.bb}       |   5 +-
 .../systemtap/systemtap/fix-monitor-linking.patch  |  41 +++
 .../systemtap/systemtap/no-msgfmt-check.patch      |  15 +
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   2 +
 .../don-t-default-to-cortex-a9-with-neon.patch     |  13 +-
 meta/recipes-multimedia/x264/x264_git.bb           |  11 +-
 ...bKitMacros-Append-to-I-and-not-to-isystem.patch | 181 ----------
 meta/recipes-sato/webkit/webkitgtk_2.14.1.bb       |   4 +-
 .../curl/{curl_7.50.1.bb => curl_7.51.0.bb}        |   4 +-
 meta/recipes-support/db/db_6.0.35.bb               |   9 -
 ...001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch | 363 +++++++++++++++++++++
 .../libbsd/libbsd/0002-Remove-funopen.patch        |  55 ++++
 ...3-Fix-build-breaks-due-to-missing-a.out.h.patch | 130 ++++++++
 meta/recipes-support/libbsd/libbsd_0.8.3.bb        |   7 +
 meta/recipes-support/libyaml/libyaml_0.1.7.bb      |   2 +-
 .../serf/{serf_1.3.8.bb => serf_1.3.9.bb}          |   8 +-
 .../target/arch/arm/conf/machine/machine.conf      |   4 +-
 .../target/arch/mips/conf/machine/machine.conf     |   1 -
 .../target/arch/mips64/conf/machine/machine.conf   |   1 -
 .../target/arch/powerpc/conf/machine/machine.conf  |   1 -
 .../target/arch/qemu/conf/machine/machine.conf     |   3 -
 scripts/lib/wic/canned-wks/systemd-bootdisk.wks    |   2 +-
 scripts/lib/wic/partition.py                       |  20 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/rawcopy.py          |   4 +-
 scripts/lib/wic/utils/partitionedfs.py             |   4 +-
 scripts/oe-selftest                                |  13 +-
 scripts/runqemu                                    |   5 +-
 74 files changed, 998 insertions(+), 714 deletions(-)
 delete mode 100644 meta/lib/oeqa/selftest/kernel.py
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/aclocal.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.7.4.bb => libpcap_1.8.1.bb} (67%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Test-for-pthread_getname_np-before-using-it.patch
 rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest (100%)
 create mode 100644 meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
 rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (85%)
 rename meta/recipes-extended/grep/{grep_2.25.bb => grep_2.26.bb} (88%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016h.bb => tzcode-native_2016i.bb} (69%)
 rename meta/recipes-extended/tzdata/{tzdata_2016h.bb => tzdata_2016i.bb} (98%)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
 rename meta/recipes-graphics/wayland/{wayland_1.11.1.bb => wayland_1.12.0.bb} (88%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix-monitor-linking.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/no-msgfmt-check.patch
 delete mode 100644 meta/recipes-sato/webkit/files/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
 rename meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} (94%)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Replace-__BEGIN_DECLS-and-__END_DECLS.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0002-Remove-funopen.patch
 create mode 100644 meta/recipes-support/libbsd/libbsd/0003-Fix-build-breaks-due-to-missing-a.out.h.patch
 rename meta/recipes-support/serf/{serf_1.3.8.bb => serf_1.3.9.bb} (67%)

-- 
2.8.1


