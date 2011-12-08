Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYRmg-00071r-PS for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 01:24:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB80HX65021382
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:17:33 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20748-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2011 00:17:28 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB80HQRX021376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 00:17:27 GMT
Message-ID: <1323303457.971.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Dec 2011 00:17:37 +0000
In-Reply-To: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 08 Dec 2011 00:24:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 12:23 +0100, Koen Kooi wrote:
> During the past month there have been a number of updates to OE-core
> recipes that triggered parsing errors due to bbappend in other layers.
> A small seleciton:
> 
> * netbase
> * libdrm
> * xserver-xorg
> * clutter
> 
> My view is that layer maintainers need to keep an eye on potential
> breakage and have updates ready when patches land into OE-core.
> Looking back I can see that while the situation is improving a bit,
> it's still not working. The problem with slow updates to layers is
> that (with my angstrom hat on) users (and with my TI hat on) customers
> and coworkers can't do builds without rm'ing the bbappends or
> disabling the layer.


I've been thinking about this. I wondered if the notion of wildcards
for .bbappend might help, e.g. a file called:

netbase_%.bbappend

would match all versions of the netbase recipe.

The % is consistent with PREFERRED_VERSION, I'm a little reluctant to
use * since its a shell quoting mess.

It wouldn't be hard to allow bitbake to support this and would solve
some of the issues we've been having...

Cheers,

Richard





