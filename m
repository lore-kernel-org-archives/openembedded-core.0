Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id F23496AF21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:26:45 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so342933pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 00:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=7bEvtNNC0vWbrgypU+eOL5eX3XGVP4puilR66pWz/84=;
	b=nnYD6gAkl8EMkYxfF00LAAnuJ2B/OBwfvYZPpAA81xDp9kieCRJ8SdUSJ9U/440dBw
	MJXRJ9PWSTWUaMmQWLE+usschZSHo2YY/4S3LRWq7Iy4JksiPrt8z7X6B7hViRe8jHg1
	2sNgMkSBSzCznZbsjUbWaECFIn0OGG1ap7HEbWX6xfMXxn7p5+P+SvmvTr1uDiIWrVji
	mbtGWNZGQWXvxinr1EViuYAcMVmDMHuFIPn/I8VbHUWz4sgkaj1evYqKOnjz4AGO7dyj
	7eGJT/20Sj4X4+91k+Ub8id+S0bQ/aO4Kzblqqgrs/ybKeC0FEkrXzs2Aa5ezORyEYLx
	y/5w==
X-Gm-Message-State: ALoCoQnVxxXnWqJGMmqxKJSz3/Hcj0H21YqRQzaOz5nvy1O4fZLV5OTYdVsoIuk6AUfGFMupIGck
MIME-Version: 1.0
X-Received: by 10.68.223.225 with SMTP id qx1mr9511215pbc.157.1377242806949;
	Fri, 23 Aug 2013 00:26:46 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Fri, 23 Aug 2013 00:26:46 -0700 (PDT)
In-Reply-To: <CAOMwXhO1E6UVTjfywQaBV=+EcA3ZDnNeqW1FgXfmz2jsBp1gEg@mail.gmail.com>
References: <1377203796-1744-1-git-send-email-lpapp@kde.org>
	<CAOMwXhO1E6UVTjfywQaBV=+EcA3ZDnNeqW1FgXfmz2jsBp1gEg@mail.gmail.com>
Date: Fri, 23 Aug 2013 08:26:46 +0100
X-Google-Sender-Auth: 1_YbxSUgH2ef2KwLp-cR6yohQxA
Message-ID: <CAOMwXhPCg==vFynos+VCbXS65FH9ANBY05KRRH6QFS=gv896EA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 23 Aug 2013 07:26:46 -0000
Content-Type: multipart/alternative; boundary=047d7b160515472a4f04e49854f2

--047d7b160515472a4f04e49854f2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I do not think my u-boot work is welcome, so I will withdraw this one, too.

I submitted the version before, without deleting the old variants, then
some people told me they should be removed as it was tested that the new
version should work.

Now, it has again been argued on IRC that it should not have been and my
way should have been done. Well, I am done with this. Do whatever you wish
with u-boot. As for me, this ping-pong arguing is just demotivating to get
contributions accepted.


On Thu, Aug 22, 2013 at 10:14 PM, Laszlo Papp <lpapp@kde.org> wrote:

