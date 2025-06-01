Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F042CC71136
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:33 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27762.1748786121366811216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jgyIckXV;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=iZ+dwywR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6a235-5f1290a3-4e22-4bfb-8a9a-211b5fb8c3ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rkJgNigwF2k8JXIiK90SdFMeK5KPAnx7x9falA3HoGA=;
	b=jgyIckXVe2Jlp0QMERfGaAdNmr2tOcFRmXO36bPTyMzS7YI4VBs00PROexuYZF2e
	VBEz0pcmXnYBIce12UtB1GRZuEmO9cvOCU1fQ6sdLSGWyguhIoucnceL4E84HS/4hr7
	xj7IIYuAsOsMA59k1E2xrDQLRuCtJWgocOnIaJYo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786127;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rkJgNigwF2k8JXIiK90SdFMeK5KPAnx7x9falA3HoGA=;
	b=iZ+dwywREPjq/xTv4cYdoT4QLrwzbAVEiqXT2JtRyfHbh/CgRTWNSlFL4pACV9rC
	8V/QWHT80VczgsPUL21+ST4OMUXksL75pJmWVG72oBYVsk6BaaPNiE4AYs2+HbjJvwB
	0tEFlXNpujIRkB3tDAKZNxlfSSR5ekHJ9nMhy52k=
Content-Type: multipart/mixed; boundary="===============7397623195300772748=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.8.3 SUCCEEDED
Message-ID: <010101972bc6a235-5f1290a3-4e22-4bfb-8a9a-211b5fb8c3ae-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217575

--===============7397623195300772748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *nfs-utils* to *2.8.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.8.2-2.8.3.patch
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
From e84ce55fb95fc10410a0b184066b46f91ebcf211 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 08:06:54 +0000
Subject: [PATCH] nfs-utils: upgrade 2.8.2 -> 2.8.3

---
 ...0001-Fix-typecast-warning-with-clang.patch | 32 ---------------
 ...t-Makefile.am-Do-not-use-build-flags.patch |  7 +---
 ...mon.c-fix-a-formatting-error-with-cl.patch | 40 -------------------
 .../0004-Use-nogroup-for-nobody-group.patch   |  6 +--
 .../0005-find-OE-provided-Kerberos.patch      |  4 +-
 ...{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} |  4 +-
 6 files changed, 8 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
