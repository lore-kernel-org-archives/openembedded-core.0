Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 421D87F89E;
	Mon, 27 Jan 2020 10:51:04 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d16so10608874wre.10;
	Mon, 27 Jan 2020 02:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=C/zX55F7tomVjoEa/VWRHeh0ro3NjkvuJ5Vz1TdCuF0=;
	b=bhGbpz6hBFOzIy+yt/JLsfz9L1742MQZeuSjzAS4LzwkwGNqg7OX+clqbZTTluzd+V
	uJYfFbOps3CGhrTpWiuJPRWJJK0/bPu5dpZlLV/tB9xJpFRXQR9qcmfQnnysTq2/30sI
	8lfJ5IPmkgDhqoZi6U13krw/t8oN04KHdeJ/tegAF3Fcz6DnWZEzo2t8yyC+g1EeTQsU
	+JlSvgG0CeWtH4t+1t7Eqg1h0+ovK9gRXEAm6lPLJ1Q1NusQMpje65QL1kOfMS/JfXL0
	/xCz4qHfF3dYL3jStiwJhNYCBo+CHQt971f98LFwef1pbYXrLqUSQlE66zS4ybluCHE0
	tdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=C/zX55F7tomVjoEa/VWRHeh0ro3NjkvuJ5Vz1TdCuF0=;
	b=mb471aIxkVWK9GlVsR15EXvGjhi1oKux3tifckuPsliaLDGiaa3O6PX2kO1d0HGWuN
	hpbTEivaS4gKijO3Un0Ohpvepl0A+MNRdIt3D1YfoxiHsMd4Vo0iR66+fdh5s2AQNrf4
	wiA0voH6IyL3jeW6mPXhwqQekbd5AF5dmHc4lPCI161uVB3pQErP1ukLymDJgISn5M4K
	Lr8CEK1rFZjKmQkYlWhRpLO7Bt4rBGvzasBRcnH6Yu63jUNTOFOcptjwFXrBpYxGUbmn
	zDmswjfP2zYLhqqPnCxpVWOoba2JG0pE6F9BhC9v6OgHIvtwU7tHPAxe7Wd3dfCxaEw/
	mnPQ==
X-Gm-Message-State: APjAAAV51txF4kRRyHyx4pxNeN1JElp/cKwkYygJow4JqKcwj9D7OE5n
	lz6H+I319OVH7cRjaILzl49xsD1JMXuJigms9QPZaQ==
X-Google-Smtp-Source: APXvYqxZu3n0aY1DKTbAeY6auxuhez/Owj2Q8nD8KnKhTwR8VGvGL9iRweAB0Qj6LqwV1JmpSlmFF4rZvX5ra6Da0Uo=
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr21937002wrr.73.1580122264911; 
	Mon, 27 Jan 2020 02:51:04 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
In-Reply-To: <24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Mon, 27 Jan 2020 11:50:54 +0100
Message-ID: <CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
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
X-List-Received-Date: Mon, 27 Jan 2020 10:51:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Raj,

On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Hi all
> >>
> >> Recently py2 is removed from oe-core, So I did quick patches to get a
> >> world build going. And
> >> here are initial failures, please help out with recipes your can or
> >> care for. Eventually, the remaining
> >> ones we can blacklist for 3.1 release.
> >>
> >> http://errors.yoctoproject.org/Errors/Build/97185/
> >>
> >> I will post more arches as they become available. If you want to try
> >> the same for machines/distros you can try yoe/mut for meta-oe
> >
> > I've actually asked Ross about similar failures, specifically in
> > [meta-openembeeded/meta-python] where there is a good mix of Pytho2
> > and Python3 still present. I've started to remove those yesterday, and
> > would continue with that layer further.
> >
> >>
> >> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> >>
>
> All these changes are now in master and its again buildable, with or
> without meta-python2, with meta-python2, its back to where it was with
> everything  building however, without py2 layer we have some work to do
> so if you are interested in this here [1] is initial list of failures
> I will keep posting more as we go along.
>

Thanks a lot for the update! I've actually saw this in the master
before this mail and went ahead with pulling the latest - my builds
for i.MX8M series went fine.

I'd also have a look at remaining things and try to fix some of those
as I'll progress.

> [1]
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors

-- 
Regards,
Andrey.

