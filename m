Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5217.1613463848503672594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id C663A38C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] tar: upgrading to 1.34 SUCCEEDED
Message-ID: <MADEUP.16642CD3293FF390.5617@lists.openembedded.org>
X-Groupsio-MsgNum: 148134
Content-Type: multipart/mixed; boundary="===============8883088771860798038=="

--===============8883088771860798038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tar* to *1.34* has Succeeded.

Next steps:
    - apply the patch: git am 0001-tar-upgrade-1.33-1.34.patch
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

--===============8883088771860798038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/tar: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar: SRC_URI changed from "https://ftp.gnu.org/gnu/tar/tar-1.33.tar.bz2" to "https://ftp.gnu.org/gnu/tar/tar-1.34.tar.bz2"
packages/core2-32-poky-linux/tar: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-dbg: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-dbg: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-dbg: PKGSIZE changed from 1877192 to 1878772 (+0%)
packages/core2-32-poky-linux/tar/tar-dev: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-dev: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-doc: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-doc: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-doc: PKGSIZE changed from 699755 to 699759 (+0%)
packages/core2-32-poky-linux/tar/tar-locale-bg: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-bg: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ca: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ca: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-cs: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-cs: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-da: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-da: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-de: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-de: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-el: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-el: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-eo: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-eo: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-es: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-es: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-et: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-et: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-eu: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-eu: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-fi: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-fi: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-fr: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-fr: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ga: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ga: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-gl: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-gl: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-hr: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-hr: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-hu: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-hu: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-id: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-id: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-it: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-it: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ja: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ja: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ko: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ko: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ky: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ky: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ms: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ms: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-nb: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-nb: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-nl: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-nl: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-pl: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-pl: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-pt-br: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-pt-br: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-pt: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-pt: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ro: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ro: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-ru: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-ru: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-sk: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-sk: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-sl: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-sl: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-sr: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-sr: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-sv: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-sv: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-tr: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-tr: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-uk: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-uk: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-vi: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-vi: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-zh-cn: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-zh-cn: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-locale-zh-tw: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-locale-zh-tw: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-rmt: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-rmt: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-src: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-src: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar-src: PKGSIZE changed from 2435271 to 2448732 (+1%)
packages/core2-32-poky-linux/tar/tar-staticdev: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar-staticdev: PKGV changed from 1.33 [default] to 1.34 [default]
packages/core2-32-poky-linux/tar/tar: PV changed from "1.33" to "1.34"
packages/core2-32-poky-linux/tar/tar: PKGV changed from 1.33 [default] to 1.34 [default]

--===============8883088771860798038==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-tar-upgrade-1.33-1.34.patch"

From 28a7c83051d2e80c34387db7634ba9b49ff13e1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:57:13 +0000
Subject: [PATCH] tar: upgrade 1.33 -> 1.34

---
 meta/recipes-extended/tar/{tar_1.33.bb => tar_1.34.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/tar/{tar_1.33.bb => tar_1.34.bb} (95%)

diff --git a/meta/recipes-extended/tar/tar_1.33.bb b/meta/recipes-extended/tar/tar_1.34.bb
similarity index 95%
rename from meta/recipes-extended/tar/tar_1.33.bb
rename to meta/recipes-extended/tar/tar_1.34.bb
index 5e34cdf9e5..af04919c41 100644
--- a/meta/recipes-extended/tar/tar_1.33.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "85b6953f4bc9666eb7db61b48f150dca21b941d85090171ea8c4f89902e460af"
+SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
 inherit autotools gettext texinfo
 
-- 
2.17.1


--===============8883088771860798038==--
