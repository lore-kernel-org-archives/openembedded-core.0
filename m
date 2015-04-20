Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBF47390D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:47:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2015 07:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,609,1422950400"; d="scan'208";a="483183546"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2015 07:47:46 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 17:46:43 +0300
Message-Id: <15639f65193b3e278a312d722c20f0021cd8b2dd.1429540534.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429540534.git.cristian.iorga@intel.com>
References: <cover.1429540534.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1429540534.git.cristian.iorga@intel.com>
References: <cover.1429540534.git.cristian.iorga@intel.com>
Subject: [PATCH v2 1/4] maintainers.inc: remove info related to bluez4
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
X-List-Received-Date: Mon, 20 Apr 2015 14:47:59 -0000

bluez4, bluez-hcidump, gst-plugin-bluetooth recipes
will be removed from oe-core, maintainers removed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta-yocto/conf/distro/include/maintainers.inc | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
index c4e281e..e1b2f0d 100644
--- a/meta-yocto/conf/distro/include/maintainers.inc
+++ b/meta-yocto/conf/distro/include/maintainers.inc
@@ -64,9 +64,7 @@ RECIPE_MAINTAINER_pn-binutils = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-bison = "Chong Lu <Chong.Lu@windriver.com>"
 RECIPE_MAINTAINER_pn-blktool = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-blktrace = "Tom Zanussi <tom.zanussi@intel.com>"
-RECIPE_MAINTAINER_pn-bluez4 = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-bluez5 = "Cristian Iorga <cristian.iorga@intel.com>"
-RECIPE_MAINTAINER_pn-bluez-hcidump = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MAINTAINER_pn-btrfs-tools = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-build-appliance-image = "Saul Wold <sgw@linux.intel.com>"
@@ -216,7 +214,6 @@ RECIPE_MAINTAINER_pn-gst-fluendo-mp3 = "Cristian Iorga <cristian.iorga@intel.com
 RECIPE_MAINTAINER_pn-gst-fluendo-mpegdemux = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gst-meta-base = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gst-openmax = "Cristian Iorga <cristian.iorga@intel.com>"
-RECIPE_MAINTAINER_pn-gst-plugin-bluetooth = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gst-plugins-bad = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gst-plugins-base = "Cristian Iorga <cristian.iorga@intel.com>"
 RECIPE_MAINTAINER_pn-gst-plugins-good = "Cristian Iorga <cristian.iorga@intel.com>"
-- 
2.1.0


