Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1U0tjP-00059T-Lj
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:59:14 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58958 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0tUD-00038Y-VP; Thu, 31 Jan 2013 07:43:26 -0500
Date: Thu, 31 Jan 2013 07:43:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130131123847.GC2102@jama.dyndns-home.com>
Message-ID: <alpine.DEB.2.02.1301310742380.7169@oneiric>
References: <alpine.DEB.2.02.1301310531510.22001@oneiric>
	<20130131131021.6d5ffccd@e6520eb>
	<alpine.DEB.2.02.1301310711320.6796@oneiric>
	<20130131123847.GC2102@jama.dyndns-home.com>
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
Cc: openembedded-core@lists.openembedded.org
Subject: Re: BB_SRCREV_POLICY doesn't seem to work
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
X-List-Received-Date: Thu, 31 Jan 2013 12:59:27 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-721721678-1359636205=:7169"

--8323329-721721678-1359636205=:7169
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Thu, 31 Jan 2013, Martin Jansa wrote:

> On Thu, Jan 31, 2013 at 07:19:20AM -0500, Robert P. J. Day wrote:
> > On Thu, 31 Jan 2013, Eric Bénard wrote:
> >
> > > Hi Robert,
> > >
> > > Le Thu, 31 Jan 2013 05:37:59 -0500 (EST),
> > > "Robert P. J. Day" <rpjday@crashcourse.ca> a écrit :
> > > >   ok, what have i done wrong?  i thought the whole point of
> > > > BB_SRCREV_POLICY was to make the above possible.
> > > >
> > > no idea if that the solution but did you do a cleansstate and removed
> > > the initaly downloaded sources to fetch again the sources ?
> >
> >   i did not ... that's necessary?  that's kind of important to know.
> > let me describe the situation i have to see if BB_SRCREV_POLICY is
> > actually going to do me any good.
> >
> >   here's my global site.conf file:
> >
> > SCONF_VERSION = "1"
> > SOURCE_MIRROR_URL ?= "file:///home/rpjday/oe/dist/tarballs/"
> > INHERIT += "own-mirrors"
> > BB_GENERATE_MIRROR_TARBALLS = "1"
> > # BB_NO_NETWORK = "1"
> >
> > so, as you can see, whenever i end up fetching any new source, it ends
> > up as a tarball and i copy it into my long-lived own-mirrors
> > "tarballs" directory.  obviously saves me buckets of time.
> >
> >   now say i've started a new build and i've done all the fetching
> > without involving BB_SRCREV_POLICY.  i suddenly realize i need to move
> > to somewhere without network access, so i quickly add
> >
> >   BB_SRCREV_POLICY = "1"
>
> BB_SRCREV_POLICY = "cache"
>
> right?

  sorry, yes, that's what i used.  but i'll test again just to make
absolutely sure.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323329-721721678-1359636205=:7169--
