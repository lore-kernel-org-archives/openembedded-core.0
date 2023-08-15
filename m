Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38292C2FC01
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.129649.1692086043067155086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gg070I9o;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QK3DXGkT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010189f82ffef1-968f09f5-96ad-4c8d-af35-085b1a5231f7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=lYxTGUjOcWmu+dnN6JYMvWAzpD2bXtmNCwkTGZZIADU=;
	b=Gg070I9oyZlmDq0SBket1GFC6yVq21+j7h0Yh+3xeqAcNPAFCq7P/Iqq4QifG0d6
	1vcEmEXNpZVaRqDDCyJe9XJZGYkYKldfWxi62+Q/bZ3ciqlfJWP+z+yp0uK/wORWC6F
	Xnid42F+s3CPBnAujHyqhFgvWcOzmYpwYNp7mi3E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086042;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=lYxTGUjOcWmu+dnN6JYMvWAzpD2bXtmNCwkTGZZIADU=;
	b=QK3DXGkTqpW9/zHSfSkYN0bxk7JKgYmElosxroER0PQKg86fs0HFLw4/cUbTNH2F
	DngK8JkYwwfVe81/JPJ3cc/MnZIqAIs18uLvhPxjreEZubKfi0A0j20zCATnMomGtXU
	ETr5FZNe+ph4wZbXdR2bS/MgO4lUGjosxkD+fILI=
Content-Type: multipart/mixed; boundary="===============8895470101484734729=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-trove-classifiers: upgrading to 2023.8.7 FAILED
Message-ID: <01010189f82ffef1-968f09f5-96ad-4c8d-af35-085b1a5231f7-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185989

--===============8895470101484734729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-trove-classifiers* to *2023.8.7* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake python3-trove-classifiers' failed
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
ERROR: Required build target 'python3-trove-classifiers' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-trove-classifiers', 'python3', 'coreutils', 'acl', 'e2fsprogs-mke2fs', 'util-linux', 'procps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8895470101484734729==--

