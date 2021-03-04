Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web08.1825.1614817817788530325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 16:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.113.2.232] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 2D/BB-03420-71A20406; Thu, 04 Mar 2021 00:30:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVVdcyyH
  B4NVqOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePP42lMBdu0KvYtO87WwNin2sXIxSEksIlJ
  4uaGO2xdjJxAznFGiZYtBSA2m4CmRO+WLYxdjBwcIgJ6Elf/iYKEmQXUJS6ta2EBsYUFLCV+d
  30Ba2URUJH4cGUqE4jNK+AqcePoRkYQW0JAQWLKw/fMEHFBiZMzn7BAzJGQOPjiBTNEjaLE7M
  vNLBB2lcSajmlsExh5ZyFpmYWkZQEj0ypGy6SizPSMktzEzBxdQwMDXUNDY10gaWygl1ilm6i
  XWqqbnJpXUpQIlNVLLC/WK67MTc5J0ctLLdnECAyvlEKGph2M71590DvEKMnBpCTKe+CLfYIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4eTYcEIcGi1PTUirTMHGCow6QlOHiURHjV1IDSvMUFi
  bnFmekQqVOMuhzvfi5exCzEkpeflyolzntMA6hIAKQoozQPbgQs7i4xykoJ8zIyMDAI8RSkFu
  VmlqDKv2IU52BUEubtB7mEJzOvBG7TK6AjmICOmOVmB3JESSJCSqqBqSyiM+lh5okfL8IY5SP
  3Pq6yL9O7yfpwza+YbDUNPUYZbj8m7RnspzhsrrxwX7Nv/p5TqX2qB5fum7+s5DHbJJWaJO0P
  Hi/tzq7oqIzhM3DPn77g2xTvsFIhKf+sRKXEO/+sl2yJ2rD9j9ZJz8QlphyzJvjZ7/ttp2+oJ
  BE+ex938UVh7tuz1LpeKLvz1JiJPj9r8uLI9ATmFwFv99XxzjqaVnekhY0ncvW8RZfUlec/3n
  dOd/WjOMUPB19e7ddjCJ93gnlhvvfrT/63n0QFTmkXTbLKmL5eNGlv4GmLfWdP8nKG2CTOvZ4
  pX/q/KeIJ/65z10wOR8g3zjVY9HX2u7d88c6iosLLtFZXfpkrpsRSnJFoqMVcVJwIAN0GwJ42
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-232.messagelabs.com!1614817814!1087858!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20557 invoked from network); 4 Mar 2021 00:30:15 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-6.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2021 00:30:15 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1240UEgK014180
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Mar 2021 00:30:14 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 4 Mar 2021 00:30:13 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] taglib: upgrade 1.11.1 -> 1.12
Date: Thu, 4 Mar 2021 08:30:07 +0800
Message-ID: <1614817807-40510-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

CVE-2017-12678.patch
CVE-2018-11439.patch
removed since they are included in 1.12

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../taglib/taglib/CVE-2017-12678.patch        | 40 ---------------
 .../taglib/taglib/CVE-2018-11439.patch        | 51 -------------------
 .../{taglib_1.11.1.bb => taglib_1.12.bb}      |  9 ++--
 3 files changed, 3 insertions(+), 97 deletions(-)
 delete mode 100644 meta/recipes-support/taglib/taglib/CVE-2017-12678.patch
 delete mode 100644 meta/recipes-support/taglib/taglib/CVE-2018-11439.patch
 rename meta/recipes-support/taglib/{taglib_1.11.1.bb => taglib_1.12.bb} (85%)

