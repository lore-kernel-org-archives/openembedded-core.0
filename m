Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QOtWi-0005YB-22 for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 17:28:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OFP64a021376
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:25:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21240-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:25:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4OFP02K021361
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 16:25:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306250123.2525.205.camel@phil-desktop>
References: <1306245860-12820-1-git-send-email-koen@dominion.thruhere.net>
	<1306246595.3424.932.camel@rex>
	<1306249385.2525.203.camel@phil-desktop>
	<1306249675.3424.936.camel@rex>
	<1306250123.2525.205.camel@phil-desktop>
Date: Tue, 24 May 2011 16:24:56 +0100
Message-ID: <1306250696.3424.937.camel@rex>
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
X-List-Received-Date: Tue, 24 May 2011 15:28:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-24 at 16:15 +0100, Phil Blundell wrote:
> On Tue, 2011-05-24 at 16:07 +0100, Richard Purdie wrote:
> > It was added to poky with the intent of doing what "_local" would have
> > done before it was broken.
> > 
> > I think its a little safer than using "local" as the override keyword,
> > I'm open to opinion on whether it should be kept but it probably has
> > uses.
> 
> Ah, I see.  I must admit that I wouldn't have guessed that from the
> name.
> 
> Maybe we should just delete both _local and _forcevariable from the
> default OVERRIDES on the basis that nothing in the metadata (as
> distributed) uses either of them.  Anybody who wants to make use of them
> from local.conf or whereever can always add them back to OVERRIDES in
> the same place.

I'm ok with that, it can also be done by the distro...

Cheers,

Richard



