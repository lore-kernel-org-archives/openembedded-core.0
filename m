Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5ECCC25B7E
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.129639.1692086041948581628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bE2OliMC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nF3xgSOe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f82ff9a8-48e7c80d-c017-499f-8b7a-ae95fae62184-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ihVyHR5Dkn/LXYLK+6Cq06S0V4/nwovkf4BEevk1OEo=;
	b=bE2OliMCwFdU/7+nsLZY986lZ3ICm0ncrLYIMEfo99E2xdwq8sTbhMXjXnSCQkto
	29fK/HAiqWLIxcz1EnV8rUjR13Nnyz+cDzxFD0kmNzErjARa40OTbCdbORtZA7QCL2N
	/enW94yAF+0PuAsUEaU/4nC93/jwwTGTDd6ZQ8+4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ihVyHR5Dkn/LXYLK+6Cq06S0V4/nwovkf4BEevk1OEo=;
	b=nF3xgSOeJDbJrYWm5Pbzp8fjmM8dyQeflzhDRmyAQVo51PQFqCZNV0fhanTbm9wO
	dFfAoqw9R7KvM3/upN/2w98fsWD+BSSUZldikBD0Vu/bX5+cpwb6/K2B0ITvoL1N4R4
	N4koKznBR3rXuiyn9gW6EWHMFpQKT7YBdOYUZLZY=
Content-Type: multipart/mixed; boundary="===============4301859518356025328=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxml2: upgrading to 2.11.5 FAILED
Message-ID: <01010189f82ff9a8-48e7c80d-c017-499f-8b7a-ae95fae62184-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185956

--===============4301859518356025328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxml2* to *2.11.5* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake libxml2' failed
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
NOTE: Runtime target 'gettext' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gettext', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'gettext-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gettext-dev', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'libcroco' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libcroco', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'libcroco-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['libcroco-dev', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'shared-mime-info' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'dbus' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['dbus', 'glib-2.0', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'desktop-file-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['desktop-file-utils', 'glib-2.0', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'gnome-desktop-testing' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-desktop-testing', 'glib-2.0', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-el' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-el', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-utils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-utils', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-ru' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-ru', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-pl' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-pl', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-th' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-th', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-dev', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-fr' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-fr', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-ja' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-ja', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-lt' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-lt', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-locale-hr' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-locale-hr', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']
NOTE: Runtime target 'glib-2.0-codegen' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['glib-2.0-codegen', 'shared-mime-info', 'libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb DEPENDS on or otherwise requires it)
systemd was skipped: missing required distro feature 'usrmerge' (not in DISTRO_FEATURES)
ERROR: Required build target 'libxml2' has no buildable providers.
Missing or unbuildable dependency chain was: ['libxml2', 'python3', 'coreutils', 'liberror-perl', 'perl', 'procps-ps', 'systemd']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4301859518356025328==--

