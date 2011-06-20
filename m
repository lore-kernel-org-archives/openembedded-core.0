Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QYd1J-0000fQ-VQ for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 13:52:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5KBmLfC024069
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 12:48:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23634-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 12:48:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5KBmDoO024062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 12:48:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E52858E1-3BB1-497E-83D1-1411B4DD9373@dominion.thruhere.net>
References: <E52858E1-3BB1-497E-83D1-1411B4DD9373@dominion.thruhere.net>
Date: Mon, 20 Jun 2011 12:48:00 +0100
Message-ID: <1308570480.10352.0.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: 'elfutils' needed to build kernel (perf), but not listed in DEPENDS
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
X-List-Received-Date: Mon, 20 Jun 2011 11:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-20 at 13:09 +0200, Koen Kooi wrote:
> Hi,
> 
> I finally tracked down the heisenbug that was causing kernel builds to fail: kernel*bbclass has no DEPENDS on elfutils, but it still tries to build perf.
> 
> While grepping I also stumbled accross this gem:
> 
> image-swab.bbclass:PARALLEL_MAKE_pn-elfutils = ""
> 
> Parallel make fails only when using swabber?

Correct, we're still trying to work out why this only happens with
swabber and whether its a real PARALLEL_MAKE issue or some kind of bad
interaction with make :(

Cheers,

Richard



