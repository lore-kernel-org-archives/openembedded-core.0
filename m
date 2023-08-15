Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F15C2FC05
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.129644.1692086042508054497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CcKo73G8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=d1K34iFv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189f82fff31-dcb6df53-bb3e-4380-bfc3-4b2f2f11a01d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RtWR4ub5KbWMGhDw50SFYvPpK+aO9cdw+GUhu8yDvyA=;
	b=CcKo73G8H8B0Nevaeb7/RnrmU2ahxwXrDp8z1RmgIEhMVC7feC9l1Pgy+p16rq66
	Elis2+npjLfIx71U3AQstKS/l8YHSIb22laW9D4G73n3vXDMz05TqaMBoNPnjHi93E/
	wdA9Ty3DfI5BtkkpkMBJZ+krpVPslhB909BZw98g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RtWR4ub5KbWMGhDw50SFYvPpK+aO9cdw+GUhu8yDvyA=;
	b=d1K34iFvYi9X4UBB+WpfWZwPWxc6lq8wAAH7wN3ZRX7hlpjGnWPjE9gakClMe8e+
	EfOeFYs82RCArN8Af2Mr+N6YEjD0TrCAqTYlRPyf3pVe262G1eRVV7SWkidFxiz3Cmf
	HHnH9NYV3L2GxT9t6c/Rgmc62uWSJuUCvCKTnHpc=
Content-Type: multipart/mixed; boundary="===============8761655257935545226=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cargo: upgrading to 1.71.1 FAILED
Message-ID: <01010189f82fff31-dcb6df53-bb3e-4380-bfc3-4b2f2f11a01d-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185985

--===============8761655257935545226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cargo* to *1.71.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake cargo' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'mdadm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mdadm', 'udev']
NOTE: Runtime target 'btrfs-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['btrfs-tools', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'e2fsprogs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs', 'util-linux', 'mdadm', 'udev']
NOTE: Runtime target 'util-linux-col' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['util-linux-col', 'mdadm', 'udev']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb DEPENDS on or otherwise requires it)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'cargo' has no buildable providers.
Missing or unbuildable dependency chain was: ['cargo', 'libssh2', 'util-linux-col', 'mdadm', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8761655257935545226==--

