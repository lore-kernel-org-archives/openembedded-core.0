Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Uc0Fq-0006M8-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:25:59 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58891 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1UbzyH-0005Hv-CH; Mon, 13 May 2013 17:07:49 -0400
Date: Mon, 13 May 2013 17:07:45 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1305131704540.13080@oneiric>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTS=bCegKdFntAnaSja5rZ08c-J9aAzbQiuSTJLk6w3Bw@mail.gmail.com>
	<203C5055-E0F5-42E6-A607-DE8F2EE36D5C@gmail.com>
	<CAHUNapT_QZr6OwgbyahtxQ16DuRZSgbQrTYg63k-qark8H-_Rw@mail.gmail.com>
	<CADkTA4PzaR2ERLBArRSPxpX5U=NtXfG4_2NBBymMwmONZQSV6Q@mail.gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Mon, 13 May 2013 21:25:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 13 May 2013, Bruce Ashfield wrote:

> On Mon, May 13, 2013 at 4:51 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > On Mon, 13 May 2013, Bruce Ashfield wrote:
> >
> >> That's all you need, here's my output:
> >>
> >> root@qemumips64:~# uname -a
> >> Linux qemumips64 3.8.11-yocto-standard #1 PREEMPT Mon May 13 15:47:58
> >> EDT 2013 mips64 GNU/Linux
> >>
> >> That's built from scratch on Yocto master. So clearly there's
> >> something strange going on in the failing configs.
> >
> >    i attached a screenshot of the last part of the boot which includes
> > the call trace, if that's of any interest.
>
> That's the same trace the Trevor saw, and that Khem and I have seen (and fixed)
> a few times.
>
> I'm betting everyone is using a different SRCREV for the kernel that
> I am, since I've built and booted this multiple times.
>
> Can you dump your board and meta top commits to the thread ?

  i'm using only the two layers.  here's oe-core:

commit cf5e40598ae9a83f22cabedc7b72000beb62703c
Author: Peter Seebach <peter.seebach@windriver.com>
Date:   Thu May 17 23:45:58 2012 +0000

    sanity.bbclass: Attach the missing value to a format string.

    The tuning changes to sanity.bbclass were almost right, but one of
    the messages had a %s with no % operator.

    Signed-off-by: Peter Seebach <peter.seebach@windriver.com>

and here's openembedded-core-contrib (the top few) on branch
kraj/qemumips64:

commit b0592ab08273e17cb1511384ad189281f88c8b03
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Mar 26 18:01:56 2013 -0700

    machine/qemumips64: Add machine definition

    Signed-off-by: Khem Raj <raj.khem@gmail.com>

commit 74e3eb74194baade027edc3f23985aa72ce055eb
Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Apr 16 19:17:03 2013 -0700

    binutils: Add broadcom XLP support

    Signed-off-by: Khem Raj <raj.khem@gmail.com>

commit e4d9bfb01c5657a7f30597d83829375520d64627
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Wed May 8 08:37:48 2013 -0700

    linux-yocto: add qemumips64 compatibility

    The 3.8 and linux-yocto-dev kernel trees carry qemumips64 support. Adding
    the board to the compatibility directly in the recipes is the first step
    to adding mips64 support to the broader set of packages.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>


am i just not up to date somehow?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