> Please provide feedback. I would like to get this into poky 1.5. Thanks!
>
>
> On Thu, Aug 22, 2013 at 9:36 PM, Laszlo Papp <lpapp@kde.org> wrote:
>
>> Signed-off-by: Laszlo Papp <lpapp@kde.org>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb | 28 --------
>>  ...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------
>>  ...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82
>> ----------------------
>>  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb  | 31 --------
>>  meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb  | 29 --------
>>  .../u-boot/u-boot-mkimage_2013.01.01.bb            | 33 ---------
>>  meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb  | 27 +++++++
>>  meta/recipes-bsp/u-boot/u-boot_2011.03.bb          | 24 -------
>>  meta/recipes-bsp/u-boot/u-boot_2011.06.bb          | 24 -------
>>  meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb       | 29 --------
>>  meta/recipes-bsp/u-boot/u-boot_2013.07.bb          | 23 ++++++
>>  11 files changed, 50 insertions(+), 319 deletions(-)
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>>  delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-includ=
e-in-tools-imximage.h.patch
>>  delete mode 100644
>> meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCR=
IPT-processing-to-the-top-level-.patch
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
>>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>  delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
>>  create mode 100644 meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bbb/meta/re=
cipes-bsp/u-boot/
>> u-boot-fw-utils_2011.06.bb
>> deleted file mode 100644
>> index 7c4df1a..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader fw_printenv/setenv utils"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>>  file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d034=
8df3fb90"
>> -SECTION =3D "bootloader"
>> -
>> -DEPENDS =3D "mtd-utils"
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
>> -SRC_URI[sha256sum] =3D
>> "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}"'
>> -
>> -do_compile () {
>> -  oe_runmake env
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${base_sbindir}
>> -  install -m 755 ${S}/tools/env/fw_printenv
>> ${D}${base_sbindir}/fw_printenv
>> -  install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_sete=
nv
>> -}
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> deleted file mode 100644
>> index 0405834..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-incl=
ude-in-tools-imximage.h.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001
>> -From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D <loic.minier@linaro.org>
>> -Date: Thu, 3 Feb 2011 15:07:01 +0100
>> -Subject: Drop config.h include in tools/imximage.h
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=3DUTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Upstream-Status: Accepted
>> -
>> -"make tools-all" should allow building tools such as mkimage and the ne=
w
>> -imximage without any config, but imximage.c currently fails to build
>> -with:
>> -imximage.h:27:20: error: config.h: No such file or directory
>> -
>> -config.h is not needed in imximage.h nor in imximage.c, and imximage.h
>> -is only included from imximage.c, so drop this include to fix the build=
.
>> -
>> -Signed-off-by: Lo=EFc Minier <loic.minier@linaro.org>
>> ----
>> - tools/imximage.h |    2 --
>> - 1 files changed, 0 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/tools/imximage.h b/tools/imximage.h
>> -index 38ca6be..d126a46 100644
>> ---- a/tools/imximage.h
>> -+++ b/tools/imximage.h
>> -@@ -24,8 +24,6 @@
>> - #ifndef _IMXIMAGE_H_
>> - #define _IMXIMAGE_H_
>> -
>> --#include <config.h>
>> --
>> - #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set
>> for v2 */
>> - #define MAX_HW_CFG_SIZE_V1 60  /* Max number of registers imx can set
>> for v1 */
>> - #define APP_CODE_BARKER       0xB1
>> ---
>> -1.7.4.4
>> -
>> diff --git
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> b/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> deleted file mode 100644
>> index 5729cd9..0000000
>> ---
>> a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LDS=
CRIPT-processing-to-the-top-level-.patch
>> +++ /dev/null
>> @@ -1,82 +0,0 @@
>> -From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001
>> -From: Ilya Yanok <yanok@emcraft.com>
>> -Date: Mon, 20 Jun 2011 12:45:37 +0000
>> -Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
>> -
>> -Upstream-Status: Accepted
>> -
>> -LDSCRIPT is used only from the top-level Makefile and only when the
>> -system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
>> -related logic into the top level Makefile and under configured conditio=
n
>> -to avoid errors when building tools from unconfigured tree.
>> -
>> -Signed-off-by: Ilya Yanok <yanok@emcraft.com>
>> -Acked-by: Mike Frysinger <vapier@gentoo.org>
>> ----
>> - Makefile  |   30 ++++++++++++++++++++++++++++++
>> - config.mk |    8 --------
>> - 2 files changed, 30 insertions(+), 8 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index ece91ab..358c410 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -163,6 +163,36 @@ endif
>> - # load other configuration
>> - include $(TOPDIR)/config.mk
>> -
>> -+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT,
>> use
>> -+# that (or fail if absent).  Otherwise, search for a linker script in =
a
>> -+# standard location.
>> -+
>> -+ifndef LDSCRIPT
>> -+      #LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> -+      ifdef CONFIG_SYS_LDSCRIPT
>> -+              # need to strip off double quotes
>> -+              LDSCRIPT :=3D $(subst ",,$(CONFIG_SYS_LDSCRIPT))
>> -+      endif
>> -+endif
>> -+
>> -+ifndef LDSCRIPT
>> -+      ifeq ($(CONFIG_NAND_U_BOOT),y)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.ld=
s
>> -+              ifeq ($(wildcard $(LDSCRIPT)),)
>> -+                      LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot-nand.ld=
s
>> -+              endif
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+              LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot.lds
>> -+      endif
>> -+      ifeq ($(wildcard $(LDSCRIPT)),)
>> -+$(error could not find linker script)
>> -+      endif
>> -+endif
>> -+
>> -
>> ########################################################################=
#
>> - # U-Boot objects....order is important (i.e. start must be first)
>> -
>> -diff --git a/config.mk b/config.mk
>> -index fa46ff1..59c4c93 100644
>> ---- a/config.mk
>> -+++ b/config.mk
>> -@@ -153,14 +153,6 @@ endif
>> - RELFLAGS=3D $(PLATFORM_RELFLAGS)
>> - DBGFLAGS=3D -g # -DDEBUG
>> - OPTFLAGS=3D -Os #-fomit-frame-pointer
>> --ifndef LDSCRIPT
>> --#LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug
>> --ifeq ($(CONFIG_NAND_U_BOOT),y)
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds
>> --else
>> --LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds
>> --endif
>> --endif
>> - OBJCFLAGS +=3D --gap-fill=3D0xff
>> -
>> - gccincdir :=3D $(shell $(CC) -print-file-name=3Dinclude)
>> ---
>> -1.7.5.4
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bbb/meta/rec=
ipes-bsp/u-boot/
>> u-boot-mkimage_2011.03.bb
>> deleted file mode 100644
>> index 34bae8e..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.03.bb
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>>  file://README;beginline=3D1;endline=3D22;md5=3D3a00ef51d3fc96e9d6c1bc47=
08ccd3b5"
>> -SECTION =3D "bootloader"
>> -
>> -PR =3D "r1"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 \
>> -           file://0001-Drop-config.h-include-in-tools-imximage.h.patch =
\
>> -
>> file://0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch"
>> -
>> -SRC_URI[md5sum] =3D "91d02124c94368557d0e9ac05fb8c33f"
>> -SRC_URI[sha256sum] =3D
>> "08677f66d8d4ee542f6599f580cdffdf730544e1803f9d3739117d6f6d68083e"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTSTRIP=3Dtrue'
>> -
>> -do_compile () {
>> -  oe_runmake tools
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> -}
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bbb/meta/rec=
ipes-bsp/u-boot/
>> u-boot-mkimage_2011.06.bb
>> deleted file mode 100644
>> index 3ca0c2c..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>>  file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d034=
8df3fb90"
>> -SECTION =3D "bootloader"
>> -
>> -PR =3D "r0"
>> -
>> -SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> -
>> -SRC_URI[md5sum] =3D "0cc5026aad02f218a9b9ac56b301c97a"
>> -SRC_URI[sha256sum] =3D
>> "362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2fa15596f43af310ba8b"
>> -
>> -S =3D "${WORKDIR}/u-boot-${PV}"
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTLDFLAGS=3D"${LD=
FLAGS}"
>> HOSTSTRIP=3Dtrue'
>> -
>> -do_compile () {
>> -  oe_runmake tools
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> -}
>> -
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bbb/meta/=
recipes-bsp/u-boot/
>> u-boot-mkimage_2013.01.01.bb
>> deleted file mode 100644
>> index 2b39998..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.01.01.bb
>> +++ /dev/null
>> @@ -1,33 +0,0 @@
>> -DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> -SECTION =3D "bootloader"
>> -
>> -# This is needs to be validated among supported BSP's before we can
>> -# make it default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>> -# This revision corresponds to the tag "v2013.01.01"
>> -# We use the revision in order to avoid having to fetch it from the
>> -# repo during parse
>> -SRCREV =3D "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
>> -
>> -PV =3D "v2013.01.01+git${SRCPV}"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTLDFLAGS=3D"${LD=
FLAGS}"
>> HOSTSTRIP=3Dtrue'
>> -
>> -do_compile () {
>> -  oe_runmake tools
>> -}
>> -
>> -do_install () {
>> -  install -d ${D}${bindir}
>> -  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> -  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> -}
>> -
>> -BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bbb/meta/rec=
ipes-bsp/u-boot/
>> u-boot-mkimage_2013.07.bb
>> new file mode 100644
>> index 0000000..0108e00
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2013.07.bb
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =3D "U-boot bootloader mkimage tool"
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> +
>>  file://README;beginline=3D1;endline=3D22;md5=3D78b195c11cb6ef63e6985140=
db7d7bab"
>> +SECTION =3D "bootloader"
>> +
>> +SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "8445162690052e6afd4b8f87af2bb557"
>> +SRC_URI[sha256sum] =3D
>> "2bbd440c1b29928d230604eac372fda5152d3ae23f52b1910c77fc5bf531250b"
>> +
>> +S =3D "${WORKDIR}/u-boot-${PV}"
>> +
>> +BBCLASSEXTEND =3D "native nativesdk"
>> +
>> +EXTRA_OEMAKE =3D 'HOSTCC=3D"${CC}" HOSTLD=3D"${LD}" HOSTLDFLAGS=3D"${LD=
FLAGS}"
>> HOSTSTRIP=3Dtrue'
>> +
>> +do_compile () {
>> +  oe_runmake tools
>> +}
>> +
>> +do_install () {
>> +  install -d ${D}${bindir}
>> +  install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>> +  ln -sf uboot-mkimage ${D}${bindir}/mkimage
>> +}
>> +
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bbb/meta/recipes-bsp=
/u-boot/
>> u-boot_2011.03.bb
>> deleted file mode 100644
>> index a9cbeca..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -require u-boot.inc
>> -
>> -# To build u-boot for your machine, provide the following lines in your
>> machine
>> -# config, replacing the assignments as appropriate for your machine.
>> -# UBOOT_MACHINE =3D "omap3_beagle_config"
>> -# UBOOT_ENTRYPOINT =3D "0x80008000"
>> -# UBOOT_LOADADDRESS =3D "0x80008000"
>> -
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>>  file://README;beginline=3D1;endline=3D22;md5=3D3a00ef51d3fc96e9d6c1bc47=
08ccd3b5"
>> -
>> -# This revision corresponds to the tag "v2011.03"
>> -# We use the revision in order to avoid having to fetch it from the rep=
o
>> during parse
>> -SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>> -
>> -PV =3D "v2011.03+git${SRCPV}"
>> -PR =3D "r8"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bbb/meta/recipes-bsp=
/u-boot/
>> u-boot_2011.06.bb
>> deleted file mode 100644
>> index a115ed2..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -require u-boot.inc
>> -
>> -# To build u-boot for your machine, provide the following lines in your
>> machine
>> -# config, replacing the assignments as appropriate for your machine.
>> -# UBOOT_MACHINE =3D "omap3_beagle_config"
>> -# UBOOT_ENTRYPOINT =3D "0x80008000"
>> -# UBOOT_LOADADDRESS =3D "0x80008000"
>> -
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> -
>>  file://README;beginline=3D1;endline=3D22;md5=3D5ba4218ac89af7846802d034=
8df3fb90"
>> -
>> -# This revision corresponds to the tag "v2011.06"
>> -# We use the revision in order to avoid having to fetch it from the rep=
o
>> during parse
>> -SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>> -
>> -PV =3D "v2011.06+git${SRCPV}"
>> -PR =3D "r3"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bbb/meta/recipes-=
bsp/u-boot/
>> u-boot_2013.01.01.bb
>> deleted file mode 100644
>> index 8ffb8f3..0000000
>> --- a/meta/recipes-bsp/u-boot/u-boot_2013.01.01.bb
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -require u-boot.inc
>> -
>> -# This is needs to be validated among supported BSP's before we can
>> -# make it default
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>> -# To build u-boot for your machine, provide the following lines in
>> -# your machine config, replacing the assignments as appropriate for
>> -# your machine.
>> -# UBOOT_MACHINE =3D "omap3_beagle_config"
>> -# UBOOT_ENTRYPOINT =3D "0x80008000"
>> -# UBOOT_LOADADDRESS =3D "0x80008000"
>> -
>> -LICENSE =3D "GPLv2+"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb"
>> -
>> -# This revision corresponds to the tag "v2013.01.01"
>> -# We use the revision in order to avoid having to fetch it from the
>> -# repo during parse
>> -SRCREV =3D "e8ae0fa5edd152b2b29c470b88429be4cdcd2c46"
>> -
>> -PV =3D "v2013.01.01+git${SRCPV}"
>> -PR =3D "r0"
>> -
>> -SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2013.07.bbb/meta/recipes-bsp=
/u-boot/
>> u-boot_2013.07.bb
>> new file mode 100644
>> index 0000000..f3f4b62
>> --- /dev/null
>> +++ b/meta/recipes-bsp/u-boot/u-boot_2013.07.bb
>> @@ -0,0 +1,23 @@
>> +require u-boot.inc
>> +
>> +# To build u-boot for your machine, provide the following lines in your
>> machine
>> +# config, replacing the assignments as appropriate for your machine.
>> +# UBOOT_MACHINE =3D "omap3_beagle_config"
>> +# UBOOT_ENTRYPOINT =3D "0x80008000"
>> +# UBOOT_LOADADDRESS =3D "0x80008000"
>> +
>> +LICENSE =3D "GPLv2+"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1707d6db1d42237583f50183a565=
1ecb \
>> +
>>  file://README;beginline=3D1;endline=3D22;md5=3D78b195c11cb6ef63e6985140=
db7d7bab"
>> +
>> +# This revision corresponds to the tag "v2013.07"
>> +# We use the revision in order to avoid having to fetch it from the rep=
o
>> during parse
>> +SRCREV =3D "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
>> +
>> +PV =3D "v2013.07+git${SRCPV}"
>> +
>> +SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgi=
t"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> --
>> 1.8.3.4
>>
>>
>

