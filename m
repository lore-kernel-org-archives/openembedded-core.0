Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89319C6FA93
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.847.1667349632999146985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dvwA2P09;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c86813-73c318a5-c5da-44a3-a194-44a5d9e20720-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=q4WSPT1etJU3xdmZ+2UCA918dvUb4Q68O4hHuGDwX2g=;
	b=dvwA2P09oT3RldSRPyTSXH/zWLBMHePytDr0ODVoxRH8Qekl+i/17L63isWajlUY
	KRJL6boUwDQ9SXMQMegoCEHkoT7d4I1pQgi/HiJupVQhfrLun7UxI1OIYO1t3jUnX4D
	u7iNaDtetLldUZMW3jVsv2XJezV88qJmuCuMhotg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=q4WSPT1etJU3xdmZ+2UCA918dvUb4Q68O4hHuGDwX2g=;
	b=HfOostBJT+grBWpyZegGNEYJ9XuhOGm+9ihdRm7K4ULIWJZA7CSHET3lYYqgQtfq
	NyktyOG6XyCWNEdv++W9hV8e+GBY66iDE/cZIQMWBzEK7CIw3P25XMpwAONt93J4H5U
	ig2Cs7L2NR7XYKkhFsEgmNHTxDjzz/ee6fRsyAOI=
Content-Type: multipart/mixed; boundary="===============1003277394015890650=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.2.1 SUCCEEDED
Message-ID: <0101018435c86813-73c318a5-c5da-44a3-a194-44a5d9e20720-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172535

--===============1003277394015890650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.2.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.2.0-3.2.1.patch
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
--===============1003277394015890650==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.2/libsoup-3.2.0.tar.xz" to "https://download.gnome.org/sources//libsoup/3.2/libsoup-3.2.1.tar.xz"
packages/core2-32-poky-linux/libsoup: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1617764 to 1618412 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGSIZE changed from 988464 to 988302 (-0%)
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ka: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGSIZE changed from 4184 to 4076 (-3%)
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1746245 to 1748815 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.2.0" to "3.2.1"
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.2.0 [default] to 3.2.1 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.2.0" to "3.2.1"

--===============1003277394015890650==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.2.0-3.2.1.patch"

RnJvbSAyZDkyNTVjZjg3ZGNhN2IwNThkMmQ3YWU1YWRmZTk4ZjAzNTcwODg0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMiBOb3YgMjAyMiAwMDowNzo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNvdXA6IHVwZ3JhZGUgMy4yLjAgLT4gMy4yLjEKCi0tLQogLi4uL2xpYnNvdXAve2xpYnNvdXBf
My4yLjAuYmIgPT4gbGlic291cF8zLjIuMS5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGlic291cC97bGlic291cF8zLjIuMC5iYiA9PiBsaWJzb3VwXzMuMi4xLmJi
fSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291
cF8zLjIuMC5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnNvdXAvbGlic291cF8zLjIuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9s
aWJzb3VwL2xpYnNvdXBfMy4yLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnNvdXAvbGlic291cF8zLjIuMS5iYgppbmRleCA2MGZiZWE1NTA0Li5kMTQ2NjdlYThlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJzb3VwL2xpYnNvdXBfMy4yLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlic291cC9saWJzb3VwXzMuMi4xLmJiCkBAIC0xMiw3
ICsxMiw3IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGxpYnhtbDIgc3Fs
aXRlMyBsaWJwc2wgbmdodHRwMiIKIFNIUlRfVkVSID0gIiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0
KCcuJylbMF19LiR7QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMV19IgogCiBTUkNfVVJJID0g
IiR7R05PTUVfTUlSUk9SfS9saWJzb3VwLyR7U0hSVF9WRVJ9L2xpYnNvdXAtJHtQVn0udGFyLnh6
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI4MzIzNzA2OThjYThmOWZiZjE3NGMzNDViNzNkODli
NjA1NjExMDNhNjI2YzJkZjcwNzI2YjA3MDdmNzliZDMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
YjFlYjNkMmMzYmU0OWZiYmQwNTFhNzFmNjUzMmM5NjI2YmNlY2VhNjk3ODMxOTA2OTBjZDdlNGRm
ZGYyOGYyOSIKIAogUFJPVklERVMgPSAibGlic291cC0zLjAiCiBDVkVfUFJPRFVDVCA9ICJsaWJz
b3VwIgotLSAKMi4zMS4xCgo=

--===============1003277394015890650==--

