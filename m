Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Sqlii-0002NZ-6A
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 15:52:16 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:55675 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SqlXn-0003gy-Ch for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 09:40:59 -0400
Date: Mon, 16 Jul 2012 09:40:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CADkTA4NC4EtDMPdSdZG98z0yXo4JVwvbMXx4688w1grgx28sQw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207160940200.30068@oneiric>
References: <alpine.DEB.2.02.1207160844430.29289@oneiric>
	<CADkTA4NC4EtDMPdSdZG98z0yXo4JVwvbMXx4688w1grgx28sQw@mail.gmail.com>
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
Subject: Re: apparently superfluous 'do_kernel_checkout[dirs] = "${S}"'
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
X-List-Received-Date: Mon, 16 Jul 2012 13:52:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 16 Jul 2012, Bruce Ashfield wrote:

> On Mon, Jul 16, 2012 at 8:49 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   yes, more pedantry ... just to make sure i'm (again) not missing
> > anything subtle, but it seems that this line in kernel-yocto.bbclass:
> >
> >   do_kernel_checkout[dirs] = "${S}"
> >
> > is unnecessary since kernel_checkout() explicitly removes and
> > recreates that directory anyway.  no, i'm not going to submit a patch
> > for that :-), just want to know that i'm understanding this correctly.
> >
> >   i guess the same could be said for the line below that:
> >
> >   do_kernel_configme[dirs] = "${S} ${B}"
> >
> > since that step happens after the kernel checkout and one would think
> > that at least ${S} must exist at that point or something's gone
> > horribly wrong.
>
> These are required. git is your friend on these ones, they are all
> related to making sure that the right directories always exist for
> sstate, and other task ordering problems. Richard and Saul added
> most of them to fix various corner cases .. so it's not a matter of
> unnecessary, it's a matter of safety, and they do no harm .. so I
> won't touch them with a 10 foot pole :)

  ok, i'll start using "git log" as a matter of course from now on.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


