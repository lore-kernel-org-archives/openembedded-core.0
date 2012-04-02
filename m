Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SEgBn-0002o0-T4
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 14:16:52 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SEg2z-0005Jd-7e for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 08:07:45 -0400
Date: Mon, 2 Apr 2012 08:07:30 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1333368035.647.28.camel@ted>
Message-ID: <alpine.DEB.2.02.1204020805360.10711@oneiric>
References: <alpine.DEB.2.02.1204020736460.9309@oneiric>
	<1333368035.647.28.camel@ted>
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
Subject: Re: so what's the deal with "..._append +="?
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
X-List-Received-Date: Mon, 02 Apr 2012 12:16:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 2 Apr 2012, Richard Purdie wrote:

> On Mon, 2012-04-02 at 07:37 -0400, Robert P. J. Day wrote:
> > pretty sure i mentioned this once before but this just looks weird:
> >
> > $ grep -r "_append +=" *
> > meta/recipes-support/gmp/gmp_5.0.4.bb:SRC_URI_append += "file://use-includedir.patch \
> > meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-dev_append += "${bindir}/rpcgen ${libdir}/*_nonshared.a \
> > meta/recipes-core/eglibc/eglibc-package.inc:FILES_${PN}-staticdev_append += "${libdir}/*.a ${base_libdir}/*.a"
> > meta/recipes-graphics/xorg-lib/libxp_1.0.1.bb:CFLAGS_append += " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
> > $
> >
> >   should those be just simple assignments?
>
> The += does add in a whitespace character. I agree it would be less
> confusing if they were just plain _append = " xxx" though.

  dang, i'd forgotten about the whitespace.  but still, it's
definitely non-intuitive to use what appears to be a double-append
operation.  anyway, i'll leave that for people higher up the food
chain to decide if they want to do anything about it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


