Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 663A5719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 02:32:00 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id h41so10617475ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+i45IPL4qSfxsLgBSa1aM/STdZGOPU4zKk68SGDOZOw=;
	b=L11Z0z3AQV8cLD0LBHkxNDsYk8RnI1VgdWH61B1o3bFl2o7WT8wAo4ZvGxaUKQoP7P
	poN1d3UTbibH0T6QbvXzW9QYGe5jAk0Yq8VRzdxhhEEu4SDH67uALjTj7QCbKxD1nPVQ
	WQYrpDfpi2dY5a6S43UrDJyku7d4E/txnbfVNH7ww/v2cC2Fv4XKtRYFfeluUesaEy3l
	neyf/Q5E3y0ogWbWdXID6c6ZhKpvkbGXyxcYsZEZsTtREOsCStc1m2Z7Zr6jG4k07Rb+
	ZnLFL1pCBVWhlU39nOHR6VW2IJsXgqZoEAfcZMROjgtcHfZsRBjbMxxE6KevWENjMfs+
	wBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+i45IPL4qSfxsLgBSa1aM/STdZGOPU4zKk68SGDOZOw=;
	b=TN4IPxJOtUM/Ame2+0YseO5AIepbUVk4EFwnVQboyJk+doATWyArNQhdKaU+locd/g
	1WvA23ThSwLrtNUXPbNCjbwtsj+Qc98x8auhRpW05dTKpn93x81rMJeohBf/l7T41/YK
	IfN17RVyL1qlMPDXRKCrxRdj60zAyc6shCXNDo6QV3eaSEP/rdiaz9pXs/lRTy1XNP8E
	RJsnYhhtectlqZNFL6ofeqcHUhP6NIbFU9FSK5oFKF9Ug4mJwpW8ktwOQfj7uD423zh6
	3WA0LJszgDCYFr7bF6CDw++UxjEUsSxefJ2sHKMVJNlufeCr5grw9qM2DD4wzca1lCKX
	iToQ==
X-Gm-Message-State: AN3rC/6W0Pupx/LEU/0tGW1hbujUjmnHg/fykmJxasmGl9y1fanthw4g
	fwSda8O/OO0JTg==
X-Received: by 10.99.218.69 with SMTP id l5mr5842948pgj.219.1492655521246;
	Wed, 19 Apr 2017 19:32:01 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r73sm6790312pfa.65.2017.04.19.19.31.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 19:32:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:31:44 -0700
Message-Id: <20170420023147.1868-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420023147.1868-1-raj.khem@gmail.com>
References: <20170420023147.1868-1-raj.khem@gmail.com>
Subject: [PATCH 2/5] json-c: Upgrade to 0.12.1 release
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
X-List-Received-Date: Thu, 20 Apr 2017 02:32:00 -0000

Backport fix for gcc7 warning along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-FALLTHRU-comment-to-handle-GCC7-warnings.patch | 74 ++++++++++++++++++++++
 .../0001-Link-against-libm-when-needed.patch       | 53 ----------------
 .../0001-json_tokener-requires-INF-and-NAN.patch   | 37 -----------
 .../json-c/{json-c_0.12.bb => json-c_0.12.1.bb}    | 18 +++---
 4 files changed, 83 insertions(+), 99 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch
 delete mode 100644 meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
 rename meta/recipes-devtools/json-c/{json-c_0.12.bb => json-c_0.12.1.bb} (70%)

