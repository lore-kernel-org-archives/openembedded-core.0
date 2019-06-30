Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id ECE9E7E62C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 22:38:48 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id a21so11035842ljh.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 15:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=AtuybpOS4S4UZZBwLxgq8rxuEbjyCBYWpuqZPue18FY=;
	b=zSlcPHrt6d3RVVC/Xiu/1/JCK42F8OVNFpwLd3o1iKgwDI/FRoeYpViTMT13eWX+TV
	uDT9uEOrUcgEHv+DGWn1lW8Utp4v6KHugzFKoOn8VuFEfUhwPuO5ujMG5EH4WiqFCwlG
	gfE2fumKFykWMuOytUGtEMl3MlWXxpnIO4I7hE1U92xAXna5D4Zt3CNl5iXJesxyXDTY
	fm/3MuEcxH2VanMvM6Lirx017Wun1DFxhiofzG2ZTwC3/w7ALFPjiJ6qMBfqg6zk59C9
	5ALDH5Zr9dbRL+B6PQcfgZ514BbFsekRY9VJGUFb5PTwDlkUwLA44PFgSTmZg7mYGW4n
	vXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AtuybpOS4S4UZZBwLxgq8rxuEbjyCBYWpuqZPue18FY=;
	b=WewEpG4dv6P2Z8md61CxeSt6RchkFqi1NtmLuHZoD1ABhjy10rzn/cNtL4DM5HeQys
	/HMZ/d/6bHePN5O8gz/jvVLajxFHacZugZ3MPQnXhbtMFJGCrUVbhY7ofdUsyHX/V6SJ
	2GKIlihA+ka3JJzGcGL9iysxYrx41J0hOvmxtWJNxtksfgesOmejHTLnmMJFIHw9FBFf
	SXEPdOIJh3o0msPk7mR8wREwYfoNU0y/JYpp7XvsAy+S1KPRaYs+GfgHUdWhLunRGbMz
	2dXh8wK4JrmJAVlTDVnBSu0InkLzsMXNY4Vnch1K973GBbeNkyWE760pqOysCTLiMMQE
	dctA==
X-Gm-Message-State: APjAAAWAJZae8T8XV2uCo+Ji6qv1uWQ7/6MIlir8W0XgC25yApBgnRSg
	GqanX6HFz5k3pxmICm4lxaKrfvBC4cY=
X-Google-Smtp-Source: APXvYqz3FxTac6myjYOQocVTBJD/S7ytMIZeaaXRxJ+PwSfHLT+ODTxUIijQzk4d1SVu/AM17bDmmQ==
X-Received: by 2002:a2e:9b57:: with SMTP id o23mr7825022ljj.67.1561934329196; 
	Sun, 30 Jun 2019 15:38:49 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	j14sm2945961ljc.67.2019.06.30.15.38.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 30 Jun 2019 15:38:48 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 00:38:44 +0200
Message-Id: <20190630223844.3533-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] bzip2: update to 1.0.7
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
X-List-Received-Date: Sun, 30 Jun 2019 22:38:49 -0000

