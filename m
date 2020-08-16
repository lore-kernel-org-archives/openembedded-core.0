Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.19792.1597558828235742254
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19124E02025; Sat, 15 Aug 2020 23:20:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53610E0202E
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:37 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bison: upgrading to 3.7.1 SUCCEEDED
Message-Id: <20200816062028.19124E02025@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:20:28 -0700 (PDT)
X-Groupsio-MsgNum: 141476
Content-Type: multipart/mixed; boundary="===============8870089057013016283=="

--===============8870089057013016283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bison* to *3.7.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-bison-upgrade-3.6.4-3.7.1.patch
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

--===============8870089057013016283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/bison/bison-dbg: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-dbg: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-dbg: PKGSIZE changed from 1567148 to 1897576 (+21%)
packages/core2-32-poky-linux/bison/bison-dev: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-dev: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-doc: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-doc: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-doc: PKGSIZE changed from 976555 to 1027730 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-af: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-af: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-af: PKGSIZE changed from 927 to 1371 (+48%)
packages/core2-32-poky-linux/bison/bison-locale-ast: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ast: PKGSIZE changed from 1393 to 1352 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-be: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-be: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-be: PKGSIZE changed from 1160 to 1762 (+52%)
packages/core2-32-poky-linux/bison/bison-locale-bg: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-bg: PKGSIZE changed from 41687 to 42526 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-ca: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ca: PKGSIZE changed from 15536 to 15919 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-cs: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGSIZE changed from 1716 to 2144 (+25%)
packages/core2-32-poky-linux/bison/bison-locale-da: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-da: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-da: PKGSIZE changed from 17865 to 18196 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-de: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-de: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-de: PKGSIZE changed from 31190 to 34634 (+11%)
packages/core2-32-poky-linux/bison/bison-locale-el: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-el: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-el: PKGSIZE changed from 22111 to 21988 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-eo: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-eo: PKGSIZE changed from 27653 to 27983 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-es: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-es: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-es: PKGSIZE changed from 16353 to 16730 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-et: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-et: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-et: PKGSIZE changed from 29839 to 31521 (+6%)
packages/core2-32-poky-linux/bison/bison-locale-eu: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-eu: PKGSIZE changed from 1032 to 1060 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-fi: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-fi: PKGSIZE changed from 18719 to 19109 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-fr: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-fr: PKGSIZE changed from 33587 to 35539 (+6%)
packages/core2-32-poky-linux/bison/bison-locale-ga: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ga: PKGSIZE changed from 17214 to 17605 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-gl: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGSIZE changed from 2899 to 3340 (+15%)
packages/core2-32-poky-linux/bison/bison-locale-hr: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-hr: PKGSIZE changed from 13481 to 13399 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-hu: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGSIZE changed from 3192 to 3624 (+14%)
packages/core2-32-poky-linux/bison/bison-locale-ia: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ia: PKGSIZE changed from 1341 to 1300 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-id: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-id: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-id: PKGSIZE changed from 8600 to 8518 (-1%)
packages/core2-32-poky-linux/bison/bison-locale-it: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-it: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-it: PKGSIZE changed from 9379 to 9755 (+4%)
packages/core2-32-poky-linux/bison/bison-locale-ja: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ja: PKGSIZE changed from 33094 to 34731 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-ko: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGSIZE changed from 931 to 1349 (+45%)
packages/core2-32-poky-linux/bison/bison-locale-ky: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ky: PKGSIZE changed from 1659 to 1618 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-lt: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-lt: PKGSIZE changed from 1484 to 1443 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-lv: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-lv: PKGSIZE changed from 1514 to 1473 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-ms: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ms: PKGSIZE changed from 15278 to 16033 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-nb: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-nb: PKGSIZE changed from 6666 to 6651 (-0%)
packages/core2-32-poky-linux/bison/bison-locale-nl: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-nl: PKGSIZE changed from 20249 to 20631 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-pl: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-pl: PKGSIZE changed from 18891 to 19266 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt-br: PKGSIZE changed from 32802 to 34705 (+6%)
packages/core2-32-poky-linux/bison/bison-locale-pt: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-pt: PKGSIZE changed from 29589 to 30933 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-ro: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ro: PKGSIZE changed from 6493 to 6370 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-ru: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ru: PKGSIZE changed from 15186 to 15691 (+3%)
packages/core2-32-poky-linux/bison/bison-locale-rw: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-rw: PKGSIZE changed from 581 to 540 (-7%)
packages/core2-32-poky-linux/bison/bison-locale-sk: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-sk: PKGSIZE changed from 785 to 863 (+10%)
packages/core2-32-poky-linux/bison/bison-locale-sl: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGSIZE changed from 3191 to 3592 (+13%)
packages/core2-32-poky-linux/bison/bison-locale-sq: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-sq: PKGSIZE changed from 1378 to 1337 (-3%)
packages/core2-32-poky-linux/bison/bison-locale-sr: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-sr: PKGSIZE changed from 37137 to 37616 (+1%)
packages/core2-32-poky-linux/bison/bison-locale-sv: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-sv: PKGSIZE changed from 31878 to 33603 (+5%)
packages/core2-32-poky-linux/bison/bison-locale-ta: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-ta: PKGSIZE changed from 1946 to 1905 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-th: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-th: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-th: PKGSIZE changed from 2333 to 2292 (-2%)
packages/core2-32-poky-linux/bison/bison-locale-tr: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-tr: PKGSIZE changed from 16466 to 16809 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-uk: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-uk: PKGSIZE changed from 43028 to 45475 (+6%)
packages/core2-32-poky-linux/bison/bison-locale-vi: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-vi: PKGSIZE changed from 18471 to 18854 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-cn: PKGSIZE changed from 15155 to 15490 (+2%)
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-locale-zh-tw: PKGSIZE changed from 25941 to 26261 (+1%)
packages/core2-32-poky-linux/bison/bison-src: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-src: FILELIST: directory renamed /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/glthread -> /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/glthread, directory renamed /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitset -> /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitset, removed "/usr/src/debug/bison/3.6.4-r0/build/lib/stdio.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/AnnotationList.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/symtab.c /usr/src/debug/bison/3.6.4-r0/build/lib/textstyle.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/obstack.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/getopt_int.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/Sbitset.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/conflicts.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/stdio-safer.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/complain.c /usr/src/debug/bison/3.6.4-r0/build/lib/string.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/gl_xli
 st.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/files.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/closeout.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/closure.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/get-errno.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fstrcmp.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fopen-safer.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/derives.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fcntl.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/Sbitset.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbfile.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/printf-parse.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/spawn-pipe.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/printf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/reader.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/error.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/reduce.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/dirname.h /usr/src/debug/bison/3.6.4-
 r0/bison-3.6.4/lib/gethrxtime.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbswidth.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/getopt-ext.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitrotate.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/wait-process.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/state.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/hard-locale.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xsize.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/symlist.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/sprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitsetv.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/c-strcasecmp.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/timespec.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/close-stream.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/localcharset.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xalloc-die.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print.c /usr/src/debug/bison/3.6.4-r0/bis
 on-3.6.4/lib/xmalloc.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/c-ctype.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/setlocale_null.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/lr0.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/memchr.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/vasnprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/c-strcaseeq.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/location.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/named-ref.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/state.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xstrndup.h /usr/src/debug/bison/3.6.4-r0/build/lib/fcntl.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/nullable.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/getopt.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/yyerror.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/hash.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fatal-signal.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/files.h /usr/src/de
 bug/bison/3.6.4-r0/bison-3.6.4/lib/gl_array_list.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/close-stream.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbchar.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/snprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xmemdup0.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/gram.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print-xml.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/basename-lgpl.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xalloc.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/relation.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/printf-args.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/vfprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/path-join.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/hash.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/timevar.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/tables.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbchar.h /usr/src/debug/bison/3.6.4-r0
 /bison-3.6.4/lib/exitfail.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/localcharset.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/InadequacyList.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/setlocale_null.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/relation.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/spawn-pipe.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/location.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print-graph.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbswidth.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/scan-skel.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/asnprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/main.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/timevar.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/quote.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fstrcmp.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/getargs.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/dup-safer.c /usr/src/debug/bison/3.6.4-r0/bison
 -3.6.4/lib/xstrndup.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/main.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/flex-scanner.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/scan-gram.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/gettime.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/argmatch.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fseterr.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xmemdup0.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print-graph.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitset.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fatal-signal.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/graphviz.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/uniqstr.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/lalr.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/lr0.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/wait-process.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/output.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/getopt1.c /us
 r/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/hard-locale.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/obstack.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xhash.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/muscle-tab.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fseterr.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/quotearg.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xtime.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/gethrxtime.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/ielr.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/symlist.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/reduce.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/concat-filename.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/complain.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/progname.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fpucw.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/pipe-safer.c /usr/src/debug/bison/3.6.4-r
 0/bison-3.6.4/src/graphviz.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/symtab.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/strerror_r.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/tables.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/gl_list.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/argmatch.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/path-join.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/get-errno.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/getopt-core.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/progname.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xconcat-filename.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/assoc.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/vasnprintf.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/sig-handler.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/parse-gram.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/reader.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/printf-args.c /usr/src/debug/bison/3.6.4-r0/bis
 on-3.6.4/src/named-ref.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/InadequacyList.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/c-strcase.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/concat-filename.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/assoc.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/closure.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/lalr.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/mbrtowc.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/output.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitset.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/gl_array_list.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/scan-code.h /usr/src/debug/bison/3.6.4-r0/build/lib/wchar.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/timevar.def /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/nullable.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/gram.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/ielr.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/muscle-tab.c /u
 sr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/quotearg.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fd-safer.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/xalloc-oversized.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/unistd-safer.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/getargs.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/printf-parse.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/bitsetv.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/diffseq.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/perror.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/derives.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/AnnotationList.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/fixits.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/exitfail.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/fixits.h /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/lib/fprintf.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/print-xml.c /usr/src/debug/bison/3.6.4-r0/bison-3.6.4/src/conflicts.c /usr/src/
 debug/bison/3.6.4-r0/bison-3.6.4/src/uniqstr.h", added "/usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/Sbitset.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xmemdup0.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/sprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_linked_list.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/printf-args.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/graphviz.c /usr/src/debug/bison/3.7.1-r0/build/lib/string.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/memchr.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_list.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/hard-locale.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/assoc.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anyrbtree_list1.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/complain.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/fixits.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/graphviz.h /usr/src/debug/bis
 on/3.7.1-r0/bison-3.7.1/lib/xalloc-oversized.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/c-strcaseeq.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/closure.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/get-errno.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fcntl.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print-graph.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/path-join.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xmalloc.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/pipe-safer.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/timevar.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/derives.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/uniqstr.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/AnnotationList.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/setlocale_null.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/path-join.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/InadequacyList.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anytree_oset.h /u
 sr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/fixits.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_rbtreehash_list.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/wait-process.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/lr0.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/muscle-tab.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/derivation.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/getopt-ext.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/closeout.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/timevar.def /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/InadequacyList.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/state-item.h /usr/src/debug/bison/3.7.1-r0/build/lib/unitypes.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/setlocale_null.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xtime.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/parse-simulation.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/localcharset.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/nu
 llable.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/state.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/getopt_int.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/lalr.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitset.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbswidth.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/obstack.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitsetv.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/printf-args.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/reader.c /usr/src/debug/bison/3.7.1-r0/build/lib/fcntl.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fstrcmp.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/hash.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/uniqstr.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/AnnotationList.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/vasprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/relation.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/getopt-core.h /usr/src/debug/bison/3.7
 .1-r0/bison-3.7.1/lib/stdio-safer.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/close-stream.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/timespec.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/symlist.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_rbtreehash_list.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/symtab.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/ielr.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/scan-code.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anylinked_list2.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_array_list.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/files.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fpucw.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/main.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_rbtree_ordered.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/glyphs.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/printf-parse.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/parse-gram.h /usr/src/debug/
 bison/3.7.1-r0/bison-3.7.1/lib/getopt.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/printf-parse.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/getopt1.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/perror.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/gram.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_array_list.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbfile.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/quote.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xalloc.h /usr/src/debug/bison/3.7.1-r0/build/lib/wchar.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/spawn-pipe.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/argmatch.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbswidth.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/state-item.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/muscle-tab.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/named-ref.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/g
 etargs.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/system.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/quotearg.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/progname.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anytree_list2.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/snprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/lssi.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/get-errno.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/hash.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/nullable.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/tables.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anyhash_primes.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/dup-safer.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/relation.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xconcat-filename.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/reduce.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/main.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/hard-locale.c
  /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anyhash2.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/reader.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fatal-signal.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_rbtree_oset.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/concat-filename.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/exitfail.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fstrcmp.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/location.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xstrndup.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitsetv.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/basename-lgpl.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/c-strcase.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/sig-handler.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/scan-gram.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/conflicts.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/derivation.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/a
 rgmatch.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/vfprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/complain.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/flex-scanner.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/output.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/unistd-safer.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/printf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/quotearg.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/counterexample.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print-graph.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_linked_list.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/closure.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/basename-lgpl.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/error.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/ielr.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anytreehash_list2.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/close-stream.h /usr/src/debug/bison/3.7.1-r0/bison
 -3.7.1/src/lalr.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/obstack.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/spawn-pipe.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/c-strcasecmp.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print-xml.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbchar.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/yyerror.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/output.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/files.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/unicodeio.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/wait-process.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gethrxtime.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/c-ctype.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/parse-simulation.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/lssi.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/tables.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anyrbtr
 ee_list2.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fd-safer.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/lr0.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xalloc-die.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbrtowc.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/assoc.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/scan-skel.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/localcharset.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/derives.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitset.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/vasnprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_rbtree_oset.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gethrxtime.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/progname.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/reduce.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_oset.h /usr/src/debug/bison/3.7.1-r0/build/lib/stdio.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fseterr.c /usr/src/debug/bi
 son/3.7.1-r0/bison-3.7.1/lib/timevar.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/asnprintf.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fseterr.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xsize.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_xlist.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/mbchar.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/conflicts.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/strerror_r.c /usr/src/debug/bison/3.7.1-r0/build/lib/unistr.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xhash.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/print-xml.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/symlist.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/counterexample.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/unistr/u8-uctomb-aux.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/gram.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/state.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/concat-filename.c /usr/src/debug/bison/3.7.1-r0/bis
 on-3.7.1/lib/unicodeio.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anytree_list1.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xmemdup0.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/symtab.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/diffseq.h /usr/src/debug/bison/3.7.1-r0/build/lib/textstyle.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fopen-safer.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/Sbitset.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/fatal-signal.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/exitfail.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/named-ref.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/location.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/bitrotate.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gettime.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/vasnprintf.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/xstrndup.c /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/glyphs.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib
 /gl_anyhash1.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anylinked_list1.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/lib/gl_anytreehash_list1.h /usr/src/debug/bison/3.7.1-r0/bison-3.7.1/src/getargs.h"
