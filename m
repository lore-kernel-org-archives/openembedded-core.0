Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D65C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 09:21:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8298.1700212881865425119
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 01:21:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c+Me7uin;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9685b4a3c4=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AH5ookI002402
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 01:21:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Uh5VX
	koh5QvxMDomjm1LG9HXvfH0Qu6qLcoFl0aAZZA=; b=c+Me7uin1RnlchXV09v+6
	bfJRHV2lxcADSNDnig8UF2Q64cAbHczBDlaPvBZyGPdtRBMpj4P3DID1DsfbF82Z
	fw57q/JHoG9svU3rmoVP//3GPGN1dMeg/Unnr382aXABfqD/Di5Socm2wIhYV94M
	0TmP7bwg1R299nn1+0o5pwzw435m0xWi1DkMnvoChl+nRgeAtpwr6/qHE/Xxwccd
	R3avD+xB8ea0D3S13yC6XvSyYvjoZfNNfzYcIyCnLKYbDz3vbk8xIy2fhJVbfR8x
	RY/tz+Onxab0hAtnWDbc+rWt/lcXPtCYz4dfkzGMl0Osondm07Z/LsnQAMq2udHH
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3udycrg8nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 01:21:20 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 01:21:24 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] sudo: upgrade 1.9.13p3 -> 1.9.15p2
Date: Fri, 17 Nov 2023 09:21:03 +0000
Message-ID: <20231117092103.1694912-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: HnirUIg57w424xenRx44BRJyISfJ8PjJ
X-Proofpoint-GUID: HnirUIg57w424xenRx44BRJyISfJ8PjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311170068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 09:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190833

From: Soumya Sambu <soumya.sambu@windriver.com>

License-update: file removed upstream

Drop patch as issue fixed upstream.

Changelog:
===========
1.9.15p2
 * Fixed a bug on BSD systems where sudo would not restore the
   terminal settings on exit if the terminal had parity enabled.
   GitHub issue #326.

1.9.15p1
 * Fixed a bug introduced in sudo 1.9.15 that prevented LDAP-based
   sudoers from being able to read the ldap.conf file.
   GitHub issue #325.

1.9.15
 * Fixed an undefined symbol problem on older versions of macOS
   when "intercept" or "log_subcmds" are enabled in sudoers.
   GitHub issue #276.
 * Fixed "make check" failure related to getpwent(3) wrapping
   on NetBSD.
 * Fixed the warning message for "sudo -l command" when the command
   is not permitted.  There was a missing space between "list" and
   the actual command due to changes in sudo 1.9.14.
 * Fixed a bug where output could go to the wrong terminal if
   "use_pty" is enabled (the default) and the standard input, output
   or error is redirected to a different terminal.  Bug #1056.
 * The visudo utility will no longer create an empty file when the
   specified sudoers file does not exist and the user exits the
   editor without making any changes.  GitHub issue #294.
 * The AIX and Solaris sudo packages on www.sudo.ws now support
   "log_subcmds" and "intercept" with both 32-bit and 64-bit
   binaries.  Previously, they only worked when running binaries
   with the same word size as the sudo binary.  GitHub issue #289.
 * The sudoers source is now logged in the JSON event log.  This
   makes it possible to tell which rule resulted in a match.
 * Running "sudo -ll command" now produces verbose output that
   includes matching rule as well as the path to the sudoers file
   the matching rule came from.  For LDAP sudoers, the name of the
   matching sudoRole is printed instead.
 * The embedded copy of zlib has been updated to version 1.3.
 * The sudoers plugin has been modified to make it more resilient
   to ROWHAMMER attacks on authentication and policy matching.
   This addresses CVE-2023-42465.
 * The sudoers plugin now constructs the user time stamp file path
   name using the user-ID instead of the user name.  This avoids a
   potential problem with user names that contain a path separator
   ('/') being interpreted as part of the path name.  A similar
   issue in sudo-rs has been assigned CVE-2023-42456.
 * A path separator ('/') in a user, group or host name is now
   replaced with an underbar character ('_') when expanding escapes
   in @include and @includedir directives as well as the "iolog_file"
   and "iolog_dir" sudoers Default settings.
 * The "intercept_verify" sudoers option is now only applied when
   the "intercept" option is set in sudoers.  Previously, it was
   also applied when "log_subcmds" was enabled.  Sudo 1.9.14
   contained an incorrect fix for this.  Bug #1058.
 * Changes to terminal settings are now performed atomically, where
   possible.  If the command is being run in a pseudo-terminal and
   the user's terminal is already in raw mode, sudo will not change
   the user's terminal settings.  This prevents concurrent sudo
   processes from restoring the terminal settings to the wrong values.
   GitHub issue #312.
 * Reverted a change from sudo 1.9.4 that resulted in PAM session
   modules being called with the environment of the command to be
   run instead of the environment of the invoking user.
   GitHub issue #318.
 * New Indonesian translation from translationproject.org.
 * The sudo_logsrvd server will now raise its open file descriptor
   limit to the maximum allowed value when it starts up.  Each
   connection can require up to nine open file descriptors so the
   default soft limit may be too low.
 * Better log message when rejecting a command if the "intercept"
   option is enabled and the "intercept_allow_setid" option is
   disabled.  Previously, "command not allowed" would be logged and
   the user had no way of knowing what the actual problem was.
 * Sudo will now log the invoking user's environment as "submitenv"
   in the JSON logs.  The command's environment ("runenv") is no
   longer logged for commands rejected by the sudoers file or an
   approval plugin.

