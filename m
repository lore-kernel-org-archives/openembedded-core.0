Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E045FC4708C
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:44 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.10560.1648819422591217449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=AqJBYDy8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 0101017fe54bc211-9b3215dc-2e6c-44dc-ba7c-c19cb870d1f1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yb0AWBSL/pOyoyodcI8uVihK6/xEEp3+T1DlsqA3Cs8=;
	b=AqJBYDy8FUok0lP6NnOHeh9gDXSapC33wtKD0Nr1y+ZksDnro4WYo6yUt9VvT8ex
	bH8mm1cX8zbp9Y232tepL6DrVuPcobKEBDUSg67ru+PouA/be+HCS1UnE++NEXhcU3W
	uD4wMnyNDAFIX9aDltVvIObmh5xUf/XmmEhuoeCs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819421;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yb0AWBSL/pOyoyodcI8uVihK6/xEEp3+T1DlsqA3Cs8=;
	b=kpnWdNeDcp5Tqmw1YiBYx313LkxeUcRiFAENRrsNFuaspcmqsM5wi/O0JRcZwSrQ
	5yA4Oh8m+1slY21EU6eM2S87x7X3dpUGYr9JEVnb7R4rOf21wzHJ47rBDRO2oWTuJ2D
	GpgTAdquuaLWehHCFZMJDmBKkOgHhKeEUfgWjHZ4=
Content-Type: multipart/mixed; boundary="===============5892154936124350327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libsoup: upgrading to 3.0.6 SUCCEEDED
Message-ID: 
 <0101017fe54bc211-9b3215dc-2e6c-44dc-ba7c-c19cb870d1f1-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163937

--===============5892154936124350327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsoup* to *3.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsoup-upgrade-3.0.5-3.0.6.patch
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
--===============5892154936124350327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsoup: SRC_URI changed from "https://download.gnome.org/sources//libsoup/3.0/libsoup-3.0.5.tar.xz" to "https://download.gnome.org/sources//libsoup/3.0/libsoup-3.0.6.tar.xz"
packages/core2-32-poky-linux/libsoup: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGSIZE changed from 1535048 to 1536384 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-dbg: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-dev: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-dev: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-doc: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-doc: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ab: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-an: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-as: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-be: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bg: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bn-in: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-bs: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca+valencia: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ca: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-cs: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-da: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-de: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-el: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-en-gb: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eo: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-es: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-et: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-eu: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fa: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fi: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fr: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-fur: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gd: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gl: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-gu: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-he: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hi: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hr: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-hu: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-id: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-it: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ja: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-kn: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ko: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lt: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-lv: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ml: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-mr: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ms: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nb: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ne: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-nl: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-oc: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-or: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pa: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pl: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt-br: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-pt: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ro: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ru: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sk: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sl: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr+latin: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sr: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-sv: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ta: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-te: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tg: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-th: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-tr: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-ug: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uk: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-uz+cyrillic: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-vi: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-cn: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-hk: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-locale-zh-tw: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGSIZE changed from 1643073 to 1645532 (+0%)
packages/core2-32-poky-linux/libsoup/libsoup-src: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-src: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup-staticdev: PKGV changed from 3.0.5 [default] to 3.0.6 [default]
packages/core2-32-poky-linux/libsoup/libsoup: PKGSIZE changed from 717728 to 721824 (+1%)
packages/core2-32-poky-linux/libsoup/libsoup: PV changed from "3.0.5" to "3.0.6"
packages/core2-32-poky-linux/libsoup/libsoup: PKGV changed from 3.0.5 [default] to 3.0.6 [default]

--===============5892154936124350327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libsoup-upgrade-3.0.5-3.0.6.patch"

From 4cf41f44fe9634ced1ca4e1092a1d7d1ff25aedd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 13:11:51 +0000
Subject: [PATCH] libsoup: upgrade 3.0.5 -> 3.0.6

---
 .../libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)

diff --git a/meta/recipes-support/libsoup/libsoup_3.0.5.bb b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
similarity index 94%
rename from meta/recipes-support/libsoup/libsoup_3.0.5.bb
rename to meta/recipes-support/libsoup/libsoup_3.0.6.bb
index d2535c91a2..17825ae6a4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.6.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f5d143db6830b3825edc2a1c4449d639273b0bfa017a4970871962d9bca22145"
+SRC_URI[sha256sum] = "b45d59f840b9acf9bb45fd45854e3ef672f57e3ab957401c3ad8d7502ac23da6"
 
 PROVIDES = "libsoup-3.0"
 CVE_PRODUCT = "libsoup"
-- 
2.27.0


--===============5892154936124350327==--

