Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id A78C17459C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 14:13:02 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id b17-v6so5555647pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RYWIYxrkBfnPXeiu8cKRvsMVoGy5Rji7rhBx53C7pwM=;
	b=vQJJ139cwItHJKyuvbYZgfCtPLI9GR4wkak0ykgYUqrbc6BOYmj2qSEHnLgMCbtaSK
	oXfgnBx7SsSC/uBUwa6vYmZb2moSVDnvsoaPAA+riMKS0S4Rh9AJFTc5O0PheXsa65w1
	DsDY4OqraQUeM7/fO5O23bj+XRPcyqckrYrXTD7eJEMZ89NIjOewvny/4dWJ8uqTzGVb
	RpE42KJVaSJzFHy3Bqodt8YvnQHT0b54u798gR5jIe7ubwa7kxzMabARjJBP/G8mwO2m
	jmw3l9cEWbug5x+4HC/cK336/ZGTAo/ij+86BBwDfRbY2iuYIKHIfg7cw7IVMrDNAVUv
	14Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RYWIYxrkBfnPXeiu8cKRvsMVoGy5Rji7rhBx53C7pwM=;
	b=VPJm4Pctq1KXvu1BLd2qMHsgb4DZeCpATSU81e57IAe18I+nTsHcdAEOt9U1ayJMZN
	BXTKx8T2VQbt9UUrZ+WLQrKb82coOND6O7RJrgDy6qtqYLnxZ34VOIWQgNRA/joFC5hi
	U/ZznEyVSG97jaU/NkZsQM0+VGSvOrAPBhjYcgNFBVB7SjcIGCQrt5UTdtgZag7e9gWT
	kGJMGAbSnT32v7A6HozpGweYlUnDgyOi7cfIZJMrlGqVpRwIa/6lTGJWkrQ1XGhLbgnE
	f5H2Q/6xybsOMsGISOk+oRt/4K1NKnGLOJVRus58e2y2EHSE40Y4U1DdSbWBTgpVPZFX
	vYjg==
X-Gm-Message-State: APt69E2XJ4G8A/eOPRB8LNrAwc3Ml5PiKGh094ESU+CEaPcBspO0Syx2
	lH4yCyyQiD7QhtSTcMZ9HUg=
X-Google-Smtp-Source: AAOMgpcjuRNv1Yuw17BBVb6+IYj3M8NoSda8AbN1hy3+Wa3cfnldQpTQv4TNyBWYHdfA+RIRUzxtlQ==
X-Received: by 2002:a62:152:: with SMTP id 79-v6mr6693056pfb.74.1530799983623; 
	Thu, 05 Jul 2018 07:13:03 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:840a:e42e:9641:f8d8])
	by smtp.gmail.com with ESMTPSA id
	s2-v6sm9639509pfh.186.2018.07.05.07.13.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jul 2018 07:13:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 07:13:02 -0700
Message-Id: <1530799982-4178-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] nss: update to 3.38
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
X-List-Received-Date: Thu, 05 Jul 2018 14:13:02 -0000

remove patch now included in release.
includes: CVE-2018-0495

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-Build-FStar.c-when-not-building-with-int.patch | 112 ---------------------
 .../nss/{nss_3.37.1.bb => nss_3.38.bb}             |   5 +-
 2 files changed, 2 insertions(+), 115 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
 rename meta/recipes-support/nss/{nss_3.37.1.bb => nss_3.38.bb} (97%)

