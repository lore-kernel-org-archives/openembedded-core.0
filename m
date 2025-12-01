Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AF8D12677
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14112.1764566286080832132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vPe5DiHJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cabk0oKg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858bd33-50cf3e43-1461-4d21-b63a-4b407d474c44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xJI0nwEbKVfpepDvdl3IJdezoaWwfYeITKukGwVabiE=;
	b=vPe5DiHJ7cegvvOouOV7RVGkp9YgW9tusbjCv77hxWQlu8wXKQHMvczLEQjM1fu6
	XEFggjA9MElufyomD6U9eWIPN9bY1m3BEYB+i9OaNos+OUzTH2kf9MNBU0YGyCRy0hK
	djboExkSqEbZ2sKy5opZgyjQj4CZ/0ibYk2+GZlY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xJI0nwEbKVfpepDvdl3IJdezoaWwfYeITKukGwVabiE=;
	b=Cabk0oKg0oId4mp2SLTN+yZ5PlCEFTBWLWTxLva1yXZaPIWfnTAQXcn5WJo+cpFE
	TG0LPNNwFCBcWCrLbIgbqxTLHlVwG/NlKXPsotrqGKWyIMq8wb8ZqAi1sFP85ca5TO6
	IWKmpvsw1nNySB06GloxHwpNbb7Eo/jCECSp85Q8=
Content-Type: multipart/mixed; boundary="===============8166382330429138723=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-testtools: upgrading to 2.8.0 FAILED
Message-ID: <0101019ad858bd33-50cf3e43-1461-4d21-b63a-4b407d474c44-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227028

--===============8166382330429138723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-testtools* to *2.8.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-testtools' failed
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
--===============8166382330429138723==--

