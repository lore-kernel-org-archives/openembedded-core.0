Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACD6D47CB8
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:42 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1425.1768526740192686188
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VAO3FQ6P;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=JQd8SGoR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019bc468777a-d1130557-fe6d-480c-8c4b-24427ab8a4aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G73avsQi4ILgzApmrzsw0+z+5F6/DtNNmf0e8l6r/cs=;
	b=VAO3FQ6PLvo0Ap5laoSK6S+n2I5l+xkgAaTKMnF61sQiFPsJsPwFFp1AIfvYt9pY
	bLVjuXZXqwFgfs0fcVdS/VcvpuL+3yTNa67vBVzIP/fYy3RHeuWZBSt9ovVQee6OLw9
	qen2hme9BBJSGHbR62quE/kEBkjtNs5YPjDd6FL4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G73avsQi4ILgzApmrzsw0+z+5F6/DtNNmf0e8l6r/cs=;
	b=JQd8SGoRMec7w5xzO9NUGqMfA+pjJ2RUBYr4AQsQUk+361896xX+hT6JglIw1occ
	GXKInzGO2TclttWggpK7csYBcojUsfVjf3ehPUkR7Q8jCXi2hDy5ATPXk+ZQZDqVPfg
	ARwfQ0qAtSTx8ntpCRLnPFamjUMLqYsXPyC5O2Xw=
Content-Type: multipart/mixed; boundary="===============4986214521213602527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] grub-efi,grub: upgrading to 2.14,2.14 FAILED
Message-ID: <0101019bc468777a-d1130557-fe6d-480c-8c4b-24427ab8a4aa-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229445

--===============4986214521213602527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *grub-efi,grub* to *2.14,2.14* has Failed(get_env).

Detailed error information:

Empty environment returned
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)... (18:58:31.609351)
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (18:58:31.609804)
NOTE: Directory listing: ['upgrade-helper', 'command-1-write-config.log', 'README', 'buildhistory', 'bitbake-cookerdaemon.log', 'init-build-env', 'command-2-write-config.log', 'downloads', 'oe-time-dd-test.dat', 'command-2-cmds.log', 'conf', 'command-1-plain-cmds.log', 'cache', 'tmp']
NOTE: Retrying server connection (#2)... (18:58:31.718101)
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 64 skipped, 0 masked, 0 errors.
Removing 6 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 6 recipes from the qemuarm sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4986214521213602527==--

