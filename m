Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BAAE6F5DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 07:47:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C7lAHn018464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 00:47:10 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 12 Mar 2014 00:47:09 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 15:46:58 +0800
Message-ID: <e4bac0a13734a2a6e51b8cf41ab0a422fc020cd4.1394610315.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1394610315.git.kai.kang@windriver.com>
References: <cover.1394610315.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 2/5] directfb: update to 1.7.1
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
X-List-Received-Date: Wed, 12 Mar 2014 07:47:09 -0000
Content-Type: text/plain

Update directfb to 1.7.1:
* remove PR
* remove rename-no-instrument-function-macro.patch which is merged

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/directfb/directfb.inc                    |  4 +---
 .../directfb/{directfb_1.6.3.bb => directfb_1.7.1.bb}          | 10 ++++------
 2 files changed, 5 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/directfb/{directfb_1.6.3.bb => directfb_1.7.1.bb} (54%)
 mode change 100755 => 100644

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index a23209f..f2518e9 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -11,9 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
 HOMEPAGE = "http://directfb.org"
 DEPENDS = "jpeg libpng freetype zlib tslib"
 
-INC_PR = "r0"
-
-SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
+SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
            file://fusion.patch"
 
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.3.bb b/meta/recipes-graphics/directfb/directfb_1.7.1.bb
old mode 100755
new mode 100644
similarity index 54%
rename from meta/recipes-graphics/directfb/directfb_1.6.3.bb
rename to meta/recipes-graphics/directfb/directfb_1.7.1.bb
index 277e9a9..15f38ac
--- a/meta/recipes-graphics/directfb/directfb_1.6.3.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.1.bb
@@ -1,12 +1,10 @@
 require directfb.inc
 
-RV = "1.6-0"
-PR = "${INC_PR}.2"
+RV = "1.7-1"
 
 DEPENDS += "sysfsutils"
 
 SRC_URI += "file://fix-compilation-with-zlib.patch \
-            file://rename-no-instrument-function-macro.patch \
             file://fixsepbuild.patch"
 
 EXTRA_OECONF = "\
@@ -20,7 +18,7 @@ EXTRA_OECONF = "\
   --disable-mesa \
 "
 
-LEAD_SONAME = "libdirectfb-1.6.so.0"
+LEAD_SONAME = "libdirectfb-1.7.so.0"
 
-SRC_URI[md5sum] = "641e8e999c017770da647f9b5b890906"
-SRC_URI[sha256sum] = "7a96aced0f69b2ec0810e9923068e61c21e6b19dd593e09394c872414df75e70"
+SRC_URI[md5sum] = "0ef44c16a414312fd38d6764e2cb9893"
+SRC_URI[sha256sum] = "dd7de38b3cd1408411b37ca28ec73e14b7672e5e28256b7bf91826240c81f519"
-- 
1.8.1.2


