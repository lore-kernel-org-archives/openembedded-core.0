Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIWP-0007o3-Ke
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:12:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Aug 2011 10:08:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; d="scan'208";a="34704039"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2011 10:08:10 -0700
Message-ID: <4E382EFA.8060604@linux.intel.com>
Date: Tue, 02 Aug 2011 10:08:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311886748-17637-1-git-send-email-galak@kernel.crashing.org>
	<1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311886748-17637-2-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH 2/5] tune/arch-powerpc64: Remove support for soft-float from ppc64
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
X-List-Received-Date: Tue, 02 Aug 2011 17:12:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 01:59 PM, Kumar Gala wrote:
> All 64-bit PPC processors support hard-float so no need to support
> soft-float.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   .../machine/include/powerpc/arch-powerpc64.inc     |    6 ++----
>   1 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index e55910c..a965d59 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -1,10 +1,8 @@
>   TUNEVALID[m64] = "Power ELF64 standard ABI"
> -TUNE_CONFLICTS[m64] = "m32"
> +TUNE_CONFLICTS[m64] = "m32 nf"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>   TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
>
> -AVAILTUNES += "powerpc64 powerpc64-nf"
> +AVAILTUNES += "powerpc64"
>   TUNE_FEATURES_tune-powerpc64 ?= "m64 fpu-hard"
>   BASE_LIB_tune-powerpc64 = "lib64"
> -TUNE_FEATURES_tune-powerpc64-nf ?= "m64 fpu-soft"
> -BASE_LIB_tune-powerpc64-nf = "lib64"

Merged into OE-Core

Thanks
	Sau!



