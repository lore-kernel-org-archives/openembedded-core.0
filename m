Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R1VdW-00014S-7A
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 05:50:46 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Sep 2011 20:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,348,1312182000"; d="scan'208";a="46631781"
Received: from unknown (HELO [10.255.14.148]) ([10.255.14.148])
	by azsmga001.ch.intel.com with ESMTP; 07 Sep 2011 20:45:42 -0700
Message-ID: <4E683A65.30607@linux.intel.com>
Date: Wed, 07 Sep 2011 20:45:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1315294422-3097-1-git-send-email-denis@eukrea.com>
	<1315294779-3295-1-git-send-email-denis@eukrea.com>
In-Reply-To: <1315294779-3295-1-git-send-email-denis@eukrea.com>
Subject: Re: [PATCH v2] busybox: update to 1.8.5
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
X-List-Received-Date: Thu, 08 Sep 2011 03:50:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2011 12:39 AM, Denis Carikli wrote:
> Signed-off-by: Denis Carikli<denis@eukrea.com>
> ---
>   .../B921600.patch                                  |    0
>   .../busybox-appletlib-dependency.patch             |    0
>   .../busybox-udhcpc-no_deconfig.patch               |    0
>   .../{busybox-1.18.4 =>  busybox-1.18.5}/defconfig   |    0
>   .../get_header_tar.patch                           |    0
>   .../run-parts.in.usr-bin.patch                     |    0
>   .../udhcpc-fix-nfsroot.patch                       |    0
>   .../udhcpscript.patch                              |    0
>   .../{busybox_1.18.4.bb =>  busybox_1.18.5.bb}       |    6 +++---
>   9 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/B921600.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/busybox-appletlib-dependency.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/busybox-udhcpc-no_deconfig.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/defconfig (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/get_header_tar.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/run-parts.in.usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/udhcpc-fix-nfsroot.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.18.4 =>  busybox-1.18.5}/udhcpscript.patch (100%)
>   rename meta/recipes-core/busybox/{busybox_1.18.4.bb =>  busybox_1.18.5.bb} (85%)
>
merged into OE-Core

Thanks
	Sau!


> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/B921600.patch b/meta/recipes-core/busybox/busybox-1.18.5/B921600.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/B921600.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/B921600.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/busybox-appletlib-dependency.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/busybox-appletlib-dependency.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/busybox-udhcpc-no_deconfig.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/busybox-udhcpc-no_deconfig.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/defconfig b/meta/recipes-core/busybox/busybox-1.18.5/defconfig
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/defconfig
> rename to meta/recipes-core/busybox/busybox-1.18.5/defconfig
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/get_header_tar.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/get_header_tar.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/run-parts.in.usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/run-parts.in.usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch b/meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/udhcpc-fix-nfsroot.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/udhcpc-fix-nfsroot.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch b/meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.18.4/udhcpscript.patch
> rename to meta/recipes-core/busybox/busybox-1.18.5/udhcpscript.patch
> diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.5.bb
> similarity index 85%
> rename from meta/recipes-core/busybox/busybox_1.18.4.bb
> rename to meta/recipes-core/busybox/busybox_1.18.5.bb
> index b2053ee..c0dc1d4 100644
> --- a/meta/recipes-core/busybox/busybox_1.18.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.18.5.bb
> @@ -1,5 +1,5 @@
>   require busybox.inc
> -PR = "r9"
> +PR = "r0"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://udhcpscript.patch \
> @@ -25,7 +25,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://umount.busybox \
>              file://defconfig"
>
> -SRC_URI[tarball.md5sum] = "b03c5b46ced732679e525a920a1a62f5"
> -SRC_URI[tarball.sha256sum] = "4d24d37bd6f1bd153e8cf9a984ec2f32f18464f73ca535e2cc2e8be9694097fa"
> +SRC_URI[tarball.md5sum] = "96dd43cc7cee4017a6bf31b7da82a1f5"
> +SRC_URI[tarball.sha256sum] = "10954fcd5c48d8a262a3497b16227bf983a05658bf2bf661af2fdeca773f2fc0"
>
>   EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"


