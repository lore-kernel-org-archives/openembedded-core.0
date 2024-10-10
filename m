Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2264D0EE08
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:05 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.53279.1728588959460023581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SwnFKGNg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=g9Pol8La;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee5445-d390e3b8-e844-45d8-a77f-6716c38401d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588960;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jlh34XxSTMdMTqEdMt2N2lS3Eqkbb0v1cl5O54JRTxs=;
	b=SwnFKGNgYRL1NA2X2xuhOKE1CkBgf/v/1j8gTg9yF2Zx1H/rEa5CIOmOQC4J2tMn
	iAiNFDOJ1+gyy681QXlcfCs4xf76T0xtkjoGaLXr5oL9bHVIiIul3let2eDtc6B+Snz
	7lUJsY65WM8s8QvJbU92gYxCi+xQ9F29UFha1JHY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588960;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jlh34XxSTMdMTqEdMt2N2lS3Eqkbb0v1cl5O54JRTxs=;
	b=g9Pol8LaxWfs28jmAc2exkCJOeNnaTA2WUd5Z7wvo8DCySEADI/jG7rUeXFncJlo
	t5+SzdFCg441UimOhxArgvpzvPbnkgoDOkXadDs1tE/kolmycHtKrJ+G4PkQb3B8iYT
	audXvdcprqUaLAPqcMVikfLaCZThb+3SZueSzLH0=
Content-Type: multipart/mixed; boundary="===============5554232465279133531=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bash: upgrading to 5.2.37 SUCCEEDED
Message-ID: <0101019277ee5445-d390e3b8-e844-45d8-a77f-6716c38401d5-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205497

--===============5554232465279133531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *bash* to *5.2.37* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bash-upgrade-5.2.32-5.2.37.patch
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
From c8246313788ec2b02371f539999c651598aae3a4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 02:57:47 +0000
Subject: [PATCH] bash: upgrade 5.2.32 -> 5.2.37

