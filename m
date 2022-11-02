Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0542BC6370E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.844.1667349632518358541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P6yXLyyv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018435c85d92-f8ea81e3-6d4d-47c4-b7ea-e85b390eb8d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MAgr2REwqdmQjE1++Ho/+aTCCTaOMSqzDuuh75DdHgI=;
	b=P6yXLyyvoCwYIdZYp7jIyIXsdUqJL9uipakpltdsm3oCfCWxKF3GMfy5M7pvi0nO
	vBNPvVpUjBtXyH2DKUuNwXkQtU4yC0x9L89c+Fw0LAq1DVxoRHb+nwB7Vn37DwSGiE7
	+Bfr31bjorq56cP9+kwXF/cnIyhzZUh/y6Ov0yJM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MAgr2REwqdmQjE1++Ho/+aTCCTaOMSqzDuuh75DdHgI=;
	b=BApN4vxQBY0ZUngWGrz47cd2PwkU5Z4YScyq3VCzZGE6/3jYiSwNvOecSm9DTqs9
	PHsJU+uKYybGIiAyxVdSWIAm+LfA1O23d31fFdEtPEuq72KImbRMaSZ+okGppEmcj7l
	VCmU3XIcncWqMvK53QOY3mvetsx9z9hmkrI7KT2I=
Content-Type: multipart/mixed; boundary="===============6754434503586736432=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.42.10 SUCCEEDED
Message-ID: <0101018435c85d92-f8ea81e3-6d4d-47c4-b7ea-e85b390eb8d2-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172471

