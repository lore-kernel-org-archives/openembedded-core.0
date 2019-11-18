Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id EB3A17D2D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:27:23 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i17so22380288qtq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 15:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=AoxrLPHcxNKlBwJzfWS2OHeDUpLk0IA459LyDhbPNwI=;
	b=gSVuFn63QIO04397PQrUgGUEQfuQv2RAqtsIQQePEGoCDhiftoY+w76G4hOo6IO1mG
	3FP0MfP94SlA4e9a0xuuDwucNPZK1IKR4EXK4BsuRFG/xfPOpphtVJ8HjZUBwVmQw6WU
	fQBSEWpirErvl1piGbi6KUmSG83Jac7HDpiB42m4HSNfKoSC80BEWQFRIpaeL6kAPdKj
	Cb0mlF+Tp502EgxjUAWlcKvlOtDCwxlrIvFRT4u8bGgClhZQNLb3mS61rcbFZpGmTbsS
	lgcN61wI+OUkz8jTw8FqGgIVe8YEdTjSVERJ2dTcTMt0Sppuhvx+FaQInFLQm6SKIxOD
	5FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=AoxrLPHcxNKlBwJzfWS2OHeDUpLk0IA459LyDhbPNwI=;
	b=gnoMFyXgMAEqLlpIChSdL/8wIkODp6jMHWBxUZMCb7R7h4ormV6HCwyzIRKgAXtnpZ
	wMNH5x7bGsfl1V15w+KNT1dWnezc2apFWTvkbCmj0q+boxbnIvWYKSPeFCFNQ0fDiNb5
	qVhqSjCIKyvqHCHoT10UN8PVkiEcoLFU+rQdoPpo3rP3IYnFQNSBxYRfhZ8/ZpMFDs4G
	JhV0TIUjGv8MX+HUT4//Y9vIi53t/htAlDdFVTEmuEe6NGq3xbtoT6ITv8sLBseLdvO2
	O6SDqfqFt3QBRmv+UHk+2Gq5gsjWfkKB4eLyEhD+gn4swE90j+0UIsHWAPsfi8KlX+5A
	U/Vg==
X-Gm-Message-State: APjAAAWHyEukJZtJJpS25LMNEdqI75JCrhLES+f59WBQY5ROjm7fMVP3
	HuOsSt7bYosBedR/llgNWIMjxC4rKmrK0WcoFlI=
X-Google-Smtp-Source: APXvYqzH/OWwXBGJWIv96jIsj7CkiG4WuvJ9Zp/1IBoET5+nEweSEevGQEHz4Njbhu8BNJM7SpZ3tj7ER/TXmpYwauQ=
X-Received: by 2002:aed:2724:: with SMTP id n33mr29828546qtd.194.1574119644209;
	Mon, 18 Nov 2019 15:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
	<20191118225500.GB7568@localhost>
In-Reply-To: <20191118225500.GB7568@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Nov 2019 15:26:56 -0800
Message-ID: <CAMKF1squJq7mLJJBhf_+EQbBTHb1c8R1g449e6Uo2v=MtNk2XQ@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] python: update to 2.7.17
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
X-List-Received-Date: Mon, 18 Nov 2019 23:27:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 2:55 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Nov 18, 2019 at 02:16:30PM -0800, Khem Raj wrote:
> > On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:
> > > > On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > > > > > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > > > > > <alex.kanavin@gmail.com> wrote:
> > > > > > >
> > > > > > > Drop backports, rebase a couple of patches.
> > > > > > >
> > > > > > > This is the second last release of py 2.x; upstream support e=
nds on
> > > > > > > 1 January 2020, there will be one final 2.x afterwards.
> > > > > > >
> > > > > > > Note that the only thing that still needs python 2.x in oe-co=
re is
> > > > > > > u-boot; when the next u-boot update arrives, we should find o=
ut
> > > > > > > where the py3 migration is for that component before merging =
the
> > > > > > > update.
> > > > > >
> > > > > > I guess u-boot need it during build, in that case defer it to u=
ser to
> > > > > > have python2 on build host
> > > > > > could be possible.
> > > > > >...
> > > > >
> > > > > That's a non-option since it could mean
> > > > > "Yocto 3.1 cannot be built on Ubuntu 20.04".
> > > > >
> > > > > Ubuntu 20.04 might end up still shipping Python2,[1]
> > > > > but you cannot rely on future distributions shipping it.
> > > >
> > > > And why should OE ship something that=E2=80=99s dropped by its own =
upstream and
> > > > other distributions
> > >
> > > All I am saying is that relying on the host Python2 is a non-option.
> > >
> > > If any layer needs a native Python2, this has to be shipped either in
> > > this layer or in a layer it depends on.
> >
> >
> > We should explore disabling python support in uboot if it does not move=
 to
> > py3 perhaps there is a way like that having a single recipe require py2=
 is
> > a bit too much
>
> In u-boot build scripts are using Python2.
>
> But this is being fixed upstream, so realistically in Yocto 3.1
> Python2 can move to meta-oe.

No I do not want it in meta-oe, whoever needs it, should step up to
maintain it and start a new layer
much like meta-qt4

>
> cu
> Adrian

