Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15871725F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 17:46:53 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2015 09:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,428,1418112000"; d="scan'208";a="514392245"
Received: from shirsenx-mobl3.gar.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.114])
	by orsmga003.jf.intel.com with ESMTP; 19 Jan 2015 09:40:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2015 09:46:44 -0800
Message-Id: <1421689604-28787-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] core-image-kernel-dev: add a DEFAULT_TEST_SUITES
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
X-List-Received-Date: Mon, 19 Jan 2015 17:46:55 -0000

If we do not add some additional tests, we just get the core-image-minimal
tests which are only ping

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index d14f658..5e4edd8 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -15,3 +15,5 @@ CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
 
 # We need extra space for things like kernel builds, etc.
 IMAGE_ROOTFS_EXTRA_SPACE_append += "+ 3000000"
+
+DEFAULT_TEST_SUITES = "ping ssh df syslog scp date rpm smart dmesg parselog"
-- 
2.1.0


