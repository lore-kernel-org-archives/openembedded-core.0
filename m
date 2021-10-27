Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FE22C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:16:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456697"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456697"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:16:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537616991"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:16:55 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/36] Review request
Date: Wed, 27 Oct 2021 23:16:08 +0800
Message-Id: <cover.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:16:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157516

Please review these changes for hardknott. No issues seen on autobuilder
except for an unrelated reproducibility failure that is currently being
debugged.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2817

Thanks,

Anuj

The following changes since commit 366070c476405a1f49e22a02c21fd99fc0ec76d9:

  scriptutils.py: Add check before deleting path (2021-10-04 10:46:18 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.149
  linux-yocto/5.4: update to v5.4.150
  linux-yocto/5.4: update to v5.4.153
  linux-yocto/5.10: update to v5.10.69
  linux-yocto/5.10: update to v5.10.70

Claudius Heine (1):
  rng-tools: add systemd-udev-settle wants to service

Hongxu Jia (1):
  nativesdk-pseudo: Fix to work with glibc 2.34 systems

Jon Mason (1):
  oeqa/manual: Fix no longer valid URLs

Jose Quaresma (1):
  patch.bbclass: when the patch fails show more info on the fatal error

Khem Raj (2):
  m4: Do not use SIGSTKSZ
  gpgme: Use glibc provided closefrom API when available

Mark Hatle (1):
  externalsrc: Work with reproducible_build

Markus Volk (1):
  util-linux: disable raw

Michael Halstead (1):
  uninative: Upgrade to 3.3, support glibc 2.34

Mingli Yu (1):
  ncurses: fix CVE-2021-39537

Pablo Saavedra Rodi?o (1):
  mesa: gallium/dri Make YUV formats we're going to emulate
    external-only

Pgowda (1):
  glibc: upgrade glibc-2.33 to latest version

Richard Purdie (16):
  rpm: Ensure compression parallelism isn't coded into rpms
  package: Ensure pclist files are deterministic and don't use full
    paths
  gnupg: Be deterministic about sendmail
  mesa: Ensure megadrivers runtime mappings are deterministic
  gobject-introspection: Don't write $HOME into scripts
  oeqa/selftest/bbtests: Add uuid to force build test
  externalsrc: Fix a source date epoch race in reproducible builds
  multilib: Avoid sysroot race issues when multilib enabled
  libxml2: Use python3targetconfig to fix reproducibility issue
  libnewt: Use python3targetconfig to fix reproducibility issue
  python3: Add a fix for a make install race
  pseudo: Fix to work with glibc 2.34 systems
  pseudo: Update with fcntl and glibc 2.34 fixes
  oeqa/selftest/glibc: Handle incorrect encoding issuesin glibc test
    results
  rpm: Deterministically set vendor macro entry
  reproducible_build: Work around caching issues

Ross Burton (1):
  uninative: Improve glob to handle glibc 2.34

Sakib Sajal (1):
  go: upgrade 1.16.7 -> 1.16.8

Thomas Perrot (1):
  ruby: fix the reproducibility issue

 meta/classes/externalsrc.bbclass              |   9 +
 meta/classes/package.bbclass                  |   6 +-
 meta/classes/patch.bbclass                    |   7 +-
 meta/classes/reproducible_build.bbclass       |  11 +-
 meta/classes/uninative.bbclass                |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/conf/multilib.conf                       |   2 +
 meta/lib/oeqa/manual/eclipse-plugin.json      |   6 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   4 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0001-CVE-2021-38604.patch     |  40 ----
 ...-private-futex-optimization-BZ-27304.patch |  49 -----
 .../glibc/glibc/0002-CVE-2021-38604.patch     | 147 --------------
 ...-ISA-support-for-x86-64-level-marker.patch | 116 -----------
 ...ork-around-GCC-PR-98512-in-rawmemchr.patch |  58 ------
 ...-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch | 185 ------------------
 .../glibc/glibc/CVE-2021-27318-revert.patch   | 174 ++++++++++++++++
 .../glibc/glibc/CVE-2021-27645.patch          |  51 -----
 .../glibc/glibc/CVE-2021-33574_1.patch        |  76 -------
 .../glibc/glibc/CVE-2021-33574_2.patch        |  61 ------
 .../glibc/glibc/CVE-2021-35942.patch          |  44 -----
 meta/recipes-core/glibc/glibc_2.33.bb         |  10 -
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +-
 .../ncurses/files/CVE-2021-39537.patch        |  65 ++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |   1 +
 .../util-linux/util-linux_2.36.2.bb           |   2 +-
 .../go/{go-1.16.7.inc => go-1.16.8.inc}       |   4 +-
 ...e_1.16.7.bb => go-binary-native_1.16.8.bb} |   4 +-
 ..._1.16.7.bb => go-cross-canadian_1.16.8.bb} |   0
 ...{go-cross_1.16.7.bb => go-cross_1.16.8.bb} |   0
 ...osssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} |   0
 ...o-native_1.16.7.bb => go-native_1.16.8.bb} |   0
 ...runtime_1.16.7.bb => go-runtime_1.16.8.bb} |   0
 .../go/{go_1.16.7.bb => go_1.16.8.bb}         |   0
 meta/recipes-devtools/m4/m4-1.4.18.inc        |   1 +
 .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch |  84 ++++++++
 .../pseudo/files/build-oldlibc                |  20 ++
 .../pseudo/files/older-glibc-symbols.patch    |  57 ++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   9 +-
 .../python/python3/makerace.patch             |  23 +++
 meta/recipes-devtools/python/python3_3.9.5.bb |   1 +
 ...not-insert-payloadflags-into-.rpm-me.patch |  28 +++
 meta/recipes-devtools/rpm/rpm_4.16.1.3.bb     |   4 +-
 ...doc-build-reproducible-documentation.patch |  35 ++++
 ...-list-of-object-files-in-generated-M.patch |  28 +++
 ...eproducible-change-fixing-784225-too.patch |  28 +++
 .../0006-Make-gemspecs-reproducible.patch     |  67 +++++++
 meta/recipes-devtools/ruby/ruby_3.0.1.bb      |   4 +
 meta/recipes-extended/newt/libnewt_0.52.21.bb |   2 +-
 .../gobject-introspection_1.66.1.bb           |   2 +-
 ...-YUV-formats-we-re-going-to-emulate-.patch |  52 +++++
 meta/recipes-graphics/mesa/mesa.inc           |   3 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 meta/recipes-support/gnupg/gnupg_2.2.27.bb    |   1 +
 ...se-closefrom-on-linux-and-glibc-2.34.patch |  24 +++
 meta/recipes-support/gpgme/gpgme_1.15.1.bb    |   3 +-
 .../rng-tools/rng-tools/rngd.service          |   1 +
 63 files changed, 794 insertions(+), 907 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2021-38604.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0001-nptl-Remove-private-futex-optimization-BZ-27304.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2021-38604.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0031-x86-Require-full-ISA-support-for-x86-64-level-marker.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0032-string-Work-around-GCC-PR-98512-in-rawmemchr.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0033-x86-Handle-_SC_LEVEL1_ICACHE_LINESIZE-BZ-27444.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27318-revert.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-27645.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-35942.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch
 rename meta/recipes-devtools/go/{go-1.16.7.inc => go-1.16.8.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.7.bb => go-binary-native_1.16.8.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.7.bb => go-cross-canadian_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.7.bb => go-cross_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.7.bb => go-crosssdk_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.7.bb => go-native_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.7.bb => go-runtime_1.16.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.7.bb => go_1.16.8.bb} (100%)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
 create mode 100755 meta/recipes-devtools/pseudo/files/build-oldlibc
 create mode 100644 meta/recipes-devtools/pseudo/files/older-glibc-symbols.patch
 create mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-build-pack.c-do-not-insert-payloadflags-into-.rpm-me.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0006-Make-gemspecs-reproducible.patch
 create mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-dri-Make-YUV-formats-we-re-going-to-emulate-.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch

-- 
2.31.1


