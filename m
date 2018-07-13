Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1966011F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 12:09:28 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id r16-v6so61821683oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 05:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LupeP7Eon7w2K4FVliqCP1WqgDMEHsbofYwuBuLCgtg=;
	b=PYU5wa0/q6pnqdIEzxvuT+dwj/nQ1y55KQEKyqBjhEslvVZlouK8XOx8EwzjW2vQdK
	lEYn+65FMY84VPWQvEljOuhCddB8AZTqcLzNH8cwB2FAj9InZXIitkVfRkLt5/YdZcAd
	fvEh2dP/ZR6XjbAxcgz+bVQiCVc4r1RQUexO4sZXUlvG30dfFFuzEuVH6Vc+hSVbyb1s
	CS7i3gVeabrxKFYAokUW5DlPdnmLKFoXQBuC3ZmLhnkmK/gtCecz2/oTlPJp9ejIvsGd
	HIhWVdIkOhDP/8VBxBPOlw3tn+jL6pzZqOu5zcat+Sc0bPPpwtpc53pWeeVpEaVEHSG/
	pQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LupeP7Eon7w2K4FVliqCP1WqgDMEHsbofYwuBuLCgtg=;
	b=hi6ogyIUDfaUs2yMZrRMXpToAlRVs9ifsceuA5Hj+CiFxctQa/QM2B7Y8YOLK7nMe+
	/aJV6F/QbmQdUEFvxfwLVI9asY3Bjs+lundSmm/yBn34s38Qv/K2DoU7YXVZztT8TFUt
	LxACbE/t9hYOUR8s1B7rd0cwfnTFces6sXJ5182D38vTjiSw0HEFJc6Vq19VbqzAFRI5
	/00My67KOgfebDe9hdayFx9qnfPDOWkLGMazsgMh9CZz5ITBJxmzPA3tDdbSAtjjqP6b
	HGav+F9m4KJSu7ucWi3+0DX9KkusYeN/uC87POHhJTIVP6UP2GwWqOaIeWX1lmlEafVk
	M7/Q==
X-Gm-Message-State: AOUpUlGt7LMyBdlRgQieTAQl0QTJhaBJDddlwKIuxXEHel9FGRZNBdrT
	v7LuDPwMIyKX9E0p1zIZNb6uPM7Ox64rTX9sk0PJI0tt
X-Google-Smtp-Source: AAOMgpdgjMC1VyJorAVyQoJocVvs1T+kLi22U58O0EfIelEfTgbWBSHSnIJC/vwACetC11DmHid+7bXt3LVX6MJcvlY=
X-Received: by 2002:aca:3f41:: with SMTP id
	m62-v6mr7102030oia.18.1531483770059; 
	Fri, 13 Jul 2018 05:09:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 05:09:09
	-0700 (PDT)
In-Reply-To: <1531257526-30932-1-git-send-email-derek@asterius.io>
References: <1531257526-30932-1-git-send-email-derek@asterius.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jul 2018 13:09:09 +0100
Message-ID: <CAJTo0La=8MRccUzwb0Eo3bBOD=xGmd+RRfrR-jz15HJdJh_-RQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-pycairo: update to 1.17.1
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
X-List-Received-Date: Fri, 13 Jul 2018 12:09:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Derek,

Breaks under multilib configurations:

| mv: cannot stat
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-multilib/build/build/tmp/work/core2-64-poky-linux/python3-pycairo/1.17.1-r0/image/usr/share/lib/pkgconfig/py3cairo.pc':
No such file or directory

(https://autobuilder.yocto.io/builders/nightly-multilib/builds/1142/steps/BuildImages_2/logs/stdio)

I suspect that the path will be .../usr/share/lib64/pkgconfig/...

Clearly that path is wrong.  Would it be easier to fix the setup.py
and send a patch?

Ross

On 10 July 2018 at 22:18, Derek Straka <derek@asterius.io> wrote:
> Update the python3-pycairo package to the latest stable version and
> move the .h and .pc files to the standard location
>
> Tested on the qemu with core-image-minimal
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  ...{python3-pycairo_1.15.6.bb => python3-pycairo_1.17.1.bb} | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/python/{python3-pycairo_1.15.6.bb => python3-pycairo_1.17.1.bb} (57%)
>
> diff --git a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb b/meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
> similarity index 57%
> rename from meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
> rename to meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
> index 5c3e1e6..54e7dcd 100644
> --- a/meta/recipes-devtools/python/python3-pycairo_1.15.6.bb
> +++ b/meta/recipes-devtools/python/python3-pycairo_1.17.1.bb
> @@ -13,8 +13,8 @@ DEPENDS = "cairo"
>  SRC_URI = "https://github.com/pygobject/pycairo/releases/download/v${PV}/pycairo-${PV}.tar.gz"
>  UPSTREAM_CHECK_URI = "https://github.com/pygobject/pycairo/releases/"
>
> -SRC_URI[md5sum] = "3ff210c34e7b052590e15fd0fb147766"
> -SRC_URI[sha256sum] = "ad150ea637860836b66705e0513b8e59494538f0b80497ad3462051368755016"
> +SRC_URI[md5sum] = "34c1ee106655b450c4bd57e29371a4a7"
> +SRC_URI[sha256sum] = "0f0a35ec923d87bc495f6753b1e540fd046d95db56a35250c44089fbce03b698"
>
>  S = "${WORKDIR}/pycairo-${PV}"
>
> @@ -25,7 +25,10 @@ CFLAGS += "-fPIC"
>  BBCLASSEXTEND = "native"
>
>  do_install_append() {
> -    install -d ${D}${includedir}/pycairo/
> -    install -m 0644 ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
> +    install -d ${D}${includedir}/pycairo/ ${D}${libdir}/pkgconfig
> +    # setup.py uses --install-data which points to a non-standard datadir  to install the header and .pc files
> +    # Fix the paths here to install in the standard locations instead
> +    mv ${D}${datadir}/include/pycairo/py3cairo.h ${D}${includedir}/pycairo/
> +    mv ${D}${datadir}/lib/pkgconfig/py3cairo.pc ${D}${libdir}/pkgconfig/
> +    rm -rf ${D}${datadir}
>  }
> -FILES_${PN} += "${datadir}/include/pycairo/py3cairo.h"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

