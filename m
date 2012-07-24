Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1StbXw-000468-Kn
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:36:52 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:33662 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1StbMr-0004N1-1a; Tue, 24 Jul 2012 05:25:25 -0400
Date: Tue, 24 Jul 2012 05:25:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <1610928.T7hSJDQ7P6@helios>
Message-ID: <alpine.DEB.2.02.1207240523480.19067@oneiric>
References: <alpine.DEB.2.02.1207240455440.18822@oneiric>
	<1610928.T7hSJDQ7P6@helios>
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
Subject: Re: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:36:52 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 24 Jul 2012, Paul Eggleton wrote:

> On Tuesday 24 July 2012 05:04:25 Robert P. J. Day wrote:
... snip ...
> > with both the yocto and oe-core layer having priority 5.  is there no
> > chance of confusion here?
>
> As I mentioned before, the priority currently has no bearing on the
> order of BBPATH - that is determined by the order in which the layer
> conf files are parsed and (as you highlight) whether they prepend or
> append to BBPATH. Remember that the BBPATH only affects how class
> and conf files are found - it does not have anything to do with
> recipes.

  oh, gack, i'd forgotten that, sorry.  it's early.  need coffee.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


