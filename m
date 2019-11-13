Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id D38337F362
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:58:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id n1so4142084wra.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2a2vUgfMDQ+SoI0k5/O3soo5Kqu6Ej/FTwZOkRfxURY=;
	b=Ltci9GmrZQ7F3ltAffS+6ijSXVr+nx7f5M4LCBGSSpuQfOgebxUQI6avvdIwCCZdkW
	jczQOlmbysoWjlhsBGOguLOkU4bp0Im0IRnCdOgf0UyRWeKZqSJLPDBLdEgiyFWllvrM
	Vuk5A8HhlA6p/0cYWJ/MKPKFDQXT5hd7NzowE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2a2vUgfMDQ+SoI0k5/O3soo5Kqu6Ej/FTwZOkRfxURY=;
	b=gsBso/B3TN2OzDZb5aXWizzLk2kAcnQPjlckHynkNCwLIMOKhoj3WNGm1wS3FBSZ9T
	KJ9RHZE5fBJrRRE6inUFxmWTuKffFfmNCutsDc98EaeZXAuqy+I+sPplm6GOpM1//xBS
	PhdKSkWQebGFxUjLz+NDyC8UJMMFuyWGAEkN+lHTsS57m/DGFnxUvD1/RP4NxHyQqhj4
	SETwzNW3vU4eNE/wtYHKJ53oY/Sc7AiTmon49/6WzFB/LZ22GX83McdXUoRrhYhcLNFZ
	u/fkVbp+/JtBJqPQVYaHxg4HK+JucrwVzbPpdZQqqeXt7ygndv5TNjkxXfy4TeFpqmjW
	Cngw==
X-Gm-Message-State: APjAAAXtGQwrK5xAM/hsXunJnmU+GIB9r+xEQLO1iGKAWNAS9Yoqyf0d
	P3TkHqNas+2a35Y1CxNntSK0F92tSuI=
X-Google-Smtp-Source: APXvYqzAeot3iiHJg0ABKtQkDSbrmotqDzt1dieq3c9jklpc+lpmXFdkQPMtTdnNCaF2683GJ+D9ew==
X-Received: by 2002:a5d:4d0c:: with SMTP id z12mr4478106wrt.139.1573682326526; 
	Wed, 13 Nov 2019 13:58:46 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v19sm3376026wmh.16.2019.11.13.13.58.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 13:58:45 -0800 (PST)
Message-ID: <34a750751be58da171e596e17f117be54bdea0f0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Mark Hatle
	<mark.hatle@kernel.crashing.org>
Date: Wed, 13 Nov 2019 21:58:43 +0000
In-Reply-To: <CAMRc=McxewMqjuu+yB27xz=mysE83kampV18xh9uc=_X5M-mCw@mail.gmail.com>
References: <CAMRc=MfGPct57NYp9Nzozdjr6Va861-mXkyP335acPoThx+YCw@mail.gmail.com>
	<7378e406-2727-2449-5583-9c3f90e39c67@kernel.crashing.org>
	<CAMRc=McxewMqjuu+yB27xz=mysE83kampV18xh9uc=_X5M-mCw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 13 Nov 2019 21:58:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2019-11-13 at 22:03 +0100, Bartosz Golaszewski wrote:
> śr., 13 lis 2019 o 16:04 Mark Hatle <mark.hatle@kernel.crashing.org>
> napisał(a):
> > On 11/13/19 2:34 AM, Bartosz Golaszewski wrote:
> > > This isn't a patch as I'm not sure how to fix the right way it
> > > but it
> > > seems to my that every program that calls pthread_exit()
> > > indirectly
> > > rdepends on libgcc_s.so.1 being installed in the system (at least
> > > when
> > > using glibc).
> > > 
> > > This is because the implementation of __pthread_exit() in glibc
> > > calls
> > > pthread_cancel() which leads to pthread_cancel_init() being
> > > called in
> > > which said shared object is being loaded with dlopen(). When this
> > > fails, the program aborts with the following error message:
> > > 
> > >     libgcc_s.so.1 must be installed for pthread_cancel to work
> > >     Aborted
> > 
> > Fix for this would be to declare a runtime-dependency on
> > libgcc_s.so.1 in the
> > glibc libpthread package.
> > 
> 
> There is no real libpthread package. There's libpthread-stubs but it
> only contains pkgconfig files. The actual pthread shared library is
> in
> libc6 package and its inclusion doesn't seem to be conditional. In
> that case - isn't it better to just make libgcc_s.so.1 part of libc6?

There have been strong objections to that in the past which brings us
back to Ross' proposal...

Cheers,

Richard


