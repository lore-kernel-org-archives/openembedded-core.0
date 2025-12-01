Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E254D11710
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14094.1764566273179227802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=zDzvk2fr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=XKpLlR3f;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858fefc-ddecf292-3d8a-48f5-a75b-587330916872-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3IStDCClUOtJ/U4KWaJxfA70qPv7eC5sqgaCyajglFU=;
	b=zDzvk2freWjiWcKnRp72U94e6VA41bhiKhWFXpwW0bmNBozki9/gUUNligzVZ98S
	vjklhhkq8V7eenhnlQJREHH4eQfubizXvrROXMgK3/b3S8GS6Wd86OyEclDG7zZ+udG
	g5HhqWfH0VJmh/3/3V2TtJV+X8VMnjZlYWcvlyIE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3IStDCClUOtJ/U4KWaJxfA70qPv7eC5sqgaCyajglFU=;
	b=XKpLlR3fPURyBuUvqbVSoMdFwj5HxMBmBtVIIG6zqz/6btu1CYtus6s5LPW/HiaB
	c+kxAxMykmfBiTU11qqbEREgrgbkhjwS2FJcFi5WToO7eDmY0JaDZG8PDubzgkmRomk
	C6wkr7K9s0M1neTLtqLCyTQ7lloaqER2fdsOCICo=
Content-Type: multipart/mixed; boundary="===============4001229044661743524=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] p11-kit: upgrading to 0.25.10 FAILED
Message-ID: <0101019ad858fefc-ddecf292-3d8a-48f5-a75b-587330916872-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227107

--===============4001229044661743524==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *p11-kit* to *0.25.10* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake p11-kit' failed
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
--===============4001229044661743524==--

