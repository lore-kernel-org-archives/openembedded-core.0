Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1Ucueh-0001ss-Ve
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 11:39:24 +0200
Received: from [192.168.0.2] (host86-137-102-112.range86-137.btcentralplus.com
	[86.137.102.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 29EAB952B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 10:21:12 +0100 (BST)
Message-ID: <5194A507.5040700@r-finger.com>
Date: Thu, 16 May 2013 10:21:11 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <518A6B25.5000108@r-finger.com> <3057509.dy5Cs7AUqs@helios>
	<519372F1.6050902@r-finger.com> <5543572.N8ppyBn6lW@helios>
	<5193B925.6010607@r-finger.com> <1368639038.18324.6.camel@ted>
	<1368647004.18324.68.camel@ted>
In-Reply-To: <1368647004.18324.68.camel@ted>
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Thu, 16 May 2013 09:39:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/05/13 20:43, Richard Purdie wrote:
> On Wed, 2013-05-15 at 20:30 +0300, Richard Purdie wrote:
> How about the master branch gets renamed "dylan" so it clearly show what
> its meant to work against and follows the other repositories?

Yes, that's on my TODO list, together with removing the couple of
unnecessary updated recipes from master when that is done (glib,
libxkbcommon).

Just to clarify the Guacamayo/meta-clutter was not set up with the view
to this proposal for an separate meta-clutter layer. I created it
because I need somewhere with uptodate clutter and associated recipes
(e.g., Mutter) so I could get on with the meta-gir (GObject
Introspection) work and did not want to make that depend on
meta-gucamayo. But I'd really prefer any such meta-clutter layer not to
be my private sandbox, hence this proposal.

Tomas

-- 
http://sleepfive.com


