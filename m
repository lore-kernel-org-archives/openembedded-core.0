Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id A491D65C8F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2019 05:09:19 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id c189so4805516qke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2019 22:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G+NGKaoNpbXzakEWABQik8kZlI5Rh5v2Sn8WXI0XmPo=;
	b=bAAjJnOGfnazNbZPKAQwQRlq7rqKxUvYIz6YKd1YwTrsFmNQGUu/HvA1UzMbkSBkN3
	IgWUl2SAJzZXX/JCzCR04AVGgDHp2D7xeZKn0ymmvrj1ng0C69QmzhBDG0dhloU+WZti
	VO13ycRmgKCQHf5ATlqPV/Pwnl+sj2psZ+TptYzl5e676Tu3Z2xpv1Fc9rwhgA9Ztsa5
	WDgm47cOt30HcOzf3jEHz/rZoIkdMLAoeAXb0xIaDMx6j+eG1wdqd7RdfyMxRvpFm70R
	00oHChKK2LqUzlwMEn5Bvm+FC/sdv++mPYYVNz01ZaCHe1VoXFxW3eaWAWaZqqDPZslt
	hNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G+NGKaoNpbXzakEWABQik8kZlI5Rh5v2Sn8WXI0XmPo=;
	b=kwiViosaJp+nJuedQhAYa/c2KTzibs6dO9RXihNmE2B0dm0c3HcLG1B03TefQaogrN
	9sHmCxFArN6c++V4Ubp73OJKvLulYf7YmrEa7s/RrHiqolyeNAOAIMGKm97eB0WGNBG5
	GtdUwDB0QJdaq4COZZUja3w+R2a4ngjoFrsNTSin7+OV4xIlDGQpUXK4ER8PclM/7GNs
	lKZqU2oJOXVN/51xXJgPlFvQiciGiGDLp1JTxa5ukzCbpS+l7RHT+AVquv54YAPk+fkd
	Okzj62tjWuiSxfwm5zTO0Pu8aaDP5aq/iTOfmTmGg8ekzll4PRc0rfqn7cO131yDKF+l
	8Mqw==
X-Gm-Message-State: APjAAAUUvTM5IQbdQ4UeoE2RpSk1edIKrq/ggMGrudGioUhB1+OP+Qf6
	zHz4/kuxVsWIsGMp2kO0zXcI/6WGuVQZ9VzrEVPel8nJdOk=
X-Google-Smtp-Source: APXvYqytDjloamXwCx2CcIud3CurNzFMRdaD98nX1W+k8wXjY/M8UvSrixDNzujmS1LRbLwrrUSI/alnCm5i6ocpwMw=
X-Received: by 2002:a37:451:: with SMTP id 78mr1377343qke.315.1552626560388;
	Thu, 14 Mar 2019 22:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <d33eaa8904924405a9a5870faac183e0@XBOX04.axis.com>
	<CAMKF1souJ1e1GG6qHvSsSYi6v84FriBjwP3Fifp10e8Z2mK-_g@mail.gmail.com>
	<56f123443c35462c81076bffe4f7fb5c@XBOX04.axis.com>
In-Reply-To: <56f123443c35462c81076bffe4f7fb5c@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Mar 2019 22:08:54 -0700
Message-ID: <CAMKF1spb01NPYDa04X30oiVoY_GyrVKcXYyfUWaNkcduTNdr+A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
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
X-List-Received-Date: Fri, 15 Mar 2019 05:09:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 11, 2019 at 6:49 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 11 mars 2019 05:24
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: OE Core (openembedded-core@lists.openembedded.org) <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: Can't build product that uses DEFAULTTUNE="arm926ejs"
> >
> > On Sun, Mar 10, 2019 at 9:20 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > I'm trying to build with master of OE-core and one of our products
> > > now fails with:
> > >
> > > ERROR:  OE-core's config sanity checker detected a potential misconfiguration.
> > >     Either fix the cause of this error or at your own risk disable the checker
> > >     (see sanity.conf). Following is the list of potential problems / advisories:
> > >
> > >     Error, the PACKAGE_ARCHS variable (all any noarch arm armv4 armv4t armv5
> > >     armv5t armv5e armv5te arm926ejste arm926ejse <BSP name withheld>) for
> > >     DEFAULTTUNE (arm926ejs) does not contain TUNE_PKGARCH (arm926ejst).
> > >
> > > I believe this is due to commit ac83d22e (arm-tunes: Remove -march
> > > option if mcpu is already added). If I build with Thud, TUNE_PKGARCH
> > > is "arm926ejste". The  lack of the "e" at the end when building with
> > > master seems to be due to the definition of ARMPKGSFX_DSP as
> > > "${@bb.utils.contains('TUNE_FEATURES', [ 'armv5', 'dsp' ], 'e', '', d)}"
> > > and the fact that after commit ac83d22e, TUNE_FEATURES no longer
> > > contains 'armv5'.
> >
> > right this should now check for armv5t
>
> There is no armv5t to check for.
>
> > armv5 has been removed from upstream gcc as well. So we only support
> > armv5t variants.
> >
> > > //Peter
>
> I am by no means any expert on the tuning files (actually they mostly
> seem like black magic), but I devised an alternative solution for
> preferring -mcpu over -march that I think is less invasive and without
> unwanted side effects. I will publish it shortly.

I saw you sent couple of patch to address this, however I think it can
be addressed a bit differently and patch could
be simple. I would be keen if you try it out and see if that fixes your problem

https://patchwork.openembedded.org/patch/159591/

>
> //Peter
>

