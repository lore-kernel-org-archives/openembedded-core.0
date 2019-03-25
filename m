Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE4EA7C64E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:44:53 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k2so11366740qtm.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 10:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hm93MdMyL8NiN5e+ixpsk1GJWL7qQz5fbjXunFEWg34=;
	b=mA/9EqnEdzhvQ8qiQWApSkxbFTlUJQ7+KZW4flTHxLlAWR/u3Z3SlqQ3bLN0xJ9hX2
	ykcJnKzUmk/7yjhJlTW6AGM9pkblnLMO+BpTDJGMAa6nnP0kcm03KlYYyoQNPDQfj7MJ
	jIGV4SEk92Z3VWa0URwDbc/54ZP2Dg09x4J9m607cfj90rLES2KxfSVfk1d64JAhhdCV
	3TvLl/SfTSuO5Z5BLUF3/DI9zCtcPAHz3D5KpzO8EFYrxBbUq9AS61YyrWySm0sis4d+
	izgVDtX8gUdCryT7yp6pSQYC9TXcWw4SmycEnoQ3jcX4f9oe8WO1g7l/0TgiZlRckOaj
	AE7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hm93MdMyL8NiN5e+ixpsk1GJWL7qQz5fbjXunFEWg34=;
	b=EOcj7VLEygvlapUkXitnESKq9dyOcTVBkJw4L/X3C2Kr4b954sq+VAJVKvjoCo8sIV
	iiSuGbCq352mvYlQao912223BqeMWmc01yRJMR5pLEA9ywpwqBfrcPiVOVA2pjxc+TYw
	/cnD0OiRL+uloFsc9zzdy0M5dXssQu34eRhhW0ExGhgZoXhYIgLEXqliDPwyOuISJMVu
	sS32t9IJml0JjwjvQmtcp/6F1XpM87HxBALEC8tyZ7vwHnw42QNESJh0xkMR+3NG0Ed8
	Jqx0J1z8fiKNAAqq+nPO9oQhGRuksI1ZPQipn13EdpftH/88aKWsH/SQGoKZ6Jv2Qy/Q
	Zz/w==
X-Gm-Message-State: APjAAAU/d8nSXaLRbhpP3VeeuBkJZgtKhhfooIiL77uzceHlcjYelCiC
	a7DT61ay+2yi59+2diqb2MOSU/Izf1cEiVFv450=
X-Google-Smtp-Source: APXvYqwz6hnKPFM73QGJHnPq0100lZAmijoxNK5M6BGD1gkXoC2ZySK9C1KHVlVwvMAwE+YNWjJqp8U44PKhF6V6kak=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr20923725qte.196.1553535894513; 
	Mon, 25 Mar 2019 10:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
In-Reply-To: <20190323211604.GA20793@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2019 10:44:28 -0700
Message-ID: <CAMKF1sq=pwuZ6YZKPT3YqCQP-BHfYmxg5rKSMbOn3pi6iNJLww@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Mar 2019 17:44:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 23, 2019 at 2:16 PM Adrian Bunk <bunk@stusta.de> wrote:
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

yes, not everything that fixed builds for musl are golden, and some
are workarounds
as above which obviously can't be upstreamed, my comments were from
overall perspective
not specific to network manager patches

>
> > While the eyes may hurt
> > to see them, it does serve a
> > good reminder of whats needed for a given package.
> >...
>
> Who is responsible for fixing the root causes of such bugs in musl,

your concluded its a bug in musl, probably based on the patch but its
one sided view
musl is calling out namespace collisions etc. see

https://www.openwall.com/lists/musl/2012/10/11/4

so obviously, we need to make sure that kernel headers are not written
with an assumption
that glibc is only options when it comes to C libraries, but there are
such assumptions as well unfortunately

> so that the workaround patches can be dropped from packages like NM?

I think the right approach is to fix the problem where it belongs, and
generally making changes to headers
is a long term approach but is right one until then live with
temporary solutions. there has been changes in
kernel headers which fixes such assumptions broken by musl e.g. see

https://patchwork.kernel.org/cover/10724549/

We have to take more portable approach and I think its better for everyone.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

