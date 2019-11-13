Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1F42F6D6C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:03:43 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id 1so4211965iou.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6pGwTh5rmmB3P5LZT6C/rDLX53w2iQLzgvop3eCmRLs=;
	b=KXusM9uZ5xaiXkrue+9YlwzvLc+82PaMbrgAVIuu1UNTuBLnwOGg5l+Z5cmz7hQrVT
	q0a15tXVIgcY4py/t+IIte7mvPile+Fv96znaoXEvhAjgrxo4ppfLIxFMM1S5qyxk1co
	CGa89sNhB2wCKEjE8s+dgLqYLq1Amuo/tEU/rU3IxCG+AjU0T6aHRlPe8kCSjuRWAuM2
	8jB0lv6iq8RBDeX2DGvlvytB1mMrpDtf8SluDnWfWQ8SdedykfjmH7IiVajbrLQLmXmu
	jQGBrW+vRmE/q+V40JvOOZ5pnLf5HddtzvUtydjHS9+IGtq+latkvxUOyUi7D4A+rNhW
	theA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6pGwTh5rmmB3P5LZT6C/rDLX53w2iQLzgvop3eCmRLs=;
	b=PfA96TmKH5Rc3Gr/jAdOs2pCmf7QwttCoKfiHfQUJMUY4vlJCNs1mQHlrviBxTpwQ/
	C6EGuwUtSH1tfgJ71JEKcmE7dhC1aDwlpOZ132t0BAQBjjzVdB6DeFQfyUlvAMufFjqX
	SMibwsakWNZ+PsNw7M2SnrJ3WaAY39ecAngfJ+TwniX00pxThzVFeAFsQUiHw2/lTCxm
	6KbukDwhTK4IYXoBBI4BDDaHAgjtZ4iA5AAzxFBJNKsbkbl0N/+gvR0FMoqRY2uQFHAO
	h2zIkGgL7AGvE0ScDuK96XoRL0zWanMYQlBDxJcfM8kPPWT1a/MN3WWnLOrmzGA9CC7A
	ngRg==
X-Gm-Message-State: APjAAAWtBAOu3aQg3Z1t/G2PGVgBa/ZurZWvr+AZT/92HKvkA5BAFZe9
	KFB9tFDOgvlLMgeJRDdlQaMkre5oEeR76J6i60L4T6XC
X-Google-Smtp-Source: APXvYqzTSWoascjCOtjDcfGra+4FcgH1eNnXg4vTvT7j/zDfrmARpQoRl2A3kpQfYjS+Z76rCS9fUMeuvb8GrkTP6VQ=
X-Received: by 2002:a6b:18c1:: with SMTP id 184mr5552565ioy.40.1573679024046; 
	Wed, 13 Nov 2019 13:03:44 -0800 (PST)
MIME-Version: 1.0
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
In-Reply-To: <7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 13 Nov 2019 22:03:33 +0100
Message-ID: <CAMRc=McxewMqjuu+yB27xz=mysE83kampV18xh9uc=_X5M-mCw@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: pthreads should rdepend on libgcc
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
X-List-Received-Date: Wed, 13 Nov 2019 21:03:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C5=9Br., 13 lis 2019 o 16:04 Mark Hatle <mark.hatle@kernel.crashing.org> n=
apisa=C5=82(a):
>
>
>
> On 11/13/19 2:34 AM, Bartosz Golaszewski wrote:
> > This isn't a patch as I'm not sure how to fix the right way it but it
> > seems to my that every program that calls pthread_exit() indirectly
> > rdepends on libgcc_s.so.1 being installed in the system (at least when
> > using glibc).
> >
> > This is because the implementation of __pthread_exit() in glibc calls
> > pthread_cancel() which leads to pthread_cancel_init() being called in
> > which said shared object is being loaded with dlopen(). When this
> > fails, the program aborts with the following error message:
> >
> >     libgcc_s.so.1 must be installed for pthread_cancel to work
> >     Aborted
>
> Fix for this would be to declare a runtime-dependency on libgcc_s.so.1 in=
 the
> glibc libpthread package.
>

There is no real libpthread package. There's libpthread-stubs but it
only contains pkgconfig files. The actual pthread shared library is in
libc6 package and its inclusion doesn't seem to be conditional. In
that case - isn't it better to just make libgcc_s.so.1 part of libc6?

Bart

> --Mark
>
> > A quick way of reproducing it is building a core-image-minimal (which
> > by default doesn't contain libgcc) with the core python3 package and
> > running the simple python HTTP server:
> >
> >     python3 -m http.server 8000
> >
> > Fetching any file will result in the above crash of the python process
> > when the thread serving the file exits.
> >
> > I'm not sure if the same issue is present in musl - the implementation
> > of __pthread_exit() there is different.
> >
> > Please advise on how to best approach this.
> >
> > Thanks in advance,
> > Bartosz Golaszewski
> >

