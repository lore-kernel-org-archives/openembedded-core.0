Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AEBC377D42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899499; x=1522435499;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+4dYUqB7CQUWgG4dlnIkM+aELhFRE6PxqRHhD2rpDuU=;
	b=vspZSJOkMKeA185aVLpADc23350n4j2e2RTZMZxKeObGrbbajZXvIowv
	xjtyGpg5vDYeRAUo/KdeDOTqbeocMQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:44:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="1113744269"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2017 11:44:58 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id F32832C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:44:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:43 +0300
Message-Id: <cb38a03ebc269f8b743ee0e2b3397dd623253b4c.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/9] oe-selftest: fix incorrect fstype
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
X-List-Received-Date: Thu, 30 Mar 2017 18:44:58 -0000

Fixed typo in wks content: squash->squashfs

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 2401aaa..ff13eb8 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -729,7 +729,7 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
                             'part emptyvfat   --fstype vfat   --size 1M\n',
                             'part emptyext2   --fstype ext2   --size 1M\n',
                             'part emptybtrfs  --fstype btrfs  --size 100M\n',
-                            'part emptysquash --fstype squash --size 1M\n'])
+                            'part emptysquash --fstype squashfs --size 1M\n'])
             wks.flush()
             cmd = "wic create %s -e %s -o %s" % (wks.name, img, self.resultdir)
             self.assertEqual(0, runCmd(cmd).status)
-- 
2.1.4


