Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StPxr-0003fM-OT
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 23:14:51 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:57890 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StPmn-00057u-J6; Mon, 23 Jul 2012 17:03:25 -0400
Date: Mon, 23 Jul 2012 17:03:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <3312625.ONM3TZznPV@helios>
Message-ID: <alpine.DEB.2.02.1207231700040.11877@oneiric>
References: <alpine.DEB.2.02.1207231454340.9373@oneiric>
	<3312625.ONM3TZznPV@helios>
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
Subject: Re: OE layer index page entry referring to "meta-oe" seems wrong
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
X-List-Received-Date: Mon, 23 Jul 2012 21:14:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 23 Jul 2012, Paul Eggleton wrote:

> On Monday 23 July 2012 14:57:15 Robert P. J. Day wrote:
> >   i was checking out the OE layer index page:
> >
> > http://www.openembedded.org/wiki/LayerIndex
> >
> > and it seems like the early entry for meta-oe is misleading.  if you
> > check out that git repo, what you get is the meta-openembedded top
> > level directory, of which meta-oe is just one of a number of
> > sub-layers (meta-efl, meta-gnome, ..., meta-oe), similar to the
> > situation with meta-intel.
>
> That's what the "Repo subdir" column is supposed to help with - that
> indicates which subdirectory within the repository the layer is in.
> Git does not really conveniently allow checking out just a
> subdirectory so we have to refer to the top level. That said, I'm
> happy to have suggestions on how we can improve the index in this
> regard.

  ah, got it, i just didn't look closely enough.  just an observation
-- meta-openembedded's meta-multimedia and meta-systemd layers don't
appear to be listed on that page.  is that a deliberate omission?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


