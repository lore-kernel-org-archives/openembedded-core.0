Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B40D116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:49 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14078.1764566266925228490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uZM/xkda;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=gqPiZH7C;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858717e-834d6c6b-cb85-4acc-8768-79d7d6200b9a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0KMLfZnXW/3LooOQI6HAo1FeaZ/r53XJdNwnin7RsD8=;
	b=uZM/xkdaHsggW1xJm8ooOHs4PAt9/1rhU3zMw/0Aj5nxXlW3pc8oPaEZQBl1vXB5
	euERawRBWfhMWz2MiVGXO0InYN7fDsWAIcqxOODWgY2ONad1UBclqfWJcRaStSGaG//
	HoyWxIXbXB/8ALre+9brILK9UBnGWxUNdFPvOwJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566266;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0KMLfZnXW/3LooOQI6HAo1FeaZ/r53XJdNwnin7RsD8=;
	b=gqPiZH7CudN13FyOtrQ4VAIpG/U9yQQMVO6yXH7XLVcso2EsdChE/m82gqXxxDTn
	pDLQxqhqAXdoAuYHEM+1J1SPhdsBXas316sbCZhkKNCbEJliA8x1QGOpAMQGtopZtkQ
	+562WiIeOVLpAbhWkzSGE3Zuy6gmkHKwg/tw1f+s=
Content-Type: multipart/mixed; boundary="===============6107542765515052916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>, 
	Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors,python3-cryptography: upgrading to
 46.0.3,46.0.3 FAILED
Message-ID: <0101019ad858717e-834d6c6b-cb85-4acc-8768-79d7d6200b9a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226960

--===============6107542765515052916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-cryptography-vectors,python3-cryptography* to *46.0.3,46.0.3* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cryptography-vectors python3-cryptography' failed
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
--===============6107542765515052916==--

