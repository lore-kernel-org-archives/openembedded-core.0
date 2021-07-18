Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13215.1626600382113580412
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8B60A38C1370
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] adwaita-icon-theme: upgrading to 40.1.1 FAILED
Message-ID: <MADEUP.1692D86E062AC72D.32522@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0345496260366627305=="

--===============0345496260366627305==
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
FileExistsError: [Errno 17] File exists: '/home/pokybuild/yocto-worker/auh/build/build/build/upgrade-helper/20210718050052/all/adwaita-icon-theme'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0345496260366627305==--
