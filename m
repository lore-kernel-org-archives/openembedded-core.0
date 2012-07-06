Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SnBvO-0002cm-C0
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 19:02:34 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:43396 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SnBkf-0000rZ-TA for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 12:51:29 -0400
Date: Fri, 6 Jul 2012 12:51:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4FF6F3CF.6030707@linaro.org>
Message-ID: <alpine.DEB.2.02.1207061247290.14397@oneiric>
References: <alpine.DEB.2.02.1207060832110.13212@oneiric>
	<4FF6F3CF.6030707@linaro.org>
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
Subject: Re: ALLOW_EMPTY versus ALLOW_EMPTY_${PN}? a couple clarifications
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
X-List-Received-Date: Fri, 06 Jul 2012 17:02:34 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 6 Jul 2012, Marcin Juszkiewicz wrote:

> W dniu 06.07.2012 15:10, Robert P. J. Day pisze:
> >
> >   just trying to clarify the gory details of the ALLOW_EMPTY setting.
> > first, across several .bb files, there is a mixture of these two:
> >
> > ALLOW_EMPTY = "1"
> > ALLOW_EMPTY_${PN} = "1"
> >
> >   what's the difference?  what does the first one represent if you're
> > not specific?  does that cover *all* generated packages?
>
> Yes, first means "all packages may be empty"

  and just to be clear, that means not just the default packages
(regular, -dev, -doc, etc.) but all additional packages that might be
defined for that recipe?

> >   next, i assume there's no real value to hardcoding the package name,
> > as in:
> >
> > ./meta/recipes-multimedia/alsa/alsa-utils_1.0.25.bb:ALLOW_EMPTY_alsa-utils = "1"
> >
> > (i assume the above could have just used the standard "_${PN}",
> > right?)
>
> ${PN} should be in this case.

  i thought so, just wanted to be sure.  i'm collecting all these
oddities i run across and am compiling my version of an OE "style
guide", which will contain pedantic observations like:

* don't hard-code a package name if you can use ${PN} instead

and

* there's no point setting ${PR} to "r0" since that's the default

  little things like that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


