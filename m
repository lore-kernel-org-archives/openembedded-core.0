Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571F7F4211D
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:38 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19734.1776261873543329735
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fffOtj1g;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BQQ2gB8u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019d91753ced-b01a2ee3-a0eb-4b6f-9327-04203ffaeafb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tC/HLQuY4+dEdrN7/jXfJZrEyejpQz0sTgWPBFAUxwA=;
	b=fffOtj1grw66mBCSog07EZxOMZo2yx1dftAa8SLrFYlGpCW8mxQV+vpSsW9xPUVK
	7OCCwoIkPp/BM0KeBlOPz/GaoJjIAjTiqKfZg3J1pzZj8TRcOa3DQAq9lmmziv8Xhcy
	6eC3Hieh45WWy76NRT8MaeXrkuiaq0qO3gidWgcM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261873;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tC/HLQuY4+dEdrN7/jXfJZrEyejpQz0sTgWPBFAUxwA=;
	b=BQQ2gB8uyuHyKJHHN6XGdNpO/TZBcOWxoq+NEbVyyNadlIn6QsijLWAkap5bk+Uk
	my/47i68kV8y+B5beG/1nTafKULAn7oLk2FE1nQC2v1fGQ7xCI5sg+AAIYMfOduCyC/
	jfiu+gReLZj7d5UGHjKMmAXMxsGgrwZeU3/br9/Y=
Content-Type: multipart/mixed; boundary="===============5416865485029686469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] ovmf: upgrading to edk2-stable202602 FAILED
Message-ID: <0101019d91753ced-b01a2ee3-a0eb-4b6f-9327-04203ffaeafb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235212

--===============5416865485029686469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *ovmf* to *edk2-stable202602* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 57 skipped, 0 masked, 0 errors.
Removing 62 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 75 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5416865485029686469==--

