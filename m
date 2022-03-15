Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC00C4167E
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:55 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.10485.1647349734621607279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=8gu5uMX3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f8db21985-d6bc2276-c7df-4923-a88d-b696da695aaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ylR7trURiHCsuZHQRbHDlMOGbsZ8ceFCYpCz3f9+DmE=;
	b=8gu5uMX3D8iQGRF5/DzjPUJ+lVGEq+LxEgbWjba1XqRzTQEUk9E3y/sqxmq85iAz
	jRYLAIytBMSiIJaNxpFrejiyWwwQ/FdAYEPCl3IygIZeQ+QPeruTVl51v1rEWL0fOBr
	DvEl3T5dUXWO7cQj7ELPhjZiDNwAp5kWrFppm0iA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349734;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ylR7trURiHCsuZHQRbHDlMOGbsZ8ceFCYpCz3f9+DmE=;
	b=FMvh4WOw+1f8bCIlw/RTktTq3rU2CRamcZSDDThKo9ng0xqSnp8i5WhEPcCga8YB
	teN7M5qW05WvScdD77XoCJUUvaQqHDucl/+S8477prG5fMNJyGVxigztevk406dRbCn
	k7k20yNH0y59ZKWw2udp0WgLa7LPYsQG6CQtnkD4=
Content-Type: multipart/mixed; boundary="===============0545098541696978123=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.11.1 SUCCEEDED
Message-ID: 
 <0101017f8db21985-d6bc2276-c7df-4923-a88d-b696da695aaa-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:53 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163246

--===============0545098541696978123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.11.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.10.0-4.11.1.patch
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
--===============0545098541696978123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGSIZE changed from 50125 to 50079 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGSIZE changed from 50446 to 50378 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGSIZE changed from 50929 to 50887 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGSIZE changed from 84167 to 83926 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGSIZE changed from 60774 to 79337 (+31%)
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGSIZE changed from 24006 to 26383 (+10%)
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGSIZE changed from 38869 to 38828 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGSIZE changed from 81444 to 84785 (+4%)
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGSIZE changed from 22499 to 22446 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGSIZE changed from 90513 to 90101 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGSIZE changed from 94771 to 94127 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 67939 to 88976 (+31%)
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGSIZE changed from 473 to 436 (-8%)
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGSIZE changed from 83040 to 92909 (+12%)
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGSIZE changed from 15783 to 16289 (+3%)
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGSIZE changed from 57126 to 59071 (+3%)
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 90245 to 100991 (+12%)
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGSIZE changed from 9425 to 9378 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGSIZE changed from 92259 to 91878 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGSIZE changed from 31388 to 31468 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGSIZE changed from 2067 to 1983 (-4%)
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGSIZE changed from 5169 to 5103 (-1%)
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGSIZE changed from 88934 to 89448 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGSIZE changed from 55881 to 58221 (+4%)
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGSIZE changed from 93648 to 94201 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGSIZE changed from 85646 to 87436 (+2%)
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGSIZE changed from 35666 to 35617 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGSIZE changed from 116013 to 116711 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGSIZE changed from 361 to 708 (+96%)
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGSIZE changed from 20325 to 19882 (-2%)
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGSIZE changed from 41411 to 41365 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGSIZE changed from 88385 to 88035 (-0%)
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGSIZE changed from 90180 to 90738 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGSIZE changed from 118138 to 118850 (+1%)
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGSIZE changed from 82255 to 82404 (+0%)
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGSIZE changed from 73878 to 72720 (-2%)
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.10.0 [default] to 4.11.1 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 941924 to 943913 (+0%)
packages/core2-32-poky-linux/dnf: PV changed from "4.10.0" to "4.11.1"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.10.0 [default] to 4.11.1 [default]

--===============0545098541696978123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGSIZE changed from 60774 to 79337 (+31%)
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGSIZE changed from 67939 to 88976 (+31%)
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGSIZE changed from 83040 to 92909 (+12%)
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGSIZE changed from 90245 to 100991 (+12%)
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGSIZE changed from 361 to 708 (+96%)

--===============0545098541696978123==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.10.0-4.11.1.patch"

From 33a1ba2e357d17e2bf98fde6c5a216afe3c45e18 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 07:24:20 +0000
Subject: [PATCH] dnf: upgrade 4.10.0 -> 4.11.1

---
 meta/recipes-devtools/dnf/{dnf_4.10.0.bb => dnf_4.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.10.0.bb => dnf_4.11.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.10.0.bb b/meta/recipes-devtools/dnf/dnf_4.11.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.10.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.11.1.bb
index f16e716b0d..00eed0ce96 100644
--- a/meta/recipes-devtools/dnf/dnf_4.10.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.11.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
            file://0001-dnf-write-the-log-lock-to-root.patch \
            "
 
-SRCREV = "bd691b784f2158e633072d368579898d740e4347"
+SRCREV = "fba1e2ec93f3d045a874567fd7ecafd606346509"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.27.0


--===============0545098541696978123==--

