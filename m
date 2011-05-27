Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPqYE-0003fX-GO
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 08:29:38 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2011 23:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,278,1304319600"; 
   d="scan'208";a="9785653"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 23:26:33 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 14:31:50 +0800
Message-Id: <55a2cf9ec0f4b20b30774e43aa66f127279b1070.1306477652.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
References: <93b575839974dfc9e49598a5c2db76ebabbb5bc0.1306477652.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1306477652.git.lianhao.lu@intel.com>
References: <cover.1306477652.git.lianhao.lu@intel.com>
Subject: [PATCH 06/11] udev: use EXTENDPKGV instead of EXTENDPV.
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
X-List-Received-Date: Fri, 27 May 2011 06:29:38 -0000

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-core/udev/udev-new.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index d1abf39..1b94f1b 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils linux-libc-headers gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
-RDEPENDS_libudev = "${PN} (= ${EXTENDPV})"
+RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://run.rules \
-- 
1.7.0.4



