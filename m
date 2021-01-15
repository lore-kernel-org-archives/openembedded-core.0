Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.719.1610713822595015624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 411DB38C13A2
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] net-tools: upgrading to 2.10 SUCCEEDED
Message-ID: <MADEUP.165A67B049206DF0.4055@lists.openembedded.org>
X-Groupsio-MsgNum: 146780
Content-Type: multipart/mixed; boundary="===============7355315886324015891=="

--===============7355315886324015891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *net-tools* to *2.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-net-tools-upgrade-1.60-20181103-2.10.patch
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

--===============7355315886324015891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/net-tools: PACKAGES: removed "net-tools-locale-et-ee", added "net-tools-locale-et"
packages/core2-32-poky-linux/net-tools/net-tools-dbg: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-dev: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-doc: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-cs: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-de: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-fr: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-pt-br: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-mii-tool: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-src: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-staticdev: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]

--===============7355315886324015891==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-net-tools-upgrade-1.60-20181103-2.10.patch"

From 158b0fbf63241a235a064fe3badaed3421f9c629 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 06:45:07 +0000
Subject: [PATCH] net-tools: upgrade 1.60-20181103 -> 2.10

---
 ...075-ifconfig.c-pointtopoint_spelling.patch | 26 -------------------
 .../Bug_541172-netstat.c-exit-codes.patch     | 22 ----------------
 .../net-tools/net-tools_1.60-20181103.bb      | 14 +++++-----
 3 files changed, 6 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
 delete mode 100644 meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch b/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
deleted file mode 100644
index 74d74668ce..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/Bug_443075-ifconfig.c-pointtopoint_spelling.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Description: Accept "pointtopoint" as a synonym for "pointopoint"
-Bug-Debian: https://bugs.debian.org/443075
-Author: Justin Pryzby <pryzbyj@libra>
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/ifconfig.c
-+++ b/ifconfig.c
-@@ -644,14 +644,14 @@
- 	    spp++;
- 	    continue;
- 	}
--	if (!strcmp(*spp, "-pointopoint")) {
-+	if (!strcmp(*spp, "-pointopoint") || !strcmp(*spp, "-pointtopoint")) {
- 	    goterr |= clr_flag(ifr.ifr_name, IFF_POINTOPOINT);
- 	    spp++;
- 	    if (test_flag(ifr.ifr_name, IFF_POINTOPOINT) > 0)
- 	    	fprintf(stderr, _("Warning: Interface %s still in POINTOPOINT mode.\n"), ifr.ifr_name);
- 	    continue;
- 	}
--	if (!strcmp(*spp, "pointopoint")) {
-+	if (!strcmp(*spp, "pointopoint") || !strcmp(*spp, "pointtopoint")) {
- 	    if (*(spp + 1) != NULL) {
- 		spp++;
- 		safe_strncpy(host, *spp, (sizeof host));
diff --git a/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch b/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
deleted file mode 100644
index 782b94bc61..0000000000
--- a/meta/recipes-extended/net-tools/net-tools/Bug_541172-netstat.c-exit-codes.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Description: Bug#541172: netstat.c exit codes
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
---- a/netstat.c
-+++ b/netstat.c
-@@ -2237,12 +2237,14 @@
-             parsesnmp(flag_raw, flag_tcp, flag_udp, flag_sctp);
- #else
-             ENOSUPP("netstat", "AF INET");
-+            exit(1);
- #endif
-         } else if(!strcmp(afname, "inet6")) {
- #if HAVE_AFINET6
-             parsesnmp6(flag_raw, flag_tcp, flag_udp);
- #else
-             ENOSUPP("netstat", "AF INET6");
-+            exit(1);
- #endif
-         } else {
-           printf(_("netstat: No statistics support for specified address family: %s\n"), afname);
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
index e163a6948a..3b00945eca 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-20181103.bb
@@ -6,15 +6,13 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ifconfig.c;beginline=11;endline=15;md5=d1ca372080ad5401e23ca0afc35cf9ba"
 
-PV = "1.60-20181103+git${SRCPV}"
-SRCREV = "0eebece8c964e3cfa8a018f42b2e7e751a7009a0"
+PV = "2.10"
+SRCREV = "80d7b95067f1f22fece9537dea6dff53081f4886"
 SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https \
-    file://net-tools-config.h \
-    file://net-tools-config.make \
-    file://Add_missing_headers.patch \
-    file://Bug_443075-ifconfig.c-pointtopoint_spelling.patch \
-    file://Bug_541172-netstat.c-exit-codes.patch \
-"
+           file://net-tools-config.h \
+           file://net-tools-config.make \
+           file://Add_missing_headers.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============7355315886324015891==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/net-tools: SRC_URI changed from "git://git.code.sf.net/p/net-tools/code;protocol=https file://net-tools-config.h file://net-tools-config.make file://Add_missing_headers.patch file://Bug_443075-ifconfig.c-pointtopoint_spelling.patch file://Bug_541172-netstat.c-exit-codes.patch" to "git://git.code.sf.net/p/net-tools/code;protocol=https file://net-tools-config.h file://net-tools-config.make file://Add_missing_headers.patch"
packages/core2-32-poky-linux/net-tools: PKGV changed from 1.60-20181103+gitAUTOINC+0eebece8c9 [default] to 2.10 [default]
packages/core2-32-poky-linux/net-tools: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools: PACKAGES: removed "net-tools-locale-et-ee", added "net-tools-locale-et"
packages/core2-32-poky-linux/net-tools/net-tools-dbg: PKGSIZE changed from 1163104 to 1162524 (-0%)
packages/core2-32-poky-linux/net-tools/net-tools-dbg: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-dbg: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-dev: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-dev: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-doc: PKGSIZE changed from 184729 to 187879 (+2%)
packages/core2-32-poky-linux/net-tools/net-tools-doc: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-doc: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-locale-cs: PKGSIZE changed from 62601 to 62849 (+0%)
packages/core2-32-poky-linux/net-tools/net-tools-locale-cs: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-cs: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-locale-de: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-de: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-locale-fr: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-fr: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-locale-pt-br: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-locale-pt-br: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-mii-tool: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-mii-tool: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-src: PKGSIZE changed from 404834 to 406270 (+0%)
packages/core2-32-poky-linux/net-tools/net-tools-src: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-src: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools-staticdev: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools-staticdev: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"
packages/core2-32-poky-linux/net-tools/net-tools: PKGSIZE changed from 467928 to 463800 (-1%)
packages/core2-32-poky-linux/net-tools/net-tools: PKGV changed from 1.60-20181103+git0+0eebece8c9 to 2.10 [default]
packages/core2-32-poky-linux/net-tools/net-tools: PV changed from "1.60-20181103+gitAUTOINC+0eebece8c9" to "2.10"

--===============7355315886324015891==--
