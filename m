Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THM3d-0002LT-2K for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 23:55:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RLgqRx004238
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 22:42:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02690-08 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 22:42:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8RLgiQn004232
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 22:42:45 +0100
Message-ID: <1348782166.15753.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 22:42:46 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: OE-Core Release Status
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
X-List-Received-Date: Thu, 27 Sep 2012 21:55:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We're now at -rc2 for the October release of OE-Core. I've noticed a
sudden surge of patches on the list, several of which are things like
version increments which are no longer really appropriate at this point
in the release cycle.

Why haven't we branched?

The plus side of branching now would be continued patches into master.
The downside is that QA and autobuilder resources are concentrating on
release and hence not on ensuring regressions are being added. I also
really need my energy focused on the release rather than reviewing other
code. I'm out of bandwidth so I'm putting off branching.

There is also the risk that if we branch, people will continue with
master development and ignore the release branch and I'd like to apply a
little pressure against this.

So if patches are getting ignored its likely they've been deemed not
suited to the state of the tree right now. I may start to queue things
on master-next but no guarantees and I would ask people to try and help
make the release a good one.

If there are patches being ignored you think do qualify for -rcX, please
ping me as it is hard to keep track of everything.

Cheers,

Richard











