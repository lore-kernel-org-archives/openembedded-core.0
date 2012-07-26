Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuOmD-00020H-HI for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:10:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDxMmi021806
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:59:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21246-05 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:59:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QDxDQp021800
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:59:15 +0100
Message-ID: <1343311153.29991.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 14:59:13 +0100
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/28] Fixes & eglibc 2.16
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
X-List-Received-Date: Thu, 26 Jul 2012 14:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-25 at 00:18 -0700, Saul Wold wrote:
> Andrei Gherzan (1):
>   package.bbclass: Create symlinks for packages with different packaged
>     name
> 
> Bruce Ashfield (1):
>   linux-yocto/3.4: 3.4.6 and 3.4.x-rt14
> 
> Christopher Larson (2):
>   initscripts: don't bg mk_dirs in populate-volatile
>   libpcap: fix pcap-config to not return -Wl,-rpath
> 
> Denis Carikli (1):
>   kernel.bbclass: fix external module building
> 
> Khem Raj (6):
>   qemu.bbclass: Map the qemu binary name for powerpc64
>   cups_1.4.6.bb: Fix build on ppc64
>   libcgroup_0.37.1.bb: Add recipe
>   eglibc-initial: Fix build failure due to missing limits.h
>   gcc-cross-initial: Stage self sufficient fixed limits.h
>   eglibc: Fix build when OPTION_POSIX_WIDE_CHAR_DEVICE_IO is not set
> 
> Koen Kooi (1):
>   kernel bbclass: Recreate uImage only when KEEPUIMAGE != "yes"
> 
> Mark Hatle (1):
>   Add missing Upstream-Status to various patches.
> 
> Otavio Salvador (4):
>   bash: enable parallel build

I didn't take the above due to the build failures it seemed to cause.

>   bash: fix warning about bashbug reference /usr/bin when installed in
>     /bin
>   shadow-native: use 'users' group by default
>   shadow: use 'users' group by default
> 
> Paul Eggleton (2):
>   dhcp: remove dependency of dev/staticdev packages on main package
>   classes/package_deb: add PackageArch field
> 
> Robert P. J. Day (3):
>   libxp: Change superfluous "+=" to simple "=" when using _append
>   webkit-gtk: Replace superfluous "+=" with "=", and add leading space
>   xinit_1.3.2: Remove broken, superfluous 'FILES_${PN} +=
>     "${libdir}X11/xinit"'
> 
> Robert Yang (1):
>   package-index: inherit pythonnative

I didn't take the above since I have some unanswered questions about
this one.

> Ross Burton (1):
>   core-image: remove x11-netbook package group, it's unused
> 
> Roy.Li (1):
>   busybox:udhcpc: fix the root_is_nfs() function
> 
> Saul Wold (1):
>   tcmode-default: Bump EGLIBC Version to 2.16

I didn't take the above yet as again I think there are some remaining
issues I want to ensure we merge the right pieces for.

> Wenzong Fan (1):
>   remake: Add remake-native and remake
> 
> Yao Zhao (1):
>   busybox: fix the problem that mkfs.minix.tests fails on big endian
>     platform

I merged the others.

Cheers,

Richard



