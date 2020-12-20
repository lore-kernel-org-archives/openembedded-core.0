Received: from forward2-smtp.messagingengine.com (forward2-smtp.messagingengine.com [66.111.4.226])
 by mx.groups.io with SMTP id smtpd.web08.24085.1608474361201955797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=rB733eAR;
 spf=neutral (domain: iki.fi, ip: 66.111.4.226, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id 8AD5F1940B84;
	Sun, 20 Dec 2020 09:26:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 20 Dec 2020 09:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=iY9qYKZwS+r9NyAVunOOmIcBY6YLYugRMJ6Lf/vfx
	+A=; b=rB733eARlWm9X7O3wjnofq/6YFEzz/PtLaLafXtjdXS0u25uKbN0LaF0O
	ZXwJm0BBSI9Os3MSPxXmUGKCewYRaRRNeuLMA6+8uyYv14rvw9qhosFgGeDLMQ0B
	mF2fCICjf8/kH73ULBEPJIvB8wCabJYagqcdD88T4ZaoWDjh0W8uQYDeFctfIZmN
	7g+r+KtIQur3rH0qql/3vDhzLn36Hdog3b0E/5Jnhi8hMz5maptT0frHKLj2Zcj0
	uPWkHUgkEEJETsFjg4CidA04TueIwejR6jOsEsD8QIy9JO9LQYe8JLw8wtOpsEl+
	zA6tlWRpUcCZYN8uZIzVCVxn5xhvA==
X-ME-Sender: <xms:-F7fX1tQsAua08EpoPfuwAUgCV_jDCumyxJ33PRWS-yWm_YBHHsSYw>
    <xme:-F7fX-cUHqjEJLlaUqvEhMR562qy22HF38RE66pxKI6Q6Ouia9AvZUeDW0i8YdagV
    UN3j1ytcWHQN-Af>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddttddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epteegieevhfefvedtjeffjeeuuefhkeffheegueegleejgfehleegledthfetueevnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucfkphepudekkedruddvie
    drkeelrdehvdenucfuphgrmhfkphfpvghtfihorhhkpedukeekrdduvdeirdekledrhedv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnh
    hukhesihhkihdrfhhi
X-ME-Proxy: <xmx:-F7fX4zI6im7RxmQCl6DyPDwFmieLjIn-yOu9Ce53zmCRzh8LxkLww>
    <xmx:-F7fX8OXGFdb8KdqzyJcUUxcJAULqKP8xZu7mq9xWM3moGj9FbP8Iw>
    <xmx:-F7fX1-U2WufZ3ylCo-SqNYoNKbU2geQICIqvH64tP79_rq01I3BaQ>
    <xmx:-F7fX6JdA0nB3jWD1km6LLnmK6V173H3Ak_rJLwc60NwNokKUx9eFA>
Received: from laptop (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9CFF324005C;
	Sun, 20 Dec 2020 09:25:59 -0500 (EST)
Message-ID: <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Dec 2020 16:25:55 +0200
In-Reply-To: <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
References: <20201217192738.14311-1-tanuk@iki.fi>
	 <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
	 <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-12-19 at 12:36 -0800, Khem Raj wrote:
> On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > > some old cruft that sounds like it has something to do Libtool, so it's
> > > perhaps relevant for the goal of dropping Autotools. The next two
> > > patches disable features that aren't available with Meson. The last
> > > patch does the build system switch.
> > > 
> > > Tanu Kaskinen (4):
> > >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> > >   pulseaudio: disable EsounD support
> > >   pulseaudio: disable GConf support
> > >   pulseaudio: switch build system from Autotools to Meson
> > 
> > I am seeing build failures with this patch series while using clang
> > for compiler see.
> > 
> > https://errors.yoctoproject.org/Errors/Details/539474/
> > 
> 
> It turns out that new meson checks are a bit different and if
> -Qunused-arguments is used with clang then the test for neon passes
> because its a simple compile time check in meson, So a workaround that
> I have done is to remove using -Qunused-arguments on clang
> cmdline and then it works ok.

Ok, so the Neon check in Meson is somehow too lax if it passes with
-Qunused-arguments. Thanks for the initial debugging! I can look into
the issue, but I can't promise to do it quickly. I see these patches
are in master already - should the last patch be reverted for now? Or
can your workaround be applied to master (or meta-clang, if that's
where clang workarounds belong)?

-- 
Tanu

