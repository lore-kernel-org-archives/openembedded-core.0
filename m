Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15BCACCFA1D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2344.1762384572687340688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mRTEp8EJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jC+lplk0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a564e6bf1-7fbb22c3-3ccb-4be5-a8c4-d398b262aafc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MVOAcWvV69BUFTJjeYspf1LUzdVu5qkvnvzlus6GRoU=;
	b=mRTEp8EJM7s/FnEQOIMLst4xOXxINJUYcL7fb7T4LEXDrfnBASEgBdka92CjgvAj
	6MCkzZTncXAbQewiJ0pS6ZHOjKl5oV2I/MGYsZ+V7U/uGjSO/GCiBJC6bZ+ihff8HGp
	R/B6dEeXsLWza/1eCSka7awDQy9qopy5DuyZHHwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MVOAcWvV69BUFTJjeYspf1LUzdVu5qkvnvzlus6GRoU=;
	b=jC+lplk0kYg02EBtuouGF/whYtVUuU/hKej7nERKur4BcJLXUAOwefWEvL/g/zJC
	Pb9na6cr/h8Pm+0Jb2GVN/MGVDtKSsujHiEU8AjudrE+hHC4WOpEWiIDu3/RAuqXJdC
	bcEeLTRd6t5W/VMwGE60HlQeZNJY9X4vMFXsKJ1g=
Content-Type: multipart/mixed; boundary="===============7780697509131089511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.41.2,2.41.2
 SUCCEEDED
Message-ID: <0101019a564e6bf1-7fbb22c3-3ccb-4be5-a8c4-d398b262aafc-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225786

--===============7780697509131089511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *util-linux-libuuid,util-linux* to *2.41.2,2.41.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-util-linux-upgrade-2.41.1-2.41.2-.patch
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
From f4e3621b4a62d460698aaf0c4e3ad9302a56f4de Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 12:44:10 +0000
Subject: [PATCH] util-linux-libuuid,util-linux: upgrade 2.41.1 ->
 2.41.2,2.41.1 -> 2.41.2

---
 ...2.41.1.bb => util-linux-libuuid_2.41.2.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  4 +-
 ...nt-api-utils-avoid-using-sys-mount.h.patch | 29 ----------
 ...gn-sockets-skip-when-lacking-sock_di.patch |  7 +--
 ...st_sigstate.c-explicitly-reset-SIGIN.patch | 55 -------------------
 ...code-avoid-using-shell-built-in-kill.patch |  7 +--
 ...se-RTMIN-from-kill-L-instead-of-hard.patch |  7 +--
 .../util-linux/avoid_parallel_tests.patch     |  4 +-
 .../util-linux/configure-sbindir.patch        |  4 +-
 .../display_testname_for_subtest.patch        |  2 +-
 .../util-linux/util-linux/ptest.patch         |  2 +-
 ...l-linux_2.41.1.bb => util-linux_2.41.2.bb} |  0
 12 files changed, 13 insertions(+), 108 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.1.bb => util-linux-libuuid_2.41.2.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.1.bb => util-linux_2.41.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e7a3c5be9f..c29011ad61 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,10 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
-           file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
-           file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
            "
 
-SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
+SRC_URI[sha256sum] = "6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch b/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
deleted file mode 100644
index 544f45362d..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 21 Aug 2025 09:59:10 +0200
-Subject: [PATCH] include/mount-api-utils: avoid using sys/mount.h
-
-The file is unnecessary and introduces duplicate #define of MS_* macros.
-
-Fixes: https://github.com/util-linux/util-linux/issues/3674
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88]
----
- include/mount-api-utils.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
-index 920d6766a..e35524168 100644
---- a/include/mount-api-utils.h
-+++ b/include/mount-api-utils.h
-@@ -6,7 +6,6 @@
- #define UTIL_LINUX_MOUNT_API_UTILS
- 
- #ifdef HAVE_LINUX_MOUNT_H
--#include <sys/mount.h>
- #include <linux/mount.h>
- #include <linux/unistd.h>
- #include <sys/syscall.h>
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
index e3f9112192..50c59a655b 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From b95d2deb78706bcc2742051db968b7ef899a0790 Mon Sep 17 00:00:00 2001
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
deleted file mode 100644
index 324798cfd5..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 383efe26a2a61b420d369cd2c23f03d1d690d425 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 28 Jul 2025 20:35:13 +0800
-Subject: [PATCH] tests/helpers/test_sigstate.c: explicitly reset SIGINT to
- default action after trapping
-
-After upgrading bash to 5.3 to contain commit [1], if SIGINT was trapped in
-asynchronous subshell, bash called set_signal_async_ignored to make sure
-processes that are created by this asynchronous subshell to ignore SIGINT.
-
-And it caused test case `kill/decode' failed, the signal INT was existed in
-both of Blocked and Ignored
-
-$ ./tests/run.sh --use-system-commands --parsable --show-diff   kill/decode
-...
-diff-{{{
-|--- /usr/lib/util-linux/ptest/tests/expected/kill/decode        2011-04-05 23:00:00.000000000 +0000
-|+++ /usr/lib/util-linux/ptest/tests/output/kill/decode  2025-07-28 12:09:46.279000000 +0000
-@@ -16,5 +16,5 @@
- Pending (thread): INT ILL
- Pending (process): USR1
- Blocked: INT ILL ABRT FPE USR1 SEGV TERM
--Ignored: HUP QUIT TRAP PIPE ALRM
-+Ignored: HUP INT QUIT TRAP PIPE ALRM
- Caught: ILL USR1
-}}}-diff
-...
-
-Explicitly reset SIGINT to default action after trapping, then the
-test case `kill/decode' works on both of old (<5.3) and new (>=5.3) bash
-
-[1] https://cgit.git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=a5d2617c7a7e602ace1f4149987cdfd075c4e762
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3666]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/helpers/test_sigstate.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/helpers/test_sigstate.c b/tests/helpers/test_sigstate.c
-index 52c7dcb..b631ec2 100644
---- a/tests/helpers/test_sigstate.c
-+++ b/tests/helpers/test_sigstate.c
-@@ -68,6 +68,7 @@ int main(int argc _U_, char **argv _U_)
- 	sigignore(SIGPIPE);
- 	sigignore(SIGALRM);
- 
-+	signal(SIGINT, SIG_DFL);
- 	signal(SIGBUS, SIG_DFL);
- 	signal(SIGFPE, SIG_DFL);
- 	signal(SIGSEGV, SIG_DFL);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
index dece0e94b7..a50dde3943 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From e7b48fa1fc36522fb33e5cc39f8a40f8ed8ce35e Mon Sep 17 00:00:00 2001
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
index f4e2f9e745..ffd34326c3 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From fa0679768436eb3953900e96919d74f3a464c86e Mon Sep 17 00:00:00 2001
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
index fe92afbc53..85f48a5a82 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 3fcc6de7e85e35f042444e27422498e41dceecab Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Mon, 14 Jun 2021 14:00:31 +0200
 Subject: [PATCH] util-linux: Add ptest
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 43a23a5..4a84531 100644
+index ffb6f78..c68ca29 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
index ebb32a6845..697d16309c 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From 10460d0ac414131e151cb888e3a6eeab2abc7fb3 Mon Sep 17 00:00:00 2001
 From: Phil Blundell <pb@pbcl.net>
 Date: Mon, 24 Sep 2012 07:24:51 +0100
 Subject: [PATCH] util-linux: Ensure that ${sbindir} is respected
@@ -14,7 +14,7 @@ Upstream-Status: Inappropriate [configuration]
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index a5d9102..43a23a5 100644
+index 1e6eb70..ffb6f78 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -110,7 +110,10 @@ AC_SUBST([runstatedir])
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
index fa4ae02bc3..35e96fdddc 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From 1bff77368cad9a4bb5cb9deddcab7245da639407 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..7cf093f687 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From 4c907e3a3efef453c04d49dc650826c652e8d668 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.2.bb
-- 
2.47.1


--===============7780697509131089511==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.41.1-2.41.2-.patch"

