Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 85BA07716D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 07:17:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 31 May 2016 00:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,394,1459839600"; d="scan'208";a="711426645"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 31 May 2016 00:17:27 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 10:17:20 +0300
Message-Id: <1464679040-17659-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] distro_check.py: Don't mix tabs and spaces
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
X-List-Received-Date: Tue, 31 May 2016 07:17:28 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This is needed by python3, applies to both master and python3 branches.


 meta/lib/oe/distro_check.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 8655a6f..3d4a59b 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -357,8 +357,8 @@ def compare_in_distro_packages_list(distro_check_dir, d):
 
     
     if tmp != None:
-	list = tmp.split(' ')
-	for item in list:
+        list = tmp.split(' ')
+        for item in list:
             matching_distros.append(item)
     bb.note("Matching: %s" % matching_distros)
     return matching_distros
-- 
2.1.4


