Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 143106BAB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 17:55:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2013 10:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,960,1367996400"; d="scan'208";a="393616957"
Received: from unknown (HELO [10.255.14.139]) ([10.255.14.139])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2013 10:55:36 -0700
Message-ID: <521B9698.7030803@linux.intel.com>
Date: Mon, 26 Aug 2013 10:55:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
In-Reply-To: <CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Mon, 26 Aug 2013 17:55:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2013 09:57 AM, Laszlo Papp wrote:
> Any update? It would be nice not to miss the freeze ... ;-)
>
This has been merged, and I was informed by the QA team that it works 
correctly for the mpc8315e-rdb and beagleboard, but NOT the beagleboard XM.

So maintaining this as DEFAULT_PREFERENCE = "-1" is correct for now, 
until the XM issue can be resolved.

Thanks for the contribution.

Sau!

>
> On Fri, Aug 23, 2013 at 10:48 AM, Laszlo Papp <lpapp@kde.org
> <mailto:lpapp@kde.org>> wrote:
>
>     Signed-off-by: Laszlo Papp <lpapp@kde.org <mailto:lpapp@kde.org>>
>     ---
>       meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>     <http://u-boot-mkimage_2013.07.bb> | 27 +++++++++++++++++++++++
>       meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>     <http://u-boot_2013.07.bb>         | 23 +++++++++++++++++++
>       2 files changed, 50 insertions(+)
>       create mode 100644
>     meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>     <http://u-boot-mkimage_2013.07.bb>
>       create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>     <http://u-boot_2013.07.bb>
>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>     <http://u-boot-mkimage_2013.07.bb>
>     b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>     <http://u-boot-mkimage_2013.07.bb>
>     new file mode 100644
>     index 0000000..0108e00
>     --- /dev/null
>     +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>     <http://u-boot-mkimage_2013.07.bb>
>     @@ -0,0 +1,27 @@
>     +DESCRIPTION = "U-boot bootloader mkimage tool"
>     +LICENSE = "GPLv2+"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>     +
>       file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>     +SECTION = "bootloader"
>     +
>     +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>     +
>     +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
>     +SRC_URI[sha256sum] =
>     "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
>     +
>     +S = "${WORKDIR}/u-boot-${PV}"
>     +
>     +BBCLASSEXTEND = "native nativesdk"
>     +
>     +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}"
>     HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>     +
>     +do_compile () {
>     +  oe_runmake tools
>     +}
>     +
>     +do_install () {
>     +  install -d ${D}${bindir}
>     +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>     +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>     +}
>     +
>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>     <http://u-boot_2013.07.bb>
>     b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb <http://u-boot_2013.07.bb>
>     new file mode 100644
>     index 0000000..f3f4b62
>     --- /dev/null
>     +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>     <http://u-boot_2013.07.bb>
>     @@ -0,0 +1,23 @@
>     +require u-boot.inc
>     +
>     +# To build u-boot for your machine, provide the following lines in
>     your machine
>     +# config, replacing the assignments as appropriate for your machine.
>     +# UBOOT_MACHINE = "omap3_beagle_config"
>     +# UBOOT_ENTRYPOINT = "0x80008000"
>     +# UBOOT_LOADADDRESS = "0x80008000"
>     +
>     +LICENSE = "GPLv2+"
>     +LIC_FILES_CHKSUM =
>     "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>     +
>       file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>     +
>     +# This revision corresponds to the tag "v2013.07"
>     +# We use the revision in order to avoid having to fetch it from the
>     repo during parse
>     +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>     +
>     +PV = "v2013.07+git${SRCPV}"
>     +
>     +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git
>     <http://git.denx.de/u-boot.git;branch=master;protocol=git>"
>     +
>     +S = "${WORKDIR}/git"
>     +
>     +PACKAGE_ARCH = "${MACHINE_ARCH}"
>     --
>     1.8.3.4
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

