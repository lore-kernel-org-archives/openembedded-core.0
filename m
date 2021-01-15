Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.721.1610713822642426781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4BE3938C13AE
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wget: upgrading to 1.21.1 SUCCEEDED
Message-ID: <MADEUP.165A67B052C0A445.24772@lists.openembedded.org>
X-Groupsio-MsgNum: 146782
Content-Type: multipart/mixed; boundary="===============0410544498409198090=="

--===============0410544498409198090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wget* to *1.21.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wget-upgrade-1.20.3-1.21.1.patch
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

--===============0410544498409198090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ko wget-locale-ms wget-locale-rw wget-locale-af"
packages/core2-32-poky-linux/wget/wget-dev: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-doc: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-be: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGSIZE changed from 10201 to 16681 (+64%)
packages/core2-32-poky-linux/wget/wget-locale-bg: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ca: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-cs: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGSIZE changed from 23518 to 27195 (+16%)
packages/core2-32-poky-linux/wget/wget-locale-da: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-de: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-el: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-eo: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-es: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-et: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-eu: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-fi: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-fr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ga: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGSIZE changed from 21713 to 24196 (+11%)
packages/core2-32-poky-linux/wget/wget-locale-gl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-he: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-hr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-hu: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 33599 to 30193 (-10%)
packages/core2-32-poky-linux/wget/wget-locale-id: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-it: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ja: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-lt: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-nb: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-nl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pt: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 8754 to 78687 (+799%)
packages/core2-32-poky-linux/wget/wget-locale-ro: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ru: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sk: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 24253 to 28068 (+16%)
packages/core2-32-poky-linux/wget/wget-locale-sl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sv: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-tr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-uk: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-vi: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-staticdev: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"

--===============0410544498409198090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-wget-upgrade-1.20.3-1.21.1.patch"

From 226973660a7ac7be9b6d6fbc19c3ff2fb50896a6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 15 Jan 2021 07:08:18 +0000
Subject: [PATCH] wget: upgrade 1.20.3 -> 1.21.1

---
 meta/recipes-extended/wget/{wget_1.20.3.bb => wget_1.21.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.20.3.bb => wget_1.21.1.bb} (49%)

diff --git a/meta/recipes-extended/wget/wget_1.20.3.bb b/meta/recipes-extended/wget/wget_1.21.1.bb
similarity index 49%
rename from meta/recipes-extended/wget/wget_1.20.3.bb
rename to meta/recipes-extended/wget/wget_1.21.1.bb
index 4fa273d093..21385bbfb2 100644
--- a/meta/recipes-extended/wget/wget_1.20.3.bb
+++ b/meta/recipes-extended/wget/wget_1.21.1.bb
@@ -2,7 +2,6 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
           "
 
-SRC_URI[md5sum] = "db4e6dc7977cbddcd543b240079a4899"
-SRC_URI[sha256sum] = "31cccfc6630528db1c8e3a06f6decf2a370060b982841cfab2b8677400a5092e"
+SRC_URI[sha256sum] = "59ba0bdade9ad135eda581ae4e59a7a9f25e3a4bde6a5419632b31906120e26e"
 
 require wget.inc
-- 
2.27.0


