Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuRjq-0008Vs-Di for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:16:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGBQCW030031
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:11:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28745-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:11:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGBEPo030025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:11:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110819144040.GB22251@jama.jama.net>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<883d56eb74a8f3b1913e7334c9ea70f2f1e562e9.1313700595.git.sgw@linux.intel.com>
	<1313764041.13995.101.camel@rex>
	<1313764419.6733.296.camel@phil-desktop>
	<20110819144040.GB22251@jama.jama.net>
Date: Fri, 19 Aug 2011 09:08:04 -0700
Message-ID: <1313770084.13995.111.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 12/32] libxkbcommon: new
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
X-List-Received-Date: Fri, 19 Aug 2011 16:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 16:40 +0200, Martin Jansa wrote:
> On Fri, Aug 19, 2011 at 03:33:38PM +0100, Phil Blundell wrote:
> > On Fri, 2011-08-19 at 09:27 -0500, Richard Purdie wrote:
> > > What isthe version getting set to for this recipe?
> > 
> > Just "git" at the moment, which I suppose is a bit suboptimal.  What's
> > the recommended string for packages that don't have any upstream
> > release?
> 
> http://cgit.freedesktop.org/xorg/lib/libxkbcommon/tree/configure.ac
> says:
> AC_INIT([libxkbcommon], [0.1.0], [https://bugs.freedesktop.org/enter_bug.cgi?product=xorg])
> 
> In such cases I'm using
> PV = "0.1.0+gitr${SRCPV}"
> 
> even when there isn't any 0.1.0 tarball yet
> 
> problem is when content of such repo is realease as 0.1.0 tarball
> later..

I'd just go for "0.0.0+gitr${SRCPV}" which would only then break is
upstream releases a 0.0.0.1 which is hopefully unlikely :)

Cheers,

Richard





