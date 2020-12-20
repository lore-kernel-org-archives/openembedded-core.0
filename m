Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23884.1608473714106937002
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8B9D738C139E
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:14 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.24 SUCCEEDED
Message-ID: <MADEUP.165272529E2E2424.5278@lists.openembedded.org>
X-Groupsio-MsgNum: 145962
Content-Type: multipart/mixed; boundary="===============5590656565401179210=="

--===============5590656565401179210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk+3* to *3.24.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk-3-upgrade-3.24.23-3.24.24.patch
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

--===============5590656565401179210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PKGSIZE changed from 23600172 to 23641596 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-demo: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-demo: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PKGSIZE changed from 14311302 to 14324521 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-doc: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-doc: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-af: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-af: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-am: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-am: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-an: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-an: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ang: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ang: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ar: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ar: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-as: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-as: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ast: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ast: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az-ir: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az-ir: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be+latin: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be+latin: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bg: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bg: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn-in: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn-in: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-br: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-br: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bs: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bs: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PKGSIZE changed from 323579 to 324056 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ckb: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ckb: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-crh: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-crh: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PKGSIZE changed from 316189 to 317070 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cy: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cy: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-da: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-da: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-de: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-de: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-de: PKGSIZE changed from 322081 to 322559 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-dz: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-dz: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-el: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-el: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-el: PKGSIZE changed from 399798 to 382149 (-4%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en+shaw: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en+shaw: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-ca: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-ca: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-gb: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-gb: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-gb: PKGSIZE changed from 299916 to 298652 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eo: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eo: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PKGSIZE changed from 325078 to 325569 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-et: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-et: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PKGSIZE changed from 318382 to 318868 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PKGSIZE changed from 148463 to 154536 (+4%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fi: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fi: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PKGSIZE changed from 336089 to 336747 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fur: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fur: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ga: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ga: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gd: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gd: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PKGSIZE changed from 321524 to 319807 (-1%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gu: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gu: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PKGSIZE changed from 294335 to 293040 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hi: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hi: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PKGSIZE changed from 309936 to 310486 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hu: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hu: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hu: PKGSIZE changed from 321239 to 319439 (-1%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hy: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hy: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ia: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ia: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PKGSIZE changed from 304648 to 305188 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-io: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-io: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-is: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-is: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-it: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-it: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-it: PKGSIZE changed from 322690 to 323206 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ja: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ja: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ka: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ka: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kg: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kg: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kk: PKGSIZE changed from 148605 to 146600 (-1%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-km: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-km: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kn: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kn: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ko: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ko: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ku: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ku: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ky: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ky: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lg: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lg: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-li: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-li: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lt: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lt: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lt: PKGSIZE changed from 313441 to 314007 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lv: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lv: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lv: PKGSIZE changed from 311825 to 312249 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mai: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mai: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mi: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mi: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ml: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ml: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mn: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mn: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ms: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ms: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-my: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-my: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nb: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nb: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nb: PKGSIZE changed from 224516 to 225506 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nds: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nds: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ne: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ne: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nl: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nl: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nn: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nn: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nso: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nso: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-oc: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-oc: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-or: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-or: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pa: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pa: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PKGSIZE changed from 325098 to 325679 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ps: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ps: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGSIZE changed from 318545 to 319046 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PKGSIZE changed from 318107 to 318709 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PKGSIZE changed from 321995 to 322545 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ru: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ru: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-rw: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-rw: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-si: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-si: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sk: PKGSIZE changed from 314756 to 314999 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PKGSIZE changed from 310445 to 310928 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sq: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sq: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+ije: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+ije: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+latin: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PKGSIZE changed from 383015 to 386690 (+1%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PKGSIZE changed from 311233 to 311680 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ta: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ta: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-te: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-te: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tg: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tg: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-th: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-th: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PKGSIZE changed from 314145 to 312437 (-1%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tt: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tt: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ug: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ug: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PKGSIZE changed from 399358 to 400025 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ur: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ur: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-vi: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-vi: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-wa: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-wa: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-xh: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-xh: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-yi: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-yi: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-cn: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-cn: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-hk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-hk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-tw: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-tw: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PKGSIZE changed from 67306004 to 67204940 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-staticdev: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-staticdev: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk+3: PKGSIZE changed from 11281100 to 11278012 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-am-et: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-am-et: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cedilla: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cedilla: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-inuktitut: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-inuktitut: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ipa: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ipa: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-multipress: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-multipress: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-thai: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-thai: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-er: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-er: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-et: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-et: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-viqr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-viqr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-wayland: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-wayland: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-waylandgtk: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-waylandgtk: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-xim: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-xim: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-file: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-file: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-lpr: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-lpr: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.23.tar.xz file://0001-Hardcoded-libtool.patch file://0002-Do-not-try-to-initialize-GL-without-libGL.patch file://0003-Add-disable-opengl-configure-option.patch file://link_fribidi.patch" to "http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.24.tar.xz file://0001-Hardcoded-libtool.patch file://0002-Do-not-try-to-initialize-GL-without-libGL.patch file://0003-Add-disable-opengl-configure-option.patch file://link_fribidi.patch"
packages/core2-32-poky-linux/gtk+3: PV changed from "3.24.23" to "3.24.24"
packages/core2-32-poky-linux/gtk+3: PKGV changed from 3.24.23 [default] to 3.24.24 [default]
Changes to packages/core2-32-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgdk-3.so.0.2404.19 moved to /usr/lib/libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0.2404.19 moved to /usr/lib/libgtk-3.so.0.2404.20
  /usr/include/gtk-3.0/gtk/a11y/gtkplugaccessible.h was added
  /usr/include/gtk-3.0/gtk/a11y/gtksocketaccessible.h was added
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgdk-3.so.0.2404.19 moved to /usr/lib/libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0.2404.19 moved to /usr/lib/libgtk-3.so.0.2404.20
  /usr/include/gtk-3.0/gtk/a11y/gtkplugaccessible.h was added
  /usr/include/gtk-3.0/gtk/a11y/gtksocketaccessible.h was added

--===============5590656565401179210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgdk-3.so.0.2404.19 moved to /usr/lib/libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0.2404.19 moved to /usr/lib/libgtk-3.so.0.2404.20
  /usr/include/gtk-3.0/gtk/a11y/gtkplugaccessible.h was added
  /usr/include/gtk-3.0/gtk/a11y/gtksocketaccessible.h was added
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.19 to libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.19 to libgtk-3.so.0.2404.20
  /usr/lib/libgdk-3.so.0.2404.19 moved to /usr/lib/libgdk-3.so.0.2404.20
  /usr/lib/libgtk-3.so.0.2404.19 moved to /usr/lib/libgtk-3.so.0.2404.20
  /usr/include/gtk-3.0/gtk/a11y/gtkplugaccessible.h was added
  /usr/include/gtk-3.0/gtk/a11y/gtksocketaccessible.h was added

--===============5590656565401179210==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-gtk-3-upgrade-3.24.23-3.24.24.patch"

From a34a93e23b42cfce1a7065cbc6f4ddde15a3df4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 08:02:09 +0000
Subject: [PATCH] gtk+3: upgrade 3.24.23 -> 3.24.24

---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.23.bb => gtk+3_3.24.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.23.bb => gtk+3_3.24.24.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
index 338b7030e1..01a2a94ce3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.23.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.24.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "5d864d248357a2251545b3387b35942de5f66e4c66013f0962eb5cb6f8dae2b1"
+SRC_URI[sha256sum] = "cc9d4367c55b724832f6b09ab85481738ea456871f0381768a6a99335a98378a"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.20.1


--===============5590656565401179210==--
