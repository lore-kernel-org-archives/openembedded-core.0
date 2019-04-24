Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2E97D486
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 10:52:15 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id a25so3059865otq.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sH8+3/QHCTOMYpveYCSGO4M6L3eGKc8p8QiV4gcg8qs=;
	b=mVmTeamnRQkEiMDsb/7cQp03e5w1lDfoTHdtaVBgxs0qgVq0HcTebLLljHi/Aiw/1W
	ucTXq069qPSfGwrE8CpW1Fm+71+RWSddTLLQExD129DNW1Sa//aTq8pNTwjp8rn2pm/v
	fFRa1Y8V1oNow4NfHf/oEvhOw+wO8NE/BaHo5dIPJBuXiEFL7abUOYm8o1nI6W64XnSH
	bI2vGncKk7S/NnA/C87qWEmICVZI0G7OLU2w86mKcwvBRHAwymbEHl61huPXV7sxp17y
	eMZ9oim8MuUv4z2zAD4MS396RgdZFfhQ2v7JmpbtywlWfzUblVWKGxRo71xShJ/+96t0
	Wbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sH8+3/QHCTOMYpveYCSGO4M6L3eGKc8p8QiV4gcg8qs=;
	b=adURs+Z4M0yn/e/36XadeXc7AsWuMCJ3oSHf2iFGHK6b7glBBtBXwyRzlL9kT4/CoK
	n3OcwxlkcSc/hFrngNrzG/8rWa+N+HUAvJluVZIMQj8qinAZUuKOMkdBmmYi9ClyPlI4
	FPSvDyZfMa1yIEROC58BBnKtK4hozirJOFEgj4K0PFOUzzHV6uemkJSuNr1S+Agj5kI2
	mXRkjPefDXZ8imzM8wrVa+W0/Ia686YaTAcEJSG00e+fOWutgZozGpDeMHGSG60znqub
	pwfPCC5TsWmlkTIp4M8AWN33sVaNaVvKXPFr20wMGEhAiP7VWS8VzQbYafY3GkZIX5uO
	gvsg==
X-Gm-Message-State: APjAAAWQW7QeoKA+UCHyOIqUgHZCJNR8Ua1Xqnd16H/1TTMLW4KZf8+z
	RkKuYku8/KRKWgI5QbsTSEpWf+7TUsQXcBg1L4livh8i
X-Google-Smtp-Source: APXvYqxqp2/WnFJcWqn046sva9Oox6OVr6ODR7MT6i72xeI0rO1zLdHu3f8QONSCa6TbMjIHPxnqikeTngsFnvb/y84=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr20084246oto.293.1556103136276;
	Wed, 24 Apr 2019 03:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
	<20190418155918.40653-5-alex.kanavin@gmail.com>
	<1279b24df16a06a5bdc17b699121e090d4ff1a30.camel@linuxfoundation.org>
In-Reply-To: <1279b24df16a06a5bdc17b699121e090d4ff1a30.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 12:52:05 +0200
Message-ID: <CANNYZj-Uq8cPrP04aBb6c4ETRCVwxoJnjw_UC73GKt2iFWg=Vw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] python3-pygobject: update to 3.32.0
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
X-List-Received-Date: Wed, 24 Apr 2019 10:52:15 -0000
Content-Type: text/plain; charset="UTF-8"

I'm only seeing g-i-native issues in the log, and nothing
python-gobject related? (g-i-native will be fixed separately)


Alex

On Wed, 24 Apr 2019 at 00:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-04-18 at 17:59 +0200, Alexander Kanavin wrote:
> > Switch to meson build system.
> >
> > Add a patch to disable tests.
> >
> > Add "introspection" to unknown configure option whitelist, as
> > this recipe needs g-i unconditionally.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../0001-Do-not-build-tests.patch             | 26
> > +++++++++++++++++++
> >  ..._3.28.3.bb => python3-pygobject_3.32.0.bb} | 10 ++++---
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-devtools/python/python3-
> > pygobject/0001-Do-not-build-tests.patch
> >  rename meta/recipes-devtools/python/{python3-pygobject_3.28.3.bb =>
> > python3-pygobject_3.32.0.bb} (68%)
>
> This merged but I think it is still causing some QA errors which
> somehow got skipped in the previous tests:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/765
>
> (in the native case we may need to do something with the whitelist
> too?)
>
> Cheers,
>
> Richard
>

