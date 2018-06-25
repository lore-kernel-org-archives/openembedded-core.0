Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8437F745BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 02:33:34 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id a7-v6so6073436plp.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=2BOw4OBxG4PTQBKUBU+W/p9atUW6G2bbMBrXuMtiwHk=;
	b=IRCN20EJ3QBW1srmOznDo89P+mtSE85NBRwcmhngNmw6+kj+go0gwDXBeAozIOz/EI
	+Qj16gT1A32qRrNn9VVFGTz2bhyxatUla6IyErU/YXJ2MvPs8+62vilt2eD1teB62zqg
	NdGbSL+DAYmmqI8zmOsGV866r/FtPkaiyzTV7+XG0Rqx9DIwaEE6wWCzFNPdxMJVtow+
	jJuH+/+PLw/gLfKmzeIOTlwlCHw+W+9g2ck8d2Jpce5vKDw2mCDhnapf6NzjYm9snuji
	oj7BoHBAXM2rBzMPYRjtFe8eM18FMJuFDaboPVGndOdiCd3TtgHpZJG5veRs+nKv4GAm
	+iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=2BOw4OBxG4PTQBKUBU+W/p9atUW6G2bbMBrXuMtiwHk=;
	b=McEJf7pc0Db0cBmv4pUpiTvOGFv0lZ6Zf0TRQlsj82fYkhLzHFfw38lsG8PpzAoXfM
	MuKIIqGtbHjGBFd9lEKVmqgAgfYm9/Eu0+E0JJ6ITSb9vrmQ7BbYaLMHKssW4Nss4VTJ
	5wfFjX1fsBQ31P4U9Umb/8e5y5ts5yM3Adn1+oQP9087JAoEC0Wp7P7GujbwNAhJg7Jm
	4jpWVmcnKlLQyOQ6jXK9UeHW7zGcasQiMCYYm0044wStdCu/EE+lTTOnWIvJwKK7dQ6m
	lXPnmh8Ecu0l8ggh0AQZS5nYepWt6oKMnRnmZxVvUFwiA3YhyAyrHT2adhn3f2expxXn
	ZlzQ==
X-Gm-Message-State: APt69E2d02tw+jrGNwwjkGnof8cr/FYaOPA6lTWtBGbQsIrEmN15Cj3w
	/zlVHdFDdJ4HfShTOfA80y0=
X-Google-Smtp-Source: ADUXVKK/QHnwHsHKqbf12VUburtIv7o+Zcceul5ZxCGnC/kJRqdUIyr+5CtAjlhmX9FsmBa5RaLV7Q==
X-Received: by 2002:a17:902:a508:: with SMTP id
	s8-v6mr10685558plq.223.1529894015517; 
	Sun, 24 Jun 2018 19:33:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:89c3:4e4b:df9b:b7de])
	by smtp.gmail.com with ESMTPSA id
	h12-v6sm19551195pfi.114.2018.06.24.19.33.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Jun 2018 19:33:34 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2018 19:33:33 -0700
Message-Id: <1529894013-32643-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V2][PATCH] nss: update to 3.37.1
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
X-List-Received-Date: Mon, 25 Jun 2018 02:33:34 -0000

remove Fix-compilation-for-X32.patch as a solution simular is included in update.

notable changes:
The TLS 1.3 implementation was updated to Draft 28.
The CA certificates list was updated to version 2.24.

