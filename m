Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DE7C25B0D
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.3940.1659679409610131797
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Fd3zCR1V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101826c9a02a7-92b841c2-9c72-4194-a089-a2565237e6d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IN29cqKTPwSSuPZl4A5NvRS5UAtQ9r8As+GRH+fWXxw=;
	b=Fd3zCR1VGQuwCNE4oS3pElq0klPoaXP4amUn0sSqW/M96iSos2g3FrOVZY1D3ICc
	o9vhx4UkkN+JcqO4ZIqmLvi8sdGPPog6kxhN00woNsilGc39RcmWFLomH0l8XRNavd2
	2+aJtLd3RaYYSVBXWwl7NEMqJfq1npSfzUBn7TpY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679409;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IN29cqKTPwSSuPZl4A5NvRS5UAtQ9r8As+GRH+fWXxw=;
	b=X9GfC9Mq3ViuC2dzYjmkC1Z+uy4XCrseO0FflcmdgTDkcfh7CV3KU1HGhUjIwbNW
	ehfkwVZg2U7aeCp1j5E3rPGMcYE0B4UmvO9HK/fTj1bh0J0+HnaKZgsKEGGnz/43CWX
	qb2ii04Mzer+9gT/UWrxxBtb8MGUDTzv8Ye945V0=
Content-Type: multipart/mixed; boundary="===============0460418464754158380=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@cn.ujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iso-codes: upgrading to 4.11.0 SUCCEEDED
Message-ID: 
 <010101826c9a02a7-92b841c2-9c72-4194-a089-a2565237e6d2-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168927

--===============0460418464754158380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iso-codes* to *4.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iso-codes-upgrade-4.10.0-4.11.0.patch
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
--===============0460418464754158380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 315171 to 356239 (+13%)

