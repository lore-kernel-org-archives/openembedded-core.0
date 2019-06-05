Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 944317D716
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 19:10:32 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r18so11595501wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Kz0tThSn8wPOwOJBDOkKm+JT68xphCzfQ8ihPP7U4iU=;
	b=SWRFSpT02t4CmG6TlxxE4qTkYx+kXfdrqrTj603m7iSBiT6fAVA5eR6fx7DVW6DuaR
	ampdp7TyOYpyukCiqM52s4hcNrfeFIOGipKMBwTZ/G+FpU9Zd8X6kl6suszuz78x7lwW
	oHR5hYP811eE/RhQqRrFG2+XJa0UDaRuyT4rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Kz0tThSn8wPOwOJBDOkKm+JT68xphCzfQ8ihPP7U4iU=;
	b=kc0HzYfF/Y+Doh9+BSSNACXWnP043EohFqvlBDU8JWxMbCGbLad5dnVFTeoX+kJUG3
	yIjhXf0PuPfwDULf/y1/EGzrSjWS/smTw8P/v1+Aua0AL8DFrtYPNIazDQpR0vrxFpa1
	n4te7xtD9UrlFsyxig5ImKjJ/aC+HFB0paTG24FERbraCQ9ypzxhXjURNaYGMrqibJft
	ES4KQ0GGmujDTWTiCN8zQDmKWJbdSn7RrpbJgNKEHongXO8WiIy/iCwsjGD1jBc+h5nz
	n/8HjxPzwtLbum2thm7ARalGdThobkVAXYIyBFSqAZkiQ9DoT263qT2S3+FGC8mz4ctD
	1IBw==
X-Gm-Message-State: APjAAAUANysCO299F4S9xqydhOpTJQCy3W+zcBSA/ydAeHJ8FzKijufW
	xPUewhxTZLUECUErNXxsoBB4Tg==
X-Google-Smtp-Source: APXvYqyGdrnliBBkBLZxHKLUYANVZ6M4Cj4uOn1IEXzyt+XIm7akDxUvByl5S0fl1A4nymei6B9G6g==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr11732077wre.312.1559761833326;
	Wed, 05 Jun 2019 12:10:33 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	34sm29098195wre.32.2019.06.05.12.10.32
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 05 Jun 2019 12:10:32 -0700 (PDT)
Message-ID: <a71198580613e3ad0d8ce05717e56a27db9a5e21.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
Date: Wed, 05 Jun 2019 20:10:31 +0100
In-Reply-To: <20190605184116.24297-1-bunk@stusta.de>
References: <20190605184116.24297-1-bunk@stusta.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] Remove manual RDEPENDS from PN-ptest to PN package
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
X-List-Received-Date: Wed, 05 Jun 2019 19:10:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-05 at 21:41 +0300, Adrian Bunk wrote:
> They are now added automatically by the ptest class.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb | 2 +-
>  meta/recipes-devtools/elfutils/elfutils_0.176.bb    | 2 +-
>  meta/recipes-extended/sed/sed_4.2.2.bb              | 2 +-
>  meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb     | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
> index 54b135eaef..ed946159bd 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
> @@ -113,7 +113,7 @@ ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
>  ALTERNATIVE_${PN}-tune2fs = "tune2fs"
>  ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
>  
> -RDEPENDS_${PN}-ptest += "${PN} coreutils procps bash bzip2 diffutils perl sed"
> +RDEPENDS_${PN}-ptest += "coreutils procps bash bzip2 diffutils perl sed"
>  RDEPENDS_${PN}-ptest += "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks e2fsprogs-resize2fs"
>  
>  do_compile_ptest() {
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> index 1a5c70b088..6ed329fd55 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
> @@ -44,7 +44,7 @@ inherit autotools gettext ptest
>  
>  EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
>  EXTRA_OECONF_append_class-native = " --without-bzlib"
> -RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils ${PN}"
> +RDEPENDS_${PN}-ptest = "libasm libelf bash make coreutils ${PN}-binutils"

Won't that need a += there to preserve the class definition? How was
this tested?

Cheers,

Richard

>  EXTRA_OECONF_append_class-target += "--disable-tests-rpath"
>  
> diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
> index f10e365ea4..8e436bad80 100644
> --- a/meta/recipes-extended/sed/sed_4.2.2.bb
> +++ b/meta/recipes-extended/sed/sed_4.2.2.bb
> @@ -15,7 +15,7 @@ SRC_URI[md5sum] = "4111de4faa3b9848a0686b2f260c5056"
>  SRC_URI[sha256sum] = "fea0a94d4b605894f3e2d5572e3f96e4413bcad3a085aae7367c2cf07908b2ff"
>  
>  inherit autotools texinfo update-alternatives gettext ptest
> -RDEPENDS_${PN}-ptest += "make ${PN}"
> +RDEPENDS_${PN}-ptest += "make"
>  RRECOMMENDS_${PN}-ptest_append_libc-glibc = " locale-base-ru-ru"
>  
>  EXTRA_OECONF = "--disable-acl \
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> index 7e80bb45d1..9583ee3abb 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.10.6.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
>  
>  DEPENDS = "liburcu popt libxml2 util-linux"
>  RDEPENDS_${PN} = "libgcc"
> -RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
> +RDEPENDS_${PN}-ptest += "make perl bash gawk babeltrace procps perl-module-overloading coreutils util-linux kmod lttng-modules"
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
>  RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
>  # babelstats.pl wants getopt-long
> -- 
> 2.17.1
> 