refresh patches
fix 32 bit build error nss bug: https://bugzilla.mozilla.org/show_bug.cgi?format=default&id=1459739

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...tics_1.9.0.bb => xf86-input-synaptics_1.9.1.bb} |   4 +-
 ...-Build-FStar.c-when-not-building-with-int.patch | 112 +++++++++++++++++++++
 .../nss/nss/Fix-compilation-for-X32.patch          |  33 ------
 .../nss/nss/disable-Wvarargs-with-clang.patch      |   8 +-
 .../recipes-support/nss/nss/pqg.c-ULL_addend.patch |   8 +-
 .../nss/{nss_3.36.1.bb => nss_3.37.1.bb}           |   6 +-
 6 files changed, 125 insertions(+), 46 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.9.0.bb => xf86-input-synaptics_1.9.1.bb} (79%)
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
 delete mode 100644 meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
 rename meta/recipes-support/nss/{nss_3.36.1.bb => nss_3.37.1.bb} (97%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
index d327a3b..dc31890 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-synaptics_1.9.1.bb
@@ -10,7 +10,7 @@ advanced features of the touchpad to become available."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=55aacd3535a741824955c5eb8f061398"
 
-SRC_URI[md5sum] = "58e5b7722a402114093bf193962d1e3a"
-SRC_URI[sha256sum] = "afba3289d7a40217a19d90db98ce181772f9ca6d77e1898727b0afcf02073b5a"
+SRC_URI[md5sum] = "cfb79d3c975151f9bbf30b727c260cb9"
+SRC_URI[sha256sum] = "7af83526eff1c76e8b9e1553b34245c203d029028d8044dd9dcf71eef1001576"
 
 DEPENDS += "libxi mtdev libxtst libevdev"
diff --git a/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch b/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
new file mode 100644
index 0000000..f147923
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch
@@ -0,0 +1,112 @@
+From fe5fd11f3f02d3625b37f8e3c592e5c3e84c1798 Mon Sep 17 00:00:00 2001
+From: Mike Hommey <mh@glandium.org>
+Date: Sun, 27 May 2018 16:20:00 +0200
+Subject: [PATCH] Bug 1432455 - Build FStar.c when not building with int128
+ support. r=fkiefer
+
+--HG--
+extra : amend_source : b3f739de2f592ecb9ae1f1ce5ee4fb0e04df22cb
+
+Upstream-Status: Backport
+https://hg.mozilla.org/projects/nss/rev/2209bddb98b8d105159998b9be91a155aa6bd283
+
+NSS bug https://bugzilla.mozilla.org/show_bug.cgi?format=default&id=1459739
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ lib/freebl/Makefile         |  6 +++++-
+ lib/freebl/freebl.gyp       | 29 +++++++++++++++++------------
+ lib/freebl/freebl_base.gypi |  4 +++-
+ 3 files changed, 25 insertions(+), 14 deletions(-)
+
+Index: nss-3.37.1/nss/lib/freebl/Makefile
+===================================================================
+--- nss-3.37.1.orig/nss/lib/freebl/Makefile
++++ nss-3.37.1/nss/lib/freebl/Makefile
+@@ -541,12 +541,16 @@ ifeq (,$(filter-out i386 x386 x86 x86_64
+     # All intel architectures get the 64 bit version
+     # With custom uint128 if necessary (faster than generic 32 bit version).
+     ECL_SRCS += curve25519_64.c
+-    VERIFIED_SRCS += Hacl_Curve25519.c FStar.c
++    VERIFIED_SRCS += Hacl_Curve25519.c
+ else
+     # All non intel architectures get the generic 32 bit implementation (slow!)
+     ECL_SRCS += curve25519_32.c
+ endif
+ 
++ifndef HAVE_INT128_SUPPORT
++    VERIFIED_SRCS += FStar.c
++endif
++
+ #######################################################################
+ # (5) Execute "global" rules. (OPTIONAL)                              #
+ #######################################################################
+Index: nss-3.37.1/nss/lib/freebl/freebl.gyp
+===================================================================
+--- nss-3.37.1.orig/nss/lib/freebl/freebl.gyp
++++ nss-3.37.1/nss/lib/freebl/freebl.gyp
+@@ -277,18 +277,10 @@
+           'MP_IS_LITTLE_ENDIAN',
+          ],
+       }],
+-      [ 'OS!="win"', {
+-        'conditions': [
+-          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
+-            'defines': [
+-              # The Makefile does version-tests on GCC, but we're not doing that here.
+-              'HAVE_INT128_SUPPORT',
+-            ],
+-          }, {
+-            'defines': [
+-              'KRML_NOUINT128',
+-            ],
+-          }],
++      [ 'have_int128_support==1', {
++        'defines': [
++          # The Makefile does version-tests on GCC, but we're not doing that here.
++          'HAVE_INT128_SUPPORT',
+         ],
+       }, {
+         'defines': [
+@@ -350,5 +342,18 @@
+   },
+   'variables': {
+     'module': 'nss',
++    'conditions': [
++      [ 'OS!="win"', {
++        'conditions': [
++          [ 'target_arch=="x64" or target_arch=="arm64" or target_arch=="aarch64"', {
++            'have_int128_support%': 1,
++          }, {
++            'have_int128_support%': 0,
++          }],
++        ],
++      }, {
++        'have_int128_support%': 0,
++      }],
++    ],
+   }
+ }
+Index: nss-3.37.1/nss/lib/freebl/freebl_base.gypi
+===================================================================
+--- nss-3.37.1.orig/nss/lib/freebl/freebl_base.gypi
++++ nss-3.37.1/nss/lib/freebl/freebl_base.gypi
+@@ -60,7 +60,6 @@
+     'shvfy.c',
+     'sysrand.c',
+     'tlsprfalg.c',
+-    'verified/FStar.c',
+   ],
+   'conditions': [
+     [ 'OS=="linux" or OS=="android"', {
+@@ -220,6 +219,9 @@
+         }],
+       ],
+     }],
++    [ 'have_int128_support==0', {
++        'sources': [ 'verified/FStar.c' ],
++    }],
+   ],
+  'ldflags': [
+    '-Wl,-Bsymbolic'
diff --git a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch b/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
deleted file mode 100644
index 80b8690..0000000
--- a/meta/recipes-support/nss/nss/Fix-compilation-for-X32.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c8eadfcdfbc1d5a4799e9a264b0f859cb5954c05 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 11:40:47 -0700
-Subject: [PATCH 7/7] Fix compilation for X32
-
-X32 uses 32-bit pointers, not 64-bit.
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Upstream-Status: Pending
----
- nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-index 2a3301e..d4ade41 100644
---- a/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-+++ b/nss/lib/freebl/poly1305-donna-x64-sse2-incremental-source.c
-@@ -87,7 +87,11 @@ static poly1305_state_internal INLINE
-     *
-     poly1305_aligned_state(poly1305_state *state)
- {
-+#ifdef __ILP32__
-+    return (poly1305_state_internal *)(((uint32_t)state + 63) & ~63);
-+#else
-     return (poly1305_state_internal *)(((uint64_t)state + 63) & ~63);
-+#endif
- }
- 
- /* copy 0-63 bytes */
--- 
-2.8.0
-
diff --git a/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch b/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
index 86b1b60..de812d2 100644
--- a/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
+++ b/meta/recipes-support/nss/nss/disable-Wvarargs-with-clang.patch
@@ -18,11 +18,11 @@ for more details
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
 
-Index: nss-3.24/nss/coreconf/Werror.mk
+Index: nss-3.37.1/nss/coreconf/Werror.mk
 ===================================================================
---- nss-3.24.orig/nss/coreconf/Werror.mk
-+++ nss-3.24/nss/coreconf/Werror.mk
-@@ -54,7 +54,7 @@ ifndef WARNING_CFLAGS
+--- nss-3.37.1.orig/nss/coreconf/Werror.mk
++++ nss-3.37.1/nss/coreconf/Werror.mk
+@@ -56,7 +56,7 @@ ifndef WARNING_CFLAGS
      ifdef CC_IS_CLANG
        # -Qunused-arguments : clang objects to arguments that it doesn't understand
        #    and fixing this would require rearchitecture
diff --git a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
index 9942bf1..3a817fa 100644
--- a/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
+++ b/meta/recipes-support/nss/nss/pqg.c-ULL_addend.patch
@@ -6,11 +6,11 @@ pqg.c:339:16: error: comparison of constant 18446744073709551615 with expression
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: nss-3.24/nss/lib/freebl/pqg.c
+Index: nss-3.37.1/nss/lib/freebl/pqg.c
 ===================================================================
---- nss-3.24.orig/nss/lib/freebl/pqg.c
-+++ nss-3.24/nss/lib/freebl/pqg.c
-@@ -322,8 +322,8 @@ generate_h_candidate(SECItem *hit, mp_in
+--- nss-3.37.1.orig/nss/lib/freebl/pqg.c
++++ nss-3.37.1/nss/lib/freebl/pqg.c
+@@ -326,8 +326,8 @@ generate_h_candidate(SECItem *hit, mp_in
  
  static SECStatus
  addToSeed(const SECItem *seed,
diff --git a/meta/recipes-support/nss/nss_3.36.1.bb b/meta/recipes-support/nss/nss_3.37.1.bb
similarity index 97%
rename from meta/recipes-support/nss/nss_3.36.1.bb
rename to meta/recipes-support/nss/nss_3.37.1.bb
index f855538..29db304 100644
--- a/meta/recipes-support/nss/nss_3.36.1.bb
+++ b/meta/recipes-support/nss/nss_3.37.1.bb
@@ -25,11 +25,11 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://disable-Wvarargs-with-clang.patch \
            file://pqg.c-ULL_addend.patch \
-           file://Fix-compilation-for-X32.patch \
+           file://0001-Bug-1432455-Build-FStar.c-when-not-building-with-int.patch \
            "
 
-SRC_URI[md5sum] = "814d8fe3ec89006cf62078e2a56cf2f9"
-SRC_URI[sha256sum] = "6025441d528ff6a7f1a4b673b6ee7d3540731ada3f78d5acd5c3b3736b222bff"
+SRC_URI[md5sum] = "e9526d7217d02afa96b90b89924c38df"
+SRC_URI[sha256sum] = "097b30e436479ad737b3703b25b6198b6513e202731085c6f097d8853dd20405"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.7.4


