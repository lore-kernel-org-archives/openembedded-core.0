Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QVJDU-0000aa-4O for openembedded-core@lists.openembedded.org;
	Sat, 11 Jun 2011 10:06:48 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QVJAG-0000fs-OG; Sat, 11 Jun 2011 10:03:28 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF31F79.4070602@windriver.com>
References: <4DF31F79.4070602@windriver.com>
Date: Sat, 11 Jun 2011 09:03:22 +0100
Message-ID: <1307779402.3307.12.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Cc: "Purdie, Richard" <richard.purdie@intel.com>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: About share eglibc work directories
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
X-List-Received-Date: Sat, 11 Jun 2011 08:06:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-11 at 15:55 +0800, Robert Yang wrote:
> The source code of eglibc and eglibc-nativesdk are not compatible because of
> the patch ld-search-order.patch, this makes it a little complex to share their
> source directories, what can I think is that always apply
> ld-search-order.patch, then in do_configure_prepend:

I must admit I never quite understood why ld-search-order.patch is
really required; it seems like rather a gruesome hack.  Why can't the
SDK paths just be put in RPATH records for the nativesdk binaries?

p.




