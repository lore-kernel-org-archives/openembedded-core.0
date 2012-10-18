Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwnP-00062U-RK
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:34:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Oct 2012 13:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="237146575"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga002.fm.intel.com with ESMTP; 18 Oct 2012 13:21:02 -0700
Message-ID: <508064AE.2090901@linux.intel.com>
Date: Thu, 18 Oct 2012 13:21:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
References: <1349964754-29428-1-git-send-email-vladimir_zapolskiy@mentor.com>
In-Reply-To: <1349964754-29428-1-git-send-email-vladimir_zapolskiy@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng: support more compatible hosts
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
X-List-Received-Date: Thu, 18 Oct 2012 20:34:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2012 07:12 AM, Vladimir Zapolskiy wrote:
> THis change extends COMAPTIBLE_HOST matchings, which allows to include more
> hosts with TARGET_OS like linux-gnuspe or linux-gnueabi etc.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> ---
>   meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb     |    4 ++--
>   meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb |    4 ++--
>   meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   |    4 ++--
>   meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    |    4 ++--
>   meta/recipes-kernel/lttng/lttng-ust_0.16.bb          |    4 ++--
>   meta/recipes-support/liburcu/liburcu_0.6.7.bb        |    5 ++---
>   6 files changed, 12 insertions(+), 13 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
> index eaf7eeb..95d65f5 100644
> --- a/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
> +++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.12.bb
> @@ -12,7 +12,7 @@ DEPENDS = "gtk+ util-linux"
>
>   SRCREV = "0d8f8c2ea27df096269aa76b4baeab26b68b95d4"
>   PV = "0.12+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
>
> @@ -25,4 +25,4 @@ do_configure_prepend () {
>   # Due to liburcu not building for MIPS currently this recipe needs to
>   # be limited also.
>   # So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> index 4c78f36..d81e9b8 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> @@ -12,7 +12,7 @@ inherit module
>
>   SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
>   PV = "2.0.pre11+git${SRCREV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
>              file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> @@ -27,4 +27,4 @@ S = "${WORKDIR}/git"
>   # Due to liburcu not building for MIPS currently this recipe needs to
>   # be limited also.
>   # So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> index e7f1016..ab0cf15 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> @@ -13,7 +13,7 @@ DEPENDS = "liburcu popt lttng2-ust"
>
>   SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
>   PV = "v2.0.1+git${SRCREV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
>
> @@ -29,4 +29,4 @@ FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug"
>   # Due to liburcu not building for MIPS currently this recipe needs to
>   # be limited also.
>   # So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> index 8f650a4..5e9a529 100644
> --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> +++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> @@ -14,7 +14,7 @@ DEPENDS = "liburcu util-linux"
>
>   SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
>   PV = "2.0.2+git${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
>
> @@ -27,4 +27,4 @@ do_configure_prepend () {
>   # Due to liburcu not building for MIPS currently this recipe needs to
>   # be limited also.
>   # So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.16.bb b/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
> index e954083..3618a2d 100644
> --- a/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
> +++ b/meta/recipes-kernel/lttng/lttng-ust_0.16.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
>
>   DEPENDS = "liburcu"
>
> -PR = "r0"
> +PR = "r1"
>   PE = "1"
>
>   SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
> @@ -28,5 +28,5 @@ inherit autotools
>   # Due to liburcu not building on MIPS currently this recipe needs to
>   # be limited also.
>   # So here let us first suppport x86/arm/powerpc platforms now.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
>
> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> index be73856..361780c 100644
> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> +++ b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
>                       file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
>                       file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
>
> @@ -20,5 +20,4 @@ inherit autotools
>
>   # liburcu, which is only used by lttng-ust, may not build on other
>   # platforms, like MIPS.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> -
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux.*'
>


