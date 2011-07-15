Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QhiMM-0006mY-Nc for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 15:23:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FDJECD021475
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:19:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21159-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:19:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6FDJ5KP021469
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 14:19:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2011 14:19:02 +0100
Message-ID: <1310735943.20015.1222.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Features vs stabilisation as we head to a release
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
X-List-Received-Date: Fri, 15 Jul 2011 13:23:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

One of the goals with OE-Core which differs from how OE-dev operated is
to have some stabilisation and release periods. We discussed this in the
TSC meeting last night and I'd like to make people aware this is going
to happen as it has several implications.

The reason for doing this is to try and turn people's attention from
adding features to bugfixing and stabilisation for a short while,
hopefully to the benefit of the code base. Many other projects do this
and I think it offers many benefits for us too.

We have a six month release cycle, the next release is due in October
and as such, I'm anticipating stabilisation to start around mid August.

What this means is that I'll start being a lot more careful about the
kinds of changes that are being merged, strongly preferring bug fixes to
things which make major changes or add features. This means package
version changes are less likely to be accepted for example unless its to
address security issues or issues people using the recipes are actively
running into.

If people do have feature type changes they want to see in OE-Core, you
therefore need to get them in sooner than later or be prepared to wait.
Obviously none of this stops anyone's ability to develop something on a
branch in the meantime.

After stabilising on master for a while, we'll branch to the release
branch and master can then open up again. This is the first time we'll
have done this so its going to be a learning experience for everyone
although Yocto has been through this a couple of times and we've learnt
things from that. None of the process is set in stone, I'd like to think
we can adapt as needed.

Cheers,

Richard




