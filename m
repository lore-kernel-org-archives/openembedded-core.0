Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C9F2A75798
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:59 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512605"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:09:02 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:28 -0700
Message-Id: <1433354849-16843-7-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 6/7] build-appliance-image: do_vmdkimg replaced by do_vmimg
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
X-List-Received-Date: Wed, 03 Jun 2015 18:09:00 -0000

As a consequence of adding VDI image support, do_vmdkimg routine has been
replaced by a generic do_vmimg routine.

This also allows to build the build-appliance for VirtualBox,
providing IMAGE_FSTYPES is set to "vdi"

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-core/images/build-appliance-image_12.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_12.0.1.bb b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
index 6d48a65..8e71b36 100644
--- a/meta/recipes-core/images/build-appliance-image_12.0.1.bb
+++ b/meta/recipes-core/images/build-appliance-image_12.0.1.bb
@@ -89,5 +89,5 @@ python do_bundle_files() {
     bb.build.exec_func('create_bundle_files', d)
 }
 
-addtask bundle_files after do_vmdkimg before do_build
+addtask bundle_files after do_vmimg before do_build
 do_bundle_files[nostamp] = "1"
-- 
1.9.1


