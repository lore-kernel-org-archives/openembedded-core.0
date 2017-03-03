Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7373860670
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 21:40:16 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 72so15948992uaf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 13:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KJYtx34NdPeKRrd2Bh8d7iuaqps9AORmgkA/00ohabs=;
	b=mU3jCIC+mfVKwHZ2iah9lWyX9VwlX5wyrPgwiNjpRyYDmXo/JEJgKMcqiPfKt2ok0w
	JBnjZ1PskejY7pUIhQplEbBmbTLOEJxHCNHQAj/e9aqlrY8MaSYDLBLZyQ7NRDomWKwc
	RTS2TTVCk24tyKXeMOxYBAiYuLDPXHlZeg+pyccniV7C8TVDKDhr8im/Y194MntOKLfI
	YMNPqBpzOZYDGN4sdZJEjYvfOmFTMLy6k1klXWNSqpcz2vpGuuTAULfKvsoplSSK6l+8
	Rr2ZlwxVG7LB9jSvkuByNPO49/cpQ3CSWkWXmGGi9qHPK04QLtWHVzTUBb8imcgMrh8m
	vj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KJYtx34NdPeKRrd2Bh8d7iuaqps9AORmgkA/00ohabs=;
	b=EvFbusXal2KvJqGEInOAI8PRxkF2xN/74qB8fD+3bZe096mt2Jfpw2gVVuYWh6jHT5
	lInHAlKAmBSUwLys0f4G6wSssgKAsU40LXyCZcnc8QzRn9lHGFbtFhxnbsOywYzgtGs6
	5300+W2Ga4XK9jUTYz3Z7+X1zvLMUnCftmqFIOLKVUJNkuBBxenVjpLbDNxBJzgL8BBR
	F9t8E8ZDmVCDiYMy4zhD4i13/z55hU85M0RpPNLEYOKLfxaX8SOOyQBgRI14jLNYfqvj
	lKxxetZtucOOi6oh59yiMw1RYjg/F8H+OqAGKhe+VY03UFfg9S1mYW23V0HUDerBcFCk
	24Sw==
X-Gm-Message-State: AMke39n2cJc+MLljAH+k3aeXH6M0iXgYbFOKBB8xIstEx9NnkXzVqMQxKqvaDBImZtFjxXcO6CXGIRIRZqXzxg==
X-Received: by 10.176.64.225 with SMTP id i88mr2075148uad.60.1488577217184;
	Fri, 03 Mar 2017 13:40:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.39.37 with HTTP; Fri, 3 Mar 2017 13:39:46 -0800 (PST)
In-Reply-To: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Mar 2017 13:39:46 -0800
Message-ID: <CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Fri, 03 Mar 2017 21:40:16 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 3:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Enabling building the Intel Memory Protection Extension library for x86.
>

hope this works on amd chips as well ?

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 745cf74..614b070 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -24,8 +24,8 @@ RUNTIMELIBITM_microblaze = ""
>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
>  "
> +RUNTIMETARGET_append_x86 = " libmpx"
>
> -#  ?
>  # libiberty
>  # libmudflap
>  # libgfortran needs separate recipe due to libquadmath dependency
> @@ -139,6 +139,11 @@ PACKAGES = "\
>      libitm-dev \
>      libitm-staticdev \
>  "
> +PACKAGES_append_x86 = "\
> +    libmpx \
> +    libmpx-dev \
> +    libmpx-staticdev \
> +"
>
>  # The base package doesn't exist, so we clear the recommends.
>  RRECOMMENDS_${PN}-dbg = ""
> @@ -243,6 +248,19 @@ SUMMARY_libitm-dev = "GNU transactional memory support library - development fil
>  FILES_libitm-staticdev = "${libdir}/libitm.a"
>  SUMMARY_libitm-staticdev = "GNU transactional memory support library - static development files"
>
> +
> +FILES_libmpx = "${libdir}/libmpx.so.* ${libdir}/libmpxwrappers.so.*"
> +SUMMARY_libmpx = "Intel Memory Protection Extension library"
> +FILES_libmpx-dev = "\
> +    ${libdir}/libmpxwrappers.so \
> +    ${libdir}/libmpx.so \
> +    ${libdir}/libmpx.la \
> +    ${libdir}/libmpx.spec \
> +"
> +SUMMARY_libmpx-dev = "Intel Memory Protection Extension library - development files"
> +FILES_libmpx-staticdev = "${libdir}/libmpx.a ${libdir}/libmpxwrappers.a"
> +SUMMARY_libmpx-staticdev = "Intel Memory Protection Extension library - static development files"
> +
>  do_package_write_ipk[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_deb[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
>  do_package_write_rpm[depends] += "virtual/${MLPREFIX}libc:do_packagedata"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

