Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 19FEA7CEAB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 14:40:38 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id n11so5433580ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DQNhQS3hDEhNk74iPrfIKqb3OTFQJza3l97/PMnHhZo=;
	b=XRlu36OPI8WPgufGHCCZ6BCRbisBdQHyaSUMHiCh6SYkdOdNYh5cJOAbLfiCjx2+ey
	23s2QnYllwxM4ju0g6c0tp8vpQI7C4TDJJLYlYOFSfmS6tRqKVCmof+jW6UGiLKJTARv
	XyoOmK1w4QmdMvj6UQFT9Pmbq0Lvi+JbNbGhpZNP8sV62dxCwo7qWicboDZNtq5YhxC/
	wck2xzvR4eCmi9bFjyfQ3lfM6obVt14ynJ+7DKUhtzhn5+yBJ2gjX4+jvcRIKbDlfjdq
	2lU+OxFuMKK48Q+DL8Yc/01Aihs4E0imDVyNLAm10ci8dJc/VHj0QCPgdyn8iI80LFS6
	HtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DQNhQS3hDEhNk74iPrfIKqb3OTFQJza3l97/PMnHhZo=;
	b=KrFW6UgStvecttNf6YsryP8BnbghB7O2FlNADFOt9b4Hb5+mRY9+LNIzYtpnQsokqY
	yp07r+ige/G60kzRef1RV6hXJcblg/5NPLaHItvARhfumNut802sBDMYJRu94tNbeuhK
	dt36D7A16rbhQsoQs+1t7nLVLbINDNLSLGRq3WkcBmF9EAAuKR8VWGoTEaB9c0FdaMpY
	tyoPfPBnRZVvjagerJ4p6LIzC+yDvW/e9YlTKK2XX1hU8KZgXh9Ho+bBqL5F3NsBLz9y
	SQ5IzNo/ChcXF9kN3O13e7VZ7DuRWYRKDBsRtXDFNkae80uqN9uTY07AHQvYEFZXKlEo
	qOZQ==
X-Gm-Message-State: APjAAAVGXKQOUlm+eBo15j+fTv9Phg5o9nnyQ2YRWZlwtvXfD81IK0d4
	VN5Gol0ExTufs8pgpO2f030jb4y1pw9J3MWzFDSUiA==
X-Google-Smtp-Source: APXvYqwubnwZ4IrjI/3+zB5EGesi0cYInbaj/Q4pVAkMz+/hpCL5qwNzklgLUJeO+8mQ/nxlUZRKGr6h756ZAHbdwG4=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr2924384ion.20.1553179238972; 
	Thu, 21 Mar 2019 07:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190319020534.17278-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190319020534.17278-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Mar 2019 14:40:26 +0000
Message-ID: <CAJTo0LYx69peDMOYoApJxGJe6qDKgEYjpt7=BRe4eMsJqbZL3w@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] ofono: upgrade to 1.28
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
X-List-Received-Date: Thu, 21 Mar 2019 14:40:38 -0000
Content-Type: text/plain; charset="UTF-8"

Test, please.

| Makefile:5722: recipe for target 'ell/ell.h' failed

Ross

On Tue, 19 Mar 2019 at 02:04, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade ofono from 1.25 to 1.28.
>
> 2.use-python3.patch has been merged.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../ofono/ofono/use-python3.patch             | 27 -------------------
>  meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 -------
>  meta/recipes-connectivity/ofono/ofono_1.28.bb |  8 ++++++
>  3 files changed, 8 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
>  delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
>  create mode 100644 meta/recipes-connectivity/ofono/ofono_1.28.bb
>
> diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
> deleted file mode 100644
> index 7b84075257..0000000000
> --- a/meta/recipes-connectivity/ofono/ofono/use-python3.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -set-ddr should use Python3 like all the other tests.
> -
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Mon, 29 Jan 2018 11:31:25 +0000
> -Subject: [PATCH] test/setddr: use Python 3
> -
> -All the other tests use Python 3, so this should to.
> ----
> - test/set-ddr | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/test/set-ddr b/test/set-ddr
> -index 5d061b95..33631f31 100755
> ---- a/test/set-ddr
> -+++ b/test/set-ddr
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/python
> -+#!/usr/bin/python3
> -
> - import sys
> - import dbus
> ---
> -2.11.0
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
> deleted file mode 100644
> index 3688b9d2fc..0000000000
> --- a/meta/recipes-connectivity/ofono/ofono_1.25.bb
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -require ofono.inc
> -
> -SRC_URI  = "\
> -  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> -  file://ofono \
> -  file://use-python3.patch \
> -"
> -SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
> -SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
> diff --git a/meta/recipes-connectivity/ofono/ofono_1.28.bb b/meta/recipes-connectivity/ofono/ofono_1.28.bb
> new file mode 100644
> index 0000000000..48bf2d3edc
> --- /dev/null
> +++ b/meta/recipes-connectivity/ofono/ofono_1.28.bb
> @@ -0,0 +1,8 @@
> +require ofono.inc
> +
> +SRC_URI  = "\
> +  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
> +  file://ofono \
> +"
> +SRC_URI[md5sum] = "3a5406565b552b16602610619b034967"
> +SRC_URI[sha256sum] = "93bb2cedef54f897dd5200e22b072a6e38b5d9b44be57eebbbe8d513f0beb0e4"
> --
> 2.20.1
>
>
>

