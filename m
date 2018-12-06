Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3726C1AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 11:49:25 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o5so85280iop.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 03:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7KryTrDRN0liBPNxOxjG2HaTQbEJQg5ieOEMqLU+qxM=;
	b=sXR8hcBFrbWuOM6EYBMLvlm7dKttstqlFB1d91p9q8iwoNnj4J70+D+dBR3sUqucyz
	nnPVglsGHZUOsQifk/SN3gsarJQor0ZfAfTexEaC4yrSgjOJlVhHJo06XstIKIxBBVMg
	4UHz+O0rQtrSFdUcTzolHqxMHpbtLVv0/OM+r28YnZpjqYDHMxWP8ufkcWOLEygT6M+I
	UNhaxHpiwQo/ULMje6oD+pHj+3Yq2G4D0423WJmffLPNnUv5XqrSfwwKm1RQKHsh61+Q
	5jq/mwP5fYVJ4VJXgut84mHh+2cUUuHEOLKDKNY8MMB6ElpXVMh9/MoM4rbkW2TpZHxC
	zdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7KryTrDRN0liBPNxOxjG2HaTQbEJQg5ieOEMqLU+qxM=;
	b=jJMzJ6jtcxHdkdzFIQl2p5krxU+toreBejiOxEL40tOXjB0bBgSNhy9ksVXKuwKQlO
	XWopkugX2VMm6/3RkBb6IkkZWhGVpWXTQDCHs1cNQyBEynJTmi2J4vKk7/OTBT4YydIS
	g8O4vYFknsXcyueKrx44FjUmmMGSVn21PG5yw1oe77MVNxoDcMyKNiyhu/i8eK+u6fPx
	e0wBWIhwvmLqglw5P9oms7AaJ10+rYbikjzmWvJBtQOqZEjkCLtJMzJeiV1xIg+Hu1RA
	QkQau8BgCU+2XDZk3gW3rq0Xg0e1ibvDeyCfyMM6wwKoW/DbYajJbSw4q1n7gvDHa8Xu
	zT6w==
X-Gm-Message-State: AA+aEWakL5bz1sdstlp1KjznIT2CRKSlqaCtQNqUyfgvYIzarJFeeTw8
	/kcFccdcI57u9n35ezlDXJjkIYTOX/tIvlNMA98HqA==
X-Google-Smtp-Source: AFSGD/XstEGXXq+5lXmOYHJLx8AhZWBhMsnYqUlMfQ5sytOdvuKMca2YgirxVvWoiz+qaQ/8XZYx8R0TY8zoGs/6lK4=
X-Received: by 2002:a5d:9697:: with SMTP id m23mr13944688ion.201.1544096966997;
	Thu, 06 Dec 2018 03:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20181206000749.28731-1-raj.khem@gmail.com>
In-Reply-To: <20181206000749.28731-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Dec 2018 11:49:15 +0000
Message-ID: <CAJTo0LZi7zY+g9PKd=eUr9PnipvfTBeOXaC_y91Wm87+aP=oPw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Enable building static archive on musl
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
X-List-Received-Date: Thu, 06 Dec 2018 11:49:26 -0000
Content-Type: text/plain; charset="UTF-8"

Presumably static archives are disabled by the no-static-libs include.
So is this really musl-specific?

Ross
On Thu, 6 Dec 2018 at 00:08, Khem Raj <raj.khem@gmail.com> wrote:
>
> This ensures that we have .a for libunwind on musl targets, this is used
> for stack unwinding infra e.g. in rust
>
> Help compiling rust compiler and standard library from meta-rust
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/libunwind/libunwind_1.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libunwind/libunwind_1.2.1.bb b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> index e7fb2b2190..c9239b695e 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> @@ -14,7 +14,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
>             "
>
>  SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
> -EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests "
> +EXTRA_OECONF_append_libc-musl = " --disable-documentation --disable-tests --enable-static"
>
>  # http://errors.yoctoproject.org/Errors/Details/20487/
>  ARM_INSTRUCTION_SET_armv4 = "arm"
> --
> 2.19.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

