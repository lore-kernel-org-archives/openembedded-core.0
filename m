Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.16438.1623585061649045194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2F40C38C13E6
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gptfdisk: upgrading to 1.0.8 SUCCEEDED
Message-ID: <MADEUP.16882202F425D6D5.15968@lists.openembedded.org>
X-Groupsio-MsgNum: 152892
Content-Type: multipart/mixed; boundary="===============2847569248898061038=="

--===============2847569248898061038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gptfdisk* to *1.0.8* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gptfdisk-upgrade-1.0.7-1.0.8.patch
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

--===============2847569248898061038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PKGSIZE changed from 4693784 to 4692384 (-0%)
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dbg: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dev: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-dev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-doc: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-doc: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-locale: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-locale: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PKGSIZE changed from 429501 to 431030 (+0%)
packages/core2-32-poky-linux/gptfdisk/gptfdisk-src: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk-staticdev: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk-staticdev: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk/gptfdisk: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk/gptfdisk: PKGV changed from 1.0.7 [default] to 1.0.8 [default]
packages/core2-32-poky-linux/gptfdisk: PV changed from "1.0.7" to "1.0.8"
packages/core2-32-poky-linux/gptfdisk: SRC_URI changed from "https://downloads.sourceforge.net/gptfdisk/1.0.7/gptfdisk-1.0.7.tar.gz file://0001-gptcurses-correctly-include-curses.h.patch" to "https://downloads.sourceforge.net/gptfdisk/1.0.8/gptfdisk-1.0.8.tar.gz file://0001-gptcurses-correctly-include-curses.h.patch"
packages/core2-32-poky-linux/gptfdisk: PKGV changed from 1.0.7 [default] to 1.0.8 [default]

--===============2847569248898061038==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gptfdisk-upgrade-1.0.7-1.0.8.patch"

From b0521cf077fe43ebb3d004e2170ed37eeb0e9543 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 09:34:08 +0000
Subject: [PATCH] gptfdisk: upgrade 1.0.7 -> 1.0.8

---
 .../fdisk/{gptfdisk_1.0.7.bb => gptfdisk_1.0.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/fdisk/{gptfdisk_1.0.7.bb => gptfdisk_1.0.8.bb} (93%)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
similarity index 93%
rename from meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
rename to meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
index a697b74f98..16fe540968 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.7.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.8.bb
@@ -10,7 +10,7 @@ DEPENDS = "util-linux"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
            "
-SRC_URI[sha256sum] = "754004b7f85b279287c7ac3c0469b1d7e0eae043a97a2e587b0560ca5f3828c0"
+SRC_URI[sha256sum] = "95d19856f004dabc4b8c342b2612e8d0a9eebdd52004297188369f152e9dc6df"
 
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/gptfdisk/files/gptfdisk/"
 UPSTREAM_CHECK_REGEX = "/gptfdisk/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1


--===============2847569248898061038==--
