Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW3Tm-00061e-9V for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:30:42 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QW3QW-0002FV-B3
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 11:27:20 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DF5D514.3030102@windriver.com>
References: <cover.1307954821.git.kai.kang@windriver.com>
	<5ffcb67a8acc41eeb36fe98aba6d38f3f1c67a88.1307954821.git.kai.kang@windriver.com>
	<1307955932.6879.12.camel@lenovo.internal.reciva.com>
	<4DF5D514.3030102@windriver.com>
Date: Mon, 13 Jun 2011 10:27:14 +0100
Message-ID: <1307957234.6879.22.camel@lenovo.internal.reciva.com>
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
X-List-Received-Date: Mon, 13 Jun 2011 09:30:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-06-13 at 17:15 +0800, Kang Kai wrote:
> On 2011=E5=B9=B406=E6=9C=8813=E6=97=A5 17:05, Phil Blundell wrote:
> > On Mon, 2011-06-13 at 17:01 +0800, Kang Kai wrote:
> >> -DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci"
> >> +DISTRO_FEATURES_LIBC ?=3D "ipv6 libc-backtrace libc-big-macros libc-b=
sd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
> >> +					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg l=
ibc-fstab libc-ftraverse \
> >> +					libc-getlogin libc-idn libc-inet libc-inet-anl libc-libm libc-li=
bm-big libc-locales libc-locale-code \
> >> +					libc-memusage libc-nis libc-nsswitch libc-rcmd libc-rtld-debug l=
ibc-spawn libc-streams libc-sunrpc \
> >> +					libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-po=
six-regexp libc-posix-regexp-glibc \
> >> +					libc-posix-wchar-io"
> >> +
> >> +DISTRO_FEATURES ?=3D "alsa bluetooth ext2 irda pcmcia usbgadget usbho=
st wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> > Why is ipv6 in DISTRO_FEATURES_LIBC rather than DISTRO_FEATURES?
>=20
> Because eglibc has a feature libc-ipv6, and DISTRO_FEATURES has a ipv6=
=20
> already. It is not needed to import a new feature name on the same=20
> things, so use original ipv6. And eglibc still needs provide this=20
> option, then put it in DISTRO_FEATURES_LIBC.

I'm not quite sure I understood what you wrote above.  But I think what
I was asking was, why doesn't eglibc just look at the existing ipv6
DISTRO_FEATURE?

p.




