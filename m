Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T4EAd-0001sz-9u for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 18:52:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MGeYPo004749;
	Wed, 22 Aug 2012 17:40:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04504-02; Wed, 22 Aug 2012 17:40:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7MGeQnN004743
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 22 Aug 2012 17:40:28 +0100
Message-ID: <1345653628.3907.124.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Aug 2012 17:40:28 +0100
In-Reply-To: <F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1840245.41xHr4Jb3c@helios>
	<F1032BDA-250C-4EB3-94F5-5FB12A9FE6FB@dominion.thruhere.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Wed, 22 Aug 2012 16:52:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-22 at 18:32 +0200, Koen Kooi wrote:
> Op 22 aug. 2012, om 18:11 heeft Paul Eggleton <paul.eggleton@linux.intel.com> het volgende geschreven:
> 
> > On Wednesday 22 August 2012 16:50:27 Paul Eggleton wrote:
> >> We already have avahi in OE-Core and some cursory research suggests that
> >> avahi is preferred over this package, which has apparently not seen a
> >> release since 2006. Nothing in OE-Core actually refers to it, so let's just
> >> remove it.
> > 
> > Hmm, this was meant to be an RFC - I would like to give people some time to 
> > respond.
> 
> IIRC gumstix used it for bonjour without bringing in the megabytes of
> support needed for avahi.

I'm not sure that is enough to warrant it staying in OE-Core. meta-oe
might be a better fit? Can avahi be cut down for "tiny" usage though
configuration?

Cheers,

Richard





