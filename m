Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuRme-0000Gz-HK for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:19:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGEKAh030185
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:14:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28745-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:14:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGEDgj030179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:14:15 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:14:11 -0700
Message-ID: <1313770451.13995.113.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/32] Various Fixes, Updates
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
X-List-Received-Date: Fri, 19 Aug 2011 16:19:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
> 
>   kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Adrian Alonso (1):
>   file: new file version 5.07
> 
> Anders Darander (3):
>   qt4: allow a reduction in build time
>   qemu: modify search paths for libgl
>   scripts/runqemu: modify search paths for libgl
> 
> Dongxiao Xu (7):
>   busybox: Change ${PN} to ${BPN} in file names
>   sysvinit: Change ${PN} to ${BPN} in file names
>   curl: Use BPN instead of PN for style like lib${PN}
>   ea-acl: Use BPN instead of PN for style like lib${PN}
>   attr: Use BPN instead of PN for style like lib${PN}
>   acl: Use BPN instead of PN for style like lib${PN}
>   procps: Fix lib path to support multilib
> 
> Jingdong Lu (1):
>   initrdscripts: fix init-live.sh
> 
> Joshua Lock (1):
>   glib-2.0: explicitly disable dtrace and systemtap for native varaint
> 
> Kang Kai (6):
>   at: make at usable for common user
>   eglibc: check dependencies among eglibc options
>   mailx: update license and distro tracking fileds
>   slang: add homepage and update distro tracking fields
>   alsa-tools: update license and add distro tracking fields
>   newt: update distro tracking fields
> 
> Khem Raj (4):
>   conf,recipes: Redefine LINKER_HASH_STYLE
>   gcc-4.6: Use --with-linker-hash-style configure option
>   task-core-tools: Use LTTNGUST variable instead of hardcoding
>     lttng-ust
>   gdb: Add lttng-ust to DEPENDS only for eglibc
> 
> Koen Kooi (1):
>   tcl: fix networking breakage
> 
> Martin Jansa (2):
>   task-core-boot: allow distribution to override default dev_manager
>     provider with VIRTUAL-RUNTIME_dev_manager
>   bluez4: update recipe from meta-oe
> 
> Noor Ahsan (1):
>   mtd-utils: Added recipe of newer version 1.4.4.
> 
> Paul Eggleton (2):
>   image.bbclass, kernel.bbclass: create warning file about deleting
>     deploydir files
>   sanity.bbclass: add optional untested host distro warning
> 
> Phil Blundell (2):
>   libxkbcommon: new
>   libxslt: fix packaging of static libraries
> 
> Wenzong Fan (1):
>   perl-native: Update find_perl to find the perl wrapper

Thanks for putting this together Saul. I've either merged these or
commented on the mailing list.

Cheers,

Richard



