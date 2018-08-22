Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2B928792A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:02:47 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g6-v6so1314496lfb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2Tlj3LDLmlTUnjl+5Nn2/VOX2IzmDKx7PzOAxxxlkCY=;
	b=bMTTLsegY6vQ1YhmBnXNQP0sErGSunatkqvrGrOeDtojAC4jjUsCZqa3gWXkhiUq9j
	sX7llSUqE5zudYk50HwnDOhqvR8I813ZWlzgbPT85TmRJPt4GGYtC7XwzgBvss3np/ZJ
	/wvrsCNC+qHSodTySMC1mBf4hF03MAw7i36ybaelVTJmsbSpv+ouZfnFzcYUbKw8eSyF
	+8KgE069bO16QQTYMmtTTfy3HvfDOBXTFyKeTXSBz+AjONlCz6DLrF3u744ZaxuY8gt+
	khcFkl9oJGlUdu8Kp5KSyLPSTZK8ytp47Fdkcdb+DpnaWrCYQSevoDjGjp3b3usJVVKr
	OKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2Tlj3LDLmlTUnjl+5Nn2/VOX2IzmDKx7PzOAxxxlkCY=;
	b=olD1exy1TVw6a+rcicIHlETKVa9nZGpP2hf+DToDGuwrz/WvVdbL9sqciL3DybrntY
	hQvGwdDnoPfOcADVp8DTV/nYwrOfbo+NoOvEHHYQZUOs5v5guFAQEDBREeYjpG2s0nfN
	2IsUQK4GnY6vV979fQFxPVCzn0JGEC6RRhAyMFoD1kyh5xVxKEofZcKfiIZbOBgeRhfK
	ozvcot7kLQ+zIbzC1/5hEUcm/zRl03ev8RnXza9JaD4+uyE8fSH6mAdZ23LFEee3TFW+
	SX0lXMBqLwzxDRsuT2zwFVCg5EdemXtZBlJGTA7n6eDFuHXPdBtF18TB2eaRENlsK0Zf
	lJaA==
X-Gm-Message-State: AOUpUlHcHasKDBupimRwMm131Cp6hCXVz6W65GXoex39A0tSKBxx4fym
	2bKOwaFvy5eEimWKNFQ1zY7V7mL2gOM5VtRWlkM=
X-Google-Smtp-Source: AA+uWPxItIsPhgFm2Yqz6HyAehqY1alCkRdjSG75RNYekKWp6w033dp1IV5OyYBeXJA+6oHBY1MRLiUi/rb9PXcR2+0=
X-Received: by 2002:a19:dd8b:: with SMTP id
	w11-v6mr10892665lfi.79.1534942968594; 
	Wed, 22 Aug 2018 06:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
In-Reply-To: <83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 15:02:31 +0200
Message-ID: <CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 13:02:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 22, 2018 at 3:00 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-22 at 14:48 +0200, Ricardo Ribalda Delgado wrote:
> > On Wed, Aug 22, 2018 at 2:45 PM <richard.purdie@linuxfoundation.org>
> > wrote:
> > >
> > > On Tue, 2018-08-21 at 16:58 +0200, Ricardo Ribalda Delgado wrote:
> > > > RTLDLIST table does not include /lib/ld-linux-x86-64.so.2,
> > > > resulting
> > > > on the following error:
> > > >
> > > > root@qt5122:~# ldd ./qtec_webcam
> > > > not a dynamic executable
> > > >
> > > > Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
> > > > >
> > > > ---
> > > >  .../glibc/glibc/0031-ldd-rewrite.patch        | 22
> > > > +++++++++++++++++++
> > > >  meta/recipes-core/glibc/glibc_2.28.bb         |  1 +
> > > >  2 files changed, 23 insertions(+)
> > > >  create mode 100644 meta/recipes-core/glibc/glibc/0031-ldd-
> > > > rewrite.patch
> > >
> > > I'm a bit confused as with MACHINE=qemux86-64, building core-image-
> > > sato
> > > with ldd added to IMAGE_INSTALL, ldd works correctly even though it
> > > has
> > > /lib/ld-linux-x86-64.so.2 (which is listed in RTLDLIST).
> > >
> > > We have an automated QA test checking this too:
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oeqa/runtim
> > > e/cases/ldd.py
> > >
> > > Which version of the project are you using? How would we reproduce
> > > the
> > > issue?
> >
> > I am using yocto-sumo
>
> I'm not aware of any fixes since sumo in this area...
>
> > Maybe your tests are run agains an image that has the package lsb
> > installed. Which creates symbolic links to the standard locations
>
> There is no /lib64 in the image and I'm not using or installing lsb...
>
> There is significant rewriting done as part of:
>
> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-core/glibc/glibc-ld.inc
>
> What value of RTLDLIST is your build showing?

RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
/libx32/ld-linux-x32.so.2"

>
> Cheers,
>
> Richard
>


-- 
Ricardo Ribalda

