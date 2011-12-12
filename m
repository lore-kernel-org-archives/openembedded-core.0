Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaDtw-0004mf-Tv for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 22:59:13 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBCLqHwH001584
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:52:17 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00461-05 for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:52:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBCLq7t9001578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 21:52:08 GMT
Message-ID: <1323726727.2731.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 12 Dec 2011 21:52:07 +0000
In-Reply-To: <cover.1323643433.git.sgw@linux.intel.com>
References: <cover.1323643433.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/26] Round up of patches and pull
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
X-List-Received-Date: Mon, 12 Dec 2011 21:59:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-12-11 at 14:47 -0800, Saul Wold wrote:
> Richard,
> 
> This is a round of of patches and pulls from last week, built
> locally and on AB.
> 
> Includes Nitin's X32 changes along with fixes noticed while doing
> self-hosted work (address comments from Paul earlier).
> 
> Sau!
> 
> 
> The following changes since commit 07f94fa1d661d38b775ce2d99b84e5610c369392:
> 
>   license/copyleft: exception for ast parse (2011-12-10 00:17:25 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Christopher Larson (1):
>   lzop-1.03: add recipe
> 
> Elizabeth Flanagan (1):
>   license: PR bump failure
> 
> Frans Meulenbroeks (1):
>   u-boot: renamed dir from uboot to the more appropriate u-boot
> 
> H.J. Lu (3):
>   mesa: Properly create share library for x32
>   siteinfo: create a new siteinfo for x32-linux
>   openssl-1.0.0e: Update x32 Configure
> 
> Khem Raj (3):
>   qemu-0.15.1: Bump recipes from 0.15.0 to 0.15.1
>   task-core-nfs: Add nfs-utils-client to RDEPENDS
>   eglibc: Generate cross testing script during install
> 
> Nitin A Kamble (8):
>   gst-fluendo.inc: remove unneccessary hack
>   mdadm: Make custom CC definition conditional
>   pulseaudio: fix compilation with x32 toolchain
>   libacpi: Fix libdir for x32
>   findutils: Fix compilation for x32 toolchain
>   pax: fix compilation with x32 toolchain
>   libacpi: Use the cross strip instead of host strip
>   x86 tune: fix TUNE_PKGARCH definition for proper PACKAGE_ARCH
> 
> Otavio Salvador (2):
>   dosfstools: update native to 2.11
>   scripts/send-pull-request: fix typo
> 
> Saul Wold (7):
>   ncurses: libcurses.so should link to libncurses.so
>   bitbake.conf: remove texinfo-native from ASSUME_PROVIDED
>   texinfo: fix compile failure due target makedoc binary being used
>   task-self-hosted: Reorder by Alpha
>   task-self-hosted: Added perl-pod (slight reorder)
>   task-self-hosted: Add host-tools task
>   task-self-hosted: Move tools to host-tools task

Thanks Saul, these look good. I took all except the uboot one which
needs careful timing, I'll merge that tomorrow morning my time when
maintainers likely to be affected are likely awake.

Cheers,

Richard





