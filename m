Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E09DD11716
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13906.1764566270610828977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=xmQJoq/l;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rOSeuIgx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858fe72-d39414d8-97a8-4019-a24e-0419e4dcab88-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JIEJCv4w7TFxkvqyA53swcK+uhKBR4D1U1AygteqBA0=;
	b=xmQJoq/l20bZRC/Qqi1fkXQ5UXEvO7YVyx3oabAwuDBc455Eab+X4AQW/5QnDqki
	54/HvMQ68oEfvj22wsPvAA0/nuIAueKlkYO5G5JDq4Jy/CNEweDEVOjfOsIgMRgzfnR
	GHTLkw+duwvOKjBdQxPzUqHHIJngFC2nZgZtG4jo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566302;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JIEJCv4w7TFxkvqyA53swcK+uhKBR4D1U1AygteqBA0=;
	b=rOSeuIgx9rxj2MPNuy1RG5iKZCz62dsS+6ScA22Q2sEE+xiPt8KSQQm4KMfGm2vh
	BkNOS6wetugEjkGpsQDvNi45Vo7O6NCsBLiTXxGoB7APThs5fwm2dsjb3RJ+xW/nbOx
	kJ/Ukk9KCUHdWpEJTb0nm3I/MNBbjyXw5ON/FKHs=
Content-Type: multipart/mixed; boundary="===============7121734811113111577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.5 FAILED
Message-ID: <0101019ad858fe72-d39414d8-97a8-4019-a24e-0419e4dcab88-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227106

--===============7121734811113111577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake liburcu' failed
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
--===============7121734811113111577==--

