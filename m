Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AB1307ED22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 04:41:04 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v38so6096499qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LTt9gBv6SoeOH0ST7oEKjYcdipdDwQekhDK+ibh6qwA=;
	b=tUeUCdxeArgQ3AB433zccg+f8ZWvyQKeYIzsZageOrXenlvDaG0BawMaEGiQhoIC4B
	zVSuMb7cYO0m70qLph7qneKWpeV6upuAnAUAWHrY8NPvEGqfdrfw1FGuNR6wH6AOjtDq
	t9t7si5nnLDW8CtN1fKhypibbmjAOs5xQdA7d8ojVDOk07XvLKKUmTb42GpCoyeXg1ih
	WmCzTWO4P6yk7HJjzs3VHE2F1gUdU3eXNfwcIGPzfHIOKBpI5u9uLANA/rWb948evcib
	c+RTfdpN0lMX6VNx0icG2SBLqGd/8zmpBmhgeN0qHxjJxqYfFUGNkjHUSltx1d229BQI
	mEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LTt9gBv6SoeOH0ST7oEKjYcdipdDwQekhDK+ibh6qwA=;
	b=i+U10atnHRFiuUF8z4Nwu44wcOGfsWkmb02IbvGZj0PyBNNX2sR4Wh7HhZaL3FsMsT
	bgQD+tpkNXNTJ6sF9C4OiFtEn8ggbvZ8aN/aaB0lSydw8pMbjAnYsvtWCw6qGVKcsGhS
	6wrA0F5iWie4C4NsTz/muSYwV6s0lqXpYgsgYNfVQjUth8wyTq2IBEMF7HwK2XMEsFmg
	KJlcU/dnM5jSMfIc/M3iCgaAR4KjbeoGtMB8L6p3Dip+DZ6GM+1AWmzk+KIfct3y9SiD
	eH6BFKSEgYrkHG6vViiPEBQz/YVUbSwXhf1S7QS1sNviGCEKZEgtPRFno1aN3mUk3jSg
	NbNA==
X-Gm-Message-State: APjAAAUAJtb9FvZJUhj6BV4a8gzPV6FcGVOeT99uDkcduwcZTPROH6mk
	JtkejUOGxfqeChoQIrXauDDVSh430U8/fwnXi0Y=
X-Google-Smtp-Source: APXvYqxvmmRtYV+2mTHkBJu//vgrYkkwl6fzuKhEJty/eFk/W+lAVQPvxjWyBnj/LwfYqm4dH6WdvTxaXhi+xcQVwhc=
X-Received: by 2002:ac8:6997:: with SMTP id o23mr34775307qtq.53.1566448865275; 
	Wed, 21 Aug 2019 21:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190813152835.12578-1-raj.khem@gmail.com>
	<CA+chaQf6EnDHU=9U6q1a2_p=grcyWoy2epYXP+yaZ--qi0eH4Q@mail.gmail.com>
	<CAMKF1sqBFvdWb9XxGaUUZpcJh7zrcNkwBRLj7Ga3K35a+Fb2CA@mail.gmail.com>
	<7d45802126aa811e2c309761979ed0452f0a1d0a.camel@intel.com>
In-Reply-To: <7d45802126aa811e2c309761979ed0452f0a1d0a.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Aug 2019 21:40:39 -0700
Message-ID: <CAMKF1sooEv4r0Rb7HPi3QngYKK45XXa--2BojUOKzmp6XvWPKQ@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] gcc-runtime: Move content from gcclibdir into libdir
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
X-List-Received-Date: Thu, 22 Aug 2019 04:41:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 21, 2019 at 9:11 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> On Fri, 2019-08-16 at 08:08 -0700, Khem Raj wrote:
> > On Fri, Aug 16, 2019 at 5:00 AM Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > > Hi,
> > >
> > > I have an app which includes omp.h from gomp, it used to find it
> > > without adding any -I for that (with just -fopenmp to enable
> > > openmp).
> > >
> > > Now the header file is included in RSS:
> > > lib32-recipe-sysroot/usr/lib/arm-oemllib32-linux-
> > > gnueabi/9.2.0/include/omp.h
> > > but no longer found in default search dirs.
> > >
> > > Is this expected or should gcc be adjusted to search for it
> > > automatically?
> > >
> >
> > It should have adjusted automatically but these headers are searhed
> > relative to its own install and not sysroot reelative
> > so it might have to be addressed. Does it work with normal (
> > non-multilib ) case ?
>
> It's not working for me as well. It's easy to reproduce when using
> find_package(OpenMP) with cmake.
>
> The search paths also don't list this new path and are looking for
> headers in old one. Would the path in patch "0020-Ensure-target-gcc-
> headers-can-be-included.patch" have to be adjusted as well to include
> this new location?
>

there is patch posted already to fix this
https://patchwork.openembedded.org/patch/164057/

> Thanks,
>
> Anuj

