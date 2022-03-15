Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA52AC35294
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 13:08:56 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.10408.1647349735512459372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 06:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OAg8bGy2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 0101017f8db21d26-8f7b0b11-3551-48a9-8381-5fd4f8a9b670-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dJEZprgDg3rAo7R4kv3a6kka2m8dKGXsTzPyj+2WxtY=;
	b=OAg8bGy2X6EyDzravz/2PYV7FkumkiftYTcRfDhZFLRx8+CmSC6oyES1hOgxfSLn
	8ZsXoHL/2A65lHZuOGrdd523vXLD2AdP7ld/ce/Zl3JkRjBAGqtyN9fkUeiX2KagtWR
	Ubmo1lLE2pmxnHiI9iILHkHH6rwHD3Rp8lKqksIo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1647349735;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dJEZprgDg3rAo7R4kv3a6kka2m8dKGXsTzPyj+2WxtY=;
	b=L0DdjJZq1HrAPM+LiGn2gTFg3ByM6oih1nHqXbHang4ZkZMgzIH2jOJY5TZnBPnP
	YKXrPUwzOrdgMsXfWYGoeIEMnBAlWNh2d+Sh2l00JAALDhP53Gy2SDmKGmLLUSy8FgX
	rQHKZ/nKa9t++nt3k18+30nQbswyiwWgb8coNjVc=
Content-Type: multipart/mixed; boundary="===============1417472437862088652=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk+3: upgrading to 3.24.33 SUCCEEDED
Message-ID: 
 <0101017f8db21d26-8f7b0b11-3551-48a9-8381-5fd4f8a9b670-000000@us-west-2.amazonses.com>
Date: Tue, 15 Mar 2022 13:08:54 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.03.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 13:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163265

