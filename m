Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SobO3-0003G0-Tk
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 16:26:00 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:53200 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SobDG-0005oM-QB for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 10:14:50 -0400
Date: Tue, 10 Jul 2012 10:14:31 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1341929395.24837.14.camel@ted>
Message-ID: <alpine.DEB.2.02.1207101013130.2798@oneiric>
References: <1341927124.24837.8.camel@ted>
	<alpine.DEB.2.02.1207101001080.2594@oneiric>
	<1341929395.24837.14.camel@ted>
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
X-List-Received-Date: Tue, 10 Jul 2012 14:26:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 10 Jul 2012, Richard Purdie wrote:

> On Tue, 2012-07-10 at 10:02 -0400, Robert P. J. Day wrote:
> > On Tue, 10 Jul 2012, Richard Purdie wrote:

> > >  # its own in staging
> > >  ASSUME_PROVIDED = "\
> > >      bzip2-native \
> > > +    git-native \
> > >      grep-native \
> > >      diffstat-native \
> > >      patch-native \
> >
> >   possibly a dumb question, but is this the sort of thing one could
> > extend in one's local.conf file if they were fairly sure their
> > installed versions were compatible?
>
> For some things like git-native, it would be safe. For others like
> perl-native or python-native, you could seriously shoot yourself in
> the foot. subversion-native needs to be 1.7+ as an example.
>
> The general idea is correct though, you can extend this from
> local.conf, yes.

  sure, i appreciate that there's always danger, but with a current
distro, one would think that most standard utilities would be new
enough to work just fine.  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


