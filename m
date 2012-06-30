Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SkuuQ-000558-MN
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 12:28:10 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:33179 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Skujr-0004Dx-14 for openembedded-core@lists.openembedded.org;
	Sat, 30 Jun 2012 06:17:15 -0400
Date: Sat, 30 Jun 2012 06:17:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1206300614280.14013@oneiric>
References: <alpine.DEB.2.02.1206300602360.13626@oneiric>
	<CA+chaQfxRZkRJz=BM+57d2R_vbGCNtumVZMpjC6KdoF5o5-e+A@mail.gmail.com>
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
Subject: Re: is the PRIORITY variable actually used anywhere?
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
X-List-Received-Date: Sat, 30 Jun 2012 10:28:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 30 Jun 2012, Martin Jansa wrote:

> http://git.openembedded.org/meta-openembedded/commit/?id=040f75eca217c79fed7b881589d9bb36358cffe1
> http://git.openembedded.org/openembedded-core/commit/?id=d122343362669c683acc4af295971a62cbc823fc
>
> so can be dropped from bitbake.conf too AFAIK
>
>
> On Sat, Jun 30, 2012 at 3:02 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   noticed this in bitbake.conf:
> >
> > PRIORITY = "optional"
> >
> > but i've seen no actual usage of that variable anywhere.  is anyone or
> > anything actually making use of it?

  ok, i'll just make a note of that as i'm currently cross-checking
variables and i'll likely run across more that can be cleaned (unless
someone has a burning desire to get rid of it sooner, which i'm
guessing is unlikely :-).

rday

p.s.  there are a couple typoes in bitbake.conf comments, so i'll
bundle them all into a single patch later with anything else i find.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


