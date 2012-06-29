Received: from c-71-193-189-117.hsd1.wa.comcast.net ([71.193.189.117]
	helo=yujin.bigsur.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@yujin.bigsur.com>) id 1SkisL-00087L-Js
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 23:37:14 +0200
Received: from yujin.bigsur.com (localhost [127.0.0.1])
	by yujin.bigsur.com (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	q5TLLOKD028214 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 14:21:24 -0700
Received: (from sgw@localhost)
	by yujin.bigsur.com (8.14.4/8.14.4/Submit) id q5TLLOHh028213
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 14:21:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2012 14:21:15 -0700
Message-Id: <3277b68d65f29bc9409de70988484a426debb198.1341004548.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341004548.git.sgw@linux.intel.com>
References: <cover.1341004548.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] libacpi: use lib_package bbclass
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
X-List-Received-Date: Fri, 29 Jun 2012 21:37:17 -0000

This is a clean-up following the recent addition of PN-bin
to bitbake.conf and lib_package

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/libacpi/libacpi_0.2.bb |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/libacpi_0.2.bb b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
index 1a6dc97..b0fbf0b 100644
--- a/meta/recipes-bsp/libacpi/libacpi_0.2.bb
+++ b/meta/recipes-bsp/libacpi/libacpi_0.2.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 HOMEPAGE = "http://www.ngolde.de/libacpi.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fec17f82f16630adf2dfb7d2a46f21c5"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 	   file://makefile-fix.patch \
@@ -15,10 +15,7 @@ SRC_URI = "http://www.ngolde.de/download/libacpi-${PV}.tar.gz \
 SRC_URI[md5sum] = "05b53dd7bead66dda35fec502b91066c"
 SRC_URI[sha256sum] = "13086e31d428b9c125954d48ac497b754bbbce2ef34ea29ecd903e82e25bad29"
 
-PACKAGES += "${PN}-bin"
-
-FILES_${PN} = "${libdir}/libacpi.so.*"
-FILES_${PN}-bin = "${bindir}"
+inherit lib_package
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|freebsd.*)'
 
-- 
1.7.10.4



