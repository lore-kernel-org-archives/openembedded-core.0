Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6173A6B1EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:09:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 07:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="372555553"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 07:09:03 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 17:16:31 +0300
Message-Id: <e2604e0d121b0b9da89b428ffae5e6a4b3b5a896.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 02/11] kmod: add PV variable into recipe
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
X-List-Received-Date: Thu, 18 Jul 2013 14:09:04 -0000

Git packages should include git token inside the PV variable.

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index ca6b004..6afaca6 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -4,6 +4,7 @@
 require kmod.inc
 
 PR = "${INC_PR}.0"
+PV = "9+git${SRCPV}"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
-- 
1.7.9.5


