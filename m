Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BDAC4167E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:53 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web09.11558.1650052685921310331
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=5FVU42zM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101802ecddc08-a4a10e38-2cb7-43cf-9091-f10d4b913ca8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052685;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=oeAD5zoyhF2MmCtEjTcZjDNQyQ8iOn0XHWz2Dq3T0zc=;
	b=5FVU42zMlpEkaSqykx2cOPqhbgjuPy/JH5uu2jaWbqC/2RTigjA3BYixB2nh2jPt
	GYb8enUQ2/0sn2L16qOIL4HoU9I3LUZvfS7qJEBI+vr3aQGEoUS+8kYSs3uDAQR6M5B
	e/0yNuMA4hHF4IpE+gB0Z8xZRA5IKTiz81J9h8io=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052685;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=oeAD5zoyhF2MmCtEjTcZjDNQyQ8iOn0XHWz2Dq3T0zc=;
	b=A+0bycbl75fd4MLNdc9LLs4cXIC8TQ4qUMt8KrfKFxMRi4ICU9Vh6oIXqFZyACLj
	UAnxaoidetpL5aApwgDJjytOwaFw1riiVfGIlgu4Xi2woYQCoV8XnQsN48VzGFB/GrE
	bebxh4pR23OMK9y9eCx+TICMNUJ9MQVjQYRLb1G8=
Content-Type: multipart/mixed; boundary="===============4992760884998073543=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.0p1 SUCCEEDED
Message-ID: 
 <010101802ecddc08-a4a10e38-2cb7-43cf-9091-f10d4b913ca8-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164432

--===============4992760884998073543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.0p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-8.9p1-9.0p1.patch
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
--===============4992760884998073543==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-8.9p1-9.0p1.patch"

From 6695c35580a2416ded6d24cb6bc79ae153bf17b3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 06:21:37 +0000
Subject: [PATCH] openssh: upgrade 8.9p1 -> 9.0p1

---
 ...t-using-sandbox-when-cross-compiling.patch | 33 -----------------
 ...467179428a0e3ea9e4aa9738ac12ff02822d.patch | 35 -------------------
 .../{openssh_8.9p1.bb => openssh_9.0p1.bb}    |  4 +--
 3 files changed, 1 insertion(+), 71 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.9p1.bb => openssh_9.0p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch b/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
deleted file mode 100644
index 0241c290ac..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0001-Default-to-not-using-sandbox-when-cross-compiling.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 56194e9a6043873b0ec84f9d15c6e4caca2580c8 Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Tue, 8 Mar 2022 20:04:06 +1100
-Subject: [PATCH] Default to not using sandbox when cross compiling.
-
-On most systems poll(2) does not work when the number of FDs is reduced
-with setrlimit, so assume it doesn't when cross compiling and we can't
-run the test.  bz#3398.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patch/?id=8cf5275452a950869cb90eeac7d220b01f77b12e]
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 17fb1e6..a165d08 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3574,8 +3574,8 @@ AC_RUN_IFELSE(
- 	 select_works_with_rlimit=yes],
- 	[AC_MSG_RESULT([no])
- 	 select_works_with_rlimit=no],
--	[AC_MSG_WARN([cross compiling: assuming yes])
--	 select_works_with_rlimit=yes]
-+	[AC_MSG_WARN([cross compiling: assuming no])
-+	 select_works_with_rlimit=no]
- )
- 
- AC_CHECK_MEMBERS([struct pollfd.fd], [], [], [[
--- 
-2.35.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch b/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
deleted file mode 100644
index 847c0a143c..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/f107467179428a0e3ea9e4aa9738ac12ff02822d.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f107467179428a0e3ea9e4aa9738ac12ff02822d Mon Sep 17 00:00:00 2001
-From: Colin Watson <cjwatson@debian.org>
-Date: Thu, 24 Feb 2022 16:04:18 +0000
-Subject: [PATCH] Improve detection of -fzero-call-used-regs=all support
-
-GCC doesn't tell us whether this option is supported unless it runs into
-the situation where it would need to emit corresponding code.
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- m4/openssh.m4 | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/m4/openssh.m4 b/m4/openssh.m4
-index 4f9c3792dc1..8c33c701b8b 100644
---- a/m4/openssh.m4
-+++ b/m4/openssh.m4
-@@ -14,6 +14,8 @@ AC_DEFUN([OSSH_CHECK_CFLAG_COMPILE], [{
- 	AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <stdlib.h>
- #include <stdio.h>
-+/* Trivial function to help test for -fzero-call-used-regs */
-+void f(int n) {}
- int main(int argc, char **argv) {
- 	(void)argv;
- 	/* Some math to catch -ftrapv problems in the toolchain */
-@@ -21,6 +23,7 @@ int main(int argc, char **argv) {
- 	float l = i * 2.1;
- 	double m = l / 0.5;
- 	long long int n = argc * 12345LL, o = 12345LL * (long long int)argc;
-+	f(0);
- 	printf("%d %d %d %f %f %lld %lld\n", i, j, k, l, m, n, o);
- 	/*
- 	 * Test fallthrough behaviour.  clang 10's -Wimplicit-fallthrough does
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_8.9p1.bb
rename to meta/recipes-connectivity/openssh/openssh_9.0p1.bb
index f306b1245a..975faed547 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.0p1.bb
@@ -24,10 +24,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
-           file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch \
            "
-SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
+SRC_URI[sha256sum] = "03974302161e9ecce32153cfa10012f1e65c8f3750f573a73ab1befd5972a28a"
 
 # This CVE is specific to OpenSSH with the pam opie which we don't build/use here
 CVE_CHECK_IGNORE += "CVE-2007-2768"
-- 
2.27.0


--===============4992760884998073543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssh: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh: SRC_URI changed from "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.9p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch file://0001-Default-to-not-using-sandbox-when-cross-compiling.patch" to "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-9.0p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch"
packages/core2-32-poky-linux/openssh/openssh-dbg: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 17416200 to 17453112 (+0%)
packages/core2-32-poky-linux/openssh/openssh-dev: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-dev: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-doc: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PKGSIZE changed from 320148 to 320371 (+0%)
packages/core2-32-poky-linux/openssh/openssh-keygen: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 636408 to 640504 (+1%)
packages/core2-32-poky-linux/openssh/openssh-locale: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-locale: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-misc: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-misc: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 6210145 to 6214504 (+0%)
packages/core2-32-poky-linux/openssh/openssh-scp: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-scp: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-scp: PKGSIZE changed from 267892 to 276084 (+3%)
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 194024 to 198120 (+2%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 271952 to 276048 (+2%)
packages/core2-32-poky-linux/openssh/openssh-src: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-src: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: PKGSIZE changed from 3525042 to 3533919 (+0%)
packages/core2-32-poky-linux/openssh/openssh-ssh: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sshd: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1711253 to 1715349 (+0%)
packages/core2-32-poky-linux/openssh/openssh-staticdev: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh-staticdev: PKGV changed from 8.9p1 [default] to 9.0p1 [default]
packages/core2-32-poky-linux/openssh/openssh: PV changed from "8.9p1" to "9.0p1"
packages/core2-32-poky-linux/openssh/openssh: PKGV changed from 8.9p1 [default] to 9.0p1 [default]

--===============4992760884998073543==--

