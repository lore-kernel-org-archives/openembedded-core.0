Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B87CAC5A5
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:47 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.30922.1757937279454211387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mki1tufR;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pIlP3k08;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a36b3-12bec4ab-6657-4023-80d6-859bdba85bb4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7pjyAaxVy048f6dnk1JI1cXXNKQ0sD8f3q+/Iog6ed0=;
	b=mki1tufRJWT3knbLs302snK1ZR7kSZekSu9pWNQ2K/PpW24wXRShPqYF2UhunqIU
	4lmEyxanrJvzziahvgkmQvtfQSqhEoex01sCJE+RZ56xbBFYuNUXBj//2wTBEUFf0YI
	6cM/z2Hf7Cb7caQtARyLGTYWIk26U1Xn1q+rA8TY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937284;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7pjyAaxVy048f6dnk1JI1cXXNKQ0sD8f3q+/Iog6ed0=;
	b=pIlP3k08mk5xdJh2fHG3b+DQDR3zbja27jHKCmOcq8LZxlZMYNRMru8myTGGTBsK
	5of7Zag8znl3cWyp4Ty8zRcHQQdDw/GVkVCTOthWNi3s7IBYaO6MwHcRYm8Gqu2+0Zq
	ntOCezDV/2zydok/FJKEGhAInwS64mAe9zhWvpCA=
Content-Type: multipart/mixed; boundary="===============6448579956824323088=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.17 SUCCEEDED
Message-ID: <010101994d3a36b3-12bec4ab-6657-4023-80d6-859bdba85bb4-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223436

--===============6448579956824323088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *tcl8* to *8.6.17* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tcl8-upgrade-8.6.16-8.6.17.patch
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
From 6955f3ca43b1a9a9673e82e4633fcca3e35780f4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 08:42:10 +0000
Subject: [PATCH] tcl8: upgrade 8.6.16 -> 8.6.17

---
 ...ric-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch  | 8 ++++----
 .../tcltk8/tcl8/fix_non_native_build_issue.patch          | 4 ++--
 meta/recipes-devtools/tcltk8/tcl8/interp.patch            | 6 +++---
 meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch    | 4 ++--
 .../tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch   | 4 ++--
 .../tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb}             | 2 +-
 7 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/tcltk8/{tcl8_8.6.16.bb => tcl8_8.6.17.bb} (98%)

diff --git a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
index 1859992838..a4b407bff9 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From 540c8f578216c6d591c9555d53f1b1d58f510dae Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 18 Aug 2023 12:25:11 +0200
 Subject: [PATCH] generic/tcl.h: use Tcl_WideInt for seconds in Tcl_Time
@@ -19,10 +19,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/generic/tcl.h b/generic/tcl.h
-index 3a4622e..6204c57 100644
+index d8fd70a..ffff4b1 100644
 --- a/generic/tcl.h
 +++ b/generic/tcl.h
