Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGVc-0001Us-Tq
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:00:17 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Sep 2012 08:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="214466927"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by orsmga002.jf.intel.com with ESMTP; 27 Sep 2012 08:47:23 -0700
Message-ID: <5064750A.1060501@linux.intel.com>
Date: Thu, 27 Sep 2012 08:47:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348591087.31293.83.camel@phil-desktop>
In-Reply-To: <1348591087.31293.83.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] iproute2: Use configured values for ${base_sbindir} and ${libdir}
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
X-List-Received-Date: Thu, 27 Sep 2012 16:00:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 09:38 AM, Phil Blundell wrote:
> These were previously being hard-coded to "/sbin" and "/usr/lib" respectively,
> resulting in unpackaged files if the configured values were something else.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-connectivity/iproute2/iproute2.inc      |    2 +-
>   meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 7caf7d0..d8b1a17 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
>
>   inherit update-alternatives
>
> -EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_KERNEL_DIR}/include DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR=/sbin"
> +EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_KERNEL_DIR}/include DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
>
>   do_install () {
>       oe_runmake DESTDIR=${D} install
> diff --git a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> index fc7292e..c1e9bd3 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> +++ b/meta/recipes-connectivity/iproute2/iproute2_3.5.1.bb
> @@ -1,6 +1,6 @@
>   require iproute2.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/net/${BPN}/${BPN}-${PV}.tar.xz \
>              file://configure-cross.patch"
>

Merged into OE-Core

Thanks
	Sau!



