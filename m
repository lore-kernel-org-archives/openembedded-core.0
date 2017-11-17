Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C6B0678534
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 21:36:57 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id s75so2863964pgs.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2Fwy091uGm/tm0Lny30JgBAF3dQ8Fh0A97pDgdMNaek=;
	b=Omw4jYMtj3RGQoU9Qw0K/xGTUBBW1ZTcYBoOj9QHf2zHjm87hMxKMIrcF4ouKQ8s/L
	Cnlnbhmm5rlKTj+liLpuWEwqobwSlAW59VyC38CxL+j5BqmqL+9FLyz6dwK0M4mSPCzJ
	2bJ4eX/2xjorduZGV92BFj8DSzDb+zF2OGYyqjkwDhZXxoWrmtsjDkvaEVqFcnF8zZpC
	AI61Yf5wbx1c8DH8F/6YY4pGqxHKeXFqS/v5v3VMiT6OEWEeppkVkBnMi5zKRuukyJgW
	RFQIn4nN0ATYz7zuXSbj9l1YT6OPMTvSYyt33UjCn+GyyRNmeBEiz0bim1YSKR74xZM5
	TR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2Fwy091uGm/tm0Lny30JgBAF3dQ8Fh0A97pDgdMNaek=;
	b=OmcN0RveZgoCp8dol5QQp9aXO4pe1FMO+T6AXrCgsgnrmBstrxaJqYZzDcSSApHf2P
	FNWMsao7MSME2rf4YJBRs8AE3xfA9iwDR2WDYSD04B78Av1dJotYooVa7TM6bBadcQK8
	qGguqdk89/qTeEYEdulneH6DgmZXRkd7nyRDl8S/IZHwLS0v439z4tS1NQZiJ0ene3fe
	VEWBcsA+u8adDEPw8DWa9oRii0o3BiurxHEmo7flH/BTvqq/Qwf0Ly720or8MYbBlGXP
	RYHON0NICm5NyubY5axuTGJMsm9sdgQnqyKfYOUe31F9XJvXcznbhCq4pOM8/DfFW2eG
	mQkw==
X-Gm-Message-State: AJaThX4CkixqDvOWmrGlyCMMJvChNXhE3MfiHXOsdKqFDO0s9lFpz7lh
	dX8P9I9S93Z15CfZZ0enuy/xi9qdMSxhV+UVjV0=
X-Google-Smtp-Source: AGs4zMYnhdzMjenb1r+y+3/M7aHW+VeG8Egu+OYz3/VfyJ6QpFLQINh0P5lC1+imIgUkL1VP/K0B6KZeRkfxpA0MPMc=
X-Received: by 10.84.252.4 with SMTP id x4mr6235506pll.99.1510954618880; Fri,
	17 Nov 2017 13:36:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 17 Nov 2017 13:36:28 -0800 (PST)
In-Reply-To: <20171117202502.10262-1-ross.burton@intel.com>
References: <20171117202502.10262-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Nov 2017 13:36:28 -0800
Message-ID: <CAMKF1sq9jsT7JG8B3A+aa+Ga8L9Z4xy5PbFEqJ90=VSAYNgtOA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] usbutils: remove uclibc-specific patch
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
X-List-Received-Date: Fri, 17 Nov 2017 21:36:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 12:25 PM, Ross Burton <ross.burton@intel.com> wrote:
> This patch is only needed for uclibc, which we don't support in oe-core anymore.
>

indeed, thanks for doing it

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-bsp/usbutils/usbutils/iconv.patch | 41 --------------------------
>  meta/recipes-bsp/usbutils/usbutils_008.bb      |  3 +-
>  2 files changed, 1 insertion(+), 43 deletions(-)
>  delete mode 100644 meta/recipes-bsp/usbutils/usbutils/iconv.patch
>
> diff --git a/meta/recipes-bsp/usbutils/usbutils/iconv.patch b/meta/recipes-bsp/usbutils/usbutils/iconv.patch
> deleted file mode 100644
> index 6455567174b..00000000000
> --- a/meta/recipes-bsp/usbutils/usbutils/iconv.patch
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -This patch adds support for detecting iconv support using autotools
> -uclibc does not have iconv implementation inside libc like glibc, therefore
> -the existing checks were not sufficient, it worked for glibc but not for
> -uclibc. The new patch portably detects the iconv support and adds the
> -libiconv to linker cmdline
> -
> -This patch should be submitted upstream too
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Index: usbutils-008/configure.ac
> -===================================================================
> ---- usbutils-008.orig/configure.ac
> -+++ usbutils-008/configure.ac
> -@@ -10,7 +10,9 @@ AC_USE_SYSTEM_EXTENSIONS
> - AC_SYS_LARGEFILE
> -
> - AC_CHECK_HEADERS([byteswap.h])
> --AC_CHECK_FUNCS([nl_langinfo iconv])
> -+
> -+AM_GNU_GETTEXT
> -+AM_ICONV
> -
> - PKG_CHECK_MODULES(LIBUSB, libusb-1.0 >= 1.0.0)
> -
> -Index: usbutils-008/Makefile.am
> -===================================================================
> ---- usbutils-008.orig/Makefile.am
> -+++ usbutils-008/Makefile.am
> -@@ -29,7 +29,8 @@ lsusb_CPPFLAGS = \
> -
> - lsusb_LDADD = \
> -       $(LIBUSB_LIBS) \
> --      $(UDEV_LIBS)
> -+      $(UDEV_LIBS) \
> -+      $(LIBICONV)
> -
> - man_MANS = \
> -       lsusb.8 \
> diff --git a/meta/recipes-bsp/usbutils/usbutils_008.bb b/meta/recipes-bsp/usbutils/usbutils_008.bb
> index d3c5bd52a43..3c821eac375 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_008.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_008.bb
> @@ -11,13 +11,12 @@ DEPENDS = "libusb zlib virtual/libiconv udev"
>  SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
>             file://usb-devices-avoid-dependency-on-bash.patch \
>             file://Fix-NULL-pointer-crash.patch \
> -           file://iconv.patch \
>            "
>
>  SRC_URI[md5sum] = "cb20148c2e784577e924a7b4c560c8fb"
>  SRC_URI[sha256sum] = "6d5f16c2961df37e22e492c736a3e162a8fde24480f23a40d85f79af80d3fe95"
>
> -inherit autotools gettext pkgconfig distro_features_check
> +inherit autotools pkgconfig distro_features_check
>
>  FILES_${PN}-dev += "${datadir}/pkgconfig"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