-@@ -1418,7 +1418,7 @@ typedef enum {
+@@ -1425,7 +1425,7 @@ typedef enum {
   */
  
  typedef struct Tcl_Time {
diff --git a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
index 6ceb297cea..1db9b8a7fe 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
+From 7babb8e0bd8f37500d31f18d9b8a60f207d78eae Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 22 Nov 2022 18:48:27 +0800
 Subject: [PATCH] tcl: update the header location
@@ -26,7 +26,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index c3b75e3..60ed93e 100644
+index 45e7b76..5a46e6a 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -57,7 +57,7 @@ SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
@@ -39,7 +39,7 @@ index c3b75e3..60ed93e 100644
  # Path to the private tcl header dir:
  PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
 diff --git a/unix/configure.in b/unix/configure.in
-index 8e6726b..2345689 100644
+index 50b3e03..8a33d0c 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -775,7 +775,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
@@ -51,7 +51,7 @@ index 8e6726b..2345689 100644
  HTML_DIR='$(DISTDIR)/html'
  
  # Note:  in the following variable, it's important to use the absolute
-@@ -898,7 +898,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
+@@ -896,7 +896,7 @@ TCL_BUILD_STUB_LIB_PATH="`pwd`/${TCL_STUB_LIB_FILE}"
  TCL_STUB_LIB_PATH="${TCL_STUB_LIB_DIR}/${TCL_STUB_LIB_FILE}"
  
  # Install time header dir can be set via --includedir
diff --git a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
index 61153878fe..4ab2d852e5 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
+From b1a0866c3b9736d81feeb55201683e74ccd688d1 Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Fri, 13 Aug 2010 12:24:00 -0700
 Subject: [PATCH] tcl: fix a build issue
@@ -10,7 +10,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index a2f9e21..c3b75e3 100644
+index ab2e7b5..45e7b76 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -723,7 +723,7 @@ tcltest-real:
diff --git a/meta/recipes-devtools/tcltk8/tcl8/interp.patch b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
index aeebb038e3..94d270d719 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
+From e129dd0d8caef525320578a0c4138c7195a71050 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 12 Jul 2021 14:50:13 +0100
 Subject: [PATCH] tcl: fix race in interp.test
@@ -13,10 +13,10 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/tests/interp.test b/tests/interp.test
-index 24ffb1b..c6460ad 100644
+index d64fdd4..9931dd1 100644
 --- a/tests/interp.test
 +++ b/tests/interp.test
-@@ -3614,17 +3614,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
+@@ -3651,17 +3651,18 @@ test interp-36.7 {ChildBgerror sets error handler of child [1999035]} -setup {
          variable result
          set result [lindex $args 0]
      }
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
index 898e8241fc..03ec186970 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
+From 2590b6937048f3fb5a87d1a94d9332055886185d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 9 Dec 2009 23:59:44 +0000
 Subject: [PATCH] tcl: Add tcltk from OE.dev but with legacy staging function
@@ -11,7 +11,7 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 7 insertions(+), 1 deletion(-)
 
 diff --git a/unix/Makefile.in b/unix/Makefile.in
-index bc743b3..a2f9e21 100644
+index 3efdfec..ab2e7b5 100644
 --- a/unix/Makefile.in
 +++ b/unix/Makefile.in
 @@ -812,7 +812,10 @@ install-binaries: binaries
diff --git a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
index f2a37add7d..4a81adf07b 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
+From 9904bd5397489b2f8b4e65f0e9fdebb81ef88b30 Mon Sep 17 00:00:00 2001
 From: "Song.Li" <Song.Li@windriver.com>
 Date: Wed, 1 Aug 2012 19:05:51 +0800
 Subject: [PATCH] tcl:install tcl to lib64 instead of lib on 64bit target
@@ -17,7 +17,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/unix/configure.in b/unix/configure.in
-index e88ec3c..8e6726b 100644
+index ed07ca5..50b3e03 100644
 --- a/unix/configure.in
 +++ b/unix/configure.in
 @@ -774,7 +774,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
diff --git a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
similarity index 98%
rename from meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
rename to meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
index 225f04be48..d4bdd71c05 100644
--- a/meta/recipes-devtools/tcltk8/tcl8_8.6.16.bb
+++ b/meta/recipes-devtools/tcltk8/tcl8_8.6.17.bb
@@ -25,7 +25,7 @@ SRC_URI = "${BASE_SRC_URI} \
            file://run-ptest \
            file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch \
            "
-SRC_URI[sha256sum] = "3b371386a9a928eecdbf263bcab7d6a531e620ca3fbab4fdeeb3d6a9a56f38e9"
+SRC_URI[sha256sum] = "a1d8cbe44b38beaa29fc2130c4e7b79b8bf02e2bcc028ffefd7a25a2122202a0"
 
 SRC_URI:class-native = "${BASE_SRC_URI}"
 
-- 
2.47.1


--===============6448579956824323088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.16-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.17-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch"
packages/x86-64-v3-poky-linux/tcl8: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8: PV changed from "8.6.16" to "8.6.17"
Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8135800 to 8146600 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1457961 to 1456911 (-0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3173260 to 3176831 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: FILELIST: added "/usr/share/man/man3/Tcl_CloseEx.3tcl8"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 10107596 to 10120696 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: FILELIST: added "/usr/lib/tcl8/ptest/library/tzdata/America/Coyhaique /usr/lib/tcl8/ptest/library/encoding/cp165.enc"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7650627 to 7653678 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGSIZE changed from 264164 to 264332 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.16", added "/usr/lib/tcl8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGSIZE changed from 2232318 to 2233536 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/bin/tclsh8.6.16 /usr/lib/tcl8/8.5/tcltest-2.5.9.tm", added "/usr/lib/tcl8/8.5/tcltest-2.5.10.tm /usr/bin/tclsh8.6.17 /usr/lib/tcl8.6/encoding/cp165.enc"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PV changed from "8.6.16" to "8.6.17"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.16 to ./tclsh8.6.17
  /usr/bin/tclsh8.6.16 moved to /usr/bin/tclsh8.6.17
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed

--===============6448579956824323088==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.16-8.6.17.patch"

RnJvbSA2OTU1ZjNjYTQzYjFhOWE5NjczZTgyZTQ2MzNmY2NhM2UzNTc4MGY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDg6NDI6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB0
Y2w4OiB1cGdyYWRlIDguNi4xNiAtPiA4LjYuMTcKCi0tLQogLi4ucmljLXRjbC5oLXVzZS1UY2xf
V2lkZUludC1mb3Itc2Vjb25kcy1pbi1UY2xfVGltLnBhdGNoIHwgNiArKystLS0KIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1pbmNsdWRlZGlyLnBhdGNoICB8IDggKysr
Ky0tLS0KIC4uLi90Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaCAg
ICAgICAgICB8IDQgKystLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVy
cC5wYXRjaCAgICAgICAgICAgIHwgNiArKystLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaCAgICB8IDQgKystLQogLi4uL3RjbHRrOC90Y2w4
L3RjbC1yZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaCAgIHwgNCArKy0tCiAuLi4v
dGNsdGs4L3t0Y2w4XzguNi4xNi5iYiA9PiB0Y2w4XzguNi4xNy5iYn0gICAgICAgICAgICAgfCAy
ICstCiA3IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgve3RjbDhfOC42LjE2LmJiID0+IHRj
bDhfOC42LjE3LmJifSAoOTglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90
Y2x0azgvdGNsOC8wMDAxLWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRz
LWluLVRjbF9UaW0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvMDAw
MS1nZW5lcmljLXRjbC5oLXVzZS1UY2xfV2lkZUludC1mb3Itc2Vjb25kcy1pbi1UY2xfVGltLnBh
dGNoCmluZGV4IDE4NTk5OTI4MzguLmE0YjQwN2JmZjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy90Y2x0azgvdGNsOC8wMDAxLWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50
LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3RjbHRrOC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQtZm9yLXNlY29u
ZHMtaW4tVGNsX1RpbS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZmY1MDhmMmU2Nzg2ZGY2
OTc4NzYxNDBmMjE4NTVlY2I5MmEzZWQzNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
NTQwYzhmNTc4MjE2YzZkNTkxYzk1NTVkNTNmMWIxZDU4ZjUxMGRhZSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9uaXguZGU+CiBE
YXRlOiBGcmksIDE4IEF1ZyAyMDIzIDEyOjI1OjExICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGdl
bmVyaWMvdGNsLmg6IHVzZSBUY2xfV2lkZUludCBmb3Igc2Vjb25kcyBpbiBUY2xfVGltZQpAQCAt
MTksMTAgKzE5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxp
bnV0cm9uaXguZGU+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiAKIGRpZmYgLS1naXQgYS9nZW5lcmljL3RjbC5oIGIvZ2VuZXJpYy90Y2wuaAotaW5kZXgg
M2E0NjIyZS4uNjIwNGM1NyAxMDA2NDQKK2luZGV4IGQ4ZmQ3MGEuLmZmZmY0YjEgMTAwNjQ0CiAt
LS0gYS9nZW5lcmljL3RjbC5oCiArKysgYi9nZW5lcmljL3RjbC5oCi1AQCAtMTQxOCw3ICsxNDE4
LDcgQEAgdHlwZWRlZiBlbnVtIHsKK0BAIC0xNDI1LDcgKzE0MjUsNyBAQCB0eXBlZGVmIGVudW0g
ewogICAqLwogIAogIHR5cGVkZWYgc3RydWN0IFRjbF9UaW1lIHsKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9hbHRlci1pbmNsdWRlZGlyLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2gKaW5k
ZXggNmNlYjI5N2NlYS4uMWRiOWI4YTdmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2gKQEAgLTEsNCArMSw0
IEBACi1Gcm9tIDhiYjgxNzRlMTNjMWMwZTNiMjdmZGY5NmEzOTNmOWZiMWI3ZTE0YmUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDdiYWJiOGUwYmQ4ZjM3NTAwZDMxZjE4ZDliOGE2MGYy
MDdkNzhlYWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBNaW5nbGkgWXUgPG1pbmds
aS55dUB3aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyMiBOb3YgMjAyMiAxODo0ODoyNyArMDgw
MAogU3ViamVjdDogW1BBVENIXSB0Y2w6IHVwZGF0ZSB0aGUgaGVhZGVyIGxvY2F0aW9uCkBAIC0y
Niw3ICsyNiw3IEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZl
ci5jb20+CiAgMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5k
ZXggYzNiNzVlMy4uNjBlZDkzZSAxMDA2NDQKK2luZGV4IDQ1ZTdiNzYuLjVhNDZlNmEgMTAwNjQ0
CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmluCiBAQCAtNTcs
NyArNTcsNyBAQCBTQ1JJUFRfSU5TVEFMTF9ESVIJPSAkKElOU1RBTExfUk9PVCkkKFRDTF9MSUJS
QVJZKQpAQCAtMzksNyArMzksNyBAQCBpbmRleCBjM2I3NWUzLi42MGVkOTNlIDEwMDY0NAogICMg
UGF0aCB0byB0aGUgcHJpdmF0ZSB0Y2wgaGVhZGVyIGRpcjoKICBQUklWQVRFX0lOQ0xVREVfRElS
CT0gQFBSSVZBVEVfSU5DTFVERV9ESVJACiBkaWZmIC0tZ2l0IGEvdW5peC9jb25maWd1cmUuaW4g
Yi91bml4L2NvbmZpZ3VyZS5pbgotaW5kZXggOGU2NzI2Yi4uMjM0NTY4OSAxMDA2NDQKK2luZGV4
IDUwYjNlMDMuLjhhMzNkMGMgMTAwNjQ0CiAtLS0gYS91bml4L2NvbmZpZ3VyZS5pbgogKysrIGIv
dW5peC9jb25maWd1cmUuaW4KIEBAIC03NzUsNyArNzc1LDcgQEAgZXZhbCAiVENMX0xJQl9GSUxF
PWxpYnRjbCR7TElCX1NVRkZJWH0iCkBAIC01MSw3ICs1MSw3IEBAIGluZGV4IDhlNjcyNmIuLjIz
NDU2ODkgMTAwNjQ0CiAgSFRNTF9ESVI9JyQoRElTVERJUikvaHRtbCcKICAKICAjIE5vdGU6ICBp
biB0aGUgZm9sbG93aW5nIHZhcmlhYmxlLCBpdCdzIGltcG9ydGFudCB0byB1c2UgdGhlIGFic29s
dXRlCi1AQCAtODk4LDcgKzg5OCw3IEBAIFRDTF9CVUlMRF9TVFVCX0xJQl9QQVRIPSJgcHdkYC8k
e1RDTF9TVFVCX0xJQl9GSUxFfSIKK0BAIC04OTYsNyArODk2LDcgQEAgVENMX0JVSUxEX1NUVUJf
TElCX1BBVEg9ImBwd2RgLyR7VENMX1NUVUJfTElCX0ZJTEV9IgogIFRDTF9TVFVCX0xJQl9QQVRI
PSIke1RDTF9TVFVCX0xJQl9ESVJ9LyR7VENMX1NUVUJfTElCX0ZJTEV9IgogIAogICMgSW5zdGFs
bCB0aW1lIGhlYWRlciBkaXIgY2FuIGJlIHNldCB2aWEgLS1pbmNsdWRlZGlyCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvZml4X25vbl9uYXRpdmVfYnVpbGRf
aXNzdWUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvZml4X25vbl9u
YXRpdmVfYnVpbGRfaXNzdWUucGF0Y2gKaW5kZXggNjExNTM4NzhmZS4uNGFiMmQ4NTJlNSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ZpeF9ub25fbmF0aXZl
X2J1aWxkX2lzc3VlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNs
OC9maXhfbm9uX25hdGl2ZV9idWlsZF9pc3N1ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
M2QxMWU3ZmQ5YWJhNjI1MTk3NGQ5OTAyODYzNDdjMDY1ODJlODdiOSBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gYjFhMDg2NmMzYjk3MzZkODFmZWViNTUyMDE2ODNlNzRjY2Q2ODhkMSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE5pdGluIEEgS2FtYmxlIDxuaXRpbi5hLmth
bWJsZUBpbnRlbC5jb20+CiBEYXRlOiBGcmksIDEzIEF1ZyAyMDEwIDEyOjI0OjAwIC0wNzAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHRjbDogZml4IGEgYnVpbGQgaXNzdWUKQEAgLTEwLDcgKzEwLDcgQEAg
U2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAx
IGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS91bml4L01ha2VmaWxlLmluIGIvdW5peC9NYWtlZmlsZS5pbgotaW5kZXggYTJmOWUy
MS4uYzNiNzVlMyAxMDA2NDQKK2luZGV4IGFiMmU3YjUuLjQ1ZTdiNzYgMTAwNjQ0CiAtLS0gYS91
bml4L01ha2VmaWxlLmluCiArKysgYi91bml4L01ha2VmaWxlLmluCiBAQCAtNzIzLDcgKzcyMyw3
IEBAIHRjbHRlc3QtcmVhbDoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0
azgvdGNsOC9pbnRlcnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgv
aW50ZXJwLnBhdGNoCmluZGV4IGFlZWJiMDM4ZTMuLjk0ZDI3MGQ3MTkgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9pbnRlcnAucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVycC5wYXRjaApAQCAtMSw0ICsxLDQgQEAK
LUZyb20gMDkwNDliZWVkNzIzMjQzZDA5MmZmYWEzNzkzOWRmZTBmMmVkNjgyOCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTEyOWRkMGQ4Y2FlZjUyNTMyMDU3OGEwYzQxMzhjNzE5NWE3
MTA1MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1
cnRvbkBhcm0uY29tPgogRGF0ZTogTW9uLCAxMiBKdWwgMjAyMSAxNDo1MDoxMyArMDEwMAogU3Vi
amVjdDogW1BBVENIXSB0Y2w6IGZpeCByYWNlIGluIGludGVycC50ZXN0CkBAIC0xMywxMCArMTMs
MTAgQEAgU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3Rlc3RzL2ludGVycC50ZXN0IGIvdGVzdHMvaW50ZXJwLnRlc3QKLWluZGV4IDI0ZmZi
MWIuLmM2NDYwYWQgMTAwNjQ0CitpbmRleCBkNjRmZGQ0Li45OTMxZGQxIDEwMDY0NAogLS0tIGEv
dGVzdHMvaW50ZXJwLnRlc3QKICsrKyBiL3Rlc3RzL2ludGVycC50ZXN0Ci1AQCAtMzYxNCwxNyAr
MzYxNCwxOCBAQCB0ZXN0IGludGVycC0zNi43IHtDaGlsZEJnZXJyb3Igc2V0cyBlcnJvciBoYW5k
bGVyIG9mIGNoaWxkIFsxOTk5MDM1XX0gLXNldHVwIHsKK0BAIC0zNjUxLDE3ICszNjUxLDE4IEBA
IHRlc3QgaW50ZXJwLTM2Ljcge0NoaWxkQmdlcnJvciBzZXRzIGVycm9yIGhhbmRsZXIgb2YgY2hp
bGQgWzE5OTkwMzVdfSAtc2V0dXAgewogICAgICAgICAgdmFyaWFibGUgcmVzdWx0CiAgICAgICAg
ICBzZXQgcmVzdWx0IFtsaW5kZXggJGFyZ3MgMF0KICAgICAgfQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoCmluZGV4IDg5
OGU4MjQxZmMuLjAzZWMxODY5NzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90
Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IDBkOGU1NjdkMTMyZTA1MGM1ZDRhOGQ4ZDkyNTc0MTdlMDY3OTQ4M2MgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDI1OTBiNjkzNzA0OGYzZmI1YTg3ZDFhOTRkOTMzMjA1NTg4NjE4NWQg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cnB1cmRpZUBs
aW51eC5pbnRlbC5jb20+CiBEYXRlOiBXZWQsIDkgRGVjIDIwMDkgMjM6NTk6NDQgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGNsOiBBZGQgdGNsdGsgZnJvbSBPRS5kZXYgYnV0IHdpdGggbGVnYWN5
IHN0YWdpbmcgZnVuY3Rpb24KQEAgLTExLDcgKzExLDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvdW5peC9NYWtlZmlsZS5p
biBiL3VuaXgvTWFrZWZpbGUuaW4KLWluZGV4IGJjNzQzYjMuLmEyZjllMjEgMTAwNjQ0CitpbmRl
eCAzZWZkZmVjLi5hYjJlN2I1IDEwMDY0NAogLS0tIGEvdW5peC9NYWtlZmlsZS5pbgogKysrIGIv
dW5peC9NYWtlZmlsZS5pbgogQEAgLTgxMiw3ICs4MTIsMTAgQEAgaW5zdGFsbC1iaW5hcmllczog
YmluYXJpZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC90
Y2wtcmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNo
CmluZGV4IGYyYTM3YWRkN2QuLjRhODFhZGYwN2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOC90Y2wtcmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1vdmUtaGFy
ZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmUzY2JjMzYw
MGFjNDc0Nzc2ZTkyZWI5YTg4YWJjYjc0Mjk5YzMyMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTkwNGJkNTM5NzQ4OWIyZjhiNGU2NWYwZTlmZGViYjgxZWY4OGIzMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206ICJTb25nLkxpIiA8U29uZy5MaUB3aW5kcml2ZXIuY29tPgog
RGF0ZTogV2VkLCAxIEF1ZyAyMDEyIDE5OjA1OjUxICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRj
bDppbnN0YWxsIHRjbCB0byBsaWI2NCBpbnN0ZWFkIG9mIGxpYiBvbiA2NGJpdCB0YXJnZXQKQEAg
LTE3LDcgKzE3LDcgQEAgU2lnbmVkLW9mZi1ieTogWWkgWmhhbyA8eWkuemhhb0B3aW5kcml2ZXIu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBk
aWZmIC0tZ2l0IGEvdW5peC9jb25maWd1cmUuaW4gYi91bml4L2NvbmZpZ3VyZS5pbgotaW5kZXgg
ZTg4ZWMzYy4uOGU2NzI2YiAxMDA2NDQKK2luZGV4IGVkMDdjYTUuLjUwYjNlMDMgMTAwNjQ0CiAt
LS0gYS91bml4L2NvbmZpZ3VyZS5pbgogKysrIGIvdW5peC9jb25maWd1cmUuaW4KIEBAIC03NzQs
NyArNzc0LDcgQEAgZXZhbCAiVENMX0xJQl9GSUxFPWxpYnRjbCR7TElCX1NVRkZJWH0iCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE2LmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xNy5iYgpzaW1pbGFyaXR5IGluZGV4
IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE2
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE3LmJi
CmluZGV4IDIyNWYwNGJlNDguLmQ0YmRkNzFjMDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3RjbHRrOC90Y2w4XzguNi4xNy5iYgpAQCAtMjUsNyArMjUsNyBAQCBTUkNfVVJJID0gIiR7QkFT
RV9TUkNfVVJJfSBcCiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICBm
aWxlOi8vMDAwMS1nZW5lcmljLXRjbC5oLXVzZS1UY2xfV2lkZUludC1mb3Itc2Vjb25kcy1pbi1U
Y2xfVGltLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNiMzcx
Mzg2YTlhOTI4ZWVjZGJmMjYzYmNhYjdkNmE1MzFlNjIwY2EzZmJhYjRmZGVlYjNkNmE5YTU2ZjM4
ZTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTFkOGNiZTQ0YjM4YmVhYTI5ZmMyMTMwYzRlN2I3
OWI4YmYwMmUyYmNjMDI4ZmZlZmQ3YTI1YTIxMjIyMDJhMCIKIAogU1JDX1VSSTpjbGFzcy1uYXRp
dmUgPSAiJHtCQVNFX1NSQ19VUkl9IgogCi0tIAoyLjQ3LjEKCg==

--===============6448579956824323088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: FILELIST: added "/usr/share/man/man3/Tcl_CloseEx.3tcl8"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: FILELIST: added "/usr/lib/tcl8/ptest/library/tzdata/America/Coyhaique /usr/lib/tcl8/ptest/library/encoding/cp165.enc"
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/bin/tclsh8.6.16 /usr/lib/tcl8/8.5/tcltest-2.5.9.tm", added "/usr/lib/tcl8/8.5/tcltest-2.5.10.tm /usr/bin/tclsh8.6.17 /usr/lib/tcl8.6/encoding/cp165.enc"
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.16 to ./tclsh8.6.17
  /usr/bin/tclsh8.6.16 moved to /usr/bin/tclsh8.6.17
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed

--===============6448579956824323088==--

