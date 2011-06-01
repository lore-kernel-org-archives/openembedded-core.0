Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRsDr-0008K5-RZ for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:40:59 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRsAp-00020R-8c
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:37:51 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e96c2e88aaf1cd22faac3b7ae61ccf34adfe92ba.1306958862.git.otavio@ossystems.com.br>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<e96c2e88aaf1cd22faac3b7ae61ccf34adfe92ba.1306958862.git.otavio@ossystems.com.br>
Date: Wed, 01 Jun 2011 21:37:45 +0100
Message-ID: <1306960665.3119.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Wed, 01 Jun 2011 20:40:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
> -# CONFIG_MDEV is not set
> +CONFIG_MDEV=y

Per previous discussion, I am still uneasy about this change.  I think
we really need some sort of coherent policy for what exactly the default
busybox configuration in oe-core is meant to be doing, and then (if
necessary) a set of patches to make it match the policy.  Just flipping
random features on and off does not seem like a good way to proceed.

p.




