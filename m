Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AADCA0EC1
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:49 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.88622.1754057265119283479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ToFKKETX;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=sEFnujcv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019865f5ccfa-c3e52952-13e8-4f6a-a344-3a344a8e569e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057264;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CQnrCcSdJQH+0Bnjf22FZ0UGfhASbGW75hv2xUreg3o=;
	b=ToFKKETXXUGcQ92B7AiAj8YUhlp21CEGX2pG9W3lPEpc2VFkGQx57ZR2ETwNQf5j
	/2fSy5IHMdI56RJu0JD4N8qqNT3w52RS+Scgye9rPnm9gbErp43A+PdYTZYAlaMLJ8P
	pjj5tLxsyiPbLHbpO2fHsp1i7n+K2Wr3lbdJo1Uk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057264;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CQnrCcSdJQH+0Bnjf22FZ0UGfhASbGW75hv2xUreg3o=;
	b=sEFnujcvuSxtnR3pUNpb6elR91ryQio/nCdIm687FRHehcGUrY1L+d6aq2/Af9Im
	TnUKW9lDIP78VRzLtaueF+ZjTMUxo+LsNk6sOdkVbJTxX0xOQIuB6qmeVK7zt7EPyh8
	6l2Prp9TR25ZHpJmsUZlh+nsAPTW//SUuXDp9hMI=
Content-Type: multipart/mixed; boundary="===============6800460901920966554=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux,util-linux-libuuid: upgrading to 2.41.1,2.41.1
 SUCCEEDED
Message-ID: <0101019865f5ccfa-c3e52952-13e8-4f6a-a344-3a344a8e569e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221250

--===============6800460901920966554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux,util-linux-libuuid* to *2.41.1,2.41.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-util-linux-libuuid-upgrade-2.41-2.41.1-2..patch
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
From 7c71843f89c1522dc8b3e833d520ac0131e780f8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 06:31:34 +0000
Subject: [PATCH] util-linux,util-linux-libuuid: upgrade 2.41 -> 2.41.1,2.41 ->
 2.41.1

---
 ...-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                | 2 +-
 ...d-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch | 7 ++-----
 ...ts-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch | 5 +----
 ...ts-ts-kill-decode-avoid-using-shell-built-in-kill.patch | 7 ++-----
 ...kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch | 7 ++-----
 .../util-linux/util-linux/avoid_parallel_tests.patch       | 4 ++--
 .../util-linux/util-linux/configure-sbindir.patch          | 4 ++--
 .../util-linux/display_testname_for_subtest.patch          | 2 +-
 meta/recipes-core/util-linux/util-linux/ptest.patch        | 2 +-
 .../{util-linux_2.41.bb => util-linux_2.41.1.bb}           | 0
 11 files changed, 14 insertions(+), 26 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.41.bb => util-linux_2.41.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7d6759a2c0..c5698d9cab 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -23,6 +23,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            "
 
-SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
+SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
index e3f9112192..5b738877cd 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From edbab1d7fb31e07130c1912742ed7e400f3d9c3d Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 26 May 2025 15:24:16 +0800
 Subject: [PATCH] lsfd/mkfds-foreign-sockets: skip when lacking sock_diag
@@ -19,7 +19,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/tests/ts/lsfd/mkfds-foreign-sockets b/tests/ts/lsfd/mkfds-foreign-sockets
-index cd94da799..76138a7a6 100755
+index cd94da7..76138a7 100755
 --- a/tests/ts/lsfd/mkfds-foreign-sockets
 +++ b/tests/ts/lsfd/mkfds-foreign-sockets
 @@ -30,6 +30,8 @@ ts_skip_nonroot
@@ -31,6 +31,3 @@ index cd94da799..76138a7a6 100755
  declare -A tcase
  tcase[NAME]="state=connected"
  tcase[SOCK.NETNS]=
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
index 324798cfd5..ffa9122afe 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
@@ -1,4 +1,4 @@
-From 383efe26a2a61b420d369cd2c23f03d1d690d425 Mon Sep 17 00:00:00 2001
+From 0ae5342f96d0aa637b59685ada07ad808d926dd2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 28 Jul 2025 20:35:13 +0800
 Subject: [PATCH] tests/helpers/test_sigstate.c: explicitly reset SIGINT to
@@ -50,6 +50,3 @@ index 52c7dcb..b631ec2 100644
  	signal(SIGBUS, SIG_DFL);
  	signal(SIGFPE, SIG_DFL);
  	signal(SIGSEGV, SIG_DFL);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
