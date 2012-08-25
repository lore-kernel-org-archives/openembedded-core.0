Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5JhT-0003nB-C8 for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 18:59:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PGkwQM010580
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 17:46:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08209-05 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 17:46:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PGkpkg010574
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 17:46:52 +0100
Message-ID: <1345913213.14369.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Aug 2012 17:46:53 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Heads up: xxx-nativesdk -> nativesdk-xxx change
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
X-List-Received-Date: Sat, 25 Aug 2012 16:59:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As was previous discussed on the list a while ago, we have a problem
with nativesdk where the code is getting complex and convoluted as its
simply not possible to automatically "extend" using a suffix.

Extension using a prefix works comparatively well be comparison as shown
by the multilib code. Its for this reason I'd like to switch the
meta-toolchain nativesdk recipes to become a prefix rather than a
suffix.

I'm going to propose some patches soon that do this. The patches are
fairly nasty to write and maintain so will need to merge fairly quickly.

If anyone does have a strong objection to this change, now is the time
to raise it. I'd prefer not to have to do this but having considered all
the options, its the best thing to do for the future and will result in
cleaner metadata (look at PKGSUFFIX in eglibc for an example of how
messy this gets).

Note that -native are unchanged and there is no problem or planned
change which them, this just affects nativesdk.

An example WIP patch is:
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t1&id=2aa1acf11dd26bc194668be81544d08ab5e9bb24

Cheers,

Richard



