Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CA3AF77D5B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899520; x=1522435520;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IF3YB3Wosnujv6yyHwjI0rFHKg1oFBYTsPAZfWnGARY=;
	b=iXmgr/uYBrbAczFIrT+3lD/73pQcJOFoQ4Hp2lwfxvAPCMKgDLIX4UKF
	6eqoUR7ZT9j+s+iBnDeP8Z+6lvHJkw==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="71997775"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 30 Mar 2017 11:45:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BE7E12C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:49 +0300
Message-Id: <260b1c7e9d4fb3c5382b1dd006078e971051f0c5.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/9] wic: fix list of supported fstypes in help content
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:19 -0000

Added vfat and msdos to the list of supported fstypes in
'wic help kickstart' output.

[YOCTO #11137]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/help.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 148da89..aee2451 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -687,6 +687,8 @@ DESCRIPTION
            apply to partitions created using '--source rootfs' (see
            --source above).  Valid values are:
 
+             vfat
+             msdos
              ext2
              ext3
              ext4
-- 
2.1.4


