Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05591C27C55
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.129652.1692086043444375171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AsQZc087;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mw9WgVy4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010189f82fff91-1e648049-7e77-4b21-883c-109f36146ab0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NCvXLATDQqqwJxSE+vBuhruIoer449506OcaEi8ppFA=;
	b=AsQZc087qQxLVGCavBx7oHGudgSBxLp3ykCmbp4BKV+vjlfXBJWb4m9RVaWe3bK9
	afz403yXqvN1XcD4SbuhHCiDuu7kTfQA6z3n2miaCshDvcVYKpuwmQIVRMlGmGZmJC8
	AEtRnjE967AsTd/MIsP0vSpGKIRkYHmcMOIjdubQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NCvXLATDQqqwJxSE+vBuhruIoer449506OcaEi8ppFA=;
	b=mw9WgVy4ECREB167iN0qzqNfu2JI+i2FuyW27axY4+BqIvqTFp3lcA8B1QmVl2lw
	P0x3PGKtfhcz4iC/yqQfLxoeB/M2+rpAuckLs51IYyYqBaEyxNFVvAXO/9AGpLftOcS
	1sLUJ9NctmJWntbwCDRq9QjJTwQvSxG27sAf/GWU=
Content-Type: multipart/mixed; boundary="===============6821863642037200047=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rust: upgrading to 1.71.1 FAILED
Message-ID: <01010189f82fff91-1e648049-7e77-4b21-883c-109f36146ab0-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186000

--===============6821863642037200047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rust* to *1.71.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake rust' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'liberror-perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'binutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['binutils', 'elfutils', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'rust' has no buildable providers.
Missing or unbuildable dependency chain was: ['rust', 'binutils', 'elfutils', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6821863642037200047==--

