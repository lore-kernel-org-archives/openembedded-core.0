Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9BBD12661
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13904.1764566269431105607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JzPgYgyq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hDlyWNEW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ad8587b04-016d44f0-b97d-4e20-b7ff-b4601f512d87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566268;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NbVhVX3riNeBkR9c5+jW5uL+HP2mnm2/cWI85egb1QU=;
	b=JzPgYgyqPW/YeGdCTc/bvfiKn3Z+d1zG0dTGEnT7tuEjjA1qx1a3MfBQOEQooLQY
	oniDg9Y3A/fj/mj/lwe7F7KPRdWsyl4FfMTwgc1zX6fycWQC6fOwjqlRFZ/ZoMZ5pRA
	6FHNl+GU9xmKaGwDwYK5xBlrJ7CArmCB5HAZAub4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566268;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NbVhVX3riNeBkR9c5+jW5uL+HP2mnm2/cWI85egb1QU=;
	b=hDlyWNEWVcUfysPVPs84MXui+1ZRicgbEvjS180eC9/Di3aBqudBfRDWJx5EzC0U
	mdwhWBvbv+K/UUmd216ZRp5a5+vZ1DmLfm0UEUW0Ylp3ZcP+Zzv73ut9/ertFiCe83p
	M2JjMSxBCEVU2VP6jksZBsan/DI9ckAfXwffXq8Q=
Content-Type: multipart/mixed; boundary="===============2338619406935436661=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>, 
	Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap,systemtap-native: upgrading to 5.4,5.4 FAILED
Message-ID: <0101019ad8587b04-016d44f0-b97d-4e20-b7ff-b4601f512d87-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226964

--===============2338619406935436661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *systemtap,systemtap-native* to *5.4,5.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake systemtap systemtap-native' failed
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
--===============2338619406935436661==--

