Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RPx9j-0005Cx-1z for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 15:05:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEDwcAs012471
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:58:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11950-04 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:58:33 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAEDwTWk012465
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 13:58:30 GMT
Message-ID: <1321279113.26881.63.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 13:58:33 +0000
In-Reply-To: <8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
References: <1321274982.26881.55.camel@ted>
	<1321275166.29435.21.camel@phil-desktop>
	<8AFC2447-9963-4DF0-80E2-198516B3A813@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] base-passwd: Fix the broken preinst/postinstall
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
X-List-Received-Date: Mon, 14 Nov 2011 14:05:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-11-14 at 14:37 +0100, Koen Kooi wrote:
> Op 14 nov. 2011, om 13:52 heeft Phil Blundell het volgende geschreven:
> 
> > On Mon, 2011-11-14 at 12:49 +0000, Richard Purdie wrote:
> >> The preinst accesses file which may not yet have been unpacked.
> >> The postinst is too late for the creation of these files
> >> for at least the opkg backend.
> >> 
> >> This patch therefore encodes the file contents into the preinst,
> >> resolving the various issues once and for all.
> >> 
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > 
> > If you're going to do that (which does look reasonable) then you might
> > as well stop the package from shipping passwd.master and group.master at
> > all.  I don't think anything else uses those files so they're just
> > wasting space at the moment.
> 
> IIRC 'update-passwd' will use those. That's not a criticism on Phils
> suggestion, I like it very much.

I've posted a second patch which moves these pieces into a separate
package and actually uses update-passwd.

Cheers,

Richard




