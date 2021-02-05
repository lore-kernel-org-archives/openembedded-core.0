Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.2216.1612488818265605856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 17:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: XgG3oNDkyvUuVasfIPqAPSC/7uGu1ezhBigI1LhTcSSGZhMWsuUJcP2L3GPqdhQHVyXkk1MG+8
 R5cdXRRbT0bw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181508388"
X-IronPort-AV: E=Sophos;i="5.81,154,1610438400"; 
   d="scan'208";a="181508388"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 17:33:37 -0800
IronPort-SDR: o8jXywnufMThEZLiydHQaoBzeri4QhaRFDr9q021OffzqDbWoIHNNHuz40+GDcDBx+uYNFGkHP
 rCNgE3YPrmGw==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; 
   d="scan'208";a="357432579"
Received: from skannank-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.35])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2021 17:33:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/25] pull request
Date: Fri,  5 Feb 2021 09:33:31 +0800
Message-Id: <cover.1612488696.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 4e8022635fc8543d135fed3091a9f555899d1b3c:

  linuxloader: Avoid confusing string concat errors (2021-01-27 09:32:36 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Anuj Mittal (3):
  python3: fix CVE-2021-3177
  sudo: fix CVE-2021-23239
  gstreamer1.0: fix failing ptest

Dorinda (2):
  sanity: Verify that user isn't building in PSEUDO_IGNORE_PATHS
  sanity.bbclass: sanity check for if bitbake is present in PATH

Lee Chee Yang (4):
  gdk-pixbuf: fix CVE-2020-29385
  p11-kit: upgrade 0.23.21 -> 0.23.22
  cve-check: replace Looseversion with custom version class
  cve_check: add CVE_VERSION_SUFFIX to indicate suffix in versioning

Oleksiy Obitotskyy (1):
  dtc: improve reproducibility

Ovidiu Panait (1):
  timezone: upgrade to 2021a

Peter Bergin (1):
  buildhistory.bbclass: avoid exception for empty BUILDHISTORY_FEATURES
    variable

Richard Purdie (3):
  gobject-introspection: Fix variable override order
  pseudo: Update to include passwd and file renaming fixes
  image_types: Ensure tar archives are reproducible

Ross Burton (2):
  core-image-sato-sdk-ptest: these images need ptest
  ovmf-shell-image: image is only buildable on x86-64

Tomasz Dziendzielski (5):
  externalsrc: Fix parsing error with devtool non-git sources
  devtool: Fix file:// fetcher symlink directory structure
  externalsrc: Detect code changes in submodules
  lib/oe/patch.py: Don't return command stderr from runcmd function
  python3: Use addtask statement instead of task dependencies

Yi Fan Yu (2):
  oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s
    test_wait_event
  strace: increase ptest timeout duration 120->240s

zhengruoqin (1):
  ca-certificates: upgrade 20200601 -> 20210119

 meta/classes/buildhistory.bbclass             |   2 +-
 meta/classes/cve-check.bbclass                |  14 +-
 meta/classes/externalsrc.bbclass              |  16 +-
 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/sanity.bbclass                   |  12 ++
 meta/lib/oe/cve_check.py                      |  60 ++++++
 meta/lib/oe/patch.py                          |  14 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  36 ++++
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   6 +-
 meta/recipes-core/ovmf/ovmf-shell-image.bb    |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 .../python/python3/CVE-2021-3177.patch        | 191 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.5.bb |   6 +-
 meta/recipes-devtools/strace/strace/run-ptest |   2 +-
 .../sudo/files/CVE-2021-23239.patch           |  62 ++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../gdk-pixbuf/CVE-2020-29385.patch           |  55 +++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   1 +
 .../gobject-introspection_1.64.1.bb           |   4 +-
 meta/recipes-kernel/dtc/dtc.inc               |   2 +
 ...-Makefile-to-add-CFLAGS-not-override.patch |  36 ++++
 ...-use-too-strict-timeout-for-validati.patch |  32 +++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   1 +
 .../images/core-image-sato-ptest-fast.bb      |   3 +
 .../images/core-image-sato-sdk-ptest.bb       |   3 +
 .../0001-certdata2pem.py-use-python3.patch    |  37 ----
 ...0200601.bb => ca-certificates_20210119.bb} |   3 +-
 ...{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} |   7 +-
 scripts/lib/devtool/standard.py               |   6 +-
 30 files changed, 554 insertions(+), 69 deletions(-)
 create mode 100644 meta/lib/oe/cve_check.py
 create mode 100644 meta/lib/oeqa/selftest/cases/cve_check.py
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-3177.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2021-23239.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2020-29385.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20200601.bb => ca-certificates_20210119.bb} (96%)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (75%)

-- 
2.29.2

