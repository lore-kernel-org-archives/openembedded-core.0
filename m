Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id F0EF26B5A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 06:01:23 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6V6B1F4029164; Wed, 31 Jul 2013 07:11:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9Uhl1vNju0fY; Wed, 31 Jul 2013 07:11:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6V6AtAn029155
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 31 Jul 2013 07:10:57 +0100
Message-ID: <1375250457.5851.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 31 Jul 2013 07:00:57 +0100
In-Reply-To: <cover.1375194496.git.sgw@linux.intel.com>
References: <cover.1375194496.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (M3 rc1) v2 00/25] Needs Final Review & ACK
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Jul 2013 06:01:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-07-30 at 07:30 -0700, Saul Wold wrote:
> Removed bluez / obex patch in preference for Ross's (later this week).
> 
> Please review/ack for RP to pull today for M3-rc1
> 
> Thanks
> 
> Sau!
> 
> 
> The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
> 
>   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Andre McCurdy (1):
>   lib/oe/terminal.py: add support for MATE desktop terminals
> 
> Andrei Dinu (1):
>   libpng : upgrade to 1.6.3
> 
> Colin Walters (1):
>   util-linux: Update for swapoff being a separate binary
> 
> Cristian Iorga (1):
>   iproute2: upgrade to v3.10.0
> 
> Emilia Ciobanu (4):
>   docbook-sgml-dtd-3.1-native: fix recipe name
>   docbook-sgml-dtd-4.1-native: fix recipe name
>   distrodata.bbclass: Remove whitespaces
>   distrodata.bbclass: Include PRSPV variable in upstream version
>     checking
> 
> Hongxu Jia (3):
>   util-linux: use u-a for su
>   shadow: use u-a for su
>   busybox: move /bin/su to /usr/bin/su to match util-linux and shadow
> 
> Jackie Huang (2):
>   dbus: remove build host test in configure script
>   matchbox-wm: correct the SRC_URI and add checksums
> 
> Jonathan Liu (1):
>   syslinux: update to 4.07
> 
> Jukka Rissanen (1):
>   bluez5: Only install .conf files if found
> 
> Laurentiu Palcu (1):
>   csl-versions.inc: instruct user to check local.conf
> 
> Ming Liu (2):
>   openssl: Fix multilib header conflict - opensslconf.h
>   libpam: deny all services for the OTHER entries
> 
> Muhammad Shakeel (2):
>   systemd: Remove init.d dir if systemd unit file is present and
>     sysvinit not a distro feature
>   busybox: Add syslog-init alternative only if SysV in enabled
> 
> Paul Eggleton (1):
>   classes/sanity: check for suid root command evility

I merged this apart from the one above since I don't believe we need to
run this check on every build...

Cheers,

Richard

> Peter Seebach (1):
>   pseudo: Always try to build 32-bit libpseudo when NO32LIBS is set to 0
> 
> Ross Burton (1):
>   v86d: mark as compatible with all x86, not just qemux86
> 
> Saul Wold (1):
>   texinfo: Update to 5.1
> 
> Wenzong Fan (1):
>   ccache: allow CCACHE_DIR to be overriden



