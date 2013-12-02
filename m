Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 289516DEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:51:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:51:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490206"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:50:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:47 +0000
Message-Id: <a6e5b02e09bf3a3f4077e5384bef1812d7e37224.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/8] classes/buildhistory: drop cruft from old SRCREV tracking implementation
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
X-List-Received-Date: Mon, 02 Dec 2013 18:51:00 -0000

This should have been removed when the implementation was rewritten in
OE-Core commit 2179db89436d719635f858c87d1e098696bead2a. The collected
values weren't being used anywhere since then.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index ec3f0b1..6e59f64 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -46,10 +46,7 @@ python buildhistory_emit_pkghistory() {
             self.pr = "r0"
             self.depends = ""
             self.packages = ""
-            self.bbfile = ""
-            self.src_uri = ""
             self.srcrev = ""
-            self.srcrev_autorev = ""
 
 
     class PackageInfo:
@@ -159,11 +156,6 @@ python buildhistory_emit_pkghistory() {
     pv = d.getVar('PV', True)
     pr = d.getVar('PR', True)
 
-    bbfile = d.getVar('BB_FILENAME', True)
-    src_uri = d.getVar('SRC_URI', True)
-    srcrev = d.getVar('SRCREV', True)
-    srcrev_autorev = 'yes' if d.getVar('SRCREV', False) == 'AUTOINC' else 'no'
-
     packages = squashspaces(d.getVar('PACKAGES', True))
 
     packagelist = packages.split()
@@ -184,10 +176,6 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.pv = pv
     rcpinfo.pr = pr
     rcpinfo.depends = sortlist(squashspaces(d.getVar('DEPENDS', True) or ""))
-    rcpinfo.bbfile = bbfile
-    rcpinfo.src_uri = src_uri
-    rcpinfo.srcrev = srcrev
-    rcpinfo.srcrev_autorev = srcrev_autorev
     rcpinfo.packages = packages
     write_recipehistory(rcpinfo, d)
 
-- 
1.8.1.2


