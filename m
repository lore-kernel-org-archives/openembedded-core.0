Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id BAD6E6012C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 21:22:21 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBALMME1007938 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 15:22:22 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121015222200-992303 ;
	Thu, 10 Dec 2015 15:22:22 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 15:22:20 -0600
Message-Id: <1449782540-4416-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1449702069-11889-1-git-send-email-alejandro.delcastillo@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/10/2015 03:22:22 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/10/2015 03:22:22 PM,
	Serialize complete at 12/10/2015 03:22:22 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-10_12:, , signatures=0
Subject: [PATCH v3] libsolv: add new recipe
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
X-List-Received-Date: Thu, 10 Dec 2015 21:22:22 -0000

Required by the optional opkg 0.3.1 libsolv backend.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.14.bb | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.14.bb

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.14.bb b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
new file mode 100644
index 0000000..fba6b2d
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Library for solving packages and reading repositories"
+HOMEPAGE = "https://github.com/openSUSE/libsolv"
+BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
+
+SRC_URI = "https://github.com/openSUSE/libsolv/archive/${PV}.zip"
+
+SRC_URI[md5sum] = "171da68f08f672cacd1930643f8d1b4d"
+SRC_URI[sha256sum] = "0263b11372012be9c83f1c01f7d55ea9464dde58c109f5ae4de1e52870034a45"
+
+S = "${WORKDIR}/libsolv-${PV}"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DLIB=${baselib}"
+
+DEPENDS = "expat zlib"
+
+PACKAGES =+ "${PN}-tools ${PN}ext ${PN}ext-dbg"
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
+FILES_${PN}-tools = "${bindir}/*"
+FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
+FILES_${PN}ext-dbg = "${libdir}/.debug/${PN}ext.so.*"
+
+BBCLASSEXTEND =+ "native nativesdk"
-- 
1.9.1


