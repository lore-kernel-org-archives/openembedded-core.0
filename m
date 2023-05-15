Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D899AC88CB7
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.3708.1684186747281789608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CJGafmlR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188215a5939-5e3dc594-f25a-4f6a-8c38-abf0bdb016f6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KoQbcoHIxixHD8cNjiF8b1Uky54QjKHpWdcTZfY+v7E=;
	b=CJGafmlR/GLK7XWnwNCAqN63J3D4jE4A8QSCHYnTERr4c3vfLWNp59y6Q6B/JTK1
	EAdQOPPLIGL5iaUcjmUNJXosZck7tbWKgXywaCxniPVqFYVGQ2zH9rHD50bIOGTW2Le
	o63XRrTDy0Q1yq/5LKmEppmrhEa4UmxWvjhsIt1w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KoQbcoHIxixHD8cNjiF8b1Uky54QjKHpWdcTZfY+v7E=;
	b=rYIZI2IndyqL1eK8OAzmgkGITi01QYRlR/HUhhsOucrL6BLI4mI6lgL1czw3yFC0
	LS4BzpxLPRIXdYzWJ1O3O4Hg2bGC2TsEp/rQ2dUm7EKUkOHDAyikCJY0XTbjXJvisSB
	o34IexarWh5U7k6Xo9TweBE+byU4Mzm9BiopFbz8=
Content-Type: multipart/mixed; boundary="===============4157958942172061150=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 44.0 SUCCEEDED
Message-ID: <01010188215a5939-5e3dc594-f25a-4f6a-8c38-abf0bdb016f6-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181343

--===============4157958942172061150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gsettings-desktop-schemas* to *44.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-43.0-44.0.patch
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
--===============4157958942172061150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 4006 to 5482 (+37%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGSIZE changed from 113088 to 116224 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGSIZE changed from 102592 to 105311 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 119612 to 122848 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGSIZE changed from 108103 to 114383 (+6%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 117640 to 117667 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 6987 to 10204 (+46%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGSIZE changed from 26430 to 26811 (+1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGSIZE changed from 47589 to 59959 (+26%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGSIZE changed from 56063 to 60219 (+7%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGSIZE changed from 102959 to 103177 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGSIZE changed from 142864 to 146701 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "43.0" to "44.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/43/gsettings-desktop-schemas-43.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/44/gsettings-desktop-schemas-44.0.tar.xz;name=archive"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PKGV changed from 43.0 [default] to 44.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas: PV changed from "43.0" to "44.0"

--===============4157958942172061150==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-43.0-44.0.patch"

RnJvbSA1NmY0OGVjZWQzNWQ4ODcyM2VjMWZiMDE4NTI3MThlZWM2MGFkYzVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTc6MjU6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzOiB1cGdyYWRlIDQzLjAgLT4gNDQuMAoKLS0tCiAuLi5l
c2t0b3Atc2NoZW1hc180My4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDQuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy97Z3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hc180My4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVt
YXNfNDQuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQzLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVz
a3RvcC1zY2hlbWFzXzQ0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0
b3Atc2NoZW1hc180My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdz
LWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQ0LjAuYmIKaW5kZXgg
OTY2YTY3ZmVhZC4uOGUzMGQ1ZTUyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc180My4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0
aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDQuMC5iYgpAQCAtMTMsNCArMTMsNCBAQCBHTk9NRUJBU0VC
VUlMRENMQVNTID0gIm1lc29uIgogCiBpbmhlcml0IGdub21lYmFzZSBnc2V0dGluZ3MgZ29iamVj
dC1pbnRyb3NwZWN0aW9uIGdldHRleHQKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
NWQ1NTY4MjgyYWIzOGI5NTc1OWQ0MjU0MDFmNzQ3NmU1NmY4Y2JmMjYyOTg4NTU4NzQzOWY0M2Jk
MGI4NGJiZSIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImViMmRlNDVjYWQ5MDU5OTQ4
NDllNjQyYTYyM2FkZWI3NWQ0MWIyMWIwNjI2ZDQwZDJhMDdiOGVhMjgxZmVjMGUiCi0tIAoyLjM5
LjIKCg==

--===============4157958942172061150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ab: PKGSIZE changed from 4006 to 5482 (+37%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ka: PKGSIZE changed from 6987 to 10204 (+46%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGSIZE changed from 47589 to 59959 (+26%)

--===============4157958942172061150==--

