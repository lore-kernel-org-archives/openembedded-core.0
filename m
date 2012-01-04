Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RiSX2-00021E-Dj
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 16:13:36 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RiSPw-0002J0-S7; Wed, 04 Jan 2012 16:06:16 +0100
From: Phil Blundell <philb@gnu.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 04 Jan 2012 15:06:16 +0000
In-Reply-To: <1794876.VcZe9uqeJk@helios>
References: <1325612539.28005.16.camel@phil-desktop>
	<1325678787.3555.134.camel@ted>
	<1325679862.28005.44.camel@phil-desktop>
	<1794876.VcZe9uqeJk@helios>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1325689576.28005.60.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: weird exports in bitbake.conf
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
X-List-Received-Date: Wed, 04 Jan 2012 15:13:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-04 at 13:49 +0000, Paul Eggleton wrote:
> These are still necessary for building Opie, but I think they really belong in 
> palmtop.bbclass in meta-opie, certainly not in oe-core. Unfortunately I just 
> checked and a bunch of recipes in meta-opie refer to these without inheriting 
> palmtop and will therefore break if these are removed. I want to tidy these up 
> but can you give me until next week to do that?

That would be great.  Thanks.

p.