--===============1417472437862088652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk+3* to *3.24.33* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk-3-upgrade-3.24.31-3.24.33.patch
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
--===============1417472437862088652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PKGSIZE changed from 22098308 to 22100024 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: FILELIST: removed "/usr/lib/.debug/libgdk-3.so.0.2404.27 /usr/lib/.debug/libgtk-3.so.0.2404.27", added "/usr/lib/.debug/libgdk-3.so.0.2404.29 /usr/lib/.debug/libgtk-3.so.0.2404.29"
packages/core2-32-poky-linux/gtk+3/gtk+3-dbg: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-demo: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-demo: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PKGSIZE changed from 14501031 to 14501460 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-dev: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-doc: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-doc: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-af: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-af: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-am: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-am: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-an: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-an: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ang: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ang: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ar: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ar: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-as: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-as: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ast: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ast: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az-ir: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az-ir: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-az: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be+latin: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be+latin: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-be: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bg: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bg: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn-in: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn-in: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bn: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-br: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-br: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bs: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-bs: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca+valencia: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PKGSIZE changed from 324660 to 324178 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ca: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ckb: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ckb: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-crh: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-crh: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PKGSIZE changed from 317141 to 317236 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cs: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cy: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-cy: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-da: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-da: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-de: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-de: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-dz: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-dz: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-el: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-el: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en+shaw: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en+shaw: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-ca: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-ca: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-gb: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en-gb: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-en: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eo: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eo: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PKGSIZE changed from 325584 to 325690 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-es: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-et: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-et: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PKGSIZE changed from 318908 to 319012 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-eu: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PKGSIZE changed from 169305 to 169410 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fa: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fi: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fi: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PKGSIZE changed from 336812 to 336906 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fur: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-fur: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ga: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ga: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gd: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gd: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PKGSIZE changed from 322160 to 322238 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gl: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gu: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-gu: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PKGSIZE changed from 293040 to 300515 (+3%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-he: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hi: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hi: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PKGSIZE changed from 310543 to 310636 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hu: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hu: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hy: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-hy: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ia: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ia: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PKGSIZE changed from 305726 to 305262 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-id: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-io: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-io: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-is: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-is: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-it: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-it: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ja: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ja: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ka: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ka: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kg: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kg: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-km: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-km: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kn: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-kn: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ko: PKGSIZE changed from 318457 to 318551 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ko: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ko: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ku: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ku: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ky: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ky: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lg: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lg: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-li: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-li: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lt: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lt: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lv: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-lv: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mai: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mai: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mi: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mi: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ml: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ml: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mn: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mn: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-mr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ms: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ms: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-my: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-my: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nb: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nb: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nds: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nds: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ne: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ne: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nl: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nl: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nn: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nn: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nso: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-nso: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-oc: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-oc: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-or: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-or: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pa: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pa: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PKGSIZE changed from 326288 to 325840 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pl: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ps: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ps: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGSIZE changed from 319106 to 319206 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt-br: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PKGSIZE changed from 319278 to 318837 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-pt: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PKGSIZE changed from 323119 to 322649 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ro: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ru: PKGSIZE changed from 410256 to 410382 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ru: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ru: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-rw: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-rw: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-si: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-si: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PKGSIZE changed from 311492 to 311004 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sl: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sq: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sq: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+ije: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+ije: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+latin: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr+latin: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PKGSIZE changed from 395760 to 395875 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PKGSIZE changed from 312210 to 311509 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-sv: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ta: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ta: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-te: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-te: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tg: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tg: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-th: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-th: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PKGSIZE changed from 315169 to 314719 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tt: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-tt: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ug: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ug: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PKGSIZE changed from 400729 to 400146 (-0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ur: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-ur: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz+cyrillic: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-uz: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-vi: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-vi: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-wa: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-wa: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-xh: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-xh: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-yi: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-yi: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-cn: PKGSIZE changed from 291017 to 291220 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-cn: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-cn: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-hk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-hk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-tw: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-locale-zh-tw: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PKGSIZE changed from 72681547 to 72683337 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-src: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3-staticdev: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3-staticdev: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk+3: PKGSIZE changed from 11790800 to 11794928 (+0%)
packages/core2-32-poky-linux/gtk+3/gtk+3: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgdk-3.so.0.2404.27 /usr/lib/libgtk-3.so.0.2404.27", added "/usr/lib/libgtk-3.so.0.2404.29 /usr/lib/libgdk-3.so.0.2404.29"
packages/core2-32-poky-linux/gtk+3/gtk+3: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-am-et: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-am-et: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cedilla: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cedilla: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-cyrillic-translit: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-inuktitut: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-inuktitut: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ipa: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ipa: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-multipress: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-multipress: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-thai: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-thai: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-er: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-er: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-et: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-ti-et: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-viqr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-viqr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-wayland: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-wayland: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-waylandgtk: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-waylandgtk: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-xim: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-immodule-xim: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-file: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-file: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-lpr: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3/gtk3-printbackend-lpr: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
packages/core2-32-poky-linux/gtk+3: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.31.tar.xz file://0002-Do-not-try-to-initialize-GL-without-libGL.patch file://0003-Add-disable-opengl-configure-option.patch file://link_fribidi.patch" to "http://ftp.gnome.org/pub/gnome/sources/gtk+/3.24/gtk+-3.24.33.tar.xz file://0002-Do-not-try-to-initialize-GL-without-libGL.patch file://0003-Add-disable-opengl-configure-option.patch file://link_fribidi.patch"
packages/core2-32-poky-linux/gtk+3: PV changed from "3.24.31" to "3.24.33"
packages/core2-32-poky-linux/gtk+3: PKGV changed from 3.24.31 [default] to 3.24.33 [default]
Changes to packages/core2-32-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgdk-3.so.0.2404.27 moved to /usr/lib/libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0.2404.27 moved to /usr/lib/libgtk-3.so.0.2404.29
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgdk-3.so.0.2404.27 moved to /usr/lib/libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0.2404.27 moved to /usr/lib/libgtk-3.so.0.2404.29

--===============1417472437862088652==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gtk-3-upgrade-3.24.31-3.24.33.patch"

From 674f8ea782540b35317c57f27752fd3f01f2adfe Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Mar 2022 09:36:09 +0000
Subject: [PATCH] gtk+3: upgrade 3.24.31 -> 3.24.33

---
 meta/recipes-gnome/gtk+/{gtk+3_3.24.31.bb => gtk+3_3.24.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.31.bb => gtk+3_3.24.33.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
index a53cd7a45e..fb9e29dd8c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.31.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.33.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "423c3e7fdb4c459ee889e35fd4d71fd2623562541c1041b11c07e5ad1ff10bf9"
+SRC_URI[sha256sum] = "588b06522e25d1579e989b6f9d8a1bdbf2fe13cde01a04e904ff346a225e7801"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.27.0


--===============1417472437862088652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk+3/gtk+3: FILELIST: removed "/usr/lib/libgdk-3.so.0.2404.27 /usr/lib/libgtk-3.so.0.2404.27", added "/usr/lib/libgtk-3.so.0.2404.29 /usr/lib/libgdk-3.so.0.2404.29"
Changes to packages/core2-32-poky-linux/gtk+3 (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgdk-3.so.0.2404.27 moved to /usr/lib/libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0.2404.27 moved to /usr/lib/libgtk-3.so.0.2404.29
Changes to packages/x86_64-linux/gtk+3-native (sysroot):
  /usr/lib/libgdk-3.so.0 changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgdk-3.so changed symlink target from libgdk-3.so.0.2404.27 to libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0 changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgtk-3.so changed symlink target from libgtk-3.so.0.2404.27 to libgtk-3.so.0.2404.29
  /usr/lib/libgdk-3.so.0.2404.27 moved to /usr/lib/libgdk-3.so.0.2404.29
  /usr/lib/libgtk-3.so.0.2404.27 moved to /usr/lib/libgtk-3.so.0.2404.29

--===============1417472437862088652==--

