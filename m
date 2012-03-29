Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SDBMO-0003bK-Gr
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 11:09:36 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SDBDf-0007lY-0a for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 05:00:35 -0400
Date: Thu, 29 Mar 2012 05:00:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20120329082756.GJ4004@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1203290459210.31549@oneiric>
References: <alpine.DEB.2.02.1203290409580.29356@oneiric>
	<20120329082756.GJ4004@jama.jama.net>
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
Subject: Re: why use both IMAGE_FEATURES and EXTRA_IMAGE_FEATURES in a single .bb file?
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
X-List-Received-Date: Thu, 29 Mar 2012 09:09:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 29 Mar 2012, Martin Jansa wrote:

> On Thu, Mar 29, 2012 at 04:11:57AM -0400, Robert P. J. Day wrote:
> >
> >   given the recent excitement over "+=" and "=+", i thought i'd point
> > out again the occasional weirdness like this snippet from
> > core-image-sato-sdk.bb:
> >
> > IMAGE_FEATURES += "apps-console-core ${SATO_IMAGE_FEATURES} dev-pkgs tools-sdk qt4-pkgs"
> > EXTRA_IMAGE_FEATURES += "tools-debug tools-profile tools-testapps debug-tweaks"
>
> sometimes this is usefull to define "base" in IMAGE_FEATURES and then
> stuff which people tend to override in .bbappend put in EXTRA_IMAGE_FEATURES
>
> Maybe that's not the case here.. but separate variables are good even if
> it looks weird in .bb alone
>
> FOO = "blah"
> BAR = "base ${FOO}"
>
> allows to remove/replace "blah" very easy with .bbappend.

  ok, i can see that.  but that's the sort of thing that should be
explained somewhere in the basic OE documentation so users understand
what it means when they run across it.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