diff --git a/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch b/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
deleted file mode 100644
index f147923..0000000
--- a/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-From fe5fd11f3f02d3625b37f8e3c592e5c3e84c1798 Mon Sep 17 00:00:00 2001
-From: Mike Hommey <mh@glandium.org>
-Date: Sun, 27 May 2018 16:20:00 +0200
-Subject: [PATCH] Bug 1432455 - Build FStar.c when not building with int128
- support. r=fkiefer
-
---HG--
-extra : amend_source : b3f739de2f592ecb9ae1f1ce5ee4fb0e04df22cb
-
-Upstream-Status: Backport
-https://hg.mozilla.org/projects/nss/rev/2209bddb98b8d105159998b9be91a155aa6bd283
-
-NSS bug https://bugzilla.mozilla.org/show_bug.cgi?format=default&id=1459739
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
----
- lib/freebl/Makefile         |  6 +++++-
- lib/freebl/freebl.gyp       | 29 +++++++++++++++++------------
- lib/freebl/freebl_base.gypi |  4 +++-
- 3 files changed, 25 insertions(+), 14 deletions(-)
-
-Index: nss-3.37.1/nss/lib/freebl/Makefile
-===================================================================
---- nss-3.37.1.orig/nss/lib/freebl/Makefile
-+++ nss-3.37.1/nss/lib/freebl/Makefile
-@@ -541,12 +541,16 @@ ifeq (,$(filter-out i386 x386 x86 x86_64
-     # All intel architectures get the 64 bit version
-     # With custom uint128 if necessary (faster than generic 32 bit version).
-     ECL_SRCS += curve25519_64.c
--    VERIFIED_SRCS += Hacl_Curve25519.c FStar.c
-+    VERIFIED_SRCS += Hacl_Curve25519.c
- else
-     # All non intel architectures get the generic 32 bit implementation (slow!)
-     ECL_SRCS += curve25519_32.c
- endif
- 
-+ifndef HAVE_INT128_SUPPORT
-+    VERIFIED_SRCS += FStar.c
-+endif
-+
- #######################################################################
- # (5) Execute "global" rules. (OPTIONAL)                              #
- #######################################################################
-Index: nss-3.37.1/nss/lib/freebl/freebl.gyp
-===================================================================
---- nss-3.37.1.orig/nss/lib/freebl/freebl.gyp
-+++ nss-3.37.1/nss/lib/freebl/freebl.gyp
-@@ -277,18 +277,10 @@
-           'MP_IS_LITTLE_ENDIAN',
-          ],
-       }],
--      [ 'OS!="win"', {
--        'conditions': [
--          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
--            'defines': [
--              # The Makefile does version-tests on GCC, but we're not doing that here.
--              'HAVE_INT128_SUPPORT',
--            ],
--          }, {
--            'defines': [
--              'KRML_NOUINT128',
--            ],
--          }],
-+      [ 'have_int128_support==1', {
-+        'defines': [
-+          # The Makefile does version-tests on GCC, but we're not doing that here.
-+          'HAVE_INT128_SUPPORT',
-         ],
-       }, {
-         'defines': [
-@@ -350,5 +342,18 @@
-   },
-   'variables': {
-     'module': 'nss',
-+    'conditions': [
-+      [ 'OS!="win"', {
-+        'conditions': [
-+          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
-+            'have_int128_support%': 1,
-+          }, {
-+            'have_int128_support%': 0,
-+          }],
-+        ],
-+      }, {
-+        'have_int128_support%': 0,
-+      }],
-+    ],
-   }
- }
-Index: nss-3.37.1/nss/lib/freebl/freebl_base.gypi
-===================================================================
---- nss-3.37.1.orig/nss/lib/freebl/freebl_base.gypi
-+++ nss-3.37.1/nss/lib/freebl/freebl_base.gypi
-@@ -60,7 +60,6 @@
-     'shvfy.c',
-     'sysrand.c',
-     'tlsprfalg.c',
--    'verified/FStar.c',
-   ],
-   'conditions': [
-     [ 'OS=="linux" or OS=="android"', {
-@@ -220,6 +219,9 @@
-         }],
-       ],
-     }],
-+    [ 'have_int128_support==0', {
-+        'sources': [ 'verified/FStar.c' ],
-+    }],
-   ],
-  'ldflags': [
-    '-Wl,-Bsymbolic'
diff --git a/meta/recipes-support/nss/nss_3.37.1.bb b/meta/recipes-support/nss/nss_3.38.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.37.1.bb
rename to meta/recipes-support/nss/nss_3.38.bb
index 0e8b5be..f3e5170 100644
--- a/meta/recipes-support/nss/nss_3.37.1.bb
+++ b/meta/recipes-support/nss/nss_3.38.bb
@@ -25,11 +25,10 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch \
            "
 
-SRC_URI[md5sum] = "e9526d7217d02afa96b90b89924c38df"
-SRC_URI[sha256sum] = "097b30e436479ad737b3703b25b6198b6513e202731085c6f097d8853dd20405"
+SRC_URI[md5sum] = "ac9065460a7634ba8eb0f942f404e773"
+SRC_URI[sha256sum] = "2c643d3c08d6935f4d325f40743719b6990aa25a79ec2f8f712c99d086672f62"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


