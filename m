Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgIwF-000404-36 for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:02:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwW8B012642
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12380-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BFwLYL012630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 16:58:21 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Jul 2011 16:57:34 +0100
Message-ID: <1310399854.20015.978.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [RFC PATCH 0/3] Machine/tune files overhaul
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
X-List-Received-Date: Mon, 11 Jul 2011 16:02:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We talked a bit about what might be needed to overhaul the machine/tune
config files to improve their usability, feature control and various
other things.

I've been experimenting locally with the following patchset. Its sent
based against poky since it requires a bitbake change and I also tested
beagleboard specifically and this was the easiest way to do it.
Obviously these can be split out easily enough.

The reason a bitbake change was needed was so that the "contains"
functionality could be used in core variables before base.bbclass is
loaded.

The patches themselves have further details about what they change and
why. The transition for this could be a little tricky but is dectable
when it hasn't happened by looking if TUNE_PKGARCH is set. Its easy to
add a check for that and error.

I've not completed the machine/tune files conversion preferring to
discuss the patches at this point before going any further.

Cheers,

Richard





