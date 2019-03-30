Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id C4E697C64B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Mar 2019 02:00:54 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id v20so4571300qtv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 19:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=y3Z2hl+LjTxAvnzVtzSMEv7xhvElNyq/mvTAKk3ydQs=;
	b=YPXAfRHUN7+3xIhuUKbNDmZhN68CsJRMhJwJiokyRavRW6rGNPJ3dTWa1uOrlX/Hmj
	W2aELIJZkw+0Y+v8ftiQ46SxUYt2FqFa14OgF+aOHzv/KqqnpTBw9DKffVhtSuB+SJ5N
	CQqVexpqv7shbSQeOPytrm2VbOTPe40TgducT4JXEvYeaAvH9xwzk7c2iquP3BwIhARg
	GiuRP4XdtRq6kSH0W7eaTja3TECprR2bzcVXFlvEKmsmHhkCYEIHTkJGlEKXKgh+1Pdb
	SzBtHEpe8UGq6iADAgVtUi1VWmGVBWnOgJA12CDdedPK9jZm7WSe8KnK/t9jqZxSTRD2
	zynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=y3Z2hl+LjTxAvnzVtzSMEv7xhvElNyq/mvTAKk3ydQs=;
	b=t43whz9tUuX3j7mwQs1k5JDHyzYvc2ceHojhesKoPsddgfha2bsDCYdi+wRBW695Ia
	D3XSTXitWsPwMeqNMwxVP2KaT55PhWVQHSmIiVpfZ13sSlYI4KwgntNoKzqny7IaXmtd
	r5InQE83TX0nWsq2cqQgCDmMnl2zM/rkRaFVZkrd4j/MIMft5e0e0N5QrsmWaaK8J/uR
	e0tpNrwHMYuR1ADkHZrBWhkRYe0COkN1k88/zsHrSN6r5Z8lMQKJJ9kpGICZC5FlOpZK
	Hw+kF0WlMinrIXXgVFfr3SADYvwCLvAw/N3cavzjVo502RpFG8wvcGLNxuudAH0xbZX5
	OHhw==
X-Gm-Message-State: APjAAAWzp6bva2UsumMD3s8DeCp6zPRcHYR9jEaOGsUICybRPNJ9/U0i
	8367nTDKyi/lmwPT3lyhILnAxI4P9eckLfeMDKg=
X-Google-Smtp-Source: APXvYqxaL81eAAF935ARA0EfriBZHCVWdnA70ASKCgy0i6eHJUUF1muN8ZDUuPPyTLNrFsArApZ6ZAL/7/T3mJEmXTw=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr42342792qte.196.1553911255368; 
	Fri, 29 Mar 2019 19:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190327142005.17453-1-ross.burton@intel.com>
In-Reply-To: <20190327142005.17453-1-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 29 Mar 2019 19:00:29 -0700
Message-ID: <CAMKF1sosOJ6_Dk-CAiyz38iyBpV3ty4df5Ya5e4m=ccGxLyRSQ@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] asciidoc: use Python 3 port
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
X-List-Received-Date: Sat, 30 Mar 2019 02:00:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 27, 2019 at 7:20 AM Ross Burton <ross.burton@intel.com> wrote:
>
> There's a sort-of-official port of asciidoc to Python 3.  Whilst the official
> replacement is asciidoctor which is rewritten in Ruby, this is a fairly trivial
> swap and removes Python 2 from core-image-sato builds entirely.
>
> Moving forward we should evaluate asciidoctor, but that can wait.
>
> Change the RDEPENDS so that python3 is only a dependency for target and
> nativesdk builds, for native this can use the host python3.
>
> Remove redundant DESTDIR export that isn't needed.
>

its failing on my archlinux builder, ideas ?

https://errors.yoctoproject.org/Errors/Details/234833/
https://errors.yoctoproject.org/Errors/Details/234829/

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> index 38164d55735..d0d15171ac4 100644
> --- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> +++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
> @@ -8,17 +8,20 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
>                      file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
>
> -SRC_URI = "http://downloads.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.gz"
> -SRC_URI[md5sum] = "c59018f105be8d022714b826b0be130a"
> -SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323cab4e1f0"
> +SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https"
> +SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
> +PV .= "+py3-git${SRCPV}"
>
> -UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
> +DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native"
>
> +S = "${WORKDIR}/git"
> +
> +# Not using automake
>  inherit autotools-brokensep
> +CLEANBROKEN = "1"
>
> -export DESTDIR = "${D}"
> -DEPENDS_class-native = "docbook-xml-dtd4-native"
> -RDEPENDS_${PN} += "python"
> -BBCLASSEXTEND = "native"
> +# target and nativesdk needs python3, but for native we can use the host.
> +RDEPENDS_${PN} += "python3"
> +RDEPENDS_remove_class-native = "python3"
>
> -CLEANBROKEN = "1"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

