Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C63678274
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 15:54:36 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id v190so12106533pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=WDc3BDlS3vj1AooMcYvqoVtjfnnZOIsHR2qjkaEZiVQ=;
	b=No+BtdFHJzOXwzEuxhLBJfRZCofN6ibDAtJrAoS32F4aSeqW0AolS1KhYGvSAvidrQ
	ECSjL5vCJESAJZS0jBbhdZ7r1eLkqkjP7iELoFe8ZUATiqcGBaq3G/u6D2Yyp5MDMS6e
	6Nc6AFrERIybI+5qHMU5qyq5s/f3wm2u+pB0UCudsOWlchUYZDtxqwo+aJGSXJ0wCEBy
	e3gucXpyPeiHyaHOlIYTXTqzeC4ko5z9VlaMDyCSrD0bHv7VSoEXp/kVIZd7CSFH4bqM
	7bqGrUHNA8Na+FDD7xd2I8vcwEPag0atgNzD2T6HOROMbnAwFt4FWcY9Ci7aRDrSovdi
	Aqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WDc3BDlS3vj1AooMcYvqoVtjfnnZOIsHR2qjkaEZiVQ=;
	b=KHh4ZnLLDmD+ezufxNcMTqRQtAUs6+8Qux3fOp+lPqcQG2Lym+odomHRYVGA7uMI/5
	7HoiY+3GWJK2aTd3JYbVT/N5m37gztfYGYxazXj4OM7hIkLat9r82UPr1A+6KdbH9gbT
	TQbBRO5pPSW75pAijftYjQEyGvI8eBcj5UNI9EhSSwmgaGlb9ww+H96HMeBrmM1Alz3e
	setcgiG5dfHQIAahtQe0Q1v/IH61/AcmBBdYBr3KZfHJvDYkwGlrtskgvSs7tt/gh6be
	4USwF233+SLtNT3Texs9SY+E9VbRZYr7gOb/oyUfjaS7gT2qDwQ+uSLUMcHeQ7NH+Rup
	Kglg==
X-Gm-Message-State: AIVw110X59CcOHmnWOIXwWzQHOekMYcgDorxAy2LR8/Y7oLMzu6P2KQx
	9StKZ6X7DSRZsA==
X-Received: by 10.99.54.9 with SMTP id d9mr16736909pga.195.1500911677466;
	Mon, 24 Jul 2017 08:54:37 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:85f3:6660:3ca9:66b5])
	by smtp.gmail.com with ESMTPSA id e24sm3647pfk.180.2017.07.24.08.54.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Jul 2017 08:54:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 08:54:33 -0700
Message-Id: <cover.1500910727.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/49] Pyro-next pull request
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
X-List-Received-Date: Mon, 24 Jul 2017 15:54:36 -0000

Please consider these changes for the next Pyro merge.

Clean AB build ( thanks Ross).

Includes kernel updates, security fixes and misc bug fixes.


The following changes since commit 5686f4e1fe5229705b8c7d35895aa03827796d13:

  tcf-agent: kill with USR2 in systemd stop (2017-07-20 11:00:23 +0100)

are available in the git repository at:

  http://git.yoctoproject.org/git/poky-contrib akuster/pyro-next
  http://git.yoctoproject.org/cgit.cgi//log/?h=akuster/pyro-next

Alexander Kanavin (1):
  package_manager.py: set dnf's releasever setting from DISTRO_CODENAME

Andrej Valek (6):
  libxml2: Disable LeakSanitizer when running API tests
  libxml2: Avoid reparsing and simplify control flow in
    xmlParseStartTag2
  libxml2: Fix CVE-2017-9047 and CVE-2017-9048
  libxml2: Fix CVE-2017-9049 and CVE-2017-9050
  libxml2: Fix CVE-2017-5969
  libxml2: Fix CVE-2017-0663

Bruce Ashfield (16):
  kernel-yocto: propagate configuration errors to bbclass
  linux-yocto/4.10: update to v4.10.15
  linux-yocto/4.4: update to v4.4.67
  linux-yocto/4.9: update to v4.9.27
  linux-yocto/4.1: fix gcc7 compilation and v4.1.39
  linux-yocto/meta: bluetooth: Adds BT_BREDR and BT_LE, which are needed
    as dependencies
  linux-yocto/meta: smp: Add config X86_BIGSMP since its needed when
    NR_CPUS > 8
  kernel/meta: add virtualbox configuration fragment
  linux-yocto/meta: configuration changes (wifi, kexec and nft)
  linux-yocto-rt: 4.9-rt18
  linux-yocto/4.10: update to v4.10.17
  linux-yocto/4.9: update to 4.9.31
  linux-yocto/4.4: update to v4.4.71
  kernel-yocto/meta: smp configuration changes
  linux-yocto/4.4: update to v4.4.76
  linux-yocto/4.9: update to v4.9.36

