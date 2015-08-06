Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id B8DF96E630
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 00:36:59 +0000 (UTC)
Received: by igk11 with SMTP id 11so1705572igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 17:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vFNDPGnwkDV5FNPWEStyorWvtH1X+OvtxgqyDltPcDE=;
	b=fjNbcsAeLmOT45uYVvRpe58vOG/8ny2xMmJbgb1VUi7xNfYRhTgP2ZUDoKHI0Xe1PI
	pcKaTYfDnDBcWfkaKq+RNyBT0y0AUwExPl02L8Zor1UuVU2F9+lgYPUfFbkxNYkFOSat
	UmopDf/6pbZ3VQc4vVZNyF+5rGF5nVgc+IN61YLKvWwDgBg3O0qsyzR0+V3t6tZRT1XE
	4lyNG5a7PwZHRNp4ASZmQVTTW6hIPNu04Z8nXjO+TZGANANdIRT1cN7DV8BOjZBLKxUT
	LrzDJChm5nl3gQE36ScXZvNF4NrmimbcZd6u9CMu8USH//Ymq+QLuCcMzB18aYyllDH+
	VAUg==
X-Received: by 10.50.39.17 with SMTP id l17mr378251igk.75.1438821419611;
	Wed, 05 Aug 2015 17:36:59 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	k19sm3330223iok.20.2015.08.05.17.36.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 17:36:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 17:36:49 -0700
Message-Id: <1438821410-22693-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438821410-22693-1-git-send-email-armccurdy@gmail.com>
References: <1438821410-22693-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] gettext_0.16.1: remove obsolete uclibc specific patch
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
X-List-Received-Date: Thu, 06 Aug 2015 00:37:01 -0000

gettext-error_print_progname.patch was originally created for gettext
v0.14.6 and does not apply cleanly to gettext v0.16.1.

Since the original issue addressed by the patch isn't documented and
because gettext v0.16.1 seems to be build OK for uclibc without the
patch, assume the patch is obsolete and no longer required.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../gettext-0.16.1/gettext-error_print_progname.patch | 19 -------------------
 meta/recipes-core/gettext/gettext_0.16.1.bb           |  4 ----
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch

diff --git a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch b/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
deleted file mode 100644
index 93d9194..0000000
--- a/meta/recipes-core/gettext/gettext-0.16.1/gettext-error_print_progname.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-
-# Pulled from OpenEmbedded
-# 
-# Commented by: Saul Wold <saul.wold@intel.com>
-
-Upstream-Status: Inappropriate [licensing]
-
-diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
---- gettext-0.14.6/gettext-tools/lib/error.h	2005-05-20 16:03:42.000000000 -0500
-+++ gettext-0.14.6-patched/gettext-tools/lib/error.h	2007-01-13 20:57:24.422168053 -0600
-@@ -50,7 +50,7 @@
- /* If NULL, error will flush stdout, then print on stderr the program
-    name, a colon and a space.  Otherwise, error will call this
-    function without parameters instead.  */
--extern DLL_VARIABLE void (*error_print_progname) (void);
-+void (*error_print_progname) (void);
- 
- /* This variable is incremented each time `error' is called.  */
- extern DLL_VARIABLE unsigned int error_message_count;
diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 892194c..956d238 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -21,10 +21,6 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://hardcode_macro_version.patch \
           "
 
-
-SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch"
-SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch"
-
 SRC_URI[md5sum] = "3d9ad24301c6d6b17ec30704a13fe127"
 SRC_URI[sha256sum] = "0bf850d1a079fb5a61f0a47b1a9efd35eb44032255375e1cedb0253bc27b376d"
 
-- 
1.9.1


