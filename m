Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D8BC25B7B
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.129655.1692086043999019562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hjJPLvqg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fauj1viX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f8300240-8383e507-1e5b-443d-a0d6-3fbf3db4fbc2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Tcfen5SWfjoJhGYs10OF0NaRaoSwxxmyD1GhgEHajvU=;
	b=hjJPLvqgyKQFrXz63uMmQb2zfjjl0P83FcezFLFYOTxBD2YJ2fDtdpOZuY7sM4NE
	RhmCfXxER/XoeDfs3CG3iJVRSdukTfM1Jr6FjExLMb+tQe18Xfog+ThE0wwY2ivw30d
	1LCwx75JFjnwTcAjlNgZM4gXTuFRnoGMCugBvtRo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Tcfen5SWfjoJhGYs10OF0NaRaoSwxxmyD1GhgEHajvU=;
	b=fauj1viXxVdGIBVz7ribGleU6Q2Apue6ewlTn6WVxyzvXQ+ZpuSWCC+PP5iZfcVY
	o5KFewrIj9LUgG70rU0XKr7+ki/wvJDWyBs6GebIO+DmsrWxvRNrt8qiBjBuewRSNIs
	rMImfQx01XqnFW7Yj1xJyYGFRBqypnOeR2BjVOao=
Content-Type: multipart/mixed; boundary="===============1890094597063407736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgudev: upgrading to 238 FAILED
Message-ID: <01010189f8300240-8383e507-1e5b-443d-a0d6-3fbf3db4fbc2-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186016

--===============1890094597063407736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgudev* to *238* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake libgudev' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb DEPENDS on or otherwise requires it)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
ERROR: Required build target 'libgudev' has no buildable providers.
Missing or unbuildable dependency chain was: ['libgudev', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1890094597063407736==--

