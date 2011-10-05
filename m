Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RBWMW-0005o1-5e
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:38:36 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RBWH9-00022Y-K4
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 20:33:03 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E8C97D7.8020909@intel.com>
References: <cover.1316890497.git.sgw@linux.intel.com>
	<62e9da86a45eef3dd374bd8c7e110f619f620f80.1316890497.git.sgw@linux.intel.com>
	<1317742614.13337.47.camel@phil-desktop> <4E8C97D7.8020909@intel.com>
Date: Wed, 05 Oct 2011 19:32:28 +0100
Message-ID: <1317839548.2979.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 1/2] attr/acl: add SSTATEPOSTINSTFUNC
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
X-List-Received-Date: Wed, 05 Oct 2011 18:38:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-05 at 10:45 -0700, Saul Wold wrote:
> Not good, I guess the change here would be to test if base_libdir and 
> libdir are the same, would you confirm that this test would be right?

Yes, something like that.  Those two dirs are indeed the same on micro.

thanks

p.




