Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qswxb-0008CC-Ol
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:12:07 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QswtB-0004nW-RZ
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 15:07:34 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 14:07:31 +0100
In-Reply-To: <20110815122327.GA7862@chargestorm.se>
References: <1313164659.6733.163.camel@phil-desktop>
	<20110815122327.GA7862@chargestorm.se>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313413653.6733.175.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] libx11: skip self if x11 not in DISTRO_FEATURES
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
X-List-Received-Date: Mon, 15 Aug 2011 13:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-15 at 14:23 +0200, Anders Darander wrote:
> Although, it is already mergerd by Richard, I really like this patch
> series (after testing it).
> 
> * Phil Blundell <philb@gnu.org> [110812 17:57]:
> > This stops (most) x11 packages leaking into a non-x11 distro by mistake.
> 
> Will you submit this to meta-oe also?
> This question might apply to a few of the other patches also.

I hadn't planned to (in fact, I hadn't previously realised that meta-oe
had its own copy of those files).  If you think that would be a good
idea then you're obviously welcome to do so, though.

p.




