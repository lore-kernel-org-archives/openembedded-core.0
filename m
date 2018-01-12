Return-Path: <danismostlikely@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF5478792
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 17:30:18 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f3so6741188lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Hcx7YXqWNTjdyrOggYLmQZPZEUI8bcRQ1IRi+NXLUY=;
	b=FusPLARx5cxVtquN2g2A9gyLUC8e77FtutZstNk+RqonY06AYjo2vkLnHBAbAJ7v6B
	o/ca4Iz2CJl9Khu6ONlwQaEInrBzRzkU4CfeBuw2VtQjGmFSCBzpMd0uUHSElbSiyIO1
	iw08PS7lXvrzV1KvJLh5kq0620NadLXPHsgyw1FIoy9u8+IfwDGJyBHAABCF8J4oFrkk
	f+6yOb6L7PN2yIyh6rJtAMB+v4/QoBSnQSVfO0Te4+iNwKCiO7E+JqbT+AEjEuy5qwNc
	yj/ZzPiWd3Nhqm+I8Gm+v24sJn0qBWcQnJX+UJmEHE6Lb6gdKQFAo11OUjECOknMjJBK
	7ZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Hcx7YXqWNTjdyrOggYLmQZPZEUI8bcRQ1IRi+NXLUY=;
	b=rbJxGBYQFSqArNXQmwhAqc3rf5oV7M21nuAQctCSm178f7YgDVJvoM/Ds1ARk1aOs7
	LOW1aS24576mOsg7Yq54C/t+p3gKR4X7/kuILzYwKGsypK4BG6oYzvEiD/s/VJWaJ6h1
	3RSJ0kj838MLk5NDkoRm01BPaWfDX15aLkgOFHlgCRdkyHaNSj8oAVn6JSP4y7f4VGt/
	amU1Z9h5qhkkV4CVdwH8n8zFjBLXUGvsBTVvHkYuw47FW+5mYT/eXLqRyzygzRMuVNSA
	WLqtBUfqMbt5ncBtpp5ZlIVC0lvNuNKd5iqIMdTEc4aeUYNQYUzsS31biwivOln8neMo
	jwyw==
X-Gm-Message-State: AKGB3mJz0E8Ll9TdSlhkYai+rX7A1UVhX/E+4lnXiPWp1Pyx288cxvFI
	Z0Rm65vjKcBrg3wmbMf/HYvtfj9pgIOBK3DNpSQ=
X-Google-Smtp-Source: ACJfBotJk7hWq1Mt3OZirBQbqEqRtxnx8kjaoe0OCUnDfAjkfrm13b3HqDXaj8Kc7TX0woretWgktz5jc/BFWszThoA=
X-Received: by 10.46.93.212 with SMTP id v81mr16548620lje.12.1515778218698;
	Fri, 12 Jan 2018 09:30:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.201.137 with HTTP; Fri, 12 Jan 2018 09:30:17 -0800 (PST)
In-Reply-To: <20180108160021.4715-6-ross.burton@intel.com>
References: <20180108160021.4715-1-ross.burton@intel.com>
	<20180108160021.4715-6-ross.burton@intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Fri, 12 Jan 2018 11:30:17 -0600
Message-ID: <CACS+7ZT154sQztbhuaCXEB16UBeoEp8L=SsekOBpx5NkshH+Ag@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/9] m4: merge two .inc files
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
X-List-Received-Date: Fri, 12 Jan 2018 17:30:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 8 January 2018 at 10:00, Ross Burton <ross.burton@intel.com> wrote:
> Now that oe-core only has one copy of m4, there's no need to maintain two inc
> files.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/m4/m4-1.4.18.inc | 31 +++++++++++++++++++------------
>  meta/recipes-devtools/m4/m4.inc        | 10 ----------
>  2 files changed, 19 insertions(+), 22 deletions(-)
>  delete mode 100644 meta/recipes-devtools/m4/m4.inc
>
> diff --git a/meta/recipes-devtools/m4/m4-1.4.18.inc b/meta/recipes-devtools/m4/m4-1.4.18.inc
> index d7c86485771..7790a88d759 100644
> --- a/meta/recipes-devtools/m4/m4-1.4.18.inc
> +++ b/meta/recipes-devtools/m4/m4-1.4.18.inc
> @@ -1,22 +1,29 @@
> -require m4.inc
> +SUMMARY = "Traditional Unix macro processor"
> +HOMEPAGE = "https://www.gnu.org/software/m4/m4.html"
> +DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
> +compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
> +GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
>
> -EXTRA_OECONF += "--without-libsigsegv-prefix"
> +inherit autotools texinfo
> +
> +SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
> +           file://ac_config_links.patch \
> +           file://remove-gets.patch \
> +           "
> +
> +SRC_URI_append_class-target = "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"

There's no space here, so it breaks with meta-clang enabled. It only
works right now as-is because SRC_URI ends with whitespace.

I think it should be:
SRC_URI_append_class-target = "
file://0001-Unset-need_charset_alias-when-building-for-musl.patch"

> +
> +SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
> +SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
>
>  LICENSE = "GPLv3"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>                     file://examples/COPYING;md5=4031593b2166d6c47cae282d944a7ede"
>
> -SRC_URI += "file://ac_config_links.patch \
> -            file://remove-gets.patch \
> -           "
> -
> -SRC_URI_append_class-target = "\
> -           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> -          "
> -
>  # Fix "Argument list too long" error when len(TMPDIR) = 410
>  acpaths = "-I ./m4"
>
> -SRC_URI[md5sum] = "a077779db287adf4e12a035029002d28"
> -SRC_URI[sha256sum] = "ab2633921a5cd38e48797bf5521ad259bdc4b979078034a3b790d7fec5493fab"
> +EXTRA_OECONF += "--without-libsigsegv-prefix"
> +
> +EXTRA_OEMAKE += "'infodir=${infodir}'"
> diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
> deleted file mode 100644
> index 2002594e899..00000000000
> --- a/meta/recipes-devtools/m4/m4.inc
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -SUMMARY = "Traditional Unix macro processor"
> -HOMEPAGE = "https://www.gnu.org/software/m4/m4.html"
> -DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
> -compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
> -GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
> -
> -inherit autotools texinfo
> -
> -EXTRA_OEMAKE += "'infodir=${infodir}'"
> -SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

