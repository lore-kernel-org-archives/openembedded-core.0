Return-Path: <henry.bruce@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1D87376E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 22:11:47 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 06 Sep 2016 15:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,293,1470726000"; 
   d="scan'208";a="5709794"
Received: from hbruce-desk3.jf.intel.com ([10.7.198.61])
	by orsmga004.jf.intel.com with ESMTP; 06 Sep 2016 15:11:47 -0700
From: Henry Bruce <henry.bruce@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 15:11:44 -0700
Message-Id: <1473199905-13645-1-git-send-email-henry.bruce@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] utils.bbclass: Remove trailing whitespace
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
X-List-Received-Date: Tue, 06 Sep 2016 22:11:49 -0000

Signed-off-by: Henry Bruce <henry.bruce@intel.com>
---
 meta/classes/utils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 59ace44..d56f51e 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -249,7 +249,7 @@ oe_machinstall() {
 create_cmdline_wrapper () {
 	# Create a wrapper script where commandline options are needed
 	#
-	# These are useful to work around relocation issues, by passing extra options 
+	# These are useful to work around relocation issues, by passing extra options
 	# to a program
 	#
 	# Usage: create_cmdline_wrapper FILENAME <extra-options>
@@ -323,7 +323,7 @@ def base_set_filespath(path, d):
     overrides.reverse()
     for o in overrides:
         for p in path:
-            if p != "": 
+            if p != "":
                 filespath.append(os.path.join(p, o))
     return ":".join(filespath)
 
-- 
2.7.4


