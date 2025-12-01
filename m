Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3410D116FA
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14076.1764566264023757777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=32djEEcm;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bXEGZoA0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad85897e9-1e6046b6-1cd2-4fdf-bde8-88a010bd047a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SFJPH6ZF6XK1k0WWBwWtD6PcgJ/xVN2ZGvQxKm1F6Ms=;
	b=32djEEcmkbrGHF1JH9pwua6bk6OT5oniv/mJZO6RAzUAi5fv0APWt1AlJyRtwqq7
	KQriSUr3xOtHQRBNJFjXuWRH8Ujkh+a8xmlatbwq2vvcFXccpkSWV+sqq6hDCbghMYo
	O2Y0LqW9Yrxk97BAdzQLAaCfJu9ZZRCyaZEKmdlA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SFJPH6ZF6XK1k0WWBwWtD6PcgJ/xVN2ZGvQxKm1F6Ms=;
	b=bXEGZoA0ov6Xl/2eeCyq0PkHvQUVhQWK3FA1rgRSt5jTXQj1B5YFrNpJYYuDtm2U
	uLIMh6l7I89JJRELZVwMLuK4UnGNRaMpd6ly2dYfqKRTfQuu8QN5VfoBzhPz095T7DJ
	e2xKP3At9XTuPxfcSjSwh9iCgwSlhfjbr6T8v2zQ=
Content-Type: multipart/mixed; boundary="===============3801665233462820885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cffi: upgrading to 2.0.0 FAILED
Message-ID: <0101019ad85897e9-1e6046b6-1cd2-4fdf-bde8-88a010bd047a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226995

--===============3801665233462820885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cffi* to *2.0.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cffi' failed
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
--===============3801665233462820885==--

