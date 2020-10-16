Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3956E38C16F2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bison: upgrading to 3.7.3 SUCCEEDED
Message-ID: <MADEUP.163E71D678BE4ABA.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143418
Content-Type: multipart/mixed; boundary="===============2968998508861765033=="

--===============2968998508861765033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bison* to *3.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bison-upgrade-3.7.2-3.7.3.patch
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

--===============2968998508861765033==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bison-upgrade-3.7.2-3.7.3.patch"

From 3da166f0a6cc76036382674a557002cf510be55e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:12:48 +0000
Subject: [PATCH] bison: upgrade 3.7.2 -> 3.7.3

---
 meta/recipes-devtools/bison/{bison_3.7.2.bb => bison_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.2.bb => bison_3.7.3.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.2.bb b/meta/recipes-devtools/bison/bison_3.7.3.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.2.bb
rename to meta/recipes-devtools/bison/bison_3.7.3.bb
index ace4ea5c3f..74532caec3 100644
--- a/meta/recipes-devtools/bison/bison_3.7.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
+SRC_URI[sha256sum] = "88d9e36856b004c0887a12ba00ea3c47db388519629483dd8c3fce9694d4da6f"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.18.4


--===============2968998508861765033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bison/bison-dbg: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-dbg: PKGSIZE changed from 1893768 to 1893696 (-0%)
packages/core2-32-poky-linux/bison/bison-dbg: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-dev: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-dev: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-doc: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-doc: PKGSIZE changed from 1029041 to 1029262 (+0%)
packages/core2-32-poky-linux/bison/bison-doc: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-af: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-af: PKGSIZE changed from 1412 to 1371 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-af: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGSIZE changed from 1393 to 1352 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-ast: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-be: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-be: PKGSIZE changed from 1803 to 1762 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-be: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGSIZE changed from 42412 to 42289 (-0%)
packages/core2-32-poky-linux/bison/bison-locale-bg: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGSIZE changed from 15918 to 15795 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ca: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGSIZE changed from 2185 to 2144 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-cs: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-da: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-da: PKGSIZE changed from 18200 to 18077 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-da: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-de: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-de: PKGSIZE changed from 34599 to 32938 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-de: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-el: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-el: PKGSIZE changed from 21939 to 21816 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-el: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGSIZE changed from 27963 to 27840 (-0%)
packages/core2-32-poky-linux/bison/bison-locale-eo: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-es: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-es: PKGSIZE changed from 16721 to 16598 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-es: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-et: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-et: PKGSIZE changed from 31480 to 29987 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-et: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGSIZE changed from 1101 to 1060 (-4%)
packages/core2-32-poky-linux/bison/bison-locale-eu: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGSIZE changed from 19116 to 18993 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-fi: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGSIZE changed from 35497 to 33739 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-fr: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGSIZE changed from 17602 to 17479 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ga: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGSIZE changed from 3422 to 3340 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-gl: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGSIZE changed from 13359 to 13277 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-hr: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGSIZE changed from 3706 to 3624 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-hu: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGSIZE changed from 1341 to 1300 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-ia: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-id: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-id: PKGSIZE changed from 8473 to 8391 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-id: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-it: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-it: PKGSIZE changed from 9740 to 9617 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-it: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGSIZE changed from 34681 to 33097 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-ja: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGSIZE changed from 1390 to 1349 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-ko: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGSIZE changed from 1659 to 1618 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-ky: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGSIZE changed from 1484 to 1443 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-lt: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGSIZE changed from 1514 to 1473 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-lv: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGSIZE changed from 16429 to 16755 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-ms: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGSIZE changed from 6655 to 6532 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-nb: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGSIZE changed from 20632 to 20509 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-nl: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGSIZE changed from 19264 to 19141 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-pl: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGSIZE changed from 34667 to 32945 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGSIZE changed from 30895 to 29208 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-pt: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGSIZE changed from 6366 to 6243 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-ro: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGSIZE changed from 15636 to 15513 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-ru: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGSIZE changed from 581 to 540 (-7%)
packages/core2-32-poky-linux/bison/bison-locale-rw: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGSIZE changed from 904 to 863 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-sk: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGSIZE changed from 3674 to 3592 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-sl: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGSIZE changed from 1378 to 1337 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-sq: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGSIZE changed from 43121 to 41144 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-sr: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGSIZE changed from 33567 to 31977 (-5%)
packages/core2-32-poky-linux/bison/bison-locale-sv: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGSIZE changed from 1946 to 1905 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-ta: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-th: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-th: PKGSIZE changed from 2333 to 2292 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-th: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGSIZE changed from 16812 to 16689 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-tr: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGSIZE changed from 45377 to 43417 (-4%)
packages/core2-32-poky-linux/bison/bison-locale-uk: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGSIZE changed from 18841 to 18718 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-vi: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGSIZE changed from 15504 to 15381 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGSIZE changed from 26274 to 26151 (-0%)
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-src: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-src: PKGSIZE changed from 2351247 to 2351827 (+0%)
packages/core2-32-poky-linux/bison/bison-src: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison-staticdev: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison-staticdev: PKGSIZE changed from 6898 to 6894 (-0%)
packages/core2-32-poky-linux/bison/bison-staticdev: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison/bison: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison/bison: PKGSIZE changed from 1265901 to 1265908 (+0%)
packages/core2-32-poky-linux/bison/bison: PV changed from "3.7.2" to "3.7.3"
packages/core2-32-poky-linux/bison: PKGV changed from 3.7.2 [default] to 3.7.3 [default]
packages/core2-32-poky-linux/bison: PV changed from "3.7.2" to "3.7.3"

--===============2968998508861765033==--
