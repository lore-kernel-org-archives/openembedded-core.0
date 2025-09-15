Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A87CCAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.30922.1757937279454211387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=TTDs6NwP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=EcJDBHnP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101994d3a2896-e8b436fd-3386-49a4-a95b-3448ba3397dd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GxEvmehTRoS7oZwu+I6btUBmGK9DqZ2i9bXTGg43QkU=;
	b=TTDs6NwPYY120922Es99vBkm+GBFlAIykQg4/7JgsPu5pxm/s/S95hCoGhm3H4qK
	IWSmqeIJ1krgRQKyGJ8sDneCYxOWU7CA1U1TJk2J17oDayXCZ/wJM9AZu9RlhH+NMAg
	0CjCGM+uCXrC2grEcTRCzyrJfd8quU27rifbeK4k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937281;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GxEvmehTRoS7oZwu+I6btUBmGK9DqZ2i9bXTGg43QkU=;
	b=EcJDBHnPAwtfXpizuZ9qZZpyYpHSGPejyrJ6mq+zlaSEj7ZFYY+15qsVJXD1RR4F
	JguWSzrqPNOKnZKrtllCjSNrGpTfJLkn8QetTyjw/7S14VT5vUaxsGWkTdqHtUugHw+
	FeN2v6S8AptIHJAgMQLcR82YiS2BYEsyxmwd+vuI=
Content-Type: multipart/mixed; boundary="===============0276162287616712325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 25.2 FAILED
Message-ID: <010101994d3a2896-e8b436fd-3386-49a4-a95b-3448ba3397dd-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:41 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223424

--===============0276162287616712325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *25.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-pip -V 25.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1939 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0932288ab55cd8c098350f2af039763021d35d2d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0932288ab55cd8c098350f2af039763021d35d2d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1940 targets, 43 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-0932288ab55cd8c098350f2af039763021d35d2d"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0932288ab55cd8c098350f2af039763021d35d2d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  52% |##################                  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pip/pip-25.2.tar.gz;downloadfilename=pip-25.2.tar.gz...
INFO: Rebasing devtool onto 6773fd56ceaba8527d2f77e0a3c57fd16b2d593b
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 352, in <module>
    ret = main()
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 610, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/srv/pokybuild/yocto-worker/auh/build/scripts/lib/devtool/upgrade.py", line 509, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/python3-pip/src/pip/_vendor/typing_extensions.LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0276162287616712325==--

