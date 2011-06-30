Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcIhp-0000BF-RB for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 16:59:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UEtIAW019866
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:55:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19419-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:55:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UEtEZw019857
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 15:55:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309439074.2551.135.camel@phil-desktop>
References: <1309275023-2626-1-git-send-email-koen@dominion.thruhere.net>
	<1309277475.20015.320.camel@rex>
	<AE12D97B-A9AF-4516-93D2-7A5655B46844@dominion.thruhere.net>
	<1309354589.2551.40.camel@phil-desktop>
	<1309355375.20015.383.camel@rex>
	<1309432642.2551.131.camel@phil-desktop>
	<BF22A833-DD0C-41FB-B9AF-CB871B8A1E7A@dominion.thruhere.net>
	<1309439074.2551.135.camel@phil-desktop>
Date: Thu, 30 Jun 2011 15:54:55 +0100
Message-ID: <1309445695.20015.445.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc-locale: fix localedef packaging
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
X-List-Received-Date: Thu, 30 Jun 2011 14:59:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 14:04 +0100, Phil Blundell wrote:
> On Thu, 2011-06-30 at 13:24 +0200, Koen Kooi wrote:
> > Does it whitelist recipes that inherit task.bbclass? I have tasks used for beagleboard workshops that drag in the native toolchain and headers for the things we need to build against (e.g. opencv, qt).
> 
> No.  The existing logic for -dbg packages, which I just reused for this
> case, does:
> 
>     if not "-dbg" in pkg and not "task-" in pkg and not "-image" in pkg:
> 
> but it doesn't have a check for inheritance as such.  If you can suggest
> a good way to identify recipes that have inherited task then I'd be
> happy to adjust the patch accordingly.

Would bb.data.inherits_class('task', d) help?

Cheers,

Richard



