Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.300.1615826520879316229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 18DC338C130C
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.15 SUCCEEDED
Message-ID: <MADEUP.166C91A90571838A.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149497
Content-Type: multipart/mixed; boundary="===============4740739108028787517=="

--===============4740739108028787517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.15* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.14-1.8.15.patch
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

--===============4740739108028787517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.14.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.15.tar.xz"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 299168 to 300836 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 101192 to 101427 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 35796 to 36269 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 33850 to 34281 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 36560 to 36998 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 36422 to 36879 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 44228 to 44726 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 45915 to 46504 (+1%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 477631 to 479797 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.14" to "1.8.15"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.14 [default] to 1.8.15 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.14" to "1.8.15"

--===============4740739108028787517==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.14-1.8.15.patch"

From a69ab8f917b68218192a059404579d572aeedfdc Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 06:49:34 +0000
Subject: [PATCH] msmtp: upgrade 1.8.14 -> 1.8.15

---
 .../recipes-extended/msmtp/{msmtp_1.8.14.bb => msmtp_1.8.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.14.bb => msmtp_1.8.15.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb b/meta/recipes-extended/msmtp/msmtp_1.8.15.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.14.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.15.bb
index 3bd5f9edeb..e85873e90f 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.14.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.15.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4"
+SRC_URI[sha256sum] = "2265dc639ebf2edf3069fffe0a3bd76749f8b58f4001d5cdeae19873949099ce"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.17.1


--===============4740739108028787517==--
