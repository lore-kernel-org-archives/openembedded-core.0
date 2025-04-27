Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D577EC369D8
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 06:28:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.22223.1745735302628217950
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 23:28:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UwtQKH4L;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5DBA43B37;
	Sun, 27 Apr 2025 06:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745735300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KHXb5F1xJrUMcFHfuZ/3HzS1wLqyc0xK1LePWPFLvk=;
	b=UwtQKH4LFftlpMQg848aVvGo7OnxiR8fgiiyH4xhts1CNiZ6PVEsLE64ZHHpwF8CXRTGnq
	wufCe9sOKAamoRJGhg35ANmEVDYQRqNTCY+ObTqCU50HOGt9eSgewmFP+NLasvQwC+lSSN
	gJ0b34GZK2DhWlwmiPhjpS/np3wFwFzpa/s7tziM30Ud+bo9YuUXFJ6sU69n1c5z09wzDH
	jt1+UskjuKR55cIPB/Vi0IQ01yxNRXYmnLC0mN9lFvBlSXQpzuroE47h5o/qf7gidhVRn0
	Mff0uDetHlVtIHZRcMDMxPIjOceNjV9FdNJ4QAH9XoABu5GmYE/Gks1zVeKIsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 27 Apr 2025 08:28:19 +0200
Message-Id: <D9H7IL80SH9J.1IS8GM3NA8XLW@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] selftest-ed: Upgrade to version 1.21
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250427034423.336840-1-raj.khem@gmail.com>
In-Reply-To: <20250427034423.336840-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheejfeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegteetgfeutdefgfdtgfduleevkeevkeejtdfgieekheeitdetgefgkefhvddtudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhordhiohdpghhnuhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegrvggtfhemkegvledvmeefuggttgemvgduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemrggvtghfmeekvgelvdemfegutggtmegvudelledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghom
 hdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 06:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215543

On Sun Apr 27, 2025 at 5:44 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Older versions do not compile with GCC 15
> 1.21 is licensed under GPL-2.0 which means we can remove 0.5 recipe as we=
ll
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like the URL is wrong:

ERROR: selftest-ed-1.21.1-r0 do_fetch: Fetcher failure: Fetch command expor=
t PSEUDO_DISABLED=3D1; export PATH=3D"/srv/pokybuild/yocto-worker/a-full/bu=
ild/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/srv/pokybuild/yocto-=
worker/a-full/build/scripts:/srv/pokybuild/yocto-worker/a-full/build/build/=
tmp/work/core2-64-poky-linux/selftest-ed/1.21.1/recipe-sysroot-native/usr/b=
in/x86_64-poky-linux:/srv/pokybuild/yocto-worker/a-full/build/build/tmp/wor=
k/core2-64-poky-linux/selftest-ed/1.21.1/recipe-sysroot/bin/crossscripts:/s=
rv/pokybuild/yocto-worker/a-full/build/build/tmp/work/core2-64-poky-linux/s=
elftest-ed/1.21.1/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-worke=
r/a-full/build/build/tmp/work/core2-64-poky-linux/selftest-ed/1.21.1/recipe=
-sysroot-native/usr/bin:/srv/pokybuild/yocto-worker/a-full/build/build/tmp/=
work/core2-64-poky-linux/selftest-ed/1.21.1/recipe-sysroot-native/sbin:/srv=
/pokybuild/yocto-worker/a-full/build/build/tmp/work/core2-64-poky-linux/sel=
ftest-ed/1.21.1/recipe-sysroot-native/bin:/srv/pokybuild/yocto-worker/a-ful=
l/build/bitbake/bin:/srv/pokybuild/yocto-worker/a-full/build/build/tmp/host=
tools"; export HOME=3D"/srv/pokybuild"; /usr/bin/env wget --tries=3D2 --tim=
eout=3D100 --output-document=3D/srv/autobuilder/valkyrie.yocto.io/current_s=
ources/selftest-ed-1.21.1.tar.lz.tmp --continue --directory-prefix=3D/srv/a=
utobuilder/valkyrie.yocto.io/current_sources 'https://ftp.gnu.org/gnu/ed/se=
lftest-ed-1.21.1.tar.lz' --progress=3Ddot --verbose failed with exit code 8=
, see logfile for output
NOTE: recipe p11-kit-0.25.5-r0: task do_fetch: Started
ERROR: selftest-ed-1.21.1-r0 do_fetch: Bitbake Fetcher Error: FetchError('U=
nable to fetch URL from any source.', 'https://ftp.gnu.org/gnu/ed/selftest-=
ed-1.21.1.tar.lz')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1476/ste=
ps/13/logs/stdio


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


