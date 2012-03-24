Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SBOL6-0001Qy-8c
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 11:36:52 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SBOCS-0003jf-FP for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 06:27:56 -0400
Date: Sat, 24 Mar 2012 06:27:49 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1332584294.9740.506.camel@ted>
Message-ID: <alpine.DEB.2.02.1203240621540.25240@oneiric>
References: <alpine.DEB.2.02.1203240515560.21886@oneiric>
	<1332584294.9740.506.camel@ted>
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
Subject: Re: should i assume "SERIAL_CONSOLES" is a typo?
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
X-List-Received-Date: Sat, 24 Mar 2012 10:36:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 24 Mar 2012, Richard Purdie wrote:

> On Sat, 2012-03-24 at 05:16 -0400, Robert P. J. Day wrote:
> > meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb:    tmp="${SERIAL_CONSOLES}"
>
> Its not a typo, if you look at the code, it processes SERIAL_CONSOLE and
> SERIAL_CONSOLES.

  ah, i'd noticed that but i didn't see any example of a machine
taking advantage of that.  and there's no mention of that variable in
any of the docs that i can see.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


