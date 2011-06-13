Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW38m-0005jD-F4 for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:09:00 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>)
	id 1QW35W-0002EP-L0; Mon, 13 Jun 2011 11:05:38 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
Date: Mon, 13 Jun 2011 10:05:32 +0100
Message-ID: <1307955932.6879.12.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 2/2] eglibc: migrate configurability from oe
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
X-List-Received-Date: Mon, 13 Jun 2011 09:09:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-13 at 17:01 +0800, Kang Kai wrote:
> -DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci"
> +DISTRO_FEATURES_LIBC ?= "ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> +					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
> +					libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \
> +					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc \
> +					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp libc-posix-regexp-glibc \
> +					libc-posix-wchar-io"
> +
> +DISTRO_FEATURES ?= "alsa bluetooth ext2 irda pcmcia usbgadget usbhost wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"

Why is ipv6 in DISTRO_FEATURES_LIBC rather than DISTRO_FEATURES?

p.




