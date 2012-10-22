Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQFkU-00064p-Dp for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 13:00:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAlMbg004016;
	Mon, 22 Oct 2012 11:47:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02633-05; Mon, 22 Oct 2012 11:47:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9MAlEfW004009
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 22 Oct 2012 11:47:15 +0100
Message-ID: <1350902833.2520.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <Kai.Kang@windriver.com>
Date: Mon, 22 Oct 2012 11:47:13 +0100
In-Reply-To: <50851CC4.6040501@windriver.com>
References: <cover.1350645464.git.kai.kang@windriver.com>
	<44a03f4c870063fd0405695db1de2bfaae976a71.1350645464.git.kai.kang@windriver.com>
	<1350658913.2520.34.camel@ted> <50851CC4.6040501@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] nativesdk-autoconf: add dependencies
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
X-List-Received-Date: Mon, 22 Oct 2012 11:00:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 18:15 +0800, Kang Kai wrote:
> Hi Richard,
> 
> > a) Decide whether the sdk should be using the nativesdk perl or the host
> > system one. I'm fine with deciding we should use the nativesdk perl
> > b) Fix RDEPENDS_${PN} for autoconf so that it lists the right perl
> > modules.
> 
> I have put every single perl module to autoconf's rdepend. I also update 
> the dependencies among perl modules themselves.

Does autoconf need every single perl module? We should only add
dependencies for the perl modules it needs.

> > c) At this pooint we might be able to simply remove RDEPENDS_
> > ${PN}_virtclass-nativesdk and the code should figure things out
> > automagically itself.
> 
> It looks fine when remove the RDEPENDS_ ${PN}_virtclass-nativesdk from 
> autoconf.

Great!

> > d) We should verify the list of modules for automake is correct
> 
> Because automake depends on autoconf, so how about I remove the 
> perl-module-* in automake's rdepends these already in autoconf rdepends?

If there is already a dependency there, this sounds fine.

> > e) We should also see if we can simply remove the RDEPENDS_
> > ${PN}_virtclass-nativesdk line from automake.
> 
> I'll try to remove it.

Cheers,

Richard



