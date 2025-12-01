Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92AD3D12680
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14091.1764566272084136270
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=FJ7b+LNC;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=rTZOE8nP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019ad858d960-9ec3deb1-0ba7-4e2d-99aa-335f4b100edc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ia5XCyjcpXkTI0nXs7h+7GTkNg1+yv5SKw9c3fO4x/Q=;
	b=FJ7b+LNCk/M2GxgkU8GN2C8LCmidivVcyM+UaQiwG0bcXW9wpu2E379WtsDY7bap
	UNsb/4pYW6Qhtb+9QQTIMl61cFDtMEqrG7IBxmZcGMhMUEeLmyFEXH+ajYegUAASEGd
	h9QbNyuU+ee/q0rkF6nPnS+Q+rnBD/iHXbsBX0X4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566292;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ia5XCyjcpXkTI0nXs7h+7GTkNg1+yv5SKw9c3fO4x/Q=;
	b=rTZOE8nPoZcVo7CMuMK3cUoeyPzc6odsDaEnhT7935K0sb/weQugSVRwYidCUP43
	TU9g0R75FfVOGe4a0hqiHaBAK3dTPMg634HGmiiKFCV1KoJ+jMQWoi/JESj9koIddpc
	DuTAd3kMnj90pDZ1KoiDh1DllE9yAKS37sxgghGQ=
Content-Type: multipart/mixed; boundary="===============4195098180996345024=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gtk-doc: upgrading to 1.35.1 FAILED
Message-ID: <0101019ad858d960-9ec3deb1-0ba7-4e2d-99aa-335f4b100edc-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227055

--===============4195098180996345024==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk-doc* to *1.35.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake gtk-doc' failed
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
--===============4195098180996345024==--

