Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8E865CE9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 21:22:26 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id m137so8731580ita.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Mar 2019 14:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ddhgyAy/7q3BjmdxDRcogpfTiO19pz92H89/6v01DRM=;
	b=ioChMPc7H/OTaEe2vhANF0rWDovpTHvp629ZCSs35U3j8Se+VeI0S0Elh/m2xer7uB
	rbNDEX+kTSzQkKeStoQZ3MnWqEaDgb6V60xjzeQXx4dBVsckb3tMgcP20RvSBDdpwv22
	Dgr1d0PvMcXDdSBrCwVGqFIkNdcILB6C03kSHiR60hyYzjpgU9Mjn4xlUO/k39STUGdz
	awyjylDP4PNBdmHeVEN91io2QPp4WcsnoLnkb/8WufVNTvEgxEnnzXS+Mw34wT9VJjNG
	5IPQvnEuzHT9K7HWY34Mx7LFx0ZghrQMmU6rqTUcLge+5P6ShHJxFu30k01Uu09nlTPK
	4AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ddhgyAy/7q3BjmdxDRcogpfTiO19pz92H89/6v01DRM=;
	b=SqXeU41yuI67oXM90RHceE1I+uBvmgMwFzY7sCsECIQGHmqXh4AUZGxuJC1q5bFkSj
	4K5TlcTa6OKYIOgK3FpoW2PgNIAbnXaqArhknMOrgYC0/aQao0PZ12STcG7IkM9pPBfp
	VjnGUhlPZvYVmCXf52Nd1vFpy9Kb9qKl6onpf0ltTUp6tbUvlZqPdmZTdNnnd2AYc0OH
	A6jHJMK2YSeUgCVOB+Z4cz2qUQyJ3FVCOCI+d5UfLm2R1dGU1aWYughxZzXhuopb3Bt+
	h5+lNMV5gaGRLLK6WSIkCEfKvwxXAJSVNPvuoZv7/sv7/fZOEFBhPZluvRD7pnM+8avT
	7CTw==
X-Gm-Message-State: APjAAAVmYU4amZmtrWF14RJlVbaqHWXdClE5VywLgsFQilhdypVqTt8C
	K2mg69NnUytgpypmlvlbkPiOf7bVEFoJcmJqKdA=
X-Google-Smtp-Source: APXvYqzY56spyn2rnzyTLW2Bab/FY4rLrj+IkR8JbevnL2g2yA7mlPpv4ff4FnwwveHFWfNnlTgUrp+bgq7e3F3HId8=
X-Received: by 2002:a24:c8c5:: with SMTP id w188mr6640437itf.1.1553376147424; 
	Sat, 23 Mar 2019 14:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
In-Reply-To: <20190323211604.GA20793@localhost>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 23 Mar 2019 22:22:15 +0100
Message-ID: <CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
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
X-List-Received-Date: Sat, 23 Mar 2019 21:22:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 23, 2019 at 10:16 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Fri, Mar 22, 2019 at 03:18:01PM -0700, Khem Raj wrote:
> >...
> > There are certain design aspects of musl which are actually turning
> > out to be good
> > e.g. there is no __MUSL__ define, so non-portable code can not be
> > hidden which is a good thing,
> >...
>
> Please take a closer look at some of the musl changes to NM that made
> upgrading NM so hard for Andreas.
>
> +#if defined(__GLIBC__)
>  #include <net/ethernet.h>
> +#else /* musl libc */
> +#define ETH_ALEN       6               /* Octets in one ethernet addr   */
> +#endif
>
> Using __GLIBC__ in workarounds for bugs in musl is wrong,
> and cannot be upstreamed since it would do the wrong thing
> on other non-broken C libraries.
>
> > While the eyes may hurt
> > to see them, it does serve a
> > good reminder of whats needed for a given package.
> >...
>
> Who is responsible for fixing the root causes of such bugs in musl,
> so that the workaround patches can be dropped from packages like NM?
>
> cu
> Adrian
If I am not mistaken nobody is responsible. It is recipe wise: Sending
out a patch that fails for musl is rejected usually.

The last example could be fixed easily at musl shipping a ethernet.h containing
#define ETH_ALEN       6

or at NM
#ifndef ETH_ALEN
#define ETH_ALEN       6
#endif

Andreas

