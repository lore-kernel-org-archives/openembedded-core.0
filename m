Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBC2260801
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 15:15:40 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r37-v6so8498749qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wkrL463w/cdfsMgOOilPUr9SqX6PdwWhzLButAlsjYg=;
	b=i5ojEWbMyxADzDRr1K4fDctD6oxQvCgvtVShiBjBpl/BHJ0olOgwp9Cml2iN6RsJ6w
	BEBHEAcYU3zTQuNXkYGfj5Qua2SKuaXbf7pSjZR9WGSBBotJPayaxPFaMvwtiETmlaPY
	0WgArUqKGXNdCwta6id9nPLViHbxWJ61TmnwqXiEpISiP/2dA5efaeanmtC5+RuTt7Nm
	RRYDi3Bs7xHFlo9rSqh8Gu6dyICfKXnPnNVGvZ7RHoIaj2QesdeOFCvfM/qqNp8nk+YQ
	Iu0QaU6tgJdm7MzchbvSdt/90nHi6MEURZUdaFqTbqjwlg10HkF6uZlzimc8c0gg2o0C
	OPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wkrL463w/cdfsMgOOilPUr9SqX6PdwWhzLButAlsjYg=;
	b=WQUOZDfz6v7tcCiKx4/OGt0b4/HsYjjvwjy5oZpWydmFFOZ+06xjP9wf4/rN/M1jng
	n3TZjMVNfrUSB95pbcLrU/wlwtnsp106Js4Pne1vQkD77xp0bT0gzft8CYatGKzq5xH1
	YImlT9WErXhIhFnS2B1ijwelvhzfTMq09iozm3ionEpNKbBIlFfOXF6/N0ggg+qTwcux
	Q5YHF7Jp24oAZlXxlqKsPbNQHHsJ161Pme/GIORDOurribGyeSoWnEzPLCSW+TaF3DEM
	1zgKlFIEO0AwSLDvJXZfbM7Wns0HT0tHR22Ut4n8/5yIvvMozux5nbEq/71eUPVHfn5/
	jqhg==
X-Gm-Message-State: APzg51DjZaLHL++SZle6uFfI4wkEzX4r5pZJypfvkb79aqn4o4WLB2bO
	VZj7iWfZOZATl8NBLW6r4aD05t5vWsggvpGMUSI=
X-Google-Smtp-Source: ANB0VdbkaAvz5SgipMxyUdOuwFbY4O7FGj/fS2qC9G+GW4QKF3zHZJHEetLzfEFzE73W51ZHnBad0cefd2bS8WTVt+s=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr35519537qtq.161.1536160541071; 
	Wed, 05 Sep 2018 08:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
	<CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
	<a12df2950bb8cbe607429ba26247543ba63367af.camel@linuxfoundation.org>
	<CAMKF1spTfZD2B19zQFH+PhAytChCe1k-05ma2QQ9TCVp3TNrgw@mail.gmail.com>
	<fbe407b0f91278f2d416884eb1d737af30a20808.camel@linuxfoundation.org>
	<CAMKF1sp9uBnKKKu5nTKu_dS2=onTJvOgeroNDQtNx4DrWqBeRg@mail.gmail.com>
	<CAJ86T=V2QTuiz=KzNzZeyLKyvZd6m+ZPKmkP+tZwhfM_=fTASg@mail.gmail.com>
	<CAMKF1sqWuf8sQj7TA_G-prWpOB5mtXo7F8k_K0bj2ufHXRa6Yg@mail.gmail.com>
	<CANNYZj9rQ-vFT09JPs0pJ46HEYK8_UNzA5Di9G6OXosHOKt3mQ@mail.gmail.com>
	<20180905085322.GA1795@jama>
	<e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
In-Reply-To: <e7847d5e6eb6103ddf02e6da14a1449227e5665a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Sep 2018 08:15:14 -0700
Message-ID: <CAMKF1sqynK2-5b9ex5fcLW3s2XTH086Ajps_-50stxVvGX9xLQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Wed, 05 Sep 2018 15:15:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 7:45 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-09-05 at 10:53 +0200, Martin Jansa wrote:
> > But patching the components to use libssl10 might actually work
> > (unlike
> > just changing DEPENDS to openssl10).
> >
> > It's not only conflicting in build-time in RSS, but it will conflict
> > on target as well. You either need to migrate all components included
> > in image to 1.1 or all stay on 1.0.
>
> That isn't quite the case. For OE-Core we have images using both 1.0
> (openssh) and 1.1 installed together. Its true there are some issues if
> you try and parallel install both the -dev packages but normal target
> images are working.
>
> We could probably "fix" the -dev images to an extent by making 1.1
> replace 1.0 dev pieces.
>
> The build time sysroot problem is harder unfortunately, I've ideas
> about things we might be able to do but haven't experimented as yet.
>

If runtime conflicts are clear
I think we can install the headers into /usr/include/openssl10/
and dev libs into /usr/lib/openssl10
and provide a openssl10.pc file to we can use pkgconfig in packages

> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

