Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57DF9C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 15:37:43 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.28372.1754494660266610279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 08:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XnBsSpPh;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 34B3242FD8;
	Wed,  6 Aug 2025 15:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754494658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/X+6cFjgMT9txKXc+lLYWT+Hp7FZzv/udppweyG7uto=;
	b=XnBsSpPh6agVIrGPXlHuWtqCJ3GXCs1fcLpsBdUFdKQiwQocNubvXBK9Lx7KQuQWw+irjF
	EQjHjtJIkghu3s7uet+4pgk+xdFobwFJa394uTjkGIKxktGJ8NdU1hR/wUj2BP+hw6vHHG
	e9zSNzpTtZfCKu6/B/gCX6tvn9pYhKlEjmGIeN58RQ465uP8cTeWO3Z2iI5QYivImfh/Dd
	A4v3/3m88BLh6sY9NIFRaViuysI+0aMWaPxXQDKQ/7egYlWVcVjsr7KYl4H/3T0JRvqIkV
	WxldPPf3lDV46ABoJchUQe7Xo9rZHyaq80272BwkWrBez0MF3HjctncgQpO3Pg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 17:37:37 +0200
Message-Id: <DBVGG6SISEDC.3IXT8OM0GUMXS@bootlin.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.42 release
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 <raj.khem@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250729012911.2402010-1-raj.khem@gmail.com>
 <DBVEXLB4MHYD.1JE6I46WJ5E4B@bootlin.com>
 <CAMKF1sr9CJ9Xy6QX+NvX3LQVjRm-2RaxCozZ_TwC48t3sWe44g@mail.gmail.com>
 <dc49c5a116ba8f1752daee81b33d04d9ed099d4b.camel@linuxfoundation.org>
In-Reply-To: <dc49c5a116ba8f1752daee81b33d04d9ed099d4b.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedthfegtdduffeifeeiteduheevhefhjeduvdefffevveeghfekueegvdduveeuleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsohhurhgtvgifrghrvgdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtt
 hhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 15:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221545

On Wed Aug 6, 2025 at 5:20 PM CEST, Richard Purdie wrote:
> On Wed, 2025-08-06 at 07:32 -0700, Khem Raj via lists.openembedded.org
> wrote:
>> On Wed, Aug 6, 2025 at 7:26=E2=80=AFAM Mathieu Dubois-Briand
>> <mathieu.dubois-briand@bootlin.com> wrote:
>> >=20
>> > On Tue Jul 29, 2025 at 3:29 AM CEST, Khem Raj via
>> > lists.openembedded.org wrote:
>> > > * GCC 12.1 or later is now required to build the GNU C Library.
>> > > * GNU Binutils 2.39 or later is now required to build the GNU C
>> > > Library.
>> > > * Support for lightweight stack guard pages via madvise and the
>> > > =C2=A0 MADV_GUARD_INSTALL flag has been added to pthread_create.
>> > > * This is major release, changelog [1]
>> > >=20
>> > > [1]
>> > > https://sourceware.org/pipermail/libc-announce/2025/000048.html
>> > >=20
>> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > > ---
>> >=20
>> > Hi Khem,
>> >=20
>> > Sorry for the delay on this patch.
>> >=20
>> > It looks like buildtools cannot build after this update, because of
>> > ncurses-native:
>> >=20
>> > ERROR: ncurses-native-6.5-r0 do_install: oe_runmake failed
>> > ...
>> > > ** Building terminfo database, please wait...
>> > ...
>> > > tic: /srv/pokybuild/yocto-
>> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
>> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
>> > > build-sj26dmh3/tmp/sysroots-uninative/x86_64-linux/lib/libc.so.6:
>> > > version `GLIBC_2.42' not found (required by /srv/pokybuild/yocto-
>> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
>> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
>> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-
>> > > native/6.5/build/narrowc/lib/libtinfo.so.5)
>> > > ? tic could not build /srv/pokybuild/yocto-
>> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
>> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
>> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-
>> > > native/6.5/image/srv/pokybuild/yocto-
>> > > worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokysdk-
>> > > linux/buildtools-extended-tarball/1.0/testimage-sdk/bitbake-
>> > > build-sj26dmh3/tmp/work/x86_64-linux/ncurses-native/6.5/recipe-
>> > > sysroot-native/usr/share/terminfo
>> >=20
>> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/217=
9
>> >=20
>> > Can you have a look at these, please?
>>=20
>> Its reporting about glibc 2.42 versioned symbols, so I wonder if we
>> need to have uninative with glibc-2.42 as well before this can build.
>
> That would make sense, I think we'll have to build and release a new
> uninative to resolve this...
>
> Was that the only failure?
>

Yes it is.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


