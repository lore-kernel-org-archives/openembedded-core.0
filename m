Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id C38A275D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 21:02:30 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so109026729wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lqPsQ0v6VS+tuI5Tmsz8iww0aThCJER895BYy9xc+Q4=;
	b=CmRzLhoUxMTnEUpaMI7SOMNQ55SnlPgr1Hd7+Ans/71hPl+FWKSL9siAvO6JrHHVQU
	pETbHSq1jMv7JnIB6BWq9sqmkjQksI47t5A/uSLwSkGO3xAsBkmDj1OWt0Q0XWLiZzsu
	Q5m5Tbk4h72xQFo7mbkzi+TJjjKU8qnW+uJtrPIGYPppfiCqpcbg/TlRKyxc7bZqFvRy
	qZX5yuVmHqTlK1oe2X287/O2fQuNzEVAjmhG+Cil7i6hoZCj/yQuMwbWyfGgvGIqcE04
	GSYxiI8IoIWfauer+YUoiR39SiCdBs1uDERNW3RS7JGd4+gxue++UpgYeD3H94PtWuEb
	0haA==
X-Gm-Message-State: ALoCoQkSkamaVFStjLOm2657whZxmM2WCZ+Sa+D7vSwsYz3rkJVLJsnuU6/Jkk3tODryoXAkpmGX
X-Received: by 10.194.205.162 with SMTP id lh2mr12785754wjc.61.1445461350440; 
	Wed, 21 Oct 2015 14:02:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	jt3sm2347046wjc.12.2015.10.21.14.02.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Oct 2015 14:02:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2015 21:54:51 +0100
Message-Id: <cover.1445460650.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/23][jethro] Selftest and other fixes
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
X-List-Received-Date: Wed, 21 Oct 2015 21:02:31 -0000

Hi,

A series of patches that mainly fix various sanity and selftest failures on
the autobuilder, and a few 2.0-targetted bugs.

Ross

