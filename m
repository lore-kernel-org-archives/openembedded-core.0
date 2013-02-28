Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAsg1-0004Ot-WC
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 02:52:55 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2013 17:36:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,752,1355126400"; d="scan'208";a="296921365"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2013 17:36:30 -0800
Message-ID: <512EB49E.7040404@linux.intel.com>
Date: Wed, 27 Feb 2013 17:36:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1361950227-15560-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1361950227-15560-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu: Upgrade to 1.4.0 release
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
X-List-Received-Date: Thu, 28 Feb 2013 01:53:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/26/2013 11:30 PM, Khem Raj wrote:
> Tested qemu on x86-64 target and qemu-native
> no obvious problems seen in testing
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../qemu/files/fix-configure-checks.patch          |   10 +++++-----
>   meta/recipes-devtools/qemu/qemu.inc                |    2 +-
>   .../qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb}          |    6 ++----
>   3 files changed, 8 insertions(+), 10 deletions(-)
>   rename meta/recipes-devtools/qemu/{qemu_1.3.1.bb => qemu_1.4.0.bb} (62%)
>
> diff --git a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> index ef77c92..294c220 100644
> --- a/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> +++ b/meta/recipes-devtools/qemu/files/fix-configure-checks.patch
> @@ -8,14 +8,14 @@ Patch from Paul Eggleton, Comments by RP 28/11/10
>
>   Upstream-Status: Inappropriate [embedded specific]
>
> -Index: qemu-1.2.0/configure
> +Index: qemu-1.4.0/configure
>   ===================================================================
> ---- qemu-1.2.0.orig/configure	2012-09-05 07:03:06.000000000 -0700
> -+++ qemu-1.2.0/configure	2012-09-06 13:55:07.007793823 -0700
> -@@ -281,6 +281,7 @@
> +--- qemu-1.4.0.orig/configure	2013-02-15 15:05:35.000000000 -0800
> ++++ qemu-1.4.0/configure	2013-02-25 13:44:17.915273181 -0800
> +@@ -286,6 +286,7 @@
>    QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
>    QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
> - QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/fpu"
> + QEMU_INCLUDES="-I. -I\$(SRC_PATH) -I\$(SRC_PATH)/include"
>   +QEMU_CFLAGS="$QEMU_CFLAGS $CFLAGS"
>    if test "$debug_info" = "yes"; then
>        CFLAGS="-g $CFLAGS"
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 6c44b31..2b60347 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -32,7 +32,7 @@ SRC_URI_append_class-nativesdk = "\
>       file://relocatable_sdk.patch \
>       "
>
> -EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman --disable-smartcard"
> +EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls --audio-drv-list=oss,alsa --audio-card-list=ac97,es1370 ${SDL} --disable-curl --disable-vnc-jpeg --disable-bluez --with-system-pixman"
>

Why did you remove the --disable-smartcard?


>   EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror --disable-vnc-tls \
>   				--disable-curl \
> diff --git a/meta/recipes-devtools/qemu/qemu_1.3.1.bb b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
> similarity index 62%
> rename from meta/recipes-devtools/qemu/qemu_1.3.1.bb
> rename to meta/recipes-devtools/qemu/qemu_1.4.0.bb
> index c04b2be..009cd78 100644
> --- a/meta/recipes-devtools/qemu/qemu_1.3.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_1.4.0.bb
> @@ -4,7 +4,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
>                       file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
>
>   SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
> -SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
> -SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
> -
> -PR = "r0"

Nice touch!

> +SRC_URI[md5sum] = "78f13b774814b6b7ebcaf4f9b9204318"
> +SRC_URI[sha256sum] = "066297ed77408fb7588889c271a85cf3c259ad55c939315988e6062d7708eda8"
>

Sau!



