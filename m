Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.929.1795157151413453452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 22:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gjQ53wmh;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3004B4E41681
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 06:45:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA13A6017D;
	Fri, 20 Nov 2026 06:45:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E53011BC0EC9;
	Fri, 20 Nov 2026 07:45:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795157148; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bQagoBw9Wk8J9EYcvWGluTFRstNb8MM4iSFK1hFIt4g=;
	b=gjQ53wmh8Qf1MAzWuICneGztrjbgo7XVhGxSh6PfnOw9LYhA2F+ps3BA7nAHgv3lVzK3Qx
	cx+jEO08VOX3dls0rhAHOH4oz0PzeuAhTBSad5rlBlxwqNEAyWzNjvEk6svAtKEXJv6Yke
	EAnsaw+7xO2rDkETcEm0Q3BWSEsZgcGWPFJ4FsIiIz1amMUZLn0xd/XBVYJSlz0iov68h7
	RW4t70Q2rV/3C9DxaOUnsx2bXyKT9oYaNV6Mrux/U9PhepNZQBarnFdNgFenMQBKxwSLpu
	IcbEXTM4Vp2kBe6+WI+FQ6XCHOLDzM+Vx6RojZKWnQ4jJHw2v6DpjXhKCV+6ew==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 07:45:46 +0100
Message-Id: <DMZU3K7RT9C9.3UTYQ21CQCPJK@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/6] python3: support setting RPROVIDES in
 the manifest
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261119163117.2242351-1-ross.burton@arm.com>
In-Reply-To: <20261119163117.2242351-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 06:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250728

On Thu Nov 19, 2026 at 5:31 PM CET, Ross Burton via openembedded-core wrote=
:
> Allow modules to have a 'rprovides' key, that sets RPROVIDES for the
> generated package.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

Sorry, i looks like we have a failure during testsdk:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/genericx86-64/build/build/tmp/work/genericx86_64-poky-linu=
x/core-image-sato/1.0/testimage-sdk/environment-setup-core2-64-poky-linux >=
 /dev/null; meson setup --warnlevel 1 /srv/pokybuild/yocto-worker/genericx8=
6-64/build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/test=
image-sdk/libhandyi8yr__b7/build /srv/pokybuild/yocto-worker/genericx86-64/=
build/build/tmp/work/genericx86_64-poky-linux/core-image-sato/1.0/testimage=
-sdk/libhandyi8yr__b7/libhandy-1.8.3 -Dglade_catalog=3Ddisabled -Dintrospec=
tion=3Ddisabled -Dvapi=3Dfalse;' returned non-zero exit status 1.
...
  File "/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/gene=
ricx86_64-poky-linux/core-image-sato/1.0/testimage-sdk/sysroots/x86_64-poky=
sdk-linux/usr/lib/python3.15/site-packages/mesonbuild/wrap/wrap.py", line 2=
4, in <module>
    import gzip
ModuleNotFoundError: Standard library module 'gzip' was not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/5072
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/5048

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

