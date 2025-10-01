Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51621CCF9E7
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:36 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17964.1759325545869003275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MnjBAN6+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fEBdNEAI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101999ff9666a-721effd7-cb3b-4552-801e-2301b9dbb504-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H+rnfGnCwCJfIJN/YUFaSt+scCvA0qyyz4/hHsQvH/g=;
	b=MnjBAN6+lt790OipdA4LHUznNcFzDLK0TXl8SnJyR8bcY7rezY5BR+i/MnjdLRz4
	gfmrvWd6Pbgc9Z3GH26jjVt/glqfWoB4kiQJE+vgNjmDrIER2d6sg41pqgcgMroeOcC
	xFxYyo2t5yOl76d+wZZanTVmruDkBl7J7RaNHV8U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325546;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H+rnfGnCwCJfIJN/YUFaSt+scCvA0qyyz4/hHsQvH/g=;
	b=fEBdNEAIP2Barrg28URDhHYm8dfwdbGj27R8Z5EDBPtT/i1/bGK2SIHX0q9/IqUK
	Y/AEp2P8OXgNKT9T6QE5acRFwc16b2qpRVNsaY55VkaYjV6JWHfmj9nPkQoE4Lmf9KQ
	tSTMbYHvbUgHF7fGHrLA9nHJ9xjdeByMRUYVUKCI=
Content-Type: multipart/mixed; boundary="===============0150805749253628506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tcl8: upgrading to 8.6.17 SUCCEEDED
Message-ID: <010101999ff9666a-721effd7-cb3b-4552-801e-2301b9dbb504-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224259

--===============0150805749253628506==
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
From a17c814707a572490803036c689101edf1c24c03 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 10:06:18 +0000
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
index 1859992838..33ebc0304d 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch
@@ -1,4 +1,4 @@
-From ff508f2e6786df697876140f21855ecb92a3ed36 Mon Sep 17 00:00:00 2001
+From 1af2b4376061522f2ccfbbdda05579ed02ee3061 Mon Sep 17 00:00:00 2001
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
index 6ceb297cea..3bee9c8025 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/alter-includedir.patch
@@ -1,4 +1,4 @@
-From 8bb8174e13c1c0e3b27fdf96a393f9fb1b7e14be Mon Sep 17 00:00:00 2001
+From 1e951b26223074b6c4e5edf5bc7e51a1886e19af Mon Sep 17 00:00:00 2001
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
index 61153878fe..dbe5f67429 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-From 3d11e7fd9aba6251974d990286347c06582e87b9 Mon Sep 17 00:00:00 2001
+From ee1929b212fd82c1d058258eec44faf382d8a569 Mon Sep 17 00:00:00 2001
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
index aeebb038e3..b0113c3381 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/interp.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/interp.patch
@@ -1,4 +1,4 @@
-From 09049beed723243d092ffaa37939dfe0f2ed6828 Mon Sep 17 00:00:00 2001
+From 2165a9298199f30d69d027944ccfa72bdfe7aa44 Mon Sep 17 00:00:00 2001
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
index 898e8241fc..9b55ae4823 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-add-soname.patch
@@ -1,4 +1,4 @@
-From 0d8e567d132e050c5d4a8d8d9257417e0679483c Mon Sep 17 00:00:00 2001
+From e3b9cb1f321a8d640f3c711cc9a80e8e7479b357 Mon Sep 17 00:00:00 2001
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
index f2a37add7d..a667bbaacd 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
+++ b/meta/recipes-devtools/tcltk8/tcl8/tcl-remove-hardcoded-install-path.patch
@@ -1,4 +1,4 @@
-From 6e3cbc3600ac474776e92eb9a88abcb74299c321 Mon Sep 17 00:00:00 2001
+From 840e6260c5147b18f60bad330e2b407924bdd476 Mon Sep 17 00:00:00 2001
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