index dece0e94b7..2dd9203ce2 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From 62fc9b251b5823037f51017e9d380eb3ae701351 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 15 May 2025 16:44:33 +0800
 Subject: [PATCH] tests/ts/kill/decode: avoid using shell built-in kill command
@@ -16,7 +16,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 03bc25ff6..57149899e 100755
+index 03bc25f..5714989 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -18,6 +18,11 @@ TS_DESC="decode functions"
@@ -31,6 +31,3 @@ index 03bc25ff6..57149899e 100755
  ts_skip_qemu_user
  
  ts_check_test_command "$TS_CMD_KILL"
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
index f4e2f9e745..0edc71148b 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From 2c9a2b36914b10e501282369bd1c9650e42e5b18 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Wed, 4 Jun 2025 16:27:19 +0800
 Subject: [PATCH] ts/kill/decode: use RTMIN from 'kill -L' instead of
@@ -28,7 +28,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/tests/ts/kill/decode b/tests/ts/kill/decode
-index 57149899e..524b4e5e2 100755
+index 5714989..524b4e5 100755
 --- a/tests/ts/kill/decode
 +++ b/tests/ts/kill/decode
 @@ -53,14 +53,19 @@ ACK=
@@ -53,6 +53,3 @@ index 57149899e..524b4e5e2 100755
  		else
  		    cat
  		fi
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
index fe92afbc53..9d750b125b 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 0d8e0ca77d9663e729529f39896525d7ba833581 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43a23a5..4a84531 100644
+index 2c44034..427e1bd 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index ebb32a6845..714c11de14 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From 22ee8288a70b0ac546c408978509f5b47673699d Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5d9102..43a23a5 100644
+index d1c1840..2c44034 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index fa4ae02bc3..488cca2f13 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From e3e2c92cb4383f89e6dc61e0cbd4fb857984713b Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..bf4f839317 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From dcbc5231d8d3d6116046eceb4a42daa53e5d0b86 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.1.bb
-- 
2.47.1


--===============6800460901920966554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/util-linux-libuuid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.pat
 ch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch"
packages/core2-64-poky-linux/util-linux-libuuid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGSIZE changed from 68576 to 68616 (+0%)
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://fcntl-lock.c file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file:
 //0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch"
