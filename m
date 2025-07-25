Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB837C83F26
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 08:07:13 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.14431.1753430827544573715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 01:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=X4emFhoZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BDAD44474;
	Fri, 25 Jul 2025 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753430825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nx8PJe/H1A4lCrXM26rY/Oo2nLXPfbcMTdD7V17OKC4=;
	b=X4emFhoZv4KvIgllQNeMIvf8Sq/cYTSSxuKDHB9p2iRrZMMK8YpUdk6KknVCVX8XrMtuhI
	xNLxKIk6qKBdPAcN41PhE20+F5a+9+0MgiKq5MZ9R/RvI70Xnsw72lb73ymkr+QtsCBaHz
	TYoer0b0JqKr+FalBPwQvI+acgdxkxAuHzWdEroYyc7pXYoeSozFqgLG5h3x3bdFFBAO5s
	XeCb3+HAmRcBuzzAwdnuwYiJzV6Kl3szTznZ1OOXcLgNXI+HK+ONNFIxa3+1QRMPWFsFPm
	cgXwSU08GbNEs4tVxe+Rf9esVXUiecpx992CqIhD/vi53llcC6h+TobmejSaow==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 10:07:04 +0200
Message-Id: <DBKZCOQ8H2DN.3VVVDJ7MOZON2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] python_pep517: set CONFIGURE_FILES
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250724161543.2253776-1-ross.burton@arm.com>
In-Reply-To: <20250724161543.2253776-1-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekfedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffejtefhvedvieetfeehffffhfeiveeugeettdefvdfgudeuudffieehkeehteetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpphihthhhohhnrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtp
 hhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 08:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220899

On Thu Jul 24, 2025 at 6:15 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Move the CONFIGURE_FILES assignment from python_mesonpy to the common
> class, as it isn't specific to mesonpy.
>
> Also extend, so that it doesn't clobber existing settings.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like one of these patches is breaking several builds:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/build-appl=
iance/build/build/tmp/work/core2-64-poky-linux/python3-smmap/6.0.0/temp/log=
.do_compile.2629166
Log data follows:
| DEBUG: Executing shell function do_compile
| /srv/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/core2-64=
-poky-linux/python3-smmap/6.0.0/recipe-sysroot-native/usr/lib/python3.13/si=
te-packages/setuptools/dist.py:759: SetuptoolsDeprecationWarning: License c=
lassifiers are deprecated.
| !!
|
|         *****************************************************************=
***************
|         Please consider removing the following classifiers in favor of a =
SPDX license expression:
|
|         License :: OSI Approved :: BSD License
|
|         See https://packaging.python.org/en/latest/guides/writing-pyproje=
ct-toml/#license for details.
|         *****************************************************************=
***************
|
| !!
|   self._finalize_license_expression()
| usage: setup.py [global_opts] cmd1 [cmd1_opts] [cmd2 [cmd2_opts] ...]
|    or: setup.py --help [cmd1 cmd2 ...]
|    or: setup.py --help-commands
|    or: setup.py cmd --help
|
| error: option -l not recognized
| WARNING: exit code 1 from a shell command.

Or a similar one with python3-magic-native.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/78/builds/2136
https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/2168
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/2127

Can you have a look at these please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


