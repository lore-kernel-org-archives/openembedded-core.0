Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvswe-0005sb-Jg
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:03:32 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2012 07:55:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116345705"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 07:55:25 -0800
Message-ID: <4F353DED.7090204@linux.intel.com>
Date: Fri, 10 Feb 2012 07:55:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328724044-5541-1-git-send-email-tom.rini@gmail.com>
In-Reply-To: <1328724044-5541-1-git-send-email-tom.rini@gmail.com>
Cc: Tom Rini <trini@ti.com>
Subject: Re: [PATCH v2] u-boot-fw-utils: Add for v2011.06
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
X-List-Received-Date: Fri, 10 Feb 2012 16:03:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 10:00 AM, Tom Rini wrote:
> From: Tom Rini<trini@ti.com>
>
> This provides the 'fw_setenv' and 'fw_getenv' programs for the target
> so that the U-Boot environment can be modified from Linux.  These
> programs are system-agnostic and rely on a config file that a given BSP
> would provide and potentially RRECOMMEND this be installed.
>
> Signed-off-by: Tom Rini<trini@ti.com>
> ---
>   meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |   26 ++++++++++++++++++++
>   1 files changed, 26 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> new file mode 100644
> index 0000000..3185cbd
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "U-boot bootloader fw_printenv/setenv utils"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
> +                    file://README;beginline=1;endline=22;md5=5ba4218ac89af7846802d0348df3fb90"
> +SECTION = "bootloader"
> +
> +PR = "r0"
> +
> +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "0cc5026aad02f218a9b9ac56b301c97a"
> +SRC_URI[sha256sum] = "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
> +
> +S = "${WORKDIR}/u-boot-${PV}"
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

Merged into OE-core

Thanks
	Sau!