---
 ...T-handler-while-waiting-for-a-child-.patch |  2 +-
 .../bash/bash/0001-fix-c99.patch              | 20 +++----------------
 .../bash/bash/build-tests.patch               |  2 +-
 .../bash/bash/fix-filesubst-errexit.patch     |  2 +-
 .../bash/bash/fix-run-builtins.patch          |  2 +-
 .../bash/bash/mkbuiltins_have_stringize.patch |  2 +-
 .../bash/bash/test-output.patch               |  2 +-
 .../bash/bash/use_aclocal.patch               |  4 ++--
 .../bash/{bash_5.2.32.bb => bash_5.2.37.bb}   |  2 +-
 9 files changed, 12 insertions(+), 26 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.32.bb => bash_5.2.37.bb} (90%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
index 4e73edb9b3..2c5d040d8f 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -1,4 +1,4 @@
-From e4b9493ae4923595ec3ca67f85322129fb3056cf Mon Sep 17 00:00:00 2001
+From 734e2f30abe9c0f0660cfe535dc8704e818dec4a Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Mon, 30 Oct 2023 12:16:07 -0400
 Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
index abd83d09af..7cd08d7831 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
+From 34a103b566280d751d44c6df0d3f025fe5f89b10 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
@@ -8,9 +8,8 @@ Backport some fixes from upstream to fix configure checks that fail with GCC 14.
 Upstream-Status: Backport [devel branch]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- aclocal.m4   | 3 +++
- configure.ac | 2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
+ aclocal.m4 | 3 +++
+ 1 file changed, 3 insertions(+)
 
 diff --git a/aclocal.m4 b/aclocal.m4
 index cc97bd4..7423b99 100644
@@ -26,16 +25,3 @@ index cc97bd4..7423b99 100644
  int
  main()
  {
-diff --git a/configure.ac b/configure.ac
-index a3b5bd7..2a38c6b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -842,7 +842,7 @@ AC_CHECK_DECLS([strtold], [
- 	[AC_COMPILE_IFELSE(
- 		[AC_LANG_PROGRAM(
- 		[[#include <stdlib.h>]],
--		[[long double r; char *foo, bar; r = strtold(foo, &bar);]]
-+		[[long double r; char *foo, *bar; r = strtold(foo, &bar);]]
- 	)],
- 	[bash_cv_strtold_broken=no],[bash_cv_strtold_broken=yes])
-         ]
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index 4cce1ba993..49a44cd1ea 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,4 +1,4 @@
-From c3f58f8b4f7a359b9d9dd97a45bcaab50a89d224 Mon Sep 17 00:00:00 2001
+From 1cc5395bb32fb6a7d3696f4563c4788609c46228 Mon Sep 17 00:00:00 2001
 From: Anders Roxell <anders.roxell@enea.com>
 Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
index c5082ee355..8f0b23f973 100644
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -1,4 +1,4 @@
-From 16951b74971c7fd38fd036dac1410a9e53cbe736 Mon Sep 17 00:00:00 2001
+From f9a6fe275e0292ad28c0b0f6dc2d094ed2bcf621 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Fri, 7 Apr 2023 00:28:46 -0700
 Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
index 05d0859821..bf384b9565 100644
--- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -1,4 +1,4 @@
-From 15601c71b073a604ccda25c7f14f0bb12e9a3b28 Mon Sep 17 00:00:00 2001
+From 31fbfca752a266ae4206d30895e3a558da287f48 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 19 Apr 2016 02:57:45 -0400
 Subject: [PATCH] fix run-builtins failed
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index eb29e7d836..6b810592d3 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,4 +1,4 @@
-From d11685286144c2e5630545e435d11387b2908fd0 Mon Sep 17 00:00:00 2001
+From 88d1bef0a2c8d116affc037f8be6d2df6666a2ee Mon Sep 17 00:00:00 2001
 From: Christopher Larson <chris_larson@mentor.com>
 Date: Wed, 14 Nov 2012 07:55:09 -0700
 Subject: [PATCH] bash: fix mkbuiltins build failure
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 3225907b66..142f465767 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,4 +1,4 @@
-From f5cbd5a4954b89857c9e397cacceda552484f5d5 Mon Sep 17 00:00:00 2001
+From f96024a49e7505570a98d67bedda2b15ecd55434 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 10:01:56 +0800
 Subject: [PATCH] Add FAIL/PASS output to test output.
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recipes-extended/bash/bash/use_aclocal.patch
index e966b037a2..6d70ecea73 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,4 +1,4 @@
-From b3a64702fa1978463c01bd5d9fe711e4628aba1e Mon Sep 17 00:00:00 2001
+From 2c374ca254d70833550c2054424f4e037865072c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 28 Dec 2020 21:04:27 +0100
 Subject: [PATCH] bash: update 5.0 -> 5.1
@@ -14,7 +14,7 @@ RP 2021/1/20
  1 file changed, 43 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 50a6e20..a3b5bd7 100644
+index 52d4029..2a38c6b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -710,49 +710,6 @@ if test x$SIZE = x; then
diff --git a/meta/recipes-extended/bash/bash_5.2.32.bb b/meta/recipes-extended/bash/bash_5.2.37.bb
similarity index 90%
rename from meta/recipes-extended/bash/bash_5.2.32.bb
rename to meta/recipes-extended/bash/bash_5.2.37.bb
index b159c0232f..87e0aa24ec 100644
--- a/meta/recipes-extended/bash/bash_5.2.32.bb
+++ b/meta/recipes-extended/bash/bash_5.2.37.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
+SRC_URI[tarball.sha256sum] = "9599b22ecd1d5787ad7d3b7bf0c59f312b3396d1e281175dd1f8a4014da621ff"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.44.1


--===============5554232465279133531==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/bash/bash-bashbug: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-bashbug: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-dbg: PKGSIZE changed from 3769480 to 3771448 (+0%)
packages/core2-64-poky-linux/bash/bash-dbg: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-dbg: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-dev: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-dev: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-doc: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-doc: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-loadable: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-loadable: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-af: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-af: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-bg: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-bg: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ca: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ca: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-cs: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-cs: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-da: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-da: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-de: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-de: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-el: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-el: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+boldquot: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-en+quot: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-eo: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-eo: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-es: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-es: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-et: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-et: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-fi: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-fi: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-fr: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-fr: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ga: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ga: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-gl: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-gl: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-hr: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-hr: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-hu: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-hu: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-id: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-id: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-it: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-it: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ja: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ja: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ko: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ko: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-lt: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-lt: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-nb: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-nb: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-nl: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-nl: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-pl: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-pl: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt-br: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-pt: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-pt: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ro: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ro: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-ru: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-ru: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-sk: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-sk: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-sl: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-sl: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-sr: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-sr: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-sv: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-sv: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-tr: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-tr: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-uk: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-uk: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-vi: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-vi: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-cn: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-locale-zh-tw: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-ptest: PKGSIZE changed from 1585216 to 1585869 (+0%)
packages/core2-64-poky-linux/bash/bash-ptest: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-ptest: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-src: PKGSIZE changed from 4393415 to 4396136 (+0%)
packages/core2-64-poky-linux/bash/bash-src: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-src: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash-staticdev: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash-staticdev: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash/bash: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash/bash: PV changed from "5.2.32" to "5.2.37"
packages/core2-64-poky-linux/bash: SRC_URI changed from "https://ftp.gnu.org/gnu/bash/bash-5.2.32.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch file://fix-filesubst-errexit.patch file://0001-fix-c99.patch" to "https://ftp.gnu.org/gnu/bash/bash-5.2.37.tar.gz;name=tarball file://mkbuiltins_have_stringize.patch file://build-tests.patch file://test-output.patch file://run-ptest file://run-bash-ptests file://fix-run-builtins.patch file://use_aclocal.patch file://0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch file://fix-filesubst-errexit.patch file://0001-fix-c99.patch"
packages/core2-64-poky-linux/bash: PKGV changed from 5.2.32 [default] to 5.2.37 [default]
packages/core2-64-poky-linux/bash: PV changed from "5.2.32" to "5.2.37"

--===============5554232465279133531==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-bash-upgrade-5.2.32-5.2.37.patch"

RnJvbSBjODI0NjMxMzc4OGVjMmIwMjM3MWY1Mzk5OTljNjUxNTk4YWFlM2E0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDI6NTc6NDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
YXNoOiB1cGdyYWRlIDUuMi4zMiAtPiA1LjIuMzcKCi0tLQogLi4uVC1oYW5kbGVyLXdoaWxlLXdh
aXRpbmctZm9yLWEtY2hpbGQtLnBhdGNoIHwgIDIgKy0KIC4uLi9iYXNoL2Jhc2gvMDAwMS1maXgt
Yzk5LnBhdGNoICAgICAgICAgICAgICB8IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0KIC4uLi9iYXNo
L2Jhc2gvYnVpbGQtdGVzdHMucGF0Y2ggICAgICAgICAgICAgICB8ICAyICstCiAuLi4vYmFzaC9i
YXNoL2ZpeC1maWxlc3Vic3QtZXJyZXhpdC5wYXRjaCAgICAgfCAgMiArLQogLi4uL2Jhc2gvYmFz
aC9maXgtcnVuLWJ1aWx0aW5zLnBhdGNoICAgICAgICAgIHwgIDIgKy0KIC4uLi9iYXNoL2Jhc2gv
bWtidWlsdGluc19oYXZlX3N0cmluZ2l6ZS5wYXRjaCB8ICAyICstCiAuLi4vYmFzaC9iYXNoL3Rl
c3Qtb3V0cHV0LnBhdGNoICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL2Jhc2gvYmFzaC91c2Vf
YWNsb2NhbC5wYXRjaCAgICAgICAgICAgICAgIHwgIDQgKystLQogLi4uL2Jhc2gve2Jhc2hfNS4y
LjMyLmJiID0+IGJhc2hfNS4yLjM3LmJifSAgIHwgIDIgKy0KIDkgZmlsZXMgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2Jhc2gve2Jhc2hfNS4yLjMyLmJiID0+IGJhc2hfNS4yLjM3LmJifSAoOTAlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvMDAwMS1jaGFuZ2VzLXRvLVNJ
R0lOVC1oYW5kbGVyLXdoaWxlLXdhaXRpbmctZm9yLWEtY2hpbGQtLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWNoYW5nZXMtdG8tU0lHSU5ULWhhbmRsZXItd2hp
bGUtd2FpdGluZy1mb3ItYS1jaGlsZC0ucGF0Y2gKaW5kZXggNGU3M2VkYjliMy4uMmM1ZDA0MGQ4
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWNoYW5n
ZXMtdG8tU0lHSU5ULWhhbmRsZXItd2hpbGUtd2FpdGluZy1mb3ItYS1jaGlsZC0ucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWNoYW5nZXMtdG8tU0lHSU5U
LWhhbmRsZXItd2hpbGUtd2FpdGluZy1mb3ItYS1jaGlsZC0ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGU0Yjk0OTNhZTQ5MjM1OTVlYzNjYTY3Zjg1MzIyMTI5ZmIzMDU2Y2YgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDczNGUyZjMwYWJlOWMwZjA2NjBjZmU1MzVkYzg3MDRlODE4
ZGVjNGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGV0IFJhbWV5IDxjaGV0LnJh
bWV5QGNhc2UuZWR1PgogRGF0ZTogTW9uLCAzMCBPY3QgMjAyMyAxMjoxNjowNyAtMDQwMAogU3Vi
amVjdDogW1BBVENIXSBjaGFuZ2VzIHRvIFNJR0lOVCBoYW5kbGVyIHdoaWxlIHdhaXRpbmcgZm9y
IGEgY2hpbGQ7IHNraXAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jh
c2gvMDAwMS1maXgtYzk5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8w
MDAxLWZpeC1jOTkucGF0Y2gKaW5kZXggYWJkODNkMDlhZi4uN2NkMDhkNzgzMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC8wMDAxLWZpeC1jOTkucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGU4ZWMyZDc1YTUyYmRjOTNjODNhNjc5YTcxYTY4ZjQwMzMwMzNi
OGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDM0YTEwM2I1NjYyODBkNzUxZDQ0YzZk
ZjBkM2YwMjVmZTVmODliMTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1
cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4KIERhdGU6IFdlZCwgMTkgSnVuIDIwMjQgMTI6NTc6
MzkgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IEM5OSBwcm9ibGVtcwpAQCAtOCw5ICs4LDgg
QEAgQmFja3BvcnQgc29tZSBmaXhlcyBmcm9tIHVwc3RyZWFtIHRvIGZpeCBjb25maWd1cmUgY2hl
Y2tzIHRoYXQgZmFpbCB3aXRoIEdDQyAxNC4KIFVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2Rl
dmVsIGJyYW5jaF0KIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0u
Y29tPgogLS0tCi0gYWNsb2NhbC5tNCAgIHwgMyArKysKLSBjb25maWd1cmUuYWMgfCAyICstCi0g
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKKyBhY2xvY2Fs
Lm00IHwgMyArKysKKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9hY2xvY2FsLm00IGIvYWNsb2NhbC5tNAogaW5kZXggY2M5N2JkNC4uNzQyM2I5OSAxMDA2
NDQKQEAgLTI2LDE2ICsyNSwzIEBAIGluZGV4IGNjOTdiZDQuLjc0MjNiOTkgMTAwNjQ0CiAgaW50
CiAgbWFpbigpCiAgewotZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggYTNiNWJkNy4uMmEzOGM2YiAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIv
Y29uZmlndXJlLmFjCi1AQCAtODQyLDcgKzg0Miw3IEBAIEFDX0NIRUNLX0RFQ0xTKFtzdHJ0b2xk
XSwgWwotIAlbQUNfQ09NUElMRV9JRkVMU0UoCi0gCQlbQUNfTEFOR19QUk9HUkFNKAotIAkJW1sj
aW5jbHVkZSA8c3RkbGliLmg+XV0sCi0tCQlbW2xvbmcgZG91YmxlIHI7IGNoYXIgKmZvbywgYmFy
OyByID0gc3RydG9sZChmb28sICZiYXIpO11dCi0rCQlbW2xvbmcgZG91YmxlIHI7IGNoYXIgKmZv
bywgKmJhcjsgciA9IHN0cnRvbGQoZm9vLCAmYmFyKTtdXQotIAkpXSwKLSAJW2Jhc2hfY3Zfc3Ry
dG9sZF9icm9rZW49bm9dLFtiYXNoX2N2X3N0cnRvbGRfYnJva2VuPXllc10pCi0gICAgICAgICBd
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2J1aWxkLXRlc3Rz
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC9idWlsZC10ZXN0cy5wYXRj
aAppbmRleCA0Y2NlMWJhOTkzLi40OWE0NGNkMWVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvYmFzaC9iYXNoL2J1aWxkLXRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9iYXNoL2Jhc2gvYnVpbGQtdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGMzZjU4ZjhiNGY3YTM1OWI5ZDlkZDk3YTQ1YmNhYWI1MGE4OWQyMjQgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDFjYzUzOTViYjMyZmI2YTdkMzY5NmY0NTYzYzQ3ODg2MDljNDYyMjgg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRlcnMgUm94ZWxsIDxhbmRlcnMucm94
ZWxsQGVuZWEuY29tPgogRGF0ZTogV2VkLCAxOSBEZWMgMjAxMiAxNzoxODozMSArMDEwMAogU3Vi
amVjdDogW1BBVENIXSBBZGQgJ3B0ZXN0JyB0YXJnZXQgdG8gTWFrZWZpbGUsIHRvIHJ1biB0ZXN0
cyB3aXRob3V0IGNoZWNraW5nCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFz
aC9iYXNoL2ZpeC1maWxlc3Vic3QtZXJyZXhpdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9iYXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNoCmluZGV4IGM1MDgyZWUzNTUu
LjhmMGIyM2Y5NzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gv
Zml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2gvZml4LWZpbGVzdWJzdC1lcnJleGl0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSAxNjk1MWI3NDk3MWM3ZmQzOGZkMDM2ZGFjMTQxMGE5ZTUzY2JlNzM2IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSBmOWE2ZmUyNzVlMDI5MmFkMjhjMGIwZjZkYzJkMDk0ZWQyYmNmNjIx
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hldCBSYW1leSA8Y2hldC5yYW1leUBj
YXNlLmVkdT4KIERhdGU6IEZyaSwgNyBBcHIgMjAyMyAwMDoyODo0NiAtMDcwMAogU3ViamVjdDog
W1BBVENIXSAkKDxub3N1Y2hmaWxlKSBpcyBubyBsb25nZXIgYSBmYXRhbCBlcnJvciB3aXRoIGVy
cmV4aXQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LXJ1
bi1idWlsdGlucy5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvZml4LXJ1
bi1idWlsdGlucy5wYXRjaAppbmRleCAwNWQwODU5ODIxLi5iZjM4NGI5NTY1IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL2ZpeC1ydW4tYnVpbHRpbnMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC9maXgtcnVuLWJ1aWx0aW5zLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxNTYwMWM3MWIwNzNhNjA0Y2NkYTI1YzdmMTRmMGJi
MTJlOWEzYjI4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMWZiZmNhNzUyYTI2NmFl
NDIwNmQzMDg5NWUzYTU1OGRhMjg3ZjQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
RGVuZ2tlIER1IDxkZW5na2UuZHVAd2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMTkgQXByIDIw
MTYgMDI6NTc6NDUgLTA0MDAKIFN1YmplY3Q6IFtQQVRDSF0gZml4IHJ1bi1idWlsdGlucyBmYWls
ZWQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvbWtidWlsdGlu
c19oYXZlX3N0cmluZ2l6ZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gv
bWtidWlsdGluc19oYXZlX3N0cmluZ2l6ZS5wYXRjaAppbmRleCBlYjI5ZTdkODM2Li42YjgxMDU5
MmQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL21rYnVpbHRp
bnNfaGF2ZV9zdHJpbmdpemUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gv
YmFzaC9ta2J1aWx0aW5zX2hhdmVfc3RyaW5naXplLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJv
bSBkMTE2ODUyODYxNDRjMmU1NjMwNTQ1ZTQzNWQxMTM4N2IyOTA4ZmQwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQorRnJvbSA4OGQxYmVmMGEyYzhkMTE2YWZmYzAzN2Y4YmU2ZDJkZjY2NjZhMmVl
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hyaXN0b3BoZXIgTGFyc29uIDxjaHJp
c19sYXJzb25AbWVudG9yLmNvbT4KIERhdGU6IFdlZCwgMTQgTm92IDIwMTIgMDc6NTU6MDkgLTA3
MDAKIFN1YmplY3Q6IFtQQVRDSF0gYmFzaDogZml4IG1rYnVpbHRpbnMgYnVpbGQgZmFpbHVyZQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaC90ZXN0LW91dHB1dC5w
YXRjaCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvdGVzdC1vdXRwdXQucGF0Y2gK
aW5kZXggMzIyNTkwN2I2Ni4uMTQyZjQ2NTc2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL2Jhc2gvYmFzaC90ZXN0LW91dHB1dC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvYmFzaC9iYXNoL3Rlc3Qtb3V0cHV0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBm
NWNiZDVhNDk1NGI4OTg1N2M5ZTM5N2NhY2NlZGE1NTI0ODRmNWQ1IE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQorRnJvbSBmOTYwMjRhNDllNzUwNTU3MGE5OGQ2N2JlZGRhMmIxNWVjZDU1NDM0IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVHVlLCAxNSBBdWcgMjAxNyAxMDowMTo1NiArMDgwMAogU3ViamVj
dDogW1BBVENIXSBBZGQgRkFJTC9QQVNTIG91dHB1dCB0byB0ZXN0IG91dHB1dC4KZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9iYXNoL2Jhc2gvdXNlX2FjbG9jYWwucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoL3VzZV9hY2xvY2FsLnBhdGNoCmluZGV4IGU5
NjZiMDM3YTIuLjZkNzBlY2VhNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
YXNoL2Jhc2gvdXNlX2FjbG9jYWwucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jh
c2gvYmFzaC91c2VfYWNsb2NhbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjNhNjQ3MDJm
YTE5Nzg0NjNjMDFiZDVkOWZlNzExZTQ2MjhhYmExZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gMmMzNzRjYTI1NGQ3MDgzMzU1MGMyMDU0NDI0ZjRlMDM3ODY1MDcyYyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogTW9uLCAyOCBEZWMgMjAyMCAyMTowNDoyNyArMDEwMAogU3ViamVjdDog
W1BBVENIXSBiYXNoOiB1cGRhdGUgNS4wIC0+IDUuMQpAQCAtMTQsNyArMTQsNyBAQCBSUCAyMDIx
LzEvMjAKICAxIGZpbGUgY2hhbmdlZCwgNDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9j
b25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDUwYTZlMjAuLmEzYjViZDcgMTAwNjQ0
CitpbmRleCA1MmQ0MDI5Li4yYTM4YzZiIDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFjCiArKysg
Yi9jb25maWd1cmUuYWMKIEBAIC03MTAsNDkgKzcxMCw2IEBAIGlmIHRlc3QgeCRTSVpFID0geDsg
dGhlbgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuMzIu
YmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUuMi4zNy5iYgpzaW1pbGFyaXR5
IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmFzaC9iYXNoXzUu
Mi4zMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuMzcu
YmIKaW5kZXggYjE1OWMwMjMyZi4uODdlMGFhMjRlYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWV4dGVuZGVkL2Jhc2gvYmFzaF81LjIuMzIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2Jhc2gvYmFzaF81LjIuMzcuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICIke0dOVV9N
SVJST1J9L2Jhc2gvJHtCUH0udGFyLmd6O25hbWU9dGFyYmFsbCBcCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWZpeC1jOTkucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbdGFyYmFsbC5z
aGEyNTZzdW1dID0gImQzZWY4MGQyYjY3ZDhjYmJlNGQzMjY1YzYzYTcyYzQ2ZjliMjc4ZWFkNmUw
ZTA2ZDYxODAxYjU4ZjIzZjUwYjUiCitTUkNfVVJJW3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI5NTk5
YjIyZWNkMWQ1Nzg3YWQ3ZDNiN2JmMGM1OWYzMTJiMzM5NmQxZTI4MTE3NWRkMWY4YTQwMTRkYTYy
MWZmIgogCiBERUJVR19PUFRJTUlaQVRJT046YXBwZW5kOmFybXY0ID0gIiAke0BiYi51dGlscy5j
b250YWlucygnVFVORV9DQ0FSR1MnLCAnLW10aHVtYicsICctZm9taXQtZnJhbWUtcG9pbnRlcics
ICcnLCBkKX0iCiBERUJVR19PUFRJTUlaQVRJT046YXBwZW5kOmFybXY1ID0gIiAke0BiYi51dGls
cy5jb250YWlucygnVFVORV9DQ0FSR1MnLCAnLW10aHVtYicsICctZm9taXQtZnJhbWUtcG9pbnRl
cicsICcnLCBkKX0iCi0tIAoyLjQ0LjEKCg==

--===============5554232465279133531==--

