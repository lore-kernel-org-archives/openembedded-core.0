Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE10C04A94
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:08 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.129508.1692086041061769162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Nyd4pjfO;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mUvri8+z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189f82ff63e-ae965e6c-efac-4f13-8cd4-4b8588b63df4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086040;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=/896674wHmKbyI30Wgkv5tSu27iVJhpjbQ17eSj5I64=;
	b=Nyd4pjfOxEu4UPJdJZqaYWEAVOvWn8I6Ek65ACz6698vhmx56LbCwA2jYqddG99G
	rYrC6vU/ZNN2442ViJD5rysKoLZkVgmyL+J+2shNzpgZkZ/JAilYIr63sl6zl0Bx0Uc
	DanOfMvfuO7iBJqcAwGc+f+SOT/smqwdXIu1P11c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086040;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=/896674wHmKbyI30Wgkv5tSu27iVJhpjbQ17eSj5I64=;
	b=mUvri8+z8nGjWHIcs0ipf+YCYci8WImZkrCKCrcraGqmhnyHaJihA68joDr5fJCu
	6SzfyGn3P61lm2d3ORoUNz6Ee/EDlLcYHYroLQLf58Nn8b8Q5p0Z4KN2jKU99QQe24d
	hYmj9ns6hh7nfPMry5iPIRc1DaVDMP+L9wcRJ0rc=
Content-Type: multipart/mixed; boundary="===============5006520965584333482=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] openssh: upgrading to 9.4p1 FAILED
Message-ID: <01010189f82ff63e-ae965e6c-efac-4f13-8cd4-4b8588b63df4-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185945

--===============5006520965584333482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openssh* to *9.4p1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake openssh' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Runtime target 'procps-ps' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-dev', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dpkg-start-stop' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dpkg-start-stop', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'liberror-perl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'coreutils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'openssh' has no buildable providers.
Missing or unbuildable dependency chain was: ['openssh', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5006520965584333482==--