packages/core2-32-poky-linux/bison/bison-src: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-src: PKGSIZE changed from 1970354 to 2337483 (+19%)
packages/core2-32-poky-linux/bison/bison-staticdev: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison-staticdev: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison-staticdev: PKGSIZE changed from 6906 to 6898 (-0%)
packages/core2-32-poky-linux/bison/bison: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison/bison: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/bison/bison: PKGSIZE changed from 1168772 to 1265897 (+8%)
packages/core2-32-poky-linux/bison: PV changed from "3.6.4" to "3.7.1"
packages/core2-32-poky-linux/bison: PKGV changed from 3.6.4 [default] to 3.7.1 [default]
packages/core2-32-poky-linux/glibc/glibc-dbg: PKGSIZE changed from 22735648 to 22735528 (-0%)
packages/core2-32-poky-linux/glibc/glibc-src: PKGSIZE changed from 14063998 to 14064145 (+0%)
packages/core2-32-poky-linux/glibc/glibc-staticdev: PKGSIZE changed from 20519712 to 20519684 (-0%)
Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============8870089057013016283==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-bison-upgrade-3.6.4-3.7.1.patch"

From cb40b466afc99be029488c3c24a43c664f34c230 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 Aug 2020 15:48:33 +0000
Subject: [PATCH] bison: upgrade 3.6.4 -> 3.7.1