--047d7b160515472a4f04e49854f2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I do not think my u-boot work is welcome, so I will withdr=
aw this one, too.<div><br></div><div>I submitted the version before, withou=
t deleting the old variants, then some people told me they should be remove=
d as it was tested that the new version should work.</div>
<div><br></div><div>Now, it has again been argued on IRC that it should not=
 have been and my way should have been done. Well, I am done with this. Do =
whatever you wish with u-boot. As for me, this ping-pong arguing is just de=
motivating to get contributions accepted.</div>
</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Thu,=
 Aug 22, 2013 at 10:14 PM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div dir=3D"ltr">Please provide feedback. I would like to get this into pok=
y 1.5. Thanks!</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"g=
mail_extra"><br><br><div class=3D"gmail_quote">On Thu, Aug 22, 2013 at 9:36=
 PM, Laszlo Papp <span dir=3D"ltr">&lt;<a href=3D"mailto:lpapp@kde.org" tar=
get=3D"_blank">lpapp@kde.org</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Laszlo Papp &lt;<a href=3D"ma=
ilto:lpapp@kde.org" target=3D"_blank">lpapp@kde.org</a>&gt;<br>
---<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2011.06.bb" ta=
rget=3D"_blank">u-boot-fw-utils_2011.06.bb</a> | 28 --------<br>
=A0...Drop-config.h-include-in-tools-imximage.h.patch | 39 ----------<br>
=A0...ove-LDSCRIPT-processing-to-the-top-level-.patch | 82 ----------------=
------<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.03.bb" tar=
get=3D"_blank">u-boot-mkimage_2011.03.bb</a> =A0| 31 --------<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.06.bb" tar=
get=3D"_blank">u-boot-mkimage_2011.06.bb</a> =A0| 29 --------<br>
=A0.../u-boot/<a href=3D"http://u-boot-mkimage_2013.01.01.bb" target=3D"_bl=
ank">u-boot-mkimage_2013.01.01.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| 33 ---------=
<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" tar=
get=3D"_blank">u-boot-mkimage_2013.07.bb</a> =A0| 27 +++++++<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.03.bb" target=3D"_=
blank">u-boot_2011.03.bb</a> =A0 =A0 =A0 =A0 =A0| 24 -------<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.06.bb" target=3D"_=
blank">u-boot_2011.06.bb</a> =A0 =A0 =A0 =A0 =A0| 24 -------<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.01.01.bb" target=
=3D"_blank">u-boot_2013.01.01.bb</a> =A0 =A0 =A0 | 29 --------<br>
=A0meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=3D"_=
blank">u-boot_2013.07.bb</a> =A0 =A0 =A0 =A0 =A0| 23 ++++++<br>
=A011 files changed, 50 insertions(+), 319 deletions(-)<br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-u=
tils_2011.06.bb" target=3D"_blank">u-boot-fw-utils_2011.06.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-D=
rop-config.h-include-in-tools-imximage.h.patch<br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-c=
onfig.mk-move-LDSCRIPT-processing-to-the-top-level-.patch<br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkim=
age_2011.03.bb" target=3D"_blank">u-boot-mkimage_2011.03.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkim=
age_2011.06.bb" target=3D"_blank">u-boot-mkimage_2011.06.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkim=
age_2013.01.01.bb" target=3D"_blank">u-boot-mkimage_2013.01.01.bb</a><br>
=A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkim=
age_2013.07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011=
.03.bb" target=3D"_blank">u-boot_2011.03.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011=
.06.bb" target=3D"_blank">u-boot_2011.06.bb</a><br>
=A0delete mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013=
.01.01.bb" target=3D"_blank">u-boot_2013.01.01.bb</a><br>
=A0create mode 100644 meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013=
.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2011=
.06.bb" target=3D"_blank">u-boot-fw-utils_2011.06.bb</a> b/meta/recipes-bsp=
/u-boot/<a href=3D"http://u-boot-fw-utils_2011.06.bb" target=3D"_blank">u-b=
oot-fw-utils_2011.06.bb</a><br>


