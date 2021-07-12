Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.5894.1626056248688731349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6B59838C1264
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.32 SUCCEEDED
Message-ID: <MADEUP.1690E98B063F48B7.22557@lists.openembedded.org>
X-Groupsio-MsgNum: 153742
Content-Type: multipart/mixed; boundary="===============1493258446991269522=="

--===============1493258446991269522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.31-4.0.32.patch
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

--===============1493258446991269522==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.31-4.0.32.patch"

From 6fd0d56354dfa8c00b0d6c09fa0174eebe02ee5e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 11 Jul 2021 19:37:39 +0000
Subject: [PATCH] mtools: upgrade 4.0.31 -> 4.0.32

---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.31.bb => mtools_4.0.32.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.31.bb => mtools_4.0.32.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 7240a039e6..81d76d060e 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 589a05f9377e3899082ced46c1736f90c0a4dc9b Mon Sep 17 00:00:00 2001
+From 630dbcabc408cf5d73edaa7cf64a48194976b290 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index f91004b..b72f8ea 100644
+index bb13682..9186c77 100644
 --- a/config.c
 +++ b/config.c
-@@ -827,14 +827,6 @@ void read_config(void)
+@@ -836,14 +836,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.31.bb b/meta/recipes-devtools/mtools/mtools_4.0.32.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.31.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.32.bb
index 103036e518..501875037a 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.31.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.32.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "538999277f8f2fa901f3898855d1b0ccb184666457fefddb70001cac612dd586"
+SRC_URI[sha256sum] = "62498cd51ae7c79a27c879a45f0d2a8c44e1404cbb901372d09b02735ef5ad89"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.20.1


--===============1493258446991269522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.31.tar.bz2 file://mtools-makeinfo.patch file://no-x11.gplv3.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.32.tar.bz2 file://mtools-makeinfo.patch file://no-x11.gplv3.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 735832 to 737780 (+0%)
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 589409 to 595383 (+1%)
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.31 [default] to 4.0.32 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.31" to "4.0.32"
packages/core2-32-poky-linux/mtools/mtools: PKGSIZE changed from 257692 to 261788 (+2%)

--===============1493258446991269522==--
