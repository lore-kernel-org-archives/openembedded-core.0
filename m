Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 27F71719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:25:42 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 68so10547495wmz.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 01:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lt4KDyCgZLxxam3R0LQDI66Go528MO1s3RlDk3UnDYU=;
	b=tdBqcnQ+6kmIFJtYXAxphmUpQRReHw6+zaO2EOXnuIctjy88tn98y5RzeasdGjSoSq
	igvHAEOtzZ3W3duQPlUUoaA6sy7IMiJCT+172sybrG3czoFSISm3PqoYNlxT+j5aJYJA
	VBzWTJWokpzbk7Tol3AzxLhX8CZ+deudM5By6apFsKbZI8p9BJ3T9ffS8u14WKhXpFNv
	O9dvFQ0RAGR+NF/ZRjNgX7zKMNTcIGpCGxHpyQ7aP4cY32/03Cli/K+WDk2GzUknMFFR
	XK247LX2zx+OALfNSxgym+BGZworiGA4hTDxHihk9ludBC+7H3Ds6896SG7PHQHrzfmX
	7E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lt4KDyCgZLxxam3R0LQDI66Go528MO1s3RlDk3UnDYU=;
	b=D5LBGqc5ckv139wdoTfrFPl0yH5bGUxhbbd5KvKFhw9c9Auw7ERaTo5K71hKkRYCvR
	JYLRJPCeaziMlTUxMeh/F/aqf0VozxSDTPPWVGv+tsU8XG5+Rkykro8UNTwU8v92Rvrc
	V8rpJ6GLALJVs1AnzNRAOnwcDGD3Y9n+bBUhWP8poqFqJfi2IOSdAgkNeheV1hcXEOYO
	PuhOH1xxgevwMC77t0NJANfzV/i/UvPzdLW4JwySa8XWwXe/7usG3WWK4YklZ88ENMdr
	jy1wV3lDfIaBYUrkej8ooIh6stprwFWzQRLbf+OYlGeey1T+hSXdbupvc8jl11wgMTPc
	J1kQ==
X-Gm-Message-State: ABUngvczHJjoDhsj4AS4KM2Z1DsF7T5pVTZ2sUJsWXueN9X1pmaUnyXrcl7kVHkLogbeUQjKPiCCZVWfSB0cGQ==
X-Received: by 10.194.238.162 with SMTP id vl2mr20821992wjc.39.1477902343029; 
	Mon, 31 Oct 2016 01:25:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.166.150 with HTTP; Mon, 31 Oct 2016 01:25:42 -0700 (PDT)
In-Reply-To: <20161029145747.32390-1-fathi.boudra@linaro.org>
References: <20161029145747.32390-1-fathi.boudra@linaro.org>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Mon, 31 Oct 2016 09:25:42 +0100
Message-ID: <CAHvQdo11Y5ZV0GaC0YsdFCEz6KwLymLms51hDkASayPXo-3TVA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core PATCH] wayland: upgrade from 1.11.0 to 1.11.1
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
X-List-Received-Date: Mon, 31 Oct 2016 08:25:44 -0000
Content-Type: text/plain; charset=UTF-8

Wouldn't it make more sense to update to 1.12?
Since 1.11.1 is backporting fixes from 1.12 as stated in the annouce
mail of the release.

2016-10-29 16:57 GMT+02:00 Fathi Boudra <fathi.boudra@linaro.org>:
> Update release tarball md5sum/sha256sum
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  .../wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch   | 2 +-
>  .../recipes-graphics/wayland/{wayland_1.11.0.bb => wayland_1.11.1.bb} | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.11.0.bb => wayland_1.11.1.bb} (92%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
> index dece95c..ef41b79 100644
> --- a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
> +++ b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
> @@ -16,7 +16,7 @@ diff --git a/src/scanner.c b/src/scanner.c
>  index 5f06e8e..10a4023 100644
>  --- a/src/scanner.c
>  +++ b/src/scanner.c
> -@@ -808,7 +808,7 @@ find_enumeration(struct protocol *protocol,
> +@@ -812,7 +812,7 @@ find_enumeration(struct protocol *protocol,
>         struct interface *i;
>         struct enumeration *e;
>         char *enum_name;
> diff --git a/meta/recipes-graphics/wayland/wayland_1.11.0.bb b/meta/recipes-graphics/wayland/wayland_1.11.1.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.11.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.11.1.bb
> index 3413406..fa674f6 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.11.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.11.1.bb
> @@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-scanner-Use-unit32_t-instead-of-uint.patch \
>             "
> -SRC_URI[md5sum] = "fccf680be066e234729d5b69e0bd0fa9"
> -SRC_URI[sha256sum] = "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"
> +SRC_URI[md5sum] = "82f227c65faec3df0335847626811303"
> +SRC_URI[sha256sum] = "4c8a99d030282740e898dead98c92d92023be9c3536c7f504444d215a7e39195"
>
>  EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
>
> --
> 2.10.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

