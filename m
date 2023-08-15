Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C712BC27C41
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.129653.1692086043511257358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nj0mRojO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=J5wjTTSI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010189f83002ca-7ad37bd7-ce8e-4598-a4e7-36387467e6a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZDkvG2rQbWAvvWG4trQw8r365cOBLPClbz7ZiDc4F+Q=;
	b=Nj0mRojOh+4bQ5e4fXTfbJDfUZdcfAT7HsvH3gPZ61WtN2gSQtp8glogW3vNLEWj
	RAtClkXBjMAtIvBEOf+Y6hwNreL6b18UFwnbQjK7rdeAXwAaQeOJD/yoOrq6+UY+PdM
	Bo2gfgtyJmfSniot5fUtAu4VWhoWhq+VNaHQMzm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZDkvG2rQbWAvvWG4trQw8r365cOBLPClbz7ZiDc4F+Q=;
	b=J5wjTTSIB3Dkq2pb5q8a4WR+RDqv8hLAQXobNdHIWNBZz2Zr/BrD0P2g2/ZP6ElD
	/ZEJ/PgZ7t3cQpjVwV2Li7439gTMqoMIRX5K+dNl2OzCi95Q/7R58bhDowIYBC+lx7l
	FAZqjH6MgR6Rk2CvWCBzjnvwDVXf+AlG9KU2KEKE=
Content-Type: multipart/mixed; boundary="===============3617872353880418970=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xz: upgrading to 5.4.4 FAILED
Message-ID: <01010189f83002ca-7ad37bd7-ce8e-4598-a4e7-36387467e6a9-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186013

--===============3617872353880418970==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xz* to *5.4.4* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake xz' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-overload' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-overload', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-io' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-io', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-digest-md5' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-digest-md5', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-feature' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-feature', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-constant' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-constant', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'attr', 'perl-module-constant', 'procps-ps', 'systemd']
NOTE: Runtime target 'python3-math' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-math', 'coreutils', 'attr', 'perl-module-constant', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'xz' has no buildable providers.
Missing or unbuildable dependency chain was: ['xz', 'virtual/update-alternatives', 'python3-math', 'coreutils', 'attr', 'perl-module-constant', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3617872353880418970==--

