Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SwkeH-0001UU-9h
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 03:56:25 +0200
Received: from rrcs-24-227-210-218.sw.biz.rr.com ([24.227.210.218]:34948
	helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SwkT1-0005DO-NT; Wed, 01 Aug 2012 21:44:47 -0400
Date: Wed, 1 Aug 2012 20:44:45 -0500 (CDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CABcZANmZ=A+BJSTvnhHHaChzn=4t9yXKJmHhO4xistaOga5Gdw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1208012044400.32439@oneiric>
References: <alpine.DEB.2.02.1208011831540.5168@oneiric>
	<CAEsOVNfHoY3gbwJoVCUfS61LeN_idZpNMtU3aOmZLVs7=BDQmA@mail.gmail.com>
	<alpine.DEB.2.02.1208011855500.26345@oneiric>
	<CABcZANkSy37E3DFWH6n53sbG-7nPzOzBBfPp2JOqRzhyPS=erQ@mail.gmail.com>
	<alpine.DEB.2.02.1208012004070.4406@oneiric>
	<CABcZANmZ=A+BJSTvnhHHaChzn=4t9yXKJmHhO4xistaOga5Gdw@mail.gmail.com>
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
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: using an external (arm) toolchain - just checking i did this properly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 01:56:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 1 Aug 2012, Chris Larson wrote:

> On Wed, Aug 1, 2012 at 6:06 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > On Wed, 1 Aug 2012, Chris Larson wrote:
> >
> >> On Wed, Aug 1, 2012 at 4:57 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >> > | + cp -a ERROR: ld.so: object ''\''libpseudo.so'\''' from LD_PRELOAD
> >> > cannot be preloaded: ignored.
> >> > /home/rpjday/CodeSourcery/Sourcery_G++_Lite/bin/../arm-none-linux-gnueabi/libc/lib/.
> >> > /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib
> >> > | cp: target
> >> > `/home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/image/lib'
> >> > is not a directory
> >> > | ERROR: Function failed: do_install (see
> >> > /home/rpjday/y/builds/oe/qemuarm_csl/tmp-eglibc/work/armv5te-oe-linux-gnueabi/external-sourcery-toolchain-2009q1-203-r7/temp/log.do_install.26331
> >> > for further information)
> >> > NOTE: package external-sourcery-toolchain-2009q1-203-r7: task
> >> > do_install: Failed
> >> > ERROR: Task 270
> >> > (/home/rpjday/y/src/oe-core/meta/recipes-core/meta/external-sourcery-toolchain.bb,
> >> > do_install) failed with exit code '1'
> >> > NOTE: Tasks Summary: Attempted 83 tasks of which 78 didn't need to be
> >> > rerun and 1 failed.
> >> > ERROR: An uncaught exception occured in runqueue, please see the
> >> > failure below:
> >> >
> >> >   but i'm *guessing* it's because i don't have the 32-bit libs
> >> > installed on my 64-bit ubuntu system.  i'll worry about that after
> >> > food.
> >>
> >> Could be, also make sure you have NO32LIBS set to 0. The toolchain
> >> binaries are 32 bit, so need a 32 bit libpsuedo.
> >
> >   that would appear to be the issue.  however, since i already built
> > all the native tools, do i have to start from scratch and rebuild it
> > after changing the value of NO32LIBS?  since it would seem that the
> > current build of pseudo won't do me any good.  does that make any
> > sense?
>
> Yeah, I'd just run 'bitbake pseudo-native'.

  ok, that seems to have dealt with the issue and the build is zipping
right along, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


