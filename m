Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D6EECAA30
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:44 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web12.10519.1663251512678738194
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SRNZn8eA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101834183f9b9-5d423b93-c5e6-4672-89e9-5a39faca7c5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DE2sAqJAuskeVPLfdW0VaFWh+jqqa6XrW65PF43fYDk=;
	b=SRNZn8eAbfDCsgk6bKK3HFAF30qSTmAi/ApLxDUmNvbPsYdvDymEWOSpJBisZAWB
	TQlsJWNwS0T0h/kpRR14DgausweijsJ+YTHbcXTgik6qYrpCpqU4Odtfy6w/PtpzHnL
	Xe8vu8iGHfrCxD1K/Oxzw80TLoi0c8uyvpbl0OTE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DE2sAqJAuskeVPLfdW0VaFWh+jqqa6XrW65PF43fYDk=;
	b=K4mYapgizjFP81DU4eTd8sggZi6MeLnpRVRRVnLA6ACLNIovZ1oqtrp5bss6/hrt
	N/rtGGM5ED3MqugRi6np9CDXCEAte5G/VvfIJg6bPpL8K5TlLSRCSizFbvn5pzGZq9u
	tpYRxjwPrS5hp8/gugp/woSOpXAkX57g6mLbvhH4=
Content-Type: multipart/mixed; boundary="===============5333111996394595795=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.14.0 SUCCEEDED
Message-ID: 
 <010101834183f9b9-5d423b93-c5e6-4672-89e9-5a39faca7c5b-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170705

--===============5333111996394595795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.14.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.13.0-4.14.0.patch
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
--===============5333111996394595795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGSIZE changed from 2330 to 2855 (+23%)
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 16289 to 74173 (+355%)
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGSIZE changed from 8315 to 60991 (+634%)
packages/core2-32-poky-linux/dnf: PACKAGES: added "dnf-locale-zh-hans dnf-locale-bn"

--===============5333111996394595795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGSIZE changed from 2330 to 2855 (+23%)
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGSIZE changed from 50079 to 50062 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGSIZE changed from 50378 to 50262 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGSIZE changed from 50887 to 50784 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGSIZE changed from 83926 to 83819 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGSIZE changed from 79337 to 84360 (+6%)
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGSIZE changed from 26383 to 26333 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGSIZE changed from 38828 to 38724 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGSIZE changed from 84785 to 89227 (+5%)
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGSIZE changed from 22446 to 22386 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGSIZE changed from 90101 to 91403 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGSIZE changed from 94127 to 96256 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 88976 to 91128 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGSIZE changed from 3285 to 3223 (-2%)
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGSIZE changed from 92909 to 95040 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 16289 to 74173 (+355%)
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGSIZE changed from 59071 to 61210 (+4%)
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 100991 to 102671 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGSIZE changed from 8315 to 60991 (+634%)
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGSIZE changed from 9378 to 9277 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGSIZE changed from 91878 to 93367 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 31468 to 31365 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGSIZE changed from 5103 to 5022 (-2%)
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGSIZE changed from 6498 to 6448 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGSIZE changed from 89448 to 89918 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGSIZE changed from 58221 to 59633 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGSIZE changed from 94201 to 94680 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGSIZE changed from 87436 to 87611 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGSIZE changed from 35617 to 35543 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGSIZE changed from 116711 to 117259 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGSIZE changed from 19882 to 19823 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGSIZE changed from 6548 to 6487 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGSIZE changed from 41365 to 41283 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGSIZE changed from 88035 to 89365 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGSIZE changed from 5782 to 5715 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGSIZE changed from 90738 to 91179 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGSIZE changed from 118850 to 119421 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGSIZE changed from 82404 to 83624 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGSIZE changed from 72720 to 72596 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 946036 to 950126 (+0%)
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.13.0" to "4.14.0"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.13.0 [default] to 4.14.0 [default]
packages/core2-32-poky-linux/dnf: PACKAGES: added "dnf-locale-bn dnf-locale-zh-hans"

--===============5333111996394595795==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.13.0-4.14.0.patch"

RnJvbSBlNjVlNjA0MWFlZDVlZjgyYTA3NWU0ZjdmMTlmYTcwMWZkMmYxMGI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDg6MDA6MjggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xMy4wIC0+IDQuMTQuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL3tkbmZfNC4xMy4wLmJiID0+IGRuZl80LjE0LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi97ZG5mXzQuMTMuMC5iYiA9PiBkbmZfNC4xNC4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTMuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjEzLjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTQuMC5iYgppbmRleCBiZjg5Y2ViMjc1
Li40OGY3ZTI4NDE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80
LjEzLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNC4wLmJiCkBA
IC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUt
bWFuYWdlbWVudC9kbmYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gImVmMDllNDhmYzNlYmJiYWY0ZGZhNDc4ZTZlMDUzMjcwNjUwNmYwOTEi
CitTUkNSRVYgPSAiZTUwODc1YjNmNTc5MGY3MDcyMGJkYjY3MGUxZGQyYmY0ZDgyODc0NCIKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9
ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzEuMQoK

--===============5333111996394595795==--