1.9.14p3
 * Fixed a crash with Python 3.12 when the sudo Python plugin is
   unloaded.  This only affects "make check" for the Python plugin.
 * Adapted the sudo Python plugin test output to match Python 3.12.

1.9.14p2
 * Fixed a crash on Linux systems introduced in version 1.9.14 when
   running a command with a NULL argv[0] if "log_subcmds" or
   "intercept" is enabled in sudoers.
 * Fixed a problem with "stair-stepped" output when piping or
   redirecting the output of a sudo command that takes user input.
 * Fixed a bug introduced in sudo 1.9.14 that affects matching
   sudoers rules containing a Runas_Spec with an empty Runas user.
   These rules should only match when sudo's -g option is used but
   were matching even without the -g option.  GitHub issue #290.

1.9.14p1
 * Fixed an invalid free bug in sudo_logsrvd that was introduced
   in version 1.9.14 which could cause sudo_logsrvd to crash.
 * The sudoers plugin no longer tries to send the terminal name
   to the log server when no terminal is present.  This bug was
   introduced in version 1.9.14.

1.9.14
 * Fixed a bug where if the "intercept" or "log_subcmds" sudoers
   option was enabled and a sub-command was run where the first
   entry of the argument vector didn't match the command being run.
   This resulted in commands like "sudo su -" being killed due to
   the mismatch.  Bug #1050.
 * The sudoers plugin now canonicalizes command path names before
   matching (where possible).  This fixes a bug where sudo could
   execute the wrong path if there are multiple symbolic links with
   the same target and the same base name in sudoers that a user is
   allowed to run.  GitHub issue #228.
 * Improved command matching when a chroot is specified in sudoers.
   The sudoers plugin will now change the root directory id needed
   before performing command matching.  Previously, the root directory
   was simply prepended to the path that was being processed.
 * When NETGROUP_BASE is set in the ldap.conf file, sudo will now
   perform its own netgroup lookups of the host name instead of
   using the system innetgr(3) function.  This guarantees that user
   and host netgroup lookups are performed using  the same LDAP
   server (or servers).
 * Fixed a bug introduced in sudo 1.9.13 that resulted in a missing
   " ; " separator between environment variables and the command
   in log entries.
 * The visudo utility now displays a warning when it ignores a file
   in an include dir such as /etc/sudoers.d.
 * When running a command in a pseudo-terminal, sudo will initialize
   the terminal settings even if it is the background process.
   Previously, sudo only initialized the pseudo-terminal when running
   in the foreground.  This fixes an issue where a program that
   checks the window size would read the wrong value when sudo was
   running in the background.
 * Fixed a bug where only the first two digits of the TSID field
   being was logged.  Bug #1046.
 * The "use_pty" sudoers option is now enabled by default.  To
   restore the historic behavior where a command is run in the
   user's terminal, add "Defaults !use_pty" to the sudoers file.
   GitHub issue #258.
 * Sudo's "-b" option now works when the command is run in a
   pseudo-terminal.
 * When disabling core dumps, sudo now only modifies the soft limit
   and leaves the hard limit as-is.  This avoids problems on Linux
   when sudo does not have CAP_SYS_RESOURCE, which may be the case
   when run inside a container.  GitHub issue #42.
 * Sudo configuration file paths have been converted to colon-separated
   lists of paths.  This makes it possible to have configuration
   files on a read-only file system while still allowing for local
   modifications in a different (writable) directory.  The new
   --enable-adminconf configure option can be used to specify a
   directory that is searched for configuration files in preference
   to the sysconfdir (which is usually /etc).
 * The NETGROUP_QUERY ldap.conf parameter can now be disabled for
   LDAP servers that do not support querying the nisNetgroup object
   by its nisNetgroupTriple attribute, while still allowing sudo to
   query the LDAP server directly to determine netgroup membership.
 * Fixed a long-standing bug where a sudoers rule without an explicit
   runas list allowed the user to run a command as root and any
   group instead of just one of the groups that root is a member
   of.  For example, a rule such as "myuser ALL = ALL" would permit
   "sudo -u root -g othergroup" even if root did not belong to
   "othergroup".
 * Fixed a bug where a sudoers rule with an explicit runas list
   allowed a user to run sudo commands as themselves.  For example,
   a rule such as "myuser ALL = (root) ALL", "myuser" should only
   allow commands to be run as root (optionally using one of root's
   groups).  However, the rule also allowed the user to run
   "sudo -u myuser -g myuser command".
 * Fixed a bug that prevented the user from specifying a group on
   the command line via "sudo -g" if the rule's Runas_Spec contained
   a Runas_Alias.
 * Sudo now requires a C compiler that conforms to ISO C99 or higher
   to build.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...me.c-correctly-include-header-for-ou.patch | 25 -------------------
 meta/recipes-extended/sudo/sudo.inc           |  5 ++--
 .../{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb}    |  3 +--
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb} (92%)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
deleted file mode 100644
index f63ed553be..0000000000
--- a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From f993c5c88faacc43971899aae2168ffb3e34dc80 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 24 Sep 2021 13:36:24 +0200
-Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
- tree builds
-
-Upstream-Status: Submitted [https://github.com/sudo-project/sudo/pull/123]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- lib/util/mksigname.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/util/mksigname.c b/lib/util/mksigname.c
-index de8b1ad..0a69e7e 100644
---- a/lib/util/mksigname.c
-+++ b/lib/util/mksigname.c
-@@ -36,7 +36,7 @@ main(int argc, char *argv[])
- {
-     unsigned int i;
- 
--#include "mksigname.h"
-+#include "lib/util/mksigname.h"
- 
-     printf("const char *const sudo_sys_signame[] = {\n");
-     for (i = 0; i < nitems(sudo_sys_signame); i++) {
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index f22b3eab99..d3b6bf1ad8 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -8,7 +8,6 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
-                    file://lib/util/getcwd.c;beginline=2;endline=27;md5=50f8d9667750e18dea4e84a935c12009 \
                     file://lib/util/glob.c;beginline=2;endline=31;md5=2852f68687544e3eb8a0a61665506f0e \
                     file://lib/util/snprintf.c;beginline=3;endline=33;md5=b70df6179969e38fcf68da91b53b8029 \
                     file://include/sudo_queue.h;beginline=2;endline=27;md5=ad578e9664d17a010b63e4bc0576ee8d \
@@ -29,12 +28,12 @@ EXTRA_OECONF = "--with-editor=${base_bindir}/vi --with-env-editor"
 EXTRA_OECONF:append:libc-musl = " --disable-hardening "
 
 do_compile:prepend () {
-       # Remove build host references from sudo_usage.h
+       # Remove build host references from config.h
        sed -i  \
            -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
            -e 's,--build=${BUILD_SYS},,g' \
            -e 's,--host=${HOST_SYS},,g' \
-           ${B}/src/sudo_usage.h
+	   ${B}/config.h
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
diff --git a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.9.13p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index 2e11739470..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -3,12 +3,11 @@ require sudo.inc
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-sudo.conf.in-fix-conflict-with-multilib.patch \
-           file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.40.0


