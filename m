Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.324.1615826520754776137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 38A4838C1256
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf-archive: upgrading to 2021.02.19 SUCCEEDED
Message-ID: <MADEUP.166C91A8E52BF5C6.17966@lists.openembedded.org>
X-Groupsio-MsgNum: 149476
Content-Type: multipart/mixed; boundary="===============8464993296866224301=="

--===============8464993296866224301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf-archive* to *2021.02.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-autoconf-archive-upgrade-2019.01.06-2021.02.19.patch
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

--===============8464993296866224301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGV changed from 2019.01.06 [default] to 2021.02.19 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PV changed from "2019.01.06" to "2021.02.19"
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGSIZE changed from 46036 to 46547 (+1%)
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PKGV changed from 2019.01.06 [default] to 2021.02.19 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PV changed from "2019.01.06" to "2021.02.19"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGV changed from 2019.01.06 [default] to 2021.02.19 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive: PV changed from "2019.01.06" to "2021.02.19"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGSIZE changed from 2068942 to 2092330 (+1%)
packages/all-poky-linux/autoconf-archive: PKGV changed from 2019.01.06 [default] to 2021.02.19 [default]
packages/all-poky-linux/autoconf-archive: SRC_URI changed from "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2019.01.06.tar.xz" to "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2021.02.19.tar.xz"
packages/all-poky-linux/autoconf-archive: PV changed from "2019.01.06" to "2021.02.19"
Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_boost_process.m4 was added
  /usr/share/aclocal/ax_check_pcre2.m4 was added
  /usr/share/aclocal/ax_int128.m4 was added
  /usr/share/aclocal/ax_prepend_flag.m4 was added
  /usr/share/aclocal/ax_prog_robot.m4 was added

--===============8464993296866224301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_boost_process.m4 was added
  /usr/share/aclocal/ax_check_pcre2.m4 was added
  /usr/share/aclocal/ax_int128.m4 was added
  /usr/share/aclocal/ax_prepend_flag.m4 was added
  /usr/share/aclocal/ax_prog_robot.m4 was added

--===============8464993296866224301==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-autoconf-archive-upgrade-2019.01.06-2021.02.19.patch"

From b5731de25b8a1f26d7803d7a4912ba2b47a96e7c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 04:07:02 +0000
Subject: [PATCH] autoconf-archive: upgrade 2019.01.06 -> 2021.02.19

---
 ...nf-archive_2019.01.06.bb => autoconf-archive_2021.02.19.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2019.01.06.bb => autoconf-archive_2021.02.19.bb} (78%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
similarity index 78%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
index 13593d7bb3..54079b5f09 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2019.01.06.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2021.02.19.bb
@@ -6,8 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d46413c8b00a125b1529bae385bbec55"
-SRC_URI[sha256sum] = "17195c833098da79de5778ee90948f4c5d90ed1a0cf8391b4ab348e2ec511e3f"
+SRC_URI[sha256sum] = "e8a6eb9d28ddcba8ffef3fa211653239e9bf239aba6a01a6b7cfc7ceaec69cbd"
 
 inherit autotools allarch texinfo
 
-- 
2.17.1


--===============8464993296866224301==--
