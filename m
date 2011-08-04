Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qoycv-0002ZU-3G for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:10:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74E5v3U002372
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:05:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01579-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2011 15:05:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p74E5o0M002366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 15:05:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Date: Thu, 04 Aug 2011 15:05:30 +0100
Message-ID: <1312466730.2344.744.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL v2 00/33] Re-Spun with Tom's siteinfo update
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
X-List-Received-Date: Thu, 04 Aug 2011 14:10:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-03 at 15:10 -0700, Saul Wold wrote:
> Richard,
> 
> This has been built, I have done a first pass review over these
> and most seem correct to me, Koen's patch to make the icons dependency
> dynamic seems Ok to me, but I am not sure when the RDEPENDS are processed
> compared to when populate_packages_append() is run, will this 
> RDEPENDS be updated correctly.
> 
> I built world yesterday with some of the same failures seen
> in master
> 
> Sau!
> 
> 
> The following changes since commit fbb734e5753655de30c82c0a036c9043820e02cb:
> 
>   multilib: Use BPN instead of PN for style like lib${PN} (2011-08-03 18:06:04 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage
> 
> Dmitry Eremin-Solenikov (1):
>   eglibc: fix build for armv4 machines
> 
> Kang Kai (1):
>   libnewt: update to 0.52.13
> 
> Koen Kooi (1):
>   gtk-icon-cache bbclass: only add runtime dependencies on
>     hicolor-icon-theme when installing icons
>   ** RP - Will the RDEPENDS be updated correctly? **
> 
> Kumar Gala (2):
>   binutils: Add support for powerpc e5500 core
>   eglibc_2.13: Add support for handling sqrt & sqrtf on powerpc
> 
> Lianhao Lu (1):
>   environment files: Added and unified version related variables.
> 
> Martin Jansa (2):
>   polkit: depend on intltool-native instead of intltool
>   libfm: depend on intltool-native instead of intltool
> 
> Mei Lei (1):
>   aspell: upgrade from 0.60.6 to 0.60.6.1
> 
> Noor, Ahsan (3):
>   bison: Add dependency on flex-native
>   kernel,cml1.bbclass: Move menuconfig to cml1
>   kernel.bbcalss: Added do_savedefconfig task.
> 
> Saul Wold (2):
>   glibc: Remove unused version
>   libxt: Add depends for util-linux and libxcb
> 
> Tom Rini (10):
>   connman_test.sh: Rework for busybox 'ps'
>   sudo: Drop sudo_cv_uid_t_len from site files
>   tcl: Add tcl_cv_api_serial to siteinfo
>   Various site files: Drop monotone
>   Various siteinfo files: Consolidate ac_cv_func_getaddrinfo
>   Various siteinfo files: Drop enca section
>   Various siteinfo files: Consolidate va_copy/__va_copy/va_val_copy
>   site/common-linux: Add ac_cv_file__dev_zero=yes
>   siteinfo: Add posix_getpwuid_r posix_getgrgid_r posix_getpwnam_r to
>     uclibc
>   Various siteinfo: Drop rp-pppoe variables
> 
> Yu Ke (1):
>   SRC_URI, S: use BPN instead of PN for multilib case
> 
> Zhai Edwin (8):
>   lighttpd: Upgrade to 1.4.29
>   libsoup-2.4: Upgrade to 2.34.2
>   libassuan: Upgrade to 2.0.2
>   gpgme: Upgrade to 1.3.1
>   parted: Upgrade to 3.0
>   apr: Upgrade to 1.4.5
>   apr-util: Upgrade to 1.3.12
>   xserver-nodm-init: Fix X start failure on some platform

Merged to master, thanks.

Richard



