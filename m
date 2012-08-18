Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2ZDt-0002b0-Ha
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 04:57:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Aug 2012 19:45:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,789,1336374000"; d="scan'208";a="187989516"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2012 19:45:03 -0700
Message-ID: <502F01AF.20605@linux.intel.com>
Date: Fri, 17 Aug 2012 19:45:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1345222136-24839-1-git-send-email-trini@ti.com>
	<1345222136-24839-4-git-send-email-trini@ti.com>
In-Reply-To: <1345222136-24839-4-git-send-email-trini@ti.com>
Cc: Tom Rini <trini@ti.com>
Subject: Re: [PATCH 4/5] u-boot-mkimage: Update to v2012.07
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
X-List-Received-Date: Sat, 18 Aug 2012 02:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 09:48 AM, Tom Rini wrote:
> Signed-off-by: Tom Rini <trini@ti.com>
> ---
>   .../u-boot/u-boot-mkimage_2012.04.01.bb            |   35 --------------------
>   meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb  |   33 ++++++++++++++++++
>   2 files changed, 33 insertions(+), 35 deletions(-)
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> deleted file mode 100644
> index 4d05202..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.04.01.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -DESCRIPTION = "U-boot bootloader mkimage tool"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> -SECTION = "bootloader"
> -
> -PR = "r1"
> -
> -# This is needs to be validated among supported BSP's before we can
> -# make it default
> -DEFAULT_PREFERENCE = "-1"
> -
> -# This revision corresponds to the tag "v2012.04.01"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
> -
> -PV = "v2012.04.01+git${SRCPV}"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> -
> -do_compile () {
> -  oe_runmake tools
> -}
> -
> -do_install () {
> -  install -d ${D}${bindir}
> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
> new file mode 100644
> index 0000000..d30a648
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2012.07.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "U-boot bootloader mkimage tool"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +SECTION = "bootloader"
> +
> +# This is needs to be validated among supported BSP's before we can
> +# make it default
> +DEFAULT_PREFERENCE = "-1"
> +
> +# This revision corresponds to the tag "v2012.07"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "190649fb4309d1bc0fe7732fd0f951cb6440f935"
> +
> +PV = "v2012.07+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTCFLAGS="${CFLAGS} HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
> +
> +do_compile () {
> +  oe_runmake tools
> +}
> +
> +do_install () {
> +  install -d ${D}${bindir}
> +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
> +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +}
> +
> +BBCLASSEXTEND = "native nativesdk"
>

Seems to be an issue with this:
> ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-mkimage-2011.06-r1/temp/log.do_install.61586 for further information)
> ERROR: Logfile of failure stored in: /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-mkimage-2011.06-r1/temp/log.do_install.61586
> Log data follows:
> | DEBUG: Executing shell function do_install
> | install: cannot stat `tools/mkimage': No such file or directory
> | ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/u-boot-mkimage-2011.06-r1/temp/log.do_install.61586 for further information)
> NOTE: package u-boot-mkimage-2011.06-r1: task do_install: Failed
> ERROR: Task 3190 (/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-world/build/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb, do_install) failed with exit code '1'


Sau!