deleted file mode 100644<br>
index 7c4df1a..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-fw-utils_2011.06.bb"=
 target=3D"_blank">u-boot-fw-utils_2011.06.bb</a><br>
+++ /dev/null<br>
@@ -1,28 +0,0 @@<br>
-DESCRIPTION =3D &quot;U-boot bootloader fw_printenv/setenv utils&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D5ba4218ac89af7846802d0348df3fb90&quot;<br>
-SECTION =3D &quot;bootloader&quot;<br>
-<br>
-DEPENDS =3D &quot;mtd-utils&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BPV%7D=
.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.b=
z2</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;0cc5026aad02f218a9b9ac56b301c97a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2=
fa15596f43af310ba8b&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot;&#39;<br>
-<br>
-do_compile () {<br>
- =A0oe_runmake env<br>
-}<br>
-<br>
-do_install () {<br>
- =A0install -d ${D}${base_sbindir}<br>
- =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_print=
env<br>
- =A0install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_seten=
v<br>
-}<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-confi=
g.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/u-boot/u-boot-mkim=
age-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch<br>
deleted file mode 100644<br>
index 0405834..0000000<br>
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0001-Drop-config.h-inc=
lude-in-tools-imximage.h.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From ce56e089ddb51dbd81bb2c86b1646d77447afe39 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Lo=3DC3=3DAFc=3D20Minier?=3D &lt;<a href=3D"mailto:loic.=
minier@linaro.org" target=3D"_blank">loic.minier@linaro.org</a>&gt;<br>
-Date: Thu, 3 Feb 2011 15:07:01 +0100<br>
-Subject: Drop config.h include in tools/imximage.h<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Upstream-Status: Accepted<br>
-<br>
-&quot;make tools-all&quot; should allow building tools such as mkimage and=
 the new<br>
