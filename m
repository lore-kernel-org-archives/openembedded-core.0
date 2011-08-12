Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qrstk-0005iZ-RY
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 16:39:44 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrspO-0000bT-BQ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 16:35:14 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 15:35:13 +0100
In-Reply-To: <1313159586.14274.494.camel@rex>
References: <1313153364.14274.486.camel@rex>
	<4E452F82.7060208@windriver.com> <1313159586.14274.494.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313159714.6733.157.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] local.conf.sample: Cleanup and improve
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
X-List-Received-Date: Fri, 12 Aug 2011 14:39:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-12 at 15:33 +0100, Richard Purdie wrote:
> > Should patch resolution be noop by default?  (I suspect due to my above concern
> > w/ ipkg, changing the behavior now is likely a bad idea.)
> 
> Good question. I suspect most people prefer noop and it would make more
> sense for unattended builds...

Agreed, I think noop is probably the best/least surprising default
behaviour.

p.




