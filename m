Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RvtNc-0006sc-K3 for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:31:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1AGNIqq000960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 16:23:18 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00512-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 16:23:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1AGN8wL000953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 16:23:09 GMT
Message-ID: <1328890997.18909.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 16:23:17 +0000
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 00/20] A load of patches before ELC
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
X-List-Received-Date: Fri, 10 Feb 2012 16:31:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-10 at 00:28 -0800, Saul Wold wrote:
> Richard,
> 
> Here is a load of patches that I have tested against the AB
> on x86 and arm.
> 
> Khem's zlib patch has a large affect due to the dropping of the .la
> file therefore a bunch of PR bumps and it also fixes some missing 
> DEPENDS.
> 
> Once Lianhoa's patch is in, we can enable BasicHash in Poky, there
> is a patch from him pending still on the poky alias.
> 
> 
> The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
> 
>   tcmode-default: add preference for gdb/gdbserver (2012-02-08 10:16:48 -0600)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Christopher Larson (1):
>   external-csl-toolchain: fix mtd-user.h issue
> 
> Joshua Lock (5):
>   clutter-1.8: update to clutter-1.8.4
>   mx: update to 1.4.2
>   mx: ensure gettext and dbus are present
>   clutter: upgrade git recipe to reflect 1.8.4 tag
>   distro-tracking-fields: update clutter, clutter_git and mx
> 
> Khem Raj (3):
>   zlib: Upgrade 1.2.5 -> 1.2.6
>   sat-solver: Fix build with zlib 1.2.6
>   gnupg: Add missing DEPENDS on libgcrypt
> 
> Lianhao Lu (1):
>   gcc: Ensure same sstate hashes for shared soruce directory
> 
> Matthew McClintock (2):
>   distutils.bbclass: override LDSHARED so we use the linker for this
>     build and not the one used in sstate-cache
>   powerpc64-linux: Update cached autoconf values for libpcap on
>     powerpc64
> 
> Otavio Salvador (2):
>   cross.bbclass: add virtclass handler
>   useradd.bbclass: skip processing on virtclass-cross extended packages
> 
> Richard Purdie (4):
>   sstate.bbclass: Optimise sstate_hardcode_path
>   package.bbclass: Optimise the per file rpm handling
>   gcc-4.6: Some small performance tweaks
>   package_rpm.bbclass: Replace shell provides/requires script with
>     python version
> 
> Saul Wold (1):
>   valgrind: Fixed
>     Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
>     Upstream-Status
> 
> Tom Rini (1):
>   u-boot-fw-utils: Add for v2011.06

Merged to master with the exception of my package_rpm.bbclass patch
which I think there may be better alternatives to.

Cheers,

Richard



