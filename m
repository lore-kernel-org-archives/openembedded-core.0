Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE40D116FF
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13928.1764566286089269369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=MCCo9veG;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nRxz27SM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858e922-92fb8b63-fa06-40c6-9255-fbdcc0bd6a25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8+mUT2RaFpUjHtrU6Xa8zB1MV9QokTRV3JHJEXGhEug=;
	b=MCCo9veGio8z4a0wYqAAYECJJRNo3kXpU+2dSg7RUqfcpzJNgkYNjILBseRSFnDW
	9Lcf9FqMrb3rk4XYUL3lV9nQm0iMq4EjLvkx+3mdq68LFiMYJkGyTdjh+Xa117xO9E9
	pKd7pvepunJcON8w3xx0ZIZOBKhAwUgs+fuMxywI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8+mUT2RaFpUjHtrU6Xa8zB1MV9QokTRV3JHJEXGhEug=;
	b=nRxz27SMd0tzKJaN37AUTr5WM7qzfu4dL7Dl3xSFyyjyhUxCrMe3/BLleYyHFHx5
	Im0MAmZ2xOr/a1qX17GQ6IS7/gB7VA5TiK/6yhPrXpxY6qU2MT8l1KVwI+kx1KOJKzt
	Lkr6s2h8uQ/hdzru9zFfVMB8nSbprFUNyEbG7+n8=
Content-Type: multipart/mixed; boundary="===============8607513033219371913=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libxkbcommon: upgrading to 1.13.0 FAILED
Message-ID: <0101019ad858e922-92fb8b63-fa06-40c6-9255-fbdcc0bd6a25-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227078

--===============8607513033219371913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxkbcommon* to *1.13.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libxkbcommon' failed
NOTE: Reconnecting to bitbake server...
ERROR: A builtin fragment 'machine/qemux86-64' is used while MACHINE has already got an assignment.
Please either disable the fragment or remove the value assignment.
To disable the fragment, use 'bitbake-config-build disable-fragment machine/qemux86-64'.
ERROR: Unable to parse /srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/layers/bitbake/lib/bb/__init__.py", line 262, in fatal
    raise BBHandledException()
bb.BBHandledException




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8607513033219371913==--

