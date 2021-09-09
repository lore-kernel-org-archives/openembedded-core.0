Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.1682.1631150945211820296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 18:29:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="200845384"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="200845384"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:29:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="449675410"
Received: from mshovon-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.138.179])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:29:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/4] Pull request (cover letter only)
Date: Thu,  9 Sep 2021 09:28:59 +0800
Message-Id: <cover.1631150868.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit d47b7cdc3508343349f3bb3eacb2dc3227dd94d2:

  build-appliance-image: Update to gatesgarth head revision (2021-05-06 11:20:38 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Anatol Belski (1):
  tar: Fix CVE-2021-20193

Richard Purdie (3):
  lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for
    intercepts
  kernel: Fix interaction when packaging disabled
  kernel-devicetree: Fix interaction when packaging disabled

 meta/classes/kernel-devicetree.bbclass        |  11 +-
 meta/classes/kernel.bbclass                   |   2 +
 meta/lib/oe/package_manager/__init__.py       |   2 +-
 .../tar/tar/CVE-2021-20193.patch              | 133 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.32.bb         |   1 +
 5 files changed, 144 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2021-20193.patch

-- 
2.31.1

