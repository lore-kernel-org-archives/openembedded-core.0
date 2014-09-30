Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C309716D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8U9YETr013869
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:34:14 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 02:34:13 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Sep 2014 17:33:04 +0800
Message-ID: <9de76d76afe44e292a22c0c85b6e8b9caa18fda6.1412068157.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1412068156.git.Chong.Lu@windriver.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] tcl: Upgrade to 8.6.2
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
X-List-Received-Date: Tue, 30 Sep 2014 09:34:19 -0000
Content-Type: text/plain

libgcc_s.so.1 is needed by running ptest, so add libgcc to
RDEPENDS_${PN}-ptest.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb} (94%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
similarity index 94%
rename from meta/recipes-devtools/tcltk/tcl_8.6.1.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.2.bb
index 27f73f2..75fef01 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.2.bb
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "aae4b701ee527c6e4e1a6f9c7399882e"
-SRC_URI[sha256sum] = "16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514"
+SRC_URI[md5sum] = "8103eaf6d71acb716a64224492f09d5f"
+SRC_URI[sha256sum] = "86f7ae5f581dd0904d04415637ab3aef5a50986c1b6d04c340e2b1b0258da9c4"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
@@ -81,6 +81,7 @@ FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
 # isn't getting picked up by shlibs code
 RDEPENDS_${PN} += "tcl-lib"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}-ptest += "libgcc"
 
 BBCLASSEXTEND = "native"
 
-- 
1.9.1


