Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A7C7EE39
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.107886.1682976349700546316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=PgL2FarF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010187d9352fb5-f69bc2f1-8a67-40f9-9249-ad163732ad05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w5So7AjnIxcsIgT3DP8j/jNuY6kAJko+7VCyPKtfi44=;
	b=PgL2FarF+OVOXPjbApjMAwhcxn5dBLsMevBisSVtKt9y9dxWH5YpM6I1+PiSB04p
	BL5TmNUmNo199/eneUzsJogunK/jJmx2ccSuSpKvRgaZ/HQGaULTD2B7/FxHvK00SbZ
	1SCKlRh3elFW8VCs9EbVANPeR6JGkhtJLKyTmKV4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976354;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w5So7AjnIxcsIgT3DP8j/jNuY6kAJko+7VCyPKtfi44=;
	b=iK/glo52Uy5Zwe+LWhdsJtcvZScJAFq2R5HHrXDiHm9CbFu7tZerk80Xkl5l37lQ
	Acz1yU/6H0Q8veorPLvbgy2ot1Fi5rkKQ5OBvMMTJ4Q8n+9EV05ShytqaTtQKLT/2Pw
	pwzn3KMpn6EeMOQvtHcwf/ZrpFT8O1q4kRj3JzGM=
Content-Type: multipart/mixed; boundary="===============5374942174567672085=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.ujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.15.0 SUCCEEDED
Message-ID: <01010187d9352fb5-f69bc2f1-8a67-40f9-9249-ad163732ad05-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180701

--===============5374942174567672085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iso-codes* to *4.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.13.0-4.15.0.patch
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
--===============5374942174567672085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: FILELIST: added "/usr/share/locale/ab/LC_MESSAGES/iso_639-5.mo /usr/share/locale/ab/LC_MESSAGES/iso_639_5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGSIZE changed from 541 to 924 (+71%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 315628 to 316015 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 88791 to 89119 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 92133 to 92636 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 93977 to 94308 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: FILELIST: added "/usr/share/locale/cy/LC_MESSAGES/iso_3166-2.mo /usr/share/locale/cy/LC_MESSAGES/iso_639-5.mo /usr/share/locale/cy/LC_MESSAGES/iso_639_5.mo /usr/share/locale/cy/LC_MESSAGES/iso_4217.mo /usr/share/locale/cy/LC_MESSAGES/iso_3166_2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 36476 to 99148 (+172%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 693041 to 693125 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 118166 to 118198 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGSIZE changed from 366549 to 366633 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 532420 to 532883 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 233932 to 234162 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGSIZE changed from 1790 to 1792 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 360376 to 378006 (+5%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43689 to 43975 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa-pk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 388272 to 388605 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 203404 to 203610 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGSIZE changed from 57738 to 64060 (+11%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 120857 to 121665 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes: PV changed from "4.13.0" to "4.15.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.13.0 [default] to 4.15.0 [default]
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-ro-md"

--===============5374942174567672085==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.13.0-4.15.0.patch"

RnJvbSBhZThmNTdmYTg5NzgzMjFjNzU0OTc3YTBkMTkzZmU1YjI0OTBkMmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMToxMjowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlz
by1jb2RlczogdXBncmFkZSA0LjEzLjAgLT4gNC4xNS4wCgotLS0KIC4uLi9pc28tY29kZXMve2lz
by1jb2Rlc180LjEzLjAuYmIgPT4gaXNvLWNvZGVzXzQuMTUuMC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy97aXNvLWNvZGVzXzQuMTMuMC5iYiA9PiBpc28tY29k
ZXNfNC4xNS4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lz
by1jb2Rlcy9pc28tY29kZXNfNC4xMy4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNv
ZGVzL2lzby1jb2Rlc180LjE1LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNvZGVzL2lzby1jb2Rlc180LjEzLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xNS4wLmJiCmlu
ZGV4IDE5NTA1ODNmNTkuLjZhZTZmZGY4Y2IgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMy4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xNS4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNF
ID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9z
YWxzYS5kZWJpYW4ub3JnL2lzby1jb2Rlcy10ZWFtL2lzby1jb2Rlcy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW47IgotU1JDUkVWID0gImFiNmIwMWQ1YjU2YWY3ZGE5ZjBkMmQxNjE5YTNj
Zjg0ZTQzZWQ3NmEiCitTUkNSRVYgPSAiNjliYTE2ZGFlZjNjNWM1ZTNjMThmMmQ5MTllMjUyOTZh
NGI5NDZiZSIKIAogIyBpbmhlcml0IGdldHRleHQgY2Fubm90IGJlIHVzZWQsIGJlY2F1c2UgaXQg
YWRkcyBnZXR0ZXh0LW5hdGl2ZSB0byBCQVNFREVQRU5EUyB3aGljaAogIyBhcmUgaW5oaWJpdGVk
IGJ5IGFsbGFyY2gKLS0gCjIuMzkuMgoK

--===============5374942174567672085==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-ab: FILELIST: added "/usr/share/locale/ab/LC_MESSAGES/iso_639_5.mo /usr/share/locale/ab/LC_MESSAGES/iso_639-5.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGSIZE changed from 541 to 924 (+71%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: FILELIST: added "/usr/share/locale/cy/LC_MESSAGES/iso_639_5.mo /usr/share/locale/cy/LC_MESSAGES/iso_639-5.mo /usr/share/locale/cy/LC_MESSAGES/iso_3166_2.mo /usr/share/locale/cy/LC_MESSAGES/iso_4217.mo /usr/share/locale/cy/LC_MESSAGES/iso_3166-2.mo"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGSIZE changed from 36476 to 99148 (+172%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGSIZE changed from 57738 to 64060 (+11%)
packages/all-poky-linux/iso-codes: PACKAGES: added "iso-codes-locale-ro-md"

--===============5374942174567672085==--

