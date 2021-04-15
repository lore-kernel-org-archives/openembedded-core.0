Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.1330.1618510599872298479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0AE5638C13C1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcomps: upgrading to 0.1.16 SUCCEEDED
Message-ID: <MADEUP.16761AD0D7B9042E.4047@lists.openembedded.org>
X-Groupsio-MsgNum: 150507
Content-Type: multipart/mixed; boundary="===============1487427421700972347=="

--===============1487427421700972347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcomps* to *0.1.16* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcomps-upgrade-0.1.15-0.1.16.patch
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

--===============1487427421700972347==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libcomps-upgrade-0.1.15-0.1.16.patch"

From 6e8825c868d4e48932e38ac0aec87941cdc25311 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 05:00:03 +0000
Subject: [PATCH] libcomps: upgrade 0.1.15 -> 0.1.16

---
 .../libcomps/0001-Add-crc32.c-to-sources-list.patch  | 12 +++++-------
 .../{libcomps_0.1.15.bb => libcomps_0.1.16.bb}       |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/libcomps/{libcomps_0.1.15.bb => libcomps_0.1.16.bb} (94%)

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
index f4fb6d3b20..25d4d54af0 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
@@ -1,19 +1,20 @@
-From 72065bb2b5881dc224299f302379391aebdfca3d Mon Sep 17 00:00:00 2001
+From 9ee158938f8eb26421dabdb328059afa8ca90488 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 21 Nov 2018 13:09:05 +0100
-Subject: [PATCH 1/2] Add crc32.c to sources list
+Subject: [PATCH] Add crc32.c to sources list
 
 Otherwise, there is a missing symbol runtime error under musl C library.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  libcomps/src/python/src/CMakeLists.txt | 4 ++--
  libcomps/src/python/src/crc32.c        | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index adabb31..b9b96ab 100644
+index 89b9c91..08cd6b5 100644
 --- a/libcomps/src/python/src/CMakeLists.txt
 +++ b/libcomps/src/python/src/CMakeLists.txt
 @@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
@@ -23,7 +24,7 @@ index adabb31..b9b96ab 100644
 -     pycomps_hash.c pycomps_exc.c pycomps_lbw.c)
 +     pycomps_hash.c pycomps_exc.c pycomps_lbw.c crc32.c)
  
- set (pycomps_HEADERS pycomps_23macros.h pycomps_sequence.h
+ set (pycomps_HEADERS pycomps_macros.h pycomps_sequence.h
       pycomps_envs.h pycomps_categories.h pycomps_groups.h
       pycomps_gids.h pycomps_utils.h pycomps_dict.h pycomps_mdict.h
       pycomps_hash.h pycomps_exc.h pycomps_lbw.h
@@ -45,6 +46,3 @@ index d8f5e34..f266067 100644
  
  static uint32_t crc32_tab[] = {
  	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
--- 
-2.26.2
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
similarity index 94%
rename from meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
index 58d2dee897..851ec5b817 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.15.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.16.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "b213f749405d84e989b25e183bcf28ce701696dd"
+SRCREV = "f3289ed1d812648558ab48ade4fae850b375fa65"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============1487427421700972347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libcomps/libcomps-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
Changes to packages/core2-32-poky-linux/libcomps (sysroot):
  /usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info

--===============1487427421700972347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libcomps: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dbg: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PKGSIZE changed from 619812 to 596684 (-4%)
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-dbg: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-dev: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-dev: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-dev: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-doc: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-doc: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-doc: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-locale: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-locale: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-locale: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-src: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-src: PKGSIZE changed from 837637 to 819320 (-2%)
packages/core2-32-poky-linux/libcomps/libcomps-src: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-src: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps-staticdev: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
packages/core2-32-poky-linux/libcomps/libcomps: FILELIST: removed "/usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info", added "/usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info"
packages/core2-32-poky-linux/libcomps/libcomps: PKGSIZE changed from 329492 to 321202 (-3%)
packages/core2-32-poky-linux/libcomps/libcomps: PV changed from "0.1.15" to "0.1.16"
packages/core2-32-poky-linux/libcomps/libcomps: PKGV changed from 0.1.15 [default] to 0.1.16 [default]
Changes to packages/core2-32-poky-linux/libcomps (sysroot):
  /usr/lib/python3.9/site-packages/libcomps-0.1.15-py3.9.egg-info moved to /usr/lib/python3.9/site-packages/libcomps-0.1.16-py3.9.egg-info

--===============1487427421700972347==--
