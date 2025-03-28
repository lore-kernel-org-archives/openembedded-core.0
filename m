Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4454C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 10:36:25 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.8142.1743158179110698481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 03:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Vn5USQOD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 523024320C;
	Fri, 28 Mar 2025 10:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743158177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBdNbn51kEoDdruNZ2BOtj7ufypYJk50kRdiwaaiR80=;
	b=Vn5USQOD8guJ+LiPDobwtSfbFO52JIFcRqDpfSr5/rtOw3v3gar7qpDoejr9RR1Xb9GdpX
	fRY6P4D9qpsmLtScx0c1nM4ssK4fcVAB5vjNN+LtAzQ3j7VzYqu7vpmf9dqyrY9mE+g5IH
	U33V08M6HRvY5OqMvWOrYjxS8xZePHItFU9he3jw2aaLdfov9bDgW0jnYCgLjJzObgxGTD
	iRqU+KgeFdcIU4Us+PSnF6w+mLsH5pPSeG7QBjn83BO/tYklLFtG+fHMZmOsaQR47DV4oN
	Lybi7PtXxL+V3w9xL2yBIBwJIRW5gqqOJT8usAATQGEJD88xbGvokRdVIP7PNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Mar 2025 11:36:15 +0100
Message-Id: <D8RU02JC2FSE.3ORJNCQOPYRSJ@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] meson: Allow user to override setup
 command options
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tom.hochstein@oss.nxp.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250327225959.3611495-1-tom.hochstein@oss.nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegsudekfhemgegrvgeimegtjeeggeemfhejleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegsudekfhemgegrvgeimegtjeeggeemfhejleeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhomhdrhhhotghhshhtvghinhesohhsshdrnhigphdrtghomhdprhgtphhtthhop
 ehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 10:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213825

On Thu Mar 27, 2025 at 11:59 PM CET, Tom Hochstein via lists.openembedded.o=
rg wrote:
> The user cannot override the setup command options --cross-file and
> --native-file because the meson-wrapper places these options on the
> command line after the user options. This problem was noticed when
> trying to build with an SDK using a custom cross-file.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
> ---

Hi Tom,

Thanks for your patch.

It looks it breaks some test on the autobuilder, maybe specific to x86:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/cases/m=
eson.py", line 42, in test_epoxy
    log =3D self._run("meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno -Dx11=3Dfa=
lse {build} {source}".format(**dirs))
  File "/srv/pokybuild/yocto-worker/qemux86/build/meta/lib/oeqa/sdk/case.py=
", line 15, in _run
    return subprocess.check_output(". %s > /dev/null; %s;" % \
  File "/usr/lib/python3.9/subprocess.py", line 424, in check_output
    return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTrue,
  File "/usr/lib/python3.9/subprocess.py", line 528, in run
    raise CalledProcessError(retcode, process.args,
oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image=
-sato/1.0/testimage-sdk/environment-setup-core2-32-poky-linux > /dev/null; =
meson --warnlevel 1 -Degl=3Dno -Dglx=3Dno -Dx11=3Dfalse /srv/pokybuild/yoct=
o-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.=
0/testimage-sdk/epoxy9vkngm2b/build /srv/pokybuild/yocto-worker/qemux86/bui=
ld/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk/epox=
y9vkngm2b/libepoxy-1.5.3;' returned non-zero exit status 1
Standard Output: meson-wrapper: Implicit setup command assumed
meson-wrapper: Running meson with setup options: " --cross-file=3D/srv/poky=
build/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-ima=
ge-sato/1.0/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/share/meson/i68=
6-poky-linux-meson.cross --native-file=3D/srv/pokybuild/yocto-worker/qemux8=
6/build/build/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testimage-sdk=
/sysroots/x86_64-pokysdk-linux/usr/share/meson/meson.native "

ERROR: Unknown CPU family i686, see https://wiki.yoctoproject.org/wiki/Meso=
n/UnknownCPU for directions.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/1265
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/1283

Can you have a look at these test failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


