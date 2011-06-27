Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QbHqT-0001uq-Tb for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:51:45 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QbHmv-0008TT-GQ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 21:48:05 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309203709-25406-1-git-send-email-raj.khem@gmail.com>
References: <1309203709-25406-1-git-send-email-raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 20:47:58 +0100
Message-ID: <1309204078.3035.1.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] uclibc: Set ARCH_USE_MMU for armeb configs
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
X-List-Received-Date: Mon, 27 Jun 2011 19:51:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-27 at 12:41 -0700, Khem Raj wrote:
> After the last cleanup. armeb/uClibc.machine
> gets picked up by default for ARM Big endian
> so bring it uptodate.

> -UCLIBC_HAS_FPU=y
> +# UCLIBC_HAS_FPU is not set
> +UCLIBC_HAS_SOFT_FLOAT=y

Is this deliberate?  That seems to be a change in behaviour but it isn't
mentioned in the commit message.

More generally, does armeb really need its own config file?  It seems as
though there shouldn't be any difference between arm and armeb except
endianness, and it should be fairly trivial to select that automatically
in the same way as we do the other uClibc config customisations.

p.




