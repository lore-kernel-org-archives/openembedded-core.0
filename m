Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22810D1268F
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:27 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13919.1764566280067092153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=iE02aOo5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=b8SJhEzX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858e862-1d2471dc-1d7f-4b82-846b-ac9a00681fe2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1npaWTa7egisKQsABzU8hyykex6f/9KAGYn3R/29+Rw=;
	b=iE02aOo5aDdHaRW/tlaOHzfXbhA9fBmWOswda1wwuKyMhb/VePJmQ+IppEzTV88y
	Zfh5s/w7UZMziObnChgUK8CcBxnRwE9CP63Ar4QtKaB3Kq7hK3A1IJIJEaw6WBSvF0Y
	VYDn9QqEmGMJDE02ymrBiSgFd310aid7aXEoYnmU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566296;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1npaWTa7egisKQsABzU8hyykex6f/9KAGYn3R/29+Rw=;
	b=b8SJhEzXXUI8Ce5Ikq9cO7MGCyDMb4qkFZmpvlC9TstbC1Q9PKp0Jgo0/nPfieLY
	3RM9uurj+BYgkskCjX90oMM/jHcuDT6MRCSL6v9WGOqCPm4Qwygq11PHqoEH1Ry2z2K
	tKW+rd0qM/9m6zpIRaYUKSYcK5ALhB4/wWOSSUbA=
Content-Type: multipart/mixed; boundary="===============3763898638504056815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] xserver-xorg: upgrading to 21.1.21 FAILED
Message-ID: <0101019ad858e862-1d2471dc-1d7f-4b82-846b-ac9a00681fe2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227076

--===============3763898638504056815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *xserver-xorg* to *21.1.21* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake xserver-xorg' failed
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
--===============3763898638504056815==--

