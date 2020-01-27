Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id CFCD17F8E5;
	Mon, 27 Jan 2020 18:01:50 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k24so11036971ioc.4;
	Mon, 27 Jan 2020 10:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fl4++qKDvyND6N5lmwFOqSn1enFfQFM9tOGIDlNb3C0=;
	b=klPfLgy0uO74cB00IoFzlU0oBkwLD3MjblY7Eoh8d3ezTMdk/YTc4Bgp8OvDDn6xAR
	g4LK04FyqfoL3Fkv0cupz+zW6d7ptpTUB60Jy8jXZY7mvaRq7Wj8wh+10PoQ0jOFMyvy
	3C/YkInXev3DNnf2FD4D9b0sTSSbQ1WuT1RlDVxv+E0bty00vzd5+sw5lRhyvqWSnEQY
	1E9H0aWo+kEEgb4vU8nesFY4CpVu9yMPFQqZPbLx7sS3P17T/yFRMiJ1pf3y1XYtvtgD
	bwuxFEV6rdBI5i69gZ3+LYxjO96h8PXSUHhZP4vY7apBTWg4jSUi24xPqtoFqrJOVpqd
	VjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fl4++qKDvyND6N5lmwFOqSn1enFfQFM9tOGIDlNb3C0=;
	b=lpgqUnulhwRGISdxbnrAHxhOh1JbevPpasBfyApV4ITS3CIdfQRj9+Gq0GPtipUM46
	vRU5YIpAXzultE/8TglNZD5sVRNcUpPcw5TFf86eAlGcdKyRV/nsHzeVImHMggzOXOjE
	zn1JiPz9RhbsLQK4PHKdUZUiiCrsK96ey2tf4JDS+7PjqWtkQQpvpZlLcSUYN44Nm/oC
	TFg7O36/HvYyI/7xUDNbSc7PLaWsrhAAt3YzShVHDVg5ezLjH3uw0V8jTeL9KKa115eh
	XN9eG20zEPxP9eq2GroaEflG+pKbS7tiULLrIXucm/xKgLASkLYTfTXKZ6H6gVkAeaD8
	LgEA==
X-Gm-Message-State: APjAAAWd52o36I9qggMe9rzipyT2Df1SCPILIsHssICJCiE8PbWxn8wE
	NI5NmoVa4FKMylhmseFkJzUaxefnZSP8Scr1MSg=
X-Google-Smtp-Source: APXvYqyqvVg8cRzNYUvYYiAyeTDDkZqPa43T5N9r/vF72T3usQs+Io+JWWDOM7ByyFjWpWtCeOBUwhPrv5j7KFrDSVE=
X-Received: by 2002:a02:cdcb:: with SMTP id m11mr14291715jap.125.1580148111592;
	Mon, 27 Jan 2020 10:01:51 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
	<CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
In-Reply-To: <CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 27 Jan 2020 19:01:39 +0100
Message-ID: <CALbNGRQ+B-8uvbNcCS_ySkJLiZe+WhawsZK90Mr4YUN7KGmbNA@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 27 Jan 2020 18:01:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 5:54 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Awesome, thanks for the help!
>
> No probs!
>
> I've actually looked into the list and would have couple of
> components, which are sort-of "python2-only":
> - dnssec-conf: did not receive any update since 9(!) years, written
> totally in python2. Should this be bumped up of bumped out of
> [oe-core]?
> - mozjs: this one pulls the most of dependencies and produces the most
> of errors. It's version is also quite old (60.9.0esr), and there is a
> lot of python2-only code inside. Should this one be bumped out? Latest
> ESR version available upstream is
> 68.4.2esr [1], dated 01/20/2020
Problem with mozjs are

* some packages ask for certain versions of mozjs. That's why distros
have multiple versions.
* if I am not mistaken version 68 of mozjs asks for rust/cargo which
is (not yet) in a common layer

Am working on python3 port. Current situation: Configure is almost
done but after

| updating cache ./config.cache

I see no progress in log file / 100% on one CPU / memory is eaten up.
Had a similar situation in earlier stages but fixed that by endless
debug sessions and removing parts suggested in [1]

Long story short: Haven't lost hope to come up with a working python3
port but I cannot promise if I get there and when.

[1] https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32dacc383cfe4cd77/user/mozjs/python3.patch


Andreas
>
> For some other recipes I would send out the patch series later today.
>
> [1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/
>
> >
> > On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > >
> > > Hello Raj,
> > >
> > > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >>
> > > > >> Hi all
> > > > >>
> > > > >> Recently py2 is removed from oe-core, So I did quick patches to get a
> > > > >> world build going. And
> > > > >> here are initial failures, please help out with recipes your can or
> > > > >> care for. Eventually, the remaining
> > > > >> ones we can blacklist for 3.1 release.
> > > > >>
> > > > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > > > >>
> > > > >> I will post more arches as they become available. If you want to try
> > > > >> the same for machines/distros you can try yoe/mut for meta-oe
> > > > >
> > > > > I've actually asked Ross about similar failures, specifically in
> > > > > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > > > > and Python3 still present. I've started to remove those yesterday, and
> > > > > would continue with that layer further.
> > > > >
> > > > >>
> > > > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > > > >>
> > > >
> > > > All these changes are now in master and its again buildable, with or
> > > > without meta-python2, with meta-python2, its back to where it was with
> > > > everything  building however, without py2 layer we have some work to do
> > > > so if you are interested in this here [1] is initial list of failures
> > > > I will keep posting more as we go along.
> > > >
> > >
> > > Thanks a lot for the update! I've actually saw this in the master
> > > before this mail and went ahead with pulling the latest - my builds
> > > for i.MX8M series went fine.
> > >
> > > I'd also have a look at remaining things and try to fix some of those
> > > as I'll progress.
> > >
> > > > [1]
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
> > >
> > > --
> > > Regards,
> > > Andrey.
>
>
>
> --
> Regards,
> Andrey.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

