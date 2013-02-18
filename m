Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1U7Olh-0004kE-Bo
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 12:20:30 +0100
Received: from atl4mhob07.myregisteredsite.com
	(atl4mhob07.myregisteredsite.com [209.17.115.45])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1IB4F0p030071 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 06:04:15 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob07.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1IB4Dso030140 for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 06:04:13 -0500
Received: (qmail 3773 invoked by uid 0); 18 Feb 2013 11:04:13 -0000
Received: from unknown (HELO ?192.168.80.45?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 18 Feb 2013 11:04:13 -0000
Message-ID: <51220AAC.8080201@topic.nl>
Date: Mon, 18 Feb 2013 12:04:12 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <51079663.60504@topic.nl>
	<20130129094059.GI16904@jama.palm1.palmone.com>
	<5107A295.2060307@topic.nl>
	<CAJTo0LYJ8aza9P0V2X_UszE2yWJjGGacWUstPYeoxF0KcwDYxg@mail.gmail.com>
	<510B73EB.8060907@topic.nl>
	<CAJTo0LbkOMXqZkHd-JAcNKxiOmXTy+TXPEEJ-CkPc1Jx3Ujekg@mail.gmail.com>
	<510BBC3D.1030207@topic.nl> <5116A5DA.90500@topic.nl>
	<CA+chaQfz1S1H4240eArHGYEc8Dh=ghzyLYVm1Eu8JyBWbgWMvA@mail.gmail.com>
	<A551BDF323A45B48ACE6A404AA16A1C4127A434C@TOP-EX01.TOPIC.LOCAL>
	<20130210195919.GA3300@jama>
In-Reply-To: <20130210195919.GA3300@jama>
Subject: OE-core] How do I find out why are packages being rebuilt?
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
X-List-Received-Date: Mon, 18 Feb 2013 11:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm still having trouble with packages being needlessly rebuilt over and 
over. The worst of all it qt4-embedded, it takes about an hour to build. 
This is wasting a LOT of time.

The classic OE never rebuilt a package until its version changed.

How and why the current oe-core decides to rebuild package is a complete 
mystery to me, and the outdated documentation on the oe wiki isn't any 
help in that respect either.

Can anyone explain how I can gain some insight into the "trigger" that 
causes a certain package to be rebuilt?


