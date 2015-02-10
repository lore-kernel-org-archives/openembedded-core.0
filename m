Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 335BA6E593
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 21:09:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2015 13:09:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,552,1418112000"; d="scan'208";a="683878401"
Received: from rrocha2-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.248.117])
	by orsmga002.jf.intel.com with ESMTP; 10 Feb 2015 13:09:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2015 13:09:42 -0800
Message-Id: <1423602582-7123-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][dizzy] linux-yocto-tiny_3.17: Update to actually use 3.17 git repo
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
X-List-Received-Date: Tue, 10 Feb 2015 21:09:52 -0000

The named release was still using the -dev git repo which did not contain
the SRCREV referenced in the numbered/named version.

(From OE-Core rev: b4f2f39ce0f4690ed51d14d1034b9f5e21c0f5a0)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
index eae0854..5762f3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.17.bb
@@ -13,7 +13,7 @@ SRCREV_meta ?= "84b57b01050dd9e5a004e265e70120e2a792f38a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.17.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
 COMPATIBLE_MACHINE = "(qemux86)"
 
-- 
2.1.0


