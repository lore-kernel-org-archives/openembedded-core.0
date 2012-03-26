Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC87x-0001b8-Kn for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:30:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBLNwt024697
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:21:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17410-10 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:21:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBLGvT024690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 12:21:17 +0100
Message-ID: <1332760875.28414.107.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:21:15 +0100
In-Reply-To: <1332759991.14363.1027.camel@phil-desktop>
References: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
	<1332759689.28414.104.camel@ted>
	<1332759991.14363.1027.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
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
X-List-Received-Date: Mon, 26 Mar 2012 11:30:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 12:06 +0100, Phil Blundell wrote:
> On Mon, 2012-03-26 at 12:01 +0100, Richard Purdie wrote:
> > Looking at this file, if the above is true and armv7 can't do anything
> > other than thumb, shouldn't we just delete the non-thumb configurations
> > for "armv7"?
> 
> It's not totally obvious to me that having a "lowest common denominator"
> configuration for ARMv7 is really all that valuable.  In fact I would be
> slightly surprised if anybody is targetting ARMv7-M with OE at all.
> What's the use-case for that?

I have no idea, it appears the file doesn't make a lot of sense...

Cheers,

Richard



