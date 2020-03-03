Return-Path: <anuj.mittal@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id E72BB60247
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 23:59:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2020 15:59:47 -0800
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="229123206"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.180.1])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Mar 2020 15:59:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2020 07:59:38 +0800
Message-Id: <cover.1583279757.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [zeus][PATCH 00/22] zeus merge request, cover letter only
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
X-List-Received-Date: Tue, 03 Mar 2020 23:59:47 -0000
Content-Transfer-Encoding: 8bit

Please merge these changes from stable/zeus-next.

Clean a-full on autobuilder except a single unrelated fetch failure for
esdk test:
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/751

Thanks,

Anuj

The following changes since commit f39285bb82e68945a81034b84da09ca1078d6719:

  Revert "bash: Fix CVE-2019-18276" (2020-02-19 18:53:10 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

Alexander Kanavin (5):
  perl: update to 5.30.1
  perl: package Config.pm from arch directory into the main perl package
  perl: install typemap and other extutils metadata as part of perl-core
  libmodule-build-perl: fix ptests
  perl: fix failing ptests

Anuj Mittal (3):
  openssh: backport patch to fix "cert not yet valid" test
  ncurses: add CVE_VERSION
  libxml2: fix CVE-2020-7595

Bruce Ashfield (2):
  linux-yocto/5.2: update to v5.2.29
  linux-yocto/5.2: update to v5.2.32

Jeremy Puhlman (1):
  toolchain-shar-extract: ignore timestamp on decompress

Kevin Hao (1):
  xserver-nodm-init: Fix the start failure for non-root user

Lee Chee Yang (2):
  qemu: Fix CVE-2020-1711
  libxml2: Fix CVE-2019-20388

Nathan Rossi (2):
  glibc-testsuite: Remove the do_install task
  glibc-testsuite: Exclude this recipe from world builds

Richard Purdie (2):
  perl: Fix encode module reproducibility issues
  perl: Fix makefile race causing configuration differences

Ross Burton (1):
  perl: improve reproducibility

Tim Orling (1):
  liberror-perl: upgrade 0.17028 -> 0.17029

Trevor Gamblin (1):
  qemurunner.py: add try/except for pid handling race

Yi Zhao (1):
  ppp: Security fix CVE-2020-8597

 meta/files/toolchain-shar-extract.sh          |  2 +-
 meta/lib/oeqa/utils/qemurunner.py             |  5 +-
 ...zo-decided-to-use-2020-as-a-future-d.patch | 46 +++++++++++++
 .../openssh/openssh_8.0p1.bb                  |  1 +
 ...01-pppd-Fix-bounds-check-in-EAP-code.patch | 47 ++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |  1 +
 .../glibc/glibc-testsuite_2.30.bb             |  3 +
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 +++++++++++
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 +++++++++++
 meta/recipes-core/libxml/libxml2_2.9.9.bb     |  2 +
 .../ncurses/ncurses_6.1+20190803.bb           |  2 +
 ...correctly-exclude-unbuilt-extensions.patch | 27 ++++++++
 .../perl/files/encodefix.patch                | 20 ++++++
 .../perl/files/fix-setgroup.patch             | 49 --------------
 .../perl/files/perl-configpm-switch.patch     |  4 +-
 .../recipes-devtools/perl/files/racefix.patch | 24 +++++++
 ...rl_0.17028.bb => liberror-perl_0.17029.bb} |  4 +-
 .../perl/libmodule-build-perl/run-ptest       |  2 -
 .../perl/libmodule-build-perl_0.4229.bb       |  3 +
 .../perl/{perl_5.30.0.bb => perl_5.30.1.bb}   | 31 ++++++---
 meta/recipes-devtools/qemu/qemu.inc           |  3 +-
 .../qemu/qemu/CVE-2020-1711.patch             | 64 +++++++++++++++++++
 .../xserver-nodm-init/capability.conf         |  2 +
 .../x11-common/xserver-nodm-init/xserver-nodm |  8 +++
 .../x11-common/xserver-nodm-init_3.0.bb       |  7 +-
 .../linux/linux-yocto-rt_5.2.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++----
 28 files changed, 379 insertions(+), 87 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-Fix-bounds-check-in-EAP-code.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
 create mode 100644 meta/recipes-devtools/perl/files/0001-tests-adjust-to-correctly-exclude-unbuilt-extensions.patch
 create mode 100644 meta/recipes-devtools/perl/files/encodefix.patch
 delete mode 100644 meta/recipes-devtools/perl/files/fix-setgroup.patch
 create mode 100644 meta/recipes-devtools/perl/files/racefix.patch
 rename meta/recipes-devtools/perl/{liberror-perl_0.17028.bb => liberror-perl_0.17029.bb} (89%)
 rename meta/recipes-devtools/perl/{perl_5.30.0.bb => perl_5.30.1.bb} (93%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-1711.patch
 create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/capability.conf

-- 
2.24.1


