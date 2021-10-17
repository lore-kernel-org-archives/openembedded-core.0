Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Subject: [PATCH] webkitgtk: add gperf-native to DEPENDS to fix build
Date: Sun, 17 Oct 2021 13:57:03 +0200
Message-Id: <20211017115703.3801301-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

|   Could NOT find Gperf (missing: GPERF_EXECUTABLE) (Required is at least
|   version "3.0.1")

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.34.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
index 25e1d422cc..a8e067147c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.0.bb
@@ -32,6 +32,7 @@ CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
 DEPENDS = " \
           ruby-native \
+          gperf-native \
           cairo \
           harfbuzz \
           jpeg \
-- 
2.31.1

