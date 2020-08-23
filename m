Received: from forward4-smtp.messagingengine.com (forward4-smtp.messagingengine.com [66.111.4.238])
 by mx.groups.io with SMTP id smtpd.web10.171262.1598172839444205974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 01:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=NaQYNbU5;
 spf=neutral (domain: iki.fi, ip: 66.111.4.238, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id 6CA471940C63;
	Sun, 23 Aug 2020 04:53:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sun, 23 Aug 2020 04:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=7TUwgs6cbYDVOu5kE0lciTbraxOYj3wYu/yNvPCoY
	og=; b=NaQYNbU5cnauypKTr3db7pHBrTAAnbdrFQM+txXPwVubyL2zVB/DIFBWp
	/VujjA8Ujup/pGysy8i49UxTTRuXDdPp2H6V5s1ySKHWUF79ccYYqd16UajZpJBh
	AXCZtwb0WZ1lO3NQHhDTEu4n9ETbK7gmgRboFm7/Wk1z2n0LxRO15l4tXYvVseP9
	FP/Sps3RXhO/bDDEmXXwDvArDIciqSzYajokWulmb2hKnKM3v+Y8KbVbJttktZum
	3Cbd6UENL0UGh/WepUvVCZPV2PhembGrIt9oiKq1gLTwQvdLjYH2w20FvJKc2Eha
	w/V9d7fbnSjB2/kXQOo9vncoQaPIg==
X-ME-Sender: <xms:pS5CXzGc6GcJUKivGVQxdfRSwkR0k1zR7j6mVz6LW8kzJbgO6oK3CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudduiedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
    ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuggftrfgrthhtvghrnh
    epkeffvdeigfduheejveegvefhgedvgfelvdefjeejveehvdegvefgudehvddttdetnecu
    ffhomhgrihhnpeifihhkihhpvgguihgrrdhorhhgpdhprghtrhgvohhnrdgtohhmpdhlih
    gsvghrrghprgihrdgtohhmnecukfhppeekvddruddtvddrvddtrdduiedvnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkih
    drfhhi
X-ME-Proxy: <xmx:pS5CXwWjgP2G312oANhdEp1m8sSO_SjzGHi-pMx89oX4l8-SfsvTBg>
    <xmx:pS5CX1I_OBjw9hmomybHY2dG-NnwRytadmTySsUvxTL6ty4tjT5FxQ>
    <xmx:pS5CXxEOUpnmFe5stvUFMxUfjKU8H_0AoSX6SonXGmPdh6zoA75X7A>
    <xmx:pi5CX4BRUq04AaOVM2sZTizO5RVH5PuUbb72zZKF9aEtPNzZ3tPxYQ>
Received: from laptop (unknown [82.102.20.162])
	by mail.messagingengine.com (Postfix) with ESMTPA id 55977328005E;
	Sun, 23 Aug 2020 04:53:57 -0400 (EDT)
Message-ID: <e4ce863f6d39a999fe75770494166c12e8313904.camel@iki.fi>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 23 Aug 2020 11:53:53 +0300
In-Reply-To: <CAJ86T=WOQkBPFWfN_JO0bLt0O+D=Yg=0z_+_P4B3wx8q+b8Esg@mail.gmail.com>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
	 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
	 <1625397D9F68474B.26462@lists.openembedded.org>
	 <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
	 <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
	 <CAJ86T=Wt=dB+WauhLgzUOgOc56dpq41TORuyvnhGXOS46z3pZw@mail.gmail.com>
	 <cc769449fccdd6867890b6347d89ced00844b566.camel@iki.fi>
	 <CAJ86T=WOQkBPFWfN_JO0bLt0O+D=Yg=0z_+_P4B3wx8q+b8Esg@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-29 at 15:08 -0700, Andre McCurdy wrote:
> On Wed, Jul 29, 2020 at 6:46 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > On Mon, 2020-07-27 at 13:45 -0700, Andre McCurdy wrote:
> > > On Sun, Jul 26, 2020 at 7:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
> > > > > > On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> > > > > > > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > > > Hi!
> > > > > > > > 
> > > > > > > > If a recipe provides NEON optimizations, should those be explicitly
> > > > > > > > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> > > > > > > > able to detect NEON availability at runtime?
> > > > > > > > 
> > > > > > > > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > > > > > > > and the old Autotools build system supports disabling NEON
> > > > > > > > optimizations but the Meson build system doesn't. So I'm wondering if I
> > > > > > > > should add the missing feature to the Meson build system, or just let
> > > > > > > > the runtime detection do its work.
> > > > > > > > 
> > > > > > > > Is there ever need for disabling NEON optimizations if the CPU
> > > > > > > > indicates NEON support? I guess it could be useful for testing the "no
> > > > > > > > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> > > > > > > > doesn't remove NEON support from the qemuarm machine), but otherwise it
> > > > > > > > seems unnecessary, unless there are CPUs that advertise NEON support
> > > > > > > > but don't actually support it.
> > > > > > > > 
> > > > > > > 
> > > > > > > I think the issue will result in a compiler error perhaps when neon is
> > > > > > > disabled via
> > > > > > > compiler command line which would be the case when neon is not in TUNE_FEATURES
> > > > > > > the compiler might warn or error out when it finds neon instructions
> > > > > > > being compiled via inline
> > > > > > > assembly.  you just can try passing something like -mfpu=vfpv3d16 or
> > > > > > > some such and see if
> > > > > > > compiler/assembler complains during build, if not then perhaps its fine.
> > > > > > 
> > > > > > If the last -mfpu is something else than neon, then including
> > > > > > arm_neon.h will succeed but compiling neon code will fail.
> > > > > > 
> > > > > > I did some experiments, and what I found was that when I remove neon
> > > > > > from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
> > > > > > early in the compiler command line. PulseAudio adds -mfpu=neon to
> > > > > > CFLAGS when building neon code, and the last -mfpu wins, so the neon
> > > > > > code gets built without errors.
> > > > > > 
> > > > > > The configure check in PulseAudio only checks that the compiler accepts
> > > > > > -mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
> > > > > > actual neon code. This means that if the user adds -mfpu=vfp (or other
> > > > > > non-neon) to CFLAGS rather than CC, configure will pass but building
> > > > > > will fail. Is this something to guard against? A default qemuarm build
> > > > > > doesn't do this, so I don't know if this ever happens in OE.
> > > > > > 
> > > > > > I don't know yet how Meson behaves, I'll continue testing...
> > > > > 
> > > > > I tested Meson now. Meson too enables Neon even if -mfpu=vfp is in CC.
> > > > > Unlike Autotools, Meson doesn't fail if -mfpu=vfp is added to CFLAGS (I
> > > > > tried CFLAGS_append = " -mfpu=vfp" in the pulseaudio recipe). Neon is
> > > > > enabled in any case.
> > > > > 
> > > > > So, Meson seems pretty safe, although I guess it would be nice not to
> > > > > override the user's -mfpu setting. I think this isn't a big problem is
> > > > > practice, since runtime detection works.
> > > > > 
> > > > > I haven't tested with a compiler that truly can't build Neon code,
> > > > > because I don't know how to do that.
> > > 
> > > Presumably set a -mcpu=XXX to something which can never support NEON?
> > 
> > No success so far...
> > 
> > I tried CFLAGS_append = " -mcpu=cortex-a9+nosimd" in the pulseaudio
> > recipe, but Neon got still enabled. GCC warned that -march=armv7ve
> > conflicted with the chosen -mcpu (which makes sense, since "ve" in
> > "armv7ve" means "virtualization extensinons", and Cortex-A9 doesn't
> > have virtualization support, and all cores that have virtualization
> > support have mandatory Neon support).
> 
> Is that true? If so then the various armv7ve specific tuning files
> (tune-cortexa15.inc, etc) could all be simplified by removing the
> option to disable NEON support.

(Sorry for the delay in replying.)

I don't know if there's any official rule that cores with
virtualization must have Neon support (I would guess not). What I wrote
was only based on looking at this Wikipedia page, where every core with
virtualization also has Neon: 
https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures

Also, the GCC warning about conflicting -mcpu and -march turned out not
to be about armv7ve requiring Neon, I got the same warning also with
-march=armv7a and -mcpu=cortex-a9+nosimd. Maybe -mcpu and -march just
aren't supposed to be used together.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

