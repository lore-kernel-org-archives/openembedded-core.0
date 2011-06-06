Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QTUme-0007ZR-QR for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 10:03:36 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QTUjX-0005ZE-1S
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 10:00:23 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <300cfa12d67e37c81fbbcdaba5c7d7686a191cfe.1307331820.git.scott.a.garman@intel.com>
References: <cover.1307331820.git.scott.a.garman@intel.com>
	<300cfa12d67e37c81fbbcdaba5c7d7686a191cfe.1307331820.git.scott.a.garman@intel.com>
Date: Mon, 06 Jun 2011 09:00:16 +0100
Message-ID: <1307347216.3131.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/4] tar: upgrade to v1.26
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
X-List-Received-Date: Mon, 06 Jun 2011 08:03:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-05 at 21:49 -0700, Scott Garman wrote:
>  SECTION = "base"
> +PRIORITY = "optional"

Seeing this sort of thing makes me wonder whether SECTION and PRIORITY
actually belong in the core metadata at all.  It seems as though the
determination of what exactly is "standard" vs "optional" is a matter of
distro policy and this would be better done in the distro config files.

Also, just on a pragmatic issue, the two values above are actually what
bitbake.conf sets as default anyway so there isn't much to be gained by
specifying them in the recipe as well.

p.




