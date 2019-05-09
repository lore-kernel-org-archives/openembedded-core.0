Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 4A79C7DF5D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 14:11:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 65F0C22165;
	Thu,  9 May 2019 10:11:10 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
	by compute1.internal (MEProxy); Thu, 09 May 2019 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=mime-version:message-id:in-reply-to:references:date:from:to
	:cc:subject:content-type; s=fm1; bh=k+xQtnjutTONubnH7Kul/RsKI+35
	i120153ZVqTOzjU=; b=UVLmnEdB2Shq3ejEtjWk1/T9IDoJAaW0fuLTlHFoTviv
	D0fY0l0+iwpVXXZ5nq4U1ob3cXnbZGsFuYneKxr6HHiCfnsmfZULdDuSE5LKj4Bi
	YbrWiG1TBZr0KzEzo5ewXMzzA0cZrBGZ2INrQe3KAvLatryg8D+Tk6bvb/Huj8As
	lK0gUIkW1sr5itI3bZgjajW1MheSErRL8kb5JdrEZ10z3GdPuQ6OWI8HyaDzI1dF
	ysiuNVk+9UArEB+EKVglfDxlVVv/pus8jm12aig0GrTQCS90yrA8i2883IcM1GU8
	77k4AUvHp1jMim7gG9cDaT+uHUqMAnE4hYVVa83XvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=k+xQtn
	jutTONubnH7Kul/RsKI+35i120153ZVqTOzjU=; b=DPZjgbwEr6vh/h3Vy71jhM
	oDbnxtk3fTK6wu2ylj9rkbiz4n4cOPJjzHiYdMHlm1xqc/iUtyn6MvLVB4cY1K4I
	3sWuRX+9NUo8mpF1geAs6hoFn8qnXXtbY/FWy3KONgKFS7evFFjVmybdgKSt6+VL
	U/YNvhtTdHt3PWoSZOSfgok6Q4rn/fuQXnWt791cZXeer+VbrfXDNLjsaNiP0GDJ
	VbLYZTA0ngX+C4/XsaXkpSBCBs2l2e8oro9pi0whcUvRtF6kEEtm4OqATJM90YbV
	HcrfJSzp4Hk61i5NzSd+8NwYFIq7ANzAjd+tDbUMFfFmnenfvTGkavyTRAZx990Q
	==
X-ME-Sender: <xms:_TTUXLUmWRGj0QdWMof6a5IDfaaOR06SMWbRVNW6XpIOTWStRAhl1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdduudcutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
	uceurghrkhgvrhdfuceophgruhhlsegsvghtrghfihhvvgdrtghordhukheqnecuffhomh
	grihhnpegrlhhpihhnvghlihhnuhigrdhorhhgpdhsphhinhhitghsrdhnvghtpdhgihht
	hhhusgdrtghomhdpshhtrhgrtggvrdhiohenucfrrghrrghmpehmrghilhhfrhhomhepph
	gruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:_TTUXFc6hbh4Gy0GJ492vq2Pa5dvZzhJ6jUIFMGokrrfKbjRjY7UVg>
	<xmx:_TTUXHDP9TZtc4xODdECNe7wwk5qbdnCu7kngHXk2J9el0t_TN85mQ>
	<xmx:_TTUXDGMBvrLGAivDH026XW7wOKbC_FVUdnhF6VjvSzTEkhFS_Gcxw>
	<xmx:_jTUXFL1NBYaldSQfsVkaMNk-hAXhcO37_pQRvQ9LIrSFpiM2meDLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D8F547C3DB; Thu,  9 May 2019 10:11:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <aa05bc44-55d9-4216-a1a1-a7170056588f@www.fastmail.com>
In-Reply-To: <CADkTA4MtXToXhg=XE1pR-V0sy_5rwr0cu=_imsapyKFOJKxP1Q@mail.gmail.com>
References: <20190508115836.15758-1-paul@betafive.co.uk>
	<20190508115836.15758-3-paul@betafive.co.uk>
	<20190508130249.GA25917@localhost>
	<7a1b1694-9c7c-40eb-a998-343879c0283d@www.fastmail.com>
	<ba43a2fb-4c12-4b35-bb40-b58ccf18ad83@www.fastmail.com>
	<74876e92becd2c2b04831dc4776faabd87fc53c9.camel@linuxfoundation.org>
	<CADkTA4O16TV+7Dj11c9MwjRGQWXSAto+L6Y3xbn4hu3U2D1NKA@mail.gmail.com>
	<eca8b6ab-8d60-4a83-b0b2-9803913f4895@www.fastmail.com>
	<CADkTA4MtXToXhg=XE1pR-V0sy_5rwr0cu=_imsapyKFOJKxP1Q@mail.gmail.com>
Date: Thu, 09 May 2019 10:10:57 -0400
From: "Paul Barker" <paul@betafive.co.uk>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] strace: Fix aarch64 build with musl
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
X-List-Received-Date: Thu, 09 May 2019 14:11:09 -0000
Content-Type: text/plain

