Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E771FC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 14:26:22 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.26510.1754490381874961971
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 07:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DXC07oVy;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A401744329;
	Wed,  6 Aug 2025 14:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754490380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/8O2bh8BOpdNad6/6w7ZW6B0HaOGsOwql9SqSOhtTU=;
	b=DXC07oVycKYRsVIeQUB88J/cTt4HCQcfiaci/S72PXKoz233Wd3U8EFBhPYPX+t90mdObt
	W4SWPjGVpbF2JtlL6/f9Yv5r9Tr0viXdiy7n/JyOQuFUOeu8hvzMkoj4NRlu3mOwMuJ5nC
	dZ4doWjq9gkCNh9/xmf0woNNtn0josX3F14IP/9b7Yu8VrS9tlJfse3oXLzY6rPx1vOZAo
	QOEZDXua7ectoROhX03Uv4ebH0V3+JM1lSDHwd3ywuuH9J8+jfxBz0wycJfJMVZ8z2en4d
	1TMedA36pd/0DmNcxqQ4T6ywKZM3/7gWU4Y0oLX9+9uvSybDGKD0LdfKd2MWLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 16:26:19 +0200
Message-Id: <DBVEXLB4MHYD.1JE6I46WJ5E4B@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.42 release
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250729012911.2402010-1-raj.khem@gmail.com>
In-Reply-To: <20250729012911.2402010-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgvdeiveekueeiteefhfevfeeuvedukeeiteehvedtueelfefhgfektdeljeeigeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsohhurhgtvgifrghrvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghom
 hdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 14:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221541

On Tue Jul 29, 2025 at 3:29 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> * GCC 12.1 or later is now required to build the GNU C Library.
> * GNU Binutils 2.39 or later is now required to build the GNU C Library.
> * Support for lightweight stack guard pages via madvise and the
>   MADV_GUARD_INSTALL flag has been added to pthread_create.
> * This is major release, changelog [1]
>
> [1] https://sourceware.org/pipermail/libc-announce/2025/000048.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Sorry for the delay on this patch.

It looks like buildtools cannot build after this update, because of
ncurses-native:

ERROR: ncurses-native-6.5-r0 do_install: oe_runmake failed
...
| ** Building terminfo database, please wait...
...
| tic: /srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-n=
ativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbak=
e-build-sj26dmh3/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6: version=
 `GLIBC_2.42' not found (required by /srv/pokybuild/yocto-worker/buildtools=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-ta=
rball/1.0/testimage-sdk/bitbake-build-sj26dmh3/tmp/work/x86_64-linux/ncurse=
s-native/6.5/build/narrowc/lib/libtinfo.so.5)
| ? tic could not build /srv/pokybuild/yocto-worker/buildtools/build/build/=
tmp/work/x86_64-nativesdk-pokysdk-linux/buildtools-extended-tarball/1.0/tes=
timage-sdk/bitbake-build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.5/=
image/srv/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nat=
ivesdk-pokysdk-linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-=
build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.5/recipe-sysroot-nati=
ve/usr/share/terminfo

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/2179

Can you have a look at these, please?

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


