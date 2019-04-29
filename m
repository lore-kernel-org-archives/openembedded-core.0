Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC0627DBBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 17:16:38 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c190so6397987qke.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 10:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tKUPV4bTE93uiMsnYP+/qqVTE9XkEbHStZgaHq56lOM=;
	b=tYjdHZgGMk3XLPIKwGBR4QrNCHguRgLq228z4m28pegc++m0Td/YrA7EtwoXR2CqNf
	bOrm7I7AF+ZXpImhihpSf1yh0ZOPPTD+1H6w5shXy3h97EoE/IVXqWoUXIf4+Ng6iC9Z
	qNIkvyiRNkWgK6FcVhnSC8Wt8ZEfNvue37cEFTnQstiePJaI1Pd93jy8LVtIQnLnaNCA
	rtZi6txiW1JLn/SbQAIq5ry4PzShTJ3eMQ8LhIMb7tFfCKk6yIaXR/wQEM0Lfh0j5ELQ
	TAb6+s7Dpfw+3p9tA6lv4/usHG5H4ShYjMupQ/QU+Ugj9GQKu24QnGP4fM/EwgYH3pHU
	PoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tKUPV4bTE93uiMsnYP+/qqVTE9XkEbHStZgaHq56lOM=;
	b=P87FtGPJv+zm2jadxDZPdFVw+aBJH/3O503ksgj7zJJz+inbIG8iYcLpcwjyYjlMr3
	ve/gWfHFtENs2tOhtC6LYnyp/hK09R4ZiMXCtNEHQaEZRHgMbqRnKBCskw+7yPI+3Y/z
	zJfpfcEX52JtIeCasrINjH4sZ7yZZVN9388E8BUBDpRwR1Tudm1et6JdvN63c1llkqx/
	jWdgBrkwn0ztNL6+vS8ldldB8hUO0yiFu/BUidPRNwWsrIQoVtLz/HmEMD/6miz/9tcJ
	tVhGFBQi/oK/yyvzOx026t59Wj3Ff+qJJqhA5d3oplR7Q2LepPzWxZ12XUEVwf6OxD5G
	MNyg==
X-Gm-Message-State: APjAAAUzF2C1hn40DjudiqhCwNQGCLJajzGYRzMoa2Uvrh1gpw36ZQbr
	x34UZPzPSmTigci1J45DCf4sPtfnkOG9MxNtECs=
X-Google-Smtp-Source: APXvYqwq/Zk0DXaBoiCodeBxl7HgSUmdmVgHgOzoYa1O86DFWv2WYHe4stRxb4JVD5NQAka1xJpU+fbwlfx0Zzswh5I=
X-Received: by 2002:a37:a849:: with SMTP id r70mr39286129qke.315.1556558199518;
	Mon, 29 Apr 2019 10:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190418155918.40653-1-alex.kanavin@gmail.com>
	<20190418155918.40653-2-alex.kanavin@gmail.com>
In-Reply-To: <20190418155918.40653-2-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Apr 2019 10:16:13 -0700
Message-ID: <CAMKF1soCnBA+kgUqV-XBKfz554c1ecWXyRPn7DXJzRofkcfC0Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] epiphany: update to 3.32.1.2
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
X-List-Received-Date: Mon, 29 Apr 2019 17:16:39 -0000
Content-Type: text/plain; charset="UTF-8"

FWIW Fails on rpi3
https://errors.yoctoproject.org/Errors/Details/238639/

On Thu, Apr 18, 2019 at 8:59 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Drop an option no longer provided by upstream.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb}   | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta/recipes-gnome/epiphany/{epiphany_3.30.3.bb => epiphany_3.32.1.2.bb} (80%)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> similarity index 80%
> rename from meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> rename to meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> index a64c82f48bf..ba2e851bb6f 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.30.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.32.1.2.bb
> @@ -13,10 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
>  SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
>             file://0002-help-meson.build-disable-the-use-of-yelp.patch \
>             "
> -SRC_URI[archive.md5sum] = "fd05702b1c9bcb6a0633de54c4a6ccd2"
> -SRC_URI[archive.sha256sum] = "76cdb8db6af2da8c3371a73e2dfd5ba64867b5f1e65fa9621f35348a42ff0d17"
> -
> -EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
> +SRC_URI[archive.md5sum] = "93faec353e9f62519859e6164350fd5d"
> +SRC_URI[archive.sha256sum] = "a8284fb9bbc8b7914a154a8eac1598c8b59ae421e0d685146fb48198427926be"
>
>  FILES_${PN} += "${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers ${datadir}/metainfo"
>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme gsettings-desktop-schemas"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

