Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9C52E6059F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Feb 2018 08:56:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Feb 2018 00:56:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,477,1511856000"; d="scan'208";a="16237179"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2018 00:56:35 -0800
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Feb 2018 16:51:15 +0800
Message-Id: <1518079875-44198-2-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518079875-44198-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1518079875-44198-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/2] maintainers.inc: update recipe ownership
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
X-List-Received-Date: Thu, 08 Feb 2018 08:56:35 -0000

Remove recipe for sato-icon-theme that was obsolete since YP 2.2
release and change ownership for eudev recipe.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 34f3d81..914cc2b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -164,7 +164,7 @@ RECIPE_MAINTAINER_pn-enchant = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Changhyeok Bae <changhyeok.bae@lge.com>"
-RECIPE_MAINTAINER_pn-eudev = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
+RECIPE_MAINTAINER_pn-eudev = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-expat = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -646,7 +646,6 @@ RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alexander.kanavin@intel.com>
 RECIPE_MAINTAINER_pn-ruby = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-run-postinsts = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-sato-icon-theme = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-sato-screenshot = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-sbc = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-screen = "Maxin B. John <maxin.john@intel.com>"
-- 
2.7.4


