Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1825C6D755;
	Thu, 27 Feb 2014 08:23:57 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id u14so1173976lbd.19
	for <multiple recipients>; Thu, 27 Feb 2014 00:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ybg4/5xRK1kFazxfW3A8mZMKGSDyxorDgVvL3AEpmmU=;
	b=jZMXwX9Ihl4xntXQA88n67JM82UynKdS1aMPf/k+OSQGQeVBjhcpbUv4OTzjCJcVrr
	+sLxzOvV9v4eSeIAfs1iClLVntBZI/1R8wYiEjVJW2FwUCHYxJ58zPNrtBcNv+wa8qCH
	uTio7fxft4tnSCaLDJqyILeW+BJXVRgvHs31qXQfYDlMe2mVwR6ylSqI4efGGRhCyE6Y
	N6PKy5xDNh+jlLAdeXf/fv2v+ys7FPqUShJEAYRVpI+/OOE/2paW0qk3DC3ikCwN1Y0S
	g7tkcVyuoJdKSn70cpPC+8MsAuwgbDuXMlY4xBVKvOq/wYXD7Cc5lr5EkIPYQ6HPBMra
	aEPg==
MIME-Version: 1.0
X-Received: by 10.112.161.2 with SMTP id xo2mr65036lbb.80.1393489436921; Thu,
	27 Feb 2014 00:23:56 -0800 (PST)
Received: by 10.112.162.100 with HTTP; Thu, 27 Feb 2014 00:23:56 -0800 (PST)
In-Reply-To: <20140226235001.GW26981@jama>
References: <20140226235001.GW26981@jama>
Date: Thu, 27 Feb 2014 09:23:56 +0100
Message-ID: <CAAQYJAs9_Vmrz_qhjoFwyL8jgZY59MC2bFAtGFDhw2pOokwTVQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-02-27
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
X-List-Received-Date: Thu, 27 Feb 2014 08:23:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 12:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> == Failed tasks 2014-02-26 ==
>
> === common (8) ===
>     * meta-openembedded/meta-gnome/recipes-gnome/devilspie/devilspie2_0.24.bb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb, do_configure
>     * meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, do_compile
>     * meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/inih/libinih_git.bb, do_install
>
> === common-x86 (5) ===
>     * meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_install
>     * meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>
> === qemuarm (7) ===
>     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_2.3.2+svnr159807.bb, do_compile
>     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_12.2.bb, do_fetch
>     * meta-openembedded/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.8.13.bb, do_configure
>     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4.4.bb, do_compile
>     * meta-openembedded/meta-oe/recipes-support/mongodb/mongodb_git.bb, do_compile
>     * openembedded-core/meta/recipes-bsp/grub/grub_git.bb, do_package
>
> === qemux86 (1) ===
>     * meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb, do_compile

This failure seems originated by some driver update/misconfiguration
(there isn't any specific kernel config for qemux86 and
l-y-t-kexecboot)

.../drm/drm_mm.h:105:2: error: implicit declaration of function
'BUG_ON' [-Werror=implicit-function-declaration]
|   BUG_ON(!hole_node->hole_follows);
|   ^
|   CC      drivers/pci/setup-res.o
|   CC      drivers/gpu/drm/i915/i915_drv.o
| cc1: some warnings being treated as errors
| make[6]: *** [drivers/gpu/drm/ttm/ttm_agp_backend.o] Error 1
| make[5]: *** [drivers/gpu/drm/ttm] Error 2

and later
... make[4]: *** [drivers/gpu/drm] Error 2


Apart this I see a lot of warnings about Intel drivers and some others
which I don't see when building for arm.
AFAIS nothing needs to be fixed in meta-initramfs.

Regards

Andrea



>
> === qemux86_64 (1) ===
>     * meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb, do_configure
>
> === Number of failed tasks ===
> {| class=wikitable
> |-
> ||qemuarm       ||15    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140224_083255.log/
> |-
> ||qemux86       ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140224_180733.log/
> |-
> ||qemux86_64    ||14    ||http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches//log.world.20140225_233246.log/
> |}
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

