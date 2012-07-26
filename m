Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SuLw2-0005qZ-Nx
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 13:08:50 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:34463 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SuLkv-0004i5-N2 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 06:57:21 -0400
Date: Thu, 26 Jul 2012 06:57:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1343288238.29991.21.camel@ted>
Message-ID: <alpine.DEB.2.02.1207260439001.15208@oneiric>
References: <alpine.DEB.2.02.1207251558160.15120@oneiric>
	<1343251261.29991.4.camel@ted>
	<alpine.DEB.2.02.1207252009070.14124@oneiric>
	<1343288238.29991.21.camel@ted>
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
Subject: Re: how to properly use "EXTRA_ASSUME_PROVIDED"?
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
X-List-Received-Date: Thu, 26 Jul 2012 11:08:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 26 Jul 2012, Richard Purdie wrote:

... snip ...

> So its not a variable, its a parameter. You probably mean to run
> something like:
>
> bitbake -I rday-native -e core-image-minimal
> or
> bitbake --ignore-deps=rday-native -e core-image-minimal

  ok, that was embarrassing :-(, but my original question still
applies -- is there any way to see this additional ignored dependency
in the environment of my bitbake command?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


