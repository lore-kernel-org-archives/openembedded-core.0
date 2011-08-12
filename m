Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qrstu-0005jv-H8
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 16:39:54 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QrspY-0000bZ-3D
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 16:35:24 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 12 Aug 2011 15:35:23 +0100
In-Reply-To: <1403530.aczy7koY2H@perseus>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1313064502.14274.418.camel@rex>
	<1313065783.6733.132.camel@phil-desktop>
	<1403530.aczy7koY2H@perseus>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313159724.6733.158.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 2/3] Add basic Mips core tune config
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
X-List-Received-Date: Fri, 12 Aug 2011 14:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 07:49 -0700, Khem Raj wrote:
> yeah I think major cpu architecture would be nice to have in overrides
> e.g. mips for mipseb and mipsel. We dont need endianness info since we
> can deduce that from tune features in todays setup.

I'm not entirely convinced it's wholesome for random recipes to start
poking around inside TUNE_FEATURES.  SITEINFO_ENDIANNESS seems like the
cleanest way for recipes to get that information.

p.




