Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62C7C02186
	for <webhook@archiver.kernel.org>; Wed,  1 Jan 2025 09:32:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.11332.1735723940835334242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jan 2025 01:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IejJD//K;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=2x4D/9wP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019421359cf4-7e272b1f-38b0-4a24-9058-1c70d75491d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1735723949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PZ45qbM2o89YUYpXvK+gDe3OrRp1Z32QvlWqfaV8IWw=;
	b=IejJD//K4LuqNElZEQXEFQJYK2EgCYPJ9NnO9vx7Si5Otlv0iBHpA1ikBYO5dsLD
	JGfenDc5fK1uX3OhR0zaHWkH74fgvOPf6zzA0F93ReL1sAnxnpRgeOlZ4Zfh2CNrBFx
	Vw/OAzoUV35dQQVtrov3IdGl3VayyV3XE5fb6q1c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1735723949;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PZ45qbM2o89YUYpXvK+gDe3OrRp1Z32QvlWqfaV8IWw=;
	b=2x4D/9wP9wM7cwFzhGV8eGcsFzjNMUiIH+iNrYDFZsXWrVbArTwKrU8U098Tv/zx
	pe87NJYq1TIrGiUL8hyIWSr7EsoEeVnBXnvs60oaLOSRbhzlkasluyjV0tniOvbEVix
	TwYcW1jrWwjWGVdFJi0WLVO0HuqcSM41jVUAIhus=
Content-Type: multipart/mixed; boundary="===============6652401400078194559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.16 SUCCEEDED
Message-ID: <0101019421359cf4-7e272b1f-38b0-4a24-9058-1c70d75491d9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jan 2025 09:32:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jan 2025 09:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209224

--===============6652401400078194559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl8* to *8.6.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tcl8-upgrade-8.6.15-8.6.16.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c2e9b40645bebb74d4a4ba6f75371d667fc6c698 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jan 2025 07:44:33 +0000
Subject: [PATCH] tcl8: upgrade 8.6.15 -> 8.6.16

---
 .../tcltk8/tcl8/alter-includedir.patch                 | 10 +++++-----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch       |  4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch         |  6 +++---
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch |  8 ++++----
 .../tcl8/tcl-remove-hardcoded-install-path.patch       |  6 +++---
 .../tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb}          |  2 +-
 6 files changed, 18 insertions(+), 18 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.15.bb => tcl8_8.6.16.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index bfc718cfd3..6ceb297cea 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 3130dca60636dc12d0d12df75b002fd123349e21 Mon Sep 17 00:00:00 2001
+From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a3b7d69..969ddb8 100644
+index c3b75e3..60ed93e 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,10 +39,10 @@ index a3b7d69..969ddb8 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 4974fb6..a72934f 100644
+index 8e6726b..2345689 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -776,7 +776,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
  test -z "$TCL_LIBRARY" && TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
@@ -51,7 +51,7 @@ index 4974fb6..a72934f 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -897,7 +897,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 7480156ce0..61153878fe 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From bd512547fc002fdb20808bf5b8b9feeb848b6512 Mon Sep 17 00:00:00 2001
+From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 965f6da..a0bd63f 100644
+index a2f9e21..c3b75e3 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index 2e0dc94cff..a4fb0c5a9d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 426aa2ff62dda77fd011e8f630b9d4ea17984817 Mon Sep 17 00:00:00 2001
+From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index d742484..fc90990 100644
+index 24ffb1b..c6460ad 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3595,17 +3595,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 1cd4d76283..88faf8ac73 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From b89fd73daf9b3eb2f889f65baba5f90d8a930c82 Mon Sep 17 00:00:00 2001
+From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index 7619afc..9dd053d 100644
+index bc743b3..a2f9e21 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
-@@ -904,7 +904,10 @@ install-binaries: binaries
+@@ -812,7 +812,10 @@ install-binaries: binaries
  	done
  	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
  	@@INSTALL_LIB@
