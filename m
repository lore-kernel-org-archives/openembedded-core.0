Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BCFE778A0D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 14:20:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id h20-v6so1703408wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KZkYDZw8x9a2SYcoWMh1M7P5GUZyoaSTKQQjoTagdGI=;
	b=H8J2uFBq8f8gILoXQOiAAAcxutIbw1NV15xPHzcIDDuSo4OrxRHfwK0C8zkCE2NTtT
	D3scWR3fyNpEygT+c7i0PzWuP+uBxbiPWYP1NEB6HnnOpsvaF1WpERNBaTCRMzic91+j
	wisdAJj2P0u6eVncoXrvz8tghhmCZr/yqSc1qipVtjvZS/eS3eXhlJ/00s1oimzKFQSB
	0XS3ba0OYWN6v7EAcQJ5pwCkL9wt+6aZl7Q21fnlL88YchIevXbZgZbgKAbK02yRoQYS
	Q1htPMU5sjlD0l6lBPvRABF7jPKw3tE42M8h9Hf3/hzL/785tn5GDNO7wR6ql3igTxfm
	SVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KZkYDZw8x9a2SYcoWMh1M7P5GUZyoaSTKQQjoTagdGI=;
	b=m6BnRJwWsPD2EwFriqWLCz/XRvh+LSZ/FQxZiFjBgMrcvapXezuF5rFcxgd3dDhJEy
	TkVC3P76IdkTd3ySOgV0arlew4bH/IODv9X5L7hBalJg7LgkJ4/xVYylQbCeX/9EU42H
	7HoN7mk30Y6hRUIrUI6GsYogV0iUXZID1DxPDiB6JLFZ4xREO8+ZmuK5llLLu5HmZwd9
	b1k5t1EUtd7Dc5YyENxziC1oLltX3trK5q/viY7+HA6OUhjv+SYqgCK2uyK3JPmQc63y
	m4w+HvHeWZ1fgE91EeeA3JXpmeoQM/Dzm5sGSMJ/5aWgA+NbX4W1oeofWnaKvId4/Jdh
	IM7g==
X-Gm-Message-State: AOUpUlF5WANbl2h+tiJdtYx0PxohkAKj5Xw5nuDe+6z3KruoR4W7FPHM
	giUTWsA8enTMtyNStIm6nRUyM6Z0
X-Google-Smtp-Source: AAOMgpeW+Gfc8RLoOACL6/aNUbragKKQBqJPBPtYDTFj+Rb7kZiXlOiyu1TiR+zthpKtZESzT/Zthw==
X-Received: by 2002:a1c:6f88:: with SMTP id c8-v6mr1473872wmi.49.1531837259101;
	Tue, 17 Jul 2018 07:20:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n198-v6sm2299861wmd.33.2018.07.17.07.20.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 07:20:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 15:20:56 +0100
Message-Id: <20180717142056.32225-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] tcf-agent: upgrade to 1.7.0
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
X-List-Received-Date: Tue, 17 Jul 2018 14:20:59 -0000

Remove 0001-canonicalize_file_name-is-specific-to-glibc.patch as upstream has
integrated musl support.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...nonicalize_file_name-is-specific-to-glibc.patch | 46 ----------------------
 .../tcf-agent/tcf-agent/fix_ranlib.patch           | 23 +++++------
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |  7 ++--
 3 files changed, 15 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch
deleted file mode 100644
index 5f93c46f29f..00000000000
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/0001-canonicalize_file_name-is-specific-to-glibc.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 23a3759b74d081b3b2849b0d37a0e5219f37813e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 7 Jan 2016 22:37:48 +0000
-Subject: [PATCH] canonicalize_file_name is specific to glibc
-
-When on Linux and not using glibc then we need to define
-canonicalize_file_name() API, therefore add a check for finding out if
-its not glibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- agent/tcf/framework/mdep.c | 2 +-
- agent/tcf/framework/mdep.h | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/agent/tcf/framework/mdep.c b/agent/tcf/framework/mdep.c
-index 2b52ca8..7d09655 100644
---- a/agent/tcf/framework/mdep.c
-+++ b/agent/tcf/framework/mdep.c
-@@ -1042,7 +1042,7 @@ char * canonicalize_file_name(const char * path) {
-     return strdup(res);
- }
- 
--#elif defined(__UCLIBC__)
-+#elif defined(__UCLIBC__) || !defined(__GLIBC__)
- 
- char * canonicalize_file_name(const char * path) {
-     return realpath(path, NULL);
-diff --git a/agent/tcf/framework/mdep.h b/agent/tcf/framework/mdep.h
-index 1e718a2..187c399 100644
---- a/agent/tcf/framework/mdep.h
-+++ b/agent/tcf/framework/mdep.h
-@@ -276,7 +276,7 @@ extern int loc_clock_gettime(int, struct timespec *);
- 
- #define O_BINARY 0
- 
--#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__)
-+#if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__APPLE__) || !defined(__GLIBC__)
- #  define O_LARGEFILE 0
- extern char ** environ;
- extern char * canonicalize_file_name(const char * path);
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
index b66f41ad280..abd33babebb 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent/fix_ranlib.patch
@@ -1,16 +1,17 @@
-Upstream-Status: Inappropriate [poky-specific fix]
+Actually pass the arguments to RANLIB.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Index: agent/Makefile.inc
 ===================================================================
---- agent.orig/Makefile.inc
-+++ agent/Makefile.inc
-@@ -88,6 +88,9 @@ ifneq ($(OPSYS),Windows)
-   ifneq ($(CC),g++)
-     OPTS += -Wmissing-prototypes
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -92,6 +92,7 @@ ifeq ($(OPSYS),GNU/Linux)
+     OPTS += -DUSE_uuid_generate=0
    endif
-+  ifneq ($(RANLIB),)
-+    RANLIB += $@
-+  endif
+   OPTS += -DENABLE_arch_$(shell uname -m)
++  RANLIB += $@
  endif
- 
- # Compiler flags definition
+
+ ifneq ($(OPSYS),Windows)
diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ba14c426981..20cb9a844da 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -5,14 +5,13 @@ BUGTRACKER = "https://bugs.eclipse.org/bugs/"
 LICENSE = "EPL-1.0 | EDL-1.0"
 LIC_FILES_CHKSUM = "file://edl-v10.html;md5=522a390a83dc186513f0500543ad3679"
 
-SRCREV = "2dddd5f440a15d5406032fac20f206484513646f"
-PV = "1.4.0+git${SRCPV}"
+SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
+PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent;branch=1.4_neon_bugfix \
+SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
            file://fix_ranlib.patch \
            file://ldflags.patch \
-           file://0001-canonicalize_file_name-is-specific-to-glibc.patch;striplevel=2 \
            file://tcf-agent.init \
            file://tcf-agent.service \
           "
-- 
2.11.0


