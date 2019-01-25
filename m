Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4559E7C34C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2019 03:37:54 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id u47so9294553qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 19:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8jZPwjkwnzem/5m6xd1Rm3sQ1to9mnIgFMDL3kJlBiY=;
	b=ZztLi7mhalfBTtzQDeXhiJHzmb7O6qMcuhn+U/alVjofW7tXFiCfML/TI3zTsF4K3U
	mghWg1m4M3JgIYnuPoVqbKhyBQLLnAkrdI6pCl9dpUZj84Hma5HO+sz170gq+jkrHvKU
	pygHV7IU3m3o/JZekvEQHIR1/MYmoUvkbaUuW8GGhRK4MB2yaddKa+QgKRvoYpIcLNmR
	cW6Tbwj+R6OgQI0l2406yGVTiQbbvzDRS7+ZwkGwhJzoVy/KKoz8ukF2cBOFujZpyj4q
	EY5ArZwzS1xt87AABp8KNA6d6uJssQJbtIYgeEeXM4dBitwPBFCQ9cTGBbSoTT46Ry6U
	RmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8jZPwjkwnzem/5m6xd1Rm3sQ1to9mnIgFMDL3kJlBiY=;
	b=d304vEbEh2sgEMFMCroWfS+Uaakq19RgjzybQLDSM0itLBkWpT7HI+45QxWrIaimHB
	JfZOJKIRzZHgp/YzSkQCCgY9h+Oe/ulgWk6qy+ZI2SphVoPqkwYcelF40HkiblQusJqf
	W7KGEoCGc9Ir5TLvMO7IUpgc9abRlTPRi5Mlb4hcw5efO/+ODZpcyHElJH8FqeTxYy0R
	s6TkQv7SYJp+YLDl2QwSXBHeAlbnoXmOMhmss0LkOmYMTgxIepw2qbYAU3vOK7NQwwOk
	MQ/3jBAJKzETgIwggTNKaqT8141DrJ+LC07yA5T53v/xX2LUwMWE8KEpgRoUrIjoBHHF
	2pww==
X-Gm-Message-State: AJcUukfhhfJj95SlrlMUOdcKXGBwWsm49DfcY3EdvQqPuLWhIQcdCFue
	sncaUSrJznOcbhsSRBs/yFiYJELQ0o7c9xy3ymc=
X-Google-Smtp-Source: ALg8bN7JVy0kl5cgI/i1ixSYddPl8VliSopgq3/fySf+mbqSJkAdeybm7YKyD4etNMRFZ0mV6xO8hEONF969GaoDhtg=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr9507144qtk.253.1548387474994; 
	Thu, 24 Jan 2019 19:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20190124001802.32109-1-raj.khem@gmail.com>
	<c55556f5b3b05d24c66254ade873c44c155ef23b.camel@linuxfoundation.org>
In-Reply-To: <c55556f5b3b05d24c66254ade873c44c155ef23b.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jan 2019 22:37:29 -0500
Message-ID: <CAMKF1sq+PLtw=Bxzg8=HFqspmYeE-EUU0dN42EUne+cwDPPJng@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] arch-arm: Do not add -march options for arm architecture along with -mcpu
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
X-List-Received-Date: Fri, 25 Jan 2019 03:37:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 24, 2019 at 11:37 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-01-23 at 16:18 -0800, Khem Raj wrote:
> > tune files which inherit the arch definitions already define
> > appropriate
> > -mcpu option, which is equivalent of right -march and -mtune
> > combination
> > and is preferred since gcc is getting stricter and stricter with
> > option
> > check semantics and can now find incompatible -march and -mcpu
> > options
> > better with every release. It does internal feature consistency check
> > and if it finds out discrepency between what -mcpu would expand to as
> > compared to -march it will flag the options to be incompatible, for
> > naked eye it sounds wrong but gcc would translate -mcpu to a given
> > -march internally and it might not match to what we set in these arch
> > files.
> >
> > The effects are quite subtle, where this can result in configure test
> > failing to compile due to these incompatible options and a feature
> > option getting disabled for a recipe for no reason.
> >
> > e.g. with gcc9 which can now detect that -mcpu=cortex-a5 and
> > -march=armv7-a are incompatible, many features in libstdc++ ends up
> > disabled due to configure check failures e.g. size_t size, ptrdiff_t
> > sizes, which inturn results in compiling libstdc++ with unwanted
> > disabled features.
> >
> > If user has machine definitions which do not inherit the arm tune
> > files
> > then they can still use the -march switch as such
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Only delete -march if -mcpu is set
>
> I suspect this might cause:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/212

Yes, this is because valgrind is trying to undo the effects of
specifying mcpu + march together,
I have send a patch to fix it. see
https://patchwork.openembedded.org/patch/158223/

>
> Cheers,
>
> Richard
>

