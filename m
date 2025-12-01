Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837CDD11709
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14114.1764566288534989630
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OrU5yBfQ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=F/5RXCuc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858c6a5-6f2bf17b-001e-4eb5-a953-8eb7d0e219ce-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ybAHK3hYoeeLQRv9jw9I+kbNpxf2376q8W12Y8gfnLo=;
	b=OrU5yBfQYcfhbnsn53tnWsnkqCMEDcD5AkaeTvd6VEo6aSbZOgzIjtrPEquVwjNo
	TU6PBJeFIfggpL/tTkB/G8HmE/50zVOMm1cHYJxE39Yruw1LGvJiCevvexYDk0JtMlE
	e/hBY5uDqBF9wh6jCap6+AHg/iRAhmv1EPHxlMBw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ybAHK3hYoeeLQRv9jw9I+kbNpxf2376q8W12Y8gfnLo=;
	b=F/5RXCucGhDez2LQDupQ8WX/Ow59Q+RNLypZcXJ364ZGmB+9sQxovya4siFJ2d/b
	2dItP9do0zPRRjx75EXipcCdKjix6qXKh2tpapeAe3l2MM2Q9E1qYnTrvlRkZEVttxG
	xBp9bcjx7XHpA51DPBKTUryHh4cp8ozcNiKXMcMU=
Content-Type: multipart/mixed; boundary="===============5878455182359604453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm: upgrading to 6.0.0 FAILED
Message-ID: <0101019ad858c6a5-6f2bf17b-001e-4eb5-a953-8eb7d0e219ce-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227038

--===============5878455182359604453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm* to *6.0.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake rpm' failed
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
--===============5878455182359604453==--

