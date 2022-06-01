Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E69CCA49B
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:49 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com
 (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web09.618.1654100323104782820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UBWQ9qzs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29,
 mailfrom: 01010181200fe5cc-e2719381-e1ca-4c23-8730-0141a8e2900b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ks9LK6ewDAOwMjez0G2iGaKkoKn5QbiLb+OmBb4TVHU=;
	b=UBWQ9qzscV4t3IH+hl/sxCxtfF/ZeOaT0zIJrdFRQbyuFqtPUQrSDpipSQ+8tHFy
	clY9nlbEKFsNdfJpBT+3n2aD2lOqQJ2TidLeIau8ShfX+8eSBuUodUdg2cGJAHvY792
	BepA9VQ4RBpFl+rLy2UEXuRQOE4I6asnuKjhkYck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100322;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ks9LK6ewDAOwMjez0G2iGaKkoKn5QbiLb+OmBb4TVHU=;
	b=PWYo59UpnQh4kaPUoSLIQ4BC6d3AX44Wnq00nCXD48gUHMzlmj5Tfh+V+91SFLP0
	L62/VwugXh7ldysjzuVCXq4hbY5QG88c390Aq3bAfjOLMznS9t80f8piTqDtaYLaF1+
	zRpHxj1rR0MoGu0tRgCwh6PpKtId047xdAMJrrKc=
Content-Type: multipart/mixed; boundary="===============5892934728969854793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.72.2 SUCCEEDED
Message-ID: 
 <01010181200fe5cc-e2719381-e1ca-4c23-8730-0141a8e2900b-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:41 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166393

--===============5892934728969854793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.72.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.72.1-2.72.2.patch
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
--===============5892934728969854793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgthread-2.0.so.0.7200.1 /usr/lib/.debug/libgio-2.0.so.0.7200.1 /usr/lib/.debug/libgmodule-2.0.so.0.7200.1 /usr/lib/.debug/libglib-2.0.so.0.7200.1 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.1-gdb.py /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.1-gdb.py /usr/lib/.debug/libgobject-2.0.so.0.7200.1", added "/usr/lib/.debug/libgthread-2.0.so.0.7200.2 /usr/lib/.debug/libgmodule-2.0.so.0.7200.2 /usr/lib/.debug/libglib-2.0.so.0.7200.2 /usr/lib/.debug/libgio-2.0.so.0.7200.2 /usr/lib/.debug/libgobject-2.0.so.0.7200.2 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.2-gdb.py /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.2-gdb.py"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 21024068 to 21024536 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGSIZE changed from 134156 to 134482 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGSIZE changed from 141768 to 142090 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGSIZE changed from 128520 to 130278 (+1%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGSIZE changed from 147858 to 148214 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGSIZE changed from 140729 to 141097 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGSIZE changed from 136035 to 136334 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGSIZE changed from 82038 to 126034 (+54%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGSIZE changed from 138617 to 138926 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 26331712 to 26332938 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgio-2.0.so.0.7200.1 /usr/lib/libgmodule-2.0.so.0.7200.1 /usr/lib/libgthread-2.0.so.0.7200.1 /usr/lib/libgobject-2.0.so.0.7200.1 /usr/lib/libglib-2.0.so.0.7200.1", added "/usr/lib/libglib-2.0.so.0.7200.2 /usr/lib/libgobject-2.0.so.0.7200.2 /usr/lib/libgmodule-2.0.so.0.7200.2 /usr/lib/libgio-2.0.so.0.7200.2 /usr/lib/libgthread-2.0.so.0.7200.2"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
packages/core2-32-poky-linux/glib-2.0: PV changed from "2.72.1" to "2.72.2"
packages/core2-32-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.72/glib-2.72.1.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://Enable-more-tests-while-cross-compiling.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-ignore-return-value-of-write.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch" to "https://download.gnome.org/sources//glib/2.72/glib-2.72.2.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://Enable-more-tests-while-cross-compiling.patch file://0001-Remove-the-warning-about-deprecated-pa
 ths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0001-Do-not-ignore-return-value-of-write.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch"
packages/core2-32-poky-linux/glib-2.0: PKGV changed from 2.72.1 [default] to 2.72.2 [default]
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7200.1 to libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7200.1 to libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7200.1 to libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7200.1 to libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7200.1 to libgthread-2.0.so.0.7200.2
  /usr/lib/libgio-2.0.so.0.7200.1 moved to /usr/lib/libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0.7200.1 moved to /usr/lib/libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0.7200.1 moved to /usr/lib/libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0.7200.1 moved to /usr/lib/libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0.7200.1 moved to /usr/lib/libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7200.1 to libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7200.1 to libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7200.1 to libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7200.1 to libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7200.1 to libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7200.2-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7200.2-gdb.py
  /usr/lib/libgio-2.0.so.0.7200.1 moved to /usr/lib/libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0.7200.1 moved to /usr/lib/libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0.7200.1 moved to /usr/lib/libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0.7200.1 moved to /usr/lib/libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0.7200.1 moved to /usr/lib/libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0

--===============5892934728969854793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGSIZE changed from 82038 to 126034 (+54%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgobject-2.0.so.0.7200.1 /usr/lib/libgthread-2.0.so.0.7200.1 /usr/lib/libgio-2.0.so.0.7200.1 /usr/lib/libgmodule-2.0.so.0.7200.1 /usr/lib/libglib-2.0.so.0.7200.1", added "/usr/lib/libgthread-2.0.so.0.7200.2 /usr/lib/libgmodule-2.0.so.0.7200.2 /usr/lib/libglib-2.0.so.0.7200.2 /usr/lib/libgobject-2.0.so.0.7200.2 /usr/lib/libgio-2.0.so.0.7200.2"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7200.1 to libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7200.1 to libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7200.1 to libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7200.1 to libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7200.1 to libgthread-2.0.so.0.7200.2
  /usr/lib/libgio-2.0.so.0.7200.1 moved to /usr/lib/libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0.7200.1 moved to /usr/lib/libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0.7200.1 moved to /usr/lib/libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0.7200.1 moved to /usr/lib/libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0.7200.1 moved to /usr/lib/libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7200.2-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7200.2-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7200.1 to libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7200.1 to libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7200.1 to libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7200.1 to libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7200.1 to libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7200.2-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7200.1-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7200.2-gdb.py
  /usr/lib/libgio-2.0.so.0.7200.1 moved to /usr/lib/libgio-2.0.so.0.7200.2
  /usr/lib/libglib-2.0.so.0.7200.1 moved to /usr/lib/libglib-2.0.so.0.7200.2
  /usr/lib/libgmodule-2.0.so.0.7200.1 moved to /usr/lib/libgmodule-2.0.so.0.7200.2
  /usr/lib/libgobject-2.0.so.0.7200.1 moved to /usr/lib/libgobject-2.0.so.0.7200.2
  /usr/lib/libgthread-2.0.so.0.7200.1 moved to /usr/lib/libgthread-2.0.so.0.7200.2
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.1-r0 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.72.2-r0

--===============5892934728969854793==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.72.1-2.72.2.patch"

From ca59b1d9cb436676d92e5dbca70cb46a2014be17 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 06:34:50 +0000
Subject: [PATCH] glib-2.0: upgrade 2.72.1 -> 2.72.2

---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch      | 2 +-
 .../glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 816b790ce7..fb50fff6a5 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From d52b1b530c5d8a1e70ae45d6e2139e9d3f25207f Mon Sep 17 00:00:00 2001
+From a30eb17c20e070124b55523d86729348f2929f95 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
index c9ccedd81f..c4a8a4b8ad 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "c07e57147b254cef92ce80a0378dc0c02a4358e7de4702e9f403069781095fe2"
+SRC_URI[sha256sum] = "78d599a133dba7fe2036dfa8db8fb6131ab9642783fc9578b07a20995252d2de"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.31.1


--===============5892934728969854793==--