diff --git a/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch b/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
new file mode 100644
index 00000000000..537be5e6d29
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch
@@ -0,0 +1,74 @@
+From 7b24f8bd95ad4f7d00c93ca2ad998c14a0266dbe Mon Sep 17 00:00:00 2001
+From: marxin <mliska@suse.cz>
+Date: Tue, 21 Mar 2017 08:42:11 +0100
+Subject: [PATCH] Add FALLTHRU comment to handle GCC7 warnings.
+
+---
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ json_object.c  |  1 +
+ json_tokener.c |  1 +
+ linkhash.c     | 22 +++++++++++-----------
+ 3 files changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/json_object.c b/json_object.c
+index 6cc73bc..77e8b21 100644
+--- a/json_object.c
++++ b/json_object.c
+@@ -552,6 +552,7 @@ int64_t json_object_get_int64(struct json_object *jso)
+     return jso->o.c_boolean;
+   case json_type_string:
+ 	if (json_parse_int64(jso->o.c_string.str, &cint) == 0) return cint;
++	/* FALLTHRU */
+   default:
+     return 0;
+   }
+diff --git a/json_tokener.c b/json_tokener.c
+index 9a76293..ae7b1ae 100644
+--- a/json_tokener.c
++++ b/json_tokener.c
+@@ -305,6 +305,7 @@ struct json_object* json_tokener_parse_ex(struct json_tokener *tok,
+             tok->err = json_tokener_error_parse_unexpected;
+             goto out;
+         }
++	/* FALLTHRU */
+       case '"':
+ 	state = json_tokener_state_string;
+ 	printbuf_reset(tok->pb);
+diff --git a/linkhash.c b/linkhash.c
+index 712c387..74e3b0f 100644
+--- a/linkhash.c
++++ b/linkhash.c
+@@ -376,17 +376,17 @@ static uint32_t hashlittle( const void *key, size_t length, uint32_t initval)
+     /*-------------------------------- last block: affect all 32 bits of (c) */
+     switch(length)                   /* all the case statements fall through */
+     {
+-    case 12: c+=((uint32_t)k[11])<<24;
+-    case 11: c+=((uint32_t)k[10])<<16;
+-    case 10: c+=((uint32_t)k[9])<<8;
+-    case 9 : c+=k[8];
+-    case 8 : b+=((uint32_t)k[7])<<24;
+-    case 7 : b+=((uint32_t)k[6])<<16;
+-    case 6 : b+=((uint32_t)k[5])<<8;
+-    case 5 : b+=k[4];
+-    case 4 : a+=((uint32_t)k[3])<<24;
+-    case 3 : a+=((uint32_t)k[2])<<16;
+-    case 2 : a+=((uint32_t)k[1])<<8;
++    case 12: c+=((uint32_t)k[11])<<24; /* FALLTHRU */
++    case 11: c+=((uint32_t)k[10])<<16; /* FALLTHRU */
++    case 10: c+=((uint32_t)k[9])<<8; /* FALLTHRU */
++    case 9 : c+=k[8]; /* FALLTHRU */
++    case 8 : b+=((uint32_t)k[7])<<24; /* FALLTHRU */
++    case 7 : b+=((uint32_t)k[6])<<16; /* FALLTHRU */
++    case 6 : b+=((uint32_t)k[5])<<8; /* FALLTHRU */
++    case 5 : b+=k[4]; /* FALLTHRU */
++    case 4 : a+=((uint32_t)k[3])<<24; /* FALLTHRU */
++    case 3 : a+=((uint32_t)k[2])<<16; /* FALLTHRU */
++    case 2 : a+=((uint32_t)k[1])<<8; /* FALLTHRU */
+     case 1 : a+=k[0];
+              break;
+     case 0 : return c;
+-- 
+2.12.2
+
diff --git a/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch b/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch
deleted file mode 100644
index bfe9d723135..00000000000
--- a/meta/recipes-devtools/json-c/json-c/0001-Link-against-libm-when-needed.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 93582ad85ef48c18ac12f00a9a9e124989b1fcab Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Fri, 1 May 2015 12:52:18 +0200
-Subject: [PATCH] Link against libm when needed
-
-In certain C libraries (e.g uClibc), isnan() and related functions are
-implemented in libm, so json-c needs to link against it. This commit
-therefore adds an AC_TRY_LINK() test to check whether a program
-calling isnan() can be properly linked with no special flags. If not,
-we assume linking against libm is needed.
-
-The json-c.pc.in file is also adjusted so that in the case of static
-linking against json-c, -lm is also used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
-Upstream-Status: Backport
-
- configure.ac | 4 ++++
- json-c.pc.in | 3 ++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c50f81b..30e7174 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,6 +50,10 @@ AC_CHECK_DECLS([isinf], [], [], [[#include <math.h>]])
- AC_CHECK_DECLS([_isnan], [], [], [[#include <float.h>]])
- AC_CHECK_DECLS([_finite], [], [], [[#include <float.h>]])
- 
-+if test "$ac_cv_have_decl_isnan" = "yes" ; then
-+   AC_TRY_LINK([#include <math.h>], [float f = 0.0; return isnan(f)], [], [LIBS="$LIBS -lm"])
-+fi
-+
- #check if .section.gnu.warning accepts long strings (for __warn_references)
- AC_LANG_PUSH([C])
- 
-diff --git a/json-c.pc.in b/json-c.pc.in
-index 037739d..05bfbc8 100644
---- a/json-c.pc.in
-+++ b/json-c.pc.in
-@@ -6,6 +6,7 @@ includedir=@includedir@
- Name: json-c
- Description: JSON implementation in C
- Version: @VERSION@
--Requires: 
-+Requires:
-+Libs.private: @LIBS@
- Libs:  -L${libdir} -ljson-c
- Cflags: -I${includedir}/json-c
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch b/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
deleted file mode 100644
index d29d9118dc4..00000000000
--- a/meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9be71700eb580c815688584a64621a38867c3fdd Mon Sep 17 00:00:00 2001
-From: James Myatt <james.myatt@tessella.com>
-Date: Thu, 5 Feb 2015 15:57:14 +0000
-Subject: [PATCH] json_tokener requires INF and NAN
-
----
-Upstream-Status: Backport
-
- json_tokener.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: json-c-0.12/json_tokener.c
-===================================================================
---- json-c-0.12.orig/json_tokener.c
-+++ json-c-0.12/json_tokener.c
-@@ -16,6 +16,7 @@
- #include "config.h"
- 
- #include <math.h>
-+#include "math_compat.h"
- #include <stdio.h>
- #include <stdlib.h>
- #include <stddef.h>
-@@ -352,12 +353,10 @@ struct json_object* json_tokener_parse_e
- 
-     case json_tokener_state_inf: /* aka starts with 'i' */
-       {
--	int size;
--	int size_inf;
-+	size_t size_inf;
- 	int is_negative = 0;
- 
- 	printbuf_memappend_fast(tok->pb, &c, 1);
--	size = json_min(tok->st_pos+1, json_null_str_len);
- 	size_inf = json_min(tok->st_pos+1, json_inf_str_len);
- 	char *infbuf = tok->pb->buf;
- 	if (*infbuf == '-')
diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.1.bb
similarity index 70%
rename from meta/recipes-devtools/json-c/json-c_0.12.bb
rename to meta/recipes-devtools/json-c/json-c_0.12.1.bb
index a15455c9bfb..5aa4164f2bb 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.1.bb
@@ -5,25 +5,25 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
 SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           file://0001-json_tokener-requires-INF-and-NAN.patch \
-           file://0001-Link-against-libm-when-needed.patch \
-          "
-
-SRC_URI[md5sum] = "3ca4bbb881dfc4017e8021b5e0a8c491"
-SRC_URI[sha256sum] = "000c01b2b3f82dcb4261751eb71f1b084404fb7d6a282f06074d3c17078b9f3f"
+           file://0001-Add-FALLTHRU-comment-to-handle-GCC7-warnings.patch \
+           "
+SRC_URI[md5sum] = "55f7853f7d8cf664554ce3fa71bf1c7d"
+SRC_URI[sha256sum] = "2a136451a7932d80b7d197b10441e26e39428d67b1443ec43bbba824705e1123"
 
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
 # json-c releases page is fetching the list of releases in some weird XML format
 # from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
 #UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
-RECIPE_UPSTREAM_VERSION = "0.12"
-RECIPE_UPSTREAM_DATE = "Apr 11, 2014"
-CHECK_DATE = "Dec 04, 2015"
+RECIPE_UPSTREAM_VERSION = "0.12.1"
+RECIPE_UPSTREAM_DATE = "Jun 07, 2016"
+CHECK_DATE = "Apr 19, 2017"
 
 RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
+EXTRA_OECONF = "--disable-rpath --enable-rdrand"
+
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.12.2


