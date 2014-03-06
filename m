Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C4DFA6F58C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 15:26:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2014 07:22:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,601,1389772800"; d="scan'208";a="495217421"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 07:26:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 15:26:00 +0000
Message-Id: <b9331de6b9d34e5349bf5bb3dd154257de657cc1.1394119524.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1394119524.git.paul.eggleton@linux.intel.com>
References: <cover.1394119524.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1394119524.git.paul.eggleton@linux.intel.com>
References: <cover.1394119524.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] zaurusd: remove
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
X-List-Received-Date: Thu, 06 Mar 2014 15:26:57 -0000

Despite the fact that it's currently specific to the Sharp Zaurus, we
kept this in OE-Core up to now as a potential basis for better handling
of device-specific customisations for a wider range of devices. Whilst
moving device-specific customisations to a more central point is still
a laudable goal, these days such functionality probably wouldn't be
implemented on top of zaurusd or even in the same way as zaurusd, and
thus it makes sense to leave its recipe to be maintained in the
meta-handheld layer (where a current recipe already exists.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-bsp/zaurusd/zaurusd_git.bb | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta/recipes-bsp/zaurusd/zaurusd_git.bb

diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
deleted file mode 100644
index b1c0e28..0000000
--- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Daemon to handle device-specific features"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "tslib"
-RDEPENDS_${PN} = "xrandr"
-
-SRCREV = "85d941d87f0c41b196766a173feaafffa6de2dc2"
-PV = "0.1+git${SRCPV}"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-
-S = "${WORKDIR}/git"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-inherit autotools pkgconfig update-rc.d
-
-INITSCRIPT_NAME = "zaurusd"
-INITSCRIPT_PARAMS = "start 99 5 2 . stop 20 0 1 6 ."
-- 
1.8.5.3