--===============0150805749253628506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/tcl8: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8: SRC_URI changed from "https://downloads.sourceforge.net/tcl/tcl-core8.6.16-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch" to "https://downloads.sourceforge.net/tcl/tcl-core8.6.17-src.tar.gz file://tcl-add-soname.patch file://fix_non_native_build_issue.patch file://tcl-remove-hardcoded-install-path.patch file://alter-includedir.patch file://interp.patch file://run-ptest file://0001-generic-tcl.h-use-Tcl_WideInt-for-seconds-in-Tcl_Tim.patch"
packages/x86-64-v3-poky-linux/tcl8: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
Changes to packages/x86-64-v3-poky-linux/tcl8 (sysroot):
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGSIZE changed from 8135808 to 8146608 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dbg: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGSIZE changed from 1457961 to 1456911 (-0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-dev: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGSIZE changed from 3173260 to 3176831 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: FILELIST: added "/usr/share/man/man3/Tcl_CloseEx.3tcl8"
packages/x86-64-v3-poky-linux/tcl8/tcl8-doc: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-lib: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-locale: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGSIZE changed from 10107596 to 10120696 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: FILELIST: added "/usr/lib/tcl8/ptest/library/encoding/cp165.enc /usr/lib/tcl8/ptest/library/tzdata/America/Coyhaique"
packages/x86-64-v3-poky-linux/tcl8/tcl8-ptest: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGSIZE changed from 7650627 to 7653678 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-src: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGSIZE changed from 264164 to 264332 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8-staticdev: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
packages/x86-64-v3-poky-linux/tcl8/tcl8: PV changed from "8.6.16" to "8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGSIZE changed from 2232318 to 2233536 (+0%)
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILES: removed "/usr/lib/tcl8.6.16", added "/usr/lib/tcl8.6.17"
packages/x86-64-v3-poky-linux/tcl8/tcl8: FILELIST: removed "/usr/bin/tclsh8.6.16 /usr/lib/tcl8/8.5/tcltest-2.5.9.tm", added "/usr/bin/tclsh8.6.17 /usr/lib/tcl8/8.5/tcltest-2.5.10.tm /usr/lib/tcl8.6/encoding/cp165.enc"
packages/x86-64-v3-poky-linux/tcl8/tcl8: PKGV changed from 8.6.16 [default] to 8.6.17 [default]
Changes to packages/x86_64-linux/tcl8-native (sysroot):
  /usr/bin/tclsh8 changed symlink target from ./tclsh8.6.16 to ./tclsh8.6.17
  /usr/bin/tclsh8.6.16 moved to /usr/bin/tclsh8.6.17
  /usr/include/tcl8.6.16 moved to /usr/include/tcl8.6.17
  /usr/lib/tcl8.6/encoding/cp165.enc was added
  /usr/lib/tcl8/8.5/tcltest-2.5.10.tm was added
  /usr/lib/tcl8/8.5/tcltest-2.5.9.tm was removed

--===============0150805749253628506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-tcl8-upgrade-8.6.16-8.6.17.patch"

RnJvbSBhMTdjODE0NzA3YTU3MjQ5MDgwMzAzNmM2ODkxMDFlZGYxYzI0YzAzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAxMDowNjoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHRj
bDg6IHVwZ3JhZGUgOC42LjE2IC0+IDguNi4xNwoKLS0tCiAuLi5yaWMtdGNsLmgtdXNlLVRjbF9X
aWRlSW50LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0Y2ggfCA2ICsrKy0tLQogbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2ggIHwgOCArKysr
LS0tLQogLi4uL3RjbHRrOC90Y2w4L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoICAg
ICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvaW50ZXJw
LnBhdGNoICAgICAgICAgICAgfCA2ICsrKy0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoICAgIHwgNCArKy0tCiAuLi4vdGNsdGs4L3RjbDgv
dGNsLXJlbW92ZS1oYXJkY29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoICAgfCA0ICsrLS0KIC4uLi90
Y2x0azgve3RjbDhfOC42LjE2LmJiID0+IHRjbDhfOC42LjE3LmJifSAgICAgICAgICAgICB8IDIg
Ky0KIDcgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC97dGNsOF84LjYuMTYuYmIgPT4gdGNs
OF84LjYuMTcuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Rj
bHRrOC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQtZm9yLXNlY29uZHMt
aW4tVGNsX1RpbS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC8wMDAx
LWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRzLWluLVRjbF9UaW0ucGF0
Y2gKaW5kZXggMTg1OTk5MjgzOC4uMzNlYmMwMzA0ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3RjbHRrOC90Y2w4LzAwMDEtZ2VuZXJpYy10Y2wuaC11c2UtVGNsX1dpZGVJbnQt
Zm9yLXNlY29uZHMtaW4tVGNsX1RpbS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNsdGs4L3RjbDgvMDAwMS1nZW5lcmljLXRjbC5oLXVzZS1UY2xfV2lkZUludC1mb3Itc2Vjb25k
cy1pbi1UY2xfVGltLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmZjUwOGYyZTY3ODZkZjY5
Nzg3NjE0MGYyMTg1NWVjYjkyYTNlZDM2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAx
YWYyYjQzNzYwNjE1MjJmMmNjZmJiZGRhMDU1NzllZDAyZWUzMDYxIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KIERh
dGU6IEZyaSwgMTggQXVnIDIwMjMgMTI6MjU6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZ2Vu
ZXJpYy90Y2wuaDogdXNlIFRjbF9XaWRlSW50IGZvciBzZWNvbmRzIGluIFRjbF9UaW1lCkBAIC0x
OSwxMCArMTksMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGlu
dXRyb25peC5kZT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIAogZGlmZiAtLWdpdCBhL2dlbmVyaWMvdGNsLmggYi9nZW5lcmljL3RjbC5oCi1pbmRleCAz
YTQ2MjJlLi42MjA0YzU3IDEwMDY0NAoraW5kZXggZDhmZDcwYS4uZmZmZjRiMSAxMDA2NDQKIC0t
LSBhL2dlbmVyaWMvdGNsLmgKICsrKyBiL2dlbmVyaWMvdGNsLmgKLUBAIC0xNDE4LDcgKzE0MTgs
NyBAQCB0eXBlZGVmIGVudW0geworQEAgLTE0MjUsNyArMTQyNSw3IEBAIHR5cGVkZWYgZW51bSB7
CiAgICovCiAgCiAgdHlwZWRlZiBzdHJ1Y3QgVGNsX1RpbWUgewpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2FsdGVyLWluY2x1ZGVkaXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvYWx0ZXItaW5jbHVkZWRpci5wYXRjaAppbmRl
eCA2Y2ViMjk3Y2VhLi4zYmVlOWM4MDI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdGNsdGs4L3RjbDgvYWx0ZXItaW5jbHVkZWRpci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvdGNsdGs4L3RjbDgvYWx0ZXItaW5jbHVkZWRpci5wYXRjaApAQCAtMSw0ICsxLDQg
QEAKLUZyb20gOGJiODE3NGUxM2MxYzBlM2IyN2ZkZjk2YTM5M2Y5ZmIxYjdlMTRiZSBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWU5NTFiMjYyMjMwNzRiNmM0ZTVlZGY1YmM3ZTUxYTE4
ODZlMTlhZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE1pbmdsaSBZdSA8bWluZ2xp
Lnl1QHdpbmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDIyIE5vdiAyMDIyIDE4OjQ4OjI3ICswODAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHRjbDogdXBkYXRlIHRoZSBoZWFkZXIgbG9jYXRpb24KQEAgLTI2
LDcgKzI2LDcgQEAgU2lnbmVkLW9mZi1ieTogTWluZ2xpIFl1IDxtaW5nbGkueXVAd2luZHJpdmVy
LmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL3VuaXgvTWFrZWZpbGUuaW4gYi91bml4L01ha2VmaWxlLmluCi1pbmRl
eCBjM2I3NWUzLi42MGVkOTNlIDEwMDY0NAoraW5kZXggNDVlN2I3Ni4uNWE0NmU2YSAxMDA2NDQK
IC0tLSBhL3VuaXgvTWFrZWZpbGUuaW4KICsrKyBiL3VuaXgvTWFrZWZpbGUuaW4KIEBAIC01Nyw3
ICs1Nyw3IEBAIFNDUklQVF9JTlNUQUxMX0RJUgk9ICQoSU5TVEFMTF9ST09UKSQoVENMX0xJQlJB
UlkpCkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IGMzYjc1ZTMuLjYwZWQ5M2UgMTAwNjQ0CiAgIyBQ
YXRoIHRvIHRoZSBwcml2YXRlIHRjbCBoZWFkZXIgZGlyOgogIFBSSVZBVEVfSU5DTFVERV9ESVIJ
PSBAUFJJVkFURV9JTkNMVURFX0RJUkAKIGRpZmYgLS1naXQgYS91bml4L2NvbmZpZ3VyZS5pbiBi
L3VuaXgvY29uZmlndXJlLmluCi1pbmRleCA4ZTY3MjZiLi4yMzQ1Njg5IDEwMDY0NAoraW5kZXgg
NTBiM2UwMy4uOGEzM2QwYyAxMDA2NDQKIC0tLSBhL3VuaXgvY29uZmlndXJlLmluCiArKysgYi91
bml4L2NvbmZpZ3VyZS5pbgogQEAgLTc3NSw3ICs3NzUsNyBAQCBldmFsICJUQ0xfTElCX0ZJTEU9
bGlidGNsJHtMSUJfU1VGRklYfSIKQEAgLTUxLDcgKzUxLDcgQEAgaW5kZXggOGU2NzI2Yi4uMjM0
NTY4OSAxMDA2NDQKICBIVE1MX0RJUj0nJChESVNURElSKS9odG1sJwogIAogICMgTm90ZTogIGlu
IHRoZSBmb2xsb3dpbmcgdmFyaWFibGUsIGl0J3MgaW1wb3J0YW50IHRvIHVzZSB0aGUgYWJzb2x1
dGUKLUBAIC04OTgsNyArODk4LDcgQEAgVENMX0JVSUxEX1NUVUJfTElCX1BBVEg9ImBwd2RgLyR7
VENMX1NUVUJfTElCX0ZJTEV9IgorQEAgLTg5Niw3ICs4OTYsNyBAQCBUQ0xfQlVJTERfU1RVQl9M
SUJfUEFUSD0iYHB3ZGAvJHtUQ0xfU1RVQl9MSUJfRklMRX0iCiAgVENMX1NUVUJfTElCX1BBVEg9
IiR7VENMX1NUVUJfTElCX0RJUn0vJHtUQ0xfU1RVQl9MSUJfRklMRX0iCiAgCiAgIyBJbnN0YWxs
IHRpbWUgaGVhZGVyIGRpciBjYW4gYmUgc2V0IHZpYSAtLWluY2x1ZGVkaXIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9maXhfbm9uX25hdGl2ZV9idWlsZF9p
c3N1ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9maXhfbm9uX25h
dGl2ZV9idWlsZF9pc3N1ZS5wYXRjaAppbmRleCA2MTE1Mzg3OGZlLi5kYmU1ZjY3NDI5IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvZml4X25vbl9uYXRpdmVf
YnVpbGRfaXNzdWUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4
L2ZpeF9ub25fbmF0aXZlX2J1aWxkX2lzc3VlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAz
ZDExZTdmZDlhYmE2MjUxOTc0ZDk5MDI4NjM0N2MwNjU4MmU4N2I5IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBlZTE5MjliMjEyZmQ4MmMxZDA1ODI1OGVlYzQ0ZmFmMzgyZDhhNTY5IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTml0aW4gQSBLYW1ibGUgPG5pdGluLmEua2Ft
YmxlQGludGVsLmNvbT4KIERhdGU6IEZyaSwgMTMgQXVnIDIwMTAgMTI6MjQ6MDAgLTA3MDAKIFN1
YmplY3Q6IFtQQVRDSF0gdGNsOiBmaXggYSBidWlsZCBpc3N1ZQpAQCAtMTAsNyArMTAsNyBAQCBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3VuaXgvTWFrZWZpbGUuaW4gYi91bml4L01ha2VmaWxlLmluCi1pbmRleCBhMmY5ZTIx
Li5jM2I3NWUzIDEwMDY0NAoraW5kZXggYWIyZTdiNS4uNDVlN2I3NiAxMDA2NDQKIC0tLSBhL3Vu
aXgvTWFrZWZpbGUuaW4KICsrKyBiL3VuaXgvTWFrZWZpbGUuaW4KIEBAIC03MjMsNyArNzIzLDcg
QEAgdGNsdGVzdC1yZWFsOgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4L2ludGVycC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9p
bnRlcnAucGF0Y2gKaW5kZXggYWVlYmIwMzhlMy4uYjAxMTNjMzM4MSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L2ludGVycC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvaW50ZXJwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAot
RnJvbSAwOTA0OWJlZWQ3MjMyNDNkMDkyZmZhYTM3OTM5ZGZlMGYyZWQ2ODI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAyMTY1YTkyOTgxOTlmMzBkNjlkMDI3OTQ0Y2NmYTcyYmRmZTdh
YTQ0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVy
dG9uQGFybS5jb20+CiBEYXRlOiBNb24sIDEyIEp1bCAyMDIxIDE0OjUwOjEzICswMTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIHRjbDogZml4IHJhY2UgaW4gaW50ZXJwLnRlc3QKQEAgLTEzLDEwICsxMywx
MCBAQCBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvdGVzdHMvaW50ZXJwLnRlc3QgYi90ZXN0cy9pbnRlcnAudGVzdAotaW5kZXggMjRmZmIx
Yi4uYzY0NjBhZCAxMDA2NDQKK2luZGV4IGQ2NGZkZDQuLjk5MzFkZDEgMTAwNjQ0CiAtLS0gYS90
ZXN0cy9pbnRlcnAudGVzdAogKysrIGIvdGVzdHMvaW50ZXJwLnRlc3QKLUBAIC0zNjE0LDE3ICsz
NjE0LDE4IEBAIHRlc3QgaW50ZXJwLTM2Ljcge0NoaWxkQmdlcnJvciBzZXRzIGVycm9yIGhhbmRs
ZXIgb2YgY2hpbGQgWzE5OTkwMzVdfSAtc2V0dXAgeworQEAgLTM2NTEsMTcgKzM2NTEsMTggQEAg
dGVzdCBpbnRlcnAtMzYuNyB7Q2hpbGRCZ2Vycm9yIHNldHMgZXJyb3IgaGFuZGxlciBvZiBjaGls
ZCBbMTk5OTAzNV19IC1zZXR1cCB7CiAgICAgICAgICB2YXJpYWJsZSByZXN1bHQKICAgICAgICAg
IHNldCByZXN1bHQgW2xpbmRleCAkYXJncyAwXQogICAgICB9CmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLWFkZC1zb25hbWUucGF0Y2gKaW5kZXggODk4
ZTgyNDFmYy4uOWI1NWFlNDgyMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Rj
bHRrOC90Y2w4L3RjbC1hZGQtc29uYW1lLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy90Y2x0azgvdGNsOC90Y2wtYWRkLXNvbmFtZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MGQ4ZTU2N2QxMzJlMDUwYzVkNGE4ZDhkOTI1NzQxN2UwNjc5NDgzYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gZTNiOWNiMWYzMjFhOGQ2NDBmM2M3MTFjYzlhODBlOGU3NDc5YjM1NyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxycHVyZGllQGxp
bnV4LmludGVsLmNvbT4KIERhdGU6IFdlZCwgOSBEZWMgMjAwOSAyMzo1OTo0NCArMDAwMAogU3Vi
amVjdDogW1BBVENIXSB0Y2w6IEFkZCB0Y2x0ayBmcm9tIE9FLmRldiBidXQgd2l0aCBsZWdhY3kg
c3RhZ2luZyBmdW5jdGlvbgpAQCAtMTEsNyArMTEsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgogIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS91bml4L01ha2VmaWxlLmlu
IGIvdW5peC9NYWtlZmlsZS5pbgotaW5kZXggYmM3NDNiMy4uYTJmOWUyMSAxMDA2NDQKK2luZGV4
IDNlZmRmZWMuLmFiMmU3YjUgMTAwNjQ0CiAtLS0gYS91bml4L01ha2VmaWxlLmluCiArKysgYi91
bml4L01ha2VmaWxlLmluCiBAQCAtODEyLDcgKzgxMiwxMCBAQCBpbnN0YWxsLWJpbmFyaWVzOiBi
aW5hcmllcwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3Rj
bC1yZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy90Y2x0azgvdGNsOC90Y2wtcmVtb3ZlLWhhcmRjb2RlZC1pbnN0YWxsLXBhdGgucGF0Y2gK
aW5kZXggZjJhMzdhZGQ3ZC4uYTY2N2JiYWFjZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjbHRrOC90Y2w4L3RjbC1yZW1vdmUtaGFyZGNvZGVkLWluc3RhbGwtcGF0aC5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvdGNsLXJlbW92ZS1oYXJk
Y29kZWQtaW5zdGFsbC1wYXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2ZTNjYmMzNjAw
YWM0NzQ3NzZlOTJlYjlhODhhYmNiNzQyOTljMzIxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA4NDBlNjI2MGM1MTQ3YjE4ZjYwYmFkMzMwZTJiNDA3OTI0YmRkNDc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogIlNvbmcuTGkiIDxTb25nLkxpQHdpbmRyaXZlci5jb20+CiBE
YXRlOiBXZWQsIDEgQXVnIDIwMTIgMTk6MDU6NTEgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGNs
Omluc3RhbGwgdGNsIHRvIGxpYjY0IGluc3RlYWQgb2YgbGliIG9uIDY0Yml0IHRhcmdldApAQCAt
MTcsNyArMTcsNyBAQCBTaWduZWQtb2ZmLWJ5OiBZaSBaaGFvIDx5aS56aGFvQHdpbmRyaXZlci5j
b20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRp
ZmYgLS1naXQgYS91bml4L2NvbmZpZ3VyZS5pbiBiL3VuaXgvY29uZmlndXJlLmluCi1pbmRleCBl
ODhlYzNjLi44ZTY3MjZiIDEwMDY0NAoraW5kZXggZWQwN2NhNS4uNTBiM2UwMyAxMDA2NDQKIC0t
LSBhL3VuaXgvY29uZmlndXJlLmluCiArKysgYi91bml4L2NvbmZpZ3VyZS5pbgogQEAgLTc3NCw3
ICs3NzQsNyBAQCBldmFsICJUQ0xfTElCX0ZJTEU9bGlidGNsJHtMSUJfU1VGRklYfSIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTYuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDhfOC42LjE3LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTYu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOF84LjYuMTcuYmIK
aW5kZXggMjI1ZjA0YmU0OC4uZDRiZGQ3MWMwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3RjbHRrOC90Y2w4XzguNi4xNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
dGNsdGs4L3RjbDhfOC42LjE3LmJiCkBAIC0yNSw3ICsyNSw3IEBAIFNSQ19VUkkgPSAiJHtCQVNF
X1NSQ19VUkl9IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLWdlbmVyaWMtdGNsLmgtdXNlLVRjbF9XaWRlSW50LWZvci1zZWNvbmRzLWluLVRj
bF9UaW0ucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2IzNzEz
ODZhOWE5MjhlZWNkYmYyNjNiY2FiN2Q2YTUzMWU2MjBjYTNmYmFiNGZkZWViM2Q2YTlhNTZmMzhl
OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhMWQ4Y2JlNDRiMzhiZWFhMjlmYzIxMzBjNGU3Yjc5
YjhiZjAyZTJiY2MwMjhmZmVmZDdhMjVhMjEyMjIwMmEwIgogCiBTUkNfVVJJOmNsYXNzLW5hdGl2
ZSA9ICIke0JBU0VfU1JDX1VSSX0iCiAKLS0gCjIuNDcuMQoK

--===============0150805749253628506==
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

--===============0150805749253628506==--

