Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 37F167FD83
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 20:28:28 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d9so624918qte.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 12:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WrEsFt3AQy+6ZkDOZKrfec4yvMBZSY5fWtjPICtjOR4=;
	b=SZTuwEhcJJzqbheD/GklfGtxR6IfGTcklohA/aL4gFk+0sFrPp5okcNuHqYsk+0dU3
	3T/VCxCOsYktQhzTi4hZDowBgTmKR/+G2KLMwemJX+qFi87XBzqwNbDNEpJscJR2x2d5
	fLITCQdoPW84jQEIrS9ZfM97sZJCb72P8W8w8jW4njIoVZxFSSFYy34tx1YcJSTUZwHt
	EY2nEF19m0H1AQovGqmm+CUG6ECs/FEK1YGSQLLE3b4jPv5eIDpY8lhi4/dal5fXbAS6
	8nRy/Ay/c8vhINOxAOZipTDpdT2qWDdb0nV3JZwHmrxKHHb8YDTc9opie9hdkNXOdVPY
	xTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WrEsFt3AQy+6ZkDOZKrfec4yvMBZSY5fWtjPICtjOR4=;
	b=tMFKjaBdPM1c7AStjRZwx5Tf8QndjTAkZfZQycDfz/yVG/F1LTL/AM231SrYt0OfP7
	a+JxfwQZrPtskYgA6zXSccASzXCi5+3zDcY+ERVTaZsnJuf0I8Qb/97ZDO8YJm9c9hBG
	MbTnYIZ6JvXsayJK1MWBDFccF8/sXtyceTPRspm3ZUHrRzAOrOn8P/dsZGOz9fZKIH5C
	jx8UHZyQGNKOCNyfETWlNzafY6hZZJ6ha0/cxGg5N6lL+/EnkikWAMUKs8vEUxDSnBWM
	ps0HG6Xz7W68ek8vzz5bCkR77/kp5Kwcu7gDf0hLIicJIlqVpJ9RYIQL0j15ZlIn5G/O
	8mzA==
X-Gm-Message-State: APjAAAUE1sJGaTE2tU07xIs+ZU0EhIGiByMsM6qFvmOOLrwFjcC5J55D
	69gx8x+qeHeGmyyC5/PrWBnhrAabfBJ39joG7LQYTT3j
X-Google-Smtp-Source: APXvYqwu56162rI/6GonhHhXiQWLDrmrjD2ZjA7eHtwkj+G9KiUggdVMxm89ZbHVax8/vLbX10D5F/LbG8akyN05sVs=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr12579700qtq.53.1579724908891; 
	Wed, 22 Jan 2020 12:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20200116044609.3902260-1-raj.khem@gmail.com>
	<20200116131330.GA2546@localhost>
	<CAMKF1spz1u9sPwQK2wyyQBUeLJ611XXYwUWHUfK6TZXcFNXJ=Q@mail.gmail.com>
	<20200121163208.GA2836@localhost>
In-Reply-To: <20200121163208.GA2836@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 12:28:02 -0800
Message-ID: <CAMKF1squtHZJDkW9Of+bmBaDEP0tsa4E_qN85_00=icDnMyYaA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext: Fix overloadable error with clang
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
X-List-Received-Date: Wed, 22 Jan 2020 20:28:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 21, 2020 at 8:32 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Jan 16, 2020 at 07:17:20AM -0800, Khem Raj wrote:
> > On Thu, Jan 16, 2020 at 5:13 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Wed, Jan 15, 2020 at 08:46:09PM -0800, Khem Raj wrote:
> > > > Clang detects that getcwd is being re-declared and signatures don't
> > > > match, simple solution is to let clang use overloadable attribute
> > > >...
> > > > +Fixes
> > > > +dcigettext.c:147:7: error: redeclaration of 'getcwd' must have the 'overloadable' attribute
> > > >...
> > > > +-char *getcwd ();
> > > >...
> > >
> > > Looks like a bug in clang to me, and should be fixed there.
> > >
> > > The code does not tell anything regarding the parameters,
> > > but clang seems to misinterpret it as "no parameters".
> > >
> > its conflicting with declaration from glibc system headers
> >...
>
> Why did the glibc 2.31 upgrade add a not upstreamed patch from 2017 that
> created these conflicts?
>

This supports building userspace with clang better and find more
errors when fortify sources option is on.
this patch was already proposed to glibc and I will follow up on it.
It definitely improves fortify when using clang

> The commit message does not mention that this patch was added,
> and an OE-only patch that makes a compiler reject valid C code
> is not good.
>

I think thats my bad as it slipped my mind with numerous rebases I did
over the life of the glibc patchset.
however, I think its probably best to leave it outside core for now.
There is another patchset I will do for
glibc 2.31 where I will drop it and perhaps house it in meta-clang.

> cu
> Adrian

