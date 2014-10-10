Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 23A036AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 22:42:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2014 15:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,695,1406617200"; d="scan'208";a="587009377"
Received: from unknown (HELO localhost.jf.intel.com) ([10.7.201.167])
	by orsmga001.jf.intel.com with ESMTP; 10 Oct 2014 15:40:18 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Oct 2014 15:39:18 -0700
Message-Id: <1412980758-35295-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] mesa_git.bb: Fix fetch and license errors.
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
X-List-Received-Date: Fri, 10 Oct 2014 22:42:29 -0000

Without these changes mesa_git.bb can't be enabled as the
PREFERRED_VERSION due to build breakage.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-graphics/mesa/mesa_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 59b0d1c..cda310a 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -2,13 +2,12 @@ require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
 
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
 
-PR = "${INC_PR}.0"
 SRCREV = "0028eb1083e6adc110a23a5f02c993cda217067a"
 PV = "10.1.3+git${SRCPV}"
 
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;branch=10.1 \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0006-fix-out-of-tree-egl.patch \
            "
-- 
1.9.3


