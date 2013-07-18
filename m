Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F1E2B6B2E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 15:58:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 18 Jul 2013 08:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="367399802"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2013 08:58:19 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 19:05:38 +0300
Message-Id: <1ebf4828c266ea862823452bb6376e001eb38890.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <07012a0b109ff8a20ad219351cc6a0e4c54d1dcb.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374162581.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH v2 10/11] chkconfig-alternatives-native: add GIT revision to PV variable
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
X-List-Received-Date: Thu, 18 Jul 2013 15:58:20 -0000

Git packages should have the following format for the PV variable:
	version_tag+git[r|\-|]?AUTOINC+git_revision

Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
---
 .../chkconfig-alternatives-native_1.3.59.bb        |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
index 7fd34aa..0b1077f 100644
--- a/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/kergoth/chkconfig;branch=sysroot"
 S = "${WORKDIR}/git"
 
 SRCREV = "cd437ecbd8986c894442f8fce1e0061e20f04dee"
-PV = "1.3.59+${SRCPV}"
+PV = "1.3.59+git${SRCPV}"
 
 inherit native
 
-- 
1.7.9.5


