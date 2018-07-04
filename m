Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id E650A74580
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 16:29:01 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id v8-v6so11734334oie.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 09:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hl95eOLBsJRJOqD/iRinUajhv47UQrqCKWFHhlraJTM=;
	b=FNBN7ANCvWjpXp4/KbM1J+TD8y7BsywfBVJ3SEv6AtlsNzt6QYLWqRq9ThwlW7pPZc
	QxPoMZKM410HuK4bgRcTBmM12tF1+MiGNO9Y9R2ArSvsjicN0lITMeRDgE4xVTFDH39E
	e20pFKRTJlkVzZ7cJnvugHp/g2Upfjxjcs9sfObdrfGu3jmpgufBE71zodNcapGl+6Qc
	JISWlLbclVWOUQ0FuKbZ5OJ8NC/ih5lMIavR8TXTsTYnKeO77Dml76aWFuoD6qfnXhIC
	hoU+tvpREBM+iWiWFrN4kgjvbdyiesjwIdo51O2pO31ETQbJRBU/ioHLkSnOnTccZY3h
	mVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hl95eOLBsJRJOqD/iRinUajhv47UQrqCKWFHhlraJTM=;
	b=ox/y993Q+HyXO2x+jDqsRl+UNbMEYLw8fFmSAXQF+9B0TALDEa18mFj7he9ZO5ChSH
	nTahY27EUfjOjcfW39pShDCtqVmoNzmUQSvxy2DCSirnVJw5H3rgRQAnsCDaPrYplXtp
	6UysjniKVvi5ZWu+zyTKsydBOGRQ9KvnQG31pa1TVSW8Ed1wPbuaf7JEKBpDl8UC6gq3
	igJSoVO6veSID0Go7Ov3uc1jy/opPsWZ2nY85uTxkIQyw4MfubvrZQMiX79Sc2Ce10hb
	G7yDxJcDJhv8iUuiWuf+0Mm70qABOfOOOB9H8Bna13cmMh0CEDtprtQZwzK6WEvMWTrZ
	xVBg==
X-Gm-Message-State: APt69E3WoUg9nYvhar9yHmCPDu1R7oRnEjkNMiWUxEXLejmZhtHDe711
	Iia6lDnQg2nNtGfF8jSS0CZ2EdMQx9vwXdWCmItSdQ==
X-Google-Smtp-Source: AAOMgpdhSaNF+siObLamyhIZ4BLYN47WELVK/U/A2mDUjXTPorfwrCtvYUVmr+AJVXda/95WH5L8FfT8JBShk6kFzeY=
X-Received: by 2002:aca:5dc5:: with SMTP id
	r188-v6mr3062455oib.320.1530721742780; 
	Wed, 04 Jul 2018 09:29:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Wed, 4 Jul 2018 09:28:42 -0700 (PDT)
In-Reply-To: <20180704001137.41385-1-raj.khem@gmail.com>
References: <20180704001137.41385-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jul 2018 17:28:42 +0100
Message-ID: <CAJTo0LY75OXe6AmZvdOkT2LRe58k9ZEzgYBtf_xbqnhu7waY=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] mesa: Fix bild with waylang and egl
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
X-List-Received-Date: Wed, 04 Jul 2018 16:29:02 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW historically we just prepended PKG_CONFIG_SYSROOT or whatever the
spelling was to the result of the pkg-config calls.  I didn't know
about PKG_CHECK_VAR before, that's really useful!

Have you tried pushing this upstream?  Also note that I've a branch
moving Mesa to Meson so we'll need to fix this again...

Ross

On 4 July 2018 at 01:11, Khem Raj <raj.khem@gmail.com> wrote:
> When we have wayland enabled with egl then it enables the wayland
> plugin which actually fails to build because its not finding wayland-protocol
> xml templates in proper location which is recipe sysroot since
> we are cross compiling
>
> Fixes build errors e.g.
> make[4]: *** No rule to make target `//usr/share/wayland-protocols/unstable/linux-dmabuf/linux-dmabuf-unstable-v1.xml', needed by `drivers/dri2/linux-dmabuf-unstable-v1-client-protocol.h'.  Stop.
> make[4]: *** Waiting for unfinished jobs....
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> V2: Rebase on master
>
>  ...ss-compile-WAYLAND_PROTOCOLS_DATADIR.patch | 24 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  2 ++
>  meta/recipes-graphics/mesa/mesa_18.1.3.bb     |  1 +
>  3 files changed, 27 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
>
> diff --git a/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
> new file mode 100644
> index 0000000000..b4e3c4995f
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch
> @@ -0,0 +1,24 @@
> +use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
> +
> +This allows to override the wayland-protocols pkgdatadir with the
> +WAYLAND_PROTOCOLS_DATADIR from environment.
> +
> +pkgconfig would return an absolute path in /usr/share/wayland-protocols
> +for the pkgdatadir value, which is not suitable for cross-compiling.
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +Index: mesa-18.1.2/configure.ac
> +===================================================================
> +--- mesa-18.1.2.orig/configure.ac
> ++++ mesa-18.1.2/configure.ac
> +@@ -1808,7 +1808,7 @@ for plat in $platforms; do
> +         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >= $WAYLAND_REQUIRED])
> +         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >= $WAYLAND_REQUIRED])
> +         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED])
> +-        WAYLAND_PROTOCOLS_DATADIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
> ++        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
> +
> +         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> +
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index d1723e3506..fed2900577 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -109,6 +109,8 @@ FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
>  CFLAGS_append_armv5 = " -DMISSING_64BIT_ATOMICS"
>
> +EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
> +
>  # Remove the mesa dependency on mesa-dev, as mesa is empty
>  RDEPENDS_${PN}-dev = ""
>
> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.3.bb b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> index c47c57e9d8..6af1216b79 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.1.3.bb
> @@ -9,6 +9,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>             file://0006-Use-Python-3-to-execute-the-scripts.patch \
>             file://0007-dri-i965-Add-missing-time.h-include.patch \
>             file://0008-egl-fix-build-race-in-automake.patch \
> +           file://cross-compile-WAYLAND_PROTOCOLS_DATADIR.patch \
>  "
>
>  SRC_URI[md5sum] = "b34273403a605f6f98ead00f0bdf8e0b"
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

