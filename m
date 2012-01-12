Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTdQ-0007VJ-1W
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:26:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95014894"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:26:17 -0800
Message-ID: <4F0E7D09.8010803@linux.intel.com>
Date: Wed, 11 Jan 2012 22:26:17 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911223-21116-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1325911223-21116-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V3] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 08:40 PM, Khem Raj wrote:
> Add patch to provide __finite_sqrt functions for ppc
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
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
>   .../eglibc/eglibc-2.15/ppc-sqrt_finite.patch       |  112 ++++++++++++++++++++
>   .../stack-protector-test.patch                     |    0
>   .../use-sysroot-cxx-headers.patch                  |   30 +++--
>   .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29 +++++
>   ...libc-initial_2.14.bb =>  eglibc-initial_2.15.bb} |    0
>   ...eglibc-locale_2.14.bb =>  eglibc-locale_2.15.bb} |    0
>   .../eglibc/{eglibc_2.14.bb =>  eglibc_2.15.bb}      |   16 +++-
>   19 files changed, 172 insertions(+), 15 deletions(-)
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
>

Merged into OE-Core

Thanks
	Sau!


