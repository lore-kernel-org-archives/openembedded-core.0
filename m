Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7722072D5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 19:07:07 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id z107so7494691qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 11:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=o3MTe4cky0HT/XDfkgcLLJ9/JYBp4I+Ftb95V4SJEic=;
	b=k8E0fSKMno1BDX6jRdG+XwjBwjIYWt73VJ4zYra5yYfYFrknGrMQ2eZ+xKKqHuVCl8
	2r0N2fELJHE5qEkmepdpstjDmtHKYJG6Zx1LUVfrPmRVURoHegRRbOph6eQqoYrG1CPj
	KsIO8mz001AxXd1almut7OhNIypLXwM3k9xke9YMoP9XsD3xxU6Tz70iF9eUoxDDAY5f
	OCFnUYdY3vTFtW/VSLUnAM6QMg81NcaH8ZGy40VUgDmup2TooL8N6K7OEj+xzfZyfVF5
	wy6JsPQwNDUXf1ObuYMg5ffimdN+LCLxP5ln5bYhxLOE8VU6CfXU+l/k35uzHUnRCEko
	BmLw==
MIME-Version: 1.0
X-Received: by 10.140.96.225 with SMTP id k88mr15936657qge.104.1422040028378; 
	Fri, 23 Jan 2015 11:07:08 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Fri, 23 Jan 2015 11:07:08 -0800 (PST)
In-Reply-To: <CACS+7ZTOs5rFPB66YbJS1jNBd-hfd=jWQgkX0yGOYUDvVMGehg@mail.gmail.com>
References: <CACS+7ZTOs5rFPB66YbJS1jNBd-hfd=jWQgkX0yGOYUDvVMGehg@mail.gmail.com>
Date: Fri, 23 Jan 2015 13:07:08 -0600
Message-ID: <CACS+7ZS7+_yi5MORTt+rURw7Dg8HyzJ8s7OQjnFXM-25WcpvLA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: fix licensing
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
X-List-Received-Date: Fri, 23 Jan 2015 19:07:09 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2015 at 13:05, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> The sanitizer runtime library is dual-licensed under the NCSA
> and MIT licenses.
>
> Also make nativesdk-gcc-sanitizers use SDKGCCVERSION by default
> instead of GCCVERSION
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>  meta/conf/distro/include/tcmode-default.inc  | 2 +-
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index ae6aaf3..7428aa9 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -39,7 +39,7 @@ PREFERRED_VERSION_gcc-runtime ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-sanitizers ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-source ?= "${GCCVERSION}"
>  PREFERRED_VERSION_nativesdk-gcc-runtime ?= "${SDKGCCVERSION}"
> -PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${GCCVERSION}"
> +PREFERRED_VERSION_nativesdk-gcc-sanitizers ?= "${SDKGCCVERSION}"
>  PREFERRED_VERSION_libgcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_libgcc-initial ?= "${GCCVERSION}"
>  PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> index 892dfe0..35c9247 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -1,5 +1,11 @@
>  require gcc-configure-common.inc
>
> +LICENSE = "NCSA | MIT"
> +
> +LIC_FILES_CHKSUM = "\
> +    file://libsanitizer/LICENSE.TXT;md5=0249c37748936faf5b1efd5789587909 \
> +"
> +
>  EXTRA_OECONF_PATHS = "\
>      --with-sysroot=/not/exist \
>      --with-build-sysroot=${STAGING_DIR_TARGET} \
> --
> 2.1.0

Turns out I missed this the first time. Without this sanitizer runtime
is assumed to be GPL3 with runtime exception. It gets caught when one
blacklists GPL3 components.

