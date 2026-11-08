Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11752.1794138741970861566
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 03:52:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ksjt2hw7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C0D501A1575
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Nov 2026 11:52:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8390B60025;
	Sun,  8 Nov 2026 11:52:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E857103288D3;
	Sun,  8 Nov 2026 12:52:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794138738; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oYeTT7V4+O8zDCsEaOyXbqLjLb6PGH9co8EIniyXD2g=;
	b=ksjt2hw7Dbew4Gk12DYJLz0knYD5Z5lVxrRIG4pnxcPxqQCzqrLs2yV05kAql6w02PlrAU
	1lJUfU13vGaP62kmdbr9X2ZVK3P7j+3m4gabWiYUjlbNMglk/PS8/a5LMxG1gPLlCPBBe8
	4G0jn+jCBOMuDj+UqgDIOUDSl/XDwkSGAGo+++wtjq+ASuyNx65tPoAIZis9sf8ODBpf7c
	anGZ1SrVbOqIKRGwCgMl1vJdye6iw3V742esHfIaGBY7QkEKZCj05reH1IAzUh5GXrFN7S
	MW5aug7uuYxxodI9xsHhbwSBqvEwDbaTbS6q3Ya6fKfFNbX68aVlV9gy3N7gzQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 12:52:16 +0100
Message-Id: <DMPT3P3ALIT3.2L2FH1MY83IWG@bootlin.com>
Subject: Re: [OE-core] [PATCH] eudev: upgrade 3.2.15 -> 3.3.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <alex.kiernan@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261107154308.1110237-2-alex.kiernan@gmail.com>
In-Reply-To: <20261107154308.1110237-2-alex.kiernan@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 11:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249755

On Sat Nov 7, 2026 at 4:43 PM CET, Alex Kiernan via openembedded-core wrote=
:
> Release notes:
>
>   https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md
>
> Drop 0001-udevd-keep-a-copy-of-the-event-devnode.patch, fixed
> differently upstream.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---

Hi Alex,

It looks like the test_devtool_deploy_target test is failing. It might
be just a need to increase the roofs size, but I'm still a bit surprised
by that.

2026-11-07 21:07:55,632 - oe-selftest - INFO - devtool.DevtoolDeployTargetT=
ests.test_devtool_deploy_target (subunit.RemotedTestCase)
2026-11-07 21:07:55,633 - oe-selftest - INFO -  ... FAIL
...
2026-11-07 21:07:55,633 - oe-selftest - INFO - 9: 34/75 294/793 (208.99s) (=
0 failed) (devtool.DevtoolDeployTargetTests.test_devtool_deploy_target)
2026-11-07 21:07:55,633 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2139, in test_dev=
tool_deploy_target
    _deploy_and_check(extra_args, check_full_filelist=3Dnot filter_args, ex=
pected_files=3Dexpected_files)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 2055, in _deploy_=
and_check
    result =3D runCmd(deploy_cmd)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'devtool deploy-target -c mdadm root@192.168.7.2 ' =
returned non-zero exit status 1:
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 2105 entries from dependency cache.
Parsing recipes...done.
Parsing of 1044 .bb files complete (1043 cached, 1 parsed). 2105 targets, 5=
6 skipped, 0 masked, 0 errors.
ERROR: insufficient space on target (available 4476, needed 5449)
ERROR: Deploy failed - rerun with -s to get a complete error message

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5222
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/5032

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

