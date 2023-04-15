Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D88C88CB5
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13519.1681581684878815842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Nhwmo3c8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101878614355c-3b0ef500-ad3c-4e20-b7aa-32ac3f968ee5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9ijQoOFpALQ2Xe+QUb+iFSR+Cc5IRdcUShyDuU323qY=;
	b=Nhwmo3c8KN/vazoezixyxOw/CS9BNvhUpcD7VCqbYDEoZZpqkkwiJ8VE+NFvgEID
	QANdi656ZJkLK7tacj01At5el3h1T3KmX/PEM3NMecpfoOGq5WrU5imDqppaohyAj6m
	fGe1MKW/K572ejDClkArPQfZxnIdsQRPrg1/GdTw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9ijQoOFpALQ2Xe+QUb+iFSR+Cc5IRdcUShyDuU323qY=;
	b=av7dXgl5O4MT2F8DN/HfCZgpgUrr9PRJ/pydfDWUJksjgklwdebUzKfz0w/YmhOn
	B620ZxZNQacM/bUR64VUfVBDx8206bysYqoMay4S2sZMiFcGpia/ofunXV2ViFCduo8
	UcbLBwHwMX1r1ee59EaIaGGgbldaroRUMuCQPNoE=
Content-Type: multipart/mixed; boundary="===============3816444139632482035=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dnf: upgrading to 4.15.0 SUCCEEDED
Message-ID: <010101878614355c-3b0ef500-ad3c-4e20-b7aa-32ac3f968ee5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180032

--===============3816444139632482035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dnf* to *4.15.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dnf-upgrade-4.14.0-4.15.0.patch
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
--===============3816444139632482035==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dnf/dnf-bash-completion: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-bash-completion: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dbg: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-dbg: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-dev: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-dev: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-doc: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-doc: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ar: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bg: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn-in: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-bn: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ca: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-cs: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-da: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-da: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-de: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-de: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-el: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-el: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-en-gb: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eo: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-es: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-es: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-eu: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fa: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fi: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fil: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fr: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-fur: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gd: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-gu: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-he: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-he: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hi: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hr: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-hu: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-id: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-id: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-it: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-it: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ja: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ka: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-kk: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ko: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-lt: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ml: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-mr: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ms: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nb: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-nl: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-or: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-or: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pa: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pl: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt-br: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-pt: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ru: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-si: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-si: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sk: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sq: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr+latin: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sr: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-sv: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-th: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-th: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-tr: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-uk: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-ur: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-vi: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-cn: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-hans: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-locale-zh-tw: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-src: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-src: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-staticdev: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-staticdev: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-test-dep: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-test-dep: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf-test-main: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf-test-main: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf/dnf: PKGSIZE changed from 950126 to 954061 (+0%)
packages/core2-32-poky-linux/dnf/dnf: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf/dnf: PKGV changed from 4.14.0 [default] to 4.15.0 [default]
packages/core2-32-poky-linux/dnf: PV changed from "4.14.0" to "4.15.0"
packages/core2-32-poky-linux/dnf: PKGV changed from 4.14.0 [default] to 4.15.0 [default]

--===============3816444139632482035==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dnf-upgrade-4.14.0-4.15.0.patch"

RnJvbSBlM2Y2ZDc2Njg1YWIxYWI2N2E2MTdkYzRjZjAxZDUyYjJlNmQxYTQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMDk6MDk6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bmY6IHVwZ3JhZGUgNC4xNC4wIC0+IDQuMTUuMAoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
ZG5mL3tkbmZfNC4xNC4wLmJiID0+IGRuZl80LjE1LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2RuZi97ZG5mXzQuMTQuMC5iYiA9PiBkbmZfNC4xNS4wLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTQuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTUuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80LjE0LjAuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9kbmYvZG5mXzQuMTUuMC5iYgppbmRleCA2MmRmOGM0YWNl
Li43YmY5NTQ3NDI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG5mL2RuZl80
LjE0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RuZi9kbmZfNC4xNS4wLmJiCkBA
IC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUt
bWFuYWdlbWVudC9kbmYuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jCiAgICAgICAgICAgIGZpbGU6
Ly8wMDAxLWRuZi13cml0ZS10aGUtbG9nLWxvY2stdG8tcm9vdC5wYXRjaCBcCiAgICAgICAgICAg
ICIKIAotU1JDUkVWID0gImU1MDg3NWIzZjU3OTBmNzA3MjBiZGI2NzBlMWRkMmJmNGQ4Mjg3NDQi
CitTUkNSRVYgPSAiNTMwNjkxMGQwNjYzMWJjOTNmYTNlY2UwZTcwZWQyN2VlNTkyYjBhYSIKIFVQ
U1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gIig/UDxwdmVyPlxkKyhcLlxkKykrKSIKIAogUyA9
ICIke1dPUktESVJ9L2dpdCIKLS0gCjIuMzkuMgoK

--===============3816444139632482035==--

