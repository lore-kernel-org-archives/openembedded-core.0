Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SsvIy-0001MB-Uw
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:30:38 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34011 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Ssv7v-00060Y-LE for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 08:19:11 -0400
Date: Sun, 22 Jul 2012 08:18:57 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1342943447.21788.52.camel@ted>
Message-ID: <alpine.DEB.2.02.1207220817250.17236@oneiric>
References: <alpine.DEB.2.02.1207211747410.15197@oneiric>
	<1342943447.21788.52.camel@ted>
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
Subject: Re: "bitbake -v core-image-minimal" for qemuarm hangs on building qemu
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
X-List-Received-Date: Sun, 22 Jul 2012 12:30:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sun, 22 Jul 2012, Richard Purdie wrote:

> On Sat, 2012-07-21 at 17:56 -0400, Robert P. J. Day wrote:
> > sadly, i must run off for socializing so i can't debug for a few
> > hours but, from scratch, i tried to build a core-image-minimal for
> > qemuarm on my 64-bit, fully-updated ubuntu 12.04 system, and for the
> > second straight time, it's hung at:
> >
> > NOTE: package qemu-native-0.15.1-r9: task do_populate_sysroot: Succeeded
> > NOTE: Running noexec task 1194 of 1561 (ID: 71, virtual:native:/home/rpjday/oe/oe-core/meta/recipes-devtools/qemu/qemu_0.15.1.bb, do_build)
> >
> > (hang)
> >
> >   i've configured for 4 threads and that level of parallel make.  this
> > has always worked before.  i have a fully git-pulled oe-core and
> > bitbake.
> >
> >   "top" shows a couple git processes running, but i've configured
> > local.conf to allow fetching from the network so i'm not sure what
> > it's after, if that's the issue.
> >
> >   i'm sure it's something annoyingly simple.  back in a while.
>
> Have you the full log (see tmp/cooker.log*)? The above says what ran but
> not what is currently running. If you hit ctrl+c, you should see which
> task was hanging. Was it gthumb?

  i tried a "bitbake -c fetchall" and it appeared to hang trying to
git pull gcc, but it worked later.  i'll try again this morning just
to play it safe, but it might have been just one of those aberrations.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


