Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.39234.1605551304091618103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 46D7138C13A6
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.13 SUCCEEDED
Message-ID: <MADEUP.164810679485AFAA.17549@lists.openembedded.org>
X-Groupsio-MsgNum: 144647
Content-Type: multipart/mixed; boundary="===============6217752018486324893=="

--===============6217752018486324893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.12-1.8.13.patch
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

--===============6217752018486324893==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.12-1.8.13.patch"

From 776a26fc090b70c0ef3ff50920059cfeb9647451 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:56:50 +0000
Subject: [PATCH] msmtp: upgrade 1.8.12 -> 1.8.13

---
 .../recipes-extended/msmtp/{msmtp_1.8.12.bb => msmtp_1.8.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.12.bb => msmtp_1.8.13.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.12.bb b/meta/recipes-extended/msmtp/msmtp_1.8.13.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.12.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.13.bb
index 54798f9e6f..994f1c5d90 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.12.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.13.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "a86fef9477339923afefe974988a38e32d0feb90dfeeb88f7f55aac356a96354"
+SRC_URI[sha256sum] = "ada945ab8d519102bb632f197273b3326ded25b38c003b0cf3861d1d6d4a9bb9"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.20.1


--===============6217752018486324893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.12.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.13.tar.xz"
packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 300488 to 300840 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 100906 to 99901 (-1%)
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 37144 to 35980 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 35122 to 34031 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37862 to 36722 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 37749 to 36619 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45805 to 44482 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGSIZE changed from 14008 to 13809 (-1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47537 to 46178 (-3%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 504604 to 502877 (-0%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.12" to "1.8.13"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.12 [default] to 1.8.13 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.12" to "1.8.13"

--===============6217752018486324893==--
