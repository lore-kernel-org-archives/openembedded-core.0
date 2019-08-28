Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 665867F291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:06:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id e27so751399ljb.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+TLm7fiNyd7k6JeDPTB2zPikU8UrrcBV+RYOzjiWdnY=;
	b=CZqt9y7SrEgXhhoA5dnBu2UzhTxwuUJxibzZWyCoudvXPqkV5SZmvW4VCpZw4Bqv72
	cjgqr8H4URcpwFod3lfXBBirAWg7VUN0ToKbEZr+CVyrYbe8x8Jf+0D6xxIWfZVJb5q8
	MlO74Tj8nVbwo43UZvDUefA2BspFTzMUNHu4Z886bK7yYhZ1Zx8gn6KqPoP0+siw0Ltt
	VqIeYpRZ9bYrAjd4SegJBi8JOrVtHq/mv//V2UBGTULuOpQNaBOx2gKFj+yImPQvJ/W4
	6bKpmM5jhpVXS89T7q3lP6wVpcaLPjXLOw7+48tgb/RIz3dcyY46aWPV/CT5umTK7rJR
	KHCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+TLm7fiNyd7k6JeDPTB2zPikU8UrrcBV+RYOzjiWdnY=;
	b=jskUYOExfXvEkwHmNdw5UmRkG+sMemXlhd+1JHbvS39gLpOm4Ls44fxB2yEIg/eOgx
	C96hP5nD7MfYMMAfh0Jk0oNPPGPQZ3fRz+VxfBuLMXQ0ECQ81Y7VbgYckLKhwJe7ogVJ
	KlQp/rvVUG6DYmKUAQaBpx/znA2EY6PRhK9zoMzPr9hRvAy2OH0Mj88mqfY8rYNMIkwG
	m48wClfw7HkgT+Ighk4L0vLqYrrF8+XIspPRDevfGqk7QRfFLvXRGyp84L4DihtUvZpn
	nM5aBdD+NA7n4eSe6JF704y1yoLJ+TZ0wLM9XPNDL6s6mxmD+knyntEnl82Pj8XbixJ+
	lceA==
X-Gm-Message-State: APjAAAWgn3wn6KX9Eomzw3dtEqQEU7U+jYsm5BgBtIfTcEenbEnSmGtu
	KysxnEwYrnXwZXhMzNNQccK4c7If4NhnFzgS5lg=
X-Google-Smtp-Source: APXvYqxKKF3Fx5pV8ItVkpoXWR6nNGGU1ccsoLQoJq368WfTRnc9/MWhsb7ughU/U6b8tBD3nHvOps+p765JfM/lU2o=
X-Received: by 2002:a05:651c:1036:: with SMTP id
	w22mr3022085ljm.79.1567022805654; 
	Wed, 28 Aug 2019 13:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<2b7778d3ad843f67d5e844902a16af93a9e5c6d3.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200051.GC3044@localhost>
In-Reply-To: <20190828200051.GC3044@localhost>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 16:06:34 -0400
Message-ID: <CADkTA4M_47y=sz_=TQiddP2zKmhh7tDb3P3j_PWcq-UF5-E3ew@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/8] linux-yocto: introduce 5.2 recipes
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
X-List-Received-Date: Wed, 28 Aug 2019 20:06:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 4:00 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Aug 28, 2019 at 03:28:36PM -0400, bruce.ashfield@gmail.com wrote:
> >...
> > --- /dev/null
> > +++ b/meta/recipes-kernel/linux/files/0001-foo.patch
> > @@ -0,0 +1,25 @@
> > +From 9ddc5e377434e28f1f3c74c9be011b0c9dfb1de4 Mon Sep 17 00:00:00 2001
> > +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +Date: Fri, 1 Mar 2019 10:09:43 -0500
> > +Subject: [PATCH] foo
> >...
>
> Debug change that leaked into the submission,
> or missing proper patch description?

Damnit. I scanned right over that :D

Thanks for the catch..

Bruce

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


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

