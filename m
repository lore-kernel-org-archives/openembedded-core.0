Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E73CEBF6A
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:40 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11927.1763224711352034440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FOt4kn0a;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jh0hBRNu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a8861ed7e-109d443f-3d9f-4984-95fc-df7ae46477a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VpHcO4PDL8yvX0swXaCRyWXPY51UdGAonBY7Wb9zoRM=;
	b=FOt4kn0aMQhAYCdWuAPQb9EB5jJ6wDuk3tpOTUy4O0G/SlZ8RRhpi68w4pyrRln7
	2kN0KITJcMF8GK1x8nbHJ/G3VNO0tsjXtcW0u4tRUMRA/b1zl/aQT+okjcQuagwvbPX
	b99PzWLNCo9ZkXmEyAIKWwChQfuAXqW8u6Bw2vbM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224710;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VpHcO4PDL8yvX0swXaCRyWXPY51UdGAonBY7Wb9zoRM=;
	b=jh0hBRNuai1zteo6cIr63QK1QkIkaYn8TRHi5oEWXtDoseCOyC7VqvXqh8IQNHht
	axJ9Az2gZbaR24BxlvbLRqWjfvRycZFXsaictNHzdJRD+3AOEfdl8c3YkyTrR3kzcMK
	JpUeX9QmAD0boJMLXiGqz/+LwKw1OFkHwnDNqOVQ=
Content-Type: multipart/mixed; boundary="===============3182741183113094125=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>, Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid,util-linux: upgrading to 2.41.2,2.41.2
 SUCCEEDED
Message-ID: <0101019a8861ed7e-109d443f-3d9f-4984-95fc-df7ae46477a6-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226309

--===============3182741183113094125==
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
From 76471fb922cccd0bafbe06da97f7e16aa00ff877 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 06:07:57 +0000
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
index e3f9112192..8b1d61aed7 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch
@@ -1,4 +1,4 @@
-From b3a1d92a9078fada31b2cf64b802edd616026766 Mon Sep 17 00:00:00 2001
+From 17fe861b21d04058b12489fc8e7bac31d9026d41 Mon Sep 17 00:00:00 2001
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
index dece0e94b7..dc8b8121f6 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch
@@ -1,4 +1,4 @@
-From d2eeccf36542d506b660641a07a44f3976772897 Mon Sep 17 00:00:00 2001
+From 4ca20d71db3189501b4fded3f3a9f95ed4753040 Mon Sep 17 00:00:00 2001
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
index f4e2f9e745..0ab01b58a5 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch
@@ -1,4 +1,4 @@
-From c5d5e8873029d170fcab38a6fbd5d5a355574b9f Mon Sep 17 00:00:00 2001
+From abe7ac33584c7a1296cc881da2eeb84cf2fec21e Mon Sep 17 00:00:00 2001
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
index fe92afbc53..b4df69f091 100644
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From 43030388e831642d36cb7b9d4b63755e9696714a Mon Sep 17 00:00:00 2001
+From 65f1812aeffc3b70d43b482f34cb1fe3f2977211 Mon Sep 17 00:00:00 2001
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
index ebb32a6845..dd4ae5be7d 100644
--- a/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
+++ b/meta/recipes-core/util-linux/util-linux/configure-sbindir.patch
@@ -1,4 +1,4 @@
-From 378998bf82e3b6ff46569077b29f95e72b734681 Mon Sep 17 00:00:00 2001
+From 4f7cd78b94beedcd9bad875ba691948d7569869b Mon Sep 17 00:00:00 2001
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
index fa4ae02bc3..1e28f8a184 100644
--- a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -1,4 +1,4 @@
-From 728c2abd889d225535008c3e7a1eef4b8a0aeea2 Mon Sep 17 00:00:00 2001
+From d5ef4549b41e0425c1504aa4ab2bf805f2bcd993 Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Display testname for subtest
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
index ad23001cfa..4956c70ecc 100644
--- a/meta/recipes-core/util-linux/util-linux/ptest.patch
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -1,4 +1,4 @@
-From 18bf6aded9b2a75185ae4b23a41cd2e4322c5e31 Mon Sep 17 00:00:00 2001
+From ada18ffa05648292de10d4df40e384c981ba3fbf Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Thu, 3 Dec 2015 04:08:00 +0100
 Subject: [PATCH] Define TESTS variable
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.2.bb
-- 
2.47.1