@@ -27,7 +27,7 @@ index 7619afc..9dd053d 100644
  	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
  	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
 diff --git a/unix/tcl.m4 b/unix/tcl.m4
-index 0307a06..37c4d67 100644
+index 7f5464e..cd8d929 100644
 --- a/unix/tcl.m4
 +++ b/unix/tcl.m4
 @@ -1378,6 +1378,9 @@ AC_DEFUN([SC_CONFIG_CFLAGS], [
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index 93e7877256..0a0c1173a2 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 050fc597fbfa4da2c31bd0df58c871892a490470 Mon Sep 17 00:00:00 2001
+From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,10 +17,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index 4f62510..4974fb6 100644
+index e88ec3c..8e6726b 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
-@@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
+@@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
  
  eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
  
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
index b13102dd7a..2ee8be56d1 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.15.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
@@ -24,7 +24,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://interp.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "844775491e435e34d83d6ccfbadd1342f1855f1705253233a86152df0765e78d"
+SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.44.1


--===============6652401400078194559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.15-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.16-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest"
packages/core2-64-poky-linux/tcl8: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
Changes to packages/core2-64-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8326656 to 8326152 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1457996 to 1457968 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3172121 to 3173260 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-ptest: FILELIST: removed "/usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9 /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7MDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6CDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5EDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4ADT /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8PDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9YDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/HST10 /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5 /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6 /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7 /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8"
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 10085013 to 10111529 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-src: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7651582 to 7650620 (-0%)
packages/core2-64-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
packages/core2-64-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/lib/tcl8/8.5/tcltest-2.5.8.tm /usr/bin/tclsh8.6.15", added "/usr/lib/tcl8/8.5/tcltest-2.5.9.tm /usr/bin/tclsh8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.15", added "/usr/lib/tcl8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: PV changed from "8.6.15" to "8.6.16"
packages/core2-64-poky-linux/tcl8/tcl8: PKGSIZE changed from 2231768 to 2232318 (+0%)
packages/core2-64-poky-linux/tcl8/tcl8: PKGV changed from 8.6.15 [default] to 8.6.16 [default]
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.15 to ./tclsh8.6.16
  /usr/bin/tclsh8.6.15 moved to /usr/bin/tclsh8.6.16
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm

--===============6652401400078194559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm
packages/core2-64-poky-linux/tcl8/tcl8-ptest: FILELIST: removed "/usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4 /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6 /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8 /usr/lib/tcl8/ptest/library/tzdata/SystemV/AST4ADT /usr/lib/tcl8/ptest/library/tzdata/SystemV/CST6CDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5EDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7MDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/PST8PDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/HST10 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9YDT /usr/lib/tcl8/ptest/library/tzdata/SystemV/EST5 /usr/lib/tcl8/ptest/library/tzdata/SystemV/MST7 /usr/lib/tcl8/ptest/library/tzdata/SystemV/YST9"
packages/core2-64-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/bin/tclsh8.6.15 /usr/lib/tcl8/8.5/tcltest-2.5.8.tm", added "/usr/bin/tclsh8.6.16 /usr/lib/tcl8/8.5/tcltest-2.5.9.tm"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.15 to ./tclsh8.6.16
  /usr/bin/tclsh8.6.15 moved to /usr/bin/tclsh8.6.16
  /usr/include/tcl8.6.15 moved to /usr/include/tcl8.6.16
  /usr/lib/tcl8/8.5/tcltest-2.5.8.tm moved to /usr/lib/tcl8/8.5/tcltest-2.5.9.tm

--===============6652401400078194559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.15-8.6.16.patch"

RnJvbSBjMmU5YjQwNjQ1YmViYjc0ZDRhNGJhNmY3NTM3MWQ2NjdmYzZjNjk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBKYW4gMjAyNSAwNzo0NDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
bDg6IHVwZ3JhZGUgOC42LjE1IC0+IDguNi4xNgoKLS0tCiAuLi4vdGNsdGs4L3RjbDgvYWx0ZXIt
aW5jbHVkZWRpci5wYXRjaCAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCiAuLi4vdGNs
dGs4L3RjbDgvZml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2ggICAgICAgfCAgNCArKy0t
CiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvaW50ZXJwLnBhdGNoICAgICAgICAg
fCAgNiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtYWRkLXNv
bmFtZS5wYXRjaCB8ICA4ICsrKystLS0tCiAuLi4vdGNsOC90Y2wtcmVtb3ZlLWhhcmRjb2RlZC1p
bnN0YWxsLXBhdGgucGF0Y2ggICAgICAgfCAgNiArKystLS0KIC4uLi90Y2x0azgve3RjbDhfOC42
LjE1LmJiID0+IHRjbDhfOC42LjE2LmJifSAgICAgICAgICB8ICAyICstCiA2IGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2x0azgve3RjbDhfOC42LjE1LmJiID0+IHRjbDhfOC42LjE2LmJifSAoOTgl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1p
bmNsdWRlZGlyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVy
LWluY2x1ZGVkaXIucGF0Y2gKaW5kZXggYmZjNzE4Y2ZkMy4uNmNlYjI5N2NlYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVk
aXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMxMzBkY2E2MDYzNmRjMTJkMGQxMmRmNzVi
MDAyZmQxMjMzNDllMjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhiYjgxNzRlMTNj
MWMwZTNiMjdmZGY5NmEzOTNmOWZiMWI3ZTE0YmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBNaW5nbGkgWXUgPG1pbmdsaS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyMiBO
b3YgMjAyMiAxODo0ODoyNyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IHVwZGF0ZSB0aGUg
aGVhZGVyIGxvY2F0aW9uCkBAIC0yNiw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZ
dSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIv
dW5peC9NYWtlZmlsZS5pbgotaW5kZXggYTNiN2Q2OS4uOTY5ZGRiOCAxMDA2NDQKK2luZGV4IGMz
Yjc1ZTMuLjYwZWQ5M2UgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4
L01ha2VmaWxlLmluCiBAQCAtNTcsNyArNTcsNyBAQCBTQ1JJUFRfSU5TVEFMTF9ESVIJPSAkKElO
U1RBTExfUk9PVCkkKFRDTF9MSUJSQVJZKQpAQCAtMzksMTAgKzM5LDEwIEBAIGluZGV4IGEzYjdk
NjkuLjk2OWRkYjggMTAwNjQ0CiAgIyBQYXRoIHRvIHRoZSBwcml2YXRlIHRjbCBoZWFkZXIgZGly
OgogIFBSSVZBVEVfSU5DTFVERV9ESVIJPSBAUFJJVkFURV9JTkNMVURFX0RJUkAKIGRpZmYgLS1n
aXQgYS91bml4L2NvbmZpZ3VyZS5pbiBiL3VuaXgvY29uZmlndXJlLmluCi1pbmRleCA0OTc0ZmI2
Li5hNzI5MzRmIDEwMDY0NAoraW5kZXggOGU2NzI2Yi4uMjM0NTY4OSAxMDA2NDQKIC0tLSBhL3Vu
aXgvY29uZmlndXJlLmluCiArKysgYi91bml4L2NvbmZpZ3VyZS5pbgotQEAgLTc3Niw3ICs3NzYs
NyBAQCBldmFsICJUQ0xfTElCX0ZJTEU9bGlidGNsJHtMSUJfU1VGRklYfSIKK0BAIC03NzUsNyAr
Nzc1LDcgQEAgZXZhbCAiVENMX0xJQl9GSUxFPWxpYnRjbCR7TElCX1NVRkZJWH0iCiAgZXZhbCAi
VENMX0xJQl9GSUxFPSR7VENMX0xJQl9GSUxFfSIKICAKICB0ZXN0IC16ICIkVENMX0xJQlJBUlki
ICYmIFRDTF9MSUJSQVJZPSckKGxpYmRpcikvdGNsJChWRVJTSU9OKScKQEAgLTUxLDcgKzUxLDcg
QEAgaW5kZXggNDk3NGZiNi4uYTcyOTM0ZiAxMDA2NDQKICBIVE1MX0RJUj0nJChESVNURElSKS9o
dG1sJwogIAogICMgTm90ZTogIGluIHRoZSBmb2xsb3dpbmcgdmFyaWFibGUsIGl0J3MgaW1wb3J0
YW50IHRvIHVzZSB0aGUgYWJzb2x1dGUKLUBAIC04OTcsNyArODk3LDcgQEAgVENMX0JVSUxEX1NU
VUJfTElCX1BBVEg9ImBwd2RgLyR7VENMX1NUVUJfTElCX0ZJTEV9IgorQEAgLTg5OCw3ICs4OTgs
NyBAQCBUQ0xfQlVJTERfU1RVQl9MSUJfUEFUSD0iYHB3ZGAvJHtUQ0xfU1RVQl9MSUJfRklMRX0i
CiAgVENMX1NUVUJfTElCX1BBVEg9IiR7VENMX1NUVUJfTElCX0RJUn0vJHtUQ0xfU1RVQl9MSUJf
RklMRX0iCiAgCiAgIyBJbnN0YWxsIHRpbWUgaGVhZGVyIGRpciBjYW4gYmUgc2V0IHZpYSAtLWlu
Y2x1ZGVkaXIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9m
aXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90
Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaAppbmRleCA3NDgwMTU2
Y2UwLi42MTE1Mzg3OGZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4
L3RjbDgvZml4X25vbl9uYXRpdmVfYnVpbGRfaXNzdWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3RjbHRrOC90Y2w4L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSBiZDUxMjU0N2ZjMDAyZmRiMjA4MDhiZjViOGI5ZmVlYjg0OGI2
NTEyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzZDExZTdmZDlhYmE2MjUxOTc0ZDk5
MDI4NjM0N2MwNjU4MmU4N2I5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTml0aW4g
QSBLYW1ibGUgPG5pdGluLmEua2FtYmxlQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTMgQXVnIDIw
MTAgMTI6MjQ6MDAgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNsOiBmaXggYSBidWlsZCBpc3N1
ZQpAQCAtMTAsNyArMTAsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3VuaXgvTWFrZWZpbGUuaW4gYi91bml4L01ha2Vm
aWxlLmluCi1pbmRleCA5NjVmNmRhLi5hMGJkNjNmIDEwMDY0NAoraW5kZXggYTJmOWUyMS4uYzNi
NzVlMyAxMDA2NDQKIC0tLSBhL3VuaXgvTWFrZWZpbGUuaW4KICsrKyBiL3VuaXgvTWFrZWZpbGUu
aW4KIEBAIC03MjMsNyArNzIzLDcgQEAgdGNsdGVzdC1yZWFsOgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVycC5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOC9pbnRlcnAucGF0Y2gKaW5kZXggMmUwZGM5NGNmZi4uYTRmYjBj
NWE5ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVy
cC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvaW50ZXJwLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0MjZhYTJmZjYyZGRhNzdmZDAxMWU4ZjYzMGI5ZDRl
YTE3OTg0ODE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwOTA0OWJlZWQ3MjMyNDNk
MDkyZmZhYTM3OTM5ZGZlMGYyZWQ2ODI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiBEYXRlOiBNb24sIDEyIEp1bCAyMDIx
IDE0OjUwOjEzICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRjbDogZml4IHJhY2UgaW4gaW50ZXJw
LnRlc3QKQEAgLTEzLDEwICsxMywxMCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9z
cy5idXJ0b25AYXJtLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZXJwLnRlc3QgYi90ZXN0cy9pbnRl
cnAudGVzdAotaW5kZXggZDc0MjQ4NC4uZmM5MDk5MCAxMDA2NDQKK2luZGV4IDI0ZmZiMWIuLmM2
NDYwYWQgMTAwNjQ0CiAtLS0gYS90ZXN0cy9pbnRlcnAudGVzdAogKysrIGIvdGVzdHMvaW50ZXJw
LnRlc3QKLUBAIC0zNTk1LDE3ICszNTk1LDE4IEBAIHRlc3QgaW50ZXJwLTM2Ljcge0NoaWxkQmdl
cnJvciBzZXRzIGVycm9yIGhhbmRsZXIgb2YgY2hpbGQgWzE5OTkwMzVdfSAtc2V0dXAgeworQEAg
LTM2MTQsMTcgKzM2MTQsMTggQEAgdGVzdCBpbnRlcnAtMzYuNyB7Q2hpbGRCZ2Vycm9yIHNldHMg
ZXJyb3IgaGFuZGxlciBvZiBjaGlsZCBbMTk5OTAzNV19IC1zZXR1cCB7CiAgICAgICAgICB2YXJp
YWJsZSByZXN1bHQKICAgICAgICAgIHNldCByZXN1bHQgW2xpbmRleCAkYXJncyAwXQogICAgICB9
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1z
b25hbWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1z
b25hbWUucGF0Y2gKaW5kZXggMWNkNGQ3NjI4My4uODhmYWY4YWM3MyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYjg5ZmQ3M2RhZjliM2ViMmY4ODlmNjViYWJhNWY5MGQ4YTkz
MGM4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGQ4ZTU2N2QxMzJlMDUwYzVkNGE4
ZDhkOTI1NzQxN2UwNjc5NDgzYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hh
cmQgUHVyZGllIDxycHVyZGllQGxpbnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgOSBEZWMgMjAw
OSAyMzo1OTo0NCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6IEFkZCB0Y2x0ayBmcm9tIE9F
LmRldiBidXQgd2l0aCBsZWdhY3kgc3RhZ2luZyBmdW5jdGlvbgpAQCAtMTEsMTAgKzExLDEwIEBA
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiAg
MiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL3VuaXgvTWFrZWZpbGUuaW4gYi91bml4L01ha2VmaWxlLmluCi1pbmRleCA3NjE5YWZj
Li45ZGQwNTNkIDEwMDY0NAoraW5kZXggYmM3NDNiMy4uYTJmOWUyMSAxMDA2NDQKIC0tLSBhL3Vu
aXgvTWFrZWZpbGUuaW4KICsrKyBiL3VuaXgvTWFrZWZpbGUuaW4KLUBAIC05MDQsNyArOTA0LDEw
IEBAIGluc3RhbGwtYmluYXJpZXM6IGJpbmFyaWVzCitAQCAtODEyLDcgKzgxMiwxMCBAQCBpbnN0
YWxsLWJpbmFyaWVzOiBiaW5hcmllcwogIAlkb25lCiAgCUBlY2hvICJJbnN0YWxsaW5nICQoTElC
X0ZJTEUpIHRvICQoRExMX0lOU1RBTExfRElSKS8iCiAgCUBASU5TVEFMTF9MSUJACkBAIC0yNyw3
ICsyNyw3IEBAIGluZGV4IDc2MTlhZmMuLjlkZDA1M2QgMTAwNjQ0CiAgCUAkKElOU1RBTExfUFJP
R1JBTSkgJHtUQ0xfRVhFfSAiJChCSU5fSU5TVEFMTF9ESVIpL3RjbHNoJChWRVJTSU9OKSR7RVhF
X1NVRkZJWH0iCiAgCUBlY2hvICJJbnN0YWxsaW5nIHRjbENvbmZpZy5zaCB0byAkKENPTkZJR19J
TlNUQUxMX0RJUikvIgogZGlmZiAtLWdpdCBhL3VuaXgvdGNsLm00IGIvdW5peC90Y2wubTQKLWlu
ZGV4IDAzMDdhMDYuLjM3YzRkNjcgMTAwNjQ0CitpbmRleCA3ZjU0NjRlLi5jZDhkOTI5IDEwMDY0
NAogLS0tIGEvdW5peC90Y2wubTQKICsrKyBiL3VuaXgvdGNsLm00CiBAQCAtMTM3OCw2ICsxMzc4
LDkgQEAgQUNfREVGVU4oW1NDX0NPTkZJR19DRkxBR1NdLCBbCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1w
YXRoLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1vdmUt
aGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaAppbmRleCA5M2U3ODc3MjU2Li4wYTBjMTE3M2Ey
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92
ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy90Y2x0azgvdGNsOC90Y2wtcmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDA1MGZjNTk3ZmJmYTRkYTJjMzFiZDBkZjU4Yzg3MTg5MmE0OTA0
NzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDZlM2NiYzM2MDBhYzQ3NDc3NmU5MmVi
OWE4OGFiY2I3NDI5OWMzMjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiAiU29uZy5M
aSIgPFNvbmcuTGlAd2luZHJpdmVyLmNvbT4KIERhdGU6IFdlZCwgMSBBdWcgMjAxMiAxOTowNTo1
MSArMDgwMAogU3ViamVjdDogW1BBVENIXSB0Y2w6aW5zdGFsbCB0Y2wgdG8gbGliNjQgaW5zdGVh
ZCBvZiBsaWIgb24gNjRiaXQgdGFyZ2V0CkBAIC0xNywxMCArMTcsMTAgQEAgU2lnbmVkLW9mZi1i
eTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdW5peC9jb25maWd1cmUu
aW4gYi91bml4L2NvbmZpZ3VyZS5pbgotaW5kZXggNGY2MjUxMC4uNDk3NGZiNiAxMDA2NDQKK2lu
ZGV4IGU4OGVjM2MuLjhlNjcyNmIgMTAwNjQ0CiAtLS0gYS91bml4L2NvbmZpZ3VyZS5pbgogKysr
IGIvdW5peC9jb25maWd1cmUuaW4KLUBAIC03NzUsNyArNzc1LDcgQEAgZXZhbCAiVENMX0xJQl9G
SUxFPWxpYnRjbCR7TElCX1NVRkZJWH0iCitAQCAtNzc0LDcgKzc3NCw3IEBAIGV2YWwgIlRDTF9M
SUJfRklMRT1saWJ0Y2wke0xJQl9TVUZGSVh9IgogIAogIGV2YWwgIlRDTF9MSUJfRklMRT0ke1RD
TF9MSUJfRklMRX0iCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4
L3RjbDhfOC42LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4XzguNi4x
Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGs4L3RjbDhfOC42LjE1LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNsdGs4L3RjbDhfOC42LjE2LmJiCmluZGV4IGIxMzEwMmRkN2EuLjJlZThiZTU2ZDEgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTUuYmIKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xNi5iYgpAQCAtMjQsNyArMjQs
NyBAQCBTUkNfVVJJID0gIiR7QkFTRV9TUkNfVVJJfSBcCiAgICAgICAgICAgIGZpbGU6Ly9pbnRl
cnAucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwKICAgICAgICAgICAgIgot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0NDc3NTQ5MWU0MzVlMzRkODNkNmNjZmJhZGQxMzQyZjE4
NTVmMTcwNTI1MzIzM2E4NjE1MmRmMDc2NWU3OGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Iz
NzEzODZhOWE5MjhlZWNkYmYyNjNiY2FiN2Q2YTUzMWU2MjBjYTNmYmFiNGZkZWViM2Q2YTlhNTZm
MzhlOSIKIAogU1JDX1VSSTpjbGFzcy1uYXRpdmUgPSAiJHtCQVNFX1NSQ19VUkl9IgogCi0tIAoy
LjQ0LjEKCg==

--===============6652401400078194559==--

