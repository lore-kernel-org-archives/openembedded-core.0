Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5218.1613463848513890660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5D52038C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwebp: upgrading to 1.2.0 SUCCEEDED
Message-ID: <MADEUP.16642CD389208574.20265@lists.openembedded.org>
X-Groupsio-MsgNum: 148146
Content-Type: multipart/mixed; boundary="===============3764046840443779253=="

--===============3764046840443779253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwebp* to *1.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwebp-upgrade-1.1.0-1.2.0.patch
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

--===============3764046840443779253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwebp/libwebp-bin: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-dev: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-doc: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-locale: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebp.so.7.1.0 /usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5", added "/usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebp.so.7.1.1"
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.6 to libwebpdemux.so.2.0.7
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.6 to libwebpdemux.so.2.0.7
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.5 to libwebpmux.so.3.0.6
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.5 to libwebpmux.so.3.0.6
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.0 to libwebp.so.7.1.1
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.0 to libwebp.so.7.1.1
  /usr/lib/libwebpdemux.so.2.0.6 moved to /usr/lib/libwebpdemux.so.2.0.7
  /usr/lib/libwebpmux.so.3.0.5 moved to /usr/lib/libwebpmux.so.3.0.6
  /usr/lib/libwebp.so.7.1.0 moved to /usr/lib/libwebp.so.7.1.1

--===============3764046840443779253==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libwebp-upgrade-1.1.0-1.2.0.patch"

From faaa1c2fec73521c8a153d3731fff6933bfa3890 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Tue, 16 Feb 2021 05:12:01 +0000
Subject: [PATCH] libwebp: upgrade 1.1.0 -> 1.2.0

---
 .../webp/{libwebp_1.1.0.bb => libwebp_1.2.0.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/webp/{libwebp_1.1.0.bb => libwebp_1.2.0.bb} (93%)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb b/meta/recipes-multimedia/webp/libwebp_1.2.0.bb
similarity index 93%
rename from meta/recipes-multimedia/webp/libwebp_1.1.0.bb
rename to meta/recipes-multimedia/webp/libwebp_1.2.0.bb
index 68e5ae2b3c..33bec2fe70 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.1.0.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.2.0.bb
@@ -14,8 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb \
                     file://PATENTS;md5=c6926d0cb07d296f886ab6e0cc5a85b7"
 
 SRC_URI = "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz"
-SRC_URI[md5sum] = "7e047f2cbaf584dff7a8a7e0f8572f18"
-SRC_URI[sha256sum] = "98a052268cc4d5ece27f76572a7f50293f439c17a98e67c4ea0c7ed6f50ef043"
+SRC_URI[sha256sum] = "2fc8bbde9f97f2ab403c0224fb9ca62b2e6852cbc519e91ceaa7c153ffd88a0c"
 
 UPSTREAM_CHECK_URI = "http://downloads.webmproject.org/releases/webp/index.html"
 
-- 
2.17.1


--===============3764046840443779253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwebp: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp: SRC_URI changed from "http://downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz" to "http://downloads.webmproject.org/releases/webp/libwebp-1.2.0.tar.gz"
packages/core2-32-poky-linux/libwebp: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-bin: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-bin: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-bin: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-dbg: PKGSIZE changed from 3818380 to 3808364 (-0%)
packages/core2-32-poky-linux/libwebp/libwebp-dbg: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-dev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-dev: PKGSIZE changed from 95892 to 96280 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-dev: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-doc: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-doc: PKGSIZE changed from 28962 to 29511 (+2%)
packages/core2-32-poky-linux/libwebp/libwebp-doc: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-gif2webp: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-locale: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-locale: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-locale: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-src: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-src: PKGSIZE changed from 2820047 to 2828164 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp-src: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp-staticdev: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
packages/core2-32-poky-linux/libwebp/libwebp: PKGV changed from 1.1.0 [default] to 1.2.0 [default]
packages/core2-32-poky-linux/libwebp/libwebp: PV changed from "1.1.0" to "1.2.0"
packages/core2-32-poky-linux/libwebp/libwebp: PKGSIZE changed from 553032 to 553044 (+0%)
packages/core2-32-poky-linux/libwebp/libwebp: FILELIST: removed "/usr/lib/libwebpdemux.so.2.0.6 /usr/lib/libwebpmux.so.3.0.5 /usr/lib/libwebp.so.7.1.0", added "/usr/lib/libwebpmux.so.3.0.6 /usr/lib/libwebpdemux.so.2.0.7 /usr/lib/libwebp.so.7.1.1"
Changes to packages/core2-32-poky-linux/libwebp (sysroot):
  /usr/lib/libwebpdemux.so.2 changed symlink target from libwebpdemux.so.2.0.6 to libwebpdemux.so.2.0.7
  /usr/lib/libwebpdemux.so changed symlink target from libwebpdemux.so.2.0.6 to libwebpdemux.so.2.0.7
  /usr/lib/libwebpmux.so.3 changed symlink target from libwebpmux.so.3.0.5 to libwebpmux.so.3.0.6
  /usr/lib/libwebpmux.so changed symlink target from libwebpmux.so.3.0.5 to libwebpmux.so.3.0.6
  /usr/lib/libwebp.so.7 changed symlink target from libwebp.so.7.1.0 to libwebp.so.7.1.1
  /usr/lib/libwebp.so changed symlink target from libwebp.so.7.1.0 to libwebp.so.7.1.1
  /usr/lib/libwebpdemux.so.2.0.6 moved to /usr/lib/libwebpdemux.so.2.0.7
  /usr/lib/libwebpmux.so.3.0.5 moved to /usr/lib/libwebpmux.so.3.0.6
  /usr/lib/libwebp.so.7.1.0 moved to /usr/lib/libwebp.so.7.1.1

--===============3764046840443779253==--
