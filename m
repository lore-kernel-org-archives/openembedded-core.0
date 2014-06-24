Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by mail.openembedded.org (Postfix) with ESMTP id CF78061FE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:28:55 +0000 (UTC)
Received: from [99.240.204.5] (port=42821 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1WzXKq-0002Gh-24; Tue, 24 Jun 2014 16:28:56 -0400
Date: Tue, 24 Jun 2014 16:25:02 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Bruce Ashfield <bruce.ashfield@gmail.com>
In-Reply-To: <CADkTA4NgU0oLbh0G0zpuDfpZa6iSSQBStQFrCFH7Z=N7OkcLZw@mail.gmail.com>
Message-ID: <alpine.LFD.2.11.1406241622320.19326@localhost>
References: <alpine.LFD.2.11.1406241348150.12872@localhost>
	<CADkTA4NgU0oLbh0G0zpuDfpZa6iSSQBStQFrCFH7Z=N7OkcLZw@mail.gmail.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: OE build of qemux86 fails for linux-yocto: undefined reference to `.LASF1122'
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
X-List-Received-Date: Tue, 24 Jun 2014 20:29:02 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 24 Jun 2014, Bruce Ashfield wrote:

> On Tue, Jun 24, 2014 at 1:50 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   doing a test build of core-image-minimal for qemux86 using current
> > git pull of openembedded-core, and got:
> >
> > |   LD      init/built-in.o
> > | drivers/built-in.o:(.debug_info+0x106096a): undefined reference to
> > `.LASF1122'
> > |
> > /home/rpjday/oe/builds/oe/qemux86/tmp-eglibc/work/qemux86-oe-linux/linux-yocto/3.14.5+gitAUTOINC+602be954ac_41d5fe27dc-r0/linux/Makefile:827:
> > recipe for target 'vmlinux' failed
> > | make[2]: *** [vmlinux] Error 1
> > | Makefile:133: recipe for target 'sub-make' failed
> > | make[1]: *** [sub-make] Error 2
> > | Makefile:26: recipe for target 'all' failed
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> >
> >   i'm about to try again to make sure it wasn't a transient glitch,
> > but has anyone else seen this?
>
> builds here, and on the autobuilders.

  i just finished doing

  $ bitbake -c clean linux-yocto
  $ bitbake linux-yocto

and, suddenly, all is well. this happens every so often, and i think
it's related to too much parallelism -- i have a hyperthreaded quad
core so up to eight tasks can be running at once and, every so often,
i think i just hit some weird race condition. if i clean and retry, it
almost always works. just thought i'd ask in case it was an actual
glitch while my rebuild was crunching away.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

