Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AD0C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 14:49:01 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.11308.1639666139961838254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 06:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=iaEoTfPJ;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639666139; x=1671202139;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y0NQNIq4YzGy4I3r6ZoGXML6pIkTMo4njPphTdfVijY=;
  b=iaEoTfPJC0pP+04PFB/A3sHBAYFpIYZm9ob4o2JPUsNYMZxK3cx+10u6
   Ll3S96yXS2EdtsRTDMsKjII/TLXI8KbTkydhgtR2e+0l/lWbvCbu4TJ2v
   utKatFr0xgwyIo7YEhsWpsb/CcicJBihihAyigwMYCgW7ds4c2nBSVcd1
   oZMaj2FM/Oie8vBnyPyE+c4UfEfWR37AyTGtuXALXQhaQNhGlw7KboQg0
   EPaK4uuwnSW8rCOYUDVIlur4aaLiG7i8F0hXH93YXZzsShdPzz8fTJU2e
   fHYHGBNmCZJvxFvOJyMZl1446L5bbuBttrSPZcQ0h2MTJZ8HKaTrvmTF2
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239729529"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600";
   d="scan'208";a="239729529"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:48:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600";
   d="scan'208";a="584945862"
Received: from yithonga-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.154])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 06:48:57 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 00/17] Pull request
Date: Thu, 16 Dec 2021 22:48:51 +0800
Message-Id: <cover.1639666024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 14:49:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159789

Please merge these changes.

Thanks,

Anuj

The following changes since commit b8fa0c446ecb3f65d7c134426a07c6244959cdf7:

  libdrm: upgrade 2.4.108 -> 2.4.109 (2021-12-09 09:17:26 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/honister-next

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


