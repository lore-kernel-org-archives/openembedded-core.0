Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2E9C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:50 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.10650.1710313781224085267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GaFY/PJ8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313782; x=1741849782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZtA6YyrH0GAT2FrCR4FyYzLYOJ5SUmLwJPSzMGdjXDQ=;
  b=GaFY/PJ8FvMqNGBHQi/Z+CYKmw0wnWMOa+t7GV7HhBRr/P4hSUbJCO+m
   FERPFiLTEHraR6rEYeRVZOVprIVMr/ZESlFCihgR5t3Mv2hdJtAVoabEr
   GMrwUCytQeEZRQLZRa3qoYh2r+MasQEBcGLI5TFBy1qzRZ7pnO7DsXKay
   slZoa254wcntaiuI0c3ZowtdkEJRIQPCARTj4GcHewQmFFvTpALIyjzib
   0g148O/p8r3eYUpO6e/iuYFZNQPFQH0fqHIWciwFe7tg57KRbqyMhx3v3
   9yH0kfMeosYyBpTbITZfZO38PRti1s8OTleFknmG7pcZzlwUXbusbF5rN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="153951025"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="153951025"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92A93232B2
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C64372970B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E9E7224955
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0D1381A006B;
	Wed, 13 Mar 2024 15:09:35 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/36] tcl: upgrade 8.6.13 -> 8.6.14
Date: Wed, 13 Mar 2024 15:08:31 +0800
Message-Id: <1710313714-12541-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--7.529900-10.000000
X-TMASE-MatchedRID: 6IstDyeExSCjz0nOeth/ySrLqyE6Ur/jyqyllX6UJItXGTbsQqHbkvlt
	wVYZ2yRqKqrQ7lLcMnyK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2DCJ
	4R8XjS0cSkT0TcPCCFE+ar1fsIOhmzaLfecLVryZ85pjA/x1xfmvaomg0i4KN8f3rOEwXzqdCWO
	NqeTVrImsfwvKHyqbJqKKYyw9LDz3yha4uErRN/bixxDRpftwPzvw8i1YocQ8IrXrOsT3ieTlCR
	r8Hb3qil40eicjerpYwgZloB/TBseVHGbcDbAq6FEUknJ/kEl7dB/CxWTRRu25FeHtsUoHuDvlm
	xh7mtfoCVTT8u5cLbiAAQNhE8gjlSczZJCMl49nrpcchznD6Bw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197035

From: Wang Mingyu <wangmy@fujitsu.com>

fix_issue_with_old_distro_glibc.patch
fix_non_native_build_issue.patch
refreshed for 8.6.14

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcl/fix_issue_with_old_distro_glibc.patch | 28 +++++++++++--------
 .../tcl/fix_non_native_build_issue.patch      | 25 ++++++++++-------
 .../tcltk/{tcl_8.6.13.bb => tcl_8.6.14.bb}    |  2 +-
 3 files changed, 33 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.13.bb => tcl_8.6.14.bb} (97%)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
index 2c31cec8e3..f8acaf406f 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
@@ -14,12 +14,15 @@ Fixes tcl target recipe build on old distros which have glibc older than 2.14
 
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/26
+---
+ unix/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: unix/Makefile.in
-===================================================================
---- a/unix.orig/Makefile.in	2013-11-10 23:38:01.787425628 -0800
-+++ b/unix/Makefile.in	2013-11-10 23:37:59.807425578 -0800
-@@ -686,7 +686,7 @@
+diff --git a/unix/Makefile.in b/unix/Makefile.in
+index 7604959..c52cf2d 100644
+--- a/unix/Makefile.in
++++ b/unix/Makefile.in
+@@ -792,7 +792,7 @@ topDirName:
  # tcltest executable gets the build directory burned into its ld search path.
  # This keeps tcltest from picking up an already installed version of the Tcl
  # library.
@@ -28,12 +31,15 @@ Index: unix/Makefile.in
  		TCLLIBPATH="@abs_builddir@/pkgs" \
  		TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"
  
-@@ -712,7 +712,7 @@
+@@ -818,7 +818,7 @@ test-tcl: ${TCLTEST_EXE}
  	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
  
  gdb-test: ${TCLTEST_EXE}
