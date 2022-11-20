Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52321C352AA
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.12401.1668951091773380048
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G9cjpnzh;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id bs21so16231531wrb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyXC7jk3z0120XEBCaxzd+kVNxi4PBSZ3FEjJ/7mcso=;
        b=G9cjpnzhYzsz1tUh9oHtTqoKpbV5cEGFURk4lZecl1ZAuqXrGpeZwC8jfWz37nDPM9
         NHWZbeFq2+PK5QTutyIjK+ToIUAhc4qp00ttmTN5zvaeNLQ85THPHvJtYNfbQb9lAQpE
         J/lY90RHEO6juaIXCUZNM7K3Ka48RRO6CHvy+I9pJ306v+6a70w+lrYkmS5uEPRZI+hf
         ig7yrcyfAQHUtQm1L7o0aQYBg+bLSWnsZI+bBPrDKNDcUCn1by50fSgXmWRhjc5n6d/X
         asAyaYhjfDGb2bEx9/eB72zdgztLYXJ4lHMqcZ0oFYthX2W+p9jwmBsZ97Nm5+79/XPz
         0phA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyXC7jk3z0120XEBCaxzd+kVNxi4PBSZ3FEjJ/7mcso=;
        b=e3qvzVourw7cs9Z1yrNTjRtTvkq0/B1iDAgOSV/zLmlWNCjEL7zNJE9UiXxkmGnnW3
         6MG0IS4kasVRw7QXWqwUpEtFs7JPPllR7i3TmK2lgw1sBJXWwbtgaC0F81dN6UE2cPam
         Hsb7Tmr1oxI+UupAddwPU8VYyJDcHSl1dvXNweXg21pdXEXd8jouONPCuiJcuQjOQ06r
         A3H5DUWRaN2w1/Qkysbi2oo71uhoLCz9DhrhpVn3k3Q8OvtjcGeHPEmfL5kaBOaYq9yY
         5EWwKviYwC1Lgx5KGsFvIp+6Vb96cIxR8byS8hTGOZQOY/i/QdASDJ/AZRps2NFplZNb
         kmHQ==
X-Gm-Message-State: ANoB5pmzukMrKSV2fSjp17WSkdhqkkYIBOLinyzQbAvir1Y51ZePjEq3
	Pw9Q5yw93ml3bT14vi/kMtgLO0sZjb0=
X-Google-Smtp-Source: AA0mqf6LbfSg7A/DoUrmn+XZ3KgSlPBBJ3qUYTIxQhqux7oDXadDzRMrZWEN7hQbTXmVXpy7kS+zDQ==
X-Received: by 2002:a5d:458c:0:b0:241:d40a:bb50 with SMTP id p12-20020a5d458c000000b00241d40abb50mr16830wrq.39.1668951089983;
        Sun, 20 Nov 2022 05:31:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/17] tcl: update 8.6.11 -> 8.6.12
Date: Sun, 20 Nov 2022 14:31:09 +0100
Message-Id: <20221120133122.2464634-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173585

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../tcl/fix_non_native_build_issue.patch      | 27 +++++++---
 .../tcltk/tcl/tcl-add-soname.patch            | 50 +++++++++++--------
 .../tcltk/{tcl_8.6.11.bb => tcl_8.6.12.bb}    |  2 +-
 3 files changed, 50 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.11.bb => tcl_8.6.12.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 5a10c93a31..41aefd1deb 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,10 +1,19 @@
+From 34c3a1adc1bfd13fb877179c37ef74a108f2a749 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Fri, 13 Aug 2010 12:24:00 -0700
+Subject: [PATCH] tcl: fix a build issue
+
 Upstream-Status: Inappropriate [upstream does not support installed tests]
 
-Index: unix/Makefile.in
-===================================================================
---- a/unix.orig/Makefile.in	2013-11-10 23:37:34.243424934 -0800
-+++ b/unix/Makefile.in	2013-11-10 23:37:34.243424934 -0800
-@@ -709,23 +709,23 @@
+---
+ unix/Makefile.in | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 804532e..a9cb339 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -810,23 +810,23 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -32,7 +41,7 @@ Index: unix/Makefile.in
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -743,23 +743,23 @@
+@@ -844,25 +844,25 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
@@ -45,8 +54,10 @@ Index: unix/Makefile.in
 +	$(SHELL_ENV) $(GDB) ${TCL_EXE}
  
  valgrind: ${TCL_EXE} ${TCLTEST_EXE}
--	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind $(TESTFLAGS)
-+	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind $(TESTFLAGS)
+-	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} \
++	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ${TCLTEST_EXE} \
+ 		$(TOP_DIR)/tests/all.tcl -singleproc 1 -constraints valgrind \
+ 		$(TESTFLAGS)
  
  valgrindshell: ${TCL_EXE}
 -	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCL_EXE} $(SCRIPT)
diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
index c4283c4f34..3123d289a1 100644
--- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
@@ -1,25 +1,21 @@
+From d6155ec08b355d64f1a7db407254d159037bb72a Mon Sep 17 00:00:00 2001
+From: Richard Purdie <rpurdie@linux.intel.com>
+Date: Wed, 9 Dec 2009 23:59:44 +0000
+Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
+
 Upstream-Status: Pending
 
-Index: unix/tcl.m4
-===================================================================
---- a/unix.orig/tcl.m4	2013-09-19 13:17:13.000000000 -0700
-+++ b/unix/tcl.m4	2013-11-11 00:17:24.263485123 -0800
-@@ -1415,6 +1415,9 @@
- 	    # get rid of the warnings.
- 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
- 
-+	    # following line added by CW for Debian GNU/Linux
-+	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
-+
- 	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
- 	    DL_OBJS="tclLoadDl.o"
- 	    DL_LIBS="-ldl"
-Index: unix/Makefile.in
-===================================================================
---- a/unix.orig/Makefile.in	2013-09-19 13:17:13.000000000 -0700
-+++ b/unix/Makefile.in	2013-11-11 00:20:32.423489861 -0800
-@@ -796,7 +796,10 @@
- 	    done;
+---
+ unix/Makefile.in | 5 ++++-
+ unix/tcl.m4      | 3 +++
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 398afd0..804532e 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -893,7 +893,10 @@ install-binaries: binaries
+ 	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
 -	@chmod 555 "$(DLL_INSTALL_DIR)/$(LIB_FILE)"
@@ -30,3 +26,17 @@ Index: unix/Makefile.in
  	@echo "Installing ${TCL_EXE} as $(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
+diff --git a/unix/tcl.m4 b/unix/tcl.m4
+index f3d08ec..797c93f 100644
+--- a/unix/tcl.m4
++++ b/unix/tcl.m4
+@@ -1382,6 +1382,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
+ 	    # get rid of the warnings.
+ 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
+ 
++	    # following line added by CW for Debian GNU/Linux
++	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
++
+ 	    SHLIB_LD='${CC} ${CFLAGS} ${LDFLAGS} -shared'
+ 	    DL_OBJS="tclLoadDl.o"
+ 	    DL_LIBS="-ldl"
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.12.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_8.6.11.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.12.bb
index f8b2a69b9f..824c0286c6 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.12.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d35e2457469024cfa"
+SRC_URI[sha256sum] = "186748f1131cef3d637421a18d70892f808e526a29c694bebfeb1c540f98727c"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.30.2


