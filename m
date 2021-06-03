Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2087.1622683485343206634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id AF81538C1129
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mtools: upgrading to 4.0.29 SUCCEEDED
Message-ID: <MADEUP.1684EE085EC799EC.2682@lists.openembedded.org>
X-Groupsio-MsgNum: 152564
Content-Type: multipart/mixed; boundary="===============7178122410687987275=="

--===============7178122410687987275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mtools* to *4.0.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mtools-upgrade-4.0.27-4.0.29.patch
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

--===============7178122410687987275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mtools: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools: SRC_URI changed from "https://ftp.gnu.org/gnu/mtools/mtools-4.0.27.tar.bz2 file://mtools-makeinfo.patch file://no-x11.gplv3.patch file://clang_UNUSED.patch" to "https://ftp.gnu.org/gnu/mtools/mtools-4.0.29.tar.bz2 file://mtools-makeinfo.patch file://no-x11.gplv3.patch file://clang_UNUSED.patch"
packages/core2-32-poky-linux/mtools: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-dbg: PKGSIZE changed from 719108 to 739452 (+3%)
packages/core2-32-poky-linux/mtools/mtools-dev: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-dev: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-doc: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-doc: PKGSIZE changed from 242006 to 244977 (+1%)
packages/core2-32-poky-linux/mtools/mtools-locale: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-locale: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-src: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools-src: PKGSIZE changed from 554533 to 572865 (+3%)
packages/core2-32-poky-linux/mtools/mtools-staticdev: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools-staticdev: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools: PV changed from "4.0.27" to "4.0.29"
packages/core2-32-poky-linux/mtools/mtools: PKGV changed from 4.0.27 [default] to 4.0.29 [default]
packages/core2-32-poky-linux/mtools/mtools: PKGSIZE changed from 249180 to 257436 (+3%)

--===============7178122410687987275==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-mtools-upgrade-4.0.27-4.0.29.patch"

From 47afabd0448bc66af6bcd37bf99d528a4eee4b6b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Wed, 2 Jun 2021 16:38:15 +0000
Subject: [PATCH] mtools: upgrade 4.0.27 -> 4.0.29

---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.27.bb => mtools_4.0.29.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.27.bb => mtools_4.0.29.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index f187487096..6c21f151c0 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 9590860ba35cbd524cec51bdd009f0c63a7dd417 Mon Sep 17 00:00:00 2001
+From 27721edad4edb72690bc0bd79db856f4d17d2b83 Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 415755f..b61a49d 100644
+index 550bfbf..5fbf4a1 100644
 --- a/config.c
 +++ b/config.c
-@@ -774,14 +774,6 @@ void read_config(void)
+@@ -813,14 +813,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.27.bb b/meta/recipes-devtools/mtools/mtools_4.0.29.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.27.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.29.bb
index c6fa02ebdf..38de1dd923 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.27.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.29.bb
@@ -24,7 +24,7 @@ RRECOMMENDS_${PN}_libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "9c88c8d9244e54768e40b92c005e61ec4e084ea7c070df9184caf1a6408838b3"
+SRC_URI[sha256sum] = "c6b50b4603e7afe54ba0109094669373028db9af743f5c541bca4b7664aefec7"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.17.1


--===============7178122410687987275==--
