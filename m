Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sr9Zo-0000Ca-SW
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 17:20:41 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jul 2012 08:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="178811585"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jul 2012 08:09:20 -0700
Message-ID: <50058020.1000306@linux.intel.com>
Date: Tue, 17 Jul 2012 08:09:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20120616065104.GA3140@jama.jama.net>
	<1341649914-18419-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1341649914-18419-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] conf/machine: replace TUNE_CONFLICTS with TUNECONFLICTS
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
X-List-Received-Date: Tue, 17 Jul 2012 15:20:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2012 01:31 AM, Martin Jansa wrote:
> * it wasn't consistent with other machine configs
> * reported 2 months ago..
>    http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/022154.html
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/conf/machine/include/arm/arch-armv5.inc       |    2 +-
>   meta/conf/machine/include/arm/arch-armv6.inc       |    2 +-
>   meta/conf/machine/include/arm/arch-armv7a.inc      |    2 +-
>   .../machine/include/powerpc/arch-powerpc64.inc     |    2 +-
>   meta/conf/machine/include/tune-mips32.inc          |    2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/conf/machine/include/arm/arch-armv5.inc b/meta/conf/machine/include/arm/arch-armv5.inc
> index 4a75530..98780e5 100644
> --- a/meta/conf/machine/include/arm/arch-armv5.inc
> +++ b/meta/conf/machine/include/arm/arch-armv5.inc
> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv5"
>   ARMPKGARCH ?= "armv5"
>
>   TUNEVALID[armv5] = "Enable instructions for ARMv5"
> -TUNE_CONFLICTS[armv5] = "armv4"
> +TUNECONFLICTS[armv5] = "armv4"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}"
>   MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv5", ":armv5", "" ,d)}"
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6.inc b/meta/conf/machine/include/arm/arch-armv6.inc
> index da8274e..f0fee93 100644
> --- a/meta/conf/machine/include/arm/arch-armv6.inc
> +++ b/meta/conf/machine/include/arm/arch-armv6.inc
> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv6"
>   ARMPKGARCH ?= "armv6"
>
>   TUNEVALID[armv6] = "Enable instructions for ARMv6"
> -TUNE_CONFLICTS[armv6] = "armv4 armv5"
> +TUNECONFLICTS[armv6] = "armv4 armv5"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv6", "-march=armv6", "", d)}"
>   MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv6", ":armv6", "" ,d)}"
>
> diff --git a/meta/conf/machine/include/arm/arch-armv7a.inc b/meta/conf/machine/include/arm/arch-armv7a.inc
> index c90aff5..f439de7 100644
> --- a/meta/conf/machine/include/arm/arch-armv7a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv7a.inc
> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "armv7a"
>   ARMPKGARCH ?= "armv7a"
>
>   TUNEVALID[armv7a] = "Enable instructions for ARMv7-a"
> -TUNE_CONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
> +TUNECONFLICTS[armv7a] = "armv4 armv5 armv6 armv7"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "armv7a", "-march=armv7-a -fno-tree-vectorize", "", d)}"
>   MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "armv7a", ":armv7a", "" ,d)}"
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> index a5e9755..f9e2b2a 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "powerpc64"
>   require conf/machine/include/powerpc/arch-powerpc.inc
>
>   TUNEVALID[m64] = "Power ELF64 standard ABI"
> -TUNE_CONFLICTS[m64] = "m32 nf"
> +TUNECONFLICTS[m64] = "m32 nf"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m64", "", d)}"
>   TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "powerpc64", "", d)}"
>
> diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/tune-mips32.inc
> index 93ed5ee..03cd411 100644
> --- a/meta/conf/machine/include/tune-mips32.inc
> +++ b/meta/conf/machine/include/tune-mips32.inc
> @@ -3,7 +3,7 @@ DEFAULTTUNE ?= "mips32"
>   require conf/machine/include/mips/arch-mips.inc
>
>   TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
> -TUNE_CONFLICTS[mips32] = "n64 n32"
> +TUNECONFLICTS[mips32] = "n64 n32"
>   TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32", "-march=mips32", "", d)}"
>
>   AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
>



