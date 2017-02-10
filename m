Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC26772D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NPwV007876
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:26 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:15 -0800
Message-ID: <ae6cc9fa587d910aac072c090654d1c19f236c11.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] m4: 1.4.17 -> 1.4.18
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:25 -0000
Content-Type: text/plain

Rebased remove-gets.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/m4/{m4-1.4.17.inc => m4-1.4.18.inc} |  5 +++--
 .../m4/{m4-native_1.4.17.bb => m4-native_1.4.18.bb}       |  0
 meta/recipes-devtools/m4/m4/remove-gets.patch             | 15 ++++++++-------
 meta/recipes-devtools/m4/{m4_1.4.17.bb => m4_1.4.18.bb}   |  0
 4 files changed, 11 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/m4/{m4-1.4.17.inc => m4-1.4.18.inc} (75%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.17.bb => m4-native_1.4.18.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.17.bb => m4_1.4.18.bb} (100%)

diff --git a/meta/recipes-devtools/m4/m4-1.4.17.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
similarity index 75%
rename from meta/recipes-devtools/m4/m4-1.4.17.inc
rename to meta/recipes-devtools/m4/m4-1.4.18.inc
index 8ea4e049071..5652b743080 100644
--- a/meta/recipes-devtools/m4/m4-1.4.17.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
@@ -14,5 +14,6 @@ SRC_URI += "file://ac_config_links.patch \
 SRC_URI_append_class-target = "\
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
 	   "
-SRC_URI[md5sum] = "a5e9954b1dae036762f7b13673a2cf76"
-SRC_URI[sha256sum] = "3ce725133ee552b8b4baca7837fb772940b25e81b2a9dc92537aeaf733538c9e"
+
+SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
+SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.17.bb b/meta/recipes-devtools/m4/m4-native_1.4.18.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4-native_1.4.17.bb
rename to meta/recipes-devtools/m4/m4-native_1.4.18.bb
diff --git a/meta/recipes-devtools/m4/m4/remove-gets.patch b/meta/recipes-devtools/m4/m4/remove-gets.patch
index effb353f11a..abe82f3b2de 100644
--- a/meta/recipes-devtools/m4/m4/remove-gets.patch
+++ b/meta/recipes-devtools/m4/m4/remove-gets.patch
@@ -4,20 +4,21 @@ undefining it.
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: m4-1.4.17/lib/stdio.in.h
-===================================================================
---- m4-1.4.17.orig/lib/stdio.in.h	2013-10-16 14:41:01.678496227 +0300
-+++ m4-1.4.17/lib/stdio.in.h	2013-10-16 14:41:48.849427839 +0300
-@@ -717,10 +717,12 @@
+---
+diff --git a/lib/stdio.in.h b/lib/stdio.in.h
+index 5727452..f04a691 100644
+--- a/lib/stdio.in.h
++++ b/lib/stdio.in.h
+@@ -742,10 +742,12 @@ _GL_WARN_ON_USE (getline, "getline is unportable - "
  /* It is very rare that the developer ever has full control of stdin,
     so any use of gets warrants an unconditional warning; besides, C11
     removed it.  */
 +#if defined gets
  #undef gets
- #if HAVE_RAW_DECL_GETS
+ #if HAVE_RAW_DECL_GETS && !defined __cplusplus
  _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
  #endif
 +#endif
  
- 
  #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
+ struct obstack;
diff --git a/meta/recipes-devtools/m4/m4_1.4.17.bb b/meta/recipes-devtools/m4/m4_1.4.18.bb
similarity index 100%
rename from meta/recipes-devtools/m4/m4_1.4.17.bb
rename to meta/recipes-devtools/m4/m4_1.4.18.bb
-- 
2.11.0.rc2.dirty