-imximage without any config, but imximage.c currently fails to build<br>
-with:<br>
-imximage.h:27:20: error: config.h: No such file or directory<br>
-<br>
-config.h is not needed in imximage.h nor in imximage.c, and imximage.h<br>
-is only included from imximage.c, so drop this include to fix the build.<b=
r>
-<br>
-Signed-off-by: Lo=EFc Minier &lt;<a href=3D"mailto:loic.minier@linaro.org"=
 target=3D"_blank">loic.minier@linaro.org</a>&gt;<br>
----<br>
- tools/imximage.h | =A0 =A02 --<br>
- 1 files changed, 0 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/tools/imximage.h b/tools/imximage.h<br>
-index 38ca6be..d126a46 100644<br>
---- a/tools/imximage.h<br>
-+++ b/tools/imximage.h<br>
-@@ -24,8 +24,6 @@<br>
- #ifndef _IMXIMAGE_H_<br>
- #define _IMXIMAGE_H_<br>
-<br>
--#include &lt;config.h&gt;<br>
--<br>
- #define MAX_HW_CFG_SIZE_V2 121 /* Max number of registers imx can set for=
 v2 */<br>
- #define MAX_HW_CFG_SIZE_V1 60 =A0/* Max number of registers imx can set f=
or v1 */<br>
- #define APP_CODE_BARKER =A0 =A0 =A0 0xB1<br>
---<br>
-1.7.4.4<br>
-<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-=
move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/u-boot/=
u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-l=
evel-.patch<br>


