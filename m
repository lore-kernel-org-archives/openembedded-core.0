Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SofSK-0006Nc-U1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 20:46:41 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54097 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SofHX-00029X-6e; Tue, 10 Jul 2012 14:35:31 -0400
Date: Tue, 10 Jul 2012 14:35:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1341935849.1294.2.camel@ted>
Message-ID: <alpine.DEB.2.02.1207101433580.3587@oneiric>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
	<1341935849.1294.2.camel@ted>
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
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 18:46:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 10 Jul 2012, Richard Purdie wrote:

> On Tue, 2012-07-10 at 15:00 +0000, McClintock Matthew-B29882 wrote:
> > On Tue, Jul 10, 2012 at 8:32 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > Originally, git was something new, not installed everywhere and had commandline
> > > stability problems. This has changed and git it no longer makes sense to
> > > continually build this when the system installed version is likely sufficient.
> > >
> > > This speeds up build since recipes no longer have to wait for git-native to build
> > > if they're fetched from a git:// SRC_URI.
> > >
> > > Also add git to the sanity checks and drop the no unneeded svn reference.
> >
> > What about testing the host system for presence of certain things?
> > Then one could
> >
> > 1) yum/apt/etc install the needed items
> >
> > or
> >
> > 2) Build it if it's not present
>
> Every time we put an if statement in like this, it basically means we
> should double the amount of QA, one for one path and one for the other.
>
> So whilst I've wondered about it, do we really need to do something like
> this?

  my opinion, which is mine, is to add a script someone can run that
tells them what appears to be safe to override from their current
distro.  that way, it's entirely optional and the developer deals with
the output at their own risk.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


