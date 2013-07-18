Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 262536B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:58:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2013 08:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="367399614"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 08:58:02 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 19:05:30 +0300
Message-Id: <81e04b945baf81d978e905240c70a1b13b4fead9.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v2 02/11] kmod:add GIT revision to PV variable
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
X-List-Received-Date: Thu, 18 Jul 2013 15:58:08 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

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


