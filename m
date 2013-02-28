Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UBCx6-000252-0E for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 00:31:52 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1SNMl8x001187; Thu, 28 Feb 2013 23:22:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dqQNEyq3Yi6P; Thu, 28 Feb 2013 23:22:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1SNMfaC001179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 28 Feb 2013 23:22:44 GMT
Message-ID: <1362093308.1055.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Thu, 28 Feb 2013 23:15:08 +0000
In-Reply-To: <cover.1362003285.git.sgw@linux.intel.com>
References: <cover.1362003285.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/40] Post-ELC Patches and Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2013 23:31:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 14:17 -0800, Saul Wold wrote:
> Andrei Dinu (3):
>   e2fsprogs : upgrade to 1.42.7
>   dbus-glib : upgrade to 1.100.2
>   sudo : upgrade to 1.8.6p6
> 
> Constantin Musca (1):
>   libassuan: upgrade to 2.1.0
> 
> Cristian Iorga (4):
>   iproute2: upgraded to 3.8.0
>   connman: enable connman client
>   packagegroup-core-tools-testapps: connman-client added
>   minicom: upgrade to 2.6.2
> 
> Emilia Ciobanu (1):
>   distrodata: added some corner cases for svn and git repos
> 
> Hongxu Jia (5):
>   glib-2.0-native:fix do_configure failed with gcc 4.3.4 on x86 host
>   qemu-native:fix do_compile failed with gcc 4.3.4 on x86 host
>   sstate-cache-management.sh: fix remove duplicate failed when multiple
>     archs
>   sstate-cache-management.sh:fix the incorrect usage of option `-d'
>   sstate-cache-management.sh: don't hardcode available sstate_suffixes
> 
> Jessica Zhang (1):
>   Add kernel arch variable in SDK environment variable list for
>     supporting build external kernel module using SDK
> 
> Joe Slater (1):
>   pull ldlinux.sys and isolinux.bin from correct places

I can understand why this is proving to be an issue however I don't like
expanding paths like this at all. Might be better to add MLPREFIX to the
right dependencies and have the syslinux bits end up in the multilib
sysroot too.


> Kang Kai (1):
>   lsbtest: sync test suite packages version
> 
> Khem Raj (2):
>   binutils: Fix build with newer texinfo 5.0+
>   binutils: Delete recipes for 2.22
> 
> Laurentiu Palcu (1):
>   gconf.bbclass: make postinstall fail silently when running offline

Already fixed differently, please drop.
> 
> Martin Jansa (1):
>   sanity: use lsb distro_identifier

Where are the updates this would need associated with it?

> 
> MiLo (1):
>   util-linux: Add package for libmount
> 
> Ming Liu (1):
>   parted: fix several integer overflows
> 
> Muhammad Shakeel (2):
>   archiver class: Use tasks with sstate instead of pre/post funcs
>   archive-*-source.bbclass: Handle all package classes
> 
> Otavio Salvador (2):
>   qt4-tools: Drop libx11 dependency when building without 'x11' distro
>     feature

This had comments and is rejected as the option needs to explicitly
disable x11, not float.

>   qt4-embedded: Enable Linux Input support
> 
> Ross Burton (1):
>   dbus: set correct address when using --address=systemd:
> 
> Saul Wold (11):
>   sqlite: rename version to match upstream versioning change
>   mini-x-session: Fix starting of x-session
>   nspr: Update to 4.9.5
>   socat: Update to 1.7.2.1
>   boost: Update to 1.53.0
>   man-pages: Update to 3.47
>   lsbinitscripts: Update to 9.44
>   file: Update to 5.13
>   resolvconf: Update to 1.70
>   kconfig-frontends: Update to 3.8
>   gconf: update to 3.2.6
> 
> rongqing.li@windriver.com (1):
>   gcc: make compiler to search build directory before standard system
>     include directories

This looks positively dangerous to me. Needs to get fixed properly and
less invasively or at least get an ack from Khem.

Cheers,

Richard





