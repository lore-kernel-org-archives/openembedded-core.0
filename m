Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F39D116F8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:17:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14081.1764566269547724683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZqxedJ0m;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=WA4SopH6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ad8589739-9ecfab71-bf11-4a54-8606-d95f2b610cb5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=35+rPxCc7T9Km8uVW/btHIkz19XQ45Rgv+Cwb5CzFvQ=;
	b=ZqxedJ0mCqYVqeXtmcadDFtXh7T76EEAkw337W7zNHL0i6o0Wd82HtIpwjrpxXfK
	lQl/LEnfIHF0GYw7t+9rnARbW1DaPmyewx9kAsE1ldrSp9N+diC8MimGKqbCkozJFGK
	BKSLzs0nQwLJTK4KTJKkQFnIEsJX2vLOVBgaYgV4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566276;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=35+rPxCc7T9Km8uVW/btHIkz19XQ45Rgv+Cwb5CzFvQ=;
	b=WA4SopH6TuFmBdwpjBtlUeupfKA5tZ3Qwu6BmcWmzx0Ka2Gv7u5P6TcoTnnKi/Qk
	vR6LKsZbs8vUE/J2iVDVnggrlsPTq6YHtqhpALy61j+oeBNl9griiz226smYtSTOfKE
	8f7/60Jv5jPPZLWtpeHsATM44KwKUOzomitHKa8U=
Content-Type: multipart/mixed; boundary="===============8311707138207844655=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dbusmock: upgrading to 0.37.1 FAILED
Message-ID: <0101019ad8589739-9ecfab71-bf11-4a54-8606-d95f2b610cb5-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226997

--===============8311707138207844655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-dbusmock* to *0.37.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-dbusmock' failed
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
--===============8311707138207844655==--

