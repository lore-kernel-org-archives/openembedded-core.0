Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 403A760ACB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 22:47:22 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id cy15so11975311edb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 14:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qTIM8aaDoBbXmYzb1qjr9Fj8p8jmxzddUbu+4BsDyi8=;
	b=RVBeHbGQs9kcLpZ1g/O4CdpyNKWNrI++TCUY+mfqsSTCI5YUmuY13TmzmcWZ4AIAOs
	4w4zBfE2VoRBkxIcZwJCSdkrl6IbE6DaWhZubQbZ0nOrsdJiqyF2uQoADThzFIc5NZ78
	CAvOhqi3nA+bOp9iLH/2mdbGPhbYHQ91jUNWi3583pR3BWnxSERs9cdoW7qRWIRHyc+G
	wfCUVmseN2hAQPJeCcGHbI3YDDubrrj5Ujm5i52FH0/ItcElS8q7DtfIXGeH8R2gbM0y
	6QUKRbS9Epe2IvzS1Z/RXlMNziRJogmYNJwFnlPN9VO48/VMdP7fmaRjlSU1JdywaL5c
	opuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qTIM8aaDoBbXmYzb1qjr9Fj8p8jmxzddUbu+4BsDyi8=;
	b=Q84midCz5aP08ZFfPYyVyS3P39dEjw0M650F56O4Qrh7SYsYHmM9WuDBvPfgo8QrzO
	PjzgKGN2VIg2481+vuKNaNW7qSf2s8HPBdKUSDd3iOera5/anbfRl6HFayBsDMEJXEjr
	dcC+wK0Su3smescZkZEQ1nmrC+kPwvEEmuuSjDh/f3P3Msm/76i4n2rTPY5azz3xokob
	tqjLuZqiQgbw60jxZ+wRrNHLU37+IqNIz6ki28RHHxNABYy9vIzeXP7kRTfl2yVF08/S
	bGX93GI8hhJ4YR4gZKWrpLUUFim3hUUFYhA6i+hOTol2ncbVuc6mvCha78cnl2tEZ2W3
	w6Vw==
X-Gm-Message-State: APjAAAUq5JgUqq5UzwqmTQUxMlwogcFCgSfOEE96ClY3V5igVInrUBc5
	bxD1jlDmIp9PBMj9k43YEBwWxyAOiiZz6iHxBklfYW0q
X-Google-Smtp-Source: APXvYqyTIu2yEOb2nh38iE7susm2eYsJ8mdirll9wXYgTt3W4R1kVNmM53SO5KgOvnsF3GKVhibr43ItCeEx068o4sg=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr15217691ejj.6.1580597242541;
	Sat, 01 Feb 2020 14:47:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
	<CADkTA4PZm6X0duFUx0prC4-kz=RUjsmO5vK_6Ox6w5GSGhJ0wQ@mail.gmail.com>
	<4789b1f1-8dc1-dead-1a19-d18f17c0d709@gmail.com>
In-Reply-To: <4789b1f1-8dc1-dead-1a19-d18f17c0d709@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 1 Feb 2020 17:47:11 -0500
Message-ID: <CADkTA4MYP_vkdjSb9-g=FdrELLGfrap2vOZjuYUdBcVoS5Uznw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Sat, 01 Feb 2020 22:47:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 31, 2020 at 1:25 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/29/20 4:48 AM, Bruce Ashfield wrote:
> > On Wed, Jan 29, 2020 at 2:31 AM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> >>
> >> Can these issues be bisected? That's how the two kernel regressions (both found last year via ptests) were tracked down to specific commits.
> >>
> >
> > mips64 was already bisected, and reported upstream, not much help
> > there .. I've already reached out to some more hardcore mips folks for
> > more help, so hopefully that works :D
> >
> can you point to link where this thread is

It was on the mips-kernel mailing list, but thanks to our friends at
Cisco, I have a patch in hand for this issue now. They'll follow up to
the original thread on the kernel mailing list with the detailed
findings (also watch for it on the linux-yocto mailing list).

>
> > The musl one didn't bisect in my attempt(s), but in that config it is
> > an easy issue to trigger. I'm out of time to debug it for the next two
> > weeks, hence why I'm broadcasting to see if others want to take a
> > look.
> >
>
> As I saw, I do not see this with latest master-next

ok, cool. I'll queue the mips fix and re-test. Hopefully it has been
sorted out through the latest version bumps.

Bruce

>
> > Bruce
> >
> >> Alex
> >>
> >> On Tue, 28 Jan 2020 at 23:14, <bruce.ashfield@gmail.com> wrote:
> >>>
> >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>
> >>> Hi all,
> >>>
> >>> I just wanted to send these to the list, so everyone could see the
> >>> reference kernel that we are planning for the upcoming release.
> >>>
> >>> I have other patches to drop 4.19, 5.2 and make this the default
> >>> kernel for the various reference platforms as well, but I'm not
> >>> sending them, since we still have two outstanding issues:
> >>>
> >>> 1) mips64 init is segfaulting after / during some self tests.
> >>>
> >>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
> >>>
> >>> 2) x86 musl is getting a gpf on many commands:
> >>>
> >>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
> >>>
> >>> I've looked into both, and don't have any great ideas on how to debug
> >>> or fix them.
> >>>
> >>> So if anyone has ideas, or wants to poke at these, feel free to follow up.
> >>> But as of now, we still can't merge the v5.4 kernel as the reference due
> >>> to these remaining problems.
> >>>
> >>> Bruce
> >>>
> >>>
> >>> The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
> >>>
> >>>    bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
> >>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> >>>
> >>> Bruce Ashfield (3):
> >>>    linux-yocto: introduce 5.4 recipes
> >>>    kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
> >>>    kernel-devsrc: update to v5.4+
> >>>
> >>>   .../kern-tools/kern-tools-native_git.bb       |  2 +-
> >>>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
> >>>   .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> >>>   .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> >>>   meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
> >>>   5 files changed, 136 insertions(+), 4 deletions(-)
> >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> >>>
> >>> --
> >>> 2.19.1
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

