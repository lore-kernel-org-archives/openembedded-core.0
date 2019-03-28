Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2BB7C8B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:30:18 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id w18so5964484itj.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=86HqDByKp7cGlZ8G0Js2HFYJ35GXQ8BtYXcBfNGdZMs=;
	b=mwtLfDnuHYdiAv/sLAMgc8RWEfu+FAvBP4WmJXovq0j72A4u3j2ap2C2QSnPVEZRmm
	07Y4surS8ci1YPsUzMYe3V/ULqJtwWvcttRpJ76ykkCrAUj6uCUFK9VsQTqGtR1qm2Rv
	LuASYplLE+VQVX8v2Aifp55C/pmXXlZMc1Cl3C3oYcAW2GYVzDaQZucEue3+6p87B9Cp
	mdSvo9SmKzbuKYoDR/CLmm/QIT6tt8EPUevyk6QXE13W6Lb/vy0AtHdbjvWApSHd6/wA
	2PNG0tHdvINhf+DO0Vatw4i4P6zaWMFL7wt5NWs/nhk+CTSdFY7KTi/naWBqdWnGcCTV
	tiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=86HqDByKp7cGlZ8G0Js2HFYJ35GXQ8BtYXcBfNGdZMs=;
	b=YLirX2jdVEiQiqHygp2cqdvlcbllcWJNzoNJjb9zvVveLIfi+4o4EnvwegUlR5ZwHg
	6oD9R5bqurYc95i4FabCuM9t1qiDGYBUCs4OSUoYO6U3w+x0Km0IwiL+aCfeWeEo+KQd
	guMhN5Hn7Bl5iRERB7BTnFquzLdDKeRhiSd4OFYp/IhxGSjmjefogeusnDkrLls5ESKY
	yHEBeghm3HqWIsXIJY/XSAmRnCBew4kFpIC0FN5dmUcXIC0Yv7uam01cZmtpePyACAin
	TE0oWxbQIPFPrVltE57cVFipmcyAhNLWSu5zfc4/ZJ10qCDAARaIEhMdpXgfS7xXucMe
	BQcQ==
X-Gm-Message-State: APjAAAWzHxsNnzPRmkfrPq2eAI8uDi9tx7I3tGFclvUxATlpyFFlxqFg
	N9tEWBPlosYj7uoKTMavfhoixC4EesjN2M8bwZL4lg==
X-Google-Smtp-Source: APXvYqwLDrOB/z3ZpUNvPBn6G/Q2Ug8ucpfgydHt6ezMtr9Fqop/kxYjijvhBBplIzA5Kjr2ItlESR/a4owbWEsoLwo=
X-Received: by 2002:a02:7654:: with SMTP id z81mr31765279jab.79.1553779819873; 
	Thu, 28 Mar 2019 06:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190327081852.20155-1-zangrc.fnst@cn.fujitsu.com>
	<20190327081852.20155-3-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190327081852.20155-3-zangrc.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 13:30:09 +0000
Message-ID: <CAJTo0Lb0UXAbJn22YtJU=5Ax3KrW8kB8vpL8BNjDjPKrM6Ov_A@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] at-spi2-core:upgrade 2.30.0 -> 2.32.0
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
X-List-Received-Date: Thu, 28 Mar 2019 13:30:19 -0000
Content-Type: text/plain; charset="UTF-8"

Documentation got disabled:

packages/corei7-64-poky-linux/at-spi2-core/at-spi2-core-doc: FILELIST:
removed all items
"/usr/share/gtk-doc/html/libatspi/right-insensitive.png
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-table-cell.html
/usr/share/gtk-doc/html/libatspi/AtspiMatchRule.html
/usr/share/gtk-doc/html/libatspi/api-index-full.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-image.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-misc.html
/usr/share/gtk-doc/html/libatspi/AtspiAccessible.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-constants.html
/usr/share/gtk-doc/html/libatspi/AtspiRelation.html
/usr/share/gtk-doc/html/libatspi/AtspiDeviceListener.html
/usr/share/gtk-doc/html/libatspi/index.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-value.html
/usr/share/gtk-doc/html/libatspi/AtspiObject.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-registry.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-selection.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-table.html
/usr/share/gtk-doc/html/libatspi/left-insensitive.png
/usr/share/gtk-doc/html/libatspi/annotation-glossary.html
/usr/share/gtk-doc/html/libatspi/up.png
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-listener-private.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-types.html
/usr/share/gtk-doc/html/libatspi/right.png
/usr/share/gtk-doc/html/libatspi/style.css
/usr/share/gtk-doc/html/libatspi/up-insensitive.png
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-misc-private.html
/usr/share/gtk-doc/html/libatspi/AtspiStateSet.html
/usr/share/gtk-doc/html/libatspi/ch01.html
/usr/share/gtk-doc/html/libatspi/AtspiHyperlink.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-action.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-collection.html
/usr/share/gtk-doc/html/libatspi/left.png
/usr/share/gtk-doc/html/libatspi/libatspi.devhelp2
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-editabletext.html
/usr/share/gtk-doc/html/libatspi/object-tree.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-document.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-component.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-text.html
/usr/share/gtk-doc/html/libatspi/libatspi-AtspiApplication.html
/usr/share/gtk-doc/html/libatspi/libatspi-atspi-hypertext.html
/usr/share/gtk-doc/html/libatspi/home.png
/usr/share/gtk-doc/html/libatspi/AtspiEventListener.html"

Ross

On Wed, 27 Mar 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> upgrade from at-spi2-core_2.30.0.bb to at-spi2-core_2.32.0.bb
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.32.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/atk/{at-spi2-core_2.30.0.bb => at-spi2-core_2.32.0.bb} (92%)
>
> diff --git a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb b/meta/recipes-support/atk/at-spi2-core_2.32.0.bb
> similarity index 92%
> rename from meta/recipes-support/atk/at-spi2-core_2.30.0.bb
> rename to meta/recipes-support/atk/at-spi2-core_2.32.0.bb
> index d0b567a5e5..0eaa7b55c5 100644
> --- a/meta/recipes-support/atk/at-spi2-core_2.30.0.bb
> +++ b/meta/recipes-support/atk/at-spi2-core_2.32.0.bb
> @@ -8,8 +8,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
>             "
>
> -SRC_URI[md5sum] = "d4f22c66b3210ffe6b10d01c04e008b5"
> -SRC_URI[sha256sum] = "0175f5393d19da51f4c11462cba4ba6ef3fa042abf1611a70bdfed586b7bfb2b"
> +SRC_URI[md5sum] = "57269004541646c4c5cf0bcb7c99bb5b"
> +SRC_URI[sha256sum] = "43a435d213f8d4b55e8ac83a46ae976948dc511bb4a515b69637cb36cf0e7220"
>
>  X11DEPENDS = "virtual/libx11 libxi libxtst"
>
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

