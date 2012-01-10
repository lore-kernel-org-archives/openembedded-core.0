Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RkZZK-0004Y2-7y
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 12:08:42 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RkZS7-0007T0-SW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 12:01:15 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 11:01:15 +0000
In-Reply-To: <b93626c9cd63c844f1836dc7baed7254dc171e74.1326174744.git.sgw@linux.intel.com>
References: <cover.1326174744.git.sgw@linux.intel.com>
	<b93626c9cd63c844f1836dc7baed7254dc171e74.1326174744.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1326193275.12160.65.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 14/22] default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
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
X-List-Received-Date: Tue, 10 Jan 2012 11:08:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-01-09 at 21:54 -0800, Saul Wold wrote:
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index e1594f3..0b515e5 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -10,6 +10,8 @@ LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
>  ENABLE_BINARY_LOCALE_GENERATION ?= "1"
>  LOCALE_UTF8_ONLY ?= "0"
>  
> +DISTRO_FEATURES_LIBC_libc-uclibc ?= "ipv4 ipv6 largefile libc-posix-clang-wchar"
> +
>  DISTRO_FEATURES_LIBC ?= "ipv4 ipv6 libc-backtrace libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>  					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse \
>  					libc-getlogin libc-idn libc-inet-anl libc-libm libc-libm-big libc-locales libc-locale-code \

This looks like a bad idea to me.  I think that override will cause
potentially surprising behaviour for folks who are trying to set
DISTRO_FEATURES_LIBC by hand.  And, as far as I can tell, this patch
won't make any functional difference since uclibc will just ignore the
features it doesn't understand.

p.




