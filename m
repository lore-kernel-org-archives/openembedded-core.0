Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18D84C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:50:04 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.44638.1752745797523358024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YnqBbrVl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F64943918;
	Thu, 17 Jul 2025 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752745795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=np1KzbxleoEsF/gEl0sMB39X76QymfiVXpMvLu5MR74=;
	b=YnqBbrVlmrVfDg5reeTPPQISFoUHtVjQ1JPcPmk8vUOwoa2zH8/VeWTdskjYUMj8SJaeBd
	jrZ/kRHmbO8tYiS6ggj8naXPiapkNQA7BNKKkleWc0ROthA4MlvT5nqv+FAQCSYY84H3SN
	nwOYQMQ0a7BaeN97PKuvdCjpegNZXar9PN8nWwbl/dr/vMNNyw7x0aZMIAQkCbc+3GnLaV
	SM9dB1wBWzXp+mFGndx9hIIxzJo/8fO/eD70dxrGCwu2A+UdTCQ+6F2//h75P6qqa1HBD6
	CUVsi9kzJBuB2pXoSewPsmsCsYJUcz0g69c5bDsRQsjAaU5cI1QRjIBMjCTUAw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 11:49:54 +0200
Message-Id: <DBE8J299IF7K.22KVHVSAEHE8@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/2] systemd: drop libmount dependency and add
 blkid and fdisk PACKAGECONFIGs
Cc: "Chen Qi" <Qi.Chen@windriver.com>, "Alexander Kanavin"
 <alex.kanavin@gmail.com>, "Hiago De Franco" <hiago.franco@toradex.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hiagofranco@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250716232931.127811-1-hiagofranco@gmail.com>
In-Reply-To: <20250716232931.127811-1-hiagofranco@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffekkeegjeehveekledutddvjeeijeegtdfftdffkeeiueevvddtgeekueduuedvnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohephhhir
 ghgohhfrhgrnhgtohesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopefsihdrvehhvghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhirghgohdrfhhrrghntghosehtohhrrgguvgigrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220526

On Thu Jul 17, 2025 at 1:29 AM CEST, Hiago De Franco via lists.openembedded=
.org wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> The libmount dependency in systemd was made optional upstream [2]. This
> series backports that change, allowing us to drop util-linux as a build
> dependency for systemd. This resolves a circular dependency between
> util-linux and systemd when systemd PACKAGECONFIG is enabled in
> util-linux. Without this fix, each recipe depends on the other,
> triggering the circular dependency error.
>
> Note that this alone does not fully resolve the circular dependency
> on util-linux-fstrim/uuid. There is another one:
>
> glib-2.0 -> util-linux -> systemd -> shared-mime-info -> glib-2.0
>
> But the libmount PACKAGECONFIG can be removed from glib-2.0 to break its
> dependency on util-linux.
>
> In addition, according to systemd's README [2], the dependencies on
> libblkid and libfdisk from util-linux are optional, so add them as new
> PACKAGECONFIGs.
>
> [1] https://github.com/systemd/systemd/commit/d1ee3889cf8e8a9edc82e41d306=
155fb4c531c8f
> [2] https://github.com/systemd/systemd/blob/main/README#L216
>
> Hiago De Franco (2):
>   systemd: drop build dependency on util-linux
>   systemd: add libblkid and libfdisk PACKAGECONFIG options
>
>  .../0001-meson-Add-libmount-feature.patch     | 58 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_257.6.bb    |  9 ++-
>  2 files changed, 65 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Add-libm=
ount-feature.patch

Hi Hiago,

Thanks for your patches.

I suspect this series is responsible from a test failure:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/core/de=
corator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime=
/cases/systemd.py", line 100, in test_systemd_failed
    output +=3D self.systemctl('status --full --failed')
  File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/meta/lib/oeqa/runtime=
/cases/systemd.py", line 26, in systemctl
    self.assertEqual(status, expected, message)
AssertionError: 3 !=3D 0 : SYSTEMD_BUS_TIMEOUT=3D240s systemctl status --fu=
ll --failed
=C3=97 systemd-boot-update.service - Automatic Boot Loader Update
     Loaded: loaded (/usr/lib/systemd/system/systemd-boot-update.service; e=
nabled; preset: enabled)
     Active: failed (Result: exit-code) since Thu 2025-07-17 09:02:59 UTC; =
25min ago
 Invocation: a44df1a151da4bbfa387c056d59eb001
       Docs: man:bootctl(1)
   Main PID: 189 (code=3Dexited, status=3D203/EXEC)
   Mem peak: 828K
        CPU: 58ms
...
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (9.36s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2034
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2030
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/2018
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2017

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


