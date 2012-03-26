Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SC7tZ-0001I9-24
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:15:29 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SC7kt-0002JR-BP
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:06:31 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:06:30 +0100
In-Reply-To: <1332759689.28414.104.camel@ted>
References: <1332694123-5078-1-git-send-email-raj.khem@gmail.com>
	<1332759689.28414.104.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1332759991.14363.1027.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] tune/armv7: Add -mthumb to TUNE_CCARGS
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
X-List-Received-Date: Mon, 26 Mar 2012 11:15:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-03-26 at 12:01 +0100, Richard Purdie wrote:
> Looking at this file, if the above is true and armv7 can't do anything
> other than thumb, shouldn't we just delete the non-thumb configurations
> for "armv7"?

It's not totally obvious to me that having a "lowest common denominator"
configuration for ARMv7 is really all that valuable.  In fact I would be
slightly surprised if anybody is targetting ARMv7-M with OE at all.
What's the use-case for that?

p.




