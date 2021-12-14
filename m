Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2B4C433FE
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:04 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=XZbDKMOG;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444861; x=1670980861;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c2YV9Ac7MjuarGVMIRofy6G2UGWNIF/Yc2cdQWFZUKc=;
  b=XZbDKMOGxsPXSdl7OGdy8Wu6DqND1j5aSvOB2Q5/bmTDziIWlqsBEA/p
   qTLBGZV6h7TtiVDhJ3qCHc8Xz6amurdGPFiFgwkZMMqLufervjOBmwSoB
   d+EDIJxNYvvOhoIKs9Zy94gh3us/Sv41K8/1fYVxuajaqcL7hBn1I4ktP
   qBAptVD+zUxiAvXYTEN5yEamqi+Zo9ECDm/spWepV82QknjSagYTNB6cI
   3fbBeDIyJZPYUdhmTHJJ3lgF60W2abzbqk/2jZqZ31mBNxFb7nJn/EQMW
   FbgJ4Rj7FuSUokLR8AXX+QjA+ktkfICdKMd18hY+6HWPgnh16NO80PYp/
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682461"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682461"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869120"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:20:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/17] Review request
Date: Tue, 14 Dec 2021 09:20:35 +0800
Message-Id: <cover.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159662

Please review these changes for honister. No issues seen while testing
on autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3027

Thanks,

Anuj

The following changes since commit b8fa0c446ecb3f65d7c134426a07c6244959cdf7:

  libdrm: upgrade 2.4.108 -> 2.4.109 (2021-12-09 09:17:26 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Anuj Mittal (1):
  python3: upgrade 3.9.7 -> 3.9.9

Bruce Ashfield (4):
  linux-yocto/5.14: update to v5.14.21
  linux-yocto/5.10: update to v5.10.82
  linux-yocto-rt/5.10: update to -rt56
  kern-tools: bug fixes and kgit-gconfig

Changqing Li (1):
  openssh: fix CVE-2021-41617

Mingli Yu (3):
  ncurses: fix CVE-2021-39537
  bind: fix CVE-2021-25219
  packagedata.py: silence a DeprecationWarning

Richard Purdie (1):
  gcc: Add CVE-2021-37322 to the list of CVEs to ignore

Ross Burton (3):
  runqemu: check the qemu PID has been set before kill()ing it
  oe/license: implement ast.NodeVisitor.visit_Constant
  license.bbclass: implement ast.NodeVisitor.visit_Constant

Stefan Herbrechtsmeier (2):
  recipetool: Set master branch only as fallback
  selftest/devtool: Check branch in git fetch

Steve Sakoman (1):
  cve-extra-exclusions: add db CVEs to exclusion list

Thomas Perrot (1):
  uboot-sign: fix the concatenation when multiple U-BOOT configurations
    are specified

 meta/classes/license.bbclass                  |  4 +
 meta/classes/uboot-sign.bbclass               | 16 +++-
 .../distro/include/cve-extra-exclusions.inc   |  9 ++-
 meta/lib/oe/license.py                        |  6 ++
 meta/lib/oe/packagedata.py                    |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |  5 +-
 .../bind/bind-9.16.20/CVE-2021-25219-1.patch  | 76 +++++++++++++++++++
 .../bind/bind-9.16.20/CVE-2021-25219-2.patch  | 65 ++++++++++++++++
 .../recipes-connectivity/bind/bind_9.16.20.bb |  2 +
 .../openssh/openssh/CVE-2021-41617.patch      | 48 ++++++++++++
 .../openssh/openssh_8.7p1.bb                  |  1 +
 .../ncurses/files/CVE-2021-39537.patch        | 65 ++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.2.bb      |  1 +
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  3 +
 ...-detection-of-mips-architecture-for-.patch | 20 +++--
 .../{python3_3.9.7.bb => python3_3.9.9.bb}    |  2 +-
 .../kern-tools/kern-tools-native_git.bb       |  5 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.14.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++----
 scripts/lib/recipetool/create.py              | 15 ++--
 scripts/runqemu                               |  3 +-
 25 files changed, 358 insertions(+), 68 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.20/CVE-2021-25219-1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind-9.16.20/CVE-2021-25219-2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2021-39537.patch
 rename meta/recipes-devtools/python/{python3_3.9.7.bb => python3_3.9.9.bb} (99%)

-- 
2.33.1


