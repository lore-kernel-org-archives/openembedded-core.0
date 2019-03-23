Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56BE67BD72
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 22:00:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d201so4641351iof.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5uoBKoNI/aBqmSLtsA8CR6LWDRxKmbCdIhjP4KugN8k=;
	b=jfugMZ6LMvlFs0va3x/abA/s8atl1NbsVS6QtK3pLza+XS+LiUaXH94dXa+UbiFfFe
	LQW0ponAjYo92agk0+D/tfRLZn/2Zx49eeMy9eql3DvAsXmZbhgRUBdMOi+oMuvV5avI
	14F/lGctTnxWgB1Hlsk5fRmq36pJ1P7xDlAc0WV2WTnFN5AGpiJGbde9UYHeyYtP36HM
	85Iw6ZBXskPhSc4jw7OYPWi8zNM+1CxajII4c4Ppfbh5CkBan6edwz4pUOM/ynnOGvUC
	Bu+aFiQ3SyF692SzH1f54Xgg6hP0VgJpyWETut/FsQc5sVsUme+oyKVN4efXViZg0Hyg
	kRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5uoBKoNI/aBqmSLtsA8CR6LWDRxKmbCdIhjP4KugN8k=;
	b=M7bEfg9NWQ3eo4ubYoDKPqnutINXeNV+U15LxEOe8cfJHaD8peoqmzZ0gx2pJu3hrs
	b7KwQDI9VTgzS1HSxjZPLcr+tsapcpSIOoCbAcG5F5XPwTCxro04ACFzex16atu0RSiL
	/iw0Gt0V8AWFQ9sjP+sj5jMWP16ikFMxOasG8yUX1GeAMRM4YqJiBMnvkv0cOFD4PyIB
	F3Iqj4cTGnJ0WW7uxjhupP66N6fCXSSgELCZ0YCXfK7UrkOBYwyzn/br/kDzdytWv5NY
	00mDrs5jop2gREO13p99LPAWuV4LGaqTMTJi7ZbdB2iGb16vaFnm8dy5rQBMT07NSWSK
	YKEw==
X-Gm-Message-State: APjAAAUOn+YwwQAhT0aRRdqueZ1cixXBg7ozG8a7gAsng0i/P5Dn7C7y
	WwxzKSiVBAQWQK1p5+7zBumH2SYOM9GVfzllXug=
X-Google-Smtp-Source: APXvYqzwlwmvhc4EnRSt4rPqbV+OacnB9WmH8cueT3MonzXNFhbZMX7vc145OUZ7aOFG5LkeH1veVDwT7QzpeCyf9rY=
X-Received: by 2002:a5e:c249:: with SMTP id w9mr11694259iop.284.1553378453393; 
	Sat, 23 Mar 2019 15:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
In-Reply-To: <20190323215336.GA22469@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 23 Mar 2019 23:00:41 +0100
Message-ID: <CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: musl thoughts
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
X-List-Received-Date: Sat, 23 Mar 2019 22:00:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller wrote:
> > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > >...
> > > > There are certain design aspects of musl which are actually turning
> > > > out to be good
> > > > e.g. there is no __MUSL__ define, so non-portable code can not be
> > > > hidden which is a good thing,
> > > >...
> > >
> > > Please take a closer look at some of the musl changes to NM that made
> > > upgrading NM so hard for Andreas.
> > >
> > > +#if defined(__GLIBC__)
> > >  #include <net/ethernet.h>
> > > +#else /* musl libc */
> > > +#define ETH_ALEN       6               /* Octets in one ethernet add=
r   */
> > > +#endif
> > >
> > > Using __GLIBC__ in workarounds for bugs in musl is wrong,
> > > and cannot be upstreamed since it would do the wrong thing
> > > on other non-broken C libraries.
> > >
> > > > While the eyes may hurt
> > > > to see them, it does serve a
> > > > good reminder of whats needed for a given package.
> > > >...
> > >
> > > Who is responsible for fixing the root causes of such bugs in musl,
> > > so that the workaround patches can be dropped from packages like NM?
> > >
> > > cu
> > > Adrian
> > If I am not mistaken nobody is responsible. It is recipe wise: Sending
> > out a patch that fails for musl is rejected usually.
>
> As you have experienced, it does create a huge technical debt to ship
> workaround patches in several recipes instead of fixing the bug in musl.
>
> > The last example could be fixed easily at musl shipping a ethernet.h co=
ntaining
> > #define ETH_ALEN       6
> >...
>
> That's already shipped by musl.
>
> But there seems to be some incompatibility between musl and the
> kernel headers used by musl.
>
> This has to be sorted out in musl and/or the kernel headers.
>
Although I did not want to I'll start a musl build to create a cleanup
for NM (and maybe) other musl patches.

Andreas

