Return-Path: <denis@denix.org>
X-Greylist: delayed 3605 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Jan 2015 21:19:40 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id CBE4865CAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 21:19:40 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIH00L0BSFYJK21@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 20 Jan 2015 14:19:16 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=sozttTNsAAAA:8 a=x2GZnTqNAAAA:8
	a=voM4FWlXAAAA:8 a=Q4-j1AaZAAAA:8	a=onO9vipNmQiYiouReCsA:9
	a=MQkpD8RUycDADjaD:21 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 21F95202F0; Tue,
	20 Jan 2015 15:19:08 -0500 (EST)
Date: Tue, 20 Jan 2015 15:19:08 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20150120201908.GE20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1421165391-30203-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot: update to 2015.01
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Jan 2015 21:19:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping.


On Tue, Jan 13, 2015 at 11:09:51AM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  ...2014.07.bb => u-boot-fw-utils-cross_2015.01.bb} | 11 ++++---
>  .../0001-tools-env-fix-build-error.patch           | 36 ++++++++++++++++++++++
>  ...utils_2014.07.bb => u-boot-fw-utils_2015.01.bb} | 12 +++++---
>  ...kimage_2014.07.bb => u-boot-mkimage_2015.01.bb} | 20 ++++++------
>  meta/recipes-bsp/u-boot/u-boot.inc                 |  2 +-
>  .../{u-boot_2014.07.bb => u-boot_2015.01.bb}       |  6 ++--
>  6 files changed, 62 insertions(+), 25 deletions(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils-cross_2014.07.bb => u-boot-fw-utils-cross_2015.01.bb} (76%)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2014.07.bb => u-boot-fw-utils_2015.01.bb} (69%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2014.07.bb => u-boot-mkimage_2015.01.bb} (45%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2014.07.bb => u-boot_2015.01.bb} (50%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb
> similarity index 76%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb
> index d1f1f9a..e826b89 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2015.01.bb
> @@ -1,17 +1,18 @@
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
>  SECTION = "bootloader"
>  DEPENDS = "mtd-utils"
>  
> -# This revision corresponds to the tag "v2014.07"
> +# This revision corresponds to the tag "v2015.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> +SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
>  
> -PV = "v2014.07+git${SRCPV}"
> +PV = "v2015.01+git${SRCPV}"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
> +           file://0001-tools-env-fix-build-error.patch"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> new file mode 100644
> index 0000000..381b505
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils/0001-tools-env-fix-build-error.patch
> @@ -0,0 +1,36 @@
> +From ee2d75513452aa6d5306fd380104adc8a2f6d8f2 Mon Sep 17 00:00:00 2001
> +From: Masahiro Yamada <yamada.m@jp.panasonic.com>
> +Date: Wed, 3 Dec 2014 10:22:50 +0900
> +Subject: [PATCH] tools: env: fix build error
> +
> +Since CONFIG_SYS_ARCH, CONFIG_SYS_CPU, ... were moved to Kconfig,
> +tools/env/fw_printenv fails to build if CONFIG_ENV_VARS_UBOOT_CONFIG
> +is defined.
> +(I do not think this is the right way to fix the problem, but
> +for now I do not have enough time to take a close look.)
> +
> +Upstream-Status: Submitted [http://patchwork.ozlabs.org/patch/417192/]
> +
> +Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> +Reported-by: Denys Dmytriyenko <denys@ti.com>
> +---
> + tools/env/fw_env.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/tools/env/fw_env.c b/tools/env/fw_env.c
> +index 1173eea..698fe51 100644
> +--- a/tools/env/fw_env.c
> ++++ b/tools/env/fw_env.c
> +@@ -8,6 +8,9 @@
> +  * SPDX-License-Identifier:	GPL-2.0+
> +  */
> + 
> ++/* FIXME: Do not include this */
> ++#include <linux/kconfig.h>
> ++
> + #include <errno.h>
> + #include <env_flags.h>
> + #include <fcntl.h>
> +-- 
> +2.2.0
> +
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
> similarity index 69%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
> index a626c95..50d1974 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.01.bb
> @@ -1,21 +1,23 @@
>  SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
>  SECTION = "bootloader"
>  DEPENDS = "mtd-utils"
>  
> -# This revision corresponds to the tag "v2014.07"
> +# This revision corresponds to the tag "v2015.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> +SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
>  
> -PV = "v2014.07+git${SRCPV}"
> +PV = "v2015.01+git${SRCPV}"
>  
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git \
> +           file://0001-tools-env-fix-build-error.patch"
>  
>  S = "${WORKDIR}/git"
>  
>  INSANE_SKIP_${PN} = "already-stripped"
> +EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}"'
>  
>  inherit uboot-config
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
> similarity index 45%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
> index eabf680..1bfdf9d 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb
> @@ -1,28 +1,26 @@
>  SUMMARY = "U-Boot bootloader image creation tool"
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
>  SECTION = "bootloader"
>  
> -# This revision corresponds to the tag "v2014.07"
> +DEPENDS = "openssl"
> +
> +# This revision corresponds to the tag "v2015.01"
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> +SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
>  
> -PV = "v2014.07+git${SRCPV}"
> +PV = "v2015.01+git${SRCPV}"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
>  
>  S = "${WORKDIR}/git"
>  
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}" HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> +EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}" STRIP=true'
>  
>  do_compile () {
> -	# Make sure the recompile is OK
> -	rm -f ${B}/tools/.depend
> -
> -	make HOSTCC="${BUILD_CC}" HOSTLD="${BUILD_LD}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTSTRIP=true dot-config=0 scripts_basic
> -	sed 's/^tools-only: scripts_basic /tools-only: /' -i Makefile
> -	oe_runmake tools-only
> +	oe_runmake sandbox_defconfig
> +	oe_runmake cross_tools NO_SDL=1
>  }
>  
>  do_install () {
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index c695b73..4edab84 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -4,7 +4,7 @@ SECTION = "bootloaders"
>  PROVIDES = "virtual/bootloader"
>  
>  LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> +LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
>  
>  SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
>  
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
> similarity index 50%
> rename from meta/recipes-bsp/u-boot/u-boot_2014.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2015.01.bb
> index 44cc52e..6feac31 100644
> --- a/meta/recipes-bsp/u-boot/u-boot_2014.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot_2015.01.bb
> @@ -2,8 +2,8 @@ require u-boot.inc
>  
>  DEPENDS += "dtc-native"
>  
> -# This revision corresponds to the tag "v2014.07"
> +# This revision corresponds to the tag "v2015.01"
>  # We use the revision in order to avoid having to fetch it from the repo during parse
> -SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> +SRCREV = "92fa7f53f1f3f03296f8ffb14bdf1baefab83368"
>  
> -PV = "v2014.07+git${SRCPV}"
> +PV = "v2015.01+git${SRCPV}"
> -- 
> 2.2.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

