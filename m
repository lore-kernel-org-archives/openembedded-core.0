Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T2xYb-0004fi-Da
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 06:56:13 +0200
Received: by qatn12 with SMTP id n12so2957040qat.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2012 21:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Jva3KZd7gxzz6dsK1CosUdJARVGjZqskadS08ixexy8=;
	b=jIFhcf6MjQeQLkfYcqcDy0SZtm5BZOsJ5nbAHlfccP9rqyQ+Ce+k0n1A6G4xMHXn2U
	8LyV0DK/29M+QPJI33YTLU9bFmdDNUMGCBT51Nll+/7k3fpTABOy7mwf9NGOc0DeSL0w
	ftx8PsOIpQlcHIsegmmcMvgdqrV4FNaatqgKwlmuREPbs74C9x29TnuvhLbBw002W/3T
	85NHj3n+gDuI488MqfOcjudwuzzwaWoPy6GXoaQtewAe1GkNeYnn5myh5WLkMoKUJs1b
	WscpQN9N+//Iu/FQ4zfDEWHdX7s9iGgyZPgdFfhrFc99ySvlSIVEuJnKJRJPPmtc7U+J
	gzLQ==
MIME-Version: 1.0
Received: by 10.229.137.140 with SMTP id w12mr8709140qct.8.1345351452211; Sat,
	18 Aug 2012 21:44:12 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Sat, 18 Aug 2012 21:44:12 -0700 (PDT)
In-Reply-To: <1345328327.27428.79.camel@ted>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
	<1345309072.27428.65.camel@ted>
	<CADkTA4MeEdF-LK0rFshnZgLNwFuHgQOc7F6q7Sbi1ufzzKab+g@mail.gmail.com>
	<1345328327.27428.79.camel@ted>
Date: Sun, 19 Aug 2012 00:44:12 -0400
Message-ID: <CADkTA4MqXHZ25bi83CNxecwtbDpvOGacC=fG8d726gSEFY5gyg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated update
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Aug 2012 04:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 18, 2012 at 6:18 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2012-08-18 at 13:15 -0400, Bruce Ashfield wrote:
>> On Sat, Aug 18, 2012 at 12:57 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Wed, 2012-08-15 at 16:06 -0400, Bruce Ashfield wrote:
>> >> Here's a consolidated update that I've had under test in one
>> >> way or another for 3 weeks now. Tom Z and others have also been
>> >> using parts of this for their work, so it has seen a reasonably
>> >> wide set of testers.
>> >>
>> >> This series further streamlines working with linux-yocto* based
>> >> recipes/repositories by breaking the last branch based triggers
>> >> in the tooling. Branches were the most important piece of
>> >> information when working with the tools and a linux-yocto repository,
>> >> but this has now been generalized, and BSP descriptions (among
>> >> other things) are now found by MACHINE and kernel type only.
>> >>
>> >> With this, KBRANCH now becomes what it was supposed to be, an
>> >> human readible indication of the branch that is supposed to be
>> >> built, and one that the kern-tools will validate. If that branch
>> >> is not validated, an error is thrown. If the default branch is
>> >> left as-is, then the in-tree description leaves you on the
>> >> proper branch and all is well.
>> >>
>> >> I also have a collection of bug fixes to the tools, including
>> >> support for having a meta branch not called 'meta'.
>> >>
>> >> I'd recommend that this go through some AB tests, and I'll be
>> >> around if there's a corner case that I managed to miss.
>> >
>> > I think
>> >
>> > http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/199/steps/shell_34/logs/stdio
>>
>> Judging by the timestamps on your two email, is this not addressed by
>> the workaround
>> for git's behaviour ?
>
> Correct, it fails with the fix applied so I think its something
> different.

poky-tiny and linux-yocto-tiny .. argh .. they are a bit out of date, and out
of site. Darren and I will have to drag them forward, since they are rotting
a bit.

Anyway, I got to trade 4 or 5 hours against the time that the fetcher stole
from you today. :(

I fixed the poky-tiny build here, and the patch is simple enough in the end:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=zedd/kernel-tiny

    linux-yocto-tiny: set default branch

    To streamline the creation of build time branches (branches that are
    not always present in the upstream kernel repository), linux-yocto-tiny
    should specify a default kernel branch. By setting the default branch
    (KBRANCH_DEFAULT) and also setting the build branch (KBRANCH) to that
    default, the tools will allow the board description to be processed
    and no branching forced.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
>>  On the surface, it looks to be the same thing,
>> since a branch that
>> should exist in the repository isn't there.
>>
>> I'll fire of a poky-tiny build for qemu here, to see if I can
>> reproduce this one.
>
> We also have an atom-pc failure which may or may not be related:
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/648/steps/shell_50/logs/stdio

Not related to the other fix, but I have a fix for the atom-pc build
against 3.0 here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=zedd/kernel-3.0-fix

commit 569438febfdd6bffceb919e1050b020c7fcb8f89
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Sun Aug 19 00:28:41 2012 -0400

    linux-yocto/3.0: update meta SRCREV

    Bumping the meta SRCREV to pickup this fix:

        meta: rename virto.scc to virtio.scc

        The virtio configuration block is misnamed. BSPs that include it with
        the proper name, now throw an error (as they should). So fixing the
        name of the fragment fixes the build.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

The tools did their job and flagged an invalid include in that BSP.
Before, those
options were tossed in the bin, now we error.

I've fixed the BSP configuration, and checked the other kernels, it builds here
now.

It's late, so I tossed these fixes out like this, if you want me to resend them
again tomorrow, I can, but I won't be around until the end of the day.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


