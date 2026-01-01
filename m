Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C955EEE25E
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:50:17 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6450.1767300606739032714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Wq32TabQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260101205003fa5ff2af0d0002075e-ed65ke@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260101205003fa5ff2af0d0002075e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:50:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=w5/cQQzcSEoKy4R/KktngYIMXPCPg3WfI7L/pvtJIPs=;
 b=Wq32TabQr+w8sULACvWT5AGDYGK+PDRLqMP9cmff0e9KBXmBVWhIlqrO+lUjYiKdatV80Q
 2Y48mkV0l1995XBRYaOL8Az0gF14rrkYj+vs6mtDd+pc1qsBWKMKs2/MD5QEuxxU0DlU9rV+
 WqjmLDoO/Url+tUrZFbHGSbImzEJlmsPeNSarPJAFauykLqmQe7+uc7lsVEE9pT5KPiWDLWY
 UwcGM8t84RW9gH6+eg51R61NgS9dm1i1QWqT4PPKRLqeSmuED9cpycFnpokTctAgmK+CxzSy
 6tZqD9xRk4P0mDIbEHEnMXFu75tK6inrzEkA4YtHx2boRF/uEBT47vCA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from 2.41.1 to 2.41.2
Date: Thu,  1 Jan 2026 21:50:02 +0100
Message-Id: <20260101205003.98143-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:50:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228831

From: Chen Qi <Qi.Chen@windriver.com>

The following two patches are dropped as they are in new version:
  util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
  util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch

Ptest change:
The new test case misc/colors needs lib/color-names.c. So copy it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 4d1d3f446577711057d1c51ac42e5dc9633b496a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...2.41.1.bb => util-linux-libuuid_2.41.2.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  4 +-
 ...nt-api-utils-avoid-using-sys-mount.h.patch | 29 ----------
 ...st_sigstate.c-explicitly-reset-SIGIN.patch | 55 -------------------
 ...l-linux_2.41.1.bb => util-linux_2.41.2.bb} |  2 +
 5 files changed, 3 insertions(+), 87 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.1.bb => util-linux-libuuid_2.41.2.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.1.bb => util-linux_2.41.2.bb} (99%)

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
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
similarity index 99%
rename from meta/recipes-core/util-linux/util-linux_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.2.bb
index 08bca065b2..f01cbaba9f 100644
--- a/meta/recipes-core/util-linux/util-linux_2.41.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
@@ -401,6 +401,8 @@ do_install_ptest() {
     cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
     cp -pR ${S}/tests/ts ${D}${PTEST_PATH}/tests/
     cp ${B}/config.h ${D}${PTEST_PATH}
+    # for misc/color ts
+    mkdir ${D}${PTEST_PATH}/lib && cp ${S}/lib/color-names.c ${D}${PTEST_PATH}/lib/
 
     sed -i 's|@base_sbindir@|${base_sbindir}|g' ${D}${PTEST_PATH}/run-ptest
 