deleted file mode 100644<br>
index 5729cd9..0000000<br>
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage-2011.03/0002-config.mk-move-LD=
SCRIPT-processing-to-the-top-level-.patch<br>
+++ /dev/null<br>
@@ -1,82 +0,0 @@<br>
-From fd1b50c5ff9c288040abf5e78815151327d32e0e Mon Sep 17 00:00:00 2001<br>
-From: Ilya Yanok &lt;<a href=3D"mailto:yanok@emcraft.com" target=3D"_blank=
">yanok@emcraft.com</a>&gt;<br>
-Date: Mon, 20 Jun 2011 12:45:37 +0000<br>
-Subject: <a href=3D"http://config.mk" target=3D"_blank">config.mk</a>: mov=
e LDSCRIPT processing to the top-level Makefile<br>
-<br>
-Upstream-Status: Accepted<br>
-<br>
-LDSCRIPT is used only from the top-level Makefile and only when the<br>
-system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT<br>
-related logic into the top level Makefile and under configured condition<b=
r>
-to avoid errors when building tools from unconfigured tree.<br>
-<br>
-Signed-off-by: Ilya Yanok &lt;<a href=3D"mailto:yanok@emcraft.com" target=
=3D"_blank">yanok@emcraft.com</a>&gt;<br>
-Acked-by: Mike Frysinger &lt;<a href=3D"mailto:vapier@gentoo.org" target=
=3D"_blank">vapier@gentoo.org</a>&gt;<br>
----<br>
- Makefile =A0| =A0 30 ++++++++++++++++++++++++++++++<br>
- <a href=3D"http://config.mk" target=3D"_blank">config.mk</a> | =A0 =A08 -=
-------<br>
- 2 files changed, 30 insertions(+), 8 deletions(-)<br>
-<br>
-diff --git a/Makefile b/Makefile<br>
-index ece91ab..358c410 100644<br>
---- a/Makefile<br>
-+++ b/Makefile<br>
-@@ -163,6 +163,36 @@ endif<br>
- # load other configuration<br>
- include $(TOPDIR)/<a href=3D"http://config.mk" target=3D"_blank">config.m=
k</a><br>
-<br>
-+# If board code explicitly specified LDSCRIPT or CONFIG_SYS_LDSCRIPT, use=
<br>
-+# that (or fail if absent). =A0Otherwise, search for a linker script in a=
<br>
-+# standard location.<br>
-+<br>
-+ifndef LDSCRIPT<br>
-+ =A0 =A0 =A0#LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug<b=
r>
-+ =A0 =A0 =A0ifdef CONFIG_SYS_LDSCRIPT<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0# need to strip off double quotes<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0LDSCRIPT :=3D $(subst &quot;,,$(CONFIG_SYS_LD=
SCRIPT))<br>
-+ =A0 =A0 =A0endif<br>
-+endif<br>
-+<br>
-+ifndef LDSCRIPT<br>
-+ =A0 =A0 =A0ifeq ($(CONFIG_NAND_U_BOOT),y)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-b=
oot-nand.lds<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0ifeq ($(wildcard $(LDSCRIPT)),)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0LDSCRIPT :=3D $(TOPDIR)/$(CPU=
DIR)/u-boot-nand.lds<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0endif<br>
-+ =A0 =A0 =A0endif<br>
-+ =A0 =A0 =A0ifeq ($(wildcard $(LDSCRIPT)),)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-b=
oot.lds<br>
-+ =A0 =A0 =A0endif<br>
-+ =A0 =A0 =A0ifeq ($(wildcard $(LDSCRIPT)),)<br>
-+ =A0 =A0 =A0 =A0 =A0 =A0 =A0LDSCRIPT :=3D $(TOPDIR)/$(CPUDIR)/u-boot.lds<=
br>
-+ =A0 =A0 =A0endif<br>
-+ =A0 =A0 =A0ifeq ($(wildcard $(LDSCRIPT)),)<br>
-+$(error could not find linker script)<br>
-+ =A0 =A0 =A0endif<br>
-+endif<br>
-+<br>
- #########################################################################=
<br>
- # U-Boot objects....order is important (i.e. start must be first)<br>
-<br>
-diff --git a/<a href=3D"http://config.mk" target=3D"_blank">config.mk</a> =
b/<a href=3D"http://config.mk" target=3D"_blank">config.mk</a><br>
-index fa46ff1..59c4c93 100644<br>
---- a/<a href=3D"http://config.mk" target=3D"_blank">config.mk</a><br>
-+++ b/<a href=3D"http://config.mk" target=3D"_blank">config.mk</a><br>
-@@ -153,14 +153,6 @@ endif<br>
- RELFLAGS=3D $(PLATFORM_RELFLAGS)<br>
- DBGFLAGS=3D -g # -DDEBUG<br>
- OPTFLAGS=3D -Os #-fomit-frame-pointer<br>
--ifndef LDSCRIPT<br>
--#LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds.debug<br>
--ifeq ($(CONFIG_NAND_U_BOOT),y)<br>
--LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot-nand.lds<br>
--else<br>
--LDSCRIPT :=3D $(TOPDIR)/board/$(BOARDDIR)/u-boot.lds<br>
--endif<br>
--endif<br>
- OBJCFLAGS +=3D --gap-fill=3D0xff<br>
-<br>
- gccincdir :=3D $(shell $(CC) -print-file-name=3Dinclude)<br>
---<br>
-1.7.5.4<br>
-<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.=
03.bb" target=3D"_blank">u-boot-mkimage_2011.03.bb</a> b/meta/recipes-bsp/u=
-boot/<a href=3D"http://u-boot-mkimage_2011.03.bb" target=3D"_blank">u-boot=
-mkimage_2011.03.bb</a><br>


