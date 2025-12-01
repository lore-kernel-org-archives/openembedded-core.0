Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E818D1170A
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13924.1764566285337802572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=1xG5snSC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HVOpyQUV;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019ad858c76d-f4e6d296-cf5a-4e66-b2ed-21e33ad9481f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GUkt1taRgQkwI/+z34byZMWJ14pZkXTT6/07Y8u84g4=;
	b=1xG5snSCQqxM7AQTjH/CbLdDHoZiF4hhDzRVQrACyADhXfHxj2sw8KmeXmgtAl0U
	KVx8FV0oYvyXENPRJUXZGmpx2e/EJX5nis9bb8JW/Z7qDYOY5rJJ3wCMEfUpxJSvGm4
	ItngRGLzwP7rLCeFFNzlRnluUAdVN30BycWdqXhs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GUkt1taRgQkwI/+z34byZMWJ14pZkXTT6/07Y8u84g4=;
	b=HVOpyQUV8Dif7lPomX2eNNUhVP4HKq5jrLmstSQ7jYVvnb1TIxMO0wEaH69RnkqC
	P2pLBSrpIJcmFfXeY5tVhJPz9czVqCs8VWw66o2Wq4ZLEAAgc+emhDTrUiM4eUeWMCx
	0+IlVlMXVSrirFlMnBuQjSJfrK/2KZnXgKMdOa6k=
Content-Type: multipart/mixed; boundary="===============1853692757496250668=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ruby: upgrading to 3.4.7 FAILED
Message-ID: <0101019ad858c76d-f4e6d296-cf5a-4e66-b2ed-21e33ad9481f-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227037

--===============1853692757496250668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ruby* to *3.4.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ruby' failed
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
--===============1853692757496250668==--

