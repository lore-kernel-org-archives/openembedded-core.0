Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2IX3-0007BV-6r
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 11:07:53 +0200
Received: by bkcik5 with SMTP id ik5so1902528bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 01:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=oSRAU2xY5E80sqDDjo0e0gh2WFiNdyrwMxYVbmBo1MQ=;
	b=nCs05VSONEwwJvqUbrlYifY22jZBaDTDVq8mcjvXVW/xEdQRNIeUztIMjE2xLzeT7H
	Urm4O/4q46FDcPYQsmufleHecmbp26Ov40vZCayLHKgtQKh6q9HeTyR5Vfrs5Y6YqZVe
	/P+muEz6t5Q7iAgIUUeCMYGdl7YpRgHi0dc1keGaR+RLRUx9dlbx2YxcVdtQKRQ6hF4S
	tWVS/YN+FqRnj5XijouWHUAOIoJ1tOzvVs1tEmkLz/r7p3NQhXsSYQV0stWLT7Bt7cXv
	5+BIqq9BKpe8Z9vn4MHh5PEYLUX6FZIfwmiJdaKTRELhUvzzP4nmAQx6lMC3XkkwYozP
	ZghA==
Received: by 10.205.134.133 with SMTP id ic5mr1620868bkc.15.1345193754961;
	Fri, 17 Aug 2012 01:55:54 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm3311868bkc.3.2012.08.17.01.55.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 01:55:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 10:55:17 +0200
Message-Id: <1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] webkit-gtk: update to 1.8.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 09:07:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested with midori 0.4.5:
* google maps
* google mail (https)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{webkit-gtk_1.8.1.bb => webkit-gtk_1.8.2.bb}   |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-sato/webkit/{webkit-gtk_1.8.1.bb => webkit-gtk_1.8.2.bb} (96%)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
similarity index 96%
rename from meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
rename to meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
index afd3a7a..1d1419e 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.2.bb
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
-PR = "r1"
-
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
@@ -17,8 +15,6 @@ DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt lib
            gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
-PR = "r1"
-
 SRC_URI = "\
   http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
   file://nodolt.patch \
@@ -26,8 +22,8 @@ SRC_URI = "\
   file://webgit-gtk_fix_build_with_automake_1.12.patch \
  "
 
-SRC_URI[md5sum] = "f2f01b1fdc7262a2eede81ebed0970b2"
-SRC_URI[sha256sum] = "9a126a76b40ca61adb1f1626e1567f976740af2332948cc5189489dbd01e3b28"
+SRC_URI[md5sum] = "f7bd0bd4f323039f15e19c82a9a8313c"
+SRC_URI[sha256sum] = "0cd69b7c4bf4af3442a5e6777a1487cabf14db15baeeed96d0865419f69b81e6"
 
 inherit autotools lib_package gtk-doc pkgconfig
 
-- 
1.7.6.5