RnJvbSBmNGUzNjIxYjRhNjJkNDYwNjk4YWFmMGM0ZTNhZDkzMDJhNTZmNGRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMjo0NDoxMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZCx1dGlsLWxpbnV4OiB1cGdyYWRlIDIuNDEuMSAtPgogMi40MS4yLDIu
NDEuMSAtPiAyLjQxLjIKCi0tLQogLi4uMi40MS4xLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8y
LjQxLjIuYmJ9IHwgIDAKIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMgICB8ICA0ICstCiAuLi5udC1hcGktdXRpbHMtYXZvaWQtdXNpbmctc3lzLW1vdW50LmgucGF0
Y2ggfCAyOSAtLS0tLS0tLS0tCiAuLi5nbi1zb2NrZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tf
ZGkucGF0Y2ggfCAgNyArLS0KIC4uLnN0X3NpZ3N0YXRlLmMtZXhwbGljaXRseS1yZXNldC1TSUdJ
Ti5wYXRjaCB8IDU1IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLmNvZGUtYXZvaWQtdXNpbmctc2hl
bGwtYnVpbHQtaW4ta2lsbC5wYXRjaCB8ICA3ICstLQogLi4uc2UtUlRNSU4tZnJvbS1raWxsLUwt
aW5zdGVhZC1vZi1oYXJkLnBhdGNoIHwgIDcgKy0tCiAuLi4vdXRpbC1saW51eC9hdm9pZF9wYXJh
bGxlbF90ZXN0cy5wYXRjaCAgICAgfCAgNCArLQogLi4uL3V0aWwtbGludXgvY29uZmlndXJlLXNi
aW5kaXIucGF0Y2ggICAgICAgIHwgIDQgKy0KIC4uLi9kaXNwbGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0
ZXN0LnBhdGNoICAgICAgICB8ICAyICstCiAuLi4vdXRpbC1saW51eC91dGlsLWxpbnV4L3B0ZXN0
LnBhdGNoICAgICAgICAgfCAgMiArLQogLi4ubC1saW51eF8yLjQxLjEuYmIgPT4gdXRpbC1saW51
eF8yLjQxLjIuYmJ9IHwgIDAKIDEyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEw
OCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGls
LWxpbnV4LWxpYnV1aWRfMi40MS4xLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8yLjQxLjIuYmJ9
ICgxMDAlKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLWluY2x1ZGUtbW91bnQtYXBpLXV0aWxzLWF2b2lkLXVzaW5nLXN5cy1t
b3VudC5oLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtaGVscGVycy10ZXN0X3NpZ3N0YXRlLmMtZXhwbGlj
aXRseS1yZXNldC1TSUdJTi5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgve3V0aWwtbGludXhfMi40MS4xLmJiID0+IHV0aWwtbGludXhfMi40MS4yLmJifSAoMTAwJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGli
dXVpZF8yLjQxLjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgt
bGlidXVpZF8yLjQxLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuNDEuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi40
MS4yLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwppbmRl
eCBlN2EzYzViZTlmLi5jMjkwMTFhZDYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGlu
dXgvdXRpbC1saW51eC5pbmMKQEAgLTE5LDEwICsxOSw4IEBAIFNSQ19VUkkgPSAiJHtLRVJORUxP
UkdfTUlSUk9SfS9saW51eC91dGlscy91dGlsLWxpbnV4L3Yke01BSk9SX1ZFUlNJT059L3V0aWwt
bGluCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRlc3RzLXRzLWtpbGwtZGVjb2RlLWF2b2lkLXVz
aW5nLXNoZWxsLWJ1aWx0LWluLWtpbGwucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1s
c2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNo
IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20t
a2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXRl
c3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lHSU4ucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1pbmNsdWRlLW1vdW50LWFwaS11dGlscy1hdm9pZC11
c2luZy1zeXMtbW91bnQuaC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gImJlOWFkOWEyNzZmNDMwNWFiN2RkMmY1MjI1YzhiZTFmZjU0MzUyZjU2NWZmNGRlZGU5
NjI4YzFhYWE3ZGVjNTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjA2MmExZDg5YjU3MWE2MTkz
MmU2ZmMwMjExZjM2MDYwYzQxODM1NjhiODFlZTg2NmNmMzYzYmNlOWY2NTgzZSIKIAogQ1ZFX1BS
T0RVQ1QgPSAidXRpbC1saW51eCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC8wMDAxLWluY2x1ZGUtbW91bnQtYXBpLXV0aWxzLWF2b2lkLXVzaW5n
LXN5cy1tb3VudC5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LzAwMDEtaW5jbHVkZS1tb3VudC1hcGktdXRpbHMtYXZvaWQtdXNpbmctc3lzLW1vdW50Lmgu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDU0NGY0NTM2MmQuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtaW5j
bHVkZS1tb3VudC1hcGktdXRpbHMtYXZvaWQtdXNpbmctc3lzLW1vdW50LmgucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1Gcm9tIDJhOWI0OGQyMGQ3NGY2NWFjNzA4YjNiY2Vl
NmE3ZTJhNjFhYWRmODggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLYXJlbCBaYWsg
PGt6YWtAcmVkaGF0LmNvbT4KLURhdGU6IFRodSwgMjEgQXVnIDIwMjUgMDk6NTk6MTAgKzAyMDAK
LVN1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZS9tb3VudC1hcGktdXRpbHM6IGF2b2lkIHVzaW5nIHN5
cy9tb3VudC5oCi0KLVRoZSBmaWxlIGlzIHVubmVjZXNzYXJ5IGFuZCBpbnRyb2R1Y2VzIGR1cGxp
Y2F0ZSAjZGVmaW5lIG9mIE1TXyogbWFjcm9zLgotCi1GaXhlczogaHR0cHM6Ly9naXRodWIuY29t
L3V0aWwtbGludXgvdXRpbC1saW51eC9pc3N1ZXMvMzY3NAotU2lnbmVkLW9mZi1ieTogS2FyZWwg
WmFrIDxremFrQHJlZGhhdC5jb20+Ci1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczov
L2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC8yYTliNDhkMjBkNzRmNjVh
YzcwOGIzYmNlZTZhN2UyYTYxYWFkZjg4XQotLS0tCi0gaW5jbHVkZS9tb3VudC1hcGktdXRpbHMu
aCB8IDEgLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9p
bmNsdWRlL21vdW50LWFwaS11dGlscy5oIGIvaW5jbHVkZS9tb3VudC1hcGktdXRpbHMuaAotaW5k
ZXggOTIwZDY3NjZhLi5lMzU1MjQxNjggMTAwNjQ0Ci0tLS0gYS9pbmNsdWRlL21vdW50LWFwaS11
dGlscy5oCi0rKysgYi9pbmNsdWRlL21vdW50LWFwaS11dGlscy5oCi1AQCAtNiw3ICs2LDYgQEAK
LSAjZGVmaW5lIFVUSUxfTElOVVhfTU9VTlRfQVBJX1VUSUxTCi0gCi0gI2lmZGVmIEhBVkVfTElO
VVhfTU9VTlRfSAotLSNpbmNsdWRlIDxzeXMvbW91bnQuaD4KLSAjaW5jbHVkZSA8bGludXgvbW91
bnQuaD4KLSAjaW5jbHVkZSA8bGludXgvdW5pc3RkLmg+Ci0gI2luY2x1ZGUgPHN5cy9zeXNjYWxs
Lmg+Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24tc29ja2V0cy1za2lwLXdoZW4t
bGFja2luZy1zb2NrX2RpLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LzAwMDEtbHNmZC1ta2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmct
c29ja19kaS5wYXRjaAppbmRleCBlM2Y5MTEyMTkyLi41MGM1OWE2NTViIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZv
cmVpZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWxzZmQtbWtmZHMtZm9yZWln
bi1zb2NrZXRzLXNraXAtd2hlbi1sYWNraW5nLXNvY2tfZGkucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIGIzYTFkOTJhOTA3OGZhZGEzMWIyY2Y2NGI4MDJlZGQ2MTYwMjY3NjYgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGI5NWQyZGViNzg3MDZiY2MyNzQyMDUxZGI5NjhiN2VmODk5
YTA3OTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBNb24sIDI2IE1heSAyMDI1IDE1OjI0OjE2ICswODAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGxzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzOiBza2lwIHdoZW4gbGFja2lu
ZyBzb2NrX2RpYWcKQEAgLTE5LDcgKzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWku
Q2hlbkB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAog
ZGlmZiAtLWdpdCBhL3Rlc3RzL3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzIGIvdGVzdHMv
dHMvbHNmZC9ta2Zkcy1mb3JlaWduLXNvY2tldHMKLWluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2
IDEwMDc1NQoraW5kZXggY2Q5NGRhNy4uNzYxMzhhNyAxMDA3NTUKIC0tLSBhL3Rlc3RzL3RzL2xz
ZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzCiArKysgYi90ZXN0cy90cy9sc2ZkL21rZmRzLWZvcmVp
Z24tc29ja2V0cwogQEAgLTMwLDYgKzMwLDggQEAgdHNfc2tpcF9ub25yb290CkBAIC0zMSw2ICsz
MSwzIEBAIGluZGV4IGNkOTRkYTc5OS4uNzYxMzhhN2E2IDEwMDc1NQogIGRlY2xhcmUgLUEgdGNh
c2UKICB0Y2FzZVtOQU1FXT0ic3RhdGU9Y29ubmVjdGVkIgogIHRjYXNlW1NPQ0suTkVUTlNdPQot
LS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtdGVzdHMtaGVscGVycy10ZXN0X3NpZ3N0YXRlLmMtZXhwbGljaXRseS1y
ZXNldC1TSUdJTi5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC8wMDAxLXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lH
SU4ucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDMyNDc5OGNmZDUuLjAwMDAw
MDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEt
dGVzdHMtaGVscGVycy10ZXN0X3NpZ3N0YXRlLmMtZXhwbGljaXRseS1yZXNldC1TSUdJTi5wYXRj
aAorKysgL2Rldi9udWxsCkBAIC0xLDU1ICswLDAgQEAKLUZyb20gMzgzZWZlMjZhMmE2MWI0MjBk
MzY5Y2QyYzIzZjAzZDFkNjkwZDQyNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KLURhdGU6IE1vbiwgMjggSnVsIDIw
MjUgMjA6MzU6MTMgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSF0gdGVzdHMvaGVscGVycy90ZXN0X3Np
Z3N0YXRlLmM6IGV4cGxpY2l0bHkgcmVzZXQgU0lHSU5UIHRvCi0gZGVmYXVsdCBhY3Rpb24gYWZ0
ZXIgdHJhcHBpbmcKLQotQWZ0ZXIgdXBncmFkaW5nIGJhc2ggdG8gNS4zIHRvIGNvbnRhaW4gY29t
bWl0IFsxXSwgaWYgU0lHSU5UIHdhcyB0cmFwcGVkIGluCi1hc3luY2hyb25vdXMgc3Vic2hlbGws
IGJhc2ggY2FsbGVkIHNldF9zaWduYWxfYXN5bmNfaWdub3JlZCB0byBtYWtlIHN1cmUKLXByb2Nl
c3NlcyB0aGF0IGFyZSBjcmVhdGVkIGJ5IHRoaXMgYXN5bmNocm9ub3VzIHN1YnNoZWxsIHRvIGln
bm9yZSBTSUdJTlQuCi0KLUFuZCBpdCBjYXVzZWQgdGVzdCBjYXNlIGBraWxsL2RlY29kZScgZmFp
bGVkLCB0aGUgc2lnbmFsIElOVCB3YXMgZXhpc3RlZCBpbgotYm90aCBvZiBCbG9ja2VkIGFuZCBJ
Z25vcmVkCi0KLSQgLi90ZXN0cy9ydW4uc2ggLS11c2Utc3lzdGVtLWNvbW1hbmRzIC0tcGFyc2Fi
bGUgLS1zaG93LWRpZmYgICBraWxsL2RlY29kZQotLi4uCi1kaWZmLXt7ewotfC0tLSAvdXNyL2xp
Yi91dGlsLWxpbnV4L3B0ZXN0L3Rlc3RzL2V4cGVjdGVkL2tpbGwvZGVjb2RlICAgICAgICAyMDEx
LTA0LTA1IDIzOjAwOjAwLjAwMDAwMDAwMCArMDAwMAotfCsrKyAvdXNyL2xpYi91dGlsLWxpbnV4
L3B0ZXN0L3Rlc3RzL291dHB1dC9raWxsL2RlY29kZSAgMjAyNS0wNy0yOCAxMjowOTo0Ni4yNzkw
MDAwMDAgKzAwMDAKLUBAIC0xNiw1ICsxNiw1IEBACi0gUGVuZGluZyAodGhyZWFkKTogSU5UIElM
TAotIFBlbmRpbmcgKHByb2Nlc3MpOiBVU1IxCi0gQmxvY2tlZDogSU5UIElMTCBBQlJUIEZQRSBV
U1IxIFNFR1YgVEVSTQotLUlnbm9yZWQ6IEhVUCBRVUlUIFRSQVAgUElQRSBBTFJNCi0rSWdub3Jl
ZDogSFVQIElOVCBRVUlUIFRSQVAgUElQRSBBTFJNCi0gQ2F1Z2h0OiBJTEwgVVNSMQotfX19LWRp
ZmYKLS4uLgotCi1FeHBsaWNpdGx5IHJlc2V0IFNJR0lOVCB0byBkZWZhdWx0IGFjdGlvbiBhZnRl
ciB0cmFwcGluZywgdGhlbiB0aGUKLXRlc3QgY2FzZSBga2lsbC9kZWNvZGUnIHdvcmtzIG9uIGJv
dGggb2Ygb2xkICg8NS4zKSBhbmQgbmV3ICg+PTUuMykgYmFzaAotCi1bMV0gaHR0cHM6Ly9jZ2l0
LmdpdC5zYXZhbm5haC5nbnUub3JnL2NnaXQvYmFzaC5naXQvY29tbWl0Lz9oPWRldmVsJmlkPWE1
ZDI2MTdjN2E3ZTYwMmFjZTFmNDE0OTk4N2NkZmQwNzVjNGU3NjIKLQotVXBzdHJlYW0tU3RhdHVz
OiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHVs
bC8zNjY2XQotCi1TaWduZWQtb2ZmLWJ5OiBIb25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZl
ci5jb20+Ci0tLS0KLSB0ZXN0cy9oZWxwZXJzL3Rlc3Rfc2lnc3RhdGUuYyB8IDEgKwotIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvdGVzdHMvaGVscGVycy90
ZXN0X3NpZ3N0YXRlLmMgYi90ZXN0cy9oZWxwZXJzL3Rlc3Rfc2lnc3RhdGUuYwotaW5kZXggNTJj
N2RjYi4uYjYzMWVjMiAxMDA2NDQKLS0tLSBhL3Rlc3RzL2hlbHBlcnMvdGVzdF9zaWdzdGF0ZS5j
Ci0rKysgYi90ZXN0cy9oZWxwZXJzL3Rlc3Rfc2lnc3RhdGUuYwotQEAgLTY4LDYgKzY4LDcgQEAg
aW50IG1haW4oaW50IGFyZ2MgX1VfLCBjaGFyICoqYXJndiBfVV8pCi0gCXNpZ2lnbm9yZShTSUdQ
SVBFKTsKLSAJc2lnaWdub3JlKFNJR0FMUk0pOwotIAotKwlzaWduYWwoU0lHSU5ULCBTSUdfREZM
KTsKLSAJc2lnbmFsKFNJR0JVUywgU0lHX0RGTCk7Ci0gCXNpZ25hbChTSUdGUEUsIFNJR19ERkwp
OwotIAlzaWduYWwoU0lHU0VHViwgU0lHX0RGTCk7Ci0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10ZXN0cy10cy1r
aWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNv
ZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaAppbmRleCBkZWNlMGU5NGI3
Li5hNTBkZGUzOTQzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWls
dC1pbi1raWxsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDAxLXRlc3RzLXRzLWtpbGwtZGVjb2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWlu
LWtpbGwucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGQyZWVjY2YzNjU0MmQ1MDZiNjYwNjQx
YTA3YTQ0ZjM5NzY3NzI4OTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU3YjQ4ZmEx
ZmMzNjUyMmZiMzNlNWNjMzlmOGE0MGY4ZWQ4Y2UzNWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBUaHUsIDE1IE1h
eSAyMDI1IDE2OjQ0OjMzICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL3RzL2tpbGwvZGVj
b2RlOiBhdm9pZCB1c2luZyBzaGVsbCBidWlsdC1pbiBraWxsIGNvbW1hbmQKQEAgLTE2LDcgKzE2
LDcgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3Rlc3RzL3RzL2tp
bGwvZGVjb2RlIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKLWluZGV4IDAzYmMyNWZmNi4uNTcxNDk4
OTllIDEwMDc1NQoraW5kZXggMDNiYzI1Zi4uNTcxNDk4OSAxMDA3NTUKIC0tLSBhL3Rlc3RzL3Rz
L2tpbGwvZGVjb2RlCiArKysgYi90ZXN0cy90cy9raWxsL2RlY29kZQogQEAgLTE4LDYgKzE4LDEx
IEBAIFRTX0RFU0M9ImRlY29kZSBmdW5jdGlvbnMiCkBAIC0zMSw2ICszMSwzIEBAIGluZGV4IDAz
YmMyNWZmNi4uNTcxNDk4OTllIDEwMDc1NQogIHRzX3NraXBfcWVtdV91c2VyCiAgCiAgdHNfY2hl
Y2tfdGVzdF9jb21tYW5kICIkVFNfQ01EX0tJTEwiCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS10cy1raWxsLWRl
Y29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVhZC1vZi1oYXJkLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNl
LVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaAppbmRleCBmNGUyZjllNzQ1
Li5mZmQzNDMyNmMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgvMDAwMS10cy1raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVh
ZC1vZi1oYXJkLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDAxLXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9m
LWhhcmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM1ZDVlODg3MzAyOWQxNzBmY2FiMzhh
NmZiZDVkNWEzNTU1NzRiOWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGZhMDY3OTc2
ODQzNmViMzk1MzkwMGU5NjkxOWQ3NGYzYTQ2NGM4NmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiBEYXRlOiBXZWQsIDQgSnVu
IDIwMjUgMTY6Mjc6MTkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gdHMva2lsbC9kZWNvZGU6IHVz
ZSBSVE1JTiBmcm9tICdraWxsIC1MJyBpbnN0ZWFkIG9mCkBAIC0yOCw3ICsyOCw3IEBAIFNpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGVzdHMv
dHMva2lsbC9kZWNvZGUgYi90ZXN0cy90cy9raWxsL2RlY29kZQotaW5kZXggNTcxNDk4OTllLi41
MjRiNGU1ZTIgMTAwNzU1CitpbmRleCA1NzE0OTg5Li41MjRiNGU1IDEwMDc1NQogLS0tIGEvdGVz
dHMvdHMva2lsbC9kZWNvZGUKICsrKyBiL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCiBAQCAtNTMsMTQg
KzUzLDE5IEBAIEFDSz0KQEAgLTUzLDYgKzUzLDMgQEAgaW5kZXggNTcxNDk4OTllLi41MjRiNGU1
ZTIgMTAwNzU1CiAgCQllbHNlCiAgCQkgICAgY2F0CiAgCQlmaQotLS0gCi0yLjM0LjEKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2F2b2lkX3Bh
cmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCmluZGV4IGZlOTJhZmJjNTMuLjg1ZjQ4YTVh
ODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9h
dm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDQzMDMwMzg4ZTgzMTY0MmQzNmNiN2I5ZDRiNjM3NTVlOTY5NjcxNGEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDNmY2M2ZGU3ZTg1ZTM1ZjA0MjQ0NGUyNzQyMjQ5OGU0MWRj
ZWVjYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9y
LmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IE1vbiwgMTQgSnVuIDIwMjEgMTQ6MDA6MzEgKzAyMDAK
IFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDogQWRkIHB0ZXN0CkBAIC0xNCw3ICsxNCw3IEBA
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29u
ZmlndXJlLmFjCi1pbmRleCA0M2EyM2E1Li40YTg0NTMxIDEwMDY0NAoraW5kZXggZmZiNmY3OC4u
YzY4Y2EyOSAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBA
QCAtMTEsNyArMTEsNyBAQCBBQ19DT05GSUdfTUFDUk9fRElSKFttNF0pCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJlLXNiaW5kaXIu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29uZmlndXJl
LXNiaW5kaXIucGF0Y2gKaW5kZXggZWJiMzJhNjg0NS4uNjk3ZDE2MzA5YyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGly
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25m
aWd1cmUtc2JpbmRpci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzc4OTk4YmY4MmUzYjZm
ZjQ2NTY5MDc3YjI5Zjk1ZTcyYjczNDY4MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MTA0NjBkMGFjNDE0MTMxZTE1MWNiODg4ZTNhNmVlYWIyYWJjN2ZiMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFBoaWwgQmx1bmRlbGwgPHBiQHBiY2wubmV0PgogRGF0ZTogTW9uLCAy
NCBTZXAgMjAxMiAwNzoyNDo1MSArMDEwMAogU3ViamVjdDogW1BBVENIXSB1dGlsLWxpbnV4OiBF
bnN1cmUgdGhhdCAke3NiaW5kaXJ9IGlzIHJlc3BlY3RlZApAQCAtMTQsNyArMTQsNyBAQCBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2NvbmZpZ3VyYXRpb25dCiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmln
dXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBhNWQ5MTAyLi40M2EyM2E1IDEwMDY0NAoraW5k
ZXggMWU2ZWI3MC4uZmZiNmY3OCAxMDA2NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29u
ZmlndXJlLmFjCiBAQCAtMTEwLDcgKzExMCwxMCBAQCBBQ19TVUJTVChbcnVuc3RhdGVkaXJdKQpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3Bs
YXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAppbmRleCBm
YTRhZTAyYmMzLi4zNWU5NmZkZGRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3VidGVzdC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvZGlzcGxheV90ZXN0bmFt
ZV9mb3Jfc3VidGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNzI4YzJhYmQ4ODlkMjI1
NTM1MDA4YzNlN2ExZWVmNGI4YTBhZWVhMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
MWJmZjc3MzY4Y2FkOWE0YmI1Y2I5ZGVkZGNhYjcyNDVkYTYzOTQwNyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0
ZTogVGh1LCAzIERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc3Bs
YXkgdGVzdG5hbWUgZm9yIHN1YnRlc3QKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0
aWwtbGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC9wdGVzdC5wYXRjaAppbmRleCBhZDIzMDAxY2ZhLi43Y2YwOTNmNjg3
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvcHRl
c3QucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0
ZXN0LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOGJmNmFkZWQ5YjJhNzUxODVhZTRiMjNh
NDFjZDJlNDMyMmM1ZTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0YzkwN2UzYTNl
ZmVmNDUzYzA0ZDQ5ZGM2NTA4MjZjNjUyZThkNjY4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogVHVkb3IgRmxvcmVhIDx0dWRvci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBUaHUsIDMg
RGVjIDIwMTUgMDQ6MDg6MDAgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIFRFU1RTIHZh
cmlhYmxlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXhfMi40MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIu
NDEuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNv
cmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4XzIuNDEuMi5iYgotLSAKMi40Ny4xCgo=

