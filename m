Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DC2EE601DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 18:08:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 03 Jun 2015 11:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,548,1427785200"; d="scan'208";a="581512576"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 03 Jun 2015 11:08:59 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Wed,  3 Jun 2015 11:07:25 -0700
Message-Id: <1433354849-16843-4-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
References: <1433354849-16843-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 3/7] documentation.conf: Document do_vmimg
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
X-List-Received-Date: Wed, 03 Jun 2015 18:08:56 -0000

Changes due to new combined support for both vmdk and vdi files.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3a918e8..bd34c99 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -57,7 +57,7 @@ do_testsdk[doc] = "Installs an SDK and performs runtime tests on the tools insta
 do_uboot_mkimage[doc] = "Creates a uImage file from the kernel for the U-Boot bootloader"
 do_unpack[doc] = "Unpacks the source code into a working directory"
 do_validate_branches[doc] = "Ensures that the source/meta branches are on the locations specified by their SRCREV values for a linux-yocto style kernel"
-do_vmdkimg[doc] = "Creates a .vmdk image for use with VMware and compatible virtual machine hosts"
+do_vmimg[doc] = "Creates an image for use with VMware or VirtualBox compatible virtual machine hosts (based on IMAGE_FSTYPES either .vmdk or .vdi)"
 
 # DESCRIPTIONS FOR VARIABLES #
 
-- 
1.9.1


