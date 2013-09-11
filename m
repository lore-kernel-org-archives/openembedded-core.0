Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 448D060EE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 18:36:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Sep 2013 11:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,885,1371106800"; d="scan'208";a="401901953"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 11 Sep 2013 11:36:29 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id C88DD6A4007;
	Wed, 11 Sep 2013 11:36:26 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:36:19 +0300
Message-Id: <1378924579-22548-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] classes/package_rpm: remove unsed outdir variable
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
X-List-Received-Date: Wed, 11 Sep 2013 18:36:44 -0000

Not only outdir had the wrong value, it wasn't used actually used in that function.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/package_rpm.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 699d0f2..2a7e164 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1079,11 +1079,10 @@ python do_package_rpm () {
         return name
 
     workdir = d.getVar('WORKDIR', True)
-    outdir = d.getVar('DEPLOY_DIR_IPK', True)
     tmpdir = d.getVar('TMPDIR', True)
     pkgd = d.getVar('PKGD', True)
     pkgdest = d.getVar('PKGDEST', True)
-    if not workdir or not outdir or not pkgd or not tmpdir:
+    if not workdir or not pkgd or not tmpdir:
         bb.error("Variables incorrectly set, unable to package")
         return
 
-- 
1.8.3.1


