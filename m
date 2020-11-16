Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.39206.1605551304092983264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 36C6038C12D7
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.6 SUCCEEDED
Message-ID: <MADEUP.16481067952EDE26.17549@lists.openembedded.org>
X-Groupsio-MsgNum: 144658
Content-Type: multipart/mixed; boundary="===============3494652948805743996=="

--===============3494652948805743996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.5-3.6.patch
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

--===============3494652948805743996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 11356 to 16427 (+45%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 18689 to 20688 (+11%)

--===============3494652948805743996==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grep/grep-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-dbg: PKGSIZE changed from 878376 to 874732 (-0%)
packages/core2-32-poky-linux/grep/grep-dbg: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-dev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-doc: PKGSIZE changed from 160948 to 160744 (-0%)
packages/core2-32-poky-linux/grep/grep-doc: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-af: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-af: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-be: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-be: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 22108 to 21962 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-bg: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGSIZE changed from 13570 to 13160 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-ca: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 17402 to 17326 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-cs: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-da: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-da: PKGSIZE changed from 14485 to 14102 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-da: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-de: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-de: PKGSIZE changed from 17845 to 17307 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-de: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-el: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-el: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 16444 to 15965 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-eo: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-es: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-es: PKGSIZE changed from 7805 to 7632 (-2%)
packages/core2-32-poky-linux/grep/grep-locale-es: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-et: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-et: PKGSIZE changed from 15734 to 15667 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-et: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-eu: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 16763 to 16299 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-fi: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 15444 to 15020 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-fr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGSIZE changed from 11535 to 11119 (-4%)
packages/core2-32-poky-linux/grep/grep-locale-ga: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 11356 to 16427 (+45%)
packages/core2-32-poky-linux/grep/grep-locale-gl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-he: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-he: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 15118 to 14704 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-hr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 13722 to 13340 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-hu: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-id: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-id: PKGSIZE changed from 14781 to 14407 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-id: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-it: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-it: PKGSIZE changed from 15149 to 16247 (+7%)
packages/core2-32-poky-linux/grep/grep-locale-it: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGSIZE changed from 12574 to 12063 (-4%)
packages/core2-32-poky-linux/grep/grep-locale-ja: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 16039 to 15609 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-ko: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ky: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-lt: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 16370 to 15906 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-nb: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 17296 to 16783 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-nl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-pa: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 16874 to 16369 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-pl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 17279 to 17204 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGSIZE changed from 16298 to 16235 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-pt: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 15308 to 14904 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-ro: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 21649 to 21067 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-ru: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 6814 to 6725 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-sk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 11234 to 10821 (-4%)
packages/core2-32-poky-linux/grep/grep-locale-sl: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 18689 to 20688 (+11%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 16267 to 16199 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-sv: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-th: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-th: PKGSIZE changed from 18301 to 17694 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-th: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-tr: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 22300 to 22125 (-1%)
packages/core2-32-poky-linux/grep/grep-locale-uk: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 16954 to 16508 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-vi: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 15897 to 15844 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 15740 to 15694 (-0%)
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-src: PKGSIZE changed from 1481677 to 1481016 (-0%)
packages/core2-32-poky-linux/grep/grep-src: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep-staticdev: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep/grep: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep/grep: PV changed from "3.5" to "3.6"
packages/core2-32-poky-linux/grep: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-32-poky-linux/grep: SRC_URI changed from "https://ftp.gnu.org/gnu/grep/grep-3.5.tar.xz" to "https://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz"
packages/core2-32-poky-linux/grep: PV changed from "3.5" to "3.6"

--===============3494652948805743996==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-grep-upgrade-3.5-3.6.patch"

From 79a3c6d17e419847a65255dac4d7e89970accbdf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:50:32 +0000
Subject: [PATCH] grep: upgrade 3.5 -> 3.6

---
 meta/recipes-extended/grep/{grep_3.5.bb => grep_3.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/grep/{grep_3.5.bb => grep_3.6.bb} (93%)

diff --git a/meta/recipes-extended/grep/grep_3.5.bb b/meta/recipes-extended/grep/grep_3.6.bb
similarity index 93%
rename from meta/recipes-extended/grep/grep_3.5.bb
rename to meta/recipes-extended/grep/grep_3.6.bb
index 22ef70bc5b..edf9b29c8f 100644
--- a/meta/recipes-extended/grep/grep_3.5.bb
+++ b/meta/recipes-extended/grep/grep_3.6.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a"
+SRC_URI[sha256sum] = "667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.20.1


--===============3494652948805743996==--
