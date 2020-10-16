Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7C25438C1788
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.54.2 SUCCEEDED
Message-ID: <MADEUP.163E71D695FC04E1.21580@lists.openembedded.org>
X-Groupsio-MsgNum: 143434
Content-Type: multipart/mixed; boundary="===============4890965822896360300=="

--===============4890965822896360300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.54.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.48.0-0.54.2.patch
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

--===============4890965822896360300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGSIZE changed from 659 to 1683 (+155%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PKGSIZE changed from 1630 to 2159 (+32%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PKGSIZE changed from 3215 to 5273 (+64%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PKGSIZE changed from 463 to 1249 (+170%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PKGSIZE changed from 14266 to 23514 (+65%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGSIZE changed from 13570 to 27248 (+101%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGSIZE changed from 10773 to 21137 (+96%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PKGSIZE changed from 10312 to 18914 (+83%)

--===============4890965822896360300==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.48.0-0.54.2.patch"

From 1194be7e51fe77c0eebbe1e29a631e822825da0a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 03:19:07 +0000
Subject: [PATCH] libdnf: upgrade 0.48.0 -> 0.54.2

---
 .../libdnf/{libdnf_0.48.0.bb => libdnf_0.54.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.48.0.bb => libdnf_0.54.2.bb} (96%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
similarity index 96%
rename from meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
index 37991e6d80..2a05b9f534 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.54.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://enable_test_data_dir_set.patch \
            "
 
-SRCREV = "46a28d0cf09277fffc11392e5e362a2eda0d53a8"
+SRCREV = "c5f20d4f306f4d0f9d479be228bdc474968c8b60"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.18.4


--===============4890965822896360300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdnf: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 55462452 to 56243736 (+1%)
packages/core2-32-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dev: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-dev: PKGSIZE changed from 202058 to 202702 (+0%)
packages/core2-32-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-doc: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGSIZE changed from 659 to 1683 (+155%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PKGSIZE changed from 11032 to 10939 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PKGSIZE changed from 10668 to 10564 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGSIZE changed from 21569 to 22108 (+2%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PKGSIZE changed from 1630 to 2159 (+32%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PKGSIZE changed from 3215 to 5273 (+64%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PKGSIZE changed from 463 to 1249 (+170%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PKGSIZE changed from 10960 to 10867 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PKGSIZE changed from 14266 to 23514 (+65%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGSIZE changed from 10605 to 10525 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGSIZE changed from 20134 to 20630 (+2%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGSIZE changed from 21617 to 22096 (+2%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGSIZE changed from 10650 to 10535 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGSIZE changed from 13570 to 27248 (+101%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGSIZE changed from 10773 to 21137 (+96%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGSIZE changed from 20471 to 20936 (+2%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGSIZE changed from 26929 to 27609 (+3%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGSIZE changed from 11343 to 11251 (-1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PKGSIZE changed from 10312 to 18914 (+83%)
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-src: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7155954 to 7197954 (+1%)
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf: PKGV changed from 0.48.0 [default] to 0.54.2 [default]
packages/core2-32-poky-linux/libdnf/libdnf: PV changed from "0.48.0" to "0.54.2"
packages/core2-32-poky-linux/libdnf/libdnf: PKGSIZE changed from 5106568 to 5174734 (+1%)

--===============4890965822896360300==--
