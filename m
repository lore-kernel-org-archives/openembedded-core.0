Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 145E97E4E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:44:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t64so9028903qkh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 12:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6DyuD3bco1lViQr6vAROMUwgWA86u4a7t/Nh8xTZFMY=;
	b=ig47jH//6lfJ3CUVRzGfPEjxxJv+v8ZFdUEX7PE2Gf8YIyGeM07M5PBUbAhKqMw9pT
	S4tzpQQ5hjJqY4igg5BI84UHezLyH1xFBsFeQMZQBpRwMu/bTBlUNwRlHoluE4JK5L1h
	aqg1gJ5aWt94QrS3BMA0H3OB5II9XmEwrlXnqjAF0F3PuNAKjjBkJ3skqAotE7oY6+Wb
	ushcZt3Alt3/KxhtZWakqSEZeNTMy8ocWOMLAg/E4nRZQtNX8gzUvz0qXCzIcJElozjx
	cTYZgCKYPYxu5DuvriG5naNscMxziHSv5FM0oOX/8FojOQfytgRby1NAwoCYqzgGmSAE
	sRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6DyuD3bco1lViQr6vAROMUwgWA86u4a7t/Nh8xTZFMY=;
	b=b6kDUGiybvNcEerYc1jcLBRg6+fJ5XkqbQwH3DEQEP440VKwG5XfqmA+py/gld075H
	YJkuOFiZtJI90uDCU1KBR/N2YTNwhyeuPop5eDLAZeMStwwyMzYvDa8MRcFwr6DrkVsZ
	59aUAV9aWUtIXBVD4t54k2E9gSkND8EYlG9OumHlhx2KhlanRaF7SbLYDDFaMua1O9oh
	MdxsxUD6RoBljzNMql9MJ5G0DHN9WCxF8dgIEdTx1EmKAnM186DlTmXAf5wFPULdnoJS
	t2g2ciO7NNDWbUKEebmsykkrnM0uBRmomWF+tkOihJabpROUSbgjJrTIWw11DTrUZ/sL
	xwmA==
X-Gm-Message-State: APjAAAXUAxntr+f4/corskUMRX13Gp90vXjtGYjUrxcOKPdDfuctQjIV
	baj4ytAjCsMOEjiWgEZdwl6fprOqiqYeK6AiuG8wxmQg
X-Google-Smtp-Source: APXvYqz6HhCmitkG9WQEWZUFD9xFLuisXvj63say/4tdJfPKqQyk5x9Bzdr3RL/cfMEU+b/MHTMJnu733pJpNhonpkQ=
X-Received: by 2002:a37:59c7:: with SMTP id n190mr82338982qkb.24.1558727085835;
	Fri, 24 May 2019 12:44:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
	<CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
	<7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
In-Reply-To: <7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 12:44:19 -0700
Message-ID: <CAMKF1sqN+qmkGiZO6LNi4xa+3OLYTfnfb6yk0pV7DCyOKarGSg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Fri, 24 May 2019 19:44:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 12:23 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 23 maj 2019 22:59
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: kai.kang@windriver.com; openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundation.org
> > Subject: Re: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
> >
> > On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt <mailto:peter.kjellerstedt@axis.com> wrote:
> > > -----Original Message-----
> > > From: mailto:openembedded-core-bounces@lists.openembedded.org <openembedded-
> > > mailto:core-bounces@lists.openembedded.org> On Behalf Of
> > > mailto:kai.kang@windriver.com
> > > Sent: den 23 maj 2019 10:26
> > > To: mailto:richard.purdie@linuxfoundation.org
> > > Cc: mailto:openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
> > > default init manager
> > >
> > > From: Kai Kang <mailto:kai.kang@windriver.com>
> > >
> > > Move configurations from local.conf.sample.extended to local.conf.sample
> > > to make systemd as default init manager for poky.
> >
> > If we're going to change the default init manager to be systemd, wouldn't
> > it be more appropriate to change the real default values in bitbake.conf
> > and http://packagegroup-core-boot.bb? And then include an example in
> > local.conf.sample.extended to show how to configure sysvinit as init
> > manager?
> >
> > That would change it for Oe-core and other distributions as well which
> > is not the intention
>
> Ok, then I'd say the change belongs in poky.conf. Doing this kind of changes
> in local.conf.sample seems very wrong to me. Why? Because if I have an
> existing build tree it will not be affected, but if I setup a new tree with
> oe-init-build-env it will all of a sudden behave differently from the old
> tree. In my mind, local.conf.sample should only be used for things the user
> are likely to want to configure to adapt the build for his/her environment,
> not to define the distribution (that's what poky.conf is for).

yes distro config is right place.

>
> //Peter
>

