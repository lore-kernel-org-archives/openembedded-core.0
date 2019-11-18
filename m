Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 551417F79D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 22:55:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47H46G3Gdsz9n;
	Mon, 18 Nov 2019 23:55:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1574117702;
	bh=9/CpVFx2MG4VqlJJE3Bu37kRpWRXOjmLiE3cPWmQAlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L9ZDAiNarLSusQTqRcFOyVO3PaKp3i3sWr8Z0b9sUBF3pAQ5iB4NkSpY6rIn5sCc4
	ds6o6mLa4QtkMjY3qX3LOmx1BjPNYRn/c2NWv0/cNtAGyM9tjF00ahaQrXGyaH4P8U
	fDo7x7omO/0YPRbSdmQulWjcuvVMARPBHvtATEwcDGJpxNxEAJX6M0OtF7pPtost8y
	3o8WqPURd9cXyovcwYdAt5MaWv0UmlXw3EjMls9gaibmxi7gsYKhbbmBJpQJN/wybQ
	2ayNlAORuwtn1bnB1vjKsUhkHbr9jPZCKP8idZG6xPWK9anhKgzy7FzS3h5QDWpXpE
	A2aqre23E2eEOBzAQqmlv2Ye3aHk8D2/pX9KZMOrrdphqCe8nc5oAjojtE7+2yAzEH
	JbQG9MdvIbANu3tSRbMKHBlY1If6URu7SkmYoXjnfNAUQGVO7f25iTp2zTNcd0g0u6
	kVq6XWOSn8llpVt2JjOjVdjiVT39zKRkDDs94ELACW+KrzzI1MP6TgSLE2tW8/ux//
	Hq653Xn7SbTeJ2OUrs8LnmeuNdKP6nliElKf5woEwW9Q6GXJycp1+t1WAgHns7F9w1
	l/g64oS4cUhPTGVTJW6FomOsxiT+hIIdP21hHSisui98SEeWWgCwZq+sDbWojUXPMq
	hZhhn9xYh3Dq7J76BqfWlxbg=
Date: Tue, 19 Nov 2019 00:55:00 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191118225500.GB7568@localhost>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
	<CAMKF1sp5SWYgoOj7Ujy5GMEEcuuATkuD45q7k7+LSc2SSkTVNg@mail.gmail.com>
	<20191118210500.GA4741@localhost>
	<CAMKF1spsipv7AbxJfmwHMU5dPtPDm-8VBxeQGWhEGUxJFG4WUw@mail.gmail.com>
	<20191118220613.GA7568@localhost>
	<CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq3hnUuM7rcCbEhfbTmUtGbpMVVZkq8mFo24FKGG=kFYA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Mon, 18 Nov 2019 22:55:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Nov 18, 2019 at 02:16:30PM -0800, Khem Raj wrote:
> On Mon, Nov 18, 2019 at 2:06 PM Adrian Bunk <bunk@stusta.de> wrote:
> 
> > On Mon, Nov 18, 2019 at 01:39:48PM -0800, Khem Raj wrote:
> > > On Mon, Nov 18, 2019 at 1:05 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Mon, Nov 18, 2019 at 10:13:05AM -0800, Khem Raj wrote:
> > > > > On Mon, Nov 18, 2019 at 5:08 AM Alexander Kanavin
> > > > > <alex.kanavin@gmail.com> wrote:
> > > > > >
> > > > > > Drop backports, rebase a couple of patches.
> > > > > >
> > > > > > This is the second last release of py 2.x; upstream support ends on
> > > > > > 1 January 2020, there will be one final 2.x afterwards.
> > > > > >
> > > > > > Note that the only thing that still needs python 2.x in oe-core is
> > > > > > u-boot; when the next u-boot update arrives, we should find out
> > > > > > where the py3 migration is for that component before merging the
> > > > > > update.
> > > > >
> > > > > I guess u-boot need it during build, in that case defer it to user to
> > > > > have python2 on build host
> > > > > could be possible.
> > > > >...
> > > >
> > > > That's a non-option since it could mean
> > > > "Yocto 3.1 cannot be built on Ubuntu 20.04".
> > > >
> > > > Ubuntu 20.04 might end up still shipping Python2,[1]
> > > > but you cannot rely on future distributions shipping it.
> > >
> > > And why should OE ship something that’s dropped by its own upstream and
> > > other distributions
> >
> > All I am saying is that relying on the host Python2 is a non-option.
> >
> > If any layer needs a native Python2, this has to be shipped either in
> > this layer or in a layer it depends on.
> 
> 
> We should explore disabling python support in uboot if it does not move to
> py3 perhaps there is a way like that having a single recipe require py2 is
> a bit too much

In u-boot build scripts are using Python2.

But this is being fixed upstream, so realistically in Yocto 3.1
Python2 can move to meta-oe.

cu
Adrian

