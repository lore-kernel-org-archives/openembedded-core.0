Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.284.1615826520898310187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 95B2E38C127E
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.6.1 SUCCEEDED
Message-ID: <MADEUP.166C91A8EE46F440.29771@lists.openembedded.org>
X-Groupsio-MsgNum: 149485
Content-Type: multipart/mixed; boundary="===============7071143156208132205=="

--===============7071143156208132205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.6.0-4.6.1.patch
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

--===============7071143156208132205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.6.0" to "4.6.1"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 939130 to 940286 (+0%)
packages/core2-32-poky-linux/dnf: PKGV changed from 4.6.0 [default] to 4.6.1 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.6.0" to "4.6.1"

--===============7071143156208132205==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="0001-dnf-upgrade-4.6.0-4.6.1.patch"

From 6f2a59729f962740fa8eed5c6f117938701ab98d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 05:39:19 +0000
Subject: [PATCH] dnf: upgrade 4.6.0 -> 4.6.1

---
 meta/recipes-devtools/dnf/{dnf_4.6.0.bb => dnf_4.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.6.0.bb => dnf_4.6.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.6.0.bb b/meta/recipes-devtools/dnf/dnf_4.6.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.6.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.6.1.bb
index 6651e64352..ab0d7d3b37 100644
--- a/meta/recipes-devtools/dnf/dnf_4.6.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.6.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "c826d7db401ebf9b59b2fa74570a919e4af2673e"
+SRCREV = "f98356aff86e91bf3205da16333b5bf3d4f0f969"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


--===============7071143156208132205==--
