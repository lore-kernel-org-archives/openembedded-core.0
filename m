Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 61039731DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 09:31:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 30 Aug 2016 02:31:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2625834"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 30 Aug 2016 02:31:11 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id BBE656A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 02:30:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 12:29:39 +0300
Message-Id: <5e8ae5b364bc0607519a0a79c8179c3126e2378e.1472548574.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472548574.git.ed.bartosh@linux.intel.com>
References: <cover.1472548574.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/18] syslinux.bbclass: deploy bootloader to DEPLOYDIR
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
X-List-Received-Date: Tue, 30 Aug 2016 09:31:10 -0000

Changed deployment directory from DEPLOY_DIR_IMAGE to DEPLOYDIR
to make sstate machinery to do final deployment and generate
manifest.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/syslinux.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 35d9eed..fd4c32e 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -72,7 +72,7 @@ syslinux_hddimg_populate() {
 }
 
 syslinux_hddimg_install() {
-	syslinux ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg
+	syslinux ${DEPLOYDIR}/${IMAGE_NAME}.hddimg
 }
 
 syslinux_hdddirect_install() {
-- 
2.1.4