---
 meta/recipes-devtools/bison/{bison_3.6.4.bb => bison_3.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.6.4.bb => bison_3.7.1.bb} (94%)

diff --git a/meta/recipes-devtools/bison/bison_3.6.4.bb b/meta/recipes-devtools/bison/bison_3.7.1.bb
similarity index 94%
rename from meta/recipes-devtools/bison/bison_3.6.4.bb
rename to meta/recipes-devtools/bison/bison_3.7.1.bb
index f3d4d42442..a765a2380d 100644
--- a/meta/recipes-devtools/bison/bison_3.6.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            file://0001-bison-fix-the-parallel-build.patch \
            "
-SRC_URI[sha256sum] = "8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d"
+SRC_URI[sha256sum] = "55c215521a13982a9bee68cd42eed51a65713f96c530a739a57de4438ac1bb69"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.17.1


--===============8870089057013016283==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/bison/bison-dbg: PKGSIZE changed from 1567148 to 1897576 (+21%)
packages/core2-32-poky-linux/bison/bison-locale-af: PKGSIZE changed from 927 to 1371 (+48%)
packages/core2-32-poky-linux/bison/bison-locale-be: PKGSIZE changed from 1160 to 1762 (+52%)
packages/core2-32-poky-linux/bison/bison-locale-cs: PKGSIZE changed from 1716 to 2144 (+25%)
packages/core2-32-poky-linux/bison/bison-locale-de: PKGSIZE changed from 31190 to 34634 (+11%)
packages/core2-32-poky-linux/bison/bison-locale-gl: PKGSIZE changed from 2899 to 3340 (+15%)
packages/core2-32-poky-linux/bison/bison-locale-hu: PKGSIZE changed from 3192 to 3624 (+14%)
packages/core2-32-poky-linux/bison/bison-locale-ko: PKGSIZE changed from 931 to 1349 (+45%)
packages/core2-32-poky-linux/bison/bison-locale-sl: PKGSIZE changed from 3191 to 3592 (+13%)
packages/core2-32-poky-linux/bison/bison-src: PKGSIZE changed from 1970354 to 2337483 (+19%)
Changes to packages/x86_64-linux/binutils-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-musl-binutils was added
  /usr/bin/i686-poky-linux-musl was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-addr2line was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ar was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-as was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++filt was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-dwp was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-elfedit was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gprof was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.bfd was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ld.gold was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-nm was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objcopy was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-objdump was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-ranlib was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-readelf was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-size was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strings was added
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-strip was added
  /usr/lib/i686-poky-linux-musl was added
  /usr/lib/i686-poky-linux-musl/ldscripts was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_i386.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_iamcu.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_k1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_l1om.xwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.x was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xbn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xd was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xde was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xn was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xr was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xs was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsc was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsce was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xse was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xsw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xswe was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xu was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xw was added
  /usr/lib/i686-poky-linux-musl/ldscripts/elf_x86_64.xwe was added
  /sysroot-providers/virtual_i686-poky-linux-binutils was removed
  /usr/bin/i686-poky-linux was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-addr2line was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ar was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-as was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-c++filt was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-dwp was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-elfedit was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-gprof was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.bfd was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ld.gold was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-nm was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objcopy was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-objdump was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-ranlib was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-readelf was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-size was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strings was removed
  /usr/bin/i686-poky-linux/i686-poky-linux-strip was removed
  /usr/lib/i686-poky-linux was removed
  /usr/lib/i686-poky-linux/ldscripts was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_i386.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_k1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_l1om.xwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.x was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xd was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xde was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xn was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xr was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xs was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xse was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xu was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xw was removed
  /usr/lib/i686-poky-linux/ldscripts/elf_x86_64.xwe was removed

--===============8870089057013016283==--
