Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QNgvY-0004qB-Ro for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 09:48:48 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QNgsi-0000G4-PM
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 09:45:53 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
	<1305959660.18415.252.camel@lenovo.internal.reciva.com>
	<51ED17D8-BCDC-4A28-B537-5EBDAE71772B@gmail.com>
Date: Sat, 21 May 2011 08:45:45 +0100
Message-ID: <1305963945.18415.255.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 07:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-21 at 00:19 -0700, Khem Raj wrote:
> >> -EXTRA_OECONF = " --with-gtk "
> >> -
> >> +EXTRA_OECONF_libc-glibc = " --with-gtk "
> >> +EXTRA_OECONF_libc-uclibc = " --without-gtk --without-gnome "
> > 
> > Can you make this use the same logic as above?
> > 
> 
> Is there a problem with this logic ?

Not functionally but, if the DEPENDS are expressed in terms of a default
and then an override for uclibc, it seems like it would be natural for
the corresponding EXTRA_OECONF to be written the same way.

p.