The following changes since commit 8578bc17b54da97d42b257b3c8f398ac52b91a9f:

  libc-package: Fix localedef multilib dependency issues (2015-10-20 10:12:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/jut

for you to fetch changes up to 9e63faaa752251b45a986e0de797ba8aa806b601:

  oeqa/selftest: improve config writing and cleanup (2015-10-21 21:25:22 +0100)

----------------------------------------------------------------
Alejandro Hernandez (1):
      archiver.bbclass: Fixes and improves archiver class for kernel and gcc packages

Alex Franco (1):
      sanity.bbclass: expand warning when chmod fails

Benjamin Esquivel (2):
      populate SDK: prepare calling of bb.utils for exceptions
      oeqa/selftest/manifest.py: Test support for manifests

Chen Qi (2):
      openssh: fix file permission for /etc/pam.d/sshd
      sudo: fix file permission for /etc/pam.d/sudo

Daniel Istrate (2):
      oeqa/selftest/bbtests: Updated bitbake TCs
      oeqa/selftest/wic: corrected testcase decorator for test18_iso_image

Leonardo Sandoval (3):
      oeqa/utils/ftools: Ignore the exception if file does not exist
      oeqa/utils/ftools: From functions that expect data, check if None
      oeqa/selftest/buildoptions: Use the correct script for cleaning the workdir

Mark Hatle (1):
      gcc-5.2: Fix various _FOR_BUILD and related variables

Matt Madison (1):
      i2c-tools: fix inverted RDEPENDS

Paul Eggleton (1):
      devtool: handle virtual providers

Peter Kjellerstedt (1):
      useradd_base.bbclass: Do not warn without a reason

Ross Burton (8):
      rpm: remove spurious build dependencies
      qemu: disable Valgrind
      oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
      oeqa/selftest: verify that devtool can use plugins in other layers
      oeqa/selftest/wic: fix cleaning
      oeqa/selftest/wic: remove numbers from test names
      oeqa/selftest: clean up selftest.inc in teardown
      oeqa/selftest: improve config writing and cleanup

 meta-selftest/lib/devtool/__init__.py              |   0
 meta-selftest/lib/devtool/test.py                  |  11 ++
 meta/classes/archiver.bbclass                      |  27 +++-
 meta/classes/sanity.bbclass                        |   4 +-
 meta/classes/useradd_base.bbclass                  |   6 +-
 meta/lib/oe/recipeutils.py                         |   6 +-
 meta/lib/oe/sdk.py                                 |  76 +++++++---
 meta/lib/oeqa/selftest/base.py                     |   2 +-
 meta/lib/oeqa/selftest/bbtests.py                  |  60 +++++---
 meta/lib/oeqa/selftest/buildoptions.py             |   8 +-
 meta/lib/oeqa/selftest/devtool.py                  |  44 ++++++
 meta/lib/oeqa/selftest/imagefeatures.py            |  16 +-
 meta/lib/oeqa/selftest/manifest.py                 | 163 +++++++++++++++++++++
 meta/lib/oeqa/selftest/wic.py                      |  67 ++++-----
 meta/lib/oeqa/utils/ftools.py                      |  20 ++-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   2 +-
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
 .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123 ++++++++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb |   3 +-
 meta/recipes-devtools/qemu/qemu/no-valgrind.patch  |  19 +++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   1 +
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |   2 +-
 scripts/lib/devtool/standard.py                    |  24 ++-
 scripts/lib/devtool/upgrade.py                     |  12 +-
 25 files changed, 578 insertions(+), 121 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/__init__.py
 create mode 100644 meta-selftest/lib/devtool/test.py
 create mode 100644 meta/lib/oeqa/selftest/manifest.py
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch

Alejandro Hernandez (1):
  archiver.bbclass: Fixes and improves archiver class for kernel and gcc
    packages

Alex Franco (1):
  sanity.bbclass: expand warning when chmod fails

Benjamin Esquivel (2):
  populate SDK: prepare calling of bb.utils for exceptions
  oeqa/selftest/manifest.py: Test support for manifests

Chen Qi (2):
  openssh: fix file permission for /etc/pam.d/sshd
  sudo: fix file permission for /etc/pam.d/sudo

Daniel Istrate (2):
  oeqa/selftest/bbtests: Updated bitbake TCs
  oeqa/selftest/wic: corrected testcase decorator for test18_iso_image

Leonardo Sandoval (3):
  oeqa/utils/ftools: Ignore the exception if file does not exist
  oeqa/utils/ftools: From functions that expect data, check if None
  oeqa/selftest/buildoptions: Use the correct script for cleaning the
    workdir

Mark Hatle (1):
  gcc-5.2: Fix various _FOR_BUILD and related variables

Matt Madison (1):
  i2c-tools: fix inverted RDEPENDS

Paul Eggleton (1):
  devtool: handle virtual providers

Peter Kjellerstedt (1):
  useradd_base.bbclass: Do not warn without a reason

Ross Burton (8):
  rpm: remove spurious build dependencies
  qemu: disable Valgrind
  oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
  oeqa/selftest: verify that devtool can use plugins in other layers
  oeqa/selftest/wic: fix cleaning
  oeqa/selftest/wic: remove numbers from test names
  oeqa/selftest: clean up selftest.inc in teardown
  oeqa/selftest: improve config writing and cleanup

 meta-selftest/lib/devtool/__init__.py              |   0
 meta-selftest/lib/devtool/test.py                  |  11 ++
 meta/classes/archiver.bbclass                      |  27 +++-
 meta/classes/sanity.bbclass                        |   4 +-
 meta/classes/useradd_base.bbclass                  |   6 +-
 meta/lib/oe/recipeutils.py                         |   6 +-
 meta/lib/oe/sdk.py                                 |  76 +++++++---
 meta/lib/oeqa/selftest/base.py                     |   2 +-
 meta/lib/oeqa/selftest/bbtests.py                  |  60 +++++---
 meta/lib/oeqa/selftest/buildoptions.py             |   8 +-
 meta/lib/oeqa/selftest/devtool.py                  |  44 ++++++
 meta/lib/oeqa/selftest/imagefeatures.py            |  16 +-
 meta/lib/oeqa/selftest/manifest.py                 | 163 +++++++++++++++++++++
 meta/lib/oeqa/selftest/wic.py                      |  67 ++++-----
 meta/lib/oeqa/utils/ftools.py                      |  20 ++-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   2 +-
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
 .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123 ++++++++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb |   3 +-
 meta/recipes-devtools/qemu/qemu/no-valgrind.patch  |  19 +++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   1 +
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |   2 +-
 scripts/lib/devtool/standard.py                    |  24 ++-
 scripts/lib/devtool/upgrade.py                     |  12 +-
 25 files changed, 578 insertions(+), 121 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/__init__.py
 create mode 100644 meta-selftest/lib/devtool/test.py
 create mode 100644 meta/lib/oeqa/selftest/manifest.py
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch

-- 
2.1.4


