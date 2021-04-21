Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.8354.1618985193618980255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: JCcuRHnA22ca9vP+uhCuNq53qOwqg2vl2rB8GSGMea93yG8pvFrBJNR+WKAQcIryhkqgVgddUg
 RK+5KUo75aQA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671486"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671486"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:32 -0700
IronPort-SDR: XA1VryRRqSl6nENjErC8jFtOM00k5nf0GHFHeFNIBnE4P4qqOp0XREkBUrNVzO2HpXeW2UfD8O
 KMEfFzUg+MHA==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684397"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/8] review request
Date: Wed, 21 Apr 2021 14:06:12 +0800
Message-Id: <cover.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. These build
cleanly on autobuilder except two intermittent and unrelated failures.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2058

Thanks,

Anuj

The following changes since commit d1283b74cc29d1cbcab56bf1075a244ea5082025:

  image-live.bbclass: optional depends when ROOTFS empty (2021-04-09 14:04:40 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Chen Qi (1):
  busybox: fix CVE-2021-28831

Douglas Royds (1):
  externalsrc: Detect code changes in submodules

Peter Budny (1):
  lib/oe/terminal: Fix tmux new-session on older tmux versions (<1.9)

Richard Purdie (3):
  pseudo: Upgrade to add trailing slashes ignore path fix
  oeqa/selftest: Hardcode test assumptions about heartbeat event timings
  sanity: Add error check for '%' in build path

Ross Burton (1):
  insane: clean up some more warning messages

Stefan Ghinea (1):
  wpa-supplicant: fix CVE-2021-30004

 meta/classes/externalsrc.bbclass              |  11 +-
 meta/classes/insane.bbclass                   |  12 +-
 meta/classes/sanity.bbclass                   |   2 +
 meta/lib/oe/terminal.py                       |  16 ++-
 meta/lib/oeqa/selftest/cases/buildoptions.py  |   6 +-
 .../wpa-supplicant/CVE-2021-30004.patch       | 123 ++++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.9.bb      |   1 +
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch |  58 +++++++++
 meta/recipes-core/busybox/busybox_1.32.0.bb   |   3 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 10 files changed, 215 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2021-30004.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

-- 
2.30.2

