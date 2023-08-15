Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E9DC25B7D
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.129644.1692086042508054497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SnYbN/8b;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jznE3G1i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010189f8300469-da833890-c704-4b5a-9eb6-679fe8b77ded-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GGkpz2KAe5B7qiXUG3kAsXzRrNRx4GfmDeYCymAzXTw=;
	b=SnYbN/8be+G/lIJnoTYyISSDWilHVwDk3aekOk0s6yBweqBFJ+qquE17jb030H8y
	u148tXg8LvLAOrOjXmDD0b1JrKwRrNlAF68q01raqlk27Org4KbEzHgdepfMnvPe6y/
	W0phr9dJT2q29SkwZlU/6A6VNqIE+rpLxJu5UKc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GGkpz2KAe5B7qiXUG3kAsXzRrNRx4GfmDeYCymAzXTw=;
	b=jznE3G1ije/9co5Fv7IpLVPvWR4AehBSKMlFsXukBLQC7R83y0Yp+g65WRoLtRaC
	8ZTyoOu8MTztM180BATd9cTiRV6NUPv0/EVfaNusFKjkw84+nBRW+m94/zGLR9fOEzQ
	c+GQo1/11zY9HHh5f4FJAqPLwd939QWa22ekb81k=
Content-Type: multipart/mixed; boundary="===============3723064800001726169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.3.250.1 FAILED
Message-ID: <01010189f8300469-da833890-c704-4b5a-9eb6-679fe8b77ded-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186017

--===============3723064800001726169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.3.250.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake vulkan-loader' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'liberror-perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'mesa-vulkan-drivers' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mesa-vulkan-drivers', 'vulkan-loader', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'mesa-megadriver' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mesa-megadriver', 'vulkan-loader', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'mesa-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mesa-dev', 'vulkan-loader', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'libgles2-mesa-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libgles2-mesa-dev', 'vulkan-loader', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'vulkan-loader' has no buildable providers.
Missing or unbuildable dependency chain was: ['vulkan-loader', 'wayland', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3723064800001726169==--

