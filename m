Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoVuR-0000c5-5g
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 09:30:31 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QoVqF-0002vH-BN
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 09:26:11 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <26D3BBA8-8A7F-4B0C-A235-8307DD46B3CE@dominion.thruhere.net>
References: <1312296431-18991-1-git-send-email-koen@dominion.thruhere.net>
	<C9D28EB1-CE86-42E9-9825-0A408698FD66@dominion.thruhere.net>
	<1312297317.4325.46.camel@phil-desktop>
	<F2D133A8-03CF-408A-A22B-CCC200E2AF18@dominion.thruhere.net>
	<1312353556.3223.21.camel@lenovo.internal.reciva.com>
	<26D3BBA8-8A7F-4B0C-A235-8307DD46B3CE@dominion.thruhere.net>
Date: Wed, 03 Aug 2011 08:26:05 +0100
Message-ID: <1312356365.3223.23.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] libc-package bbclass: fix binary localedata dependency code
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
X-List-Received-Date: Wed, 03 Aug 2011 07:30:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 09:03 +0200, Koen Kooi wrote:
> If you look at e.g. http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/commit/?h=yocto&id=0fb50099
> 
> -locale_base_en_us -> eglibc_localedata_en_us;
> -locale_base_en_us -> localedef;
> -locale_base_en_us -> eglibc_charmap_utf_8;
> -localedef -> libc6;
> +locale_base_en_us -> eglibc_binary_localedata_en_us;
> 
> That shows that locale-base-foo drops some deps like the charmap when switching to binary locales. There's other breakage in that build clouding the diff, so I copied the relevant lines above.

I think that's expected.  IIRC, the charmap files are inputs to
localedef and the relevant bits from them are fully captured in the
binary archive output.  So, if you're using a pregenerated binary
locale, you don't need the charmap (or localedata, which is also a
source file) at run time.

p.




