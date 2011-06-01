Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRryl-00085j-S5 for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:25:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRrvj-0001zc-83
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:22:15 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE66FC6.4030607@windriver.com>
References: <1306944074.2529.107.camel@phil-desktop>
	<1306944235.2529.109.camel@phil-desktop>
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
	<1306945014.2529.113.camel@phil-desktop> <4DE66D53.30505@windriver.com>
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
Date: Wed, 01 Jun 2011 21:22:08 +0100
Message-ID: <1306959728.3119.5.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 20:25:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
> It "should" be as simple and adding --without-perl and --without-python to the
> configuration line...  but I haven't tried it.

Turns out that rpm-native already does this, but (like the dbus case)
there is no matching logic to get the DEPENDS right.

Another instance of a similar thing appears to be sqlite3-native, which
DEPENDS on tcl-native even though it's configured --without-tcl.

p.




