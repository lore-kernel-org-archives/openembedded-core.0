Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.12524.1602843683381519813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 60FEE38C1761
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.4.0 SUCCEEDED
Message-ID: <MADEUP.163E71D68271FFEA.13247@lists.openembedded.org>
X-Groupsio-MsgNum: 143427
Content-Type: multipart/mixed; boundary="===============1960429971728653762=="

--===============1960429971728653762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.2.23-4.4.0.patch
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

--===============1960429971728653762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGSIZE changed from 66662 to 82320 (+23%)
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 51722 to 69169 (+34%)
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 13940 to 15542 (+11%)
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 65779 to 92304 (+40%)
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGSIZE changed from 39058 to 83528 (+114%)
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 15026 to 32119 (+114%)
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGSIZE changed from 889 to 1477 (+66%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGSIZE changed from 58182 to 75787 (+30%)
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGSIZE changed from 90240 to 111906 (+24%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGSIZE changed from 56023 to 74470 (+33%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGSIZE changed from 53509 to 75401 (+41%)
packages/core2-32-poky-linux/dnf: PACKAGES: added "dnf-locale-vi"
Changes to packages/core2-32-poky-linux/dnf (sysroot):
  /usr/lib/python3.8/site-packages/dnf/cli/commands/history.py was added
  /usr/lib/python3.8/site-packages/dnf/transaction_sr.py was added

--===============1960429971728653762==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.2.23-4.4.0.patch"

From 6b19b4771d658934ce8c0cf555c59e18ae72694e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 02:44:09 +0000
Subject: [PATCH] dnf: upgrade 4.2.23 -> 4.4.0

---
 meta/recipes-devtools/dnf/{dnf_4.2.23.bb => dnf_4.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.2.23.bb => dnf_4.4.0.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.2.23.bb b/meta/recipes-devtools/dnf/dnf_4.4.0.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.2.23.bb
rename to meta/recipes-devtools/dnf/dnf_4.4.0.bb
index 8cfd4d0c89..dff6fe6c25 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.23.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.4.0.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "126d861812f827285960592359615ed7cb195aac"
+SRCREV = "b9b7623892f551da201bffd03187d703242b00e9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.18.4


--===============1960429971728653762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGSIZE changed from 37262 to 36991 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGSIZE changed from 51797 to 51247 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGSIZE changed from 52189 to 51769 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGSIZE changed from 78175 to 84388 (+8%)
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGSIZE changed from 59155 to 60661 (+3%)
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGSIZE changed from 24322 to 24084 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGSIZE changed from 39608 to 39365 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGSIZE changed from 66662 to 82320 (+23%)
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGSIZE changed from 23063 to 22854 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGSIZE changed from 29815 to 29915 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGSIZE changed from 85534 to 88724 (+4%)
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 51722 to 69169 (+34%)
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGSIZE changed from 3232 to 3285 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGSIZE changed from 82334 to 84649 (+3%)
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 13940 to 15542 (+11%)
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGSIZE changed from 55094 to 55536 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 65779 to 92304 (+40%)
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGSIZE changed from 9512 to 9623 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGSIZE changed from 39058 to 83528 (+114%)
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 15026 to 32119 (+114%)
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGSIZE changed from 889 to 1477 (+66%)
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGSIZE changed from 79822 to 85670 (+7%)
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGSIZE changed from 54345 to 54229 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGSIZE changed from 84109 to 90287 (+7%)
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGSIZE changed from 58182 to 75787 (+30%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGSIZE changed from 34072 to 33695 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGSIZE changed from 90240 to 111906 (+24%)
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGSIZE changed from 20552 to 20737 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGSIZE changed from 6476 to 6548 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGSIZE changed from 40383 to 39941 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGSIZE changed from 78713 to 85201 (+8%)
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGSIZE changed from 81091 to 86819 (+7%)
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGSIZE changed from 106258 to 113844 (+7%)
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGSIZE changed from 56023 to 74470 (+33%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGSIZE changed from 53509 to 75401 (+41%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 892574 to 924561 (+4%)
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.2.23" to "4.4.0"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.2.23 [default] to 4.4.0 [default]
packages/core2-32-poky-linux/dnf: PACKAGES: added "dnf-locale-vi"
packages/core2-32-poky-linux/dnf: PV changed from "4.2.23" to "4.4.0"
Changes to packages/core2-32-poky-linux/dnf (sysroot):
  /usr/lib/python3.8/site-packages/dnf/cli/commands/history.py was added
  /usr/lib/python3.8/site-packages/dnf/transaction_sr.py was added

--===============1960429971728653762==--
