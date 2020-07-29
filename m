Received: from forward3-smtp.messagingengine.com (forward3-smtp.messagingengine.com [66.111.4.237])
 by mx.groups.io with SMTP id smtpd.web10.6381.1596030395977739547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 06:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=HoX91t0s;
 spf=neutral (domain: iki.fi, ip: 66.111.4.237, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id BB6EF194119D;
	Wed, 29 Jul 2020 09:46:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 29 Jul 2020 09:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=+Azl5ybkaU86x5U0X/OnOcS6V1nhgpZ2Sr9+FCWDi
	Z8=; b=HoX91t0swOWMZ8k/1+AnVeCXjm0+lXVPzSbULMUr29hFEDXL7dX7ENkgd
	PHAEGr9gFDY7qhWq15/YRHbzWEPcv4b82p648AkUBy7f20rnLpGBQlBhiKkz3adk
	IRHXXH6W7GAQXErXdiqOncb4tIUb9mS9Pm+GkYfVHLrqW1iKWJMIqtWk7eZItvmW
	fNI0zkQS1YLhVA4a7LLN0zFykNiLtGH+TUYE+7cJHMva85eNox+0nJZ8/F+a4RHz
	rn1QgE2Xt7l36gIJE9LZiTkHgb+AEBZb7yQ0k71jrqFholPPOcXs/SpeKVTFQhWg
	WPzfz+ecZTWkU5PF4Hu+u8qV3d5uw==
X-ME-Sender: <xms:un0hX1mY1XCoxkbGawjGd565PBdb1c_wZmmZ5fFCCAYAZXPA3hUY7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrieeggdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
    mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpe
    fgleekhfejvedtvdeltdekleevhfefjeetgeekfffffeduuefgleffieeugeevfeenucff
    ohhmrghinhepphgrthhrvghonhdrtghomhdplhhisggvrhgrphgrhidrtghomhenucfkph
    epudeliedrvdeggedrudeluddrudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:un0hXw3w09lOE90yb_W65qwJ9l20LeViXUDQKfa2xHYlL7u1Zq7ooA>
    <xmx:un0hX7o7RbKajGNNS09_3P_ngT0uimdeBxu7PIJXVnm_IR59RThBhQ>
    <xmx:un0hX1n2frv4AAlZky-vPvoJm729BTKYwLGcZvgR8PY9FHKZ1Geq6A>
    <xmx:un0hX4g3D-uMlOCUzmKzxOiVaseSnmWRCknLOvSrBvBNc_BaN_lnsA>
Received: from laptop (unknown [196.244.191.18])
	by mail.messagingengine.com (Postfix) with ESMTPA id 489A5328005D;
	Wed, 29 Jul 2020 09:46:33 -0400 (EDT)
Message-ID: <cc769449fccdd6867890b6347d89ced00844b566.camel@iki.fi>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2020 16:46:29 +0300
In-Reply-To: <CAJ86T=Wt=dB+WauhLgzUOgOc56dpq41TORuyvnhGXOS46z3pZw@mail.gmail.com>
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
	 <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
	 <1625397D9F68474B.26462@lists.openembedded.org>
	 <65325f6d63b5927ea8f0f7a167119d0ca8dcfd34.camel@iki.fi>
	 <CAMKF1srEGQnkaZutfPaH5QS_vK8Yx0NeWvWo_10rOQpD7s8=0A@mail.gmail.com>
	 <CAJ86T=Wt=dB+WauhLgzUOgOc56dpq41TORuyvnhGXOS46z3pZw@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 13:45 -0700, Andre McCurdy wrote:
> On Sun, Jul 26, 2020 at 7:01 AM Khem Raj <raj.khem@gmail.com> wrote:
> > On Sun, Jul 26, 2020 at 12:59 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > On Sun, 2020-07-26 at 09:27 +0300, Tanu Kaskinen wrote:
> > > > On Mon, 2020-07-20 at 15:26 -0700, Khem Raj wrote:
> > > > > On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > > Hi!
> > > > > > 
> > > > > > If a recipe provides NEON optimizations, should those be explicitly
> > > > > > disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> > > > > > able to detect NEON availability at runtime?
> > > > > > 
> > > > > > I'm currently converting the pulseaudio recipe from Autotools to Meson,
> > > > > > and the old Autotools build system supports disabling NEON
> > > > > > optimizations but the Meson build system doesn't. So I'm wondering if I
> > > > > > should add the missing feature to the Meson build system, or just let
> > > > > > the runtime detection do its work.
> > > > > > 
> > > > > > Is there ever need for disabling NEON optimizations if the CPU
> > > > > > indicates NEON support? I guess it could be useful for testing the "no
> > > > > > NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> > > > > > doesn't remove NEON support from the qemuarm machine), but otherwise it
> > > > > > seems unnecessary, unless there are CPUs that advertise NEON support
> > > > > > but don't actually support it.
> > > > > > 
> > > > > 
> > > > > I think the issue will result in a compiler error perhaps when neon is
> > > > > disabled via
> > > > > compiler command line which would be the case when neon is not in TUNE_FEATURES
> > > > > the compiler might warn or error out when it finds neon instructions
> > > > > being compiled via inline
> > > > > assembly.  you just can try passing something like -mfpu=vfpv3d16 or
> > > > > some such and see if
> > > > > compiler/assembler complains during build, if not then perhaps its fine.
> > > > 
> > > > If the last -mfpu is something else than neon, then including
> > > > arm_neon.h will succeed but compiling neon code will fail.
> > > > 
> > > > I did some experiments, and what I found was that when I remove neon
> > > > from TUNE_FEATURES, OE adds -mfpu=vfp to CC, not CFLAGS, so it's very
> > > > early in the compiler command line. PulseAudio adds -mfpu=neon to
> > > > CFLAGS when building neon code, and the last -mfpu wins, so the neon
> > > > code gets built without errors.
> > > > 
> > > > The configure check in PulseAudio only checks that the compiler accepts
> > > > -mfpu=neon and #include <arm_neon.h>, it doesn't try to compile any
> > > > actual neon code. This means that if the user adds -mfpu=vfp (or other
> > > > non-neon) to CFLAGS rather than CC, configure will pass but building
> > > > will fail. Is this something to guard against? A default qemuarm build
> > > > doesn't do this, so I don't know if this ever happens in OE.
> > > > 
> > > > I don't know yet how Meson behaves, I'll continue testing...
> > > 
> > > I tested Meson now. Meson too enables Neon even if -mfpu=vfp is in CC.
> > > Unlike Autotools, Meson doesn't fail if -mfpu=vfp is added to CFLAGS (I
> > > tried CFLAGS_append = " -mfpu=vfp" in the pulseaudio recipe). Neon is
> > > enabled in any case.
> > > 
> > > So, Meson seems pretty safe, although I guess it would be nice not to
> > > override the user's -mfpu setting. I think this isn't a big problem is
> > > practice, since runtime detection works.
> > > 
> > > I haven't tested with a compiler that truly can't build Neon code,
> > > because I don't know how to do that.
> 
> Presumably set a -mcpu=XXX to something which can never support NEON?

