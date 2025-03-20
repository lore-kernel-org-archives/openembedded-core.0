Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD2DC36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:02:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2490.1742457768057359583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WHenV9kD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4C1E20486;
	Thu, 20 Mar 2025 08:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742457766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09lagupKXNo/zkrwnvd5UqJskhpOBq5QfXtOGAm5qnY=;
	b=WHenV9kDbZjNV0FPC+bREiVkBrQS5uldYYhPfgIXKfdhpp3sK0ncLbjOUAv3bU/1A7ZpTe
	gyfa3y8W4XXC/WAkyuoCsN0BOkaJOXAUYJZoX6K5eYhhQo7oTb7AtuMwmIH1cHajSFvMDm
	Qsdrh8T2O0oHvMHyV63ouQaUGKvNdrOoIw/5fAl2R97F79M/gxG3ufuNO7/V6Ol+RGzQjg
	dvwLOsUAAUbU2j55LpEMBS7N3yaEexD+pfN3gNs2LtAbOawqiK5vjEuMr8HSKYMlTX2NaW
	qBKLDM5VU+9TOt2HZZIQeQIpeMp4SvUOJf7HQD+iIpEhXBNn2HJt6H8+E9KmYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 09:02:45 +0100
Message-Id: <D8KXQ6QPGOL6.1VKUBIEENIJYU@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] dnf: upgrade 4.22.0 -> 4.23.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1742439740-18703-1-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeejieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvu
 gguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 08:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213373

On Thu Mar 20, 2025 at 4:02 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch
> 0005-Do-not-prepend-installroot-to-logdir.patch
> 0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
> refreshed for 4.23.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi,

Thanks for your patch.

I believe this is responsible of some failures we see on the
autobuilder:

ERROR: core-image-ptest-util-linux-1.0-r0 do_rootfs: Could not invoke dnf. =
Command '/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/=
qemux86_64-poky-linux/core-image-ptest-util-linux/1.0/recipe-sysroot-native=
/usr/bin/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker/qem=
ux86-64-ptest/build/build/tmp/work/qemux86_64-poky-linux/core-image-ptest-u=
til-linux/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv/pokybuild/=
yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky-linux/co=
re-image-ptest-util-linux/1.0/rootfs/etc/yum.repos.d --installroot=3D/srv/p=
okybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky=
-linux/core-image-ptest-util-linux/1.0/rootfs --setopt=3Dlogdir=3D/srv/poky=
build/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-ptest-util-linux/1.0/temp --repofrompath=3Doe-repo,/srv/poky=
build/yocto-worker/qemux86-64-ptest/build/build/tmp/work/qemux86_64-poky-li=
nux/core-image-ptest-util-linux/1.0/oe-rootfs-repo makecache --refresh' ret=
urned 1:
...
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/build/tmp/work/q=
emux86_64-poky-linux/core-image-ptest-util-linux/1.0/recipe-sysroot-native/=
usr/lib/python3.13/site-packages/dnf/conf/substitutions.py", line 57, in __=
setitem__
    releasever_major, releasever_minor =3D ConfigParser.splitReleasever(val=
ue)
                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AttributeError: type object 'ConfigParser' has no attribute 'splitReleaseve=
r'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1155
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1242

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


