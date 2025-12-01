Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2618CD11700
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14116.1764566291059377430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=slDP/oyb;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=UAchFqf4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019ad858cfcd-67bade18-bb78-4f0b-89c5-5d5d244d9972-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=shP5+I+0vJfOtzk7g5jKyTgSEGc5HaXiwBrqUnvGS7E=;
	b=slDP/oybSzamhV6qN6quZ7w7NSC4wQeQUbdK2e4MTblI8FaVcVbEmO8oHZhSzjej
	MMtuV8rzfHg7Trn7Mmz87/nJVMHy1pQ84HEIOFznWJ8vArxppN3/Mt7wtN/u8NuzEm6
	jfhu6326dfx1okmQpnl+0ZmNm+Q+bGKI7H/XzxZg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566290;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=shP5+I+0vJfOtzk7g5jKyTgSEGc5HaXiwBrqUnvGS7E=;
	b=UAchFqf473u5x7z707MiliEyOc52/3xr7HZofkHtlQvDyZXXnS45G8FRfldNt7Wb
	DjCKI8WDUNC2DoAPSwoYgfyMMJqK6YbXUpGNt3TE6PGinyB0WZ19CKevfFned0Gh4na
	dEAwKlQLMa3ky+bg/nkCSz/8K2i0vXB7et0DSxps=
Content-Type: multipart/mixed; boundary="===============4067002805677101796=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libtirpc: upgrading to 1.3.7 FAILED
Message-ID: <0101019ad858cfcd-67bade18-bb78-4f0b-89c5-5d5d244d9972-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227046

--===============4067002805677101796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtirpc* to *1.3.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libtirpc' failed
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
--===============4067002805677101796==--