--===============6754434503586736432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdk-pixbuf* to *2.42.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gdk-pixbuf-upgrade-2.42.9-2.42.10.patch
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
--===============6754434503586736432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-bin: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: FILELIST: removed "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4200.9", added "/usr/lib/.debug/libgdk_pixbuf-2.0.so.0.4200.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGSIZE changed from 1603792 to 1603980 (+0%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dbg: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGSIZE changed from 488069 to 488106 (+0%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-dev: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-doc: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ani: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-bmp: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-gif: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-icns: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-ico: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-pnm: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-qtif: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-tga: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xbm: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-loader-xpm: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGSIZE changed from 568 to 1016 (+79%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-af: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ang: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ar: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-as: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ast: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-az: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be+latin: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-be: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bg: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn-in: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bn: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-br: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-bs: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca+valencia: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ca: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-crh: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cs: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-csb: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-cy: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-da: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-de: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-dz: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-el: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en+shaw: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-ca: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-en-gb: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eo: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-es: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-et: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-eu: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fa: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fi: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fr: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-fur: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ga: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gl: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-gu: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-he: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hi: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hr: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hu: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-hy: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ia: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-id: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-io: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-is: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-it: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ja: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ka: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-km: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-kn: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ko: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ku: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-li: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lt: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-lv: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mai: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mi: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ml: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mn: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-mr: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ms: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-my: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nb: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nds: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ne: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nl: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nn: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-nso: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-oc: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-or: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pa: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pl: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ps: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt-br: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-pt: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ro: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ru: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-si: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sl: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sq: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+ije: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr+latin: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sr: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-sv: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ta: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-te: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tg: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-th: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGSIZE changed from 21350 to 21356 (+0%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tr: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-tt: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ug: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz+cyrillic: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-uz: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-vi: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-wa: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-xh: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-yi: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-cn: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-hk: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-zh-tw: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-ptest: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGSIZE changed from 1242734 to 1242817 (+0%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-src: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-staticdev: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-xlib: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-xlib: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.9", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGSIZE changed from 242201 to 242202 (+0%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
packages/core2-32-poky-linux/gdk-pixbuf: PV changed from "2.42.9" to "2.42.10"
packages/core2-32-poky-linux/gdk-pixbuf: SRC_URI changed from "https://download.gnome.org/sources//gdk-pixbuf/2.42/gdk-pixbuf-2.42.9.tar.xz file://run-ptest file://fatal-loader.patch file://0001-Add-use_prebuilt_tools-option.patch" to "https://download.gnome.org/sources//gdk-pixbuf/2.42/gdk-pixbuf-2.42.10.tar.xz file://run-ptest file://fatal-loader.patch file://0001-Add-use_prebuilt_tools-option.patch"
packages/core2-32-poky-linux/gdk-pixbuf: PKGV changed from 2.42.9 [default] to 2.42.10 [default]
Changes to packages/core2-32-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.9 to libgdk_pixbuf-2.0.so.0.4200.10
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.10 was added
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.9 was removed
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.9 to libgdk_pixbuf-2.0.so.0.4200.10
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.10 was added
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.9 was removed

--===============6754434503586736432==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gdk-pixbuf-upgrade-2.42.9-2.42.10.patch"

RnJvbSAwYzhmZDAxZGM4OGE2NWUwMDcyZGIzYmEwYmQ1NDNkYjVhZGFiMjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNDoyNToxMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdk
ay1waXhidWY6IHVwZ3JhZGUgMi40Mi45IC0+IDIuNDIuMTAKCi0tLQogLi4uL2dkay1waXhidWYv
e2dkay1waXhidWZfMi40Mi45LmJiID0+IGdkay1waXhidWZfMi40Mi4xMC5iYn0gIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYve2dkay1waXhidWZfMi40Mi45LmJiID0+IGdkay1w
aXhidWZfMi40Mi4xMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
Z2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDIuOS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9nZGst
cGl4YnVmL2dkay1waXhidWZfMi40Mi4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZ2RrLXBpeGJ1Zi9nZGstcGl4YnVmXzIuNDIuOS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2dkay1waXhidWYvZ2RrLXBpeGJ1Zl8yLjQyLjEw
LmJiCmluZGV4IGQzMzcxOGUzZWEuLmFhNDQ1MTVmYmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40Mi45LmJiCisrKyBiL21ldGEvcmVjaXBl
cy1nbm9tZS9nZGstcGl4YnVmL2dkay1waXhidWZfMi40Mi4xMC5iYgpAQCAtMjMsNyArMjMsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0JQTn0vJHtNQUpfVkVSfS8ke0JQTn0tJHtQ
Vn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLXVzZV9wcmVidWlsdF90b29s
cy1vcHRpb24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIy
OGY3OTU4ZTdiZjI5YTMyZDRlOTYzNTU2ZDI0MWQwYTQxYTY3ODY1ODJmZjZhNWFkMTE2NjVlMDM0
N2ZjOTYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVlOWI2Yzc1ZDEzYmEwOTY5MDdhMmUzYzZi
MjdiNjFiY2QxN2Y1YzdlYmVhYjVhNWI0MzlkMmYyZTM5ZmU0NGIiCiAKIGluaGVyaXQgbWVzb24g
cGtnY29uZmlnIGdldHRleHQgcGl4YnVmY2FjaGUgcHRlc3QtZ25vbWUgdXBzdHJlYW0tdmVyc2lv
bi1pcy1ldmVuIGdvYmplY3QtaW50cm9zcGVjdGlvbiBnaS1kb2NnZW4gbGliX3BhY2thZ2UKIAot
LSAKMi4zMS4xCgo=

--===============6754434503586736432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf-locale-ab: PKGSIZE changed from 568 to 1016 (+79%)
packages/core2-32-poky-linux/gdk-pixbuf/gdk-pixbuf: FILELIST: removed "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.9", added "/usr/lib/libgdk_pixbuf-2.0.so.0.4200.10"
Changes to packages/core2-32-poky-linux/gdk-pixbuf (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.9 to libgdk_pixbuf-2.0.so.0.4200.10
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.10 was added
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.9 was removed
Changes to packages/x86_64-linux/gdk-pixbuf-native (sysroot):
  /usr/lib/libgdk_pixbuf-2.0.so.0 changed symlink target from libgdk_pixbuf-2.0.so.0.4200.9 to libgdk_pixbuf-2.0.so.0.4200.10
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.10 was added
  /usr/lib/libgdk_pixbuf-2.0.so.0.4200.9 was removed

--===============6754434503586736432==--

