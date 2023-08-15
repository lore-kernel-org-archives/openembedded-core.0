Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D09C27C65
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.129648.1692086042695735574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jd1YHHDr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Q4Z/q2TN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010189f83000a4-37d02a6a-a129-418e-9f82-cdffbd6121f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=S78jc+R7k9KV5VfbDFbWHAismbHqDLaVCG80NnAMiAE=;
	b=Jd1YHHDr4QukWGJ1G8GnLQ+Uwkr7Co3hEwIrvlmygZbFSLh8MXvGGt7fehXfIA/B
	i0hEmgZN7IqI0H5rUk8VT+V+nuPGhepHtNviVU/0x8/wnMAhAp1D6jcBOyF70qTaJwr
	0Qwmta7MRh7Mh2fVEi2NWmkZd3AnzLDufJREpcNQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=S78jc+R7k9KV5VfbDFbWHAismbHqDLaVCG80NnAMiAE=;
	b=Q4Z/q2TN84Z2iEG5RQr99sRGOwU8HghfMpa+xf73pscNq/hYjp/hgSewqHsXauCF
	Ih+eyVydrJbbqHWmCenwskK7mW6ti61mRf4eM0AOadhULDnPCWvvP5jQJxWor4kSJix
	YhldYASls9HUEmfJymqV6ySc/ZybX4YsyiKf6hWE=
Content-Type: multipart/mixed; boundary="===============1512967926398793909=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 6.05.01 FAILED
Message-ID: <01010189f83000a4-37d02a6a-a129-418e-9f82-cdffbd6121f4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185997

--===============1512967926398793909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *6.05.01* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake man-pages' failed
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
NOTE: Runtime target 'perl-module-io-seekable' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-io-seekable', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-overload' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-overload', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-parent' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-parent', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-file-compare' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-file-compare', 'procps-ps', 'systemd']
NOTE: Runtime target 'sed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sed', 'perl-module-file-compare', 'procps-ps', 'systemd']
NOTE: Runtime target 'python3-shell' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-shell', 'sed', 'perl-module-file-compare', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'man-pages' has no buildable providers.
Missing or unbuildable dependency chain was: ['man-pages', 'virtual/update-alternatives', 'python3-shell', 'sed', 'perl-module-file-compare', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1512967926398793909==--

