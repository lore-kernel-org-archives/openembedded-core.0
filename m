Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EF9C25B7F
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.129511.1692086041712476985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a79fERo8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HAGEuGGC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f83003d5-2c8e24b5-8f67-4f32-b94e-7aea4d327fbb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UqhLsv3H40fCL/h/Aq7XlbdCzPlxGn5U0thsP6Uj4cg=;
	b=a79fERo8MlQFLWCEuBU+v9iZS3DUtwkLHfxwPSSXQrqI/aRxiOiSDfGmABKHsmDv
	OoUjJOXQfIU3zxybQr/Zb1ae37lvmcBH4KhfJ2FUa3mY/S6Ga05UWr63cHlt5lMnKoN
	X5qYAW6YUX7Jd8/vLIg4O48sTLBoWaJsT0JLDtf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UqhLsv3H40fCL/h/Aq7XlbdCzPlxGn5U0thsP6Uj4cg=;
	b=HAGEuGGCDXZYvnKyzfOpdLzp16oDS6J57j4HQIYwWKEwsj5DejFxEG86VD2VpzAf
	SB2xGlTSzpI/TK2VnspTkP43DIBvRjWuaRwBNusZOA5vXGcJmP32dz7WQulgmSXalVU
	22Hxt7sXBOHfn8058rPwBD4phofA+uxihS7qO34o=
Content-Type: multipart/mixed; boundary="===============2740472674787083333=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2023.6 FAILED
Message-ID: <01010189f83003d5-2c8e24b5-8f67-4f32-b94e-7aea4d327fbb-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186015

--===============2740472674787083333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2023.6* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake shaderc' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']
NOTE: Runtime target 'btrfs-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['btrfs-tools', 'util-linux', 'procps', 'systemd']
NOTE: Runtime target 'e2fsprogs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs', 'util-linux', 'procps', 'systemd']
NOTE: Runtime target 'e2fsprogs-mke2fs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']
NOTE: Runtime target 'bash' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['bash', 'coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'shaderc' has no buildable providers.
Missing or unbuildable dependency chain was: ['shaderc', 'spirv-tools', 'bash', 'coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2740472674787083333==--