On Thu, 9 May 2019, at 15:07, Bruce Ashfield wrote:
> 
> 
> On Thu, May 9, 2019 at 10:00 AM Paul Barker <paul@betafive.co.uk> wrote:
> > On Thu, 9 May 2019, at 14:48, Bruce Ashfield wrote:
> >  > 
> >  > 
> >  > On Thu, May 9, 2019 at 9:43 AM Richard Purdie 
> >  > <richard.purdie@linuxfoundation.org> wrote:
> >  > > On Thu, 2019-05-09 at 08:08 -0400, Paul Barker wrote:
> >  > > > On Thu, 9 May 2019, at 11:13, Paul Barker wrote:
> >  > > > > On Wed, 8 May 2019, at 14:02, Adrian Bunk wrote:
> >  > > > > > On Wed, May 08, 2019 at 11:58:36AM +0000, paul@betafive.co.uk
> >  > > > > > wrote:
> >  > > > > > > ...
> >  > > > > > > +--- strace-4.26.orig/strace.c
> >  > > > > > > ++++ strace-4.26/strace.c
> >  > > > > > > +@@ -26,7 +26,7 @@
> >  > > > > > > + #include <locale.h>
> >  > > > > > > + #include <sys/utsname.h>
> >  > > > > > > + #ifdef HAVE_PRCTL
> >  > > > > > > +-# include <sys/prctl.h>
> >  > > > > > > ++# include <linux/prctl.h>
> >  > > > > > > + #endif
> >  > > > > > > + #include <asm/unistd.h>
> >  > > > > > > diff --git a/meta/recipes-devtools/strace/strace_4.26.bb
> >  > > > > > > b/meta/recipes-devtools/strace/strace_4.26.bb
> >  > > > > > > index 24f92c99e5..b71122babf 100644
> >  > > > > > > --- a/meta/recipes-devtools/strace/strace_4.26.bb
> >  > > > > > > +++ b/meta/recipes-devtools/strace/strace_4.26.bb
> >  > > > > > > @@ -15,6 +15,7 @@ SRC_URI = "
> >  > > > > > > https://strace.io/files/${PV}/strace-${PV}.tar.xz <https://strace.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz> <https://strace.io/files/$%7BPV%7D/strace-$%7BPV%7D.tar.xz> \
> >  > > > > > > file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> >  > > > > > > file://0001-tests-sigaction-Check-for-mips-and-
> >  > > > > > > alpha-before-usin.patch \
> >  > > > > > > file://0001-mips-o32-fix-build.patch \
> >  > > > > > > + file://musl-fixes-armv8.patch \
> >  > > > > > > "
> >  > > > > > > ...
> >  > > > > > 
> >  > > > > > #include <sys/prctl.h> is the documented way for getting the
> >  > > > > > prototype 
> >  > > > > > of prctl(), which cannot be in linux/prctl.h for obvious reasons.
> >  > > > > > 
> >  > > > > > This patch creates the following problem:
> >  > > > > > 
> >  > > > > > ../strace-4.26/strace.c: In function 'startup_child':
> >  > > > > > ../strace-4.26/strace.c:1355:3: warning: implicit declaration of 
> >  > > > > > function 'prctl' [-Wimplicit-function-declaration]
> >  > > > > > prctl(PR_SET_PTRACER, PR_SET_PTRACER_ANY);
> >  > > > > > ^~~~~
> >  > > > > > 
> >  > > > > 
> >  > > > > Ah that's definitely not a solution then. I'll have to look into
> >  > > > > this 
> >  > > > > further and see if I can come up with a v2 patch that doesn't
> >  > > > > cause 
> >  > > > > this warning.
> >  > > > > 
> >  > > > 
> >  > > > So alpine fixes this by patching the linux headers: 
> >  > > > https://git.alpinelinux.org/aports/tree/main/linux-headers/fix-aarch64-asm-ptrace.patch
> >  > > > 
> >  > > > I think that should be acceptable here if we just do it when building
> >  > > > with musl libc.
> >  > > > 
> >  > > > Any thoughts on that before I work up a v2 patch?
> >  > > 
> >  > > This really needs to get fixed upstream. I don't mind a patch but only
> >  > > if its gone upstream, we don't want to be carrying patches to libc-
> >  > > headers.
> >  > 
> >  > I can live with that as well, we have carried them just for musl in the 
> >  > past, but yes, we should at least know that someone is trying to 
> >  > upstream it. I can't get the alpine linux git to come in right now, so 
> >  > I can't check the referenced change to see how it looks.
> >  > 
> >  > I'm going to do new libc-headers when I get the -dev kernel up and 
> >  > running with the 5.2-rc kernels, so I can watch to see that it 
> >  > continues to apply. I can also do some extra build testing here, if you 
> >  > want the headers change to come through my next pull request.
> >  > 
> > 
> >  There's a lot of redefinition between musl and the kernel headers that hasn't been reconciled yet (see https://www.spinics.net/lists/y2038/msg03836.html for some discussion) so I think there's much more to be done upstream than just fixing this one instance.
> 
> Agreed. There's a long, bikeshedding, philosophical debate about musl 
> and headers that is always ongoing (not this discussion, that is not my 
> comment). But if this one instance is a small change, I think it is 
> worth carrying, the amount of musl patches to libc-headers has 
> fluctuated over time, so this is no different. We can only deal with 
> the problems we are seeing in our builds (I state the obvious).
> 
> > 
> >  I'm now dropping the `#include <linux/prctl.h>` line in arch/arm64/include/uapi/asm/ptrace.h (https://github.com/torvalds/linux/blob/v5.1/arch/arm64/include/uapi/asm/ptrace.h#L68) in linux-libc-headers and that's giving working builds for me but I'm not sure how universally it can be applied. I'm happy to carry that as a bbappend in our distro layer for now but that will leave strace broke on aarch64 when using musl for others.
> > 
> 
> I'm still ok with patching it out of the headers, build tests would 
> shake any issues out, but I can't see there being too many. 
> 

I'll send a v2 including this then. The patch can go into SRC_URI_append_libc-musl so it has no chance of affecting glibc builds.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

