Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE28D12688
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:15 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13897.1764566264045401888
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=uHl7/zRh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hgF2HMCL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad858dd71-94d21702-f775-43f2-be3f-33bdb78ae913-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pbwlxHTpnqeeENl4WWnq/lqfPatrCPSsSyt76ToYM8U=;
	b=uHl7/zRhZ4vL5+kG1fkBq2tke7sL6O97HHCR9hgtb0n5HBxCVKy810RuQIvtISF9
	eI83sNajRrQrWcQ6pVcoyvyZGyctcmA2/TF3ng1Zu2a/rbIzR/Hz2Bdca7nuHgJBAsY
	kPNahECff55HlsBt0DolMZLmFN4sU9/j9gZZOZ0g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566294;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pbwlxHTpnqeeENl4WWnq/lqfPatrCPSsSyt76ToYM8U=;
	b=hgF2HMCLa+x79nVnyfYB1XSUqIxTCB7Jcc2Ya5h4GLU60vonGVTVThdIQ2SAMT+e
	PjJaa+ggDalXz6wZSnl28anMmAljo/DH3HsQ355FSAOnlLnvaQShdP9EtmWh6NKA37O
	KkqCzPhMiDMNkLGpxqVU3FWIn85TpQQfkk9YTPpo=
Content-Type: multipart/mixed; boundary="===============1003276107929498845=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 096719f387f88ef501ac35f32300b1bcd6e9a1ed
 FAILED
Message-ID: <0101019ad858dd71-94d21702-f775-43f2-be3f-33bdb78ae913-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227065

--===============1003276107929498845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *piglit* to *096719f387f88ef501ac35f32300b1bcd6e9a1ed* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake piglit' failed
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
--===============1003276107929498845==--

