Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB4AD111A8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13896.1764566263737214148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=E1FlUAaf;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ND6oZrAF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019ad8586365-6edda31b-8113-4730-9bd5-bc44dfefd526-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566262;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U/7AwM4JEELf3kOfR41fB07ZpCWY5obh/jvb+b3UMDY=;
	b=E1FlUAafMfuQNPlPAo4cPr5H4iVpkJ7MupuHFxuZjdVQWYg09TsKtlPWZ93zUwOx
	NaYUKUYYKLL084K2wJ8u4t80eyt0Hki/N5oe2IGQJicv75ArBGIBYOkEJXCDu2cEanS
	BG9hILSjqC05tgDDBztVnq4Td4v6OLCv3ABUwNOs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566262;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U/7AwM4JEELf3kOfR41fB07ZpCWY5obh/jvb+b3UMDY=;
	b=ND6oZrAF5uV23K1QVN+Z/kK0rYLwnzkW3JuumESZeud7ymr2BclZiCBYYDRhE14t
	yedItbsYmbLQOUOZGBuuaPwVtiNJsQ+dtS/scvgDKFW/Ea1zDSWBkU5KxyybysD/a8w
	OA5lGB0JLhoo1XsxdNd4lMuSICdwMhIJZzaWnFpI=
Content-Type: multipart/mixed; boundary="===============6412474615952241407=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] glib-2.0,glib-2.0-initial: upgrading to 2.86.2,2.86.2 FAILED
Message-ID: <0101019ad8586365-6edda31b-8113-4730-9bd5-bc44dfefd526-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:17:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226956

--===============6412474615952241407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *glib-2.0,glib-2.0-initial* to *2.86.2,2.86.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake glib-2.0 glib-2.0-initial' failed
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
--===============6412474615952241407==--