packages/core2-64-poky-linux/util-linux: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-bits: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-bits: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cal: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGSIZE changed from 55424 to 59520 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-choom: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-col: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-col: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-column: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-column: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-coresched: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-coresched: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 29890312 to 30100704 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 965804 to 966942 (+0%)
packages/core2-64-poky-linux/util-linux/util-linux-doc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-eject: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-exch: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fcntl-lock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-flock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGSIZE changed from 63712 to 63704 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-kill: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-last: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-last: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGSIZE changed from 522417 to 526513 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 573925 to 616703 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 391984 to 391847 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 574034 to 579792 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 556097 to 623486 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 629848 to 629300 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 603531 to 602707 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 637195 to 682238 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 618010 to 617385 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 496173 to 567096 (+14%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 609556 to 608994 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 507272 to 507140 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 466733 to 571166 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 641092 to 640535 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGSIZE changed from 197168 to 196987 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGSIZE changed from 80256 to 80068 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 699887 to 750653 (+7%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 435493 to 435349 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 342109 to 341974 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 784402 to 783693 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 310865 to 310716 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 385216 to 385085 (-0%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-logger: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-look: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-look: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGSIZE changed from 129312 to 133408 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGSIZE changed from 239736 to 243832 (+2%)
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGSIZE changed from 125064 to 129160 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-more: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-more: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-namei: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGSIZE changed from 133240 to 137336 (+3%)
packages/core2-64-poky-linux/util-linux/util-linux-partx: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6509923 to 6568391 (+1%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-loongarch-kvm_on_loongson_3c6000 /usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/loongarch-kvm_on_loongson_3c6000.tar.gz"
packages/core2-64-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rename: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-renice: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGSIZE changed from 75896 to 79992 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-script: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-script: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGSIZE changed from 84403 to 88499 (+5%)
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-src: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-src: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-su: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-su: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-ul: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-umount: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wall: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-write: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-write: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.41 [default] to 2.41.1 [default]
packages/core2-64-poky-linux/util-linux/util-linux: PV changed from "2.41" to "2.41.1"
packages/core2-64-poky-linux/util-linux/util-linux: PKGV changed from 2.41 [default] to 2.41.1 [default]
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============6800460901920966554==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-util-linux-libuuid-upgrade-2.41-2.41.1-2..patch"

RnJvbSA3YzcxODQzZjg5YzE1MjJkYzhiM2U4MzNkNTIwYWMwMTMxZTc4MGY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwNjozMTozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgsdXRpbC1saW51eC1saWJ1dWlkOiB1cGdyYWRlIDIuNDEgLT4gMi40MS4xLDIuNDEg
LT4KIDIuNDEuMQoKLS0tCiAuLi4tbGludXgtbGlidXVpZF8yLjQxLmJiID0+IHV0aWwtbGludXgt
bGlidXVpZF8yLjQxLjEuYmJ9IHwgMAogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LmluYyAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLmQtbWtmZHMtZm9yZWlnbi1zb2Nr
ZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tfZGkucGF0Y2ggfCA3ICsrLS0tLS0KIC4uLnRzLWhl
bHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lHSU4ucGF0Y2ggfCA1ICst
LS0tCiAuLi50cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1pbi1raWxs
LnBhdGNoIHwgNyArKy0tLS0tCiAuLi5raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwt
aW5zdGVhZC1vZi1oYXJkLnBhdGNoIHwgNyArKy0tLS0tCiAuLi4vdXRpbC1saW51eC91dGlsLWxp
bnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgIHwgNCArKy0tCiAuLi4vdXRpbC1s
aW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBhdGNoICAgICAgICAgIHwgNCArKy0t
CiAuLi4vdXRpbC1saW51eC9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoICAgICAg
ICAgIHwgMiArLQogbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0
LnBhdGNoICAgICAgICB8IDIgKy0KIC4uLi97dXRpbC1saW51eF8yLjQxLmJiID0+IHV0aWwtbGlu
dXhfMi40MS4xLmJifSAgICAgICAgICAgfCAwCiAxMSBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRp
b25zKCspLCAyNiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3t1dGlsLWxpbnV4LWxpYnV1aWRfMi40MS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40
MS4xLmJifSAoMTAwJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGls
LWxpbnV4XzIuNDEuYmIgPT4gdXRpbC1saW51eF8yLjQxLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEu
YmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQx
LjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuMS5iYgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5kZXggN2Q2NzU5YTJjMC4u
YzU2OThkOWNhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jCkBAIC0yMyw2ICsyMyw2IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51
eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwtbGluCiAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVz
ZXQtU0lHSU4ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4
MWVlOTNiM2NmZGZlYjdkN2M0MDkwY2VkZWJhMWQ3YmJjZTkxNDFmZDBiNTAxYjY4NmIzZmU0NzVk
ZGNhNGM2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJlOWFkOWEyNzZmNDMwNWFiN2RkMmY1MjI1
YzhiZTFmZjU0MzUyZjU2NWZmNGRlZGU5NjI4YzFhYWE3ZGVjNTciCiAKIENWRV9QUk9EVUNUID0g
InV0aWwtbGludXgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2lu
Zy1zb2NrX2RpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LzAwMDEtbHNmZC1ta2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19k
aS5wYXRjaAppbmRleCBlM2Y5MTEyMTkyLi41YjczODg3N2NkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24t
c29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2Nr
ZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tfZGkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9t
IGIzYTFkOTJhOTA3OGZhZGEzMWIyY2Y2NGI4MDJlZGQ2MTYwMjY3NjYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGVkYmFiMWQ3ZmIzMWUwNzEzMGMxOTEyNzQyZWQ3ZTQwMGYzZDljM2Qg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZl
ci5jb20+CiBEYXRlOiBNb24sIDI2IE1heSAyMDI1IDE1OjI0OjE2ICswODAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGxzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzOiBza2lwIHdoZW4gbGFja2luZyBzb2Nr
X2RpYWcKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAt
LWdpdCBhL3Rlc3RzL3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzIGIvdGVzdHMvdHMvbHNm
ZC9ta2Zkcy1mb3JlaWduLXNvY2tldHMKLWluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1
NQoraW5kZXggY2Q5NGRhNy4uNzYxMzhhNyAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2xzZmQvbWtm
ZHMtZm9yZWlnbi1zb2NrZXRzCiArKysgYi90ZXN0cy90cy9sc2ZkL21rZmRzLWZvcmVpZ24tc29j
a2V0cwogQEAgLTMwLDYgKzMwLDggQEAgdHNfc2tpcF9ub25yb290CkBAIC0zMSw2ICszMSwzIEBA
IGluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1NQogIGRlY2xhcmUgLUEgdGNhc2UKICB0
Y2FzZVtOQU1FXT0ic3RhdGU9Y29ubmVjdGVkIgogIHRjYXNlW1NPQ0suTkVUTlNdPQotLS0gCi0y
LjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LzAwMDEtdGVzdHMtaGVscGVycy10ZXN0X3NpZ3N0YXRlLmMtZXhwbGljaXRseS1yZXNldC1T
SUdJTi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lHSU4ucGF0
Y2gKaW5kZXggMzI0Nzk4Y2ZkNS4uZmZhOTEyMmFmZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtaGVscGVycy10ZXN0X3NpZ3N0
YXRlLmMtZXhwbGljaXRseS1yZXNldC1TSUdJTi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10ZXN0cy1oZWxwZXJzLXRlc3Rfc2lnc3RhdGUu
Yy1leHBsaWNpdGx5LXJlc2V0LVNJR0lOLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzODNl
ZmUyNmEyYTYxYjQyMGQzNjljZDJjMjNmMDNkMWQ2OTBkNDI1IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwYWU1MzQyZjk2ZDBhYTYzN2I1OTY4NWFkYTA3YWQ4MDhkOTI2ZGQyIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2
ZXIuY29tPgogRGF0ZTogTW9uLCAyOCBKdWwgMjAyNSAyMDozNToxMyArMDgwMAogU3ViamVjdDog
W1BBVENIXSB0ZXN0cy9oZWxwZXJzL3Rlc3Rfc2lnc3RhdGUuYzogZXhwbGljaXRseSByZXNldCBT
SUdJTlQgdG8KQEAgLTUwLDYgKzUwLDMgQEAgaW5kZXggNTJjN2RjYi4uYjYzMWVjMiAxMDA2NDQK
ICAJc2lnbmFsKFNJR0JVUywgU0lHX0RGTCk7CiAgCXNpZ25hbChTSUdGUEUsIFNJR19ERkwpOwog
IAlzaWduYWwoU0lHU0VHViwgU0lHX0RGTCk7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10ZXN0cy10cy1raWxs
LWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNvZGUt
YXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaAppbmRleCBkZWNlMGU5NGI3Li4y
ZGQ5MjAzY2UyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1p
bi1raWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC8wMDAxLXRlc3RzLXRzLWtpbGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWluLWtp
bGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQyZWVjY2YzNjU0MmQ1MDZiNjYwNjQxYTA3
YTQ0ZjM5NzY3NzI4OTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYyZmM5YjI1MWI1
ODIzMDM3ZjUxMDE3ZTlkMzgwZWIzYWU3MDEzNTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE1IE1heSAy
MDI1IDE2OjQ0OjMzICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3RzL2tpbGwvZGVjb2Rl
OiBhdm9pZCB1c2luZyBzaGVsbCBidWlsdC1pbiBraWxsIGNvbW1hbmQKQEAgLTE2LDcgKzE2LDcg
QEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3RzL2tpbGwv
ZGVjb2RlIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKLWluZGV4IDAzYmMyNWZmNi4uNTcxNDk4OTll
IDEwMDc1NQoraW5kZXggMDNiYzI1Zi4uNTcxNDk4OSAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2tp
bGwvZGVjb2RlCiArKysgYi90ZXN0cy90cy9raWxsL2RlY29kZQogQEAgLTE4LDYgKzE4LDExIEBA
IFRTX0RFU0M9ImRlY29kZSBmdW5jdGlvbnMiCkBAIC0zMSw2ICszMSwzIEBAIGluZGV4IDAzYmMy
NWZmNi4uNTcxNDk4OTllIDEwMDc1NQogIHRzX3NraXBfcWVtdV91c2VyCiAgCiAgdHNfY2hlY2tf
dGVzdF9jb21tYW5kICIkVFNfQ01EX0tJTEwiCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10cy1raWxsLWRlY29k
ZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVhZC1vZi1oYXJkLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJU
TUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaAppbmRleCBmNGUyZjllNzQ1Li4w
ZWRjNzExNDhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS10cy1raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVhZC1v
Zi1oYXJkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC8wMDAxLXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9mLWhh
cmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM1ZDVlODg3MzAyOWQxNzBmY2FiMzhhNmZi
ZDVkNWEzNTU1NzRiOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDJjOWEyYjM2OTE0
YjEwZTUwMTI4MjM2OWJkMWM5NjUwZTQyZTViMTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDQgSnVuIDIw
MjUgMTY6Mjc6MTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdHMva2lsbC9kZWNvZGU6IHVzZSBS
VE1JTiBmcm9tICdraWxsIC1MJyBpbnN0ZWFkIG9mCkBAIC0yOCw3ICsyOCw3IEBAIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMvdHMv
a2lsbC9kZWNvZGUgYi90ZXN0cy90cy9raWxsL2RlY29kZQotaW5kZXggNTcxNDk4OTllLi41MjRi
NGU1ZTIgMTAwNzU1CitpbmRleCA1NzE0OTg5Li41MjRiNGU1IDEwMDc1NQogLS0tIGEvdGVzdHMv
dHMva2lsbC9kZWNvZGUKICsrKyBiL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCiBAQCAtNTMsMTQgKzUz
LDE5IEBAIEFDSz0KQEAgLTUzLDYgKzUzLDMgQEAgaW5kZXggNTcxNDk4OTllLi41MjRiNGU1ZTIg
MTAwNzU1CiAgCQllbHNlCiAgCQkgICAgY2F0CiAgCQlmaQotLS0gCi0yLjM0LjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFs
bGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGZlOTJhZmJjNTMuLjlkNzUwYjEyNWIg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9p
ZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDQzMDMwMzg4ZTgzMTY0MmQzNmNiN2I5ZDRiNjM3NTVlOTY5NjcxNGEgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDBkOGUwY2E3N2Q5NjYzZTcyOTUyOWYzOTg5NjUyNWQ3YmE4MzM1
ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZs
b3JlYUBlbmVhLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTQ6MDA6MzEgKzAyMDAKIFN1
YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDogQWRkIHB0ZXN0CkBAIC0xNCw3ICsxNCw3IEBAIFVw
c3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmln
dXJlLmFjCi1pbmRleCA0M2EyM2E1Li40YTg0NTMxIDEwMDY0NAoraW5kZXggMmM0NDAzNC4uNDI3
ZTFiZCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAt
MTEsNyArMTEsNyBAQCBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNi
aW5kaXIucGF0Y2gKaW5kZXggZWJiMzJhNjg0NS4uNzE0YzExZGUxNCAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGlyLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1
cmUtc2JpbmRpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzc4OTk4YmY4MmUzYjZmZjQ2
NTY5MDc3YjI5Zjk1ZTcyYjczNDY4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjJl
ZTgyODhhNzBiMGFjNTQ2YzQwODk3ODUwOWY1YjQ3NjczNjk5ZCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgogRGF0ZTogTW9uLCAyNCBT
ZXAgMjAxMiAwNzoyNDo1MSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBFbnN1
cmUgdGhhdCAke3NiaW5kaXJ9IGlzIHJlc3BlY3RlZApAQCAtMTQsNyArMTQsNyBAQCBVcHN0cmVh
bS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJl
LmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBhNWQ5MTAyLi40M2EyM2E1IDEwMDY0NAoraW5kZXgg
ZDFjMTg0MC4uMmM0NDAzNCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmln
dXJlLmFjCiBAQCAtMTEwLDcgKzExMCwxMCBAQCBBQ19TVUJTVChbcnVuc3RhdGVkaXJdKQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlf
dGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAppbmRleCBmYTRh
ZTAyYmMzLi40ODhjY2EyZjEzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9m
b3Jfc3VidGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzI4YzJhYmQ4ODlkMjI1NTM1
MDA4YzNlN2ExZWVmNGI4YTBhZWVhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTNl
MmM5MmNiNDM4M2Y4OWU2ZGM2MWUwY2JkNGZiODU3OTg0NzEzYiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTog
VGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc3BsYXkg
dGVzdG5hbWUgZm9yIHN1YnRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAppbmRleCBhZDIzMDAxY2ZhLi5iZjRmODM5MzE3IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3Qu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOGJmNmFkZWQ5YjJhNzUxODVhZTRiMjNhNDFj
ZDJlNDMyMmM1ZTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBkY2JjNTIzMWQ4ZDNk
NjExNjA0NmVjZWI0YTQyZGFhNTNlNWQwYjg2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMgRGVj
IDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIFRFU1RTIHZhcmlh
YmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXhf
Mi40MS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLjEu
YmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eF8yLjQxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXhfMi40MS4xLmJiCi0tIAoyLjQ3LjEKCg==

--===============6800460901920966554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 556097 to 623486 (+12%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 496173 to 567096 (+14%)
packages/core2-64-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 466733 to 571166 (+22%)
packages/core2-64-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/ts/lscpu/dumps/loongarch-kvm_on_loongson_3c6000.tar.gz /usr/lib/util-linux/ptest/tests/expected/lscpu/lscpu-loongarch-kvm_on_loongson_3c6000"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8400.2-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.84.2/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8400.2-gdb.py was removed

--===============6800460901920966554==--

