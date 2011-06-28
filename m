Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbZ6r-0007YK-C9 for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 16:17:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SE11m1024996
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:01:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24908-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:00:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SE0tDU024990
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:00:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <15DA3F00-905F-4370-85D5-5038CD5D9ED2@dominion.thruhere.net>
References: <cover.1309163663.git.dongxiao.xu@intel.com>
	<cdd1860f64f84b58d18d1c6bed1805456d8d3e2e.1309163663.git.dongxiao.xu@intel.com>
	<1309165102.21613.234.camel@phil-desktop>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D6ADBBD3@shsmsx501.ccr.corp.intel.com>
	<1309252054.21613.329.camel@phil-desktop>
	<1309259242.20015.237.camel@rex>
	<15DA3F00-905F-4370-85D5-5038CD5D9ED2@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 15:00:41 +0100
Message-ID: <1309269641.20015.296.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Tue, 28 Jun 2011 14:17:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 14:17 +0200, Koen Kooi wrote:
> Op 28 jun 2011, om 13:07 heeft Richard Purdie het volgende geschreven:
> > On Tue, 2011-06-28 at 10:07 +0100, Phil Blundell wrote:

> > 
> > Dongxiao: What Phil is referring to here is that libsotruss${PKGSUFFIX}
> > disappeared from PACKAGES and that also "${libdir}/audit/.debug"
> > disappeared from FILES_${PN}-dbg.
> > 
> > Specifically these changes came in as part of:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=77c2dd944db42e40cc8467e6bc5a175fed90c251
> > 
> > which I don't think your patch accounted for.
> > 
> > Since this patch has been around for a while and it otherwise looks
> > good, I've fixed up these couple of issues and merged it though.
> 
> This breaks when using eglibc 2.12 :(

Sorry, I've pushed some cleanup to resolve that.

Cheers,

Richard



