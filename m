Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DyA-0003jA-GI
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:58:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2011 01:53:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,344,1312182000"; d="scan'208";a="49897224"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga002.fm.intel.com with ESMTP; 07 Sep 2011 01:53:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:58:13 +0800
Message-Id: <28743d872244f343d525c21c8f1b63f33b531318.1315385757.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315385757.git.dongxiao.xu@intel.com>
References: <cover.1315385757.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315385757.git.dongxiao.xu@intel.com>
References: <cover.1315385757.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] hal: Add virtual/kernel as hal's build dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2011 08:58:56 -0000

hal may need some kernel headers, thus we need virtual/kernel as its
dependency.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-support/hal/hal.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/hal/hal.inc b/meta/recipes-support/hal/hal.inc
index b00455b..efd9e72 100644
--- a/meta/recipes-support/hal/hal.inc
+++ b/meta/recipes-support/hal/hal.inc
@@ -6,7 +6,7 @@ SECTION = "unknown"
 LICENSE = "GPLv2+ | AFL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b5ffd59fbb7c2fff6de76c94177af31"
 
-DEPENDS = "dbus-glib udev util-linux intltool intltool-native expat libusb gperf-native"
+DEPENDS = "virtual/kernel dbus-glib udev util-linux intltool intltool-native expat libusb gperf-native"
 RDEPENDS_${PN} += "udev hal-info"
 
 SRC_URI = "http://hal.freedesktop.org/releases/hal-${PV}.tar.gz \
-- 
1.7.1



