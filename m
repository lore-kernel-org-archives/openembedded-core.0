Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E83C3DA44
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.129646.1692086042663873551
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JlFwNDRN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YhE5o7fN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189f82ffb51-b5612830-78fd-41aa-846a-5462f67c0ce5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=p9KaNyBJmLlzDs8DCHwvEcLlBDYvUYUWOS6OUJyZg/o=;
	b=JlFwNDRN3kWhNUvvCdkovNar4/RV1GvFj8lUZBvNdOXjPgGLL32WepmFMPP0ON/b
	kG6MAto4/weGThrkoTPSKNL/ZbEHYo48ZKTftwvw9bvn+tcpuYrzS0jo6j6bI/1WUWD
	yh9Ri2h3Wb7ECD4Ud6nEl77n4taTj7R72QePa7E4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=p9KaNyBJmLlzDs8DCHwvEcLlBDYvUYUWOS6OUJyZg/o=;
	b=YhE5o7fNhSCjCMXFyRrPDV6ROu5NxrC/aj63lsFg2wDlOFoeqsjGNXw9/gPDmlGc
	xojqR3j7gk/eJLGPzYAGXuV7qbojP8wpJLRG+E57p/Wk8hiKL+0SeIhpa2wJxLymwwp
	CPIoBY3Np4aLWN69O/6djoDzy7Ykxv8wV8TK//8Y=
Content-Type: multipart/mixed; boundary="===============1946509760213745261=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] json-c: upgrading to 0.17 FAILED
Message-ID: <01010189f82ffb51-b5612830-78fd-41aa-846a-5462f67c0ce5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185975

--===============1946509760213745261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *json-c* to *0.17* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake json-c' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'mdadm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mdadm', 'udev']
NOTE: Runtime target 'btrfs-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['btrfs-tools', 'e2fsprogs', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'e2fsprogs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'gettext' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gettext', 'glib-2.0', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'gettext-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gettext-dev', 'glib-2.0', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'util-linux-sulogin' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['util-linux-sulogin', 'mdadm', 'udev']
NOTE: Runtime target 'ptest-runner' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ptest-runner', 'shadow', 'util-linux-sulogin', 'mdadm', 'udev']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb DEPENDS on or otherwise requires it)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'json-c' has no buildable providers.
Missing or unbuildable dependency chain was: ['json-c', 'ptest-runner', 'shadow', 'util-linux-sulogin', 'mdadm', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1946509760213745261==--

