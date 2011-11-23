Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTEmM-0005Lc-BE for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 16:30:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANFNw1r013592
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 15:23:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12455-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 15:23:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pANFNnhj013586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 15:23:50 GMT
Message-ID: <1322061836.15626.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2011 15:23:56 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OE-Core, autobuilder testing and sstate issues
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
X-List-Received-Date: Wed, 23 Nov 2011 15:30:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I just wanted to give people who might be unaware a heads up on what I'm
trying to get done at the moment and why patches are moving a bit
slowly.

There have been a spate of rather ugly failures on the yocto autobuilder
and these are badly impacting our ability to feel happy about the state
of OE-Core. I've therefore been focusing a lot of effort on tracking
down how and where these issues are coming from and getting them fixed.

The first round of these were problems with useradd.bbclass which then
uncovered a raft of issues in the package managers (both opkg and rpm)
which took a while to resolve.

It then appears some are genuine sstate issues which only appear in the
large autobuilder setup but are much harder to reproduce locally. In the
past its been easy to just ignore them or wipe out sstate and hope the
problems go away. This time I've not allowed sstate to be removed from
the autobuilder until we get to the bottom of the issues.

I want us to get back to a position where patches are flowing as quickly
as possible. I also want these issues resolved, once and for all. In the
interests of expediency I've merged some patches fairly quickly,
particularly a couple related to gconf.

The autobuilder is getting greener all the time and I think we're just
about there with the issues that were showing up having been resolved
but the next couple of builds will confirm this.

So sorry for the delays in patches but I do strongly believe these fixes
will be extremely beneficial in the future and will improve our
regression spotting since we can iterate over and test changes faster.

Cheers,

Richard




