Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 31F287FA19;
	Mon, 27 Jan 2020 16:54:41 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so7838617wmf.2;
	Mon, 27 Jan 2020 08:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6MXNPPW624rQ/vRpW91Ew2PfQheTAbFwmfxZH5JKuro=;
	b=c8gYHBFTD6IQQ0NKk+sEJRYfHiZeWFiSmbs/T+XvOr4M3I4D58EOvps2TbuTWqoCD9
	gvYa5ruUAGxvDtRKHrzHPzdYrvkay0WPhJX+vq8TntedKiM9zLcjk77HB7ktnFznfEVb
	aQ0n2OXdpiL92ZXHD5EzEpxpX5BoTLLWTGTnwfDnwtMU9ueK8q1ALzwqMEdQKtdeIPiA
	epnZg3bQOfKvAkKrGhG+EQtsv7OJB+NMvqrmqTZ1k7eKU9QSoPwvyFqY0YBNXqa0VfZd
	IMuXiabXLesTeLz47bIN+x/LTvCwTng0FkdhqXnHKMItj7bKvgkTT0rCOSAEzcxjeHrK
	LjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6MXNPPW624rQ/vRpW91Ew2PfQheTAbFwmfxZH5JKuro=;
	b=d2q6yOd0WRJdn76YacIGI7CmvxiofcxEZoWcQ2351+n5rWyEY6zW3digouo5075XVO
	F9vWICHtiBxSnRKy0lAmFrvOkJbrtgjjiX9DPRsLMK/hBcoFalaSNzq26uYzYAkKLxLb
	QtcKsTyrjnbfbZdWlh8JYMpizgm6p08K2Su5Ud7IcOsmpUhpBVVix0Epq7i64knZtckU
	h58/CyYzvMgw1BE3UUUnGf7sTdMsz6d6y+Gj+26RzRZ/NHBp3kshYstJfbtrzmlLsLvI
	HyN49MnvVT4NMeSv622RlGEiv8r+d0++xRsCVMQ+AmXbirZe6KEwjVQRcj0YeQ6WKIY3
	T4pg==
X-Gm-Message-State: APjAAAXObNRyZ5JGT7RvKjzvotJlY19TIb0haI+Ji7uep9JJsnUIc4NR
	C6xQOD8ulEpmX+Tx9RWLtJuxb2D0RYgMaMtILok=
X-Google-Smtp-Source: APXvYqwZJKyLipxszsLY0pF29sHDRWMwxulOlsh2XQ2P/HtPyFhW821qMk18w+0+yeIfHYXhqWFB/H/1zqj9T94wGaA=
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr18388wma.24.1580144082492;
	Mon, 27 Jan 2020 08:54:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
In-Reply-To: <CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 17:54:31 +0100
Message-ID: <CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 27 Jan 2020 16:54:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Awesome, thanks for the help!

No probs!

I've actually looked into the list and would have couple of
components, which are sort-of "python2-only":
- dnssec-conf: did not receive any update since 9(!) years, written
totally in python2. Should this be bumped up of bumped out of
[oe-core]?
- mozjs: this one pulls the most of dependencies and produces the most
of errors. It's version is also quite old (60.9.0esr), and there is a
lot of python2-only code inside. Should this one be bumped out? Latest
ESR version available upstream is
68.4.2esr [1], dated 01/20/2020

For some other recipes I would send out the patch series later today.

[1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/

>
> On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> >
> > Hello Raj,
> >
> > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >>
> > > >> Hi all
> > > >>
> > > >> Recently py2 is removed from oe-core, So I did quick patches to get a
> > > >> world build going. And
> > > >> here are initial failures, please help out with recipes your can or
> > > >> care for. Eventually, the remaining
> > > >> ones we can blacklist for 3.1 release.
> > > >>
> > > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > > >>
> > > >> I will post more arches as they become available. If you want to try
> > > >> the same for machines/distros you can try yoe/mut for meta-oe
> > > >
> > > > I've actually asked Ross about similar failures, specifically in
> > > > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > > > and Python3 still present. I've started to remove those yesterday, and
> > > > would continue with that layer further.
> > > >
> > > >>
> > > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > > >>
> > >
> > > All these changes are now in master and its again buildable, with or
> > > without meta-python2, with meta-python2, its back to where it was with
> > > everything  building however, without py2 layer we have some work to do
> > > so if you are interested in this here [1] is initial list of failures
> > > I will keep posting more as we go along.
> > >
> >
> > Thanks a lot for the update! I've actually saw this in the master
> > before this mail and went ahead with pulling the latest - my builds
> > for i.MX8M series went fine.
> >
> > I'd also have a look at remaining things and try to fix some of those
> > as I'll progress.
> >
> > > [1]
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
> >
> > --
> > Regards,
> > Andrey.



-- 
Regards,
Andrey.

