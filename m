Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E603CC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 06:37:18 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.37444.1639550237801034771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 22:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=hRLem8fO;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639550237; x=1671086237;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=npMdZAOmcXJVsdefQgjjVJsn02jRoU+mObCPJju6sFE=;
  b=hRLem8fOQw7fheC0m3M9mowcqmFF2of3uCQ2Vx4BpZJhSLlpnGJOx/7v
   2JrkUjiiHQf+yVV5DnipECQ/f17ZxojssSdq1RJUHOEl++o2nRrIx9Qk5
   o/4MN58hLZ/vX+6jG99L7FzYhlPQ7jtBEZbp2NHx/RkazRwNC3h6ZMYLM
   efDXfKxSB4C8e1efCALIQWfircpdBwbQElVWhRcZCyqAC8DiPhslyjkCQ
   /gsKAVV37JH+xEkgZjeOmLZq5l7tikFG/QYR6H1TtFrXlstYe7ezMJewX
   CHzX2u+Wy/YftOGwlFk/vUi+UZ3zbGIP3hLC0PVDtiGOKjZH2G9OQYhif
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="239111979"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600";
   d="scan'208";a="239111979"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 22:37:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600";
   d="scan'208";a="519627145"
Received: from annleyli-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.136.33])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2021 22:37:08 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/20] Pull request
Date: Wed, 15 Dec 2021 14:37:03 +0800
Message-Id: <cover.1639550110.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 06:37:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159712

Please merge these changes.

Thanks,

Anuj

The following changes since commit d748ebb61d4dd355265f4a78790b4c30c3ec1a61:

  cups: Fix missing installation of cups sysv init scripts (2021-11-29 13:07:24 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alexander Kanavin (1):
  libpcre/libpcre2: correct SRC_URI

Anuj Mittal (1):
  python3: upgrade 3.9.7 -> 3.9.9

Bruce Ashfield (2):
  linux-yocto/5.10: update to v5.10.82
  linux-yocto-rt/5.10: update to -rt56

Chen Qi (1):
  patchelf: fix PT_PHDR program header corruption

Dhruva Gole (1):
  scripts/checklayer/common.py: Fixed a minor grammatical error

Pavel Zhukov (1):
  patch.py: Initialize git repo before patching

Quentin Schulz (1):
  README.OE-Core.md: update URLs

Richard Purdie (3):
  buildhistory: Fix srcrevs output
  oeqa/parselogs: Fix quoting
  gcc: Add CVE-2021-37322 to the list of CVEs to ignore

Ross Burton (3):
  recipetool: handle GitLab URLs like we do GitHub
  recipetool: extend curl detection when creating recipes
  runqemu: check the qemu PID has been set before kill()ing it

Schmidt, Adriaan (1):
  wic: support rootdev identified by partition label

Stefan Herbrechtsmeier (2):
  recipetool: Set master branch only as fallback
  selftest/devtool: Check branch in git fetch

Steve Sakoman (1):
  cve-extra-exclusions: add db CVEs to exclusion list

Thomas Perrot (1):
  uboot-sign: fix the concatenation when multiple U-BOOT configurations
    are specified

Vyacheslav Yurkov (1):
  rootfs-postcommands: update systemd_create_users

 README.OE-Core                                | 10 ++--
 meta/classes/buildhistory.bbclass             | 30 +++++-------
 meta/classes/rootfs-postcommands.bbclass      |  2 +-
 meta/classes/uboot-sign.bbclass               | 16 ++++++-
 .../distro/include/cve-extra-exclusions.inc   |  9 ++++
 meta/lib/oe/patch.py                          | 16 ++++++-
 meta/lib/oeqa/runtime/cases/parselogs.py      | 14 +++---
 meta/lib/oeqa/selftest/cases/bbtests.py       | 15 ++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |  5 +-
 meta/recipes-devtools/gcc/gcc-10.2.inc        |  3 ++
 .../patchelf/0001-merge-from-PR243.patch      | 47 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 ...-detection-of-mips-architecture-for-.patch | 20 ++++----
 .../{python3_3.9.7.bb => python3_3.9.9.bb}    |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 +--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++-----
 .../recipes-support/libpcre/libpcre2_10.36.bb |  4 +-
 meta/recipes-support/libpcre/libpcre_8.44.bb  |  2 +-
 scripts/lib/checklayer/cases/common.py        |  2 +-
 scripts/lib/recipetool/create.py              | 17 ++++---
 scripts/lib/recipetool/create_buildsys.py     |  3 +-
 scripts/lib/wic/plugins/imager/direct.py      |  2 +
 scripts/runqemu                               |  3 +-
 24 files changed, 182 insertions(+), 79 deletions(-)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/0001-merge-from-PR243.patch
 rename meta/recipes-devtools/python/{python3_3.9.7.bb => python3_3.9.9.bb} (99%)

-- 
2.33.1


