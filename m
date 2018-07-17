Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 61C5B7898E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:16 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id g6-v6so1911764wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=KZkYDZw8x9a2SYcoWMh1M7P5GUZyoaSTKQQjoTagdGI=;
	b=RIwv4zwRGb1dIFIOWdSUvDpPHjguNJFZmRjhd7uYxSiNV2+/3QRfHdT/EpswuyCytY
	/f/s2RdnxQ5l6d22QjoSWFhUOH7OmRMX3BrakQqD5fjfVKu0stURrVlValn2+TA00sD+
	hOJCSng60h7KU6PgVXnagpaQsw8kXPpMC0TiHvVl67GD+A4e9sFz6/R+eX+R6ZcMvlvY
	7/qPKgZ3WAb+xtQxYsWxvwwH7yiO52HaobZywWTO/CPLs731Nz9V0Jf7Ur1wN+aR08Ns
	ci1N2PbE0dEXQkqqM1uAezf2MYf6dgl6E6IBz1HLxblmBHPNRUoneAIJNvqzNwJEy73u
	tNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=KZkYDZw8x9a2SYcoWMh1M7P5GUZyoaSTKQQjoTagdGI=;
	b=Fz+QD/V4R7hgw5C1vhA7LaGrE9vKndTlnJHDTPIwA8nsA6VPfJFQlBSGwxKl5dxJAU
	c1Xfh/3RYWsi77zZ61WwevAR0R+M9bz5dkXyTnq9ecfv2wBa+6DwF8S0zBINuhtQgayY
	mFVPFyCfWiNp4PWLT1ICFX99y1g37BliEuTejBSKpSA3Z50jMZmaVmkpNoeeSS50kIE0
	GSBWrIGWmBxBky6I0lDA8HQUKuOU9ggMxGjcHFfI2VR6WqN2dNFp5PGNRCuOTLvayTeT
	czkCI41Ti+zUjyoon3cDdwMmwTDoNENX1qJ86iyUZiQeou3TQ/EWhvsluiUZhy5EY2Nd
	USrw==
X-Gm-Message-State: AOUpUlE/MPb7oR8jGdo2+gZOV9CKw7JFfIGqt8xqMLSq/hJVw4y6jwL2
	h/xiZjLqoDAaJStO2vlFnCOTKlm9
X-Google-Smtp-Source: AAOMgpekgT0VElcKoj8KsRshAOsABys0sZ6rXKbh+aPmxL00qsRay2WaglOeylU8p/QedUM5AUkaFw==
X-Received: by 2002:adf:c612:: with SMTP id
	n18-v6mr1882017wrg.177.1531845556664; 
	Tue, 17 Jul 2018 09:39:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:38:57 +0100
Message-Id: <20180717163910.3196-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 02/15] tcf-agent: upgrade to 1.7.0
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:16 -0000

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


