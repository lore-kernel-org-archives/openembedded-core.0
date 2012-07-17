Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SrCNC-0004qD-Gs
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:19:50 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56832 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SrCCG-0005KF-Cc for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 14:08:32 -0400
Date: Tue, 17 Jul 2012 14:08:25 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5005A56E.2090300@windriver.com>
Message-ID: <alpine.DEB.2.02.1207171402460.7400@oneiric>
References: <alpine.DEB.2.02.1207171053310.6162@oneiric>
	<50059D18.2050100@windriver.com>
	<alpine.DEB.2.02.1207171340560.7173@oneiric>
	<5005A56E.2090300@windriver.com>
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
Subject: Re: is there really a "fakeroot" task flag?
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
X-List-Received-Date: Tue, 17 Jul 2012 18:19:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 17 Jul 2012, Mark Hatle wrote:

> On 7/17/12 12:41 PM, Robert P. J. Day wrote:
> > On Tue, 17 Jul 2012, Mark Hatle wrote:
> >
> > > On 7/17/12 9:55 AM, Robert P. J. Day wrote:
> > > >
> > > >     perusing bitbake user manual and in section 2.1.18, "Task
> > > > Flags", there's mention of "fakeroot".  that's not really a
> > > > task flag, is it? i thought that that's (now?) a keyword
> > > > that's used to define a task with that property.
> > > >
> > > >     is that line in the user manual incorrect?
> > >
> > > My understanding is this is a key word that gets turned into a
> > > task flag.
> >
> >    ok, that makes sense.  that's just not clear from that section
> > in the bitbake manual.  are there any other special cases like
> > that?
>
> I believe that both "fakeroot" and "python" are the two only two
> inline "task flags".

  i'm reading bitbake's "build.py", and that looks right.  only one
other observation -- i see another what looks like a task flag,
"lockfiles", that's not mentioned in the bitbake user manual.  is that
actually a task flag?  should it be mentioned in that section?

  i think that's all of my whining about task flags.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


