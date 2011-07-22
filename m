Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkHSE-00063D-5c for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:15:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MFBjnr029498
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:11:45 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28913-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:11:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MFBdTQ029492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 16:11:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <29D487E1-5E59-4A53-B518-3692FF11C70C@dominion.thruhere.net>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
	<3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e.1311345613.git.richard.purdie@linuxfoundation.org>
	<29D487E1-5E59-4A53-B518-3692FF11C70C@dominion.thruhere.net>
Date: Fri, 22 Jul 2011 16:11:36 +0100
Message-ID: <1311347496.2344.144.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
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
X-List-Received-Date: Fri, 22 Jul 2011 15:15:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-22 at 16:54 +0200, Koen Kooi wrote:
> Op 22 jul. 2011, om 16:49 heeft Richard Purdie het volgende geschreven:
> 
> > Since we're updating the tune file format, it makes sense to abstract
> > the compiler tune arguments at this point too. This means that should
> > these need to be overridden at any point, the original values can
> > still be obtained in a similar manner to the other TUNE* variables.
> > 
> > Whilst this isn't strictly necessary for any current need, its likely
> > good practise to standardise this behaviour.
> 
> So if I'm reading the patch correctly this doesn't result in a
> behaviour change, it just shuffles the definitions around in
> preparation for Mark's tune overhaul.

Yes.

I'm trying to split the work Mark and I have done into logical chunks we
can review and these are the pieces to setup the externally facing
variables we need.

I've not yet finished the patches which change the tune files themselves
but we have a pretty good idea of what the finished result needs to look
like to get all this working which we have experimented and tested with.

Cheers,

Richard





