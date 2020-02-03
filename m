Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9618660234
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 07:33:52 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p3so14950031edx.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Feb 2020 23:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VxYA53/Q9ab0fY7/jvwPkFM1LLTb0iibM1Ymbk51hqo=;
	b=JyMg4CpNp67LGysRHFP5p8nCfPknPgcu5C7AzW+yqy+fNMP8+Rwp5ybIZ+T097eHC6
	S9TD+BE2Vo887TFzHa8sd3Ow0NDnoaInNCpvE4i3ZqabLqS02NYwEFolluUJ8LF5z+aP
	gjTzVZCr45dT2susJGaRV1QpytUESYaeTsk2uNyh1o1hC4P+0Wiyo9HsGtlTfjZBZMTY
	NEUZ30267ir6dNysXRlAdeiaEH2F0qwEdDboBwjKHM2LSzlc8oaUVEa64fbopMvSEKiQ
	86zkTy84PV4zgT/UTkyz+PyaHw/1+AX8TmJGAJe+IOs7nqoDQjP5qbuqqfLtlDl8S0W6
	PMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VxYA53/Q9ab0fY7/jvwPkFM1LLTb0iibM1Ymbk51hqo=;
	b=mP2oyPMU9U9/0rCHfiLRDEfXrO+bKMPR9sKaDbk6I6JgMJ7rEnmcsKrbH501R2mgQf
	SlDNgPtkYrmeZuDdZe++2KdAmHwR5pIHoUthjyuTSSJ2Q9JhAB0635XkdBVjkoM18wRm
	oIiTCpySEyNJWTeOzgPOSUKWMzhkWvdMfZGxfnWu0Amy3WrQFRJRmUrIp0ukgn58yMkM
	aW+jnPCgGAVY9ukmSQBhFK2bbQoNPM+X7QC1KKsn7c2EhMs3o4gAo/sc4ScjlYc8dxgy
	rYsLD1j7+EbzXNjTagDCMW6NQFTz2E7MEI/2ypX57zzr9Ed+cQ6Ly9/yWBJqQ2pSGmOm
	B5jA==
X-Gm-Message-State: APjAAAUGBUiWBS1N41V7T073eR4X5SG2NpC+yQziLeREdc3mUNEeMzw6
	yx/RI4txqVLaZpiH9pn484BUekTBp9GJd5VHQV8=
X-Google-Smtp-Source: APXvYqyXfrhDRzFjMoj2XAJ4S6K1C9Cxim5JYCj/g80qmWYjWfd2i9k2k4bUegSNDq5FbgCoTKGYVyxlvpfHUtcgy9U=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr20147825ejj.6.1580715233412;
	Sun, 02 Feb 2020 23:33:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
	<CADkTA4PZm6X0duFUx0prC4-kz=RUjsmO5vK_6Ox6w5GSGhJ0wQ@mail.gmail.com>
	<4789b1f1-8dc1-dead-1a19-d18f17c0d709@gmail.com>
	<CADkTA4MYP_vkdjSb9-g=FdrELLGfrap2vOZjuYUdBcVoS5Uznw@mail.gmail.com>
In-Reply-To: <CADkTA4MYP_vkdjSb9-g=FdrELLGfrap2vOZjuYUdBcVoS5Uznw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Feb 2020 02:33:42 -0500
Message-ID: <CADkTA4MK3Jx4Z8uigb0Nuzw=E28yVH2k04StXspNBsiXHj+k3w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Mon, 03 Feb 2020 07:33:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 1, 2020 at 5:47 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Jan 31, 2020 at 1:25 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 1/29/20 4:48 AM, Bruce Ashfield wrote:
> > > On Wed, Jan 29, 2020 at 2:31 AM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > >>
> > >> Can these issues be bisected? That's how the two kernel regressions (both found last year via ptests) were tracked down to specific commits.
> > >>
> > >
> > > mips64 was already bisected, and reported upstream, not much help
> > > there .. I've already reached out to some more hardcore mips folks for
> > > more help, so hopefully that works :D
> > >
> > can you point to link where this thread is
>
> It was on the mips-kernel mailing list, but thanks to our friends at
> Cisco, I have a patch in hand for this issue now. They'll follow up to
> the original thread on the kernel mailing list with the detailed
> findings (also watch for it on the linux-yocto mailing list).
>
> >
> > > The musl one didn't bisect in my attempt(s), but in that config it is
> > > an easy issue to trigger. I'm out of time to debug it for the next two
> > > weeks, hence why I'm broadcasting to see if others want to take a
> > > look.
> > >
> >
> > As I saw, I do not see this with latest master-next
>
> ok, cool. I'll queue the mips fix and re-test. Hopefully it has been
> sorted out through the latest version bumps.

I'm unfortunately still seeing this on my AB run against master next.

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1520/steps/8/logs/step1c

Which does imply that the kernel bump is triggering it (since
master-next had 5.4, but it wasn't the default, my series makes it the
default).  I won't have any time to look at this until late next week,
since I'm still traveling.

Bruce

>
> Bruce
>
> >
> > > Bruce
> > >
> > >> Alex
> > >>
> > >> On Tue, 28 Jan 2020 at 23:14, <bruce.ashfield@gmail.com> wrote:
> > >>>
> > >>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >>>
> > >>> Hi all,
> > >>>
> > >>> I just wanted to send these to the list, so everyone could see the
> > >>> reference kernel that we are planning for the upcoming release.
> > >>>
> > >>> I have other patches to drop 4.19, 5.2 and make this the default
> > >>> kernel for the various reference platforms as well, but I'm not
> > >>> sending them, since we still have two outstanding issues:
> > >>>
> > >>> 1) mips64 init is segfaulting after / during some self tests.
> > >>>
> > >>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
> > >>>
> > >>> 2) x86 musl is getting a gpf on many commands:
> > >>>
> > >>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
> > >>>
> > >>> I've looked into both, and don't have any great ideas on how to debug
> > >>> or fix them.
> > >>>
> > >>> So if anyone has ideas, or wants to poke at these, feel free to follow up.
> > >>> But as of now, we still can't merge the v5.4 kernel as the reference due
> > >>> to these remaining problems.
> > >>>
> > >>> Bruce
> > >>>
> > >>>
> > >>> The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
> > >>>
> > >>>    bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
> > >>>
> > >>> are available in the Git repository at:
> > >>>
> > >>>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
> > >>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
> > >>>
> > >>> Bruce Ashfield (3):
> > >>>    linux-yocto: introduce 5.4 recipes
> > >>>    kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
> > >>>    kernel-devsrc: update to v5.4+
> > >>>
> > >>>   .../kern-tools/kern-tools-native_git.bb       |  2 +-
> > >>>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
> > >>>   .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
> > >>>   .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
> > >>>   meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
> > >>>   5 files changed, 136 insertions(+), 4 deletions(-)
> > >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > >>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > >>>
> > >>> --
> > >>> 2.19.1
> > >>>
> > >>> --
> > >>> _______________________________________________
> > >>> Openembedded-core mailing list
> > >>> Openembedded-core@lists.openembedded.org
> > >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
> > >
> > >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

