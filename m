Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SBNvI-00013t-Io
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 11:10:12 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SBNmf-0002sT-5L for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 06:01:17 -0400
Date: Sat, 24 Mar 2012 06:01:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332582359.9740.489.camel@ted>
Message-ID: <alpine.DEB.2.02.1203240558370.23984@oneiric>
References: <alpine.DEB.2.02.1203240436510.20052@oneiric>
	<1332582359.9740.489.camel@ted>
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
Subject: Re: "${bindir}" versus "${bindir}/*" ??
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
X-List-Received-Date: Sat, 24 Mar 2012 10:10:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 24 Mar 2012, Richard Purdie wrote:

> On Sat, 2012-03-24 at 04:40 -0400, Robert P. J. Day wrote:
> > in bitbake.conf, numerous variables like "FILES_${PN}" are
> > initialized with a combination of directory variables, with two
> > different forms:
> >
> >   * ${bindir}
> >   * ${bindir}/*
> >
> > is there a functional difference between those two?  my wildly
> > speculative guess is that if "*" works as it does in the shell, it
> > would simply skip any hidden objects.  is that the difference?  since
> > i don't see that clarified anywhere.
>
> The former is recursive and the latter is not and will just match files
> in the directory (unhidden ones at that).

  ah, that clears up so much.  i'm actually embarrassed to ask such
obvious questions -- is that written up somewhere that i should have
run across it before asking about it?

rday

p.s.  By "unhidden ones at that," i'm assuming you mean *only*
unhidden ones?  so that its behaviour is entirely consistent with what
people would expect?

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


