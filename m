Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USsK9-0007le-W8
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 19:08:50 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:50213 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USs3B-0005UD-1M; Thu, 18 Apr 2013 12:51:09 -0400
Date: Thu, 18 Apr 2013 12:51:05 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <lyfvynyecr.fsf@ensc-virt.intern.sigma-chemnitz.de>
Message-ID: <alpine.DEB.2.02.1304181250070.20260@oneiric>
References: <alpine.DEB.2.02.1304181219550.8010@oneiric>
	<lyfvynyecr.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
Subject: Re: [PATCH] local.conf.sample: Have comments ready to go for quad-core (4 -> 8).
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
X-List-Received-Date: Thu, 18 Apr 2013 17:09:04 -0000
X-List-Received-Date: Thu, 18 Apr 2013 17:09:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 18 Apr 2013, Enrico Scholz wrote:

> "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
> writes:
>
> > Have default, commented values for parallelism reflect quad-core
> > hosts.
>
> fwiw, I use
>
> PARALLEL_MAKE = "\
>   -j ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 2} \
>   -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100} \
> "
>
> BB_NUMBER_THREADS ?= "\
>   ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100}"
>
>
> which adjusts parallelism automatically.

  i'd be perfectly fine with that, too, if someone wants to put that
in instead.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


