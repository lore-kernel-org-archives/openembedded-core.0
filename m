Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2B1D116E2
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:12 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14104.1764566281589692121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qMAL+ZjI;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Tsboz/wY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad858d479-0d72cf01-ea6d-4f78-85d6-c0be0b856de2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3LUN2nX/GBauNKZLMOOtn2nriy/OhjQq5mYyPpvWCKA=;
	b=qMAL+ZjIbSIODSz/JqxuiyP8jqV4Y4rqIj8Bba63+XFvIIPqC6lxIZnjNILdtid9
	/BrOw+ee1MyaM4yFye4G88UMuuc60sBN/nT0no0hbtjGLCZFQFnVB3jiqxoqnwHdMGG
	5dHCvRYraw6v9mOaPEWeHqfIarSNGpeGx/nwQ558=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3LUN2nX/GBauNKZLMOOtn2nriy/OhjQq5mYyPpvWCKA=;
	b=Tsboz/wYy0Y13Yn6uv7KPoCJYYobtSIlQDq0DqBaFnoksQ2xNGb4rf3MRq+vgI8N
	7vUJrCOOIJKKVyRJLPp8qq1/xIWxNVmuMnBDHS79etZqbLI6TAS4UL7mJuv9AQpAuSE
	bsDgZcbGXw0V+clxwJCA2sxgTq8RKkhSvNFAEHHM=
Content-Type: multipart/mixed; boundary="===============6863585967680205188=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.44.4 FAILED
Message-ID: <0101019ad858d479-0d72cf01-ea6d-4f78-85d6-c0be0b856de2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227054

--===============6863585967680205188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gdk-pixbuf* to *2.44.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gdk-pixbuf' failed
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
--===============6863585967680205188==--

