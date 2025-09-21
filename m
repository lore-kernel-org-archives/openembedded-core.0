Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A650BCAC5A8
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 07:40:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.25430.1758440418469664439
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 00:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wH6n6lRB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 654F44E40D86;
	Sun, 21 Sep 2025 07:40:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25BD560634;
	Sun, 21 Sep 2025 07:40:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58090102F16C2;
	Sun, 21 Sep 2025 09:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758440415; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kyJSnioNYWLA9XVinz/z1W5eM3johqzN4/hn/eyoPbk=;
	b=wH6n6lRBzUNyAbFE94DyUOYlU0Xd9RxJ4IUbkNOwRQJTkH/luL1E1IZMcksm1LOdAPOvrC
	WTDg0gOm+6eWDzoAXRCQbM1DZ2UOi2LxirzyazIRpD1QM97vqFn08IUbAqanLEXsZYbtck
	SH3/+qIbIPve/uNKObHub/BRSTcF7bbMflBsGBaFHuf1jSdqQwyXPoctj/PIrdWE6hp8r2
	IcBm1WQ0sHq1LKM7mTgNJP2Km2tvuFcUdb1P6Z/S6OjVE3A+UWJJDAj60wgTbLQPKbIBsK
	kUCxTJQGq0DmKUK0GYpFYEeBz1juJwWv9upwBrkUeVVifjb0HL71SCXFUAtXwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 09:40:11 +0200
Message-Id: <DCYB3P86O998.3GPS55UV93JDF@bootlin.com>
Subject: Re: [OE-core][PATCH 6/6] python3-setuptools-scm: upgrade 8.3.1 ->
 9.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
 <20250919164803.3174518-6-tgamblin@baylibre.com>
In-Reply-To: <20250919164803.3174518-6-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 07:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223787

On Fri Sep 19, 2025 at 6:48 PM CEST, Trevor Gamblin wrote:
> Release notes (https://github.com/pypa/setuptools-scm/releases):
>
> v9.2.0:
>
> - reiterate version inference by RonnyPfannschmidt in #1202
> - simple activation now requires a extra instead of setting up many
>   pre-existing projects for failure/error
>
> Note that there were several v9.2.x releases yanked upstream before this
> one was added on August 16th.
>
> Add python3-tomllib to the RDEPENDS list so that the module imports OK.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

It looks like this is breaking the build of some package:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/beaglebone=
/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0=
.33.0/temp/log.do_compile.2316634
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
| /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-ne=
on-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib=
/python3.13/site-packages/setuptools/dist.py:759: SetuptoolsDeprecationWarn=
ing: License classifiers are deprecated.
| !!
|=20
|         *****************************************************************=
***************
|         Please consider removing the following classifiers in favor of a =
SPDX license expression:
|=20
|         License :: OSI Approved :: GNU Lesser General Public License v3 o=
r later (LGPLv3+)
|=20
|         See https://packaging.python.org/en/latest/guides/writing-pyproje=
ct-toml/#license for details.
|         *****************************************************************=
***************
|=20
| !!
|   self._finalize_license_expression()
| /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-ne=
on-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib=
/python3.13/site-packages/setuptools_scm/_integration/version_inference.py:=
51: UserWarning: version of python-dbusmock already set
|   warnings.warn(self.message)
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native=
/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 71, in=
 __getattr__
|     return next(
|         ast.literal_eval(value)
|         for target, value in self._find_assignments()
|         if isinstance(target, ast.Name) and target.id =3D=3D attr
|     )
| StopIteration
|=20
| The above exception was the direct cause of the following exception:
|=20
| Traceback (most recent call last):
|   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native=
/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 185, i=
n read_attr
|     value =3D getattr(StaticModule(module_name, spec), attr_name)
|   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/corte=
xa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native=
/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 77, in=
 __getattr__
|     raise AttributeError(f"{self.name} has no attribute {attr}") from e
| AttributeError: dbusmock has no attribute __version__
|=20

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2434

Can you have a look at this issue please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


