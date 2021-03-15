Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.323.1615826521444849066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5190838C1336
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 3.38.3 SUCCEEDED
Message-ID: <MADEUP.166C91A90DBEFDFD.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149502
Content-Type: multipart/mixed; boundary="===============5176205512700086126=="

--===============5176205512700086126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *3.38.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-3.38.2-3.38.3.patch
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

--===============5176205512700086126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGSIZE changed from 4213512 to 4213992 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-dbg: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-dev: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-dev: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-doc: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-doc: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-af: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-am: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-an: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ar: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-as: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ast: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-az: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be+latin: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-be: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bg: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn-in: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bn: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-br: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-bs: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca+valencia: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ca: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ckb: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cs: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-cy: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-da: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-de: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-dz: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-el: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en+shaw: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-ca: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-en-gb: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eo: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PKGSIZE changed from 81006 to 80959 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-es: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-et: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-eu: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fa: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fi: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGSIZE changed from 85776 to 85740 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fr: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-fur: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ga: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gl: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gu: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-gv: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-he: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hi: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hr: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hu: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-hy: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-id: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ig: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-is: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-it: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ja: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ka: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-km: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-kn: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ko: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ku: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-li: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lt: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-lv: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mai: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mg: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mi: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ml: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mn: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-mr: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ms: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGSIZE changed from 61794 to 63568 (+3%)
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nb: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nds: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ne: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nl: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-nn: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-oc: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-or: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pa: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pl: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ps: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt-br: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-pt: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ro: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ru: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-rw: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-si: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sl: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sq: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr+latin: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sr: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-sv: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ta: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-te: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tg: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-th: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-tr: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-ug: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz+cyrillic: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-uz: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-vi: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-wa: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-yo: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-cn: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-hk: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-locale-zh-tw: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGSIZE changed from 24156371 to 24156015 (-0%)
packages/core2-32-poky-linux/epiphany/epiphany-src: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-src: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany-staticdev: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany/epiphany: PKGSIZE changed from 3784316 to 3784366 (+0%)
packages/core2-32-poky-linux/epiphany/epiphany: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany/epiphany: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany: PV changed from "3.38.2" to "3.38.3"
packages/core2-32-poky-linux/epiphany: PKGV changed from 3.38.2 [default] to 3.38.3 [default]
packages/core2-32-poky-linux/epiphany: SRC_URI changed from "https://ftp.gnome.org/pub/GNOME/sources/epiphany/3.38/epiphany-3.38.2.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch" to "https://ftp.gnome.org/pub/GNOME/sources/epiphany/3.38/epiphany-3.38.3.tar.xz;name=archive file://0002-help-meson.build-disable-the-use-of-yelp.patch file://migrator.patch file://distributor.patch"

--===============5176205512700086126==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-3.38.2-3.38.3.patch"

From fd59212119918f2df0ec8e5e3e17d1d376a7eaa1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 10:53:50 +0000
Subject: [PATCH] epiphany: upgrade 3.38.2 -> 3.38.3

---
 .../epiphany/{epiphany_3.38.2.bb => epiphany_3.38.3.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.38.2.bb => epiphany_3.38.3.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
index 04f340f133..889de16d00 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.3.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "8b05f2bcc1e80ecf4a10f6f01b3285087eb4cbdf5741dffb8c0355715ef5116d"
+SRC_URI[archive.sha256sum] = "ce62c1fa3e442a9d6131fc884a6bc9a65cf06224c30d649c49624c2ebcb0d275"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.17.1


--===============5176205512700086126==--
