Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DDED11704
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14076.1764566264023757777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BiC1mSEn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fXavC0lT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad85889f0-4f96bbc9-373c-44c0-9b5a-23899a15f786-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UEX/agcvptQrp6wLXFNu24H80RnBFrcl+JGXSUopTLk=;
	b=BiC1mSEnu4zae2fyEF8zTnW6zqzwvmgXE47PF9bDLWOUlp68gksK+EQvy2ho0l4z
	n6zL1MUlu7g3P+kgwHf9u5hA3npKpspQiqdY6CWSxCQ1IKyWCv+vjapb+ZyXcu8R+4A
	FOscMLVBUmDqufKK29OyJLodDvH0BRI9+CCqcCJA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566272;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UEX/agcvptQrp6wLXFNu24H80RnBFrcl+JGXSUopTLk=;
	b=fXavC0lTgSmQoUHruCPJG1/dVmJAYrxlX7jRatYBzqQpz+GhjiCktvfFfITXYl3h
	QsSHbU96/PtLpNRC/S20KivOALOJaMtQQq3GKh0LbuOB165KVliOX0Q9YWvE96/unEr
	4HyDyR/kWgUrPmzt6BVCPXG5zo+ZtZYwqKd3+Rts=
Content-Type: multipart/mixed; boundary="===============0262361088196458162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ninja: upgrading to 1.13.2 FAILED
Message-ID: <0101019ad85889f0-4f96bbc9-373c-44c0-9b5a-23899a15f786-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226981

--===============0262361088196458162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ninja* to *1.13.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake ninja' failed
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
--===============0262361088196458162==--