Removed patches were upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../bzip2/bzip2-1.0.6/CVE-2016-3189.patch     | 18 ------
 ...p2-qt-returns-0-for-corrupt-archives.patch | 55 -------------------
 .../bzip2/{bzip2-1.0.6 => bzip2}/Makefile.am  |  0
 .../bzip2/{bzip2-1.0.6 => bzip2}/configure.ac |  0
 .../bzip2/{bzip2-1.0.6 => bzip2}/run-ptest    |  0
 .../bzip2/{bzip2_1.0.6.bb => bzip2_1.0.7.bb}  | 13 ++---
 6 files changed, 4 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch
 delete mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
 rename meta/recipes-extended/bzip2/{bzip2-1.0.6 => bzip2}/Makefile.am (100%)
 rename meta/recipes-extended/bzip2/{bzip2-1.0.6 => bzip2}/configure.ac (100%)
 rename meta/recipes-extended/bzip2/{bzip2-1.0.6 => bzip2}/run-ptest (100%)
 rename meta/recipes-extended/bzip2/{bzip2_1.0.6.bb => bzip2_1.0.7.bb} (77%)

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch
deleted file mode 100644
index 1d0c3a6dd3..0000000000
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2016-3189.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Backport
-https://bugzilla.suse.com/attachment.cgi?id=681334
-
-CVE: CVE-2016-3189
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: bzip2-1.0.6/bzip2recover.c
-===================================================================
---- bzip2-1.0.6.orig/bzip2recover.c
-+++ bzip2-1.0.6/bzip2recover.c
-@@ -457,6 +457,7 @@ Int32 main ( Int32 argc, Char** argv )
-             bsPutUChar ( bsWr, 0x50 ); bsPutUChar ( bsWr, 0x90 );
-             bsPutUInt32 ( bsWr, blockCRC );
-             bsClose ( bsWr );
-+            outFile = NULL;
-          }
-          if (wrBlock >= rbCtr) break;
-          wrBlock++;
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
deleted file mode 100644
index ece90d94e6..0000000000
--- a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 8068659388127e8e63f2d2297ba2348c72b20705 Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Mon, 12 Oct 2015 03:19:51 -0400
-Subject: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
-
-"bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
-"bzip2 -qt FILE" returns 0 when this happens, although it does print out
-an error message as is does so.
-
-This has been fix by Debian, just port changes from Debian patch file
-"20-legacy.patch".
-
-Debian defect:
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=279025
-
-Fix item from changelog:
-http://archive.debian.net/changelogs/pool/main/b/bzip2/bzip2_1.0.2-7/changelog
-
-  * Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- bzip2.c | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/bzip2.c b/bzip2.c
-index 6de9d1d..f2ce668 100644
---- a/bzip2.c
-+++ b/bzip2.c
-@@ -2003,12 +2003,14 @@ IntNative main ( IntNative argc, Char *argv[] )
-             testf ( aa->name );
- 	 }
-       }
--      if (testFailsExist && noisy) {
--         fprintf ( stderr,
--           "\n"
--           "You can use the `bzip2recover' program to attempt to recover\n"
--           "data from undamaged sections of corrupted files.\n\n"
--         );
-+      if (testFailsExist) {
-+         if (noisy) {
-+            fprintf ( stderr,
-+              "\n"
-+              "You can use the `bzip2recover' program to attempt to recover\n"
-+              "data from undamaged sections of corrupted files.\n\n"
-+            );
-+         }
-          setExit(2);
-          exit(exitValue);
-       }
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
similarity index 100%
rename from meta/recipes-extended/bzip2/bzip2-1.0.6/Makefile.am
rename to meta/recipes-extended/bzip2/bzip2/Makefile.am
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac b/meta/recipes-extended/bzip2/bzip2/configure.ac
similarity index 100%
rename from meta/recipes-extended/bzip2/bzip2-1.0.6/configure.ac
rename to meta/recipes-extended/bzip2/bzip2/configure.ac
diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest b/meta/recipes-extended/bzip2/bzip2/run-ptest
similarity index 100%
rename from meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest
rename to meta/recipes-extended/bzip2/bzip2/run-ptest
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.7.bb
similarity index 77%
rename from meta/recipes-extended/bzip2/bzip2_1.0.6.bb
rename to meta/recipes-extended/bzip2/bzip2_1.0.7.bb
index 15a8e51550..02e9d9ef07 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.7.bb
@@ -6,20 +6,16 @@ HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
 LICENSE = "bzip2"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=39406315f540c69bd05b1531daedd2ae"
-PR = "r5"
 
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
-           file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
+SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
-           file://CVE-2016-3189.patch \
            "
+SRC_URI[md5sum] = "1a6a61cc867be4f3d6549037a09bf13e"
+SRC_URI[sha256sum] = "e768a87c5b1a79511499beb41500bcc4caf203726fff46a6f5f9ad27fe08ab2b"
 
-SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
-SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
-
-UPSTREAM_CHECK_URI = "https://www.sourceware.org/bzip2/"
+UPSTREAM_CHECK_URI = "https://www.sourceware.org/pub/bzip2/"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
 PACKAGES =+ "libbz2"
@@ -44,4 +40,3 @@ RDEPENDS_${PN}-ptest += "make"
 
 PROVIDES_append_class-native = " bzip2-replacement-native"
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.17.1


