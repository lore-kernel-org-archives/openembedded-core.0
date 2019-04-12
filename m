Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 42F207DB69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 18:54:08 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id t11so3766865lfl.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=L8/xLHMx7NCYCtkxup94/xi9VKfAnWUHI1UF67IDDGs=;
	b=GEu+xe6SshHZ2mz243Y0KkH/V3VE2jJ0yj1tzjokGJNY9UZou13o+VP2JI5z2oBkDA
	Qzehby/SFvdvRJ/nFKyJbkNpr0x1ewiHdGXodGPwhloBe6NXtZ34Jz2KeLf3dvMRuSf2
	0i0beKxnhIur9G3l+y9/RFhlvJp+bTmtnrzIXikJ4xEuLAs8jA3wG/LLMM5vD575DfC8
	CL9pnTA9Sps8XW67LIrtcUO/M6KaC5uo457OOtrrUIZIDRXMAMkZAQBQu6amqUpZ7SEw
	P/Rb7DFL6tfEk9MPiOz9JKrKHmjgOnmfv6MpE5JpDXiiP1tMZgnufyLZYmRbYDsr77M/
	n4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=L8/xLHMx7NCYCtkxup94/xi9VKfAnWUHI1UF67IDDGs=;
	b=KmbiZOrkB0Uk0CypCRoqWzq6L8idIw7YN1Kip1XykCz9fWb/VA+W3akuYH0eR8Fcwk
	oYP9l4vocU31+KkC+sH4rvzhQtRl5Nzs2Ny6f9am6X7UhHNyZYQxsyrfKE6I7eHUbz35
	kHecaeLDOJSjuJ4aVowuiLmZDK4KWhLoDJ/Ub1NXTYwUYwBn0ZpZTCjE9lHu5oylMxqK
	sZrXn2f7dytwfuCYgd8PqfTAKeH6q8uBb1aGgyS9A+Zzy81/Nqo1pzsCrrPLMiC4wu1E
	zfYfaoxj5JuHQs/BGXJ5jlSyU701QOijpWTX51xfOOhEyrMVomq0CL6GJLpGXtzfmcF8
	HxDA==
X-Gm-Message-State: APjAAAUVGr8X6jJK+3LAClJlf4WN/BjNMRTD3AK3tGKW1uO2awIjpMNP
	bbFDS/h/Vmmv27qA69i1H1nw3PPfS3Y=
X-Google-Smtp-Source: APXvYqwXxlqvj/hhAtvZC+yr8auQ9O6hzstVfeErYbOWVqZJ5C0JZkPAwTFn5bO4xthZNOYVjj6G7A==
X-Received: by 2002:a19:2d57:: with SMTP id t23mr10136089lft.99.1555095249152; 
	Fri, 12 Apr 2019 11:54:09 -0700 (PDT)
Received: from [192.168.0.8] (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	m23sm8404039ljh.93.2019.04.12.11.54.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Apr 2019 11:54:08 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <20190409181955.13824-1-open.source@oleksandr-kravchuk.com>
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <f01a1132-b39e-7e72-65b8-258f0fa20ad2@oleksandr-kravchuk.com>
Date: Fri, 12 Apr 2019 20:54:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190409181955.13824-1-open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH v2][meta-oe] ell: add recipe
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
X-List-Received-Date: Fri, 12 Apr 2019 18:54:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping.

On 09/04/2019 20:19, Oleksandr Kravchuk wrote:
> ELL has originally been part of meta-openembedded, but newer versions
> of some of the poky components depend on it, e.g. ofono.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-core/ell/ell_0.18.bb        | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-core/ell/ell_0.18.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 950b8e8951..62de7d21bc 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -165,6 +165,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell_0.18.bb
> new file mode 100644
> index 0000000000..ca27f4dcda
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell_0.18.bb
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
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "18e2be697a54811e49bbe34590a13a42"
> +SRC_URI[sha256sum] = "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a1748d9ab8ac4ee7e3"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}

