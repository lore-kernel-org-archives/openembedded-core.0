Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.5211.1613463848578057905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9F08538C128A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:11 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysstat: upgrading to 12.4.3 SUCCEEDED
Message-ID: <MADEUP.16642CD321D18469.16989@lists.openembedded.org>
X-Groupsio-MsgNum: 148133
Content-Type: multipart/mixed; boundary="===============0274831284160990356=="

--===============0274831284160990356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysstat* to *12.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sysstat-upgrade-12.4.2-12.4.3.patch
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

--===============0274831284160990356==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-sysstat-upgrade-12.4.2-12.4.3.patch"

From f40f0d8de78e9bdddcd0b406b69966b4b2983589 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 23:47:41 +0000
Subject: [PATCH] sysstat: upgrade 12.4.2 -> 12.4.3

---
 .../sysstat/{sysstat_12.4.2.bb => sysstat_12.4.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysstat/{sysstat_12.4.2.bb => sysstat_12.4.3.bb} (65%)

diff --git a/meta/recipes-extended/sysstat/sysstat_12.4.2.bb b/meta/recipes-extended/sysstat/sysstat_12.4.3.bb
similarity index 65%
rename from meta/recipes-extended/sysstat/sysstat_12.4.2.bb
rename to meta/recipes-extended/sysstat/sysstat_12.4.3.bb
index e50bb0ff61..5a27de439f 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.4.2.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.4.3.bb
@@ -4,4 +4,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
 SRC_URI += "file://0001-configure.in-remove-check-for-chkconfig.patch"
 
-SRC_URI[sha256sum] = "3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f"
+SRC_URI[sha256sum] = "ae432431f45aacbcabacfbbe129e2505e215cafa9ce996d7550c6091a46f0bfd"
-- 
2.17.1


--===============0274831284160990356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sysstat: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat: SRC_URI changed from "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.4.2.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch" to "http://pagesperso-orange.fr/sebastien.godard/sysstat-12.4.3.tar.xz file://99_sysstat file://sysstat.service file://0001-configure.in-remove-check-for-chkconfig.patch"
packages/core2-32-poky-linux/sysstat: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGSIZE changed from 2027308 to 2022948 (-0%)
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dbg: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-dev: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-dev: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGSIZE changed from 247003 to 247626 (+0%)
packages/core2-32-poky-linux/sysstat/sysstat-doc: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-doc: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-af: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-cs: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-da: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-de: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eo: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-es: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-eu: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fi: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fr: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-fur: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-gl: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hr: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-hu: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-id: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-it: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ja: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ko: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ky: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-lv: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-mt: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nb: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nl: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-nn: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pl: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt-br: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-pt: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ro: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-ru: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sk: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sr: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PKGSIZE changed from 14566 to 14701 (+1%)
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-sv: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-tr: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-uk: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-vi: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-cn: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-locale-zh-tw: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGSIZE changed from 1756318 to 1755505 (-0%)
packages/core2-32-poky-linux/sysstat/sysstat-src: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-src: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat-staticdev: PV changed from "12.4.2" to "12.4.3"
packages/core2-32-poky-linux/sysstat/sysstat: PKGV changed from 12.4.2 [default] to 12.4.3 [default]
packages/core2-32-poky-linux/sysstat/sysstat: PV changed from "12.4.2" to "12.4.3"

--===============0274831284160990356==--
