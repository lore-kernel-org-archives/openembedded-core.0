Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6282291536
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 06:18:34 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id d10so2395502qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 22:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1h1GhFHzjyjT+9cFaQ0GW6tUaWAeQcp1KrScYBecnO0=;
	b=Mpv1SulReQSPDkbzT8ZQW6sDXpWBfp0U2TbDqxa6EFe2107XsI1jDXY1RAJL9//F13
	EF9VPA2I2x06YWbVZxH/CO83Z3nzwesDPWlK0utJ+v8bi0H9gYz4RgxR5PnZWN7iBcKd
	xoCxJHRYXC+vOAp4hDFPgiQ1IfwUBx5+S3b5z5S6uUhl/dzuoQDxvgNGUFAQoriGM+Vp
	HHdL26HjiA2avg3Al6dNAGIfzofIdN+R8KvQjI3iYIWkXwJoESD4POPh6ROSs/IUBZdS
	G+B8umIe2PNeYR53t6iIJKiwB5/i/DIT1BsJ2jGqxCRsa+ba4CecMQHZCQbeRD0yzzHT
	2U5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1h1GhFHzjyjT+9cFaQ0GW6tUaWAeQcp1KrScYBecnO0=;
	b=mNUqXiM1FwGGcSnKM6MpwGBpWmQ5PFA8nUIHZ3gAKr982AGgOykFyKHBnTCDrYmIoC
	gmWbpll1GqHb0t3CX5EyvodlrrN21MyTEvS1oc0voEsVMBHcnr9W89UhSDj4MFVNI0jl
	k/J6TrIJgDHjNDNdguao6GskVLLEkB4UgRq6HjJl04qV0K/yM4bUStFGgYu+z0uHZWgq
	ZDYozR3M5fBJFGjC+TW0biTElfqV2qYM4G/auu9BadUVCoIqswzdoro/y6RrENbnoVTY
	Qasf68okcAFyrsr3kNZmKKyFfcYXXsSZ6tSNctjkUzYWguuSpwcK5aXr3vD2n555wj9F
	iVDw==
X-Gm-Message-State: APjAAAXe7bDv2uB8Pmg3baCLqtmCl1bOYaMFwP5gvW374pQgxt4UuOEx
	rG7/BE+dYkfUBB2gGvFcaeioFiieMlY+K0kwZnzJvU7j
X-Google-Smtp-Source: APXvYqz/HIS9E7cP3vn8OiPX1wJ+2t4JNppEoyDewcFiPAuuboAQNv8E7Zb9Lgoq8FtTSzm8nq1AUVS2YNXxJtbQQII=
X-Received: by 2002:a37:a3c7:: with SMTP id
	m190mr14654822qke.212.1579760315035; 
	Wed, 22 Jan 2020 22:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20200123053204.24713-1-anuj.mittal@intel.com>
In-Reply-To: <20200123053204.24713-1-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 22:18:08 -0800
Message-ID: <CAMKF1spt9YYOJ30=Pb63ATym+HCd0mEnoWEBA=-68XabNv8C9w@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtirpc: upgrade 1.1.4 -> 1.2.5
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
X-List-Received-Date: Thu, 23 Jan 2020 06:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 22, 2020 at 9:32 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Drop musl patch and backport a fix from upstream instead.
>

seems good. You might want to add a link to Backport section for reference

> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  ...r_float-do-not-include-bits-endian.h.patch | 34 +++++++++++++++++++
>  .../libtirpc/libtirpc/musl.patch              | 30 ----------------
>  .../{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb}  |  6 ++--
>  3 files changed, 37 insertions(+), 33 deletions(-)
>  create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
>  delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/musl.patch
>  rename meta/recipes-extended/libtirpc/{libtirpc_1.1.4.bb => libtirpc_1.2.5.bb} (81%)
>
> diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
> new file mode 100644
> index 0000000000..777bd5588c
> --- /dev/null
> +++ b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
> @@ -0,0 +1,34 @@
> +From d04f4d6f0e682f16b0ce96839ab4eadade591eb1 Mon Sep 17 00:00:00 2001
> +From: Rosen Penev <rosenp@gmail.com>
> +Date: Tue, 21 Jan 2020 11:51:16 -0500
> +Subject: [PATCH] xdr_float: do not include bits/endian.h
> +
> +bits/endian.h is an internal header. endian.h should be included.
> +
> +Fixes compilation with recent musl.
> +
> +Signed-off-by: Rosen Penev <rosenp@gmail.com>
> +Signed-off-by: Steve Dickson <steved@redhat.com>
> +
> +Upstream-Status: Backport
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + src/xdr_float.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/xdr_float.c b/src/xdr_float.c
> +index 26bc865..349d48f 100644
> +--- a/src/xdr_float.c
> ++++ b/src/xdr_float.c
> +@@ -83,7 +83,7 @@ static struct sgl_limits {
> + };
> + #else
> +
> +-#include <bits/endian.h>
> ++#include <endian.h>
> + #define IEEEFP
> +
> + #endif /* vax */
> +--
> +2.21.1
> +
> diff --git a/meta/recipes-extended/libtirpc/libtirpc/musl.patch b/meta/recipes-extended/libtirpc/libtirpc/musl.patch
> deleted file mode 100644
> index 21cd9f9588..0000000000
> --- a/meta/recipes-extended/libtirpc/libtirpc/musl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Consider musl provided built-in defines
> -
> -Helps compile libtirpc with musl
> -bits/endian.h is not supposed to be included directly
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/tirpc/rpc/types.h
> -+++ b/tirpc/rpc/types.h
> -@@ -66,7 +66,7 @@ typedef   int32_t rpc_inline_t;
> - #define mem_free(ptr, bsize)  free(ptr)
> -
> -
> --#if defined __APPLE_CC__ || defined __FreeBSD__
> -+#if defined __APPLE_CC__ || defined __FreeBSD__ || !defined(__GLIBC__)
> - # define __u_char_defined
> - # define __daddr_t_defined
> - #endif
> ---- a/src/xdr_float.c
> -+++ b/src/xdr_float.c
> -@@ -83,7 +83,7 @@ static struct sgl_limits {
> - };
> - #else
> -
> --#include <bits/endian.h>
> -+#include <endian.h>
> - #define IEEEFP
> -
> - #endif /* vax */
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> similarity index 81%
> rename from meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> rename to meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> index 53ed5e81f7..fc66821ecc 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> @@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
>  PROVIDES = "virtual/librpc"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
> -           file://musl.patch \
> +           file://0001-xdr_float-do-not-include-bits-endian.h.patch \
>             "
>  UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
> -SRC_URI[md5sum] = "f5d2a623e9dfbd818d2f3f3a4a878e3a"
> -SRC_URI[sha256sum] = "2ca529f02292e10c158562295a1ffd95d2ce8af97820e3534fe1b0e3aec7561d"
> +SRC_URI[md5sum] = "688787ddff7c6a92ef15ae3f5dc4dfa1"
> +SRC_URI[sha256sum] = "f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca"
>
>  inherit autotools pkgconfig
>
> --
> 2.21.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

