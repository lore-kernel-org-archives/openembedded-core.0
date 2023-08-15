Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE09CC27C4F
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.129528.1692086043705213658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cimuNPqI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X9Lb+UnU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010189f83001c6-48645080-6109-4fef-a8eb-1871e6b677ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Ja1AZGpssMu2k3VYJfqbJ19Om19QQrHW6HBHmBJsYc8=;
	b=cimuNPqIa0t2OlD1o1gBxfEJgF2X+tpJ8lnz37OoQ5qJ4I3E1ZNKDopV1Om0YkjZ
	R9Y3KaI7S6SEySRHKvmbcfWBJKpyuH6kFwD5cYrbNGNTTHTWQJTP4CkkbBknm2LwpUM
	e/j7p1ka2NhMcCMdsb6ZKAsz8NFLs9I3YcmZFEHM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Ja1AZGpssMu2k3VYJfqbJ19Om19QQrHW6HBHmBJsYc8=;
	b=X9Lb+UnUrfruLwEcys3tRyfh4oB3M3cQLJrDe+8cGQUpJs/iy5Ztb77mdB2L/yfj
	CHAU1Aa2E5lJC53viZFu6doktoKn8wX31E3Y2LAzW10+cRmxB4/D+AruXBa871JtZ6z
	ffADr+0rquTzKS4/m/PboLYWYd0Jxu3FP863TrSE=
Content-Type: multipart/mixed; boundary="===============0549430453287660211=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sysklogd: upgrading to 2.5.1 FAILED
Message-ID: <01010189f83001c6-48645080-6109-4fef-a8eb-1871e6b677ba-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186005

--===============0549430453287660211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysklogd* to *2.5.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake sysklogd' failed
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
NOTE: Runtime target 'perl-module-symbol' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-symbol', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-io' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-io', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-storable' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-storable', 'procps-ps', 'systemd']
NOTE: Runtime target 'perl-module-file-temp' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['perl-module-file-temp', 'procps-ps', 'systemd']
NOTE: Runtime target 'sed' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['sed', 'perl-module-file-temp', 'procps-ps', 'systemd']
NOTE: Runtime target 'python3-math' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-math', 'sed', 'perl-module-file-temp', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'sysklogd' has no buildable providers.
Missing or unbuildable dependency chain was: ['sysklogd', 'virtual/update-alternatives', 'python3-math', 'sed', 'perl-module-file-temp', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0549430453287660211==--

