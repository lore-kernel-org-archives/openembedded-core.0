Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8DEC25B7A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.129639.1692086041948581628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CsQO6m/V;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h9NIvRcU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f8300429-85d61f11-3f5f-4fd8-b483-6ec9d3a10cec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xwuWlblnXfVIneJqzW9G40mj5yeJX1OtFO8xo/EZhBg=;
	b=CsQO6m/VMXfJa2ZKkop02rFHst21owemClOAhOJpht+uk1AdF4yyAzn7NKA9WGlA
	nr/XdsfciDtzBt52qYb3kG5+P7sNELBFPfesC8M1v6ZefMrIF8U50xQoxdnZsugKmm+
	UpW4T6DQHGcMuQZcF/fXOqmmxoqzUz80zgR7oMtw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xwuWlblnXfVIneJqzW9G40mj5yeJX1OtFO8xo/EZhBg=;
	b=h9NIvRcU9Uegu1Ea0Ibqpcw7ZnSXHljw3podBKl71NFrTzq1pOuosjFU8rPKoSN0
	K1PXzTRubEbQOPEBGzGIfGii+8xtvjAfX1QxYx3BkP4+70Pw4ZjSv3qp+6BrxboKx7J
	EWSCBAnr4RihgimYcRaV4pxd274YpIw2ovNw7Dck=
Content-Type: multipart/mixed; boundary="===============7082181630915922685=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.250.1 FAILED
Message-ID: <01010189f8300429-85d61f11-3f5f-4fd8-b483-6ec9d3a10cec-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186019

--===============7082181630915922685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *1.3.250.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake spirv-tools' failed
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1804 targets, 42 skipped, 0 masked, 0 errors.
Removing 7 recipes from the core2-32 sysroot...done.
Removing 7 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']
NOTE: Runtime target 'util-linux-setpriv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['util-linux-setpriv', 'procps', 'systemd']
NOTE: Runtime target 'bash' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bash', 'util-linux-setpriv', 'procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'spirv-tools' has no buildable providers.
Missing or unbuildable dependency chain was: ['spirv-tools', 'bash', 'util-linux-setpriv', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7082181630915922685==--