Chen Qi (1):
  systemd: workaround login failure on qemumips64 when 'pam' is enabled

David Reyna (6):
  bitbake: toaster: add ID's to navigation links
  bitbake: toaster: add ID's to build menu links
  bitbake: toaster: fail on layers with sub-layer
  bitbake: toaster: add getMessage to MockEvent
  bitbake: toaster: get_last_build_id not called correctly
  bitbake: toaster: noweb should init database

Enrico Scholz (1):
  tzcode-native: quote ${CC}

Jan Kiszka (1):
  tzdata: Install zone1970.tab

Khem Raj (2):
  zlib: Pass pre-calculate uname enable re-entrant flags
  iptables: Apply 0001-fix-build-with-musl.patch unconditionally

Martin Kelly (1):
  qemuboot.conf: make cpus match built artifacts

Patrick Ohly (6):
  yocto-compat-layer.py: avoid adding layers more than once
  yocto-compat-layer.py: tolerate broken world builds during signature
    diff
  yocto-compat-layer.py: apply test_signatures to all layers
  yocto-compat-layer.py: add test_world
  yocto-compat-layer.py: allow README with suffix
  yocto-compat-layer.py: make signature check code reusable

Paul Eggleton (2):
  classes/buildhistory: fix failures collecting output signatures
  classes/staging: change fixme debug message from note to debug

Peter Kjellerstedt (3):
  linux-firmware: Avoid a dependency on python-core
  texi2html: Add a dependency on perl
  git: Add a dependency on perl for gitweb

Ross Burton (2):
  libpcap: apply fix from upstream to fix build race
  systemd: refuse to load units with errors (CVE-2017-1000082)

Stanley Cheong Kwan, Phoong (1):
  recipetool: git reformat URI mangling & parameter stripped

 bitbake/bin/toaster                                |  50 +-
 bitbake/lib/bb/ui/buildinfohelper.py               |  17 +-
 bitbake/lib/toaster/orm/models.py                  |  12 +-
 bitbake/lib/toaster/toastergui/templates/base.html |   8 +-
 .../toastergui/templates/basebuildpage.html        |  20 +-
 meta/classes/buildhistory.bbclass                  |  14 +-
 meta/classes/kernel-yocto.bbclass                  |   3 +-
 meta/classes/staging.bbclass                       |   2 +-
 meta/conf/machine/include/qemuboot-x86.inc         |   6 +-
 meta/lib/oe/package_manager.py                     |   8 +-
 .../libpcap/libpcap/fix-grammar-deps.patch         |  29 +
 meta/recipes-connectivity/libpcap/libpcap_1.8.1.bb |   1 +
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 ++
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 +++
 .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ++++
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ++++++++++
 ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2/runtest.patch     |  25 +-
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   5 +
 ...ragment-refuse-units-with-errors-in-certa.patch | 329 ++++++++++++
 meta/recipes-core/systemd/systemd_232.bb           |   4 +
 meta/recipes-core/zlib/zlib_1.2.11.bb              |  12 +-
 meta/recipes-devtools/git/git.inc                  |   2 +-
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |   4 +-
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +
 .../recipes-extended/tzcode/tzcode-native_2017b.bb |   2 +-
 meta/recipes-extended/tzdata/tzdata_2017b.bb       |   2 +
 .../linux-firmware/linux-firmware_git.bb           |   3 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb    |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |  20 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb       |  20 +-
 scripts/lib/compatlayer/__init__.py                |  90 +++-
 scripts/lib/compatlayer/cases/common.py            |  92 +---
 scripts/lib/compatlayer/context.py                 |   3 +-
 scripts/lib/recipetool/create.py                   |  35 +-
 scripts/yocto-compat-layer.py                      |  12 +-
 45 files changed, 1801 insertions(+), 205 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/fix-grammar-deps.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-core-load-fragment-refuse-units-with-errors-in-certa.patch

-- 
2.7.4


