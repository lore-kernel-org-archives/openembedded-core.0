Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2345073D41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 09:07:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3E97Fgv009773
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 02:07:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 14 Apr 2015 02:07:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Apr 2015 02:07:10 -0700
Message-ID: <ada822b89f21988fd1073716b5add19c45211cbb.1429002381.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429002381.git.liezhi.yang@windriver.com>
References: <cover.1429002381.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] tcl: 8.6.3 -> 8.6.4
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
X-List-Received-Date: Tue, 14 Apr 2015 09:07:15 -0000
Content-Type: text/plain

The LIC_FILES_CHKSUM has been changed since 2 extra spaces in the end
were moved.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tcltk/{tcl_8.6.3.bb => tcl_8.6.4.bb}           |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.3.bb => tcl_8.6.4.bb} (81%)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
similarity index 81%
rename from meta/recipes-devtools/tcltk/tcl_8.6.3.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.4.bb
index 73c0d25..8e92b3e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.3.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.4.bb
@@ -4,12 +4,12 @@ SECTION = "devel/tcltk"
 
 # http://www.tcl.tk/software/tcltk/license.html
 LICENSE = "tcl & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    file://../compat/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    file://../library/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    file://../macosx/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    file://../tests/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
-    file://../win/license.terms;md5=3c6f62c07835353e36f0db550ccfb65a \
+LIC_FILES_CHKSUM = "file://../license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://../compat/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://../library/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://../macosx/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://../tests/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
+    file://../win/license.terms;md5=058f6229798281bbcac4239c788cfa38 \
 "
 
 DEPENDS = "tcl-native zlib"
@@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[md5sum] = "db382feca91754b7f93da16dc4cdad1f"
-SRC_URI[sha256sum] = "6ce0778de0d50daaa9c345d7c1fd1288fb658f674028812e7eeee992e3051005"
+SRC_URI[md5sum] = "d7cbb91f1ded1919370a30edd1534304"
+SRC_URI[sha256sum] = "9e6ed94c981c1d0c5f5fefb8112d06c6bf4d050a7327e95e71d417c416519c8d"
 
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
-- 
1.7.9.5


