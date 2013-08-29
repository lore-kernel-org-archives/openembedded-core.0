Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id D4F166BE2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:30:04 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so765699lab.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R9GALCqJbHFiIhUZScmJp1MfV5+LAK1/qODC7U/Q12E=;
	b=ZYtlIUj/frz697DCEYHx/wjU7EXjQ32jMg0Rp1Onitzjx0gJmrpuPkS396u8HhiUdD
	LPmW0h9emISy/vquFUrRJecVWTw1RJ2H9epZu9K7x8KKX5/LMAeZDrUPwHYSEX/s7uyF
	PzDBVictecyZi7qsfo1R1pZzw14kFUQFD/Cq1mxtcOi3ikj65QxLOTE0+Jka71SGd8b8
	FvVP60qzB/9UaxyWoByfpK64L95pnSdX7QIDa6OTbqlVlHCDcmBXmtbbKg0vw5Ybmf2Y
	vHVnMSZfENTOfv0e4jr8DDzjXK/00sbiPmQ70yf3r7ThIjobMCAeObQ8T0Yern0jrD6w
	lemQ==
MIME-Version: 1.0
X-Received: by 10.112.35.225 with SMTP id l1mr3045829lbj.35.1377804604638;
	Thu, 29 Aug 2013 12:30:04 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 12:30:04 -0700 (PDT)
In-Reply-To: <C4CD5C92-8FC2-4A02-B978-3520BD7348CD@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<A259F4C4-2C7F-4835-961E-3F2EEF8F0FD6@gmail.com>
	<CADkTA4M2hEpX25DVY-pGNM1-JrL-8t5M4Mjf72gUPg78DowxkQ@mail.gmail.com>
	<C4CD5C92-8FC2-4A02-B978-3520BD7348CD@gmail.com>
Date: Thu, 29 Aug 2013 15:30:04 -0400
Message-ID: <CADkTA4OaC45dbfJpNwQN9RaeJP14Aeu8EVzaEWsgdtRJdmQEuA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:30:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 3:25 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
> On Aug 29, 2013, at 11:16 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>> linux-yocto-3.10 is pretty much the standard kernel, unless you want to use
>> the extra features I've merged, it is vanilla.
>>
>> You are going overboard with the definitions. What the build really needs, it'll
>> generate on it's own. If you want to make an official/controlled BSP
>> ... only then
>> do you actually need .scc files, etc.
>>
>> If you add compatbility with the linux-yocto recipe, put a defconfig in the
>> SRC_URI and you are done.
>
> Just adding the defconfig in the SRC_URI is not enough. The qemuarm
> launches with the versatilepb machine emulation, not vexpress.

runqemu != the kernel support. That's a different question. I often just
launch things by hand.

>
> For me to get vexpress support, I've had to create a local copy of the
> linux-yocto repo, update the meta-branch and then do the adaptations.
>
> So, it's not just a simple one line fix as simple as adding a defconfig
> for linux-yocto. the runqemu scripts have to be modified, etc.

Right, I'm only talking about the kernel. The extensibility (or lack thereof)
of runqemu is slowly evolving. I think there were bugzilla entries for it, but
I don't have them handy.

>
> I've shared all that I've done, with you, but you've apparently done this
> before, and I've just spend days to find out just that!!

Not really. I'm just saying that I've build and booted the machines under qemu
at one point or the other. I've never done full yocto integrations for
any of them.

Cheers,

Bruce

>
> Thanks for the run around!!
>
> Elvis Dowson



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

