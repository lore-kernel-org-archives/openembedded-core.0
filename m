Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1T4VzL-0008Sx-HD
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 13:54:15 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:39247 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1T4Vnb-0004RI-WA; Thu, 23 Aug 2012 07:42:08 -0400
Date: Thu, 23 Aug 2012 07:42:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: McClintock Matthew-B29882 <B29882@freescale.com>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A5FD736@039-SN1MPN1-001.039d.mgd.msft.net>
Message-ID: <alpine.DEB.2.02.1208230741030.25709@oneiric>
References: <alpine.DEB.2.02.1208222108300.24283@oneiric>
	<70CC66F5C30A414DADDA6973E4CA391A5FD736@039-SN1MPN1-001.039d.mgd.msft.net>
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
Subject: Re: why does using a "revision" prevent downloading during a parse?
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
X-List-Received-Date: Thu, 23 Aug 2012 11:54:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 23 Aug 2012, McClintock Matthew-B29882 wrote:

> On Wed, Aug 22, 2012 at 8:11 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >   certainly about to embarrass myself again, but from
> > u-boot_2011.06.bb:
> >
> > ...
> > # This revision corresponds to the tag "v2011.06"
> > # We use the revision in order to avoid having to fetch it from the repo during parse
> > SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
> >
> > PV = "v2011.06+git${SRCPV}"
> > ...
> >
> >   i don't know what that means -- how does using that "revision"
> > prevent fetching?  i would simply have defined the SRC_URI using the
> > tag value, so i'm not sure what benefit i'm getting out of the above.
>
> You should look for the patch that made that change and read the
> commit message.

  ah, quite so ... i had to pop into the 2011.03 recipe file to get
that info from "git blame" but i now get it, thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


