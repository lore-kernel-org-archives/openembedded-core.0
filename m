Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.39204.1605551303664222218
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id EB06138C06E3
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bison: upgrading to 3.7.4 SUCCEEDED
Message-ID: <MADEUP.164810677D2006B7.12355@lists.openembedded.org>
X-Groupsio-MsgNum: 144631
Content-Type: multipart/mixed; boundary="===============3463095402798756508=="

--===============3463095402798756508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bison* to *3.7.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bison-upgrade-3.7.3-3.7.4.patch
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

--===============3463095402798756508==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bison-upgrade-3.7.3-3.7.4.patch"

From cdc7d7d2b49da8678484134e2285877ba2088d1e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 12:58:33 +0000
Subject: [PATCH] bison: upgrade 3.7.3 -> 3.7.4

---
 meta/recipes-devtools/bison/{bison_3.7.3.bb => bison_3.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.3.bb => bison_3.7.4.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.3.bb b/meta/recipes-devtools/bison/bison_3.7.4.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.3.bb
rename to meta/recipes-devtools/bison/bison_3.7.4.bb
index 74532caec3..abccaf9958 100644
--- a/meta/recipes-devtools/bison/bison_3.7.3.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.4.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "88d9e36856b004c0887a12ba00ea3c47db388519629483dd8c3fce9694d4da6f"
+SRC_URI[sha256sum] = "a3b5813f48a11e540ef26f46e4d288c0c25c7907d9879ae50e430ec49f63c010"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.20.1


--===============3463095402798756508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bison/bison-dbg: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-dbg: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-dbg: PKGSIZE changed from 1893696 to 1893048 (-0%)
packages/core2-32-poky-linux/bison/bison-dev: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-dev: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-doc: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-doc: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-doc: PKGSIZE changed from 1029262 to 1030433 (+0%)
packages/core2-32-poky-linux/bison/bison-locale-af: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-af: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ast: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-be: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-be: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-bg: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ca: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-cs: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-da: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-da: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-de: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-de: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-el: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-el: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-eo: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-es: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-es: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-et: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-et: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-eu: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-fi: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-fr: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ga: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-gl: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-hr: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-hu: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ia: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-id: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-id: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-it: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-it: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ja: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ko: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ky: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-lt: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-lv: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ms: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGSIZE changed from 16755 to 17442 (+4%)
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-nb: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-nl: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-pl: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ro: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ru: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-rw: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-sk: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-sl: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-sq: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-sr: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-sv: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-ta: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-th: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-th: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-tr: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-uk: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-vi: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-src: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-src: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison-src: PKGSIZE changed from 2351827 to 2356149 (+0%)
packages/core2-32-poky-linux/bison/bison-staticdev: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison-staticdev: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison/bison: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/bison/bison: PKGSIZE changed from 1265908 to 1267791 (+0%)
packages/core2-32-poky-linux/bison: PKGV changed from 3.7.3 [default] to 3.7.4 [default]
packages/core2-32-poky-linux/bison: SRC_URI changed from "https://ftp.gnu.org/gnu/bison/bison-3.7.3.tar.xz file://add-with-bisonlocaledir.patch" to "https://ftp.gnu.org/gnu/bison/bison-3.7.4.tar.xz file://add-with-bisonlocaledir.patch"
packages/core2-32-poky-linux/bison: PV changed from "3.7.3" to "3.7.4"
packages/core2-32-poky-linux/glibc/glibc-dbg: PKGSIZE changed from 22734056 to 22733720 (-0%)
packages/core2-32-poky-linux/glibc/glibc-src: PKGSIZE changed from 14064172 to 14064221 (+0%)
packages/core2-32-poky-linux/glibc/glibc-staticdev: PKGSIZE changed from 20507140 to 20506968 (-0%)

--===============3463095402798756508==--