deleted file mode 100644<br>
index 34bae8e..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.03.bb" =
target=3D"_blank">u-boot-mkimage_2011.03.bb</a><br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D3a00ef51d3fc96e9d6c1bc4708ccd3b5&quot;<br>
-SECTION =3D &quot;bootloader&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BPV%7D=
.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.b=
z2</a> \<br>
- =A0 =A0 =A0 =A0 =A0 file://0001-Drop-config.h-include-in-tools-imximage.h=
.patch \<br>
- =A0 =A0 =A0 =A0 =A0 file://0002-config.mk-move-LDSCRIPT-processing-to-the=
-top-level-.patch&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;91d02124c94368557d0e9ac05fb8c33f&quot;<br>
-SRC_URI[sha256sum] =3D &quot;08677f66d8d4ee542f6599f580cdffdf730544e1803f9=
d3739117d6f6d68083e&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}&quot=
; HOSTSTRIP=3Dtrue&#39;<br>
-<br>
-do_compile () {<br>
- =A0oe_runmake tools<br>
-}<br>
-<br>
-do_install () {<br>
- =A0install -d ${D}${bindir}<br>
- =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
- =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
-}<br>
-<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.=
06.bb" target=3D"_blank">u-boot-mkimage_2011.06.bb</a> b/meta/recipes-bsp/u=
-boot/<a href=3D"http://u-boot-mkimage_2011.06.bb" target=3D"_blank">u-boot=
-mkimage_2011.06.bb</a><br>


deleted file mode 100644<br>
index 3ca0c2c..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2011.06.bb" =
target=3D"_blank">u-boot-mkimage_2011.06.bb</a><br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D5ba4218ac89af7846802d0348df3fb90&quot;<br>
-SECTION =3D &quot;bootloader&quot;<br>
-<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BPV%7D=
.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.b=
z2</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;0cc5026aad02f218a9b9ac56b301c97a&quot;<br>
-SRC_URI[sha256sum] =3D &quot;362ddb935885da98cf461eba08f31e3e59d0c4ada6cb2=
fa15596f43af310ba8b&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}&quot=
; HOSTLDFLAGS=3D&quot;${LDFLAGS}&quot; HOSTSTRIP=3Dtrue&#39;<br>
-<br>
-do_compile () {<br>
- =A0oe_runmake tools<br>
-}<br>
-<br>
-do_install () {<br>
- =A0install -d ${D}${bindir}<br>
- =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
- =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
-}<br>
-<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.=
01.01.bb" target=3D"_blank">u-boot-mkimage_2013.01.01.bb</a> b/meta/recipes=
-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.01.01.bb" target=3D"_blan=
k">u-boot-mkimage_2013.01.01.bb</a><br>


deleted file mode 100644<br>
index 2b39998..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.01.01.b=
b" target=3D"_blank">u-boot-mkimage_2013.01.01.bb</a><br>
+++ /dev/null<br>
@@ -1,33 +0,0 @@<br>
-DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb&quot;<br>
-SECTION =3D &quot;bootloader&quot;<br>
-<br>
-# This is needs to be validated among supported BSP&#39;s before we can<br=
>
-# make it default<br>
-DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
-<br>
-# This revision corresponds to the tag &quot;v2013.01.01&quot;<br>
-# We use the revision in order to avoid having to fetch it from the<br>
-# repo during parse<br>
-SRCREV =3D &quot;e8ae0fa5edd152b2b29c470b88429be4cdcd2c46&quot;<br>
-<br>
-PV =3D &quot;v2013.01.01+git${SRCPV}&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}&quot=
; HOSTLDFLAGS=3D&quot;${LDFLAGS}&quot; HOSTSTRIP=3Dtrue&#39;<br>
-<br>
-do_compile () {<br>
- =A0oe_runmake tools<br>
-}<br>
-<br>
-do_install () {<br>
- =A0install -d ${D}${bindir}<br>
- =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
- =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
-}<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.=
07.bb" target=3D"_blank">u-boot-mkimage_2013.07.bb</a> b/meta/recipes-bsp/u=
-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" target=3D"_blank">u-boot=
-mkimage_2013.07.bb</a><br>


