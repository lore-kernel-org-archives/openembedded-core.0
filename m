Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 04A6E7CEBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:26:15 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id d201so8146474iof.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 09:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6HxHk/hsnVhI1Dile/Tnj4/0S7tid7BOGiqUWHZtJcM=;
	b=ewXrS1CBRbD4F2wFFiwYSJCqBeDrOLbfdFcKYQhOEll5lfu+BFYTMzUdZfCqHWzFmv
	yBfOzLnycUUJ9ZfygGANkFlr8p2+DosYhnzZ5q2gwm1CYY3LL/D6+zbCA3eEqd9wDFrp
	xAxQLAdybpJTIk/K4v5EQHeLIFMur9A9A+wJDUS8Jzmf5WkiJysH9msW3jUqnaqR8aHe
	tFJGibXbh+PIIu720fRi2R+lBCn3LdmYTQixCW7B5sWwaJeChU3ZJYl0mVsOOPDTCA5R
	Cpq/Ftu7y95zcOUFGweg6QqY/yK8njdV5zCQjVpYnBvHx5oZphFjYyC141XHyvGjzKz3
	3blA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6HxHk/hsnVhI1Dile/Tnj4/0S7tid7BOGiqUWHZtJcM=;
	b=Dj0tOUqSQc0eJFPqri8T01m8yzCGa9uEseZ4KhkZwT1q8IF7FakVgQQbuHBS6VS0zY
	dKH2apbIJ0QFXZ17DHarQDxU2n1EW2cZqqFV752i5mWVmclHUXXVynxThP9JHazRFnEx
	mZocr72aOHDlTe0sPs/KiQ3ZFot6hcmpqh2lzUjvhkzgaMYCrbkgwLquPQ3g9+q2+mB3
	MF81sTuglW7jXrUyyA4di3N/m8yfmTLtlF0WEXzs0JpYFbWjVGflIIPvO4YVd4Djiazt
	CiVLPswWa/eHpk8KcXnC72GlpJQftRbOFsCQhmkie2OuZvhOXMcT7U5S9m5H3w4U/VnB
	xX4A==
X-Gm-Message-State: APjAAAVLUTUOxVXRKKIRrAEl3bvYT8Gs7SvFOG3zq9AKPPHhogVYV68T
	eNSA8qM4bilN4MhIAMFIl7g6MIxgvFT0j60mwhQ=
X-Google-Smtp-Source: APXvYqy9bctjJ56sVlfZvCpl0pCd4bboFMOo4FMLMc/awJ6GXtSe0SQcF6OY1xoQBhH1TesfBDE38VqhvEj0XNDZzvo=
X-Received: by 2002:a5e:c249:: with SMTP id w9mr17417231iop.284.1553531177092; 
	Mon, 25 Mar 2019 09:26:17 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
In-Reply-To: <20190325161004.GB484@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 25 Mar 2019 17:26:04 +0100
Message-ID: <CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 16:26:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 5:10 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Mon, Mar 25, 2019 at 04:36:44PM +0100, Andrea Adami wrote:
> > On Sat, Mar 23, 2019 at 11:00 PM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > On Sat, Mar 23, 2019 at 10:53 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Sat, Mar 23, 2019 at 10:22:15PM +0100, Andreas M=C3=BCller wrote=
:
> > > > > On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wro=
te:
> > > > > >
> > > > > > On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> > > > > > >...
> > > > > > > There are certain design aspects of musl which are actually t=
urning
> > > > > > > out to be good
> > > > > > > e.g. there is no __MUSL__ define, so non-portable code can no=
t be
> > > > > > > hidden which is a good thing,
> > > > > > >...
> > > > > >
> > > > > > Please take a closer look at some of the musl changes to NM tha=
t made
> > > > > > upgrading NM so hard for Andreas.
> > > > > >
> > > > > > +#if defined(__GLIBC__)
> > > > > >  #include <net/ethernet.h>
> > > > > > +#else /* musl libc */
> > > > > > +#define ETH_ALEN       6               /* Octets in one ethern=
et addr   */
> > > > > > +#endif
> >...
> >
> > Hi,
>
> Hi Andrea,
>
> > I am jumping in a little late to take side with Khem :)
> >
> > What happens now is that more 'bad' sources (written to suit glibc and
> > thus not portable) are discovered by the wider base of developers and
> > autobuilders.
> >...
>
> but this does not apply to this example, which is a problem between
> musl itself and the kernel headers.
>
> Code can expect #include <foo.h> to work for any headers, and with any
> order of these headers. If it does not, the 'bad' sources are whatever
> sources provide the headers in question.
>
> musl does provide net/ethernet.h, but including it causes a compile
> error here.
Out of curiosity: you have some log?

Andreas

