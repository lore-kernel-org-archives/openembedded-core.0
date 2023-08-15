Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51EC9C2FC07
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.129524.1692086042788250121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dzvow3Oa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hF0Vq+Wl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189f82ffe86-1be617c1-f7e0-4602-a915-525da94ef502-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jOGE6f79WxNTo9HhmSaBcbfaMKi10qbZyxfXmp9+uCc=;
	b=dzvow3OaDFDr283recAQhmYnRDSV7khDLTJyPaJ/EKJuNgIAzHPqvM1QFVpI4fiP
	kv/uG/VJAI4SM4Pv/4g+AkVsmcYEKlIWttBPYh9DctP9KBfNNXTGB/20JBsfQAU/Cf8
	3LOCeUfqrR1WBda+LS1yPaa1A86yqoXrhAFlYaIc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jOGE6f79WxNTo9HhmSaBcbfaMKi10qbZyxfXmp9+uCc=;
	b=hF0Vq+WlwZivf0KfJmB5e8K/gV9BGqyFx+LdBk5knSn7ZEdPzTd9nd/xy7zc4Zds
	i7KnxKGlNyEPCBN4R35w7rLaYf8jWPeBAR9RhDJbvSch3q/SikQvhJvOvvi6VO2rcYm
	U0kcC2LQ9KPJzSEOtEUqykMwgPSVxkoZJ5n6D2GY=
Content-Type: multipart/mixed; boundary="===============8633049944201357223=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinxcontrib-qthelp: upgrading to 1.0.6 FAILED
Message-ID: <01010189f82ffe86-1be617c1-f7e0-4602-a915-525da94ef502-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185982

--===============8633049944201357223==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinxcontrib-qthelp* to *1.0.6* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake python3-sphinxcontrib-qthelp' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps', 'systemd']
NOTE: Runtime target 'e2fsprogs-mke2fs' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'python3-sphinxcontrib-qthelp' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-sphinxcontrib-qthelp', 'python3', 'coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8633049944201357223==--

