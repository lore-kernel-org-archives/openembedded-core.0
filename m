Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TdhhH-0000Qb-NX
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:29:04 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:56212 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TdhTV-0002or-L5; Wed, 28 Nov 2012 08:14:49 -0500
Date: Wed, 28 Nov 2012 08:14:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20121128130121.GC3477@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1211280808130.578@oneiric>
References: <alpine.DEB.2.02.1211272315510.29858@oneiric>
	<50B592B2.1060903@linux.intel.com>
	<alpine.DEB.2.02.1211280753190.407@oneiric>
	<20121128130121.GC3477@jama.jama.net>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: what is "packagegroup-core-nfs-server"?
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
X-List-Received-Date: Wed, 28 Nov 2012 13:29:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Nov 2012, Martin Jansa wrote:

> On Wed, Nov 28, 2012 at 07:58:45AM -0500, Robert P. J. Day wrote:
> > On Tue, 27 Nov 2012, Saul Wold wrote:
> >
> > > On 11/27/2012 08:18 PM, Robert P. J. Day wrote:
> > > >
> > > >    poking around core-image.bbclass, and noticed this:
> > > >
> > > > PACKAGE_GROUP_nfs-server = "packagegroup-core-nfs-server"
> > > >
> > > > except i don't see the corresponding packagegroup-core-nfs-server.bb
> > > > recipe file.  there *is* a packagegroup-core-nfs.bb file; how is the
> > > > above processed?
> > > >
> > > It's defined in recipes-core/packagegroups/packagegroup-core-nfs.bb
> > >
> > > The line
> > > PACKAGES = "${PN}-server"
> > > provides the key you are looking for.
> >
> >   a followup, for which i'm quite prepared to embarrass myself --
> > where is the "splash" package group defined?  i can see this in
> > image.bbclass:
> >
> > SPLASH ?= "psplash"
> > PACKAGE_GROUP_splash = "${SPLASH}"
> >
> > and numerous images add that "splash" package group.  but my first
> > impression was that any package would be defined under some
> > "packagegroups/" directory, and would necessarily need to "inherit
> > packagegroup".
> >
> >   so what am i missing?
>
> PACKAGE_GROUP_foo can be provided by any recipe, not only
> packagegroup-*

  ok, that's useful information that doesn't seem to be documented
anywhere (or is it?).

  however, if a regular recipe can be used as the basis for a package
group, would it not still have to contain "inherit packagegroup" to be
defined as a package group?  or can any regular recipe act as its own
package group?  i examined the "psplash" recipe and i saw nothing that
suggested it was available as a package group.

  i realize these are nitpicky questions but it's the sort of thing
someone's guaranteed to ask me at some point, so i want to nail it
down.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