--===============3182741183113094125==
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
packages/x86-64-v3-poky-linux/util-linux-libuuid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dbg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-dev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-doc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-locale: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-src: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid-staticdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux-libuuid/util-linux-libuuid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.1.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch" to "https://cdn.kernel.org/pub/linux/utils/util-linux/v2.41/util-linux-2.41.2.tar.xz file://configure-sbindir.patch file://runuser.pamd file://runuser-l.pamd file://ptest.patch file://run-ptest file://display_testname_for_subtest.patch file://avoid_parallel_tests.patch file://0001-tests-ts-kill-decode-avoid-using-sh
 ell-built-in-kill.patch file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch"
packages/x86-64-v3-poky-linux/util-linux: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-addpart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-agetty: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/coresched /usr/share/bash-completion/completions/choom"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: PKGSIZE changed from 110951 to 112707 (+2%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-bits: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkdiscard: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkpr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blkzone: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-blockdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cal: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-cfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chcpu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chfn: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chmem: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-choom: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chrt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-chsh: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-col: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colcrt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-colrm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-column: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-coresched: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ctrlaltdel: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dbg: PKGSIZE changed from 30085168 to 30093448 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-delpart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-dmesg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-doc: PKGSIZE changed from 966942 to 967186 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-eject: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-enosys: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-exch: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fadvise: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fallocate: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fincore: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-findmnt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-flock: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck.cramfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsck: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fsfreeze: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-fstrim: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-getopt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hardlink: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hexdump: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-hwclock: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ionice: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcmk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcrm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ipcs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-irqtop: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-isosize: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-kill: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-last: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lastlog2: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ldattach: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libblkid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-liblastlog2: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libmount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-libsmartcols: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ca: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-cs: PKGSIZE changed from 616703 to 616812 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-da: PKGSIZE changed from 391847 to 391468 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-de: PKGSIZE changed from 579792 to 623263 (+7%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-es: PKGSIZE changed from 623486 to 623567 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-et: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-eu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fi: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-fr: PKGSIZE changed from 629300 to 629414 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-gl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hr: PKGSIZE changed from 602707 to 602799 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-hu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-id: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-it: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ja: PKGSIZE changed from 682238 to 682277 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ka: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ko: PKGSIZE changed from 617385 to 617495 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-nl: PKGSIZE changed from 567096 to 569683 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pl: PKGSIZE changed from 608994 to 609026 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt-br: PKGSIZE changed from 507140 to 506748 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-pt: PKGSIZE changed from 571166 to 570769 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ro: PKGSIZE changed from 640535 to 640650 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-ru: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sr: PKGSIZE changed from 750653 to 750139 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-sv: PKGSIZE changed from 435349 to 434966 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-tr: PKGSIZE changed from 341974 to 341667 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-uk: PKGSIZE changed from 783693 to 783756 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-vi: PKGSIZE changed from 310716 to 310555 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-cn: PKGSIZE changed from 385085 to 384802 (-0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-locale-zh-tw: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-logger: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-look: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-losetup: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsblk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsclocks: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lscpu: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsfd: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsipc: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsirq: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslocks: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lslogins: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsmem: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-lsns: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mcookie: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mesg: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs.cramfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkfs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mkswap: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-more: PKGSIZE changed from 59520 to 63616 (+7%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-mountpoint: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-namei: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nologin: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-nsenter: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-partx: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pipesz: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-pivot-root: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-prlimit: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/misc/colors /usr/lib/util-linux/ptest/tests/ts/misc/colors"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: PKGSIZE changed from 6564295 to 6570291 (+0%)
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-readprofile: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rename: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-renice: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-resizepart: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rfkill: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-rtcwake: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-runuser: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-script: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptlive: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-scriptreplay: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setarch: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpgid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setpriv: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setsid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-setterm: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sfdisk: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-src: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-staticdev: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-su: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-sulogin: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaplabel: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapoff: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swapon: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-swaponoff: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-switch-root: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-taskset: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uclampset: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ul: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-umount: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-unshare: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-utmpdump: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidd: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidgen: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-uuidparse: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-waitpid: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wall: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wdctl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-whereis: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-wipefs: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-write: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux-zramctl: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
packages/x86-64-v3-poky-linux/util-linux/util-linux: PV changed from "2.41.1" to "2.41.2"
packages/x86-64-v3-poky-linux/util-linux/util-linux: PKGV changed from 2.41.1 [default] to 2.41.2 [default]
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

--===============3182741183113094125==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-util-linux-upgrade-2.41.1-2.41.2-.patch"

