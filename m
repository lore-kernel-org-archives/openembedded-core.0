Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.17776.1630897607158377309
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 20:06:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219925640"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219925640"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="522846471"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.236.127])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:43 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 0/4] Patch review request
Date: Mon,  6 Sep 2021 11:06:20 +0800
Message-Id: <cover.1630897275.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gatesgarth isn't maintained anymore but it was pointed out that it's
missing an important fix. I tested it along with a few others and
didn't see any issue.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2536

Thanks,

Anuj

The following changes since commit d47b7cdc3508343349f3bb3eacb2dc3227dd94d2:

  build-appliance-image: Update to gatesgarth head revision (2021-05-06 11:20:38 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

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

