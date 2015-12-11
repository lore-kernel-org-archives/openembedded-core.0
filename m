Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCDD6FFA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 21:29:20 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBBLTLdX013390 for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 15:29:21 -0600
Received: from delcastillo2.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121115292133-1035379 ;
	Fri, 11 Dec 2015 15:29:21 -0600 
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Dec 2015 15:29:19 -0600
Message-Id: <1449869359-2915-1-git-send-email-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
References: <CAJ86T=WinR1iEU-7QwQ1j75174dM8S+oY6H3WZgudXUyoOaX7A@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/11/2015 03:29:21 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/11/2015 03:29:21 PM,
	Serialize complete at 12/11/2015 03:29:21 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-11_12:, , signatures=0
Subject: [PATCH v4] libsolv: add new recipe
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
X-List-Received-Date: Fri, 11 Dec 2015 21:29:21 -0000

Required by the optional opkg 0.3.1 libsolv backend.

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 meta/recipes-extended/libsolv/libsolv_0.6.14.bb | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv_0.6.14.bb

diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.14.bb b/meta/recipes-extended/libsolv/libsolv_0.6.14.bb
new file mode 100644
index 0000000..11d6c70
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
+DEPENDS = "expat zlib"
+
+PV = "0.6.14+git${SRCPV}"
+
+SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master"
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


