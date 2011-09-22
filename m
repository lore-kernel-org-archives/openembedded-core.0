Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R6YQP-0001Bk-Ps
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 03:50:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8M1ikhM010995
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 18:44:46 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 21 Sep 2011 18:44:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Sep 2011 20:47:01 -0500
Message-ID: <8364a28d2b3ba005c18424574a3b45e0e14f4eed.1316655855.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1316655855.git.mark.hatle@windriver.com>
References: <cover.1316655855.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 2/6] usbutils: Move the pkgconfig file(s) to the -dev package
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
X-List-Received-Date: Thu, 22 Sep 2011 01:50:06 -0000
Content-Type: text/plain

pkgconfig files belong in the -dev package.  They automatically add
a runtime dependency (when packaging with RPM) for "pkgconfig", which
is not desired to be installed with this package.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-bsp/usbutils/usbutils_0.91.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
index c5420d0..490b05a 100644
--- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_0.91.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libusb zlib"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz"
 
@@ -23,7 +23,7 @@ do_install_append() {
 }
 
 PACKAGES += "${PN}-ids"
-FILES_${PN} += "${datadir}/pkgconfig"
+FILES_${PN}-dev += "${datadir}/pkgconfig"
 FILES_${PN}-ids = "${datadir}/usb*"
 
 RDEPENDS_${PN} = "${PN}-ids bash"
-- 
1.7.3.4



