Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id A00397BF65
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 21:23:44 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e5so9592958qtr.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 13:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gMA0iyCnoBluXyXdaC8AbCg2L4evg6QA42uG6+EmuI4=;
	b=fkKVIIGBdZuwE4QpPRFitdJthH5LllCbWSnxGDQko9BOq+LrODVH6o8vESDBTGUqkO
	/+ONrORTgg3doUU17HzPG6KPHOPp1NF+xI65NXsthuJ0Hgx/vMgGN8EMBAmUAhi3MQBc
	HEkVE/dyH6lbcLWE5ElG5KeZFwDzf2xiRYtBsTyMeMm6f0kK7iwdjfBRsIB+oEiX/j/S
	x0X/xnL7tQdPeI7p6ILSxa9zJhdzt/m9RBag7QZTarw2pUwm/rMDqVc9XW0hDgMMM77H
	W6qg1pqepua3MNtu8MpvZwCviuOuxAFJlY+RNM+CRhDXm9rWrOxaRH/POjxksFy6vfdq
	armw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gMA0iyCnoBluXyXdaC8AbCg2L4evg6QA42uG6+EmuI4=;
	b=AJ1bQ7CXi/42TCSSxmnXD1Lr5Amkwe+hq3VcOkDmUQH/CNxhLzOmwIhM//djDgRJcA
	fvAL3k5azYV6CP4kAIzLJBdUXJV+j16r1gcdgfopwZ1qLwxE0CFxfyt3f+F9Czy7SFxz
	RFIvVXCOurQaQrXayyEPDV1VUuQTBIYpx8v96SBBcEoZfWfi0U6yCg18i/l5JZRiTyvq
	YNP8gFbsHRNgN5GtSeKPOp2j7/m/fkcojaJlhm/NBr0f0bfiEEk+0J4koyVNrMD0WPdV
	ni4ZDTRaSEfjqR8+4lnBb4obVBeSy2yaYNxI0QT4M4wtv6JGcndqUTc02365Za+8dgij
	sVWw==
X-Gm-Message-State: AHQUAubEwNPcByqha89zJyOG95k1PP+zMXPqzX045vJHlK6x2qSFAYhK
	7tqWyg6e6hwQs+U0LtMciXri0aQj/8vUpwo9LoQ=
X-Google-Smtp-Source: AHgI3IaDUib93z0LZpNTSuXkMzIwRiQ4tD7nplYo6OI5ISgP4ZmZMw2QwA3jKAbKsRhAoXPdpK1c8zFBWmZxVjsYyuY=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr775604qtn.253.1549488225171;
	Wed, 06 Feb 2019 13:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20190205003627.4454-1-raj.khem@gmail.com>
	<CAO5Uq5RAbDD9KRQhXT2osH_ivYvskAMRMj82yq3RB8Zr0QdF8w@mail.gmail.com>
	<CAMKF1srzx8nQXUH8BxYJ_-oAfN+mfPryiGLgGRjh4ey+o07DnA@mail.gmail.com>
	<CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
In-Reply-To: <CAO5Uq5QO=c6eZRuU3Ew-_AEN0-EagqPX+2Ld_yhKLFb1Ztb6WA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Feb 2019 13:23:19 -0800
Message-ID: <CAMKF1soYBT9-3_GKcAcf9EnL8ZkVmgxjVEho72HugQ4=abLEDw@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] multilib_header_wrapper.h: Use #pragma once
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
X-List-Received-Date: Wed, 06 Feb 2019 21:23:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 12:58 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Wed, Feb 6, 2019 at 8:50 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Feb 6, 2019 at 12:41 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > >
> > > On Tue, Feb 5, 2019 at 12:36 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > Avoid infinite include loops, especially with bits/wordsize.h which is
> > > > now possible with the synthesized headers since we now also synthesize
> > > > bits/wordsize.h itelf for some arches e.g. arm/aarch64
> > > >
> > > > In cases where extra preprocessing tools are used such as clang-tidy
> > > > e.g. and these tools are not passed the knowledge about architecture
> > > > then case comes where we enter into header include loop for
> > > > bits/wordsize.h, since this template does explicitly include
> > > > bits/wordsize.h
> > > >
> > > > To fix this emits the pragma once at beginning of file, this is better
> > > > solution than include guards, and pragma once is practically supported
> > > > on all compilers except few e.g. cray c/c++ compiler
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > Something about this is breaking a local recipe (for tlsdate fwiw, but
> > > I don't think that's relevant):
> > >
> > > | checking openssl/ssl.h usability... no
> > > | checking openssl/ssl.h presence... yes
> > > | configure: WARNING: openssl/ssl.h: present but cannot be compiled
> > > | configure: WARNING: openssl/ssl.h:     check for missing prerequisite headers?
> > > | configure: WARNING: openssl/ssl.h: see the Autoconf documentation
> > > | configure: WARNING: openssl/ssl.h:     section "Present But Cannot
> > > Be Compiled"
> > > | configure: WARNING: openssl/ssl.h: proceeding with the compiler's result
> > > | configure: WARNING:     ## ------------------------------------- ##
> > > | configure: WARNING:     ## Report this to jacob at appelbaum.net ##
> > > | configure: WARNING:     ## ------------------------------------- ##
> > > | checking for openssl/ssl.h... no
> > > | configure: error: OpenSSL is not installed, openssl/sslh is missing
> > >
> > > Somehow it's not getting the definition for THIRTY_TWO_BIT from
> > > openssl/opensslconf.h (from openssl10) when testing for openssl/ssl.h
> > > so BN_ULONG ends up undefined... still digging as to what's going on.
> > >
> >
> > thanks, is it using openssl10 ?
> >
>
> It is... I'm sure that's relevant, but I'm failing to spot it.
>

so where all do you have opensslconf.h in target sysroot ?

> --
> Alex Kiernan

