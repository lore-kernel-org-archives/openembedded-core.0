Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 42CF5608C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 08:50:43 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 09 Jul 2013 01:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1026,1363158000"; d="scan'208";a="328624356"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by azsmga001.ch.intel.com with ESMTP; 09 Jul 2013 01:50:23 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2013 11:57:48 +0300
Message-Id: <96ee91995791988598109eeb85a57ab94ea65e16.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
Subject: [PATCH 1/4] chkconfig-alternatives-native: add git token in package version
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
X-List-Received-Date: Tue, 09 Jul 2013 08:50:43 -0000

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


