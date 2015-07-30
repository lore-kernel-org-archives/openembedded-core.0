Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BAA0E76312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:31:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 06:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758407655"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 06:31:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 16:31:53 +0300
Message-Id: <0cbe48eac5513c9010a172aeea72c5c5d94f9fdf.1438262915.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/26] distrodata.bbclass: do not skip -native recipes in checkpkg task
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
X-List-Received-Date: Thu, 30 Jul 2015 13:31:41 -0000

Some recipes are available only in the -native flavour, and we need to
check their upstream version too from the command line.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distrodata.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index a228242..af3af33 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -218,9 +218,6 @@ python checkpkg_eventhandler() {
                     header = row
                     continue
 
-                if '-native' in pn or 'nativesdk-' in pn:
-                    continue
-
                 if not pn in package_dict.keys():
                     package_dict[pn] = row
             f.close()
-- 
2.1.4


