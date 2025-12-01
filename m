Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE89D12670
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:26 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13933.1764566289266793765
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iDa5/QKw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LqHWrvyp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ad858ec4d-5dfa9237-20f3-4b89-ae92-94798f05296d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HwP01agposL5CBGbzx7RgFF4kgD1yrjk52GDTi4rMhI=;
	b=iDa5/QKwVekmo6JxXYSllUNueuNlO7iSL10JolG0lbAUBo1rGZkMovKb2Hybg6vH
	kVrcALBIr76QH9Cc/aCXzXz30jKnEbznP3fm9F015fw1/7DbL90V09kvr14Huf8JaGY
	kDDU4XT8VzhSvUNqxm6VFWlxf4pYKy/+uSyadcUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566297;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HwP01agposL5CBGbzx7RgFF4kgD1yrjk52GDTi4rMhI=;
	b=LqHWrvyphSrFkezTqoxsHpeByzwGoIqF4acn/a2ZJ7eD9WJNYLurbmN7sVBqeuN6
	1WxFTrwgw5+E59fPAr7S4/MInhmrwyclISKOLK/UScsvdn3duilIIK2MS5z67r2sUxG
	Kv2hBoAhA8usgXt6H2K8bkAmyh+K79rHSx22jvkg=
Content-Type: multipart/mixed; boundary="===============4524715628555521351=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Etienne Cordonnier <ecordonnier@snap.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] makedumpfile: upgrading to 1.7.8 FAILED
Message-ID: <0101019ad858ec4d-5dfa9237-20f3-4b89-ae92-94798f05296d-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227081

--===============4524715628555521351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *makedumpfile* to *1.7.8* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake makedumpfile' failed
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
--===============4524715628555521351==--

