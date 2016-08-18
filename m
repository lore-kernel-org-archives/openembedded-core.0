Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CBA0C6014F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 03:15:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10029311"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Aug 2016 11:15:04 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id B4F9D42CD102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 11:15:05 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 18 Aug 2016 11:15:05 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2016 23:15:01 -0400
Message-ID: <1471490101-1503-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: B4F9D42CD102.A6333
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] glib-2.0: 2.48.1 -> 2.48.2
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
X-List-Received-Date: Thu, 18 Aug 2016 03:15:09 -0000
Content-Type: text/plain

1) Upgrade glib-2.0 from 2.48.1 to 2.48.2.
2) Modify Enable-more-tests-while-cross-compiling.patch, since the data has changed.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch   | 2 +-
 meta/recipes-core/glib-2.0/{glib-2.0_2.48.1.bb => glib-2.0_2.48.2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.48.1.bb => glib-2.0_2.48.2.bb} (87%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
index f1e688c..9b4ded1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
@@ -46,7 +46,7 @@ index 868873f..533e454 100644
 @@ -545,7 +548,6 @@ test.gresource: test.gresource.xml Makefile $(shell $(glib_compile_resources) --
  
  EXTRA_DIST += test.gresource.xml test1.txt test2.gresource.xml test2.txt test3.gresource.xml test3.txt test4.gresource.xml
- CLEANFILES += test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
+ CLEANFILES += test-generated.txt test_resources.c test_resources2.[ch] plugin_resources.c test.gresource
 -endif # !CROSS_COMPILING
  
  BUILT_SOURCES += giotypefuncs.c
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb
similarity index 87%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb
index ef96ca1..a45f644 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.48.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb
@@ -22,5 +22,5 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "67bd3b75c9f6d5587b457dc01cdcd5bb"
-SRC_URI[sha256sum] = "74411bff489cb2a3527bac743a51018841a56a4d896cc1e0d0d54f8166a14612"
+SRC_URI[md5sum] = "f4ac1aa2efd4f5798c37625ea697ac57"
+SRC_URI[sha256sum] = "f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4"
-- 
2.7.4




