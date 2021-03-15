Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.321.1615826520519466527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id D9B3C38C11C3
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:41:59 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 8.5p1 SUCCEEDED
Message-ID: <MADEUP.166C91A8D5F7E4B5.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149472
Content-Type: multipart/mixed; boundary="===============2944769785561497566=="

--===============2944769785561497566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *8.5p1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-openssh-upgrade-8.4p1-8.5p1.patch
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

--===============2944769785561497566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/openssh: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh: SRC_URI changed from "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.4p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch file://0f90440ca70abab947acbd77795e9f130967956c.patch" to "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-8.5p1.tar.gz file://sshd_config file://ssh_config file://init file://sshd file://sshd.socket file://sshd@.service file://sshdgenkeys.service file://volatiles.99_sshd file://run-ptest file://fix-potential-signed-overflow-in-pointer-arithmatic.patch file://sshd_check_keys file://add-test-support-for-busybox.patch"
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 11148804 to 12308788 (+10%)
packages/core2-32-poky-linux/openssh/openssh-dbg: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-dev: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-dev: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-doc: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-doc: PKGSIZE changed from 303199 to 309834 (+2%)
packages/core2-32-poky-linux/openssh/openssh-doc: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-keygen: PKGSIZE changed from 542200 to 574968 (+6%)
packages/core2-32-poky-linux/openssh/openssh-keygen: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-locale: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-locale: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-misc: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-misc: PKGSIZE changed from 2608807 to 2733416 (+5%)
packages/core2-32-poky-linux/openssh/openssh-misc: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 817658 to 1183745 (+45%)
packages/core2-32-poky-linux/openssh/openssh-ptest: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-scp: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-scp: PKGSIZE changed from 128496 to 148976 (+16%)
packages/core2-32-poky-linux/openssh/openssh-scp: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 144872 to 161256 (+11%)
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 185936 to 218704 (+18%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-src: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-src: PKGSIZE changed from 3136471 to 3156096 (+1%)
packages/core2-32-poky-linux/openssh/openssh-src: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-ssh: PKGSIZE changed from 896256 to 982272 (+10%)
packages/core2-32-poky-linux/openssh/openssh-ssh: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-sshd: PKGSIZE changed from 1574648 to 1620423 (+3%)
packages/core2-32-poky-linux/openssh/openssh-sshd: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh-staticdev: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh-staticdev: PV changed from "8.4p1" to "8.5p1"
packages/core2-32-poky-linux/openssh/openssh: PKGV changed from 8.4p1 [default] to 8.5p1 [default]
packages/core2-32-poky-linux/openssh/openssh: PV changed from "8.4p1" to "8.5p1"

--===============2944769785561497566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/openssh/openssh-dbg: PKGSIZE changed from 11148804 to 12308788 (+10%)
packages/core2-32-poky-linux/openssh/openssh-ptest: PKGSIZE changed from 817658 to 1183745 (+45%)
packages/core2-32-poky-linux/openssh/openssh-scp: PKGSIZE changed from 128496 to 148976 (+16%)
packages/core2-32-poky-linux/openssh/openssh-sftp-server: PKGSIZE changed from 144872 to 161256 (+11%)
packages/core2-32-poky-linux/openssh/openssh-sftp: PKGSIZE changed from 185936 to 218704 (+18%)

--===============2944769785561497566==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-openssh-upgrade-8.4p1-8.5p1.patch"

From f0a140cb0e24ba9975069a02c9c249f8cd56ce65 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 03:29:52 +0000
Subject: [PATCH] openssh: upgrade 8.4p1 -> 8.5p1

---
 ...440ca70abab947acbd77795e9f130967956c.patch | 28 ------
 .../{openssh_8.4p1.bb => openssh_8.5p1.bb}    | 87 ++++++++++++++++++-
 2 files changed, 84 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
 rename meta/recipes-connectivity/openssh/{openssh_8.4p1.bb => openssh_8.5p1.bb} (60%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch b/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
deleted file mode 100644
index b88bc18f12..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/0f90440ca70abab947acbd77795e9f130967956c.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 0f90440ca70abab947acbd77795e9f130967956c Mon Sep 17 00:00:00 2001
-From: Darren Tucker <dtucker@dtucker.net>
-Date: Fri, 20 Nov 2020 13:37:54 +1100
-Subject: [PATCH] Add new pselect6_time64 syscall on ARM.
-
-This is apparently needed on armhfp/armv7hl.  bz#3232, patch from
-jjelen at redhat.com.
----
- sandbox-seccomp-filter.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-Upstream-Status: Backport
-[fixes issues on 32bit IA and probably other 32 bit platforms too with glibc 2.33]
-
-diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
-index e0768c063..5065ae7ef 100644
---- a/sandbox-seccomp-filter.c
-+++ b/sandbox-seccomp-filter.c
-@@ -267,6 +267,9 @@ static const struct sock_filter preauth_insns[] = {
- #ifdef __NR_pselect6
- 	SC_ALLOW(__NR_pselect6),
- #endif
-+#ifdef __NR_pselect6_time64
-+	SC_ALLOW(__NR_pselect6_time64),
-+#endif
- #ifdef __NR_read
- 	SC_ALLOW(__NR_read),
- #endif
diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
similarity index 60%
rename from meta/recipes-connectivity/openssh/openssh_8.4p1.bb
rename to meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index 128e2e318a..b49c2b4ee4 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -1,3 +1,85 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENCE
+# +++ LICENCE
+# @@ -314,6 +314,68 @@
+#  	* authorization.                                                           *
+#  	****************************************************************************/
+#  
+# +       The Blowfish cipher implementation is licensed by Niels Provis under
+# +       a 4-clause BSD license:
+# +
+# +         * Blowfish - a fast block cipher designed by Bruce Schneier
+# +         *
+# +         * Copyright 1997 Niels Provos <provos@physnet.uni-hamburg.de>
+# +         * All rights reserved.
+# +         *
+# +         * Redistribution and use in source and binary forms, with or without
+# +         * modification, are permitted provided that the following conditions
+# +         * are met:
+# +         * 1. Redistributions of source code must retain the above copyright
+# +         *    notice, this list of conditions and the following disclaimer.
+# +         * 2. Redistributions in binary form must reproduce the above copyright
+# +         *    notice, this list of conditions and the following disclaimer in the
+# +         *    documentation and/or other materials provided with the distribution.
+# +         * 3. All advertising materials mentioning features or use of this software
+# +         *    must display the following acknowledgement:
+# +         *      This product includes software developed by Niels Provos.
+# +         * 4. The name of the author may not be used to endorse or promote products
+# +         *    derived from this software without specific prior written permission.
+# +         *
+# +         * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
+# +         * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+# +         * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
+# +         * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
+# +         * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
+# +         * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+# +         * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+# +         * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+# +         * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
+# +         * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+# +
+# +       Some replacement code is licensed by the NetBSD foundation under a
+# +       2-clause BSD license:
+# +
+# +         * Copyright (c) 2001 The NetBSD Foundation, Inc.
+# +         * All rights reserved.
+# +         *
+# +         * This code is derived from software contributed to The NetBSD Foundation
+# +         * by Todd Vierling.
+# +         *
+# +         * Redistribution and use in source and binary forms, with or without
+# +         * modification, are permitted provided that the following conditions
+# +         * are met:
+# +         * 1. Redistributions of source code must retain the above copyright
+# +         *    notice, this list of conditions and the following disclaimer.
+# +         * 2. Redistributions in binary form must reproduce the above copyright
+# +         *    notice, this list of conditions and the following disclaimer in the
+# +         *    documentation and/or other materials provided with the distribution.
+# +         *
+# +         * THIS SOFTWARE IS PROVIDED BY THE NETBSD FOUNDATION, INC. AND CONTRIBUTORS
+# +         * ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
+# +         * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+# +         * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR CONTRIBUTORS
+# +         * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+# +         * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+# +         * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+# +         * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+# +         * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+# +         * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
+# +         * POSSIBILITY OF SUCH DAMAGE.
+#  
+#  ------
+#  $OpenBSD: LICENCE,v 1.20 2017/04/30 23:26:16 djm Exp $
+# 
+#
+
 SUMMARY = "A suite of security-related network utilities based on \
 the SSH protocol including the ssh client and sshd server"
 DESCRIPTION = "Secure rlogin/rsh/rcp/telnet replacement (OpenSSH) \
@@ -6,7 +88,7 @@ and for executing commands on a remote machine."
 HOMEPAGE = "http://www.openssh.com/"
 SECTION = "console/network"
 LICENSE = "BSD & ISC & MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=18d9e5a8b3dd1790d73502f50426d4d3"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=d9d2753bdef9f19466dc7bc959114b11"
 
 DEPENDS = "zlib openssl virtual/crypt"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -24,9 +106,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://0f90440ca70abab947acbd77795e9f130967956c.patch \
            "
-SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
+SRC_URI[sha256sum] = "f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25"
 
 # This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
-- 
2.17.1


--===============2944769785561497566==--
