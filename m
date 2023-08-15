Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B710C27C78
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.129645.1692086042611618535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a9V5DOgp;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BRntGsia;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189f8300088-c8346fd9-84a6-4007-95ce-9d9b6ef0fe90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ibK5cRVBKm2aVmKr9jPgpf7sIsg04cZcAt3gSXMCKxs=;
	b=a9V5DOgpw5VbCByb0+OnLKh7lhv4iw/6b5uXeZM+OxMhS79GiaU7nZVfClKDnPl4
	Zh7s9IH1jDjg5Lcgy2aXA9zQZX27c0KqNGqDyao7tJI/vUoTOR41ZL18QhutAKj3i4j
	n+tmsi+sET3DBXt4bSSM26f0yGvS1NKMACGEez/0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ibK5cRVBKm2aVmKr9jPgpf7sIsg04cZcAt3gSXMCKxs=;
	b=BRntGsiaHhjXcghgsixcr/5ujMow9ldObZtGTud5LBcHL4a5yfnPIvtXh182VTO7
	CEiKb4BrIEWC8IoLOqRszEOzxcnfSU2D7Tmll/p4TRyk0PhJDzRpxePGM77jaTeX7cj
	ahClgerLCUuWeiGBWTVdIqCR4rhBrwrK+YG48d1Q=
Content-Type: multipart/mixed; boundary="===============1433838278477756718=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 643 FAILED
Message-ID: <01010189f8300088-c8346fd9-84a6-4007-95ce-9d9b6ef0fe90-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185991

--===============1433838278477756718==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *643* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake less' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-overload' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-overload', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-file-basename' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-file-basename', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'acl', 'perl-module-file-basename', 'procps-ps', 'systemd']
NOTE: Runtime target 'python3-crypt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-crypt', 'coreutils', 'acl', 'perl-module-file-basename', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'less' has no buildable providers.
Missing or unbuildable dependency chain was: ['less', 'virtual/update-alternatives', 'python3-crypt', 'coreutils', 'acl', 'perl-module-file-basename', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1433838278477756718==--