diff --git a/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch b/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch
deleted file mode 100644
index 4bd9f2be17..0000000000
--- a/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From eb9ded1206f18f2c319157337edea2533a40bea6 Mon Sep 17 00:00:00 2001
-From: "Stephen F. Booth" <me@sbooth.org>
-Date: Sun, 23 Jul 2017 10:11:09 -0400
-Subject: [PATCH] Don't assume TDRC is an instance of TextIdentificationFrame
-
-If TDRC is encrypted, FrameFactory::createFrame() returns UnknownFrame
-which causes problems in rebuildAggregateFrames() when it is assumed
-that TDRC is a TextIdentificationFrame
-
-Upstream-Status: Backport
-[https://github.com/taglib/taglib/pull/831/commits/eb9ded1206f18f2c319157337edea2533a40bea6]
-
-CVE: CVE-2017-12678
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- taglib/mpeg/id3v2/id3v2framefactory.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/taglib/mpeg/id3v2/id3v2framefactory.cpp b/taglib/mpeg/id3v2/id3v2framefactory.cpp
-index 759a9b7b..9347ab86 100644
---- a/taglib/mpeg/id3v2/id3v2framefactory.cpp
-+++ b/taglib/mpeg/id3v2/id3v2framefactory.cpp
-@@ -334,10 +334,11 @@ void FrameFactory::rebuildAggregateFrames(ID3v2::Tag *tag) const
-      tag->frameList("TDAT").size() == 1)
-   {
-     TextIdentificationFrame *tdrc =
--      static_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
-+      dynamic_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
-     UnknownFrame *tdat = static_cast<UnknownFrame *>(tag->frameList("TDAT").front());
- 
--    if(tdrc->fieldList().size() == 1 &&
-+    if(tdrc &&
-+       tdrc->fieldList().size() == 1 &&
-        tdrc->fieldList().front().size() == 4 &&
-        tdat->data().size() >= 5)
-     {
--- 
-2.13.5
-
diff --git a/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch b/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch
deleted file mode 100644
index cdd66e67f7..0000000000
--- a/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 272648ccfcccae30e002ccf34a22e075dd477278 Mon Sep 17 00:00:00 2001
-From: Scott Gayou <github.scott@gmail.com>
-Date: Mon, 4 Jun 2018 11:34:36 -0400
-Subject: [PATCH] Fixed OOB read when loading invalid ogg flac file. (#868)
-
-This CVE is caused by a failure to check the minimum length
-of a ogg flac header. This header is detailed in full at:
-https://xiph.org/flac/ogg_mapping.html. Added more strict checking
-for entire header.
-
-Upstream-Status: Backport
-[https://github.com/taglib/taglib/pull/869/commits/272648ccfcccae30e002ccf34a22e075dd477278]
-
-CVE: CVE-2018-11439
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- taglib/ogg/flac/oggflacfile.cpp | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/taglib/ogg/flac/oggflacfile.cpp b/taglib/ogg/flac/oggflacfile.cpp
-index 53d0450..07ea9dc 100644
---- a/taglib/ogg/flac/oggflacfile.cpp
-+++ b/taglib/ogg/flac/oggflacfile.cpp
-@@ -231,11 +231,21 @@ void Ogg::FLAC::File::scan()
- 
-   if(!metadataHeader.startsWith("fLaC"))  {
-     // FLAC 1.1.2+
-+    // See https://xiph.org/flac/ogg_mapping.html for the header specification.
-+    if(metadataHeader.size() < 13)
-+      return;
-+
-+    if(metadataHeader[0] != 0x7f)
-+      return;
-+
-     if(metadataHeader.mid(1, 4) != "FLAC")
-       return;
- 
--    if(metadataHeader[5] != 1)
--      return; // not version 1
-+    if(metadataHeader[5] != 1 && metadataHeader[6] != 0)
-+      return; // not version 1.0
-+
-+    if(metadataHeader.mid(9, 4) != "fLaC")
-+      return;
- 
-     metadataHeader = metadataHeader.mid(13);
-   }
--- 
-2.7.4
-
diff --git a/meta/recipes-support/taglib/taglib_1.11.1.bb b/meta/recipes-support/taglib/taglib_1.12.bb
similarity index 85%
rename from meta/recipes-support/taglib/taglib_1.11.1.bb
rename to meta/recipes-support/taglib/taglib_1.12.bb
index 165bccadc1..efa56253bb 100644
--- a/meta/recipes-support/taglib/taglib_1.11.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.12.bb
@@ -9,13 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz \
-           file://CVE-2017-12678.patch \
-           file://CVE-2018-11439.patch \
-          "
+SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "cee7be0ccfc892fa433d6c837df9522a"
-SRC_URI[sha256sum] = "b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b"
+SRC_URI[md5sum] = "4313ed2671234e029b7af8f97c84e9af"
+SRC_URI[sha256sum] = "7fccd07669a523b07a15bd24c8da1bbb92206cb19e9366c3692af3d79253b703"
 
 UPSTREAM_CHECK_URI = "http://github.com/taglib/taglib/releases/"
 
-- 
2.25.1

