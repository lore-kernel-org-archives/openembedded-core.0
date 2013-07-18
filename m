Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB546B2BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:09:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Jul 2013 07:09:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,694,1367996400"; d="scan'208";a="372555762"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by orsmga002.jf.intel.com with ESMTP; 18 Jul 2013 07:09:25 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2013 17:16:39 +0300
Message-Id: <64f18573660b81394357d27a13ca89856fa94536.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <a6f5cb59348a434d4b03599b69f101cd0d5177fe.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
In-Reply-To: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1374141084.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 10/11] chkconfig-alternatives-native: add git token in package version
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
X-List-Received-Date: Thu, 18 Jul 2013 14:09:25 -0000

Git packages should have the following format:
    version+gitAUTOINC[r|-]+revision

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


