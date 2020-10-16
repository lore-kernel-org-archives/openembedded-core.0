Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12423.1602843683539497299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id CE14038C17B7
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Denys Dmytriyenko <denys@ti.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] grep: upgrading to 3.5 SUCCEEDED
Message-ID: <MADEUP.163E71D6CA6B32F8.19966@lists.openembedded.org>
X-Groupsio-MsgNum: 143451
Content-Type: multipart/mixed; boundary="===============8775179201414334345=="

--===============8775179201414334345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *grep* to *3.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-grep-upgrade-3.4-3.5.patch
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

--===============8775179201414334345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/grep/grep-locale-af: PKGSIZE changed from 1372 to 1171 (-15%)
packages/core2-32-poky-linux/grep/grep-locale-be: PKGSIZE changed from 1674 to 1439 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 11325 to 16444 (+45%)
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGSIZE changed from 1488 to 1278 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1340 to 1138 (-15%)
packages/core2-32-poky-linux/grep/grep-locale-id: PKGSIZE changed from 11422 to 14781 (+29%)
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGSIZE changed from 1799 to 1518 (-16%)
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGSIZE changed from 1589 to 1384 (-13%)
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 13980 to 16370 (+17%)
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 1482 to 15308 (+933%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 14465 to 18689 (+29%)
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 1449 to 1249 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 13500 to 15740 (+17%)

--===============8775179201414334345==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-grep-upgrade-3.4-3.5.patch"

From 7888f035aea6fa73d7e5ef709091ce683a6bf3b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 06:03:31 +0000
Subject: [PATCH] grep: upgrade 3.4 -> 3.5

---
 meta/recipes-extended/grep/{grep_3.4.bb => grep_3.5.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/grep/{grep_3.4.bb => grep_3.5.bb} (89%)

diff --git a/meta/recipes-extended/grep/grep_3.4.bb b/meta/recipes-extended/grep/grep_3.5.bb
similarity index 89%
rename from meta/recipes-extended/grep/grep_3.4.bb
rename to meta/recipes-extended/grep/grep_3.5.bb
index e176dd727b..22ef70bc5b 100644
--- a/meta/recipes-extended/grep/grep_3.4.bb
+++ b/meta/recipes-extended/grep/grep_3.5.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "111b117d22d6a7d049d6ae7505e9c4d2"
-SRC_URI[sha256sum] = "58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb"
+SRC_URI[sha256sum] = "b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a"
 
 inherit autotools gettext texinfo pkgconfig
 
-- 
2.18.4


--===============8775179201414334345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/grep/grep-dbg: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-dbg: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-dbg: PKGSIZE changed from 869784 to 878376 (+1%)
packages/core2-32-poky-linux/grep/grep-dev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-dev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-doc: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-doc: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-doc: PKGSIZE changed from 157751 to 160948 (+2%)
packages/core2-32-poky-linux/grep/grep-locale-af: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-af: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-af: PKGSIZE changed from 1372 to 1171 (-15%)
packages/core2-32-poky-linux/grep/grep-locale-be: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-be: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-be: PKGSIZE changed from 1674 to 1439 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-bg: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-bg: PKGSIZE changed from 21068 to 22108 (+5%)
packages/core2-32-poky-linux/grep/grep-locale-ca: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ca: PKGSIZE changed from 14554 to 13570 (-7%)
packages/core2-32-poky-linux/grep/grep-locale-cs: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-cs: PKGSIZE changed from 16761 to 17402 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-da: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-da: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-da: PKGSIZE changed from 15374 to 14485 (-6%)
packages/core2-32-poky-linux/grep/grep-locale-de: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-de: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-de: PKGSIZE changed from 17103 to 17845 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-el: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-el: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-el: PKGSIZE changed from 4159 to 3746 (-10%)
packages/core2-32-poky-linux/grep/grep-locale-eo: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-eo: PKGSIZE changed from 11325 to 16444 (+45%)
packages/core2-32-poky-linux/grep/grep-locale-es: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-es: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-es: PKGSIZE changed from 8161 to 7805 (-4%)
packages/core2-32-poky-linux/grep/grep-locale-et: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-et: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-et: PKGSIZE changed from 15167 to 15734 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-eu: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-eu: PKGSIZE changed from 1488 to 1278 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-fi: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-fi: PKGSIZE changed from 16085 to 16763 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-fr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-fr: PKGSIZE changed from 14620 to 15444 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-ga: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ga: PKGSIZE changed from 11942 to 11535 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-gl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-gl: PKGSIZE changed from 11745 to 11356 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-he: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-he: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-he: PKGSIZE changed from 1340 to 1138 (-15%)
packages/core2-32-poky-linux/grep/grep-locale-hr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-hr: PKGSIZE changed from 16095 to 15118 (-6%)
packages/core2-32-poky-linux/grep/grep-locale-hu: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-hu: PKGSIZE changed from 14742 to 13722 (-7%)
packages/core2-32-poky-linux/grep/grep-locale-id: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-id: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-id: PKGSIZE changed from 11422 to 14781 (+29%)
packages/core2-32-poky-linux/grep/grep-locale-it: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-it: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-it: PKGSIZE changed from 16126 to 15149 (-6%)
packages/core2-32-poky-linux/grep/grep-locale-ja: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ja: PKGSIZE changed from 12960 to 12574 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-ko: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ko: PKGSIZE changed from 15123 to 16039 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-ky: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ky: PKGSIZE changed from 1799 to 1518 (-16%)
packages/core2-32-poky-linux/grep/grep-locale-lt: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-lt: PKGSIZE changed from 1589 to 1384 (-13%)
packages/core2-32-poky-linux/grep/grep-locale-nb: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-nb: PKGSIZE changed from 13980 to 16370 (+17%)
packages/core2-32-poky-linux/grep/grep-locale-nl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-nl: PKGSIZE changed from 16557 to 17296 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-pa: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-pa: PKGSIZE changed from 5538 to 5084 (-8%)
packages/core2-32-poky-linux/grep/grep-locale-pl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-pl: PKGSIZE changed from 16404 to 16874 (+3%)
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt-br: PKGSIZE changed from 16646 to 17279 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-pt: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-pt: PKGSIZE changed from 15708 to 16298 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-ro: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ro: PKGSIZE changed from 1482 to 15308 (+933%)
packages/core2-32-poky-linux/grep/grep-locale-ru: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-ru: PKGSIZE changed from 20900 to 21649 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-sk: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-sk: PKGSIZE changed from 7183 to 6814 (-5%)
packages/core2-32-poky-linux/grep/grep-locale-sl: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-sl: PKGSIZE changed from 11601 to 11234 (-3%)
packages/core2-32-poky-linux/grep/grep-locale-sr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-sr: PKGSIZE changed from 14465 to 18689 (+29%)
packages/core2-32-poky-linux/grep/grep-locale-sv: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-sv: PKGSIZE changed from 15694 to 16267 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-th: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-th: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-th: PKGSIZE changed from 19744 to 18301 (-7%)
packages/core2-32-poky-linux/grep/grep-locale-tr: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-tr: PKGSIZE changed from 1449 to 1249 (-14%)
packages/core2-32-poky-linux/grep/grep-locale-uk: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-uk: PKGSIZE changed from 21452 to 22300 (+4%)
packages/core2-32-poky-linux/grep/grep-locale-vi: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-vi: PKGSIZE changed from 15949 to 16954 (+6%)
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-cn: PKGSIZE changed from 15373 to 15897 (+3%)
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-locale-zh-tw: PKGSIZE changed from 13500 to 15740 (+17%)
packages/core2-32-poky-linux/grep/grep-src: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-src: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep-src: PKGSIZE changed from 1474842 to 1481677 (+0%)
packages/core2-32-poky-linux/grep/grep-staticdev: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep-staticdev: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep: PV changed from "3.4" to "3.5"
packages/core2-32-poky-linux/grep/grep: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep/grep: PKGSIZE changed from 259672 to 263768 (+2%)
packages/core2-32-poky-linux/grep: PKGV changed from 3.4 [default] to 3.5 [default]
packages/core2-32-poky-linux/grep: PV changed from "3.4" to "3.5"

--===============8775179201414334345==--
