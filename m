Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5882.1624805202621218889
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id E0DF238C1283
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 40.1.1 FAILED
Message-ID: <MADEUP.168C77B92A507D8D.19577@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6893786161048727196=="

--===============6893786161048727196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *adwaita-icon-theme* to *40.1.1* has Failed(other errors).

Detailed error information:

Failed(unknown error)
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/auto-upgrade-helper/upgrade-helper.py", line 481, in run
    step(self.devtool, self.bb, self.git, self.opts, pkg_ctx)
  File "/home/pokybuild/yocto-worker/auh/build/build/auto-upgrade-helper/modules/steps.py", line 39, in load_env
    os.mkdir(pkg_ctx['workdir'])
FileExistsError: [Errno 17] File exists: '/home/pokybuild/yocto-worker/auh/build/build/build/upgrade-helper/20210627050303/all/adwaita-icon-theme'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6893786161048727196==--
