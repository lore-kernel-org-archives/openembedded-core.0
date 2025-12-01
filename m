Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC0ED116F7
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13912.1764566276200353593
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YlhFjWM+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MTipz8xI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858f8d9-4d6aa191-773d-4917-9732-e44c3ab115db-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4Gb9hkN6NjoGXJKuu+Moa2U4ONRLuH0EsIYlSbD/TMM=;
	b=YlhFjWM+CC5pKzT/OqwXEOJSeBmbEEAw3L7JzoQ75aaR9r1DlFI0z13+V1igp6XJ
	IYSnU/RCu0kxhAq5+a2Grrb9t9eZxXfw3Vjjv+ckxXp/iNSl0s9ajrxwXgO3XiKduS6
	6WIHIMq64au2i0CkD2CBGGhN9MD0ibujzRM581v4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4Gb9hkN6NjoGXJKuu+Moa2U4ONRLuH0EsIYlSbD/TMM=;
	b=MTipz8xIrWZk4RL4rMhuhhbKAR6+xUw/LMgNwgCd9jhvuvktMa1Ysomx/Fq1Jt+9
	DHE4SvAEivy2d2v2B1a5gjkZOKmZZfcBGolK3Jztm78lFR8mZbJNiqw76k9keIwbrBo
	vLPvjdBJB4X/k8pZOCDGl4We2sIdDM+CX8XIbJvw=
Content-Type: multipart/mixed; boundary="===============6297904851003285877=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?q?Simone_Wei=C3=9F_=3Csimone=2Ep=2Eweiss=40posteo=2Enet=3E?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnutls: upgrading to 3.8.11 FAILED
Message-ID: <0101019ad858f8d9-4d6aa191-773d-4917-9732-e44c3ab115db-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227098

--===============6297904851003285877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gnutls* to *3.8.11* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gnutls' failed
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
--===============6297904851003285877==--

