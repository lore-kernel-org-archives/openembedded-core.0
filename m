Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.32525.1624189110495043066
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 906A938C1170
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libdnf: upgrading to 0.63.1 SUCCEEDED
Message-ID: <MADEUP.168A47640C3972D7.8577@lists.openembedded.org>
X-Groupsio-MsgNum: 153104
Content-Type: multipart/mixed; boundary="===============8376194499747570827=="

--===============8376194499747570827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libdnf* to *0.63.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libdnf-upgrade-0.63.0-0.63.1.patch
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

--===============8376194499747570827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libdnf: PACKAGES: added "libdnf-locale-si"
packages/core2-32-poky-linux/libdnf: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGSIZE changed from 52458376 to 52841412 (+1%)
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-dbg: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-dev: PKGSIZE changed from 210427 to 210605 (+0%)
packages/core2-32-poky-linux/libdnf/libdnf-dev: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-dev: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-doc: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-doc: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-as: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bg: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn-in: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PKGSIZE changed from 467 to 3977 (+752%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ca: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-cs: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGSIZE changed from 1683 to 2683 (+59%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PKGSIZE changed from 10939 to 11076 (+1%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-de: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-el: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PKGSIZE changed from 10564 to 10916 (+3%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-es: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-eu: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fa: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PKGSIZE changed from 3723 to 24808 (+566%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fil: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGSIZE changed from 22108 to 26213 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-fur: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-gu: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hi: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-hu: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ia: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-id: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-is: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-it: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ja: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-kn: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGSIZE changed from 10525 to 26017 (+147%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-mai: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ml: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-mr: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nb: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGSIZE changed from 20630 to 24499 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-or: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PKGSIZE changed from 645 to 818 (+27%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGSIZE changed from 22096 to 26183 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGSIZE changed from 10535 to 17683 (+68%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGSIZE changed from 27248 to 32163 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sk: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sq: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr+latin: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sr: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGSIZE changed from 21137 to 25039 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-ta: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-te: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-th: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGSIZE changed from 20936 to 24929 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGSIZE changed from 27609 to 32660 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGSIZE changed from 11251 to 14040 (+25%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-tw: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGSIZE changed from 7252631 to 7259799 (+0%)
packages/core2-32-poky-linux/libdnf/libdnf-src: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-src: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf-staticdev: PKGV changed from 0.63.0 [default] to 0.63.1 [default]
packages/core2-32-poky-linux/libdnf/libdnf: PKGSIZE changed from 5274778 to 5287222 (+0%)
packages/core2-32-poky-linux/libdnf/libdnf: PV changed from "0.63.0" to "0.63.1"
packages/core2-32-poky-linux/libdnf/libdnf: PKGV changed from 0.63.0 [default] to 0.63.1 [default]

--===============8376194499747570827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libdnf: PACKAGES: added "libdnf-locale-si"
packages/core2-32-poky-linux/libdnf/libdnf-locale-bn: PKGSIZE changed from 467 to 3977 (+752%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-da: PKGSIZE changed from 1683 to 2683 (+59%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fi: PKGSIZE changed from 3723 to 24808 (+566%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-fr: PKGSIZE changed from 22108 to 26213 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ko: PKGSIZE changed from 10525 to 26017 (+147%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-nl: PKGSIZE changed from 20630 to 24499 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pa: PKGSIZE changed from 645 to 818 (+27%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pl: PKGSIZE changed from 22096 to 26183 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-pt-br: PKGSIZE changed from 10535 to 17683 (+68%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-ru: PKGSIZE changed from 27248 to 32163 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-sv: PKGSIZE changed from 21137 to 25039 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-tr: PKGSIZE changed from 20936 to 24929 (+19%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-uk: PKGSIZE changed from 27609 to 32660 (+18%)
packages/core2-32-poky-linux/libdnf/libdnf-locale-zh-cn: PKGSIZE changed from 11251 to 14040 (+25%)

--===============8376194499747570827==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libdnf-upgrade-0.63.0-0.63.1.patch"

From 910de88125f9fc8514319205bdcae1dc5dce5ac1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 08:40:14 +0000
Subject: [PATCH] libdnf: upgrade 0.63.0 -> 0.63.1

---
 .../libdnf/{libdnf_0.63.0.bb => libdnf_0.63.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.63.0.bb => libdnf_0.63.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
index a26ee55cb9..6ffeb945bb 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "669a5c691acba91693d238d6262ac99a440aa9b3"
+SRCREV = "8e451380bf84bd76e3925cbae2a06bb0e56f5cd9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


--===============8376194499747570827==--
