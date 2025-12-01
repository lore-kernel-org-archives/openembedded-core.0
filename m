Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF21D1170F
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 05:18:25 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13943.1764566297860603830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Nov 2025 21:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=S7+WPWW/;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GlVFvsRh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019ad85901c4-fc95346b-2bdf-4f5d-bf7e-138677e43d85-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1764566303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M22m5J8gSFj7uqh/1O62tGWO4dKh8NmCmF+YzKi/9Ns=;
	b=S7+WPWW/mqTtuKuZhOMgRTvjudVGwlOP+S8F1eDON6t8F+MYPYW2h1wzGYa5bv8p
	gOZf7SSBFcGFg5D4N0AkqdlQQez3NGHhS13kmXLD4v5fUEkrGxqxKhNwssttdiENwpm
	QkbXa58gpBmg3o913UqNiodxeXOKHbOSFvPVBPLs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1764566303;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M22m5J8gSFj7uqh/1O62tGWO4dKh8NmCmF+YzKi/9Ns=;
	b=GlVFvsRhCbh/4tQRAkqBwYAnHy+eTUGnfIQWymZXcIA+1lzxkPh03fuC3Nf1NS3b
	AxCjOeskNORHBFBwvVXSwhxT88SHY6+oAOG1Dg7IDxQEaVh6gEASbwIxtP3HQOqxkr+
	9NOosjTR4YBZbVYoBZMpDvLxmTxB9xCiCnMaS1z0=
Content-Type: multipart/mixed; boundary="===============5806880616066866981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] utfcpp: upgrading to 4.0.8 FAILED
Message-ID: <0101019ad85901c4-fc95346b-2bdf-4f5d-bf7e-138677e43d85-000000@us-west-2.amazonses.com>
Date: Mon, 1 Dec 2025 05:18:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 05:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227111

--===============5806880616066866981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *4.0.8* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake utfcpp' failed
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
--===============5806880616066866981==--

