Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id EAE5A605BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:24:26 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3tXVT55lkJz3hjpP;
	Mon,  5 Dec 2016 17:24:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3tXVT54sbkzvkfJ;
	Mon,  5 Dec 2016 17:24:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id TtwlBd_HU2QY; Mon,  5 Dec 2016 17:24:23 +0100 (CET)
X-Auth-Info: anWR4+r8EnWfSB3/yb1+OaKN3d/mlSDCxJ7VTO/s3HE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon,  5 Dec 2016 17:24:23 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161118192955.17284-1-marex@denx.de>
	<CAJTo0LYdVfLUnMsJkiV_bCu5cGTwrY5HvbFYfjnKj3kp+4iFNQ@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7d8278b0-632f-1b8b-9fd4-2464185b0885@denx.de>
Date: Mon, 5 Dec 2016 17:24:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYdVfLUnMsJkiV_bCu5cGTwrY5HvbFYfjnKj3kp+4iFNQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to v2016.11 release
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
X-List-Received-Date: Mon, 05 Dec 2016 16:24:28 -0000
X-Groupsio-MsgNum: 90200
Content-Type: multipart/mixed; boundary="------------49D154F66185D2A9159C160C"

--------------49D154F66185D2A9159C160C
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 12/05/2016 05:19 PM, Burton, Ross wrote:
> This doesn't apply to master cleanly, I suspect it's part of a series
> that has managed to become split up in my inbox.
> 
> Is there a branch with this on?

Afaict you applied the update to 2016.09 and squashed some patches and
that never made it into master. Anyway, I'm attaching all the patches,
for completeness.

