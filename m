Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93E867F0E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 08:08:52 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k8so18595141iot.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=f89s+IePqgDfFuGVZiao9TBhoJkHPUbViEDTcU3wmg0=;
	b=v/Qz2MD4P1p2jEBSZ+nO0i98fKF90sAnaBVgqBMstwAcM9MapEJIZMaMD6RU0SjqRv
	hAD1NxhsTqv3OIym06KdVDvz9Kq7hHre7r6naRfrshonzRy59D1tlGBpONSGVBE/GNhN
	95abHTnMgv3Q2sue4TL3S4DdFAARr3Y+bOc1sIiq609WTrBZs9htHKw98xagEdc788z5
	5OjMb4uRPrCynJlKupNkh+bftwp5FrbgEitzI0BzbbbD+oQy4cz7pgh/BT4nXLrEEW2m
	g58yAhHtOtM6GAusuEev5/qrhyPDTHeYEHA7vN9feASZk+V96OWrqncQbJdaSAx1OuXL
	MrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=f89s+IePqgDfFuGVZiao9TBhoJkHPUbViEDTcU3wmg0=;
	b=kO0TlkwwBB1g0s15PZPU/EPH64Q8FlzsO4sjD4XYYwCH5s6siNo0z1sq41AMU1cqSm
	/X7eyh3XNHnnRCOg1Ih4mqOCCb1oDiFcrg4RdRc89RErO/iC3rNEhDAlJMOYhyilz9/m
	CjdTYy59O70XwnCh9PaauqgEKLgFtoFV0oTO2MPzQxHpPetdt/U01M+8eiHR5Jo0dJa0
	wOWNXQnHlVU7hJ/WlRSY9UnVzjbdybORwHezB+Q+DoNBmBXah4E2S69toewbBRSm1Stx
	D/ZZ765mn5WI8fzcDhjpk99uQ1JQOVpO/SCoKwo8wUQc+VY7etWx3hGirnQ1aZaXejRv
	uLXw==
X-Gm-Message-State: APjAAAU6BgfU746WYIxsd3BK2GAG8vcgzYfYJ2oojewaLspAyD2AB4XD
	UlQ6IAfjWL7ASGBdnoU+8oqLl9tteoEtaMcZYMtBPg==
X-Google-Smtp-Source: APXvYqxPUdqslX7F3RhVWEO1H3r+V2ly6pdWC+beEKba3ONQ2Q5RJEiZKcSZjDZZ//1REtZ1XEjAlMxKwZkSnGLYovI=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr9580674iod.25.1562918933587;
	Fri, 12 Jul 2019 01:08:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190711235423.23013-1-ross.burton@intel.com>
	<CAMKF1srPCffyPSbQ+_QAd-3rDh4=X8TgDyp0abTPT0fS+9WBhg@mail.gmail.com>
	<CAJTo0LZMEU=45FdVhO0dejvd-KoSbQUM70sz-MasxB22TBiD_g@mail.gmail.com>
In-Reply-To: <CAJTo0LZMEU=45FdVhO0dejvd-KoSbQUM70sz-MasxB22TBiD_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jul 2019 09:08:41 +0100
Message-ID: <CAJTo0LZ=rajOnkkPgZpKOmE2ORnD81J8stBe8ETxaC-45TZyjg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ninja: use Python 3
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
X-List-Received-Date: Fri, 12 Jul 2019 08:08:52 -0000
Content-Type: text/plain; charset="UTF-8"

Bug closed as 'python' doesn't have to mean Python 2.  We'll use use
python3 to start the bootstrap ourself.

On Fri, 12 Jul 2019 at 08:49, Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 12 Jul 2019 at 01:54, Khem Raj <raj.khem@gmail.com> wrote:
> > Maybe we should encode it in interpreter section inside configure.py
> > itself and upstream it.
>
> I've filed a bug (https://github.com/ninja-build/ninja/issues/1601) to
> see if they have any strong reasons to stick with python instead of
> python3.
>
> Ross