deleted file mode 100644
index f493a3051e..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0a64c5ad17786796d84390e480a38b4f762229ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Dec 2024 19:20:39 -0800
-Subject: [PATCH v2] Fix typecast warning with clang
-
-Fixes
-file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173463533411103&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Benjamin Coddington <bcodding@redhat.com>
-Cc: Steve Dickson <steved@redhat.com>
----
-v2: Make base as const char pointer insread of trying type punning
-
- support/nsm/file.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nsm/file.c b/support/nsm/file.c
-index de122b0f..68f99bf0 100644
---- a/support/nsm/file.c
-+++ b/support/nsm/file.c
-@@ -184,7 +184,8 @@ static char *
- nsm_make_temp_pathname(const char *pathname)
- {
- 	size_t size;
--	char *path, *base;
-+	char *path;
-+	const char *base;
- 	int len;
- 
- 	size = strlen(pathname) + sizeof(".new") + 1;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
index 351407ddcd..a595a47daa 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-locktest-Makefile.am-Do-not-use-build-flags.patch
@@ -1,4 +1,4 @@
-From 9efa7a0d37665d9bb0f46d2407883a5ab42c2b84 Mon Sep 17 00:00:00 2001
+From f9ecf01d0b16cabed20d3f91f239fd708e18b790 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 24 Jul 2023 20:39:16 -0700
 Subject: [PATCH] locktest: Makefile.am: Do not use build flags
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index e8914655..2fd36971 100644
+index e891465..2fd3697 100644
 --- a/tools/locktest/Makefile.am
 +++ b/tools/locktest/Makefile.am
 @@ -2,8 +2,5 @@
@@ -31,6 +31,3 @@ index e8914655..2fd36971 100644
 -testlk_LDFLAGS=$(LDFLAGS_FOR_BUILD)
  
  MAINTAINERCLEANFILES = Makefile.in
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
deleted file mode 100644
index a99ba284e0..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cc59a7fe15b6ca2ee43cba0dc1d699323b36ffcc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 21 Mar 2025 10:42:56 +0100
-Subject: [PATCH] support/nfs/xcommon.c: fix a formatting error with clang
-
-Specifically, this happens:
-
-| xcommon.c:101:24: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|   101 |      vfprintf (stderr, fmt2, args);
-|       |                        ^~~~
-
-A similar approach (print \n seprately) is already used elsewhere in
-the same file.
-
-Upstream-Status: Submitted [via email to steved@redhat.com,linux-nfs@vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- support/nfs/xcommon.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0b..1d04dd1 100644
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -94,13 +94,11 @@ xstrconcat4 (const char *s, const char *t, const char *u, const char *v) {
- void
- nfs_error (const char *fmt, ...) {
-      va_list args;
--     char *fmt2;
- 
--     fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
--     vfprintf (stderr, fmt2, args);
-+     vfprintf (stderr, fmt, args);
-+     fprintf (stderr, "\n");
-      va_end (args);
--     free (fmt2);
- }
- 
- /* Make a canonical pathname from PATH.  Returns a freshly malloced string.
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
index bbf44d5977..5680cef248 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0004-Use-nogroup-for-nobody-group.patch
@@ -1,4 +1,4 @@
-From 001913c5eb0aad933a93ee966252905cd46d776b Mon Sep 17 00:00:00 2001
+From e264a410405253ebfa20cbefb6982077e1ede1f3 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Tue, 6 Jun 2023 16:07:53 -0600
 Subject: [PATCH] Use "nogroup" for nobody group
@@ -11,7 +11,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/support/nfsidmap/idmapd.conf b/support/nfsidmap/idmapd.conf
-index 2a2f79a1..e6f3724f 100644
+index 2a2f79a..e6f3724 100644
 --- a/support/nfsidmap/idmapd.conf
 +++ b/support/nfsidmap/idmapd.conf
 @@ -41,7 +41,7 @@
@@ -24,7 +24,7 @@ index 2a2f79a1..e6f3724f 100644
  [Translation]
  
 diff --git a/utils/idmapd/idmapd.c b/utils/idmapd/idmapd.c
-index cd9a965f..3be805e9 100644
+index 5231f56..e1aa8a5 100644
 --- a/utils/idmapd/idmapd.c
 +++ b/utils/idmapd/idmapd.c
 @@ -89,7 +89,7 @@
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
index 3241e8e859..dd9429404a 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0005-find-OE-provided-Kerberos.patch
@@ -1,4 +1,4 @@
-From a2af266f013722a64c5d04e0fe097cd711393a53 Mon Sep 17 00:00:00 2001
+From 86c2a487d0c8e8b7ba8c88e708065296055fc731 Mon Sep 17 00:00:00 2001
 From: Daniel McGregor <daniel.mcgregor@vecima.com>
 Date: Wed, 8 Nov 2023 16:24:20 -0600
 Subject: [PATCH] find OE provided Kerberos
@@ -10,7 +10,7 @@ Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
-index f96f0fd4..ad85fdf2 100644
+index f96f0fd..ad85fdf 100644
 --- a/aclocal/kerberos5.m4
 +++ b/aclocal/kerberos5.m4
 @@ -22,8 +22,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
index 1f3afa0560..9668ac0e86 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
@@ -22,13 +22,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfsserver \
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-           file://0001-Fix-typecast-warning-with-clang.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch \
            "
 
-SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
+SRC_URI[sha256sum] = "11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.47.1


--===============7397623195300772748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.2/nfs-utils-2.8.2.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0001-Fix-typecast-warning-with-clang.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch" to "https://cdn.kernel.org/pub/linux/utils/nfs-utils/2.8.3/nfs-utils-2.8.3.tar.xz file://nfsserver file://nfscommon file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch file://0004-Use-nogroup-for-nobody-group.patch file://0005-find-OE-provided-Kerberos.patch"
packages/core2-64-poky-linux/nfs-utils: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-client: PKGSIZE changed from 365981 to 365917 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dbg: PKGSIZE changed from 3286352 to 3268152 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-dev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-doc: PKGSIZE changed from 202021 to 202496 (+0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-locale: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-mount: PKGSIZE changed from 146315 to 146307 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: FILELIST: directory renamed /usr/src/debug/nfs-utils/2.8.2/systemd -> /usr/src/debug/nfs-utils/2.8.3/systemd, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mountd -> /usr/src/debug/nfs-utils/2.8.3/utils/mountd, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/rpcdebug -> /usr/src/debug/nfs-utils/2.8.3/tools/rpcdebug, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/include/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/include/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsstat -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsstat, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsd -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsd, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nfs -> /usr/src/debug/nfs-utils/2.8.3/support/nfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/statd -> /usr/src/debug/nfs-utils/2.8.3/utils/statd, directory renamed /usr/src/debug/nfs-utils/2.8.2/sup
 port/reexport -> /usr/src/debug/nfs-utils/2.8.3/support/reexport, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/nsm -> /usr/src/debug/nfs-utils/2.8.3/support/nsm, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsrahead -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsrahead, directory renamed /usr/src/debug/nfs-utils/2.8.2/tools/nfsconf -> /usr/src/debug/nfs-utils/2.8.3/tools/nfsconf, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/exportfs -> /usr/src/debug/nfs-utils/2.8.3/utils/exportfs, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/showmount -> /usr/src/debug/nfs-utils/2.8.3/utils/showmount, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/mount -> /usr/src/debug/nfs-utils/2.8.3/utils/mount, directory renamed /usr/src/debug/nfs-utils/2.8.2/utils/nfsref -> /usr/src/debug/nfs-utils/2.8.3/utils/nfsref, directory renamed /usr/src/debug/nfs-utils/2.8.2/support/junction -> /usr/src/debug/nfs-utils/2.8.3/support/junction, directory renamed /usr/src/de
 bug/nfs-utils/2.8.2/support/export -> /usr/src/debug/nfs-utils/2.8.3/support/export, removed "/usr/src/debug/nfs-utils/2.8.2/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.2/support/misc/file.c /usr/src/debug/nfs-utils/2.8.2/support/include/xio.h /usr/src/debug/nfs-utils/2.8.2/support/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.2/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.2/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.2/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.2/support/include/misc.h /usr/src/debug/nfs-utils/2.8.2/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.2/support/include/junction.h /usr/src/debug/nfs-utils/2.8.2/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.2/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.2/support/include/sm_inter.h /usr/src/debug/nfs-utils/2.8.2/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.2/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.2/support/include/pseudoflavors.h /
 usr/src/debug/nfs-utils/2.8.2/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.2/support/include/xstat.h /usr/src/debug/nfs-utils/2.8.2/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.2/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.2/support/misc/xstat.c /usr/src/debug/nfs-utils/2.8.2/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.2/support/include/nfsd_path.h /usr/src/debug/nfs-utils/2.8.2/support/include/mount.h /usr/src/debug/nfs-utils/2.8.2/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.2/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.2/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.2/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.2/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.2/support/include/version.h", added "/usr/src/debug/nfs-utils/2.8.3/support/misc/workqueue.c /usr/src/debug/nfs-utils/2.8.3/support/misc/file.c /usr/src/debug/nfs-utils/2.8.3/support/include/xio.h /usr/src/debug/nfs-utils/2.8.3/suppo
 rt/misc/nfsd_path.c /usr/src/debug/nfs-utils/2.8.3/support/include/fsloc.h /usr/src/debug/nfs-utils/2.8.3/support/include/workqueue.h /usr/src/debug/nfs-utils/2.8.3/support/include/rpcmisc.h /usr/src/debug/nfs-utils/2.8.3/support/include/misc.h /usr/src/debug/nfs-utils/2.8.3/support/include/nfsrpc.h /usr/src/debug/nfs-utils/2.8.3/support/include/junction.h /usr/src/debug/nfs-utils/2.8.3/support/include/v4root.h /usr/src/debug/nfs-utils/2.8.3/support/include/xlog.h /usr/src/debug/nfs-utils/2.8.3/support/include/sm_inter.h /usr/src/debug/nfs-utils/2.8.3/support/include/conffile.h /usr/src/debug/nfs-utils/2.8.3/support/include/sockaddr.h /usr/src/debug/nfs-utils/2.8.3/support/include/pseudoflavors.h /usr/src/debug/nfs-utils/2.8.3/support/include/tcpwrapper.h /usr/src/debug/nfs-utils/2.8.3/support/misc/from_local.c /usr/src/debug/nfs-utils/2.8.3/support/include/xcommon.h /usr/src/debug/nfs-utils/2.8.3/support/include/exportfs.h /usr/src/debug/nfs-utils/2.8.3/support/include/nfsd_path.h 
 /usr/src/debug/nfs-utils/2.8.3/support/include/mount.h /usr/src/debug/nfs-utils/2.8.3/support/include/nsm.h /usr/src/debug/nfs-utils/2.8.3/support/misc/mountpoint.c /usr/src/debug/nfs-utils/2.8.3/support/misc/tcpwrapper.c /usr/src/debug/nfs-utils/2.8.3/support/include/nfslib.h /usr/src/debug/nfs-utils/2.8.3/support/include/ha-callout.h /usr/src/debug/nfs-utils/2.8.3/support/include/version.h"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-src: PKGSIZE changed from 985806 to 982576 (-0%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-staticdev: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils-stats: PKGSIZE changed from 77810 to 77040 (-1%)
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PV changed from "2.8.2" to "2.8.3"
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGV changed from 2.8.2 [default] to 2.8.3 [default]
packages/core2-64-poky-linux/nfs-utils/nfs-utils: PKGSIZE changed from 601472 to 601491 (+0%)

--===============7397623195300772748==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.8.2-2.8.3.patch"

RnJvbSBlODRjZTU1ZmI5NWZjMTA0MTBhMGIxODQwNjZiNDZmOTFlYmNmMjExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwODowNjo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5m
cy11dGlsczogdXBncmFkZSAyLjguMiAtPiAyLjguMwoKLS0tCiAuLi4wMDAxLUZpeC10eXBlY2Fz
dC13YXJuaW5nLXdpdGgtY2xhbmcucGF0Y2ggfCAzMiAtLS0tLS0tLS0tLS0tLS0KIC4uLnQtTWFr
ZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1mbGFncy5wYXRjaCB8ICA3ICstLS0KIC4uLm1vbi5j
LWZpeC1hLWZvcm1hdHRpbmctZXJyb3Itd2l0aC1jbC5wYXRjaCB8IDQwIC0tLS0tLS0tLS0tLS0t
LS0tLS0KIC4uLi8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2ggICB8ICA2
ICstLQogLi4uLzAwMDUtZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaCAgICAgIHwgIDQg
Ky0KIC4uLntuZnMtdXRpbHNfMi44LjIuYmIgPT4gbmZzLXV0aWxzXzIuOC4zLmJifSB8ICA0ICst
CiA2IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgODUgZGVsZXRpb25zKC0pCiBkZWxl
dGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0
aWxzLzAwMDEtRml4LXR5cGVjYXN0LXdhcm5pbmctd2l0aC1jbGFuZy5wYXRjaAogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8w
MDAzLXN1cHBvcnQtbmZzLXhjb21tb24uYy1maXgtYS1mb3JtYXR0aW5nLWVycm9yLXdpdGgtY2wu
cGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy97bmZzLXV0
aWxzXzIuOC4yLmJiID0+IG5mcy11dGlsc18yLjguMy5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1GaXgtdHlw
ZWNhc3Qtd2FybmluZy13aXRoLWNsYW5nLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDEtRml4LXR5cGVjYXN0LXdhcm5pbmctd2l0aC1jbGFu
Zy5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZjQ5M2EzMDUxZS4uMDAwMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMv
MDAwMS1GaXgtdHlwZWNhc3Qtd2FybmluZy13aXRoLWNsYW5nLnBhdGNoCisrKyAvZGV2L251bGwK
QEAgLTEsMzIgKzAsMCBAQAotRnJvbSAwYTY0YzVhZDE3Nzg2Nzk2ZDg0MzkwZTQ4MGEzOGI0Zjc2
MjIyOWFlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KLURhdGU6IFdlZCwgMTggRGVjIDIwMjQgMTk6MjA6MzkgLTA4MDAKLVN1Ympl
Y3Q6IFtQQVRDSCB2Ml0gRml4IHR5cGVjYXN0IHdhcm5pbmcgd2l0aCBjbGFuZwotCi1GaXhlcwot
ZmlsZS5jOjIwMDo4OiBlcnJvcjogYXNzaWduaW5nIHRvICdjaGFyIConIGZyb20gJ2NvbnN0IGNo
YXIgKicgZGlzY2FyZHMgcXVhbGlmaWVycyBbLVdlcnJvciwtV2luY29tcGF0aWJsZS1wb2ludGVy
LXR5cGVzLWRpc2NhcmRzLXF1YWxpZmllcnNdCi0KLVVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVk
IFtodHRwczovL21hcmMuaW5mby8/bD1saW51eC1uZnMmbT0xNzM0NjM1MzM0MTExMDMmdz0yXQot
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KLUNjOiBCZW5qYW1p
biBDb2RkaW5ndG9uIDxiY29kZGluZ0ByZWRoYXQuY29tPgotQ2M6IFN0ZXZlIERpY2tzb24gPHN0
ZXZlZEByZWRoYXQuY29tPgotLS0tCi12MjogTWFrZSBiYXNlIGFzIGNvbnN0IGNoYXIgcG9pbnRl
ciBpbnNyZWFkIG9mIHRyeWluZyB0eXBlIHB1bm5pbmcKLQotIHN1cHBvcnQvbnNtL2ZpbGUuYyB8
IDMgKystCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQot
Ci1kaWZmIC0tZ2l0IGEvc3VwcG9ydC9uc20vZmlsZS5jIGIvc3VwcG9ydC9uc20vZmlsZS5jCi1p
bmRleCBkZTEyMmIwZi4uNjhmOTliZjAgMTAwNjQ0Ci0tLS0gYS9zdXBwb3J0L25zbS9maWxlLmMK
LSsrKyBiL3N1cHBvcnQvbnNtL2ZpbGUuYwotQEAgLTE4NCw3ICsxODQsOCBAQCBzdGF0aWMgY2hh
ciAqCi0gbnNtX21ha2VfdGVtcF9wYXRobmFtZShjb25zdCBjaGFyICpwYXRobmFtZSkKLSB7Ci0g
CXNpemVfdCBzaXplOwotLQljaGFyICpwYXRoLCAqYmFzZTsKLSsJY2hhciAqcGF0aDsKLSsJY29u
c3QgY2hhciAqYmFzZTsKLSAJaW50IGxlbjsKLSAKLSAJc2l6ZSA9IHN0cmxlbihwYXRobmFtZSkg
KyBzaXplb2YoIi5uZXciKSArIDE7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1NYWtlZmlsZS5hbS1Eby1ub3Qt
dXNlLWJ1aWxkLWZsYWdzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRp
bHMvbmZzLXV0aWxzLzAwMDEtbG9ja3Rlc3QtTWFrZWZpbGUuYW0tRG8tbm90LXVzZS1idWlsZC1m
bGFncy5wYXRjaAppbmRleCAzNTE0MDdkZGNkLi5hNTk1YTQ3ZGFhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMS1sb2NrdGVzdC1N
YWtlZmlsZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDAxLWxvY2t0ZXN0LU1ha2VmaWxl
LmFtLURvLW5vdC11c2UtYnVpbGQtZmxhZ3MucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDll
ZmE3YTBkMzc2NjVkOWJiMGY0NmQyNDA3ODgzYTVhYjQyYzJiODQgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGY5ZWNmMDFkMGIxNmNhYmVkMjBkM2Y5MWYyMzlmZDcwOGUxOGI3OTAgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgogRGF0ZTogTW9uLCAyNCBKdWwgMjAyMyAyMDozOToxNiAtMDcwMAogU3ViamVjdDogW1BBVENI
XSBsb2NrdGVzdDogTWFrZWZpbGUuYW06IERvIG5vdCB1c2UgYnVpbGQgZmxhZ3MKQEAgLTE5LDcg
KzE5LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Rvb2xzL2xvY2t0
ZXN0L01ha2VmaWxlLmFtIGIvdG9vbHMvbG9ja3Rlc3QvTWFrZWZpbGUuYW0KLWluZGV4IGU4OTE0
NjU1Li4yZmQzNjk3MSAxMDA2NDQKK2luZGV4IGU4OTE0NjUuLjJmZDM2OTcgMTAwNjQ0CiAtLS0g
YS90b29scy9sb2NrdGVzdC9NYWtlZmlsZS5hbQogKysrIGIvdG9vbHMvbG9ja3Rlc3QvTWFrZWZp
bGUuYW0KIEBAIC0yLDggKzIsNSBAQApAQCAtMzEsNiArMzEsMyBAQCBpbmRleCBlODkxNDY1NS4u
MmZkMzY5NzEgMTAwNjQ0CiAtdGVzdGxrX0xERkxBR1M9JChMREZMQUdTX0ZPUl9CVUlMRCkKICAK
ICBNQUlOVEFJTkVSQ0xFQU5GSUxFUyA9IE1ha2VmaWxlLmluCi0tLSAKLTIuNDEuMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAw
My1zdXBwb3J0LW5mcy14Y29tbW9uLmMtZml4LWEtZm9ybWF0dGluZy1lcnJvci13aXRoLWNsLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDMt
c3VwcG9ydC1uZnMteGNvbW1vbi5jLWZpeC1hLWZvcm1hdHRpbmctZXJyb3Itd2l0aC1jbC5wYXRj
aApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYTk5YmEyODRlMC4uMDAwMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwMy1z
dXBwb3J0LW5mcy14Y29tbW9uLmMtZml4LWEtZm9ybWF0dGluZy1lcnJvci13aXRoLWNsLnBhdGNo
CisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAotRnJvbSBjYzU5YTdmZTE1YjZjYTJlZTQz
Y2JhMGRjMWQ2OTkzMjNiMzZmZmNjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLURhdGU6IEZyaSwgMjEgTWFyIDIw
MjUgMTA6NDI6NTYgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gc3VwcG9ydC9uZnMveGNvbW1vbi5j
OiBmaXggYSBmb3JtYXR0aW5nIGVycm9yIHdpdGggY2xhbmcKLQotU3BlY2lmaWNhbGx5LCB0aGlz
IGhhcHBlbnM6Ci0KLXwgeGNvbW1vbi5jOjEwMToyNDogZXJyb3I6IGZvcm1hdCBzdHJpbmcgaXMg
bm90IGEgc3RyaW5nIGxpdGVyYWwgWy1XZXJyb3IsLVdmb3JtYXQtbm9ubGl0ZXJhbF0KLXwgICAx
MDEgfCAgICAgIHZmcHJpbnRmIChzdGRlcnIsIGZtdDIsIGFyZ3MpOwotfCAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fgotCi1BIHNpbWlsYXIgYXBwcm9hY2ggKHByaW50IFxuIHNl
cHJhdGVseSkgaXMgYWxyZWFkeSB1c2VkIGVsc2V3aGVyZSBpbgotdGhlIHNhbWUgZmlsZS4KLQot
VXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW3ZpYSBlbWFpbCB0byBzdGV2ZWRAcmVkaGF0LmNv
bSxsaW51eC1uZnNAdmdlci5rZXJuZWwub3JnXQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQotIHN1cHBvcnQvbmZzL3hjb21tb24uYyB8
IDYgKystLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKLQotZGlmZiAtLWdpdCBhL3N1cHBvcnQvbmZzL3hjb21tb24uYyBiL3N1cHBvcnQvbmZzL3hj
b21tb24uYwotaW5kZXggMzk4OWYwYi4uMWQwNGRkMSAxMDA2NDQKLS0tLSBhL3N1cHBvcnQvbmZz
L3hjb21tb24uYwotKysrIGIvc3VwcG9ydC9uZnMveGNvbW1vbi5jCi1AQCAtOTQsMTMgKzk0LDEx
IEBAIHhzdHJjb25jYXQ0IChjb25zdCBjaGFyICpzLCBjb25zdCBjaGFyICp0LCBjb25zdCBjaGFy
ICp1LCBjb25zdCBjaGFyICp2KSB7Ci0gdm9pZAotIG5mc19lcnJvciAoY29uc3QgY2hhciAqZm10
LCAuLi4pIHsKLSAgICAgIHZhX2xpc3QgYXJnczsKLS0gICAgIGNoYXIgKmZtdDI7Ci0gCi0tICAg
ICBmbXQyID0geHN0cmNvbmNhdDIgKGZtdCwgIlxuIik7Ci0gICAgICB2YV9zdGFydCAoYXJncywg
Zm10KTsKLS0gICAgIHZmcHJpbnRmIChzdGRlcnIsIGZtdDIsIGFyZ3MpOwotKyAgICAgdmZwcmlu
dGYgKHN0ZGVyciwgZm10LCBhcmdzKTsKLSsgICAgIGZwcmludGYgKHN0ZGVyciwgIlxuIik7Ci0g
ICAgICB2YV9lbmQgKGFyZ3MpOwotLSAgICAgZnJlZSAoZm10Mik7Ci0gfQotIAotIC8qIE1ha2Ug
YSBjYW5vbmljYWwgcGF0aG5hbWUgZnJvbSBQQVRILiAgUmV0dXJucyBhIGZyZXNobHkgbWFsbG9j
ZWQgc3RyaW5nLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRp
bHMvbmZzLXV0aWxzLzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA0LVVzZS1ub2dy
b3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2gKaW5kZXggYmJmNDRkNTk3Ny4uNTY4MGNlZjI0OCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxz
LzAwMDQtVXNlLW5vZ3JvdXAtZm9yLW5vYm9keS1ncm91cC5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHMvMDAwNC1Vc2Utbm9ncm91cC1mb3It
bm9ib2R5LWdyb3VwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAwMDE5MTNjNWViMGFhZDkz
M2E5M2VlOTY2MjUyOTA1Y2Q0NmQ3NzZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBl
MjY0YTQxMDQwNTI1M2ViZmEyMGNiZWZiNjk4MjA3N2UxZWRlMWYzIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNv
bT4KIERhdGU6IFR1ZSwgNiBKdW4gMjAyMyAxNjowNzo1MyAtMDYwMAogU3ViamVjdDogW1BBVENI
XSBVc2UgIm5vZ3JvdXAiIGZvciBub2JvZHkgZ3JvdXAKQEAgLTExLDcgKzExLDcgQEAgU2lnbmVk
LW9mZi1ieTogRGFuaWVsIE1jR3JlZ29yIDxkYW5pZWwubWNncmVnb3JAdmVjaW1hLmNvbT4KICAy
IGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL3N1cHBvcnQvbmZzaWRtYXAvaWRtYXBkLmNvbmYgYi9zdXBwb3J0L25mc2lkbWFwL2lk
bWFwZC5jb25mCi1pbmRleCAyYTJmNzlhMS4uZTZmMzcyNGYgMTAwNjQ0CitpbmRleCAyYTJmNzlh
Li5lNmYzNzI0IDEwMDY0NAogLS0tIGEvc3VwcG9ydC9uZnNpZG1hcC9pZG1hcGQuY29uZgogKysr
IGIvc3VwcG9ydC9uZnNpZG1hcC9pZG1hcGQuY29uZgogQEAgLTQxLDcgKzQxLDcgQEAKQEAgLTI0
LDcgKzI0LDcgQEAgaW5kZXggMmEyZjc5YTEuLmU2ZjM3MjRmIDEwMDY0NAogIFtUcmFuc2xhdGlv
bl0KICAKIGRpZmYgLS1naXQgYS91dGlscy9pZG1hcGQvaWRtYXBkLmMgYi91dGlscy9pZG1hcGQv
aWRtYXBkLmMKLWluZGV4IGNkOWE5NjVmLi4zYmU4MDVlOSAxMDA2NDQKK2luZGV4IDUyMzFmNTYu
LmUxYWE4YTUgMTAwNjQ0CiAtLS0gYS91dGlscy9pZG1hcGQvaWRtYXBkLmMKICsrKyBiL3V0aWxz
L2lkbWFwZC9pZG1hcGQuYwogQEAgLTg5LDcgKzg5LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlk
ZWQtS2VyYmVyb3MucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9u
ZnMtdXRpbHMvMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoCmluZGV4IDMyNDFl
OGU4NTkuLmRkOTQyOTQwNGEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkv
bmZzLXV0aWxzL25mcy11dGlscy8wMDA1LWZpbmQtT0UtcHJvdmlkZWQtS2VyYmVyb3MucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzLzAwMDUt
ZmluZC1PRS1wcm92aWRlZC1LZXJiZXJvcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYTJh
ZjI2NmYwMTM3MjJhNjRjNWQwNGUwZmUwOTdjZDcxMTM5M2E1MyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gODZjMmE0ODdkMGM4ZThiN2JhOGM4OGU3MDgwNjUyOTYwNTVmYzczMSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IERhbmllbCBNY0dyZWdvciA8ZGFuaWVsLm1jZ3Jl
Z29yQHZlY2ltYS5jb20+CiBEYXRlOiBXZWQsIDggTm92IDIwMjMgMTY6MjQ6MjAgLTA2MDAKIFN1
YmplY3Q6IFtQQVRDSF0gZmluZCBPRSBwcm92aWRlZCBLZXJiZXJvcwpAQCAtMTAsNyArMTAsNyBA
QCBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgTWNHcmVnb3IgPGRhbmllbC5tY2dyZWdvckB2ZWNpbWEu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9hY2xvY2FsL2tlcmJlcm9zNS5tNCBiL2FjbG9jYWwva2VyYmVyb3M1Lm00
Ci1pbmRleCBmOTZmMGZkNC4uYWQ4NWZkZjIgMTAwNjQ0CitpbmRleCBmOTZmMGZkLi5hZDg1ZmRm
IDEwMDY0NAogLS0tIGEvYWNsb2NhbC9rZXJiZXJvczUubTQKICsrKyBiL2FjbG9jYWwva2VyYmVy
b3M1Lm00CiBAQCAtMjIsOCArMjIsOCBAQCBBQ19ERUZVTihbQUNfS0VSQkVST1NfVjVdLFsKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18y
LjguMi5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18y
LjguMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjguMy5iYgppbmRleCAxZjNh
ZmEwNTYwLi45NjY4YWMwZTg2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L25mcy11dGlscy9uZnMtdXRpbHNfMi44LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuOC4zLmJiCkBAIC0yMiwxMyArMjIsMTEgQEAgU1JD
X1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL25mcy11dGlscy8ke1BWfS9u
ZnMtdXRpbHMtJHtQVn0udGFyLngKICAgICAgICAgICAgZmlsZTovL25mc3NlcnZlciBcCiAgICAg
ICAgICAgIGZpbGU6Ly9uZnNjb21tb24gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1sb2NrdGVz
dC1NYWtlZmlsZS5hbS1Eby1ub3QtdXNlLWJ1aWxkLWZsYWdzLnBhdGNoIFwKLSAgICAgICAgICAg
ZmlsZTovLzAwMDEtRml4LXR5cGVjYXN0LXdhcm5pbmctd2l0aC1jbGFuZy5wYXRjaCBcCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDA0LVVzZS1ub2dyb3VwLWZvci1ub2JvZHktZ3JvdXAucGF0Y2ggXAog
ICAgICAgICAgICBmaWxlOi8vMDAwNS1maW5kLU9FLXByb3ZpZGVkLUtlcmJlcm9zLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMDMtc3VwcG9ydC1uZnMteGNvbW1vbi5jLWZpeC1hLWZvcm1h
dHRpbmctZXJyb3Itd2l0aC1jbC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImEzOWJiZWE3NmFjMGFiOWU2ZTg2OTljYWYzYzMwOGI2YjMxMGMyMGQ0NThlOGZh
ODYwNjE5NmQzNThlN2ZiMTUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTFlN2M1ODQ3YTg0MjNh
NzI5MzFjODY1YmQ5Mjk2ZTdmZDU2ZmYyNzBhNzk1YTg0OTE4MzkwMDk2MTcxMTcyNSIKIAogIyBP
bmx5IGtlcm5lbC1tb2R1bGUtbmZzZCBpcyByZXF1aXJlZCBoZXJlIChidXQgY2FuIGJlIGJ1aWx0
LWluKSAgLSB0aGUgbmZzZCBtb2R1bGUgd2lsbAogIyBwdWxsIGluIHRoZSByZW1haW5kZXIgb2Yg
dGhlIGRlcGVuZGVuY2llcy4KLS0gCjIuNDcuMQoK

--===============7397623195300772748==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/nfs-utils/nfs-utils-rpcctl: PKGSIZE changed from 9645 to 11836 (+23%)

--===============7397623195300772748==--