No success so far...

I tried CFLAGS_append = " -mcpu=cortex-a9+nosimd" in the pulseaudio
recipe, but Neon got still enabled. GCC warned that -march=armv7ve
conflicted with the chosen -mcpu (which makes sense, since "ve" in
"armv7ve" means "virtualization extensinons", and Cortex-A9 doesn't
have virtualization support, and all cores that have virtualization
support have mandatory Neon support).

Then I tried adding -march=armv7a to the pulseaudio CFLAGS, but then
the build failed, because Meson failed some C++ linker check ("Unable
to determine dynamic linker").

Then I tried to remove armv7ve and add cortexa9 to TUNE_FEATURES, but
GCC didn't like that at all, nothing built any more.

I'm still in the process of trying different combinations. Maybe it
would be better to try to use someting older than Cortex-A9, since A9
has optional Neon support. If you're familiar with tweaking the target
CPU with qemuarm, suggestions are welcome. (If I sound like I know
something about Arm CPUs, that's only because I've looked up things
from Wikipedia today.)

> > Right. Cpu implementations without neon do exist
> >  But they are perhaps rare enough and may not use the package too so chances are slim that we encounter this issue
> 
> So what's the conclusion? That CPU's without NEON are so rare that OE
> doesn't need to care about them?

That seems overkill. PulseAudio detects Neon support at runtime, so
even if Neon is enabled at build time, the binaries should work also on
hardware without Neon. I think Khem misunderstood some details. I'm
currently just trying to figure out how to test that the Neon check in
Meson works also in the cases where the compiler can't build Neon code
- so far in my tests Meson has always enabled Neon and the compiler has
always built it without errors.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

