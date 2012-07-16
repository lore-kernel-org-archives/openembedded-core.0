Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SqiGM-0008SW-0Q for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 12:10:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6G9xTXw029297;
	Mon, 16 Jul 2012 10:59:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28362-03; Mon, 16 Jul 2012 10:59:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6G9xKct029291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Jul 2012 10:59:21 +0100
Message-ID: <1342432762.5019.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 10:59:22 +0100
In-Reply-To: <29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAP9ODKpJLfsbmfPnjL2zZMddeDXO9sWV4+-ZhHmzESQMFu=woQ@mail.gmail.com>
	<29D9FA58-0AB0-4ADF-B67E-0541BC7DA14C@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 10:10:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-16 at 08:11 +0200, Koen Kooi wrote:
> Op 15 jul. 2012, om 23:25 heeft Otavio Salvador het volgende geschreven:
> 
> > On Sat, Jul 14, 2012 at 6:59 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >> The recipe is autotools based now, the COPYING file was replaced with the complete GPLv2 license text.
> >> No more 'lspci' needed ad runtime, but zlib and libnl are needed nowadays.
> >> Add 2 patches, one to fix cross builds and one from Linaro to fix C state parsing on !x86.
> > 
> > Please add proper Upstream-Status for the patches; it is nice to have
> > those to track the pending patches.
> 
> Isn't that field only used to put in "pending" and then backslap each
> other on doing such a good job?

I think that having the combination of knowing where the patch came
from, a description of what it does and some idea of how hacky it is
makes a significant difference to anyone subsequently looking at the
patch.

Over time I also believe we can make a significant change in the amount
of patches we're carrying around and the field will help with that.

If you want a concrete real world example now, when upgrading a recipe,
if you see the string "backport", maybe along with a commit ID, it means
you have to do much less work in verifying it is no longer required. It
also helps me review things when I see people removing patches.

Cheers,

Richard







