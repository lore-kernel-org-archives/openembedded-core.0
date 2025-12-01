Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0619D12674
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:13 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13928.1764566286089269369
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZQ4GMB1G;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=h4iremmB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ad858bca1-21be0232-2635-4979-8955-3cb35897bbc2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=c4NBU31ox5ki2dJXgNVmI0ixLIorZK7Vt3NUAJ8Qqts=;
	b=ZQ4GMB1GsQ82qpxGGdzx+nVQFHFKYb7YqMAjl/1bQUGDOJ/WyCYTsIgDh4fx9KKB
	gQfxoWBbe6L50j3RuBwTu9F+bQC/FKBHRTAZtRIX6RBWYjSC65sBlXidNgSpbhOoMKW
	ivB2lfoUxCivpYO3UpvICmM513OLj7AsqYO/owsg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566285;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=c4NBU31ox5ki2dJXgNVmI0ixLIorZK7Vt3NUAJ8Qqts=;
	b=h4iremmBDVbUHEmz9AGILXs4dNccV7vJCxQBszrHoZlt3nIrPqjet7xBFkOdhrXj
	t0ErqpflAnTXSMP1N3wilGfAcHYFtW1KgGG7fiwZUfnwdAwnzSNZ79ioxBtLN5B3bd1
	OOB1jShfPtb6dfbNrij0cDMuAgKy0EqtqxiAYQTE=
Content-Type: multipart/mixed; boundary="===============4934320580233252680=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.10.1 FAILED
Message-ID: <0101019ad858bca1-21be0232-2635-4979-8955-3cb35897bbc2-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:05 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227029

--===============4934320580233252680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.10.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-scons' failed
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
--===============4934320580233252680==--

