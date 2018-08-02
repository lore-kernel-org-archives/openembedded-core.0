Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6CC9978DF7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 18:50:59 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f18-v6so3458827qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U/jMgfhNh1U3IdNxlkIEakm/69t/s+TATp8AR34NqmM=;
	b=mdxukExjy+okrh1Wpvlytmm8sGZ/VG82Gu1IFYUpxwllhrJuGadKXMlRqMfd7//K5E
	Aa4t5oY/g/cz7ovVT6bz2Io2mCqeqLKZNwPA9GpFU3u+Tx/6wCWPoooLRjZutVBKKSkl
	88K14b1L2h8XCmGJ9V8h5ktJk0S1hQ0N5XoHgAbwSVsNQxQ/t3HQSv0kjCjAWC5qbnyd
	WAiU+tw398A5TD+U9wfQ5nt0BihFZUxeeZxit5fTyg9i5N990NcUC2nCkHRuse6/Ercq
	IIIwJfrmn5hNEFU/oMMGyhNCZGFvF5bZxKr1DP2Qbp098Z5JXSr0WOG9vrLV8kQunqGE
	ju6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U/jMgfhNh1U3IdNxlkIEakm/69t/s+TATp8AR34NqmM=;
	b=LCAqT20jPYuL6n+kXaW2bxVY00ERu+rYwJJd0kSpSdEehmSnA0XSiL89+XbmGBAuEd
	SGxaEssuVTJXgO5UEa/z4UzV5smJJIXFkqBa+zlrl0hGijz62eUv7zJBAPiVpzRZBkgL
	3dJisT9Co6JVQegQvRDCZYWzthXjdsUpaSWp2GhxcNiTKAo5KkKHTNl1pt8XizlLSLPx
	sVaaIV1NtQwTYX8Ku75eC+2K1opbxGifQGyUfVhglS14gZlmTOqSAcq2V2ozVTcgFrzU
	0TmFp305RiylXvpmC+UHANnxSLay5OtZHgp3BhbXedh3vR0oAS79I1f4j9IyJ2I9Ujb9
	3u4A==
X-Gm-Message-State: AOUpUlHBZG5CFp+cpjdLwkv78BofAtYb9LznfVI+R9TCJ6Dy+24UuP8x
	3x9RUycK7ah/A5eAz8xVUzDgwbH3XZZMDuWuJKo=
X-Google-Smtp-Source: AAOMgpdDpyednGKXfRW6TmTZJ2g4Lk1O485xrbbuwYQ3llT2ZKiT5E7srT2rpquytK9E7daTXZkKGDdD6GOf2XnH4+4=
X-Received: by 2002:a0c:d2f3:: with SMTP id
	x48-v6mr710006qvh.214.1533235859909; 
	Thu, 02 Aug 2018 11:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180727153248.22838-1-ross.burton@intel.com>
	<20180727153248.22838-2-ross.burton@intel.com>
In-Reply-To: <20180727153248.22838-2-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 11:50:33 -0700
Message-ID: <CAMKF1soTXX28m1=7UnitUAuoKTx9ARXzcQxFwqCp_W8D_7cHwg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/16] libidn2: add new version
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
X-List-Received-Date: Thu, 02 Aug 2018 18:50:59 -0000
Content-Type: text/plain; charset="UTF-8"

On musl

ERROR: libidn2-2.0.5-r0 do_package: QA Issue: libidn2:
Files/directories were installed but not shipped in any package:
  /usr/lib/charset.alias
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
libidn2: 1 installed and not shipped files. [installed-vs-shipped]
On Fri, Jul 27, 2018 at 8:33 AM Ross Burton <ross.burton@intel.com> wrote:
>
> libidn 1.x is deprecated, add the parallel-installable libidn2.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-extended/libidn/libidn2_2.0.5.bb | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/recipes-extended/libidn/libidn2_2.0.5.bb
>
> diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> new file mode 100644
> index 00000000000..aaf9ecd7e78
> --- /dev/null
> +++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Internationalized Domain Name support library"
> +DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
> +HOMEPAGE = "http://www.gnu.org/software/libidn/"
> +SECTION = "libs"
> +LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
> +                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
> +                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +                    file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
> +                    file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
> +
> +SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
> +SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
> +SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
> +
> +DEPENDS = "virtual/libiconv libunistring"
> +
> +inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
> +
> +LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
> +LICENSE_${PN}-bin = "GPLv3+"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