new file mode 100644<br>
index 0000000..0108e00<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot-mkimage_2013.07.bb" =
target=3D"_blank">u-boot-mkimage_2013.07.bb</a><br>
@@ -0,0 +1,27 @@<br>
+DESCRIPTION =3D &quot;U-boot bootloader mkimage tool&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
+SECTION =3D &quot;bootloader&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"ftp://ftp.denx.de/pub/u-boot/u-boot-$%7BPV%7D=
.tar.bz2" target=3D"_blank">ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.b=
z2</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;8445162690052e6afd4b8f87af2bb557&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2bbd440c1b29928d230604eac372fda5152d3ae23f52b=
1910c77fc5bf531250b&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/u-boot-${PV}&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
+<br>
+EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${CC}&quot; HOSTLD=3D&quot;${LD}&quot=
; HOSTLDFLAGS=3D&quot;${LDFLAGS}&quot; HOSTSTRIP=3Dtrue&#39;<br>
+<br>
+do_compile () {<br>
+ =A0oe_runmake tools<br>
+}<br>
+<br>
+do_install () {<br>
+ =A0install -d ${D}${bindir}<br>
+ =A0install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage<br>
+ =A0ln -sf uboot-mkimage ${D}${bindir}/mkimage<br>
+}<br>
+<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.03.bb" t=
arget=3D"_blank">u-boot_2011.03.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D=
"http://u-boot_2011.03.bb" target=3D"_blank">u-boot_2011.03.bb</a><br>
deleted file mode 100644<br>
index a9cbeca..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.03.bb" target=
=3D"_blank">u-boot_2011.03.bb</a><br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-require u-boot.inc<br>
-<br>
-# To build u-boot for your machine, provide the following lines in your ma=
chine<br>
-# config, replacing the assignments as appropriate for your machine.<br>
-# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
-# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
-# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
-<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D3a00ef51d3fc96e9d6c1bc4708ccd3b5&quot;<br>
-<br>
-# This revision corresponds to the tag &quot;v2011.03&quot;<br>
-# We use the revision in order to avoid having to fetch it from the repo d=
uring parse<br>
-SRCREV =3D &quot;19b54a701811220221fc4d5089a2bb18892018ca&quot;<br>
-<br>
-PV =3D &quot;v2011.03+git${SRCPV}&quot;<br>
-PR =3D &quot;r8&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.06.bb" t=
arget=3D"_blank">u-boot_2011.06.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D=
"http://u-boot_2011.06.bb" target=3D"_blank">u-boot_2011.06.bb</a><br>
deleted file mode 100644<br>
index a115ed2..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2011.06.bb" target=
=3D"_blank">u-boot_2011.06.bb</a><br>
+++ /dev/null<br>
@@ -1,24 +0,0 @@<br>
-require u-boot.inc<br>
-<br>
-# To build u-boot for your machine, provide the following lines in your ma=
chine<br>
-# config, replacing the assignments as appropriate for your machine.<br>
-# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
-# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
-# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
-<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D5ba4218ac89af7846802d0348df3fb90&quot;<br>
-<br>
-# This revision corresponds to the tag &quot;v2011.06&quot;<br>
-# We use the revision in order to avoid having to fetch it from the repo d=
uring parse<br>
-SRCREV =3D &quot;b1af6f532e0d348b153d5c148369229d24af361a&quot;<br>
-<br>
-PV =3D &quot;v2011.06+git${SRCPV}&quot;<br>
-PR =3D &quot;r3&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.01.01.bb=
" target=3D"_blank">u-boot_2013.01.01.bb</a> b/meta/recipes-bsp/u-boot/<a h=
ref=3D"http://u-boot_2013.01.01.bb" target=3D"_blank">u-boot_2013.01.01.bb<=
/a><br>


deleted file mode 100644<br>
index 8ffb8f3..0000000<br>
--- a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.01.01.bb" targe=
t=3D"_blank">u-boot_2013.01.01.bb</a><br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-require u-boot.inc<br>
-<br>
-# This is needs to be validated among supported BSP&#39;s before we can<br=
>
-# make it default<br>
-DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
-<br>
-# To build u-boot for your machine, provide the following lines in<br>
-# your machine config, replacing the assignments as appropriate for<br>
-# your machine.<br>
-# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
-# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
-# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
-<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb&quot;<br>
-<br>
-# This revision corresponds to the tag &quot;v2013.01.01&quot;<br>
-# We use the revision in order to avoid having to fetch it from the<br>
-# repo during parse<br>
-SRCREV =3D &quot;e8ae0fa5edd152b2b29c470b88429be4cdcd2c46&quot;<br>
-<br>
-PV =3D &quot;v2013.01.01+git${SRCPV}&quot;<br>
-PR =3D &quot;r0&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
diff --git a/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" t=
arget=3D"_blank">u-boot_2013.07.bb</a> b/meta/recipes-bsp/u-boot/<a href=3D=
"http://u-boot_2013.07.bb" target=3D"_blank">u-boot_2013.07.bb</a><br>
new file mode 100644<br>
index 0000000..f3f4b62<br>
--- /dev/null<br>
+++ b/meta/recipes-bsp/u-boot/<a href=3D"http://u-boot_2013.07.bb" target=
=3D"_blank">u-boot_2013.07.bb</a><br>
@@ -0,0 +1,23 @@<br>
+require u-boot.inc<br>
+<br>
+# To build u-boot for your machine, provide the following lines in your ma=
chine<br>
+# config, replacing the assignments as appropriate for your machine.<br>
+# UBOOT_MACHINE =3D &quot;omap3_beagle_config&quot;<br>
+# UBOOT_ENTRYPOINT =3D &quot;0x80008000&quot;<br>
+# UBOOT_LOADADDRESS =3D &quot;0x80008000&quot;<br>
+<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1707d6db1d42237583f50183a5=
651ecb \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0file://README;beginline=3D1;endlin=
e=3D22;md5=3D78b195c11cb6ef63e6985140db7d7bab&quot;<br>
+<br>
+# This revision corresponds to the tag &quot;v2013.07&quot;<br>
+# We use the revision in order to avoid having to fetch it from the repo d=
uring parse<br>
+SRCREV =3D &quot;62c175fbb8a0f9a926c88294ea9f7e88eb898f6c&quot;<br>
+<br>
+PV =3D &quot;v2013.07+git${SRCPV}&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.denx.de/u-boot.git;branch=3D=
master;protocol=3Dgit" target=3D"_blank">git.denx.de/u-boot.git;branch=3Dma=
ster;protocol=3Dgit</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<span><font color=3D"#888888">--<br>
1.8.3.4<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b160515472a4f04e49854f2--
