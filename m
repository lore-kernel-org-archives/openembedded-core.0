Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCB861303
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 11:50:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48SDcy6zX1z4M;
	Wed, 26 Feb 2020 12:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582717811;
	bh=OcLVoCfWnxxI/OtW5zjjm8q3mimniAd17zQlr4YHiiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/QTBAoVglJZrmgPEGG0sypI6Ml1vzPkq5CZVn2Yv2oaixIb9tYPUWVSL/w9POlM7
	jMMaKuzhO1cu33y50yxi7aGt0rEd7hC6LY5QtNKIAdEdzAZIiZAU2tRo5fBmRLwjSH
	pD0ud1P4eLaP8CqOzWUm47SznOYwEccULQCMfUudxsgv30+JvIXIzejmKyPywldl7L
	m9RUSUN9Oo2qQNi8YsQrfD2Ww5mVjNzQqHl5/FXjjn5hTCpB0hsoTD5bW7kaMIX1vL
	lGCv82nYEJpIL7PGi9yeSmaBV9MFYOayd8BBdTt3OzMIviBXCk071cqilM2Zj1H8Sm
	Z2HY7oqYE3rJaujBZF/6/s2eZ7P/WN4sFDqsM7opdFQxKHv7pY6MSJJl4bxjdZQGDx
	PqNMzZMrENxwgqGGb18jRRn15lBnnlpLCskNvlVnswcoCsUQRtgHBphGukiy9IZCiy
	2DI94NlcIV/yyHtfos4sGJchFap1iXCno27KyLPadzXvz4nVshWeGo9yA7PSDA3I9r
	mv24+nNoaHa14zfdfRA8QkaLqbikKq54Vlc+NNNRPDOuhTjrxvlEGbc0rzADF30YXj
	fwE6Di4Zv5s4LNpgYgI+b499wzp6Jis4kmdpV/tnlBlQZDGEiBk6yGrefuYnCT5rjR
	Nnh9Zwaq5dymUT/Gihqf5xP4=
Date: Wed, 26 Feb 2020 13:50:09 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20200226115009.GA26350@localhost>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost>
	<20200224140801.GC27036@localhost>
	<CANNYZj91N68ocXm=UKzcH6U7nEnVLuQzDStR3O0_cO3GsY9uag@mail.gmail.com>
	<20200225111955.GA13902@localhost>
	<CANNYZj-VbMxS52x78goiAA3jvKnyRQiyxd8G5TfEKZ8hBSXdDA@mail.gmail.com>
	<20200225123807.GB13902@localhost>
	<20200225124627.23tpu5eknidqxrg3@jama>
MIME-Version: 1.0
In-Reply-To: <20200225124627.23tpu5eknidqxrg3@jama>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Feb 2020 11:50:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 25, 2020 at 01:46:27PM +0100, Martin Jansa wrote:
> On Tue, Feb 25, 2020 at 02:38:07PM +0200, Adrian Bunk wrote:
> > On Tue, Feb 25, 2020 at 12:32:55PM +0100, Alexander Kanavin wrote:
> > > I would probably look into how
> > > REQUIRED_DISTRO_FEATURE/ANY_OF_DISTRO_FEATURS is actually implemented, and
> > > see if you can convince it to do the right thing, or maybe write a custom
> > > re-implementation.
> > 
> > I did already check meta/classes/features_check.bbclass, there is no 
> > obvious simple way for expressing more complicated dependencies.
> 
> Doesn't this do what you wanted?
> 
> REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland opengl', 'x11', d)}"

Thanks, I now have a v3.

cu
Adrian

