Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 67ABF78A5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:20:53 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id z12so18113342wrg.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=NDnRs9joEIfaBNw9z0YSxvnqbya/oZM9GVwQvTjtLQM=;
	b=tz3IzbK35J1a650IuNmUyrdosBsc3O08piF6owqQdhYIvjVxwNElRUnFNMxG8Evh4i
	6V+hrzDkzB6Cvcc7Y1kDPZzyrlNlgUmPfhDJg9AcPkSjtY+9rrNQPJ4g66ITz2xSSNob
	OVwii6EExXgYB9tGAx5Lbnf6AcLmLd9FD34qIwBrkzdIIdlz8BWE+0qs3OLmvheXCB6P
	O8P9fTmT59jEEzbXlBy4beY4V/0X1P4BVfldaNAFLFq9MsMW/o7PAIGWyK7WUeYBtAdX
	5ss9FyGaRcellZVVGTuTC8FCydfpFHod4JpWJvurBtCku9lOL+C4pGxx5g7vKlvApFhl
	QNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=NDnRs9joEIfaBNw9z0YSxvnqbya/oZM9GVwQvTjtLQM=;
	b=N7QVkT2qPB4jmdHRbC6LrBRCikOz84cko4ZNy6O9sN1MKGCYZanG1we1PEro27InVX
	J9VkUfVRQd+d5Q13MMm06QQM7yzSJSEbFdsOrHdUQqnCO1q9mHRbqzUZOOl1HxjS74es
	oZ67mee/em58gTjDafWyUrvpYU0/uoEBhYxhRiarwZdo6DdOFfAhPePxo9bdR/pisKbq
	kaSetvZcpe+mIZd3DVS0Jr9cMl4udH3cQrdU5p9wttgoSInGeJe97ZhrvUqI8/MulkKE
	F1j6fNF62iPLlUfvsveou+470FP13UpjvVz45I8LkB+pjzevrX4888tdB2BQG5GkVx5H
	SPSA==
X-Gm-Message-State: APf1xPBeIbV4sLkUCXKSB/0avjb6U4ka7BWj9IjuGnGsVkhSHNukU1QZ
	lZNfr588qJwkJFD64HCL4gQcf0Ku
X-Google-Smtp-Source: AG47ELuBwNeDq9msrQqIrs68H2p6K2oi9LcO//p/6PtG1ALiPhblR7h/8aqX34TfkEgDETDIe9DYug==
X-Received: by 10.223.163.16 with SMTP id c16mr13053733wrb.18.1520270453966;
	Mon, 05 Mar 2018 09:20:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.20.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:20:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:20 +0000
Message-Id: <20180305172046.21729-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 03/29] gobject-introspection: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:20:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...c-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 41 ++++++++++------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
index 48a0c85f02c..c682b42af6f 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
@@ -32,10 +32,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  tests/Makefile.am |  5 ++++-
  4 files changed, 87 insertions(+), 1 deletion(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index b080a89..ce8d29b 100644
---- a/Makefile.am
-+++ b/Makefile.am
+Index: gobject-introspection-1.52.1/Makefile.am
+===================================================================
+--- gobject-introspection-1.52.1.orig/Makefile.am
++++ gobject-introspection-1.52.1/Makefile.am
 @@ -21,7 +21,9 @@ include Makefile-cmph.am
  include Makefile-girepository.am
  include Makefile-giscanner.am
@@ -46,10 +46,10 @@ index b080a89..ce8d29b 100644
  include Makefile-tools.am
  include Makefile-msvcproj.am
  
-diff --git a/common.mk b/common.mk
-index e26c637..9f3a65f 100644
---- a/common.mk
-+++ b/common.mk
+Index: gobject-introspection-1.52.1/common.mk
+===================================================================
+--- gobject-introspection-1.52.1.orig/common.mk
++++ gobject-introspection-1.52.1/common.mk
 @@ -6,6 +6,15 @@
  # module itself.
  #
@@ -130,13 +130,13 @@ index e26c637..9f3a65f 100644
  
  INTROSPECTION_DOCTOOL_ARGS = \
      --add-include-path=$(srcdir) \
-diff --git a/configure.ac b/configure.ac
-index 6c91fa5..21340a5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -360,6 +360,48 @@ fi
- 
- AC_SUBST(EXTRA_LINK_FLAGS)
+Index: gobject-introspection-1.52.1/configure.ac
+===================================================================
+--- gobject-introspection-1.52.1.orig/configure.ac
++++ gobject-introspection-1.52.1/configure.ac
+@@ -366,6 +366,48 @@ dnl
+ AM_CONDITIONAL(MSVC_BASE_NO_TOOLSET_SET, [test x$MSVC_BASE_TOOLSET = x])
+ AM_CONDITIONAL(MSVC_NO_TOOLSET_SET, [test x$MSVC_TOOLSET = x])
  
 +AC_ARG_ENABLE([host-gi],
 +[AS_HELP_STRING([--enable-host-gi],[Use gobject introspection tools installed in the host system (useful when cross-compiling)])],
@@ -183,10 +183,10 @@ index 6c91fa5..21340a5 100644
  AC_CONFIG_FILES([
  Makefile
  tests/Makefile
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index bdd0fa7..75dd3c9 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
+Index: gobject-introspection-1.52.1/tests/Makefile.am
+===================================================================
+--- gobject-introspection-1.52.1.orig/tests/Makefile.am
++++ gobject-introspection-1.52.1/tests/Makefile.am
 @@ -1,6 +1,9 @@
  include $(top_srcdir)/common.mk
  
@@ -198,6 +198,3 @@ index bdd0fa7..75dd3c9 100644
  
  EXTRA_DIST=
  BUILT_SOURCES=
--- 
-2.7.0
-
-- 
2.11.0


