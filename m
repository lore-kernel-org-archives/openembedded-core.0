Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECBF57FC0C;
	Mon, 27 Jan 2020 22:34:39 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a9so357763wmj.3;
	Mon, 27 Jan 2020 14:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=QsjkZpc7NsofAgVDOIy3hqBAhhWubzJQ9qI95aIZVFw=;
	b=R8IFCwVc47cZEu5NevbxgvbuQEMgfn73Tuqxb3CczJT1tjSlN/awhbDFUcIhEqLg8s
	BAayLZT89w9EhOZ/RFIJaA/j+olFQLSpUwFsoq8aQPR74NvIub7d6eNJ5dlklU4RB4S/
	pIFE0XPXawEaAKUsLqKKR+BQV+e4AllvfKFWrn7KnSugIAU0ec1JvxV/l93b+xKoRbgE
	//zK9enb5fFsGHJ4uFZn1OJsUzvoO5tKuCi/c8yNBANO+nc/+F1A5ojEaQGJ/LurGTzj
	mfAvJIkZKZWVnZnMh/dMWk+UfBy6Fbh5toemjycMzGKah7waIS9phLi/chA6xRzvv1th
	7P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=QsjkZpc7NsofAgVDOIy3hqBAhhWubzJQ9qI95aIZVFw=;
	b=NguY7S1tI5W1R1NE8IgxGbpqDaoMWjflHZSWzL4qeR1y5BgRxP0JO/ns/Wf/XvoKjX
	8KQ81o0+uKp57b/vlC6qsPVipZ8oMrhHQ5MexXvRShJzJhjF+cxpck03+L7gAmxcIvfF
	0Jho2ZnayJZtjLVEwgQq5unOyPsqHcEKsZ+G5My1PF342LRBq2Bm4RKnRJ3+QFNf7sbP
	Ch99uUmu8ajkuic6RLoIQfpW0jblXstGPwCxreB1RJPVWt5lm1Ssq0I771cv6cwBKi7m
	9myxudoZ1tztBVdZRZl9p6JQY9jljkIt9Gdw4bcZMsSOLSuO7lC2C8NXLWOTZOGuAd6u
	fCJg==
X-Gm-Message-State: APjAAAVYPK37N8PTHA4GYXmorfEgKktftPU0+0YvANlGllOB5am6oH1l
	m4qWSbIDYBJNUFtbiAYK0X4e/v+gOvj1iKWpGi4=
X-Google-Smtp-Source: APXvYqz8G3k/BXlCpf7mabtZIVaBrgw40rdsfk/mjf3ivJHJ2f6ZzidgemSa9EvQPUss1uh6rogEZ21m6rRVcEPdO5g=
X-Received: by 2002:a05:600c:2c53:: with SMTP id
	r19mr857102wmg.39.1580164480571; 
	Mon, 27 Jan 2020 14:34:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
	<CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
	<CALbNGRQ+B-8uvbNcCS_ySkJLiZe+WhawsZK90Mr4YUN7KGmbNA@mail.gmail.com>
In-Reply-To: <CALbNGRQ+B-8uvbNcCS_ySkJLiZe+WhawsZK90Mr4YUN7KGmbNA@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 23:34:29 +0100
Message-ID: <CAHtQpK4D0WCJXTZ9mLYGAhXQQd5nQ=d5wPm+VEkatSx_RYGf9g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 22:34:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 27, 2020 at 7:01 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Jan 27, 2020 at 5:54 PM Andrey Zhizhikin <andrey.z@gmail.com> wro=
te:
> >
> > On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Awesome, thanks for the help!
> >
> > No probs!
> >
> > I've actually looked into the list and would have couple of
> > components, which are sort-of "python2-only":
> > - dnssec-conf: did not receive any update since 9(!) years, written
> > totally in python2. Should this be bumped up of bumped out of
> > [oe-core]?
> > - mozjs: this one pulls the most of dependencies and produces the most
> > of errors. It's version is also quite old (60.9.0esr), and there is a
> > lot of python2-only code inside. Should this one be bumped out? Latest
> > ESR version available upstream is
> > 68.4.2esr [1], dated 01/20/2020
> Problem with mozjs are
>
> * some packages ask for certain versions of mozjs. That's why distros
> have multiple versions.
> * if I am not mistaken version 68 of mozjs asks for rust/cargo which
> is (not yet) in a common layer
>
> Am working on python3 port. Current situation: Configure is almost
> done but after
>
> | updating cache ./config.cache
>
> I see no progress in log file / 100% on one CPU / memory is eaten up.
> Had a similar situation in earlier stages but fixed that by endless
> debug sessions and removing parts suggested in [1]
>
> Long story short: Haven't lost hope to come up with a working python3
> port but I cannot promise if I get there and when.

Thanks a lot for the update here!

I see now, it is much deeper than I thought... Not that I'm currently
using this package; this is rather the one Raj posted earlier in the
error log and I thought I might've take a look at...

Is there anything to help here?

>
> [1] https://code.foxkit.us/adelie/packages/blob/f2b5773da19ab397fbe64fd32=
dacc383cfe4cd77/user/mozjs/python3.patch

This patch is EPIC... :) Hope that current version would not require
something of this kind.

>
>
> Andreas
> >
> > For some other recipes I would send out the patch series later today.
> >
> > [1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/
> >
> > >
> > > On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com>=
 wrote:
> > > >
> > > > Hello Raj,
> > > >
> > > > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote=
:
> > > > >
> > > > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> w=
rote:
> > > > > >>
> > > > > >> Hi all
> > > > > >>
> > > > > >> Recently py2 is removed from oe-core, So I did quick patches t=
o get a
> > > > > >> world build going. And
> > > > > >> here are initial failures, please help out with recipes your c=
an or
> > > > > >> care for. Eventually, the remaining
> > > > > >> ones we can blacklist for 3.1 release.
> > > > > >>
> > > > > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > > > > >>
> > > > > >> I will post more arches as they become available. If you want =
to try
> > > > > >> the same for machines/distros you can try yoe/mut for meta-oe
> > > > > >
> > > > > > I've actually asked Ross about similar failures, specifically i=
n
> > > > > > [meta-openembeeded/meta-python] where there is a good mix of Py=
tho2
> > > > > > and Python3 still present. I've started to remove those yesterd=
ay, and
> > > > > > would continue with that layer further.
> > > > > >
> > > > > >>
> > > > > >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dyoe/mut
> > > > > >>
> > > > >
> > > > > All these changes are now in master and its again buildable, with=
 or
> > > > > without meta-python2, with meta-python2, its back to where it was=
 with
> > > > > everything  building however, without py2 layer we have some work=
 to do
> > > > > so if you are interested in this here [1] is initial list of fail=
ures
> > > > > I will keep posting more as we go along.
> > > > >
> > > >
> > > > Thanks a lot for the update! I've actually saw this in the master
> > > > before this mail and went ahead with pulling the latest - my builds
> > > > for i.MX8M series went fine.
> > > >
> > > > I'd also have a look at remaining things and try to fix some of tho=
se
> > > > as I'll progress.
> > > >
> > > > > [1]
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds=
/220/steps/8/logs/errors
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
> >
> >
> >
> > --
> > Regards,
> > Andrey.
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
Regards,
Andrey.

