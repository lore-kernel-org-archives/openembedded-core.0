Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoMw8-0006mQ-2a
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 01:00:12 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:48198 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoMlL-0008R9-9u; Mon, 09 Jul 2012 18:49:03 -0400
Date: Mon, 9 Jul 2012 18:48:50 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <2863878.hMO01FTXta@helios>
Message-ID: <alpine.DEB.2.02.1207091847540.24998@oneiric>
References: <alpine.DEB.2.02.1207081227430.27741@oneiric>
	<CAK18fxFD1X6tPLsXG-vwRFu-EeEZDTdeKoTKRYAvYrKJfd-_mQ@mail.gmail.com>
	<alpine.DEB.2.02.1207091630380.24097@oneiric>
	<2863878.hMO01FTXta@helios>
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
Subject: Re: more pedantry -- looking to clarify layers definition, BBPATH, BBFILES, etc.
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
X-List-Received-Date: Mon, 09 Jul 2012 23:00:12 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 9 Jul 2012, Paul Eggleton wrote:

> The BBPATH variable is completely independent of this, and is the
> path that is used to find conf and bbclass files; however, the order
> in which the appends / prepends will be applied is of course the
> order in which they are parsed, which is the order in which they
> appear in bblayers.conf. Most layers should be appending to BBPATH
> rather than prepending but there may be exceptions.

  and that was my basic issue -- that some layers append while others
prepend might cause unexpected behaviour, but i've made my point so
i'll shut up now.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


