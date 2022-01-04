Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7D5C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 06:21:16 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.3256.1641277274471486504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 22:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=nFnc02E4;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641277274; x=1672813274;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UVWiNIpe8h/WJBoo53nzmDCvrmjv+XyBb05rjJdkRSU=;
  b=nFnc02E4yOXp+gsyuQ6LAfJRfRZxyWPymZ7Jp7gYhreW5AdVPCugCmbH
   7IlRaoXAHN99KZBMN5/O8J0glH0iKJPwaHhplJUnOS3RJyc+9Mtn6wbl8
   +4Vyn9eXwvO5Q9xak2y6DZ+QmSkPnAATktu/qDOxdhYLr9rIYm5/58wod
   WjFC8JE2uhjz0Tg3IBsbNkNiTFONQGUawE6h1Lgnn/JTDJzJoPiCek4Vu
   Uv06AKuTMvDLIzY08vfElkBGSJhOoEjg8I5xEbhZK2Yowj4Oztbmfuu2H
   7hi+VUV0pukZgQ30rs0zJ6pzJ+U1IZsesGCiRNH2LUJOzV1OONwL/XODT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242122158"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600";
   d="scan'208";a="242122158"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 22:21:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600";
   d="scan'208";a="620537409"
Received: from asaninud-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.130.119])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 22:21:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Subject: [honister][PATCH 00/11] Pull request
Date: Tue,  4 Jan 2022 14:21:05 +0800
Message-Id: <cover.1641277164.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 06:21:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160155

Please merge these changes.

Thanks,

Anuj

The following changes since commit 067fbe5e12a81225cf3ff436837af6a6d23040a6:

  license.bbclass: implement ast.NodeVisitor.visit_Constant (2021-12-13 12:19:03 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Anuj Mittal (1):
  xserver-xorg: upgrade 1.20.13 -> 1.20.14

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.84
  linux-yocto/5.10: update to v5.10.85
  linux-yocto/5.10: update to v5.10.87

Chaitanya Vadrevu (1):
  python3-pyelftools: Depend on debugger, pprint

Florian Amstutz (1):
  systemd: Fix systemd-journal-gateway user/groups

Pgowda (1):
  gcc: Fix CVE-2021-35465

Richard Purdie (1):
  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU

pgowda (2):
  gcc: Fix CVE-2021-42574
  binutils: CVE-2021-42574

wangmy (1):
  linux-firmware: upgrade 20211027 -> 20211216

 meta/lib/oeqa/selftest/cases/bbtests.py       |    2 +-
 meta/recipes-core/systemd/systemd_249.7.bb    |    4 +-
 .../binutils/binutils-2.37.inc                |    1 +
 .../binutils/0001-CVE-2021-42574.patch        | 2001 +++++++++++++++
 meta/recipes-devtools/gcc/gcc-11.2.inc        |    8 +
 .../gcc/gcc/0001-CVE-2021-35465.patch         |  138 +
 .../gcc/gcc/0001-CVE-2021-42574.patch         | 2282 +++++++++++++++++
 .../gcc/gcc/0002-CVE-2021-35465.patch         |   39 +
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 1765 +++++++++++++
 .../gcc/gcc/0003-CVE-2021-35465.patch         |  103 +
 .../gcc/gcc/0003-CVE-2021-42574.patch         |  142 +
 .../gcc/gcc/0004-CVE-2021-35465.patch         |  304 +++
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  573 +++++
 .../python/python3-pyelftools_0.27.bb         |    2 +
 ...org_1.20.13.bb => xserver-xorg_1.20.14.bb} |    2 +-
 ...20211027.bb => linux-firmware_20211216.bb} |    4 +-
 .../linux/linux-yocto-rt_5.10.bb              |    6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |   24 +-
 19 files changed, 7383 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-42574.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_1.20.14.bb} (93%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

-- 
2.33.1


