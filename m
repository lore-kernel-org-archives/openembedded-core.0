Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 95CB571B34
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:13:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 01 Dec 2016 08:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,282,1477983600"; d="scan'208";a="1076167509"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.75])
	by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2016 08:13:02 -0800
From: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 10:14:20 -0600
Message-Id: <20161201161420.7019-1-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] AUH: status email indicates the URL of the log folder
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
X-List-Received-Date: Thu, 01 Dec 2016 16:13:02 -0000

Upgrade status email should indicate the URL of the log folder instead of the tar URL

[YOCTO #10670]

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 upgradehelper.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/upgradehelper.py b/upgradehelper.py
index 239fd88..3954e1f 100755
--- a/upgradehelper.py
+++ b/upgradehelper.py
@@ -616,7 +616,7 @@ class Updater(object):
                     publish_work_url = ''
 
             statistics_summary = self.statistics.get_summary(
-                    publish_work_url, os.path.basename(work_tarball))
+                    publish_work_url, self.uh_work_dir)
 
             statistics_file = os.path.join(self.uh_work_dir,
                     "statistics_summary")
-- 
2.9.3


