Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R2MD4-00016B-RO
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 13:58:58 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R2M8B-00007b-2N
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Sep 2011 13:53:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1315648440.1986.27.camel@ted>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
Date: Sat, 10 Sep 2011 12:53:48 +0100
Message-ID: <1315655628.4368.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Sat, 10 Sep 2011 11:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-10 at 10:54 +0100, Richard Purdie wrote:
> which looks right. It does crash as part of rpm rootfs generation
> though, possibly something to do with pseudo given the root operation it
> attempts. Did you test this against rpm or ipk?

Ah, right, I was testing with ipk.  Maybe that's the difference.

p.




