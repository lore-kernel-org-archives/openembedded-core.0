Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rdif3-0003z1-07 for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 14:26:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMDJAUL023756
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:19:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23492-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:19:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBMDJ3JR023750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 13:19:04 GMT
Message-ID: <1324559945.24604.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 13:19:05 +0000
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/26] Some Package Updates and Fixes
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
X-List-Received-Date: Thu, 22 Dec 2011 13:26:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-12-21 at 23:55 -0800, Saul Wold wrote:
> Dexuan Cui (2):
>   socat: add the latest stable version 1.7.2.0
>   wget: fix a host intrusion issue introduced by adding
>     --with-ssl=openssl.
> 
> H.J. Lu (1):
>   gmp: Don't check "$CC $CFLAGS" for x32 in gmp configure
> 
> Ilya Yanok (1):
>   arch-powerpc: set PACKAGE_EXTRA_ARCHS
> 
> Nitin A Kamble (3):
>   bitbake.conf multilib.conf: move the definition of baselib

I didn't take the above, this is a major layout change for x86-64 but
Nitin makes no comment on that in the commit :(

>   binutils: fix building on distros with matching binutils version
>   image-types: add btrfs as a supported fstype
> 
> Paul Eggleton (1):
>   libsync: move to git.yoctoproject.org
> 
> Saul Wold (10):
>   distro tracking: update man-pages, gts-plugin-bluetooth, usbutils,
>   python-pycairo: Upgrade to 1.10.0
>   augeas: Upgrade to 0.10.0
>   libidn: Upgrade to 1.23
>   mc: Add version 4.8.1 now GPLv3
>   texi2html: Upgrade to 5.0
>   libdrm: Upgrade to 2.4.29
>   distro_tracking: Mark Upgrade Info
>   zypper: add patch from libxml2
>   bash: Add SRC_URI Checksums for GPLv2
> 
> Scott Garman (8):
>   ncurses: move libraries to base_libdir
>   libcap: move library to base_libdir
>   util-linux: move libraries to base_libdir
>   e2fsprogs: move libraries to base_libdir
>   libusb1: move libraries to base_libdir
>   libusb-compat: move libraries to base_libdir
>   prelink: update to latest git version
>   insane.bbclass: add QA tests for unsafe references to exec_prefix

Were Scott's changes tested with prefix == exec_prefix == base_prefix?
We need to verify this doesn't break in that case.

Cheers,

Richard



