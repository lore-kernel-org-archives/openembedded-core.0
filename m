Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7CD273D2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UDQT028448
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:30:05 -0700
Message-ID: <e3c982b0698b365a93a4272220a21ed8cb173938.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/15] pciutils: remove libpci-dev and libpci-dbg from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:12 -0000
Content-Type: text/plain

There should be only one dev and dbg package

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.3.0.bb |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
index b713512..7a3a0c6 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.3.0.bb
@@ -52,12 +52,9 @@ do_install () {
 	oe_multilib_header pci/config.h
 }
 
-PACKAGES =+ "${PN}-ids libpci libpci-dev libpci-dbg"
+PACKAGES =+ "${PN}-ids libpci"
 FILES_${PN}-ids = "${datadir}/pci.ids*"
 FILES_libpci = "${libdir}/libpci.so.*"
-FILES_libpci-dbg = "${libdir}/.debug"
-FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
-                    ${includedir}/pci ${libdir}/pkgconfig"
 SUMMARY_${PN}-ids = "PCI utilities - device ID database"
 DESCRIPTION_${PN}-ids = "Package providing the PCI device ID database for pciutils."
 RDEPENDS_${PN} += "${PN}-ids"
-- 
1.7.9.5


