Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TggHF-0007pb-1t
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:34:29 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:45286 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tgg3F-0007zq-3Q; Thu, 06 Dec 2012 13:20:01 -0500
Date: Thu, 6 Dec 2012 13:19:57 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <50C0E055.4070105@windriver.com>
Message-ID: <alpine.DEB.2.02.1212061316510.16942@oneiric>
References: <alpine.DEB.2.02.1212061253340.15222@oneiric>
	<50C0E055.4070105@windriver.com>
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
Subject: Re: slightly confused about .bbappend file and FILESPATH
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
X-List-Received-Date: Thu, 06 Dec 2012 18:34:29 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 6 Dec 2012, Mark Hatle wrote:

> On 12/6/12 12:03 PM, Robert P. J. Day wrote:
> >
> >    currently writing a tutorial page on how .bbappend files and
> > FILESPATH work, and i wanted to use a live example, but now i'm
> > confused.
>
> The way it works is the same way as PATH in the shell.  It's just a set of
> search paths.
>
> >    using meta-ti layer, i chose to build core-image-minimal for a
> > beagleboard, for which the meta-ti layer has the following under
> > recipes-core/netbase/ that i want to use as an example:
> >
> > $ find
> > .
> > ./netbase_5.0.bbappend
> > ./netbase-5.0
> > ./netbase-5.0/beagleboard
> > ./netbase-5.0/beagleboard/interfaces
> > $
> >
> > where the .bbappend file contains only:
> >
> > THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
>
> I believe this is the default value of 'THISDIR' already, so there is no
> reason to specify it in the .bbappend itself.
>
> > FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
>
> In this example, it's incorrect.  As you have a directory named
> "netbase-5.0", so your FILESPATH should be: ${THISDIR}/${PN}-${PV}

  ok, so that's just a bug in the setting of FILESPATH in that one
example?  whew.  i was seriously wondering how badly i misunderstood
how this feature worked.

  as soon as my beagle core-image-minimal finishes building, i should
be able to trivially check that the interfaces file used to populate
the rootfs image is the one from oe-core and not the one that should
have come from meta-ti.

  thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


