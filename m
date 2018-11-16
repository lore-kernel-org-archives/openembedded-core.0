Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7917D6C465
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 17:48:44 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id o89so38755134qko.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KOlpJhLHhAgz6QB5OSJFEq6YrieYDOeKxLR8+QFDZpY=;
	b=scoHEiLa3o6qI8KwrdEDb4M5WxtTO5C9/rN10ptZvg0dIhTJ2ZRQXik/pf693uaYk3
	kkBsmq3FT6kFN+SNcbloULE+jREXW9xkylvYvr2wDk/vtn2ml5141othy7/UEXmTJCq2
	YP5b10zzEMDK+LAzNseFl1gZ2OT3JW9MXcHp5vI0RCnpIqnasJzm82MfA54CjwLvvEcj
	gYjOb2R8m270Wdaulco7i+NzuMCLwQNqvajdrpqk/H5SuOd0S6kVa+RyPf6ehKRpKoKZ
	S2gP3OvEqin7h9r4HH0pE+CLUfASZezsEyMvvcuIah1rE6fgdTaGnPXvF59pF2mp5rFk
	UGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KOlpJhLHhAgz6QB5OSJFEq6YrieYDOeKxLR8+QFDZpY=;
	b=eokU0vO0EcqNWPuAhGJxcA8uixYd0TiCLqZZOmuRVIkwYJw0P2DrDO2XkLuIiENVln
	sMs9ji6e1qHtKWUtsnzgM4g1kfgeaVMRqGOLwmP+q114Jbd4MMsPxuu12pskllwj+DSp
	HKR23P1oQ9+fIuEfVL1+8qE606UCkMzwGhofHjLPPd0xuqtrWTLslFMLT5nezQCw1FqM
	xUnQxmjHfLZar6qT3a9XRbbxz5GdiRg2WcxJpQ+LcqHr0iLMU1z1al+mcFWFhmNEa+aX
	y90ZtRb3gKmMpa/S4x7nlzoTPHPO7QjtiJknFHZQGc5vCqJwdzhlJ1L+eV+NYK69gJO/
	wHUg==
X-Gm-Message-State: AGRZ1gItlavadgmtsxTAVaW1htg853WvadnQVWHbTb9Zms5QzdYltLfx
	q12v930iG8xfX9uQo7V2nLyDoGi0R982N9tdPLk=
X-Google-Smtp-Source: AJdET5es/nfRpb0jbXGH8eApBw4IJoB+Cwdv+2tq7N/zqHiNZ/fw594TA3imXdJsvpW5aJoyu0yGBf5Gu2GKJSTGS9c=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr11078255qtf.196.1542390525050;
	Fri, 16 Nov 2018 09:48:45 -0800 (PST)
MIME-Version: 1.0
References: <20181114132336.71049-1-raphael.kubo.da.costa@intel.com>
	<5d7a7c30-0d55-da47-c6a2-1dc0fcddce5c@gmail.com>
	<871s7l6mx3.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAMKF1sobx8ed6ncDifE-iCDyn=+NZpar2Wb4dXwbKzkmcphEWA@mail.gmail.com>
	<2a06fb2631686ac5691b5943815535167fe774bb.camel@intel.com>
In-Reply-To: <2a06fb2631686ac5691b5943815535167fe774bb.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Nov 2018 09:48:18 -0800
Message-ID: <CAMKF1sq+dxxs4EZX6tZsRL5QbgZ3V1ZuSw5t7YPj8GYzRJY3HA@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] m4: Workaround gnulib's fseeko.c implementation
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
X-List-Received-Date: Fri, 16 Nov 2018 17:48:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 16, 2018 at 9:16 AM Kubo Da Costa, Raphael
<raphael.kubo.da.costa@intel.com> wrote:
>
> On Fri, 2018-11-16 at 09:05 -0800, Khem Raj wrote:
> > On Fri, Nov 16, 2018 at 7:51 AM Raphael Kubo da Costa
> > <raphael.kubo.da.costa@intel.com> wrote:
> > > What's the relationship between the -next, -nmut and -nmut2
> > > branches in Yocto's poky-contrib? How do they interact with oe-
> > > core's -next branches? And what's the process for merging them into
> > > the actual stable branches?
> >
> > they are staging private branches used by maintainers. Eventually
> > they should show up in <release>-next and then into <release> branch
>
> Right, and how do I know which and whose branch(es) to check for before
> sending a backport (or even to track in case I just want things to work
> locally)?

thats just the maintainers process and usually leave them to do that.
just tracking
-next is probably better unless I want to be nosy :), maintainers
replying to an email
pointing to the pvt branch is sheer out of love to let you know where
the patch stands
as of now.