--	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
-+	@echo "set env @LD_LIBRARY_PATH_VAR@=$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
- 	$(GDB) ${TCLTEST_EXE} --command=gdb.run
+-	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
++	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
+ 	@printf '\n' >>gdb.run
+ 	@printf '%s ' set env TCL_LIBRARY=\'$(call shquotesingle,${TCL_BUILDTIME_LIBRARY})\' >> gdb.run
+ 	@printf '\n' >>gdb.run
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 6dbef7077f..931ea1e975 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -4,16 +4,15 @@ Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
 
 Upstream-Status: Inappropriate [upstream does not support installed tests]
-
 ---
- unix/Makefile.in | 20 ++++++++++----------
- 1 file changed, 10 insertions(+), 10 deletions(-)
+ unix/Makefile.in | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index b110fe9..d7b35a8 100644
+index 9dd053d..7604959 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -814,23 +814,23 @@ tcltest-real:
+@@ -815,7 +815,7 @@ tcltest-real:
  test: test-tcl test-packages
  
  test-tcl: ${TCLTEST_EXE}
@@ -21,9 +20,11 @@ index b110fe9..d7b35a8 100644
 +	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
  
  gdb-test: ${TCLTEST_EXE}
- 	@echo "set env @LD_LIBRARY_PATH_VAR@=`pwd`:$${@LD_LIBRARY_PATH_VAR@}" > gdb.run
- 	@echo "set env TCL_LIBRARY=${TCL_BUILDTIME_LIBRARY}" >> gdb.run
- 	@echo "set args $(TOP_DIR)/tests/all.tcl $(TESTFLAGS) -singleproc 1" >> gdb.run
+ 	@printf '%s ' set env @LD_LIBRARY_PATH_VAR@=\"`pwd`$${@LD_LIBRARY_PATH_VAR@:+:$${@LD_LIBRARY_PATH_VAR}}\" > gdb.run
+@@ -824,17 +824,17 @@ gdb-test: ${TCLTEST_EXE}
+ 	@printf '\n' >>gdb.run
+ 	@printf '%s ' set args $(call shquotequote,$(TOP_DIR))/tests/all.tcl\
+ 		$(call shquotequote,$(TESTFLAGS)) -singleproc 1 >> gdb.run
 -	$(GDB) ./${TCLTEST_EXE} --command=gdb.run
 +	$(GDB) ${TCLTEST_EXE} --command=gdb.run
  	rm gdb.run
@@ -41,7 +42,7 @@ index b110fe9..d7b35a8 100644
  
  # The following target generates the shared libraries in dltest/ that are used
  # for testing; they are included as part of the "tcltest" target (via the
-@@ -848,28 +848,28 @@ dltest.marker: ${STUB_LIB_FILE}
+@@ -852,28 +852,28 @@ dltest.marker: ${STUB_LIB_FILE}
  # This target can be used to run tclsh from the build directory
  # via `make shell SCRIPT=/tmp/foo.tcl`
  shell: ${TCL_EXE}
@@ -54,7 +55,8 @@ index b110fe9..d7b35a8 100644
 +	$(SHELL_ENV) $(GDB) ${TCL_EXE}
  
  lldb: ${TCL_EXE}
- 	$(SHELL_ENV) $(LLDB) ./${TCL_EXE}
+-	$(SHELL_ENV) $(LLDB) ./${TCL_EXE}
++	$(SHELL_ENV) $(LLDB) ${TCL_EXE}
  
  valgrind: ${TCL_EXE} ${TCLTEST_EXE}
 -	$(SHELL_ENV) $(VALGRIND) $(VALGRINDARGS) ./${TCLTEST_EXE} \
@@ -76,3 +78,6 @@ index b110fe9..d7b35a8 100644
  
  #--------------------------------------------------------------------------
  # Installation rules
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
similarity index 97%
rename from meta/recipes-devtools/tcltk/tcl_8.6.13.bb
rename to meta/recipes-devtools/tcltk/tcl_8.6.14.bb
index bb75353a5a..8fdccbaa90 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.14.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] = "c61f0d6699e2bc7691f119b41963aaa8dc980f23532c4e937739832a5f4a6642"
+SRC_URI[sha256sum] = "ff604f43862a778827d7ecd1ad7686950ac2ef48d9cf69d3424cea9de08d9a72"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.34.1


