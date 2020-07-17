Received: from forward5-smtp.messagingengine.com (forward5-smtp.messagingengine.com [66.111.4.239])
 by mx.groups.io with SMTP id smtpd.web12.8279.1594980582230130021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 03:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ZoYP8lGr;
 spf=neutral (domain: iki.fi, ip: 66.111.4.239, mailfrom: tanuk@iki.fi)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailforward.nyi.internal (Postfix) with ESMTP id 7E13A1940E8E;
	Fri, 17 Jul 2020 06:09:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 17 Jul 2020 06:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=4oWZUAt2c/uINYtb7GUMyBiwsA4dveo/Qp3KvtKln
	hQ=; b=ZoYP8lGrGsDpS6sRk3AH9UgNx9JCesEVbD8pnAXduge0NwFsnWx/tOfcH
	vzcH6VlopA9yNg2I4zDSlgUaLDjPBA5Rz/3OehpSxb7h8ZT4XrWo6WOZckwJhXmf
	1SDtNrvtMapHO7wNOP0SiMGeCvBw01spt8vY4jOTb/Wb/OlR91j2Nd1v9ufkFUcg
	14XZchxR+Q1VHOM+Kb2H6QJRJiK/vqEcYjDmBSMgFhHed+gxVJO1/cJnpaP4d0Af
	mmTy6PPvfU+1mROgO2ox0ycb7KdYordB5jv9lzG9hsNUdRQcmAkLif3ISBcI/lLh
	vHB2tCem6MNj0h5CqyiMvyS51+3Og==
X-ME-Sender: <xms:5HgRXztXgsBZlPoxkAg8o4F2hE3VIiDmDvtrB-2kl_QKD01B6NK29g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrfeeigddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghnuhcu
    mfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucggtffrrghtthgvrhhnpe
    ffkeevteegfedvhfdugeelfeekgefhtdfhvdffhffhvdfgveduleeileeitdelkeenucff
    ohhmrghinhepghhithhhuhgsrdgtohhmpdhmuhhslhdqlhhisggtrdhorhhgpdhprghtrh
    gvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeekvddruddtvddrvddt
    rddujeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:5HgRX0dCOO6kJTYqvsmF_mqKz299RrDnx-f83iMeJAUbLkCNN3sRvQ>
    <xmx:5HgRX2xaVJyXkT9tLHq3Oils7Sp1pl-GbM4wogeGDflXCyP_TZzfcg>
    <xmx:5HgRXyP0mqGXb4j_dEWfqRp_y9C8Sg--hRoeyAGTDGg68d_FKlBAig>
    <xmx:5XgRXwHZ8dirTItBMnn-hMhe9124NJe1zuExwiP9CK8rX9GS-VStlg>
Received: from laptop (unknown [82.102.20.179])
	by mail.messagingengine.com (Postfix) with ESMTPA id E62F2328005A;
	Fri, 17 Jul 2020 06:09:39 -0400 (EDT)
Message-ID: <eb355d2835cfd5f5525216b8544a5384dcb9ad6c.camel@iki.fi>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
From: "Tanu Kaskinen" <tanuk@iki.fi>
To: Andre McCurdy <armccurdy@gmail.com>, Adrian Bunk <bunk@stusta.de>
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2020 13:09:36 +0300
In-Reply-To: <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
	 <20200326191628.GC5401@localhost>
	 <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
	 <20200326202650.GA14127@localhost>
	 <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-26 at 14:23 -0700, Andre McCurdy wrote:
> On Thu, Mar 26, 2020 at 1:26 PM Adrian Bunk <bunk@stusta.de> wrote:
> > On Thu, Mar 26, 2020 at 12:53:08PM -0700, Andre McCurdy wrote:
> > > On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> > > > > ...
> > > > > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > > > > since the Thumb frame pointer in r7
> > > > > ...
> > > > 
> > > > How are you reproducing the problem in pulseaudio?
> > > > 
> > > > This sounds like a workaround for a bug in musl that was fixed 2 years ago.
> > > 
> > > The problem can show up anywhere that inline asm is trying to use r7.
> > > In this case it looks like:
> > > 
> > >   https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50
> > > ...
> > 
> > After looking at the pulseaudio code I suspected the patch description
> > claiming pulseaudio syscall code would be the problem was rubbish, and
> > that this NEON code was the problem.
> 
> Yes, the comment looks like it was copied and pasted and doesn't
> really apply in this case (since pulseaudio isn't making syscalls).
> That should be updated.
> 
> > But when I tried to reproduce the problem it built for me with both
> > glibc and musl in master (the patch didn't mention that this was a
> > musl-only problem).
> > 
> > Then I saw that this was fixed in musl upstream 2 years ago:
> > https://git.musl-libc.org/cgit/musl/commit/?id=e3c682ab5257aaa6739ef242a9676d897370e78e
> 
> Right, it's not related to musl or glibc. I suspect it can be
> reproduced by building for an ARM target which supports NEON, ensuring
> that DEFAULTTUNE doesn't forcefully disable Thumb (e.g. it should be
> armv7vethf-neon, not armv7vehf-neon), setting ARM_INSTRUCTION_SET to
> thumb and then compiling with frame pointers enabled (e.g. by adding
> -fno-omit-frame-pointer to CFLAGS).
> 
> In terms of a fix, then changing the code to use r12 instead of r7 is
> probably the best solution (assuming it works), but would need careful
> testing. Appending -fomit-frame-pointer to CFLAGS for ARM machines
> building for Thumb is safe and should fix the issue too. Presumably
> limiting the -fomit-frame-pointer workaround to ARM machines which
> support NEON building for Thumb would be an even more targeted
> solution.

I finally found time to test fixing the assembly code to use r12
instead of r7. Seems to work fine (I was first baffled by incorrect
behaviour, because I changed "{r4-r7}" to "{r4-r12}" without realizing
that "r4-r12" meant a range of all registers from r4 to r12).

Can you enlighten me: why did you choose r12 instead of r8? Why did the
original author use registers r4-r7 instead of r0-r3? Is it somehow
advisable to avoid registers r0-r3 and r8-r11? The code seems to work
fine with any set of registers, except r7.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

