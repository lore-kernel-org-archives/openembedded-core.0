Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGpmV-0004X8-0o for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 13:27:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QB1N5B018506;
	Wed, 26 Sep 2012 12:01:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16144-07; Wed, 26 Sep 2012 12:01:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8QB1FmR018500
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 26 Sep 2012 12:01:16 +0100
Message-ID: <1348657276.8662.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Wed, 26 Sep 2012 12:01:16 +0100
In-Reply-To: <1348583122.31293.76.camel@phil-desktop>
References: <cover.1311232435.git.sgw@linux.intel.com>
	<bbc5129ecdec37a4ebf62f3b43e0f0e0a64210f9.1311232435.git.sgw@linux.intel.com>
	<1348583122.31293.76.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH v2 1/1] gettext: Add depends to gettext to avoid host contamination
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
X-List-Received-Date: Wed, 26 Sep 2012 11:27:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 15:25 +0100, Phil Blundell wrote:
> Can you clarify what exactly is the host contamination issue here?  I
> don't quite understand why it's appropriate for the target gettext to be
> depending on libxml2-native (which it presumably can't be linking
> against).  Also, since gettext-native is configured --with-included-xml,
> it doesn't seem as though that one is going to be using libxml2-native
> in any meaningful sense either.

I tried to unravel this a bit. I think:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=e5e6e761d15e42d94836a2153eda13bdbc4f915e

which added the --with-included-xml came later and should have removed
the DEPENDS but didn't.

(the earlier commit being
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=a0abef4533337faeb2fd991d7ab67f0a94f59568)

So this should be ok to go in and does some nice dependency unravelling.

Cheers,

Richard



