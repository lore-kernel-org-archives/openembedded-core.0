Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QuLO8-0003rg-Lp
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 11:29:16 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QuLJe-0001tp-Ej
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 11:24:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 19 Aug 2011 10:24:37 +0100
In-Reply-To: <5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1313745878.6733.259.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 15/32] conf, recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Fri, 19 Aug 2011 09:29:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> LINKER_HASH_STYLE is not set to either sysv or gnu
> depending upon architecture e.g. mips does not support
> gnu hash style among the supported architectures so
> we make sure its set to 'sysv' form mips
> 
> Linker flags are munged to adhere to renamed variable
> 
> Third option is to set it to 'both' we do
> not do that by default but user can still set it

It wasn't totally obvious to me why this patch is a good thing.  Can you
explain why this change is desirable? 

Also, I found the first paragraph of the description above quite hard to
understand.  Do you think you could try to reword it to be a bit
clearer?

p.




