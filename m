Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68669C5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 14:33:10 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8493.1787149985491053481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 07:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Qrm1Fdpb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5D41A4E412D9;
	Wed, 19 Aug 2026 14:33:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 314CF5FF42;
	Wed, 19 Aug 2026 14:33:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD32111C7579C;
	Wed, 19 Aug 2026 16:32:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787149978; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eZzMhMIoKJYAlztCpmWf8dqExmsQQdrZFFb/YrFSitw=;
	b=Qrm1Fdpb9x/IdxYNQ2fBjpG/dt36OYV5hCGlmhD/MyWfvCmSBzp13XzrxDV3Wx8InkaSzY
	ceC5SnZ5LRBGlm7t/xNSza5ZY+CoXzm+E96dSmsyn9HLfzugPqJTri973h8C6pRcsFcamV
	r2HLxILCM1zLEti4ejeH9EbgZ6p1GSRaUGS9ytSgW9tXAA46yIndpcFIv430TcdWEyISn5
	GPeIp+WsaT0vhI3A2V6qmgj5XiaE6CE9p4b3ATdUCY5FSebooQaS3eG+Or5hStco9HCDAU
	qmnhrvtKjDDtOOxLq2ZEcjs4fDBg8r0rqNlokgGDpJTgBQ3XBntd6djZhDJy7w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 16:32:57 +0200
Message-Id: <DKSZSLHAIC87.T4Z052L890U2@bootlin.com>
Subject: Re: [OE-core][PATCH] licences: Move exceptions to subdirectory
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818221721.3820389-1-JPEWhacker@gmail.com>
In-Reply-To: <20260818221721.3820389-1-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 14:33:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243731

On Wed Aug 19, 2026 at 12:17 AM CEST, Joshua Watt via lists.openembedded.or=
g wrote:
> Moves the SPDX license exceptions to a subdirectory to make the easier
> to identify as license exceptions vs. actual licenses
>
> This should have no effect on other layers since SPDX doesn't allow
> custom Exceptions like it does for Licenses (via LicenseRef-); since we
> have already enumerated all known exceptions, its unlikely any other
> layer have added their own
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

Hi Joshua,

Thanks for your patch.

It looks like this is breaking devtool/recipetool:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/sdkext/cases/devtool.py", line 59, in test_devtool_add_reset
    self._run('devtool add myapp %s' % self.myapp_dst)
  File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/=
meta/lib/oeqa/sdkext/case.py", line 22, in _run
    return subprocess.check_output(". %s > /dev/null;"\
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/subprocess.py", line 466, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib64/python3.12/subprocess.py", line 571, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-minimal/1.0/testsdkext/environment-setup-core2-32-poky-linux > /dev/null; =
devtool add myapp /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/=
qemux86-poky-linux/core-image-minimal/1.0/testsdkext/myapp;' returned non-z=
ero exit status 1.
Standard Output: NOTE: Reconnecting to bitbake server...
NOTE: Reconnecting to bitbake server...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts=
/recipetool", line 111, in <module>
    ret =3D main()
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts=
/recipetool", line 100, in main
    ret =3D args.func(args)
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts=
/lib/recipetool/create.py", line 798, in create_recipe
    handle_license_vars(srctree_use, lines_before, handled, extravalues, ti=
nfoil.config_data)
    ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/scripts=
/lib/recipetool/create.py", line 965, in handle_license_vars
    for node, licfile, md5 in find_licenses(srctree, d):
                              ~~~~~~~~~~~~~^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/li=
b/oe/license_finder.py", line 201, in find_licenses
    licenses =3D match_licenses(licfiles, srctree, d, extra_hashes)
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/li=
b/oe/license_finder.py", line 173, in match_licenses
    md5sums.update(_crunch_known_licenses(d))
                   ~~~~~~~~~~~~~~~~~~~~~~^^^
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/meta/li=
b/oe/license_finder.py", line 52, in _crunch_known_licenses
    md5value =3D bb.utils.md5_file(path)
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/bitbake=
/lib/bb/utils.py", line 648, in md5_file
    return _hasher(sig, filename)
  File "/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-po=
ky-linux/core-image-minimal/1.0/testsdkext/layers/openembedded-core/bitbake=
/lib/bb/utils.py", line 623, in _hasher
    with open(filename, "rb") as f:
         ~~~~^^^^^^^^^^^^^^^^
IsADirectoryError: [Errno 21] Is a directory: '/srv/pokybuild/yocto-worker/=
qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0/test=
sdkext/layers/openembedded-core/meta/files/common-licenses/exceptions'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4408
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/4463
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4420
https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2154
https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4537

Everything else looks fine here. Can you have a look at that?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


