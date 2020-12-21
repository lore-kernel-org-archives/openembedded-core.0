Received: from forward3-smtp.messagingengine.com (forward3-smtp.messagingengine.com [66.111.4.237])
 by mx.groups.io with SMTP id smtpd.web08.38932.1608557135850658961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=XpV4Er3v;
 spf=neutral (domain: iki.fi, ip: 66.111.4.237, mailfrom: tanuk@iki.fi)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailforward.nyi.internal (Postfix) with ESMTP id 2122E19433C7;
	Mon, 21 Dec 2020 08:25:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 21 Dec 2020 08:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=N9xRoR5XUNrOKeieXEhFNGwbYvTAgWRiDWTbWjlIM
	iU=; b=XpV4Er3vIM0WBuP9E8wy98KKHQrI9C2axdi8FayCFHvsid/EnMkBHufjA
	iQI8dto3LpRGBg1jrOrLyUQIc0OedJQSWNxHOM73cjVTAeqClJdSAA1Cx2DYddIg
	ETJ4kb0f0I8U+6fcGJkEYhBQgsYcEJ/dd5Y5xw0OdVZ/GUBXNqSzhJ1VrdRKHWTP
	l9/K0fFCjQw5pTHkaFWcQe3TjkDtUGiKaJZ5InXv2K83nHxxuXIYpWDe2kVZqimz
	eWg8d8YvMQtM5dc+8et5oRvF6qEgBccxAHTRlmGV2c4Dwv7JLO2EiHcop5l3SWPc
	yyVzy5Qw2iwRtjyrSdV9FuclWNYcA==
X-ME-Sender: <xms:TqLgX1OfIcI5b7WPDrwMdkyiGZGrCEEsVAn84UWRmW1DVz_J7Hf_JQ>
    <xme:TqLgX3-E7__5sIfKkpsvxuu7KyhnQYFUcJdkxBqqH8fNL5g8MAzZP-cj3wF1BJ08N
    36i0xOG1bvibdQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epuefghfdvtdegveevtefgkeeggfdufedujedtudeiueegjeeiveejieevfeetffehnecu
    ffhomhgrihhnpegtohhnfhdrihhnnecukfhppedukeekrdduvdeirdekledrhedvnecuuf
    hprghmkfhppfgvthifohhrkhepudekkedruddviedrkeelrdehvdenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:TqLgX0TceWjzWdKnpLyGoIanXfNZrx_gN1ISJde7puUPdxQKIEW7bA>
    <xmx:TqLgXxtNW0PRpeCNrZswS_r8tKdPJjan91MECIZo3eBttAQKJvRtDg>
    <xmx:TqLgX9faTXAuozUJ90yFpWkMDhjMqd1FdDmTJ_WBIeN5PqrPjo_cpQ>
    <xmx:T6LgX9m9pGH7Vn8FVkkpiAzvrUoOF-LPS5KPF_m4UEsH5ES_dq74iw>
Received: from laptop (unknown [188.126.89.52])
	by mail.messagingengine.com (Postfix) with ESMTPA id 94637108005F;
	Mon, 21 Dec 2020 08:25:33 -0500 (EST)
Message-ID: <f66cc23e51f1b3262e1092f082d4c44b8ef92550.camel@iki.fi>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Andrey Zhizhikin <andrey.z@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Dec 2020 15:25:29 +0200
In-Reply-To: <CAHtQpK4hjWnuVj+b=_joyf5pG=DsbA4UL6QMpj1o-0=D1iYpEQ@mail.gmail.com>
References: <20201217192738.14311-1-tanuk@iki.fi>
	 <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
	 <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
	 <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi>
	 <CAMKF1soBt5ifPhNj0h_DE+NY7jVTz4C3Ch13A=xEY-KZ=s4XtA@mail.gmail.com>
	 <CAHtQpK4hjWnuVj+b=_joyf5pG=DsbA4UL6QMpj1o-0=D1iYpEQ@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-12-21 at 14:03 +0100, Andrey Zhizhikin wrote:
> Hello Tanu,
> 
> On Sun, Dec 20, 2020 at 5:09 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Sun, Dec 20, 2020 at 6:26 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > On Sat, 2020-12-19 at 12:36 -0800, Khem Raj wrote:
> > > > On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > > On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > > > > > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > > > > > some old cruft that sounds like it has something to do Libtool, so it's
> > > > > > perhaps relevant for the goal of dropping Autotools. The next two
> > > > > > patches disable features that aren't available with Meson. The last
> > > > > > patch does the build system switch.
> > > > > > 
> > > > > > Tanu Kaskinen (4):
> > > > > >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> > > > > >   pulseaudio: disable EsounD support
> > > > > >   pulseaudio: disable GConf support
> > > > > >   pulseaudio: switch build system from Autotools to Meson
> 
> I'm seeing a build failure after this upgrade, thought you might
> advise here what could be wrong.
> 
> Following is produced at the end of do_compile taks:
> 
> > sed: can't read src/client.conf: No such file or directory
> > WARNING: exit code 2 from a shell command.
> > 
> ERROR: Task (/development/yocto-master/yocto-build-appliance/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
> failed with exit code '1'
> 
> Have you experienced the same error, and what can be missing here?

I can reproduce the error when enabling the autospawn-for-root
PACKAGECONFIG. client.conf is generated from client.conf.in, and the
generated file's location has changed. Replacing "src/client.conf" with
"src/pulse/client.conf" in pulseaudio.inc seems to fix this issue.

-- 
Tanu

