Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1Si5pU-0005z2-Qq
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 17:31:25 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:44071 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Si5f4-000471-N5; Fri, 22 Jun 2012 11:20:38 -0400
Date: Fri, 22 Jun 2012 11:20:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <25294393.hmh001VYMW@helios>
Message-ID: <alpine.DEB.2.02.1206221118260.13834@oneiric>
References: <alpine.DEB.2.02.1206210454080.17361@oneiric>
	<25294393.hmh001VYMW@helios>
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
Subject: Re: superfluous download locations in oe-core's bitbake.conf
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
X-List-Received-Date: Fri, 22 Jun 2012 15:31:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 22 Jun 2012, Paul Eggleton wrote:

> On Thursday 21 June 2012 04:56:51 Robert P. J. Day wrote:
> >   given that oe-core is defined as being a really minimal
> > configuration with no extraneous cruft, there seems to be a number of
> > unnecessary download locations in the shipped bitbake.conf, things
> > like:
> >
> > ADOBE_MIRROR =
> > FREEBSD_MIRROR =
> >
> > and so on.  obviously, they're not doing any harm but there seems to
> > be little value in defining download locations that aren't used by
> > anything actually in oe-core.
>
> These are present for largely historical reasons - namely in
> OE-Classic we had a number of recipes needing this same mirror
> defined and it was deemed that it was easier to edit it in one place
> if it needed to change. Some of them are even completely useless now
> as the sites to which they point are now gone, e.g. HANDHELDS_CVS.
>
> I think the way to approach this would be to just submit a patch
> removing the more extraneous ones and see if anyone complains. Note
> that some of them that aren't used in OE-Core might be used within
> meta-oe or other OE community layers, so those might need to stay at
> least for the time being.

  i mentioned this bit of pedantry only because of the regular
incantation of, "does that really belong in oe-core?"  so to be
consistent, if it doesn't belong, it should be removed.

  if something in meta-openembedded or another layer needs a new
download location, it should provide it, one would think.  i don't
think oe-core should provide variables solely on the off chance that
something else might need it some day.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