> Ross
> 
> On 18 November 2016 at 19:29, Marek Vasut <marex@denx.de
> <mailto:marex@denx.de>> wrote:
> 
>     Upgrade U-Boot to the latest version.
> 
>     Signed-off-by: Marek Vasut <marex@denx.de <mailto:marex@denx.de>>
>     Cc: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>     Cc: Denys Dmytriyenko <denis@denix.org <mailto:denis@denix.org>>
>     Cc: Ross Burton <ross.burton@intel.com <mailto:ross.burton@intel.com>>
>     ---
>      .../{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc}   
>        | 4 ++--
>      .../{u-boot-fw-utils_2016.09.01.bb
>     <http://u-boot-fw-utils_2016.09.01.bb> => u-boot-fw-utils_2016.11.bb
>     <http://u-boot-fw-utils_2016.11.bb>}     | 0
>      .../{u-boot-mkimage_2016.09.01.bb
>     <http://u-boot-mkimage_2016.09.01.bb> => u-boot-mkimage_2016.11.bb
>     <http://u-boot-mkimage_2016.11.bb>}       | 0
>      meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb
>     <http://u-boot_2016.09.01.bb> => u-boot_2016.11.bb
>     <http://u-boot_2016.11.bb>}   | 0
>      4 files changed, 2 insertions(+), 2 deletions(-)
>      rename meta/recipes-bsp/u-boot/{u-boot-common_2016.09.01.inc =>
>     u-boot-common_2016.11.inc} (71%)
>      rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.09.01.bb
>     <http://u-boot-fw-utils_2016.09.01.bb> => u-boot-fw-utils_2016.11.bb
>     <http://u-boot-fw-utils_2016.11.bb>} (100%)
>      rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.09.01.bb
>     <http://u-boot-mkimage_2016.09.01.bb> => u-boot-mkimage_2016.11.bb
>     <http://u-boot-mkimage_2016.11.bb>} (100%)
>      rename meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb
>     <http://u-boot_2016.09.01.bb> => u-boot_2016.11.bb
>     <http://u-boot_2016.11.bb>} (100%)
> 
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>     b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>     similarity index 71%
>     rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>     rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>     index f706a6b..84adc1c 100644
>     --- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
>     +++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
>     @@ -7,8 +7,8 @@ PE = "1"
> 
>      # We use the revision in order to avoid having to fetch it from the
>      # repo during parse
>     -SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
>     +SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
> 
>     -SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y
>     <http://git.denx.de/u-boot.git;branch=u-boot-2016.09.y>"
>     +SRC_URI = "git://git.denx.de/u-boot.git
>     <http://git.denx.de/u-boot.git>"
> 
>      S = "${WORKDIR}/git"
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
>     <http://u-boot-fw-utils_2016.09.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
>     <http://u-boot-fw-utils_2016.11.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
>     <http://u-boot-fw-utils_2016.09.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
>     <http://u-boot-fw-utils_2016.11.bb>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
>     <http://u-boot-mkimage_2016.09.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
>     <http://u-boot-mkimage_2016.11.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
>     <http://u-boot-mkimage_2016.09.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
>     <http://u-boot-mkimage_2016.11.bb>
>     diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
>     <http://u-boot_2016.09.01.bb>
>     b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb <http://u-boot_2016.11.bb>
>     similarity index 100%
>     rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
>     <http://u-boot_2016.09.01.bb>
>     rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
>     <http://u-boot_2016.11.bb>
>     --
>     2.10.2
> 
> 


-- 
Best regards,
Marek Vasut

--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0001-u-boot-Update-to-2016.09.01-release.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-u-boot-Update-to-2016.09.01-release.patch"

From 7e9976663a738810238888ac9cf9814f9ba16e41 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Sun, 4 Sep 2016 12:50:01 +0200
Subject: [PATCH 1/6] u-boot: Update to 2016.09.01 release

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 .../{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc}   | 8 ++++----
 .../{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} | 0
 .../{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb}   | 0
 .../u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb}            | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2016.03.inc => u-boot-common_2016.09.01.inc} (59%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.03.bb => u-boot-fw-utils_2016.09.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.03.bb => u-boot-mkimage_2016.09.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.03.bb => u-boot_2016.09.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
similarity index 59%
rename from meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index 403e316..ead5077 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.03.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -4,13 +4,13 @@ SECTION = "bootloaders"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-# This revision corresponds to the tag "v2016.03"
+# This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "df61a74e6845ec9bdcdd48d2aff5e9c2c6debeaa"
+SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.03+git${SRCPV}"
+PV = "v2016.09.01+git${SRCPV}"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=master"
+SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.03.bb b/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.03.bb
rename to meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
-- 
2.10.2


--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0002-u-boot-Drop-the-git-part-from-PV.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0002-u-boot-Drop-the-git-part-from-PV.patch"

From 4bae285969592a19907d987e7e8085fb1e1cf95c Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Sun, 16 Oct 2016 14:41:28 +0200
Subject: [PATCH 2/6] u-boot: Drop the +git part from PV

The U-Boot package is using release versions of U-Boot,
so drop the extra +git part from PV.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index ead5077..0a90621 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.09.01+git${SRCPV}"
+PV = "v2016.09.01"
 
 SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
-- 
2.10.2


--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0003-u-boot-Drop-PV-altogether.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0003-u-boot-Drop-PV-altogether.patch"

From 919f8093c8ac1e60a2d52c531af6345455ea1e62 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Sun, 16 Oct 2016 14:44:12 +0200
Subject: [PATCH 3/6] u-boot: Drop PV altogether

Drop the explicit setting of PV altogether. This changes the U-Boot
version string from "v20yy.mm" to "20yy.mm" , so layer setting the
PREFERRED_VERSION_u-boot must be updated by removing the leading 'v'.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
V2: - Add PE=1 to increment the epoch of the package, as the version
      numbering changes in non-backward-compatible way.
V3: - Formatting fix
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index 0a90621..183e222 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -3,14 +3,13 @@ SECTION = "bootloaders"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
+PE = "1"
 
 # This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
 
-PV = "v2016.09.01"
-
 SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
 
 S = "${WORKDIR}/git"
-- 
2.10.2


--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0004-u-boot-Drop-redundant-comment.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0004-u-boot-Drop-redundant-comment.patch"

From 4ee18fa12604d00b95dae92d92cc778970f572cc Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Sun, 16 Oct 2016 14:46:50 +0200
Subject: [PATCH 4/6] u-boot: Drop redundant comment

Drop comment stating that the SRCREV corresponds to particular U-Boot
version. This comment is redundant, since the U-Boot version is part
of the recipe filename.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
index 183e222..f706a6b 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
@@ -5,7 +5,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 PE = "1"
 
-# This revision corresponds to the tag "v2016.09.01"
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
-- 
2.10.2


--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0005-u-boot-mkimage-Fix-build-of-u-boot-mkimage.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0005-u-boot-mkimage-Fix-build-of-u-boot-mkimage.patch"

From 314a20266fd91aab01ccd513b3642e237a49bd29 Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Mon, 7 Nov 2016 19:20:06 +0100
Subject: [PATCH 5/6] u-boot: mkimage: Fix build of u-boot-mkimage

The build failed in multiple configurations. First, the native and
nativesdk was using the host compiler and was pulling host libraries
into the build. Second, the target configuration was attempting to
execute tools/bin2header tool on host, which is compiled for target,
to generate license header file that is not used by tools.

This patch changes the EXTRA_OEMAKE to address these issues, to build
both native and target builds with the correct compilers and correct
sysroots. Moreover, this patch removes the CONFIG_CMD_LICENSE from
tools build, thus disabling the execution of target tools/bin2header.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
index 5025961..66edae8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
@@ -3,10 +3,18 @@ require u-boot-common_${PV}.inc
 SUMMARY = "U-Boot bootloader image creation tool"
 DEPENDS = "openssl"
 
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
+EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
 
 do_compile () {
 	oe_runmake sandbox_defconfig
+
+	# Disable CONFIG_CMD_LICENSE, license.h is not used by tools and
+	# generating it requires bin2header tool, which for target build
+	# is built with target tools and thus cannot be executed on host.
+	sed -i "s/CONFIG_CMD_LICENSE.*/# CONFIG_CMD_LICENSE is not set/" .config
+
 	oe_runmake cross_tools NO_SDL=1
 }
 
-- 
2.10.2


--------------49D154F66185D2A9159C160C
Content-Type: text/x-patch;
 name="0006-u-boot-Update-to-v2016.11-release.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0006-u-boot-Update-to-v2016.11-release.patch"

From e064a165bf080e5876518ec3ac8a68a1345c3b9c Mon Sep 17 00:00:00 2001
From: Marek Vasut <marex@denx.de>
Date: Fri, 18 Nov 2016 11:18:58 +0100
Subject: [PATCH 6/6] u-boot: Update to v2016.11 release

Upgrade U-Boot to the latest version.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc}       | 4 ++--
 .../{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb}     | 0
 .../{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb}       | 0
 meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb}   | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{u-boot-common_2016.09.01.inc => u-boot-common_2016.11.inc} (71%)
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2016.09.01.bb => u-boot-fw-utils_2016.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2016.09.01.bb => u-boot-mkimage_2016.11.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2016.09.01.bb => u-boot_2016.11.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
similarity index 71%
rename from meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
rename to meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
index f706a6b..84adc1c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2016.09.01.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2016.11.inc
@@ -7,8 +7,8 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "f3363c060497515ca8b71451cb56f3ec0abacaa9"
+SRCREV = "29e0cfb4f77f7aa369136302cee14a91e22dca71"
 
-SRC_URI = "git://git.denx.de/u-boot.git;branch=u-boot-2016.09.y"
+SRC_URI = "git://git.denx.de/u-boot.git"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.11.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb b/meta/recipes-bsp/u-boot/u-boot_2016.11.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2016.09.01.bb
rename to meta/recipes-bsp/u-boot/u-boot_2016.11.bb
-- 
2.10.2


--------------49D154F66185D2A9159C160C--
