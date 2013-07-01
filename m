Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E67E26ABBB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 18:58:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2013 11:56:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,975,1363158000"; d="scan'208";a="338845016"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.91])
	by orsmga001.jf.intel.com with ESMTP; 01 Jul 2013 11:58:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2013 11:58:25 -0700
Message-Id: <1372705105-28268-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] udev: Add RRECOMMENDS for udev-cache to enable the cache
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
X-List-Received-Date: Mon, 01 Jul 2013 18:58:25 -0000

This will enable the udev cache for sysvinit systems, which does improve post-first
boots.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/udev/udev.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index d30f7de..6606707 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -54,7 +54,7 @@ INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
 FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit ${nonarch_base_libdir}/udev"
-RRECOMMENDS_${PN} += "udev-utils"
+RRECOMMENDS_${PN} += "udev-utils udev-cache"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
-- 
1.8.1.4


