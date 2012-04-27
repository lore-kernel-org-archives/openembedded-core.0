Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsKM-000807-CP
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:03:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2012 13:54:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134549922"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2012 13:54:02 -0700
Message-ID: <4F9B076A.8090701@linux.intel.com>
Date: Fri, 27 Apr 2012 13:54:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1335382089-18056-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/3] u-boot-fw-utils: update 2012.04 to 2012.04.01 release
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
X-List-Received-Date: Fri, 27 Apr 2012 21:03:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2012 12:28 PM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../u-boot/u-boot-fw-utils_2012.04.01.bb           |   33 ++++++++++++++++++++
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 --------------------
>   2 files changed, 33 insertions(+), 33 deletions(-)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
>   delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> new file mode 100644
> index 0000000..fe3422a
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.01.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> +SECTION = "bootloader"
> +
> +DEPENDS = "mtd-utils"
> +
> +# This is needs to be validated among supported BSP's before we can
> +# make it default
> +DEFAULT_PREFERENCE = "-1"
> +
> +# This revision corresponds to the tag "v2012.04.01"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV = "415d386877df49eb051b85ef74fa59a16dc17c7d"
> +
> +PV = "v2012.04.01+git${SRCPV}"
> +
> +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> +
> +do_compile () {
> +  oe_runmake env
> +}
> +
> +do_install () {
> +  install -d ${D}${base_sbindir}
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> +  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> +}
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
> deleted file mode 100644
> index 5ddb9f9..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> -LICENSE = "GPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
> -SECTION = "bootloader"
> -
> -DEPENDS = "mtd-utils"
> -
> -# This is needs to be validated among supported BSP's before we can
> -# make it default
> -DEFAULT_PREFERENCE = "-1"
> -
> -# This revision corresponds to the tag "v2012.04"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV = "2790bf69dc12fb9aeb9836904e5f57c7f83d5552"
> -
> -PV = "v2012.04+git${SRCPV}"
> -
> -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> -
> -S = "${WORKDIR}/git"
> -
> -EXTRA_OEMAKE = 'HOSTCC="${CC}"'
> -
> -do_compile () {
> -  oe_runmake env
> -}
> -
> -do_install () {
> -  install -d ${D}${base_sbindir}
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> -}


Merged all three of this series into OE-Core

Thanks
	Sau!