RnJvbSA3NjQ3MWZiOTIyY2NjZDBiYWZiZTA2ZGE5N2Y3ZTE2YWEwMGZmODc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDY6MDc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQsdXRpbC1saW51eDogdXBncmFkZSAyLjQxLjEgLT4KIDIuNDEuMiwy
LjQxLjEgLT4gMi40MS4yCgotLS0KIC4uLjIuNDEuMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRf
Mi40MS4yLmJifSB8ICAwCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgu
aW5jICAgfCAgNCArLQogLi4ubnQtYXBpLXV0aWxzLWF2b2lkLXVzaW5nLXN5cy1tb3VudC5oLnBh
dGNoIHwgMjkgLS0tLS0tLS0tLQogLi4uZ24tc29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2Nr
X2RpLnBhdGNoIHwgIDcgKy0tCiAuLi5zdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lH
SU4ucGF0Y2ggfCA1NSAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5jb2RlLWF2b2lkLXVzaW5nLXNo
ZWxsLWJ1aWx0LWluLWtpbGwucGF0Y2ggfCAgNyArLS0KIC4uLnNlLVJUTUlOLWZyb20ta2lsbC1M
LWluc3RlYWQtb2YtaGFyZC5wYXRjaCB8ICA3ICstLQogLi4uL3V0aWwtbGludXgvYXZvaWRfcGFy
YWxsZWxfdGVzdHMucGF0Y2ggICAgIHwgIDQgKy0KIC4uLi91dGlsLWxpbnV4L2NvbmZpZ3VyZS1z
YmluZGlyLnBhdGNoICAgICAgICB8ICA0ICstCiAuLi4vZGlzcGxheV90ZXN0bmFtZV9mb3Jfc3Vi
dGVzdC5wYXRjaCAgICAgICAgfCAgMiArLQogLi4uL3V0aWwtbGludXgvdXRpbC1saW51eC9wdGVz
dC5wYXRjaCAgICAgICAgIHwgIDIgKy0KIC4uLmwtbGludXhfMi40MS4xLmJiID0+IHV0aWwtbGlu
dXhfMi40MS4yLmJifSB8ICAwCiAxMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
MDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRp
bC1saW51eC1saWJ1dWlkXzIuNDEuMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi40MS4yLmJi
fSAoMTAwJSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4
L3V0aWwtbGludXgvMDAwMS1pbmNsdWRlLW1vdW50LWFwaS11dGlscy1hdm9pZC11c2luZy1zeXMt
bW91bnQuaC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC8wMDAxLXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxp
Y2l0bHktcmVzZXQtU0lHSU4ucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3t1dGlsLWxpbnV4XzIuNDEuMS5iYiA9PiB1dGlsLWxpbnV4XzIuNDEuMi5iYn0gKDEwMCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxp
YnV1aWRfMi40MS4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4
LWxpYnV1aWRfMi40MS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjQxLjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIu
NDEuMi5iYgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKaW5k
ZXggZTdhM2M1YmU5Zi4uYzI5MDExYWQ2MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUv
dXRpbC1saW51eC91dGlsLWxpbnV4LmluYworKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXguaW5jCkBAIC0xOSwxMCArMTksOCBAQCBTUkNfVVJJID0gIiR7S0VSTkVM
T1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9OfS91dGls
LWxpbgogICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11
c2luZy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
bHNmZC1ta2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19kaS5wYXRj
aCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXRzLWtpbGwtZGVjb2RlLXVzZS1SVE1JTi1mcm9t
LWtpbGwtTC1pbnN0ZWFkLW9mLWhhcmQucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS10
ZXN0cy1oZWxwZXJzLXRlc3Rfc2lnc3RhdGUuYy1leHBsaWNpdGx5LXJlc2V0LVNJR0lOLnBhdGNo
IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtaW5jbHVkZS1tb3VudC1hcGktdXRpbHMtYXZvaWQt
dXNpbmctc3lzLW1vdW50LmgucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICJiZTlhZDlhMjc2ZjQzMDVhYjdkZDJmNTIyNWM4YmUxZmY1NDM1MmY1NjVmZjRkZWRl
OTYyOGMxYWFhN2RlYzU3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYwNjJhMWQ4OWI1NzFhNjE5
MzJlNmZjMDIxMWYzNjA2MGM0MTgzNTY4YjgxZWU4NjZjZjM2M2JjZTlmNjU4M2UiCiAKIENWRV9Q
Uk9EVUNUID0gInV0aWwtbGludXgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvMDAwMS1pbmNsdWRlLW1vdW50LWFwaS11dGlscy1hdm9pZC11c2lu
Zy1zeXMtbW91bnQuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDAxLWluY2x1ZGUtbW91bnQtYXBpLXV0aWxzLWF2b2lkLXVzaW5nLXN5cy1tb3VudC5o
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA1NDRmNDUzNjJkLi4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWlu
Y2x1ZGUtbW91bnQtYXBpLXV0aWxzLWF2b2lkLXVzaW5nLXN5cy1tb3VudC5oLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsMjkgKzAsMCBAQAotRnJvbSAyYTliNDhkMjBkNzRmNjVhYzcwOGIzYmNl
ZTZhN2UyYTYxYWFkZjg4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2FyZWwgWmFr
IDxremFrQHJlZGhhdC5jb20+Ci1EYXRlOiBUaHUsIDIxIEF1ZyAyMDI1IDA5OjU5OjEwICswMjAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIGluY2x1ZGUvbW91bnQtYXBpLXV0aWxzOiBhdm9pZCB1c2luZyBz
eXMvbW91bnQuaAotCi1UaGUgZmlsZSBpcyB1bm5lY2Vzc2FyeSBhbmQgaW50cm9kdWNlcyBkdXBs
aWNhdGUgI2RlZmluZSBvZiBNU18qIG1hY3Jvcy4KLQotRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNv
bS91dGlsLWxpbnV4L3V0aWwtbGludXgvaXNzdWVzLzM2NzQKLVNpZ25lZC1vZmYtYnk6IEthcmVs
IFphayA8a3pha0ByZWRoYXQuY29tPgotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6
Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvMmE5YjQ4ZDIwZDc0ZjY1
YWM3MDhiM2JjZWU2YTdlMmE2MWFhZGY4OF0KLS0tLQotIGluY2x1ZGUvbW91bnQtYXBpLXV0aWxz
LmggfCAxIC0KLSAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEv
aW5jbHVkZS9tb3VudC1hcGktdXRpbHMuaCBiL2luY2x1ZGUvbW91bnQtYXBpLXV0aWxzLmgKLWlu
ZGV4IDkyMGQ2NzY2YS4uZTM1NTI0MTY4IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9tb3VudC1hcGkt
dXRpbHMuaAotKysrIGIvaW5jbHVkZS9tb3VudC1hcGktdXRpbHMuaAotQEAgLTYsNyArNiw2IEBA
Ci0gI2RlZmluZSBVVElMX0xJTlVYX01PVU5UX0FQSV9VVElMUwotIAotICNpZmRlZiBIQVZFX0xJ
TlVYX01PVU5UX0gKLS0jaW5jbHVkZSA8c3lzL21vdW50Lmg+Ci0gI2luY2x1ZGUgPGxpbnV4L21v
dW50Lmg+Ci0gI2luY2x1ZGUgPGxpbnV4L3VuaXN0ZC5oPgotICNpbmNsdWRlIDxzeXMvc3lzY2Fs
bC5oPgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LzAwMDEtbHNmZC1ta2Zkcy1mb3JlaWduLXNvY2tldHMtc2tpcC13aGVu
LWxhY2tpbmctc29ja19kaS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC8wMDAxLWxzZmQtbWtmZHMtZm9yZWlnbi1zb2NrZXRzLXNraXAtd2hlbi1sYWNraW5n
LXNvY2tfZGkucGF0Y2gKaW5kZXggZTNmOTExMjE5Mi4uOGIxZDYxYWVkNyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtbHNmZC1ta2Zkcy1m
b3JlaWduLXNvY2tldHMtc2tpcC13aGVuLWxhY2tpbmctc29ja19kaS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1sc2ZkLW1rZmRzLWZvcmVp
Z24tc29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSBiM2ExZDkyYTkwNzhmYWRhMzFiMmNmNjRiODAyZWRkNjE2MDI2NzY2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxN2ZlODYxYjIxZDA0MDU4YjEyNDg5ZmM4ZTdiYWMzMWQ5
MDI2ZDQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPgogRGF0ZTogTW9uLCAyNiBNYXkgMjAyNSAxNToyNDoxNiArMDgwMAogU3Vi
amVjdDogW1BBVENIXSBsc2ZkL21rZmRzLWZvcmVpZ24tc29ja2V0czogc2tpcCB3aGVuIGxhY2tp
bmcgc29ja19kaWFnCkBAIC0xOSw3ICsxOSw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFp
LkNoZW5Ad2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAK
IGRpZmYgLS1naXQgYS90ZXN0cy90cy9sc2ZkL21rZmRzLWZvcmVpZ24tc29ja2V0cyBiL3Rlc3Rz
L3RzL2xzZmQvbWtmZHMtZm9yZWlnbi1zb2NrZXRzCi1pbmRleCBjZDk0ZGE3OTkuLjc2MTM4YTdh
NiAxMDA3NTUKK2luZGV4IGNkOTRkYTcuLjc2MTM4YTcgMTAwNzU1CiAtLS0gYS90ZXN0cy90cy9s
c2ZkL21rZmRzLWZvcmVpZ24tc29ja2V0cwogKysrIGIvdGVzdHMvdHMvbHNmZC9ta2Zkcy1mb3Jl
aWduLXNvY2tldHMKIEBAIC0zMCw2ICszMCw4IEBAIHRzX3NraXBfbm9ucm9vdApAQCAtMzEsNiAr
MzEsMyBAQCBpbmRleCBjZDk0ZGE3OTkuLjc2MTM4YTdhNiAxMDA3NTUKICBkZWNsYXJlIC1BIHRj
YXNlCiAgdGNhc2VbTkFNRV09InN0YXRlPWNvbm5lY3RlZCIKICB0Y2FzZVtTT0NLLk5FVE5TXT0K
LS0tIAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgv
dXRpbC1saW51eC8wMDAxLXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHkt
cmVzZXQtU0lHSU4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgvMDAwMS10ZXN0cy1oZWxwZXJzLXRlc3Rfc2lnc3RhdGUuYy1leHBsaWNpdGx5LXJlc2V0LVNJ
R0lOLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAzMjQ3OThjZmQ1Li4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAx
LXRlc3RzLWhlbHBlcnMtdGVzdF9zaWdzdGF0ZS5jLWV4cGxpY2l0bHktcmVzZXQtU0lHSU4ucGF0
Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw1NSArMCwwIEBACi1Gcm9tIDM4M2VmZTI2YTJhNjFiNDIw
ZDM2OWNkMmMyM2YwM2QxZDY5MGQ0MjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBI
b25neHUgSmlhIDxob25neHUuamlhQHdpbmRyaXZlci5jb20+Ci1EYXRlOiBNb24sIDI4IEp1bCAy
MDI1IDIwOjM1OjEzICswODAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRlc3RzL2hlbHBlcnMvdGVzdF9z
aWdzdGF0ZS5jOiBleHBsaWNpdGx5IHJlc2V0IFNJR0lOVCB0bwotIGRlZmF1bHQgYWN0aW9uIGFm
dGVyIHRyYXBwaW5nCi0KLUFmdGVyIHVwZ3JhZGluZyBiYXNoIHRvIDUuMyB0byBjb250YWluIGNv
bW1pdCBbMV0sIGlmIFNJR0lOVCB3YXMgdHJhcHBlZCBpbgotYXN5bmNocm9ub3VzIHN1YnNoZWxs
LCBiYXNoIGNhbGxlZCBzZXRfc2lnbmFsX2FzeW5jX2lnbm9yZWQgdG8gbWFrZSBzdXJlCi1wcm9j
ZXNzZXMgdGhhdCBhcmUgY3JlYXRlZCBieSB0aGlzIGFzeW5jaHJvbm91cyBzdWJzaGVsbCB0byBp
Z25vcmUgU0lHSU5ULgotCi1BbmQgaXQgY2F1c2VkIHRlc3QgY2FzZSBga2lsbC9kZWNvZGUnIGZh
aWxlZCwgdGhlIHNpZ25hbCBJTlQgd2FzIGV4aXN0ZWQgaW4KLWJvdGggb2YgQmxvY2tlZCBhbmQg
SWdub3JlZAotCi0kIC4vdGVzdHMvcnVuLnNoIC0tdXNlLXN5c3RlbS1jb21tYW5kcyAtLXBhcnNh
YmxlIC0tc2hvdy1kaWZmICAga2lsbC9kZWNvZGUKLS4uLgotZGlmZi17e3sKLXwtLS0gL3Vzci9s
aWIvdXRpbC1saW51eC9wdGVzdC90ZXN0cy9leHBlY3RlZC9raWxsL2RlY29kZSAgICAgICAgMjAx
MS0wNC0wNSAyMzowMDowMC4wMDAwMDAwMDAgKzAwMDAKLXwrKysgL3Vzci9saWIvdXRpbC1saW51
eC9wdGVzdC90ZXN0cy9vdXRwdXQva2lsbC9kZWNvZGUgIDIwMjUtMDctMjggMTI6MDk6NDYuMjc5
MDAwMDAwICswMDAwCi1AQCAtMTYsNSArMTYsNSBAQAotIFBlbmRpbmcgKHRocmVhZCk6IElOVCBJ
TEwKLSBQZW5kaW5nIChwcm9jZXNzKTogVVNSMQotIEJsb2NrZWQ6IElOVCBJTEwgQUJSVCBGUEUg
VVNSMSBTRUdWIFRFUk0KLS1JZ25vcmVkOiBIVVAgUVVJVCBUUkFQIFBJUEUgQUxSTQotK0lnbm9y
ZWQ6IEhVUCBJTlQgUVVJVCBUUkFQIFBJUEUgQUxSTQotIENhdWdodDogSUxMIFVTUjEKLX19fS1k
aWZmCi0uLi4KLQotRXhwbGljaXRseSByZXNldCBTSUdJTlQgdG8gZGVmYXVsdCBhY3Rpb24gYWZ0
ZXIgdHJhcHBpbmcsIHRoZW4gdGhlCi10ZXN0IGNhc2UgYGtpbGwvZGVjb2RlJyB3b3JrcyBvbiBi
b3RoIG9mIG9sZCAoPDUuMykgYW5kIG5ldyAoPj01LjMpIGJhc2gKLQotWzFdIGh0dHBzOi8vY2dp
dC5naXQuc2F2YW5uYWguZ251Lm9yZy9jZ2l0L2Jhc2guZ2l0L2NvbW1pdC8/aD1kZXZlbCZpZD1h
NWQyNjE3YzdhN2U2MDJhY2UxZjQxNDk5ODdjZGZkMDc1YzRlNzYyCi0KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1
bGwvMzY2Nl0KLQotU2lnbmVkLW9mZi1ieTogSG9uZ3h1IEppYSA8aG9uZ3h1LmppYUB3aW5kcml2
ZXIuY29tPgotLS0tCi0gdGVzdHMvaGVscGVycy90ZXN0X3NpZ3N0YXRlLmMgfCAxICsKLSAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL3Rlc3RzL2hlbHBlcnMv
dGVzdF9zaWdzdGF0ZS5jIGIvdGVzdHMvaGVscGVycy90ZXN0X3NpZ3N0YXRlLmMKLWluZGV4IDUy
YzdkY2IuLmI2MzFlYzIgMTAwNjQ0Ci0tLS0gYS90ZXN0cy9oZWxwZXJzL3Rlc3Rfc2lnc3RhdGUu
YwotKysrIGIvdGVzdHMvaGVscGVycy90ZXN0X3NpZ3N0YXRlLmMKLUBAIC02OCw2ICs2OCw3IEBA
IGludCBtYWluKGludCBhcmdjIF9VXywgY2hhciAqKmFyZ3YgX1VfKQotIAlzaWdpZ25vcmUoU0lH
UElQRSk7Ci0gCXNpZ2lnbm9yZShTSUdBTFJNKTsKLSAKLSsJc2lnbmFsKFNJR0lOVCwgU0lHX0RG
TCk7Ci0gCXNpZ25hbChTSUdCVVMsIFNJR19ERkwpOwotIAlzaWduYWwoU0lHRlBFLCBTSUdfREZM
KTsKLSAJc2lnbmFsKFNJR1NFR1YsIFNJR19ERkwpOwotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMt
a2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVpbHQtaW4ta2lsbC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLXRlc3RzLXRzLWtpbGwtZGVj
b2RlLWF2b2lkLXVzaW5nLXNoZWxsLWJ1aWx0LWluLWtpbGwucGF0Y2gKaW5kZXggZGVjZTBlOTRi
Ny4uZGM4YjgxMjFmNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtdGVzdHMtdHMta2lsbC1kZWNvZGUtYXZvaWQtdXNpbmctc2hlbGwtYnVp
bHQtaW4ta2lsbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2luZy1zaGVsbC1idWlsdC1p
bi1raWxsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkMmVlY2NmMzY1NDJkNTA2YjY2MDY0
MWEwN2E0NGYzOTc2NzcyODk3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0Y2EyMGQ3
MWRiMzE4OTUwMWI0ZmRlZDNmM2E5Zjk1ZWQ0NzUzMDQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNSBN
YXkgMjAyNSAxNjo0NDozMyArMDgwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0cy90cy9raWxsL2Rl
Y29kZTogYXZvaWQgdXNpbmcgc2hlbGwgYnVpbHQtaW4ga2lsbCBjb21tYW5kCkBAIC0xNiw3ICsx
Niw3IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0cy90cy9r
aWxsL2RlY29kZSBiL3Rlc3RzL3RzL2tpbGwvZGVjb2RlCi1pbmRleCAwM2JjMjVmZjYuLjU3MTQ5
ODk5ZSAxMDA3NTUKK2luZGV4IDAzYmMyNWYuLjU3MTQ5ODkgMTAwNzU1CiAtLS0gYS90ZXN0cy90
cy9raWxsL2RlY29kZQogKysrIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKIEBAIC0xOCw2ICsxOCwx
MSBAQCBUU19ERVNDPSJkZWNvZGUgZnVuY3Rpb25zIgpAQCAtMzEsNiArMzEsMyBAQCBpbmRleCAw
M2JjMjVmZjYuLjU3MTQ5ODk5ZSAxMDA3NTUKICB0c19za2lwX3FlbXVfdXNlcgogIAogIHRzX2No
ZWNrX3Rlc3RfY29tbWFuZCAiJFRTX0NNRF9LSUxMIgotLS0gCi0yLjM0LjEKLQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1k
ZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3RlYWQtb2YtaGFyZC5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLXRzLWtpbGwtZGVjb2RlLXVz
ZS1SVE1JTi1mcm9tLWtpbGwtTC1pbnN0ZWFkLW9mLWhhcmQucGF0Y2gKaW5kZXggZjRlMmY5ZTc0
NS4uMGFiMDFiNThhNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LzAwMDEtdHMta2lsbC1kZWNvZGUtdXNlLVJUTUlOLWZyb20ta2lsbC1MLWluc3Rl
YWQtb2YtaGFyZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXgvMDAwMS10cy1raWxsLWRlY29kZS11c2UtUlRNSU4tZnJvbS1raWxsLUwtaW5zdGVhZC1v
Zi1oYXJkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjNWQ1ZTg4NzMwMjlkMTcwZmNhYjM4
YTZmYmQ1ZDVhMzU1NTc0YjlmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYmU3YWMz
MzU4NGM3YTEyOTZjYzg4MWRhMmVlYjg0Y2YyZmVjMjFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogQ2hlbiBRaSA8UWkuQ2hlbkB3aW5kcml2ZXIuY29tPgogRGF0ZTogV2VkLCA0IEp1
biAyMDI1IDE2OjI3OjE5ICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRzL2tpbGwvZGVjb2RlOiB1
c2UgUlRNSU4gZnJvbSAna2lsbCAtTCcgaW5zdGVhZCBvZgpAQCAtMjgsNyArMjgsNyBAQCBTaWdu
ZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+CiAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rlc3Rz
L3RzL2tpbGwvZGVjb2RlIGIvdGVzdHMvdHMva2lsbC9kZWNvZGUKLWluZGV4IDU3MTQ5ODk5ZS4u
NTI0YjRlNWUyIDEwMDc1NQoraW5kZXggNTcxNDk4OS4uNTI0YjRlNSAxMDA3NTUKIC0tLSBhL3Rl
c3RzL3RzL2tpbGwvZGVjb2RlCiArKysgYi90ZXN0cy90cy9raWxsL2RlY29kZQogQEAgLTUzLDE0
ICs1MywxOSBAQCBBQ0s9CkBAIC01Myw2ICs1MywzIEBAIGluZGV4IDU3MTQ5ODk5ZS4uNTI0YjRl
NWUyIDEwMDc1NQogIAkJZWxzZQogIAkJICAgIGNhdAogIAkJZmkKLS0tIAotMi4zNC4xCi0KZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9hdm9pZF9w
YXJhbGxlbF90ZXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBmZTkyYWZiYzUzLi5iNGRmNjlm
MDkxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
YXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA0MzAzMDM4OGU4MzE2NDJkMzZjYjdiOWQ0YjYzNzU1ZTk2OTY3MTRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NWYxODEyYWVmZmMzYjcwZDQzYjQ4MmYzNGNiMWZlM2Yy
OTc3MjExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogVHVkb3IgRmxvcmVhIDx0dWRv
ci5mbG9yZWFAZW5lYS5jb20+CiBEYXRlOiBNb24sIDE0IEp1biAyMDIxIDE0OjAwOjMxICswMjAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHV0aWwtbGludXg6IEFkZCBwdGVzdApAQCAtMTQsNyArMTQsNyBA
QCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2Nv
bmZpZ3VyZS5hYwotaW5kZXggNDNhMjNhNS4uNGE4NDUzMSAxMDA2NDQKK2luZGV4IGZmYjZmNzgu
LmM2OGNhMjkgMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwog
QEAgLTExLDcgKzExLDcgQEAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3VyZS1zYmluZGly
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbmZpZ3Vy
ZS1zYmluZGlyLnBhdGNoCmluZGV4IGViYjMyYTY4NDUuLmRkNGFlNWJlN2QgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9jb25maWd1cmUtc2JpbmRp
ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgvY29u
ZmlndXJlLXNiaW5kaXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDM3ODk5OGJmODJlM2I2
ZmY0NjU2OTA3N2IyOWY5NWU3MmI3MzQ2ODEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDRmN2NkNzhiOTRiZWVkY2Q5YmFkODc1YmE2OTE5NDhkNzU2OTg2OWIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBQaGlsIEJsdW5kZWxsIDxwYkBwYmNsLm5ldD4KIERhdGU6IE1vbiwg
MjQgU2VwIDIwMTIgMDc6MjQ6NTEgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gdXRpbC1saW51eDog
RW5zdXJlIHRoYXQgJHtzYmluZGlyfSBpcyByZXNwZWN0ZWQKQEAgLTE0LDcgKzE0LDcgQEAgVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtjb25maWd1cmF0aW9uXQogIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZp
Z3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggYTVkOTEwMi4uNDNhMjNhNSAxMDA2NDQKK2lu
ZGV4IDFlNmViNzAuLmZmYjZmNzggMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2Nv
bmZpZ3VyZS5hYwogQEAgLTExMCw3ICsxMTAsMTAgQEAgQUNfU1VCU1QoW3J1bnN0YXRlZGlyXSkK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9kaXNw
bGF5X3Rlc3RuYW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKaW5kZXgg
ZmE0YWUwMmJjMy4uMWUyOGY4YTE4NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRp
bC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5hbWVfZm9yX3N1YnRlc3QucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L2Rpc3BsYXlfdGVzdG5h
bWVfZm9yX3N1YnRlc3QucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDcyOGMyYWJkODg5ZDIy
NTUzNTAwOGMzZTdhMWVlZjRiOGEwYWVlYTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGQ1ZWY0NTQ5YjQxZTA0MjVjMTUwNGFhNGFiMmJmODA1ZjJiY2Q5OTMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBUdWRvciBGbG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERh
dGU6IFRodSwgMyBEZWMgMjAxNSAwNDowODowMCArMDEwMAogU3ViamVjdDogW1BBVENIXSBEaXNw
bGF5IHRlc3RuYW1lIGZvciBzdWJ0ZXN0CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91
dGlsLWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgvcHRlc3QucGF0Y2gKaW5kZXggYWQyMzAwMWNmYS4uNDk1NmM3MGVj
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4L3B0
ZXN0LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC9w
dGVzdC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMThiZjZhZGVkOWIyYTc1MTg1YWU0YjIz
YTQxY2QyZTQzMjJjNWUzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYWRhMThmZmEw
NTY0ODI5MmRlMTBkNGRmNDBlMzg0Yzk4MWJhM2ZiZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFR1ZG9yIEZsb3JlYSA8dHVkb3IuZmxvcmVhQGVuZWEuY29tPgogRGF0ZTogVGh1LCAz
IERlYyAyMDE1IDA0OjA4OjAwICswMTAwCiBTdWJqZWN0OiBbUEFUQ0hdIERlZmluZSBURVNUUyB2
YXJpYWJsZQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4XzIuNDEuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8y
LjQxLjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1j
b3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eF8yLjQxLjIuYmIKLS0gCjIuNDcuMQoK

--===============3182741183113094125==
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
packages/x86-64-v3-poky-linux/util-linux/util-linux-bash-completion: FILELIST: added "/usr/share/bash-completion/completions/choom /usr/share/bash-completion/completions/coresched"
packages/x86-64-v3-poky-linux/util-linux/util-linux-ptest: FILELIST: added "/usr/lib/util-linux/ptest/tests/expected/misc/colors /usr/lib/util-linux/ptest/tests/ts/misc/colors"
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

--===============3182741183113094125==--

