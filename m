Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SCpQW-0002fA-Gn
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 11:44:24 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1SCpHn-0006Gt-VP for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 05:35:24 -0400
Date: Wed, 28 Mar 2012 05:35:15 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <C26382903E56411CA8FD5CF05308DA30@gmail.com>
Message-ID: <alpine.DEB.2.02.1203280532530.22292@oneiric>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<1704770.YM0OKmOcSp@helios> <20120328024204.GE17470@denix.org>
	<C26382903E56411CA8FD5CF05308DA30@gmail.com>
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
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 09:44:24 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 27 Mar 2012, Christopher Larson wrote:

> I IMAGE_INSTALL_append or IMAGE_INSTALL_append_pn-core-image-minimal
> or whatever when I need to quickly add a package temporarily,
> myself.

  once i add this package and build a new image to verify it was
added, i want to revert and rebuild the original QEMU image again.  so
after removing that line from local.conf, what's the bitbake clean
incantation to remove all traces of sysfsutils from my build
directory, so that i can rebuild the image with a simple

  $ bitbake core-image-minimal

thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