--===============0460418464754158380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/iso-codes/iso-codes-dbg: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-dbg: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-dev: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-dev: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-doc: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-doc: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ab: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ace: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ach: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-af: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ak: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-am: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-an: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ar: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-as: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGSIZE changed from 367117 to 361177 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ast: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ay: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-az: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ba: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bar: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGSIZE changed from 311589 to 311488 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-be: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGSIZE changed from 89066 to 88971 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bg: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-bd: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn-in: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGSIZE changed from 179044 to 177473 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGSIZE changed from 65557 to 64941 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-br: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-bs: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-byn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGSIZE changed from 91619 to 92136 (+1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ca: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ce: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ch: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-chr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ckb: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGSIZE changed from 310292 to 304711 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-crh: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGSIZE changed from 93487 to 93433 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cs: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-csb: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-cy: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGSIZE changed from 224374 to 224257 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-da: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGSIZE changed from 697719 to 691316 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-de: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-dz: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ee: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGSIZE changed from 124597 to 123526 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-el: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-en: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGSIZE changed from 167136 to 166686 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGSIZE changed from 118922 to 118324 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-es: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGSIZE changed from 106112 to 110203 (+4%)
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-et: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGSIZE changed from 102960 to 104642 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-eu: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fa: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ff: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fil: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGSIZE changed from 657612 to 651120 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-frp: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fur: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-fy: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGSIZE changed from 56303 to 56249 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ga: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gez: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGSIZE changed from 372663 to 366750 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGSIZE changed from 116955 to 115951 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gu: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-gv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ha: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-haw: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-he: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGSIZE changed from 147374 to 146690 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ht: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGSIZE changed from 183864 to 183391 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hu: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-hy: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ia: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGSIZE changed from 536844 to 532185 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-id: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-io: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGSIZE changed from 236298 to 233363 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-is: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGSIZE changed from 611556 to 605119 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-it: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-iu: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ja: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-jam: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ka: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kab: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ki: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-km: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kmr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGSIZE changed from 460297 to 452988 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGSIZE changed from 84067 to 84017 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ko: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kok: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-kw: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ky: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGSIZE changed from 170334 to 169956 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lt: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGSIZE changed from 77590 to 77553 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-lv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mai: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mhr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ml: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGSIZE changed from 504903 to 496740 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ms: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-mt: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-my: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-na: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nah: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb-no: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nb: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ne: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGSIZE changed from 315171 to 356239 (+13%)
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nso: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-nv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGSIZE changed from 43666 to 43864 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-oc: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGSIZE changed from 292075 to 288572 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-or: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGSIZE changed from 484037 to 476141 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pa: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pap: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGSIZE changed from 367504 to 376065 (+2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ps: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGSIZE changed from 95969 to 95925 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt-br: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-pt: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGSIZE changed from 103111 to 103063 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ro: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGSIZE changed from 227328 to 227206 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ru: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-rw: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGSIZE changed from 202706 to 203516 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sc: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sd: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-si: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGSIZE changed from 82193 to 82138 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-so: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-son: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sq: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr+latin: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGSIZE changed from 645552 to 639050 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sv: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-sw: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGSIZE changed from 516199 to 507922 (-2%)
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ta: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-te: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tg: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGSIZE changed from 215737 to 215150 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-th: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ti: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tig: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tl: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGSIZE changed from 496597 to 490247 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tr: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt+iqtelif: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tt: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-tzm: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ug: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGSIZE changed from 866167 to 859635 (-1%)
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ur: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-uz: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-ve: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-vi: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGSIZE changed from 63445 to 63394 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wa: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wal: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-wo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-xh: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-yo: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGSIZE changed from 196048 to 196135 (+0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-cn: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hans: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hant: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-hk: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGSIZE changed from 121340 to 121074 (-0%)
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zh-tw: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-locale-zu: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-src: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-src: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes-staticdev: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes/iso-codes: PKGSIZE changed from 2995169 to 3012056 (+1%)
packages/all-poky-linux/iso-codes/iso-codes: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes/iso-codes: PKGV changed from 4.10.0 [default] to 4.11.0 [default]
packages/all-poky-linux/iso-codes: PV changed from "4.10.0" to "4.11.0"
packages/all-poky-linux/iso-codes: PKGV changed from 4.10.0 [default] to 4.11.0 [default]

--===============0460418464754158380==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iso-codes-upgrade-4.10.0-4.11.0.patch"

RnJvbSAwZjYxOGJlYjJkODc4ZDI5YzEyY2Q2Nzk3NGNhODU4NzFjY2YzMzQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwNDo1MTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlz
by1jb2RlczogdXBncmFkZSA0LjEwLjAgLT4gNC4xMS4wCgotLS0KIC4uLi9pc28tY29kZXMve2lz
by1jb2Rlc180LjEwLjAuYmIgPT4gaXNvLWNvZGVzXzQuMTEuMC5iYn0gICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy97aXNvLWNvZGVzXzQuMTAuMC5iYiA9PiBpc28tY29k
ZXNfNC4xMS4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2lz
by1jb2Rlcy9pc28tY29kZXNfNC4xMC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNv
ZGVzL2lzby1jb2Rlc180LjExLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvaXNvLWNvZGVzL2lzby1jb2Rlc180LjEwLjAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMS4wLmJiCmlu
ZGV4IDg1N2ZlNDYzZWYuLmJlNTczOTgxYjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L2lzby1jb2Rlcy9pc28tY29kZXNfNC4xMS4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNF
ID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0NTE2YyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9z
YWxzYS5kZWJpYW4ub3JnL2lzby1jb2Rlcy10ZWFtL2lzby1jb2Rlcy5naXQ7cHJvdG9jb2w9aHR0
cHM7YnJhbmNoPW1haW47IgotU1JDUkVWID0gIjlhNmMyNGVlNDBlNzM3YWIzNDI3M2MxYWYxM2E4
ZGFiY2FlODg4ZGQiCitTUkNSRVYgPSAiMjY1MWQ3ZmU2NTU4MjI2M2M1NzM4NWE4NTJiMGM2ZDhh
NDlmNjk4NSIKIAogIyBpbmhlcml0IGdldHRleHQgY2Fubm90IGJlIHVzZWQsIGJlY2F1c2UgaXQg
YWRkcyBnZXR0ZXh0LW5hdGl2ZSB0byBCQVNFREVQRU5EUyB3aGljaAogIyBhcmUgaW5oaWJpdGVk
IGJ5IGFsbGFyY2gKLS0gCjIuMzEuMQoK

--===============0460418464754158380==--

