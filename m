Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TeDhc-0006rY-2g
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 00:39:33 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TeDTp-0007QD-9i; Fri, 30 Nov 2012 00:25:17 +0100
Message-ID: <1354231510.2452.5.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 29 Nov 2012 23:25:10 +0000
In-Reply-To: <e49fecdf22b26fddbd30a5bf23ef729a3e5f792e.1354230112.git.Martin.Jansa@gmail.com>
References: <cover.1354230112.git.Martin.Jansa@gmail.com>
	<e49fecdf22b26fddbd30a5bf23ef729a3e5f792e.1354230112.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] tune-*: add PACKAGE_EXTRA_ARCHS entries starting with specific ARMPKGARCH
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
X-List-Received-Date: Thu, 29 Nov 2012 23:39:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-11-30 at 00:12 +0100, Martin Jansa wrote:
> +PACKAGE_EXTRA_ARCHS_tune-arm920t = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm920tt"
> +PACKAGE_EXTRA_ARCHS_tune-arm926ejs = "${PACKAGE_EXTRA_ARCHS_tune-armv5te} arm926ejste"
> +PACKAGE_EXTRA_ARCHS_tune-arm9tdmi = "${PACKAGE_EXTRA_ARCHS_tune-armv4t} arm9tdmit"

The last thing in each of those lines looks a bit weird.  Not that I'm
saying that I think they're wrong, necessarily, but can you explain what
exactly they mean and why they are a sensible thing to have?

p.




