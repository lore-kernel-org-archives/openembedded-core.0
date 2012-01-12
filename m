Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlEiL-0000ec-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 08:04:46 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Jan 2012 22:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95550865"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga001.jf.intel.com with ESMTP; 11 Jan 2012 22:57:13 -0800
Message-ID: <4F0E8449.3030504@linux.intel.com>
Date: Wed, 11 Jan 2012 22:57:13 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326140011.git.raj.khem@gmail.com>
In-Reply-To: <cover.1326140011.git.raj.khem@gmail.com>
Subject: Re: [PATCH] eglibc upgrade and uclibc fixes
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
X-List-Received-Date: Thu, 12 Jan 2012 07:04:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 12:15 PM, Khem Raj wrote:
>
> These patches address the build failures found when using uclibc
> It also has the already posted patch for eglibc-2.15 upgrade
>
> The following changes since commit fff18970706913e7fd7f4a119d798dddb44b388a:
>
>    base-files: filesystems: fix mount order (2012-01-06 14:41:19 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib kraj/misc-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes
>
> Khem Raj (7):
>    eglibc: Upgrade recipes 2.14 ->  2.15
>    libiconv_1.14.bb: Fix build failure
>    autotools.bbclass: Introduce CACHED_CONFIGUREVARS
>    default-distrovars: Define DISTRO_FEATURES_LIBC for uclibc
>    uclibc: Configure UCLIBC_HAS_WCHAR based on libc-posix-clang-wchar
>      distro feature
>    findutils: Use CACHED_CONFIGUREVARS to specify cached configure vars
>    util-linux: Enable fallocate and use CACHED_CONFIGUREVARS
>
Merged into OE-Core, except for default-distrovars as already discussed

Thanks
	Sau!

>   meta/classes/autotools.bbclass                     |    2 +-
>   meta/conf/distro/include/default-distrovars.inc    |    2 +
>   ...tive_2.14.bb =>  cross-localedef-native_2.15.bb} |    0
>   .../IO-acquire-lock-fix.patch                      |    0
>   .../armv4-eabi-compile-fix.patch                   |    0
>   .../eglibc-rpc-export-again.patch                  |    0
>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>   .../{eglibc-2.14 =>  eglibc-2.15}/etc/ld.so.conf    |    0
>   .../generate-supported.mk                          |    0
>   .../glibc-2.14-libdl-crash.patch                   |    0
>   .../ld-search-order.patch                          |    0
>   .../mips-rld-map-check.patch                       |    0
>   .../multilib_readlib.patch                         |    0
>   .../{eglibc-2.14 =>  eglibc-2.15}/ppc-sqrt.patch    |    0
>   .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 +
>   .../stack-protector-test.patch                     |    0
>   .../use-sysroot-cxx-headers.patch                  |   30 +-
>   .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29 +
>   ...libc-initial_2.14.bb =>  eglibc-initial_2.15.bb} |    0
>   ...eglibc-locale_2.14.bb =>  eglibc-locale_2.15.bb} |    0
>   .../eglibc/{eglibc_2.14.bb =>  eglibc_2.15.bb}      |   16 +-
>   meta/recipes-core/uclibc/uclibc-config.inc         |    1 +
>   meta/recipes-core/util-linux/util-linux_2.20.1.bb  |    6 +-
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +-
>   .../libiconv-1.14/add-relocatable-module.patch     | 5008 ++++++++++++++++++++
>   meta/recipes-support/libiconv/libiconv_1.14.bb     |    8 +-
>   26 files changed, 5195 insertions(+), 23 deletions(-)
>   rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb =>  cross-localedef-native_2.15.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/IO-acquire-lock-fix.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/armv4-eabi-compile-fix.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/eglibc-rpc-export-again.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/eglibc-svn-arm-lowlevellock-include-tls.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/etc/ld.so.conf (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/generate-supported.mk (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/glibc-2.14-libdl-crash.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/ld-search-order.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/mips-rld-map-check.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/multilib_readlib.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/ppc-sqrt.patch (100%)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt_finite.patch
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/stack-protector-test.patch (100%)
>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/use-sysroot-cxx-headers.patch (51%)
>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>   rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb =>  eglibc-initial_2.15.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb =>  eglibc-locale_2.15.bb} (100%)
>   rename meta/recipes-core/eglibc/{eglibc_2.14.bb =>  eglibc_2.15.bb} (95%)
>   create mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch
>


