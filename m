Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64D4D1268C
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13943.1764566297860603830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xJixW4qH;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HK1GGLia;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad858eb19-f7d9e66d-9140-4c1f-bd5f-e18fa572f42e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LXs3F6mHniSnhw+uG2AqRPzwXEIQTFKj4nEe29RzmBQ=;
	b=xJixW4qHgo3cGxcZg1LveNoVkaM8XFGB6qiMKawB5nMQ0gNHLGLH3GtJec3s5Ed2
	Q3uopNoWQ9Ysojog8+IOPabPq8stnA1rdmsxB0pCeU5EvK2qgCw2k+BWdhjhAEMNZdO
	B6XyZ+jFp3Mnf4Jv/mivtW6dG8IfkntVPNf5HywM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LXs3F6mHniSnhw+uG2AqRPzwXEIQTFKj4nEe29RzmBQ=;
	b=HK1GGLiaFBp8G7+nE5u2nWbgRiOFyqH2Gb5/Wd9fVBjmTsYZVeMb0dikx78bCcBt
	Y9Punaq6j98b20EA6Tp9gs6Qtvl6o+46QTgPyLz/R4vALn3fCVhUJ34TgCq8wc2xj2O
	b1yaBdSee0giJ0Ka59x+wL2vt3pfVBGO9AuYsoWk=
Content-Type: multipart/mixed; boundary="===============5360590282001825545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.6 FAILED
Message-ID: <0101019ad858eb19-f7d9e66d-9140-4c1f-bd5f-e18fa572f42e-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227080

--===============5360590282001825545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.6* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libtraceevent' failed
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
--===============5360590282001825545==--

