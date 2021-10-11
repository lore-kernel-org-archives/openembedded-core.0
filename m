Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 19/25] itstool: update 2.0.6 -> 2.0.7
Date: Mon, 11 Oct 2021 11:40:53 +0200
Message-Id: <20211011094059.4184654-19-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ve-Don-t-use-build-time-hardcoded-python-binary-.patch | 8 +++-----
 .../itstool/{itstool_2.0.6.bb => itstool_2.0.7.bb}        | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-support/itstool/{itstool_2.0.6.bb => itstool_2.0.7.bb} (81%)

diff --git a/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
index 19a858bd75e..fdcbe46fedb 100644
--- a/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
+++ b/meta/recipes-support/itstool/itstool/0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch
@@ -1,4 +1,4 @@
-From 335ef14fc801c9dfbe7e5692dc71cfbe72049d2b Mon Sep 17 00:00:00 2001
+From c47820450ce7f55d22c672cf94d20a5f9fd208bf Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 27 Oct 2019 16:38:52 +0100
 Subject: [PATCH] Native: Don't use build time hardcoded python binary path.
@@ -16,12 +16,13 @@ don't support it [2]
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
 ---
  itstool.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/itstool.in b/itstool.in
-index e64cd34..05d264f 100755
+index c21ad4b..daea177 100755
 --- a/itstool.in
 +++ b/itstool.in
 @@ -1,4 +1,4 @@
@@ -30,6 +31,3 @@ index e64cd34..05d264f 100755
  #
  # Copyright (c) 2010-2018 Shaun McCance <shaunm@gnome.org>
  #
--- 
-2.21.0
-
diff --git a/meta/recipes-support/itstool/itstool_2.0.6.bb b/meta/recipes-support/itstool/itstool_2.0.7.bb
similarity index 81%
rename from meta/recipes-support/itstool/itstool_2.0.6.bb
rename to meta/recipes-support/itstool/itstool_2.0.7.bb
index eba53e728d1..2416835d370 100644
--- a/meta/recipes-support/itstool/itstool_2.0.6.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -11,13 +11,13 @@ inherit autotools python3native
 
 DEPENDS = "libxml2-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
+           "
 SRC_URI:append:class-native = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI:append:class-nativesdk = " file://0001-Native-Don-t-use-build-time-hardcoded-python-binary-.patch"
 SRC_URI:append:class-target = " file://0002-Don-t-use-build-time-hardcoded-python-binary-path.patch"
 
-SRC_URI[md5sum] = "4306eeba4f4aee6b393d14f9c3c57ca1"
-SRC_URI[sha256sum] = "6233cc22726a9a5a83664bf67d1af79549a298c23185d926c3677afa917b92a9"
+SRC_URI[sha256sum] = "6b9a7cd29a12bb95598f5750e8763cee78836a1a207f85b74d8b3275b27e87ca"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.20.1

