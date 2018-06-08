Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 797A47506D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 19:52:26 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id k14-v6so9631182uao.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2018 12:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=UtkGFn+XQrhrlIzFKaDBO8AV/qDmV4BK4GFONvDe+nk=;
	b=m9ADHzhSYZ5SB25LdrGJoE9J/mFe0kC0fJJb8AmO4tSfMmit+Z3ZgMvitQWxhNz4hX
	5DleydIXN5xCT3YMLMVNqCEAMwakDYyuVHMn8xbz8CSVnv1hNEZs6WNpK6u/Br9E6OxJ
	WfuKCJefylnFyvuKBeAx5CrkuVj2hqB0jUcwwh5BQiUTzHfGZaRZmga4+u4okh9GEehT
	uLPV/uZP/1PziGPSWDY97sQJ6FQv7QGVHv6izNko72WnyqzBM/p+xtsf45znLPWJrR3A
	AB1Y+MqFlwvQU3ZjBXP2IoV88wvZx53xHhq41fi2PFNwdfRNpU/VF2GihFj7pwnB5X74
	MDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=UtkGFn+XQrhrlIzFKaDBO8AV/qDmV4BK4GFONvDe+nk=;
	b=swO1gxXJFIHdQVi/ckg9uSGhXPEic9HhV1mV8ceiXTjrZWW1Z/TJN9iBZrhdDG6ivj
	3vnl0Fcw0WIY6QaQP9YZNhQUHbLqXNLi2QMmKLlSAk8CfeindaXFSDSCgwRyUhmT3cWb
	fIJSbF2j4HnoF414rd6EbM3HaN+/FoY4Orab3nI32RYoYBbbzKm4CTCbeHOsAUHZR80B
	ybvi/OJjHUop14+WzembMbHexxqW7wlHskVd4JiD7eN4WfwgqcLsRfiYYO2hkKgnrKS6
	AoJwy2erX/0dCOLdLVEpnWATwgImEIwLBxZXXENZYtlT7GSTitxAR2WjwNqmdNr4bdk9
	SErg==
X-Gm-Message-State: APt69E3LeVKSpPlr9LY9WXQLJezFHMOQjjEnn6nBUlpvuG0EaKPX4Zh6
	i7Eml2w962KHjRO6AD2yl3GpEzMyh9wQ/Uy30Bo=
X-Google-Smtp-Source: ADUXVKJ0JL+sYoRgEh2xA7GACxfY6J0VuanZzXIrg89E0omhhECXxnUms22zfMDXLGUr+dd86wg5HR618B1XJGDNDkk=
X-Received: by 2002:a9f:3352:: with SMTP id
	a18-v6mr5116719uac.38.1528487547025; 
	Fri, 08 Jun 2018 12:52:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 8 Jun 2018 12:52:26 -0700 (PDT)
In-Reply-To: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
References: <1527207259-30592-1-git-send-email-armccurdy@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 8 Jun 2018 12:52:26 -0700
Message-ID: <CAJ86T=XMSRRnwXqF2J8s=mTYx9rzuN49hRKKJphfPQx-EYj7dQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] cpio: move contents of cpio_v2.inc into the cpio recipe
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
X-List-Received-Date: Fri, 08 Jun 2018 19:52:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 5:14 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Merge contents of cpio_v2.inc into the only recipe which uses it.

Ping.

Any issues with this (ie the whole series of 3)?

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-extended/cpio/cpio_2.12.bb | 40 ++++++++++++++++++++++++++++--
>  meta/recipes-extended/cpio/cpio_v2.inc  | 43 ---------------------------------
>  2 files changed, 38 insertions(+), 45 deletions(-)
>  delete mode 100644 meta/recipes-extended/cpio/cpio_v2.inc
>
> diff --git a/meta/recipes-extended/cpio/cpio_2.12.bb b/meta/recipes-extended/cpio/cpio_2.12.bb
> index 405a90e..0b83e9b 100644
> --- a/meta/recipes-extended/cpio/cpio_2.12.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.12.bb
> @@ -1,8 +1,13 @@
> -require cpio_v2.inc
> -
> +SUMMARY = "GNU cpio is a program to manage archives of files"
> +DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
> +another. It handles a number of cpio formats as well as reading and writing tar files."
> +HOMEPAGE = "http://www.gnu.org/software/cpio/"
> +SECTION = "base"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>
> +DEPENDS = "texinfo-native"
> +
>  SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>             file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>             file://0001-Fix-CVE-2015-1197.patch \
> @@ -10,3 +15,34 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>
>  SRC_URI[md5sum] = "fc207561a86b63862eea4b8300313e86"
>  SRC_URI[sha256sum] = "08a35e92deb3c85d269a0059a27d4140a9667a6369459299d08c17f713a92e73"
> +
> +inherit autotools gettext texinfo
> +
> +EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
> +
> +do_install () {
> +    autotools_do_install
> +    if [ "${base_bindir}" != "${bindir}" ]; then
> +        install -d ${D}${base_bindir}/
> +        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
> +        rmdir ${D}${bindir}/
> +    fi
> +}
> +
> +PACKAGES =+ "${PN}-rmt"
> +
> +FILES_${PN}-rmt = "${base_sbindir}/rmt*"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +
> +ALTERNATIVE_${PN} = "cpio"
> +ALTERNATIVE_${PN}-rmt = "rmt"
> +
> +ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
> +
> +ALTERNATIVE_PRIORITY[rmt] = "50"
> +ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
> deleted file mode 100644
> index 31adb71..0000000
> --- a/meta/recipes-extended/cpio/cpio_v2.inc
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -SUMMARY = "GNU cpio is a program to manage archives of files"
> -DESCRIPTION = "GNU cpio is a tool for creating and extracting archives, or copying files from one place to \
> -another. It handles a number of cpio formats as well as reading and writing tar files."
> -HOMEPAGE = "http://www.gnu.org/software/cpio/"
> -SECTION = "base"
> -
> -DEPENDS = "texinfo-native"
> -
> -SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
> -    "
> -
> -inherit autotools gettext texinfo
> -
> -S = "${WORKDIR}/cpio-${PV}"
> -
> -EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
> -
> -do_install () {
> -    autotools_do_install
> -    if [ "${base_bindir}" != "${bindir}" ]; then
> -        install -d ${D}${base_bindir}/
> -        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
> -        rmdir ${D}${bindir}/
> -    fi
> -}
> -
> -PACKAGES =+ "${PN}-rmt"
> -
> -FILES_${PN}-rmt = "${base_sbindir}/rmt*"
> -
> -inherit update-alternatives
> -
> -ALTERNATIVE_PRIORITY = "100"
> -
> -ALTERNATIVE_${PN} = "cpio"
> -ALTERNATIVE_${PN}-rmt = "rmt"
> -
> -ALTERNATIVE_LINK_NAME[cpio] = "${base_bindir}/cpio"
> -
> -ALTERNATIVE_PRIORITY[rmt] = "50"
> -ALTERNATIVE_LINK_NAME[rmt] = "${base_sbindir}/rmt"
> -
> -BBCLASSEXTEND = "native"
> --
> 1.9.1
>

