Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A599AD1170B
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14076.1764566264023757777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mEsmv1RS;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=evQXouWK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad858c523-31dc8a0c-7925-4413-8f43-868204d1d6e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0uujMvSozr0IC+G7CsOanVVE+DoOteYtL2/gM10m/dg=;
	b=mEsmv1RSLpp9WJn1OLJFj5HEEy8QAdSqEsA31bs93WVLpgUbP1B7fma3zx29qz+I
	OTmh6guBQCIkIjwfHQXFdurOZkc3Q948Gbh4tD+NZHIhf9zslPYdjPvXBsjc44BZRg4
	6TzZFK16oPzBhlUs6KIbo5S5PiXCL51SG0pzQzqQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0uujMvSozr0IC+G7CsOanVVE+DoOteYtL2/gM10m/dg=;
	b=evQXouWKaQcREAueobkp47YTb+avOfSQakhQxyCLmuumNU2zC6KjHxsWppkJEo5K
	1EEslH2epGLtH5eGEPg/Xqh/zt95vT7a/NIO4jMUaDSn5lrd/6olfJBv9ezZtWb35he
	6Qyxl/vAskxDHchkUKW6iAT/6jBi+kWb7rdgh9Wo=
Content-Type: multipart/mixed; boundary="===============3849694395877818154=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: 
	=?utf-8?b?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+?=@yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpm-sequoia: upgrading to 1.10.0 FAILED
Message-ID: <0101019ad858c523-31dc8a0c-7925-4413-8f43-868204d1d6e4-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227035

--===============3849694395877818154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *rpm-sequoia* to *1.10.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake rpm-sequoia' failed
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
--===============3849694395877818154==--

