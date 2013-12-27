Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C422610B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 10:18:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBRAI36m012381
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 02:18:03 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Fri, 27 Dec 2013 02:18:03 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Dec 2013 18:17:40 +0800
Message-ID: <ae21fc35162f54a94e6197cd402a3e73199f4ba4.1388139291.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388139291.git.Chong.Lu@windriver.com>
References: <cover.1388139291.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] quilt: upgrade to 0.61
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
X-List-Received-Date: Fri, 27 Dec 2013 10:18:02 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/quilt/{quilt-0.60.inc => quilt-0.61.inc}        | 4 ++--
 .../quilt/{quilt-native_0.60.bb => quilt-native_0.61.bb}              | 1 -
 meta/recipes-devtools/quilt/{quilt_0.60.bb => quilt_0.61.bb}          | 4 +---
 3 files changed, 3 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/quilt/{quilt-0.60.inc => quilt-0.61.inc} (87%)
 rename meta/recipes-devtools/quilt/{quilt-native_0.60.bb => quilt-native_0.61.bb} (98%)
 rename meta/recipes-devtools/quilt/{quilt_0.60.bb => quilt_0.61.bb} (95%)

diff --git a/meta/recipes-devtools/quilt/quilt-0.60.inc b/meta/recipes-devtools/quilt/quilt-0.61.inc
similarity index 87%
rename from meta/recipes-devtools/quilt/quilt-0.60.inc
rename to meta/recipes-devtools/quilt/quilt-0.61.inc
index 5fe201f..c4a929d 100644
--- a/meta/recipes-devtools/quilt/quilt-0.60.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.61.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_URI = "http://download.savannah.gnu.org/releases/quilt/quilt-${PV}.tar.gz \
         file://install.patch"
 
-SRC_URI[md5sum] = "058a08a9b626bdec9ec8c519dc92158c"
-SRC_URI[sha256sum] = "3d72a292e432beb9a73f9d0acfe3a77c9b4d7e42209919bb244e9958c7cfe64b"
+SRC_URI[md5sum] = "24417eba5961592b64103bdda001ebf4"
+SRC_URI[sha256sum] = "1eec0a270ac4d41eea0fd5823603c9d2a35ab6b8ab73a90dd92ce1291b2a9fc3"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/quilt/quilt-native_0.60.bb b/meta/recipes-devtools/quilt/quilt-native_0.61.bb
similarity index 98%
rename from meta/recipes-devtools/quilt/quilt-native_0.60.bb
rename to meta/recipes-devtools/quilt/quilt-native_0.61.bb
index b875dbc..a089a83 100644
--- a/meta/recipes-devtools/quilt/quilt-native_0.60.bb
+++ b/meta/recipes-devtools/quilt/quilt-native_0.61.bb
@@ -1,3 +1,2 @@
 require quilt-${PV}.inc
 require quilt-native.inc
-
diff --git a/meta/recipes-devtools/quilt/quilt_0.60.bb b/meta/recipes-devtools/quilt/quilt_0.61.bb
similarity index 95%
rename from meta/recipes-devtools/quilt/quilt_0.60.bb
rename to meta/recipes-devtools/quilt/quilt_0.61.bb
index d866032..565e46a 100644
--- a/meta/recipes-devtools/quilt/quilt_0.60.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.61.bb
@@ -1,11 +1,9 @@
 require quilt-${PV}.inc
-inherit gettext 
+inherit gettext
 RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r1"
-
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=${base_bindir}/bash"
 
-- 
1.8.1.2


