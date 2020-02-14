Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3B6610AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 14:43:49 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i11so10729002ioi.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 06:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fz7GwR1aVogbr4xbIfZwKc+BySqK2EsVl3GAGOHqlGc=;
	b=aURssGTd7+PPIaI590I8If5/LCrYuziXlOa0NhXK5IzGYooKJM5XwcAdASTFiZdd9b
	Do7l2oyrM8+fKJIBxz/g/xlil/aBZKz3uX8lsYvoQ9gT2IwQJXQxrivi+fgDtZ+8ChAc
	9LimNDCdYV6ZKk2NT8ARnHRv4nOkYmb2k2tuWiIsBSj3S/GnGuoROCb8V49i1ENFWNMn
	GOyTBHYNC78Ox/0Zpwowtca6JtcdcwH4DXeA/bFWOHDsgomLWWr5vFEwD/UKtX1HddU/
	fB7tl0JwTjvd5t/SMoy8djQicyYPxkI6MiBQdcRsbCfeJnqvX9CCseFR9EegRamrDktJ
	dvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fz7GwR1aVogbr4xbIfZwKc+BySqK2EsVl3GAGOHqlGc=;
	b=D5qIu+YZ8D8IBaU7/J7x7pT1FGXkAMVX3wdT5U58/cs4McpKlUspCccNed3O7sh8Wb
	qUAjN16H/iP9HMYH/cUvCHEY27k1nHIbavcsxiDXi3JMExrhQrke1T8PYFFRNx244PlM
	Fr97L2AC2vurZJkMbdEXUFdhRaehbn/TDGWhtooUuseE4G/thFVYmU82qNeEo2PnFniL
	SkQqlFMdpeoD8mpZTw3XUEJ08EZ1rk/5AeDwnhZ3SD9Sy1klfKmCPC14dpQo7hx8Q4B/
	Pwl2G6zeeL+lqTVKc589mXWqmFOxr7wmNVDPUfeR3owdt0QIkA0bW1SwB3JkXGR3zh+f
	RaaQ==
X-Gm-Message-State: APjAAAVyu903TX0Rj2v1er2wY+2KqAEWrzT9m9CC3xWEmj043UiJA7u/
	ciXFM4vakD+ajYYheJ/9AbRjbBP/hGSjiOFmsJU=
X-Google-Smtp-Source: APXvYqy4qNQ42oYtLAbNucWz8rWh1BeubqDSL8fPjZGSQnHgNdXln/L6gzBSaC1jVUNvsXFnW37/zoY8V1Ef2fEJhYw=
X-Received: by 2002:a5d:984e:: with SMTP id p14mr2520225ios.115.1581691430082; 
	Fri, 14 Feb 2020 06:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20200213061649.102346-1-alex.kiernan@gmail.com>
	<6557ee9b5ee8375cc9e7ee79336975f2cd8c4468.camel@linuxfoundation.org>
	<CAMKF1spmaJ1QWr1pod3eJGMWk2S1mADCd=t2LZeOq_L9PHv+YQ@mail.gmail.com>
	<CAO5Uq5Q_EF=-A=xUfAXLMNK4=0Rvw=1tLczfH+h7kn4up15H9g@mail.gmail.com>
In-Reply-To: <CAO5Uq5Q_EF=-A=xUfAXLMNK4=0Rvw=1tLczfH+h7kn4up15H9g@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 14 Feb 2020 14:43:39 +0000
Message-ID: <CAO5Uq5TGJe1EX0P+1V+DHGD7VuwALV577nrtAbJS=YPXPm5pQg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Fri, 14 Feb 2020 14:43:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 7:25 AM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Fri, Feb 14, 2020 at 7:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Feb 13, 2020 at 3:40 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Thu, 2020-02-13 at 06:16 +0000, Alex Kiernan wrote:
> > > > Commits from v244-stable:
> > >
> > > I think this causes:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/1557
> > >
> > > (systemd-boot patch failures)
> >
> > right
> > http://errors.yoctoproject.org/Errors/Details/390912/
> >
>
> Yeah... just trying to work out if there's a better way to handle the
> efi-cc stuff w/o having an even larger set of reverts against
> meson.build :|
>

It looks like by making meson.cross configurable I can drop all the
reverts, which should get us to a better place for future upgrades.
I've run the obvious pieces of oe-selftest, but I'll clean up the
hacky mess I've got and send up a full patchset if we can push it
through the autobuilders.

Or reverting the latest commit on meson.build does fix it, but that
feels like we're just digging an even deeper hole!

-- 
Alex Kiernan

