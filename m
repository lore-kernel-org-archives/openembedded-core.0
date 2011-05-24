Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOtGF-00070B-J2 for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:11:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OF86ub021181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:08:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20707-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:08:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OF7xGq021175
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:07:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306249385.2525.203.camel@phil-desktop>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
	<1306246595.3424.932.camel@rex>
	<1306249385.2525.203.camel@phil-desktop>
Date: Tue, 24 May 2011 16:07:55 +0100
Message-ID: <1306249675.3424.936.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH] bitbake.conf: make OVERRIDES match what people expect
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
X-List-Received-Date: Tue, 24 May 2011 15:11:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 16:03 +0100, Phil Blundell wrote:
> On Tue, 2011-05-24 at 15:16 +0100, Richard Purdie wrote:
> > I've been thinking through the different use cases and briefly talked
> > with Koen offlist about this. I think the revised order makes sense with
> > what users would expect and am happy to remove local and fail-fast as
> > overrides since we don't have people using them (local is pretty
> > weak/useless and fail-fast has only ever been used by gcc recipes
> > afaik).
> 
> I've certainly found local useful in the past, though admittedly that
> might have been in the days when it was the highest rather than lowest
> priority OVERRIDE.  You might be right that it isn't a great deal of use
> as it stands.
> 
> I agree that fail-fast should probably go away, but there is an existing
> reference to it in gcc-cross_csl-arm-2008q1.bb and I think the patch
> that removes the OVERRIDE should probably address that usage at the same
> time.
> 
> What's "forcevariable" for?  I don't think we ever had that in oe, and
> there don't seem to be any obvious users of it in oe-core either.

It was added to poky with the intent of doing what "_local" would have
done before it was broken.

I think its a little safer than using "local" as the override keyword,
I'm open to opinion on whether it should be kept but it probably has
uses.

Cheers,

Richard





