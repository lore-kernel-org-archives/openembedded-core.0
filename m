Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 357B76FF6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 02:53:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 29 Feb 2016 18:53:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="923924752"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga002.jf.intel.com with ESMTP; 29 Feb 2016 18:53:27 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 02:53:32 +0000
Message-Id: <288b9840d18b4972e21686f628aa330ba747149d.1456800675.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456800675.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 4/4] maintainers.inc: Add new eudev package and change maintainership for udev
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
X-List-Received-Date: Tue, 01 Mar 2016 02:53:27 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index 8fe87c8..a474b1f 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -160,6 +160,7 @@ RECIPE_MAINTAINER_pn-enchant = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-encodings = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ethtool = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-eudev = "Alejandro Hernandez <alejandro.hernandez@linux.intel.com>"
 RECIPE_MAINTAINER_pn-expat = "Jussi Kukkonen <jussi.kukkonen@intel.com>"
 RECIPE_MAINTAINER_pn-file = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
@@ -663,7 +664,6 @@ RECIPE_MAINTAINER_pn-u-boot-fw-utils = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-u-boot-mkimage = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-ubootchart = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-uclibc = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-udev = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-udev-extraconf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-unfs3 = "Randy Witt <randy.e.witt@linux.intel.com>"
 RECIPE_MAINTAINER_pn-unifdef = "Ross Burton <ross.burton@intel.com>"
-- 
2.6.2


