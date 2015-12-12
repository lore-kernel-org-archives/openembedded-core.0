Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC506080F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Dec 2015 00:14:34 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBC0EZsr026570 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 18:14:35 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121118143504-1041923 ;
	Fri, 11 Dec 2015 18:14:35 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 18:14:31 -0600
Message-Id: <1449879271-10287-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CA+chaQfoFMrgSjwW6Pj0Pfzu=UdeuB+hh-d0qimmeMqt2B5y8A@mail.gmail.com>
References: <CA+chaQfoFMrgSjwW6Pj0Pfzu=UdeuB+hh-d0qimmeMqt2B5y8A@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/11/2015 06:14:35 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/11/2015 06:14:35 PM,
	Serialize complete at 12/11/2015 06:14:35 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-11_12:, , signatures=0
Subject: [PATCH v5] libsolv: add new recipe
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
X-List-Received-Date: Sat, 12 Dec 2015 00:14:38 -0000

Required by the optional opkg 0.3.1 libsolv backend.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-extended/libsolv/libsolv_git.bb | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv_git.bb

diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
new file mode 100644
index 0000000..2011487
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Library for solving packages and reading repositories"
+HOMEPAGE = "https://github.com/openSUSE/libsolv"
+BUGTRACKER = "https://github.com/openSUSE/libsolv/issues"
+SECTION = "devel"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
+
+DEPENDS = "expat zlib"
+
+PV = "0.6.14+git${SRCPV}"
+
+SRC_URI = "git://github.com/openSUSE/libsolv.git"
+SRCREV = "b1ea39233f86cd62fbab1964d7497244f6be0087"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DLIB=${baselib}"
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


