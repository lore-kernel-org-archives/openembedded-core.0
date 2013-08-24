Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 59E1F6A964
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 04:31:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Aug 2013 21:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,946,1367996400"; d="scan'208";a="391272561"
Received: from unknown (HELO [10.255.15.65]) ([10.255.15.65])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 21:31:58 -0700
Message-ID: <5218373E.1020907@linux.intel.com>
Date: Fri, 23 Aug 2013 21:31:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>, 
 Otavio Salvador <otavio@ossystems.com.br>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<CAOMwXhNWFicCJ1C4-Cd+9shAhTGuXkFu+885R8NfMurEZ+6rCQ@mail.gmail.com>
	<5217DAA6.8030008@linux.intel.com>
In-Reply-To: <5217DAA6.8030008@linux.intel.com>
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
X-List-Received-Date: Sat, 24 Aug 2013 04:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2013 02:56 PM, Saul Wold wrote:
> On 08/23/2013 09:57 AM, Laszlo Papp wrote:
>> Any update? It would be nice not to miss the freeze ... ;-)
>>
> I had some networking issues this morning, and I am pulling together
> patches now.  This was build on the Autobuilders last night and there a
> a problem with meta-fsl-ppc-lsb build, I am not sure if it's a transient
> issue or a real one.
>
> I have not look into it yet.  The high level logs can be found here:
> http://autobuilder.yoctoproject.org:8011/builders/nightly-fsl-ppc-lsb/builds/231/steps/Building%20Images/logs/stdio
>
As I said above I had not looked into this yet, after looking at it a 
little further this is an issue with the u-boot_git recipe that 
FreeScale PPC is using, so not an issue for you to worry about.

Sorry for the alarm.

Sau!

>
> As you might have seen I rejected Otavio's patch and am working to
> include this one.  It will still need the rest of the maintainers to
> review.
>
> Thanks for your time and effort.
>
> Sau!
>
>>
>> On Fri, Aug 23, 2013 at 10:48 AM, Laszlo Papp <lpapp@kde.org
>> <mailto:lpapp@kde.org>> wrote:
>>
>>     Signed-off-by: Laszlo Papp <lpapp@kde.org <mailto:lpapp@kde.org>>
>>     ---
>>       meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>     <http://u-boot-mkimage_2013.07.bb> | 27 +++++++++++++++++++++++
>>       meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>     <http://u-boot_2013.07.bb>         | 23 +++++++++++++++++++
>>       2 files changed, 50 insertions(+)
>>       create mode 100644
>>     meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>     <http://u-boot-mkimage_2013.07.bb>
>>       create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>     <http://u-boot_2013.07.bb>
>>
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>     <http://u-boot-mkimage_2013.07.bb>
>>     b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>     <http://u-boot-mkimage_2013.07.bb>
>>     new file mode 100644
>>     index 0000000..0108e00
>>     --- /dev/null
>>     +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>     <http://u-boot-mkimage_2013.07.bb>
>>     @@ -0,0 +1,27 @@
>>     +DESCRIPTION = "U-boot bootloader mkimage tool"
>>     +LICENSE = "GPLv2+"
>>     +LIC_FILES_CHKSUM =
>>     "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>     +
>>
>> file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>>
>>     +SECTION = "bootloader"
>>     +
>>     +SRC_URI = "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>>     +
>>     +SRC_URI[md5sum] = "8445162690052e6afd4b8f87af2bb557"
>>     +SRC_URI[sha256sum] =
>>     "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
>>     +
>>     +S = "${WORKDIR}/u-boot-${PV}"
>>     +
>>     +BBCLASSEXTEND = "native nativesdk"
>>     +
>>     +EXTRA_OEMAKE = 'HOSTCC="${CC}" HOSTLD="${LD}"
>>     HOSTLDFLAGS="${LDFLAGS}" HOSTSTRIP=true'
>>     +
>>     +do_compile () {
>>     +  oe_runmake tools
>>     +}
>>     +
>>     +do_install () {
>>     +  install -d ${D}${bindir}
>>     +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>>     +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>>     +}
>>     +
>>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>     <http://u-boot_2013.07.bb>
>>     b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>> <http://u-boot_2013.07.bb>
>>     new file mode 100644
>>     index 0000000..f3f4b62
>>     --- /dev/null
>>     +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>     <http://u-boot_2013.07.bb>
>>     @@ -0,0 +1,23 @@
>>     +require u-boot.inc
>>     +
>>     +# To build u-boot for your machine, provide the following lines in
>>     your machine
>>     +# config, replacing the assignments as appropriate for your machine.
>>     +# UBOOT_MACHINE = "omap3_beagle_config"
>>     +# UBOOT_ENTRYPOINT = "0x80008000"
>>     +# UBOOT_LOADADDRESS = "0x80008000"
>>     +
>>     +LICENSE = "GPLv2+"
>>     +LIC_FILES_CHKSUM =
>>     "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
>>     +
>>
>> file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
>>
>>     +
>>     +# This revision corresponds to the tag "v2013.07"
>>     +# We use the revision in order to avoid having to fetch it from the
>>     repo during parse
>>     +SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>>     +
>>     +PV = "v2013.07+git${SRCPV}"
>>     +
>>     +SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git
>>     <http://git.denx.de/u-boot.git;branch=master;protocol=git>"
>>     +
>>     +S = "${WORKDIR}/git"
>>     +
>>     +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>     --
>>     1.8.3.4
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

