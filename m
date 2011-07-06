Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QeN9L-0004ii-HG for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 10:07:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66849hw011691
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 09:04:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11472-04 for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jul 2011 09:04:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p66842PW011685
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2011 09:04:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKrdgM9re6WDXWOCCt+g2Jfm7YRewFw4GibTUJBFrOUmVA@mail.gmail.com>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
	<CAP9ODKrdgM9re6WDXWOCCt+g2Jfm7YRewFw4GibTUJBFrOUmVA@mail.gmail.com>
Date: Wed, 06 Jul 2011 09:03:30 +0100
Message-ID: <1309939410.20015.763.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/17] Various QA/unpackaged files cleanups
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
X-List-Received-Date: Wed, 06 Jul 2011 08:07:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 23:59 -0300, Otavio Salvador wrote:
> On Tue, Jul 5, 2011 at 19:51, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This patch series is for a number of QA/unpackaged files cleanups.
> 
> I noticed you have added .la files in some packages. This seems wrong
> and useless. In fact I am making a local patchset to drop them all and
> I have most build working (fixing last things before posting for
> review).
> 
> It seems very wrong to depend on .la files for linking and pkg-config
> seems to be the most right solution when possible.

.la files are an interesting problem. I'm not overly fond of them but
even in this modern age they can help on certain targets like darwin and
they can help with static linking since they have dependency information
that often hasn't been added into the .pc files. We don't often do
either of those things but in general the .la files are pretty harmless.

With regard to the patch series, it just adds .la files to -dev packages
so the only impact is to development images and even there its small.

If you wanted to clean things up, dropping all the binconfig scripts
would IMO be a much more useful effort as those are much more ugly to
handle and bug ridden. At least libtool has some notion of sysroot
support these days!

Cheers,

Richard




