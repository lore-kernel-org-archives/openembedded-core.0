Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E443719D9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 16:00:17 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b186so6640173vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BGo8MZmXusgsdvaYpsORJkdhsOOABF3b6S0P9OXrrqQ=;
	b=Hw7CQTNNjC6/enZWXQI/6CPNNWGiShAPSuQ/mMQ+z7UmZ3vt//1TNk7J3qwW4uBxdV
	Smt26lM3kbi+Bo91BmwWuBLPveJDzQVJaRLJh4CGHC1LAmrrsbEy8qcaefc2kKzjXx4B
	0mDXgMojwpixMJhSz2bNv5JVbS3KMxjMJ6gSaqDjb/dIvty7w/XiLHRVAPx+wni3+goa
	6iiqJXYJcP8qHZtSqOW0CF0Fq8ZNF3MgF0G168ex7MR9K7aoHRzsE7YqpfWGXd09xkSc
	hjNh0buHNsLg0Vbc9+nXENkGhSUuATpPDB3SKd2w2uP4sFQ5rJTJMtkMH9I+j8lxtJV9
	LKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BGo8MZmXusgsdvaYpsORJkdhsOOABF3b6S0P9OXrrqQ=;
	b=QTFGS1MdVqEw+RnPaKICXLiO4l6N5PE8ulzm2gTO6WpjKd2CaijQM2SVQwViEThJ/M
	wI4FHteY35eN77kasDz4tBTk28mc2DC0Ks68iNsRylq7kTUrcgxmZdpim/1Ma62JASMX
	o6YMaKkJR2mbzT/3yQbgZPJCIGuWm4kgN9D72DIYSCghclX/0wV4cqYGKPy7WPOzxdm3
	RTjsaVRBZpfqsMkxz74TofjVfwIlnmMXxyi5vh/F4L02jgpvbrV928cO8Fpf3SWFFkmq
	dzvEkgz4nOlkBKwh/NbDNs6DWmjs7XrsL6JLPrCqaJDt5LwbBqTXTGKdHltDKBT8sJ7h
	QG0w==
X-Gm-Message-State: ABUngvdZ6RTCT7r+sLbB6K6NpsD2e+3UCqQ+KqCqFwS9Jg4FItO3iX45tucXjBdiVag1bb7hgty61ozGxuGJMw==
X-Received: by 10.31.217.196 with SMTP id q187mr2093958vkg.84.1477238418871;
	Sun, 23 Oct 2016 09:00:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Sun, 23 Oct 2016 08:59:48 -0700 (PDT)
In-Reply-To: <1477222197-3698-10-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
	<1477222197-3698-10-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 23 Oct 2016 08:59:48 -0700
Message-ID: <CAMKF1sq-2EiAYS553aeE++pGRvQDd+2FCARq7DMOgVNg4_OZTQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] libpng: Upgrade 1.6.24 -> 1.6.25
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
X-List-Received-Date: Sun, 23 Oct 2016 16:00:18 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 23, 2016 at 4:29 AM, Maxin B. John <maxin.john@intel.com> wrote:
> License file changes are due to updates in Version and Copyright date

version of license or version of package ?

>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb}                 | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.24.bb => libpng_1.6.26.bb} (67%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> similarity index 67%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> index f91ab7f..8c1cb8c 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.26.bb
> @@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
>  HOMEPAGE = "http://www.libpng.org/"
>  SECTION = "libs"
>  LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
> -                    file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ce8d0bd8303802e5492f064ddddef0e7 \
> +                    file://png.h;endline=149;md5=8cca27e71fd88e1fe1adad7d9e841b5f"
>  DEPENDS = "zlib"
>
>  SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
>            "
> -SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
> -SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
> +SRC_URI[md5sum] = "faed9bb495d2e12dd0c9ec561ca60cd8"
> +SRC_URI[sha256sum] = "266743a326986c3dbcee9d89b640595f6b16a293fd02b37d8c91348d317b73f9"
>
>  BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

