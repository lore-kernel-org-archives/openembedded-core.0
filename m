Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E45506D7E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 10:10:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rABAAbUD023148
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 02:10:37 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 02:10:36 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 05:10:34 -0500
Message-ID: <ea600bb017883679b3c9308a64d184d59f00308b.1384164392.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384164392.git.wenzong.fan@windriver.com>
References: <cover.1384164392.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] udev: remove libudev-dbg and libgudev-dbg
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
X-List-Received-Date: Mon, 11 Nov 2013 10:10:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

We don't support multiple -dbg packages, all debug stuffs will be
shipped to 'udev-dbg'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-core/udev/udev.inc |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 02cab3b..ec638ea 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -45,8 +45,8 @@ EXTRA_OECONF = "--disable-introspection \
                "
 
 PACKAGES =+ "udev-utils udev-cache"
-PACKAGES =+ "libudev libudev-dev libudev-dbg"
-PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
+PACKAGES =+ "libudev libudev-dev"
+PACKAGES =+ "libgudev libgudev-dev"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -63,11 +63,9 @@ FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
 FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                      ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
 FILES_libgudev = "${base_libdir}/libgudev*.so.* ${libdir}/libgudev*.so.*"
-FILES_libgudev-dbg = "${base_libdir}/.debug/libgudev*.so.* ${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
-- 
1.7.9.5


