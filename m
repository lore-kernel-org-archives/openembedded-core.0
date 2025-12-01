Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219C3D12662
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13941.1764566296300695582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HEm8GCmB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XXNj/rjr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858f459-535b3e6d-90fb-4585-8761-3436403d48a1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wQ82HGVFxPG7JtfCp1wS40NN8elF40Tv9s//CTlcKpY=;
	b=HEm8GCmBmDtgaVZZZe1gME6dCl+hkRm/tGX2pGRsB7+TFU5t7cgFGh3J56ZKFJvc
	+Ywb4tq8YS39i+vdOkNr+Y+i/WbYBBQZV89k8E9Vd/MfucIPqGMj0uY4p6ZdEvImNeC
	tc8aASLml3ZAeAy7SnWvOpJjJHgqnFAZqvIhCpzw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566299;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wQ82HGVFxPG7JtfCp1wS40NN8elF40Tv9s//CTlcKpY=;
	b=XXNj/rjrVBfC/5ZbYmzdVWQ2KOQgkawFQ2A8VFdfh+9iP1eeUKzxQoECkDR7aYdg
	kkcfvDRkxHG+31k/7TFzdOUePnc/zVPJbk+O3sCf9gL6CHITOunMafzLdfUukYNjRBd
	f5OBH8lQ7fsqLAb97d+RJ9IUtwY8SywC9anFked0=
Content-Type: multipart/mixed; boundary="===============2581391971174484449=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] wpebackend-fdo: upgrading to 1.16.1 FAILED
Message-ID: <0101019ad858f459-535b3e6d-90fb-4585-8761-3436403d48a1-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227095

--===============2581391971174484449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *wpebackend-fdo* to *1.16.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake wpebackend-fdo' failed
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
--===============2581391971174484449==--

