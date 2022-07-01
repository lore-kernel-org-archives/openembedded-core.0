Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44F0CCA482
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 14:51:08 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web08.39317.1656687065030626361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 07:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=D7njDxNG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181ba3e748d-363e4cf6-1a43-49bc-a3b6-a686454b1530-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NrvdNzKUGpbq3g1y+nPzesNbIHRDilUuTIri7IDkZKE=;
	b=D7njDxNGHSjdAOT2ag2+oB096UwkYuTFQaCunxO4pcTaQr857E2+hmAQ+HJ55HlW
	5pDDT6MOyhIz6oxbV9Ipwdrp0JTG5yZ9KWl/eMjHD/FV/WP8gaiZWEs6bPOG3WpmTx2
	eF/PhvNNnQwiNglrViw4xrEucxhzOb8QMvrYpS9M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1656687064;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NrvdNzKUGpbq3g1y+nPzesNbIHRDilUuTIri7IDkZKE=;
	b=PsYI7dKcFDXZEEDKvtFzuSO5860JxpLkdTdjiovJubjLbQ26sSB/L9Rof1i98nG7
	bloLc2z9g8snioagM3bUUDM79a2U7P8pHP/hAMxjWapHuTLD26FzHPkFXZpcUPT6BRO
	vcAYFI9BqI320z4WGY0nEyskNHUZGZUAT8mwhOic=
Content-Type: multipart/mixed; boundary="===============8042977636660102998=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.0.7 SUCCEEDED
Message-ID: 
 <01010181ba3e748d-363e4cf6-1a43-49bc-a3b6-a686454b1530-000000@us-west-2.amazonses.com>
Date: Fri, 1 Jul 2022 14:51:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 14:51:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167526

--===============8042977636660102998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.0.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.0.6-3.0.7.patch
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
--===============8042977636660102998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.0/libsoup-3.0.6.tar.xz" to "https://download.gnome.org/sources//libsoup/3.0/libsoup-3.0.7.tar.xz"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1533952 to 1534464 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGSIZE changed from 977360 to 975345 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGSIZE changed from 4564 to 4364 (-4%)
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1645532 to 1647947 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-src: FILELIST: directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/http2 -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/http2, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/http1 -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/http1, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/auth -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/auth, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/content-decoder -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/content-decoder, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/cookies -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/cookies, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/hsts -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/hsts, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/li
 bsoup/cache -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/cache, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/websocket -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/websocket, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup, directory renamed /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/content-sniffer -> /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/content-sniffer, directory renamed /usr/src/debug/libsoup/3.0.6-r0/build/libsoup -> /usr/src/debug/libsoup/3.0.7-r0/build/libsoup, removed "/usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server-message-private.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-auth-domain-basic.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-message-body.c /usr/src/debug/libsoup/
 3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-path-map.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-auth-domain-digest.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-auth-domain.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server-io.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-auth-domain.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-path-map.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server-message.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-socket.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-server-message.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-message-body.h /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-socket.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-aut
 h-domain-digest.c /usr/src/debug/libsoup/3.0.6-r0/libsoup-3.0.6/libsoup/server/soup-auth-domain-basic.h", added "/usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain-basic.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-path-map.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server-message.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain-digest.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain-private.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-message-body.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server-message.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain-digest.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/ser
 ver/soup-path-map.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-socket.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-auth-domain-basic.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-socket.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server-message-private.h /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-server-io.c /usr/src/debug/libsoup/3.0.7-r0/libsoup-3.0.7/libsoup/server/soup-message-body.h"
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.0.6 [default] to 3.0.7 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PKGSIZE changed from 717728 to 717288 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.0.6" to "3.0.7"
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.0.6 [default] to 3.0.7 [default]

--===============8042977636660102998==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.0.6-3.0.7.patch"

From c52497eb1bbd274aeed4cc0792e8ce1f07a86ff9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Jul 2022 14:05:06 +0000
Subject: [PATCH] libsoup: upgrade 3.0.6 -> 3.0.7

---
 .../libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.6.bb => libsoup_3.0.7.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.6.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.6.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 17825ae6a4..59cc4a1d0a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
+SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.31.1


--===============8042977636660102998==--

