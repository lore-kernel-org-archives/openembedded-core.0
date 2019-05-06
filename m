Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 136416BE39
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 14:36:16 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id k18so9307703lfj.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 07:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=XtTdvGePt3C9N0xOlvw5tC5A67edWZ2MDlDF3U9oMb8=;
	b=giwpZKUG7DjE49GKclO79UB0QTqO60Alt49jvzPrzDoXuaK4YVzMY64khJnVXY4otL
	5okyjfTZSu/8Pv4GjEdTs+uXN/1rZ7MJK517WSjf1rZkPv50iZ9D/k0T45VWzbqKFLNB
	Ih142akWrgTWzLZoI7sF9E3qQfMxUIUAomoV7/+2NmC+PxU7rZT7DYX8fmV5VTU2ZB+A
	EdZqJKATGF6OOKsEkEVSSJW6Q953HSSHhTT0q4vy+dtQsFs95tQ1W5+mqSJpgeZv39ui
	RwYoD2p4srOl3kempNcgOb5HdeanBjYQ6UhCXTpxtXrUn9shoqcc1LTVfSD7nUbImAr4
	g8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=XtTdvGePt3C9N0xOlvw5tC5A67edWZ2MDlDF3U9oMb8=;
	b=s0hDxk5gcFONahPa2si/6C/7e4RTboVcZMpC8gG+uc3VKOU8o8D4OhxaLdazaUQEv1
	C6HIS4NFUSLoXiprrQOtEN38Esi0YB/jjFRueUjTy6fivuaT0GVnO8+NyrB3bLMEEfVO
	yRmoPEdNuuEfaazVzbOHOHNZz7sFLU1iPhYH15oXbQEMrzCxt0Bi0o9658bkUszP0Gqe
	a0lQdgAi91id0HLOjuQ8Z+yAkTUsbTRtgJvB8cc4XJIZjRbXp0G8A7HKzawVmJBDE/fZ
	wQUtb+Bg+Syh+zZE1unRq/ubk8srDQjSDXmeJa7Vg80Rx4IAub3/hX6MlSHxxL5bv4pr
	oOvg==
X-Gm-Message-State: APjAAAXjFT6mFw2xTrXQMHy/uIsybqRYGO/0zXgNR6m+h5bonHCFGz6l
	/FZKKaS5ew31CH9XGu70HPsYIw==
X-Google-Smtp-Source: APXvYqy87Ty/PuB9B87Kx5tQX9W/6ltWj/hmHcPkgb/j3ZduHnyJbt35xd8z/f0+p9kq1jSrfQuMlQ==
X-Received: by 2002:ac2:4186:: with SMTP id z6mr834295lfh.50.1557153377468;
	Mon, 06 May 2019 07:36:17 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z12sm2638403lfh.72.2019.05.06.07.36.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 May 2019 07:36:16 -0700 (PDT)
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <bdd177a6-9d65-ed60-cb2f-20fea4effbea@oleksandr-kravchuk.com>
Date: Mon, 6 May 2019 16:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2] ell: add recipe
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
X-List-Received-Date: Mon, 06 May 2019 14:36:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Khem -

Is it being hold for a specific reason or it was just lost? Thanks.

On 24/04/2019 07:16, Oleksandr Kravchuk wrote:
> ELL has originally been part of meta-openembedded, but newer versions
> of some of the oe-core components depend on it, e.g. ofono.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-core/ell/ell_0.19.bb        | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-core/ell/ell_0.19.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 41c2a95d53..c00e5b8c65 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -166,6 +166,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.19.bb
> new file mode 100644
> index 0000000000..8f635e673c
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell_0.19.bb
> @@ -0,0 +1,22 @@
> +SUMMARY  = "Embedded Linux Library"
> +DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
> +low-level functionality for system daemons. It typically has no \
> +dependencies other than the Linux kernel, C standard library, and \
> +libdl (for dynamic linking). While ELL is designed to be efficient \
> +and compact enough for use on embedded Linux platforms, it is not \
> +limited to resource-constrained systems."
> +SECTION = "libs"
> +LICENSE  = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> +
> +DEPENDS = "dbus"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
> +SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}

