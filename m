Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E1BD12684
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13919.1764566280067092153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=akGk+On/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=FvsffQtU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858dbd5-b25b0c64-8c74-4e38-9766-0b7f925bce66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WeQ8ufENG8r9whUr4UTH/fUVPq6mKZv1IHRAak1k6lo=;
	b=akGk+On/zhrhueYcUoKJkmuoOMSMTWcvW2hp46kF6GNuCEjbRLhWjD1aKWvRkkxU
	YBYf6LBx+dlVGFCsZfbVZuYvuyhgZvlNV+oXLKk+RJznwAPJ+AWJSlF4/OsRzG0XtEF
	pptEUkUNECzJlkI08m9FXvf4X8biPJ0CXlEbK0Bo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566293;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WeQ8ufENG8r9whUr4UTH/fUVPq6mKZv1IHRAak1k6lo=;
	b=FvsffQtUBRQLWovYUJbTs4g0DVdbaHzp++Iv+PGH8AKjE6bJ1Ad+PJjKy03yg6v5
	0fEy1rHVcAN0eKSFz2ncaz5Jnpl/6ZbFFN8YDjDZRleb1ExTgWqz20UyUROP4E4PIsJ
	RPSGz0Us0nfT47y0zpkjzP4AJLqELnxJ39xFSAY4=
Content-Type: multipart/mixed; boundary="===============0593267438253747334=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libnotify: upgrading to 0.8.7 FAILED
Message-ID: <0101019ad858dbd5-b25b0c64-8c74-4e38-9766-0b7f925bce66-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227059

--===============0593267438253747334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnotify* to *0.8.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake libnotify' failed
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
--===============0593267438253747334==--