--===============0410544498409198090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wget: PACKAGES: added "wget-locale-ms wget-locale-rw wget-locale-ko wget-locale-af"
packages/core2-32-poky-linux/wget: SRC_URI changed from "https://ftp.gnu.org/gnu/wget/wget-1.20.3.tar.gz file://0002-improve-reproducibility.patch" to "https://ftp.gnu.org/gnu/wget/wget-1.21.1.tar.gz file://0002-improve-reproducibility.patch"
packages/core2-32-poky-linux/wget: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-dbg: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-dbg: PKGSIZE changed from 1486504 to 1503028 (+1%)
packages/core2-32-poky-linux/wget/wget-dbg: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-dbg: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-dev: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-dev: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-dev: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-doc: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-doc: PKGSIZE changed from 232553 to 233670 (+0%)
packages/core2-32-poky-linux/wget/wget-doc: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-doc: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-be: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGSIZE changed from 23204 to 23843 (+3%)
packages/core2-32-poky-linux/wget/wget-locale-be: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-be: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-bg: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGSIZE changed from 10201 to 16681 (+64%)
packages/core2-32-poky-linux/wget/wget-locale-bg: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-bg: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-ca: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGSIZE changed from 37409 to 34697 (-7%)
packages/core2-32-poky-linux/wget/wget-locale-ca: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-ca: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-cs: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGSIZE changed from 85864 to 86576 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-cs: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-cs: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-da: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGSIZE changed from 23518 to 27195 (+16%)
packages/core2-32-poky-linux/wget/wget-locale-da: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-da: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-de: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-de: PKGSIZE changed from 88393 to 89437 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-de: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-de: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-el: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-el: PKGSIZE changed from 10815 to 11443 (+6%)
packages/core2-32-poky-linux/wget/wget-locale-el: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-el: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-en-gb: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGSIZE changed from 8406 to 8365 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-en-gb: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-eo: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGSIZE changed from 79856 to 81112 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-eo: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-eo: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-es: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-es: PKGSIZE changed from 72421 to 72518 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-es: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-es: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-et: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-et: PKGSIZE changed from 78148 to 78405 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-et: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-et: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-eu: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-eu: PKGSIZE changed from 9953 to 10556 (+6%)
packages/core2-32-poky-linux/wget/wget-locale-eu: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-eu: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-fi: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGSIZE changed from 62292 to 65661 (+5%)
packages/core2-32-poky-linux/wget/wget-locale-fi: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-fi: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-fr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGSIZE changed from 80706 to 87606 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-fr: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-fr: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-ga: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGSIZE changed from 77069 to 76717 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-ga: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-ga: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-gl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGSIZE changed from 21713 to 24196 (+11%)
packages/core2-32-poky-linux/wget/wget-locale-gl: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-gl: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-he: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-he: PKGSIZE changed from 7171 to 7130 (-1%)
packages/core2-32-poky-linux/wget/wget-locale-he: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-he: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-hr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGSIZE changed from 84335 to 80862 (-4%)
packages/core2-32-poky-linux/wget/wget-locale-hr: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-hr: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-hu: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGSIZE changed from 82324 to 82226 (-0%)
packages/core2-32-poky-linux/wget/wget-locale-hu: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-hu: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-id: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGSIZE changed from 33599 to 30193 (-10%)
packages/core2-32-poky-linux/wget/wget-locale-id: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-id: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-it: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-it: PKGSIZE changed from 85832 to 87168 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-it: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-it: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-ja: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGSIZE changed from 90226 to 91080 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-ja: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-ja: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-lt: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGSIZE changed from 15811 to 15711 (-1%)
packages/core2-32-poky-linux/wget/wget-locale-lt: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-lt: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-nb: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGSIZE changed from 80964 to 76055 (-6%)
packages/core2-32-poky-linux/wget/wget-locale-nb: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-nb: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-nl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGSIZE changed from 64400 to 65087 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-nl: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-nl: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-pl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGSIZE changed from 83623 to 84935 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-pl: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-pl: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt-br: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGSIZE changed from 79150 to 85936 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-pt-br: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-pt: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGSIZE changed from 81160 to 82478 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-pt: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-pt: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-ro: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGSIZE changed from 8754 to 78687 (+799%)
packages/core2-32-poky-linux/wget/wget-locale-ro: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-ro: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-ru: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGSIZE changed from 102908 to 104509 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-ru: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-ru: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-sk: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGSIZE changed from 82952 to 79958 (-4%)
packages/core2-32-poky-linux/wget/wget-locale-sk: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-sk: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-sl: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGSIZE changed from 24253 to 28068 (+16%)
packages/core2-32-poky-linux/wget/wget-locale-sl: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-sl: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-sr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGSIZE changed from 95403 to 103896 (+9%)
packages/core2-32-poky-linux/wget/wget-locale-sr: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-sr: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-sv: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGSIZE changed from 81300 to 82430 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-sv: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-sv: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-tr: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGSIZE changed from 76533 to 73064 (-5%)
packages/core2-32-poky-linux/wget/wget-locale-tr: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-tr: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-uk: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGSIZE changed from 103622 to 105151 (+1%)
packages/core2-32-poky-linux/wget/wget-locale-uk: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-uk: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-vi: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGSIZE changed from 82674 to 82728 (+0%)
packages/core2-32-poky-linux/wget/wget-locale-vi: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-vi: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGSIZE changed from 76565 to 78202 (+2%)
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-zh-cn: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGSIZE changed from 78397 to 77783 (-1%)
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-locale-zh-tw: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-src: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-src: PKGSIZE changed from 2394739 to 2550654 (+7%)
packages/core2-32-poky-linux/wget/wget-src: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-src: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget-staticdev: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget-staticdev: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget-staticdev: PKGV changed from 1.20.3 [default] to 1.21.1 [default]
packages/core2-32-poky-linux/wget/wget: FILELIST: added "/usr/share/locale/zh_TW/LC_MESSAGES/wget-gnulib.mo"
packages/core2-32-poky-linux/wget/wget: PKGSIZE changed from 588977 to 616081 (+5%)
packages/core2-32-poky-linux/wget/wget: PV changed from "1.20.3" to "1.21.1"
packages/core2-32-poky-linux/wget/wget: PKGV changed from 1.20.3 [default] to 1.21.1 [default]

--===============0410544498409198090==--