--===============7780697509131089511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.0
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.0
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.0
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.0
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.0
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.0
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/coresched /usr/share/bash-completion/completions/choom"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/ts/misc/colors /usr/lib/util-linux/ptest/tests/expected/misc/colors"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============7780697509131089511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

Changes to packages/x86-64-v3-poky-linux/glib-2.0-initial (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.8600.1 to libgio-2.0.so.0.8600.0
  /usr/lib/libgirepository-2.0.so.0 changed symlink target from libgirepository-2.0.so.0.8600.1 to libgirepository-2.0.so.0.8600.0
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.8600.1 to libglib-2.0.so.0.8600.0
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.8600.1 to libgmodule-2.0.so.0.8600.0
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.8600.1 to libgobject-2.0.so.0.8600.0
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.8600.1 to libgthread-2.0.so.0.8600.0
  /usr/lib/libgio-2.0.so.0.8600.1 moved to /usr/lib/libgio-2.0.so.0.8600.0
  /usr/lib/libgirepository-2.0.so.0.8600.1 moved to /usr/lib/libgirepository-2.0.so.0.8600.0
  /usr/lib/libglib-2.0.so.0.8600.1 moved to /usr/lib/libglib-2.0.so.0.8600.0
  /usr/lib/libgmodule-2.0.so.0.8600.1 moved to /usr/lib/libgmodule-2.0.so.0.8600.0
  /usr/lib/libgobject-2.0.so.0.8600.1 moved to /usr/lib/libgobject-2.0.so.0.8600.0
  /usr/lib/libgthread-2.0.so.0.8600.1 moved to /usr/lib/libgthread-2.0.so.0.8600.0
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.8600.0-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py
packages/x86-64-v3-poky-linux/util-linux-libuuid: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-
 using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch"
packages/x86-64-v3-poky-linux/util-linux-libuuid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-sh
 ell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch"
packages/x86-64-v3-poky-linux/util-linux: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 110951 to 112707 (+2%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/coresched /usr/share/bash-completion/completions/choom"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 30085168 to 30093448 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 966942 to 967186 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 616703 to 616812 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 391847 to 391468 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 579792 to 623263 (+7%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 623486 to 623567 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 629300 to 629414 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 602707 to 602799 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 682238 to 682277 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 617385 to 617495 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 567096 to 569683 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 608994 to 609026 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 507140 to 506748 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 571166 to 570769 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 640535 to 640650 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 750653 to 750139 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 435349 to 434966 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 341974 to 341667 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 783693 to 783756 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 310716 to 310555 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 385085 to 384802 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PKGSIZE changed from 59520 to 63616 (+7%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6564295 to 6570291 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/misc/colors /usr/lib/util-linux/ptest/tests/ts/misc/colors"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux: PV changed from "2.41.1" to "2.41.2"
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was added
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0 was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.8600.0-gdb.py was removed
  /usr/share/gdb/auto-load/srv/pokybuild/yocto-worker/reproducible/build/build-st/tmp/work/x86_64-linux/glib-2.0-native/2.86.0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.8600.0-gdb.py was removed

--===============7780697509131089511==--

