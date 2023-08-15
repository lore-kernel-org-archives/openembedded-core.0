Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC4DC07E8B
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.129534.1692086044837469951
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Lgml8HYW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HCom1Q/F;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189f8300516-43ba89b2-835e-45ef-a9e0-2e7b5e0d0bbe-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZxcD69J7oici1vvG0WIpKt9EBEhgF8ujryOm/96QYxo=;
	b=Lgml8HYWJnZaULgMxLeeherxqTa9FlEpXmllUQYB3ztRIUXJ+fmvy3TTs1zaEjU8
	Eh8I4r8LVE9bOELL2Lcd2Yk1IipxrMBruO/d2jEhNHalSEoZT//zq/9+DkMabXn25Un
	cXujhXKS+K+G9CnmnI9Y7s1c0iNQF2GhOevYPcSs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZxcD69J7oici1vvG0WIpKt9EBEhgF8ujryOm/96QYxo=;
	b=HCom1Q/Fkq+M/JGPNqlGWLUL5D22pwu5ewlq8oSgaulB36TbD6ttj2KOn2GOiz4P
	hfkLwTGCP62Fv5NEB4K+c1lKxYhuLbxvdTGEavrWXq7DVPze2K8BlBoF2SGhSqNvJGa
	8gPW85tUKdxtEDlNS3OXvZ8JWpJ4MtBebyvEOwG0=
Content-Type: multipart/mixed; boundary="===============7264617921698899095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] weston: upgrading to 12.0.2 FAILED
Message-ID: <01010189f8300516-43ba89b2-835e-45ef-a9e0-2e7b5e0d0bbe-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186043

--===============7264617921698899095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *weston* to *12.0.2* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake weston' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/libinput_1.23.0.bb DEPENDS on or otherwise requires it)
systemd PROVIDES udev but was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd' (in DISTRO_FEATURES)
ERROR: Required build target 'weston' has no buildable providers.
Missing or unbuildable dependency chain was: ['weston', 'udev']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7264617921698899095==--

