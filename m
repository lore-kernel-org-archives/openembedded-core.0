Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
	[209.85.167.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC4979585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 11:12:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id y1so1254810oie.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 03:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LxOPYJSef0TwYU79whiUjW+TTnYtvST9gd6UWib8/IQ=;
	b=eo2WGnm3QjGII5VqL8dqfkcvG5SAj1YQrj5D1bcxO5M4FEEslaWwrzVo6gQ18NZ1hw
	/FcMFu1V5Wk4uA53DeKCRuCi8rH0Pn7T+zJpjgd69D/gB4XdpmnH7gvN4TtcpWdG++qJ
	jwJKXzBFOppoYdsS0lEyuWLB2D3LhBBNL7rPeu5VAixf8AZ3kZ/RAWvEkmfTM7E86e1+
	8XI7OuGoclWwFuf4Zy/Eb5QqSW60pow6FYy6CODj+apq/p0a50/UJ3KBJKD1TLenKQVz
	pL+oYDpc5CYEmKe4YMb93a2qlllG46xRwyqYlsrvaes/2u6zo0C4yNxu3wde2zelohMw
	Bx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LxOPYJSef0TwYU79whiUjW+TTnYtvST9gd6UWib8/IQ=;
	b=lW0QD2S3rrYcKdkCr4fh+uIftFXmwQTLYXakguMddZMJ9TyTfTQhD9kzCS2eOhFIJW
	sNM92hkcKQMZA2A29+MZKoRhSeMqQZgj75ecEzwU7cKzVIQh7p3yN6I3CeqP72oxo4cf
	7Jm8gvD15c+NKaBm6yGCdgyI4pBYnSVkSKRItNTYRWZT4+JiFRKEcd6ZJ+lU66MQ6oxi
	jr7rGlGMDSohQYZOVey6C2tgA6bCbcvUWfPHkJU/j+PFjZDBCAiyEENNmLIK20YQ0M5o
	tWV1ZxydWRw8K3mBuYpuRi9IwsMJVhOoSxdox+fk3kANyCCYQiDsI2CcHTcH/rEI9t/T
	zsMw==
X-Gm-Message-State: AA+aEWbBElcSNJfqUz6XEkxBFSUlhhaT2k9ZJ+VOjp5Xh/pM1QUTNepr
	HHxDhh3pykusEpfca2scS9zziTpQgXJ1K737enaTTQ==
X-Google-Smtp-Source: AFSGD/Xpzeo3YAJa//FTWpUJELSyiVVEvhnIe0MRey4Hg1/+Ia7zuZ8COZcpoZvvme1k+82PxPeyPJHQKHJDb4u8YuU=
X-Received: by 2002:aca:4586:: with SMTP id s128mr1860092oia.182.1545304379020;
	Thu, 20 Dec 2018 03:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20181220104651.9238-1-ricky.yoon@windriver.com>
In-Reply-To: <20181220104651.9238-1-ricky.yoon@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 11:12:46 +0000
Message-ID: <CAJTo0Lb5zT5EMHZ=EY=Z-=v8=smaBAEXDgUZX2ga+-zQ1GSnsg@mail.gmail.com>
To: ricky.yoon@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng: Upgrade 1.6.35 -> 1.6.36
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
X-List-Received-Date: Thu, 20 Dec 2018 11:12:58 -0000
Content-Type: text/plain; charset="UTF-8"

This upgrade is already on the list.

Ross
On Thu, 20 Dec 2018 at 10:48, ricky.yoon <ricky.yoon@windriver.com> wrote:
>
> License-Update: License file changes are due to updates in Version and Copyright date
>
> Signed-off-by: ricky.yoon <ricky.yoon@windriver.com>
> ---
>  .../libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb}         | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.35.bb => libpng_1.6.36.bb} (74%)
>
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
> similarity index 74%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.35.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.36.bb
> index 5ae0a91a74..3cf4f7249c 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.35.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
> @@ -2,16 +2,16 @@ SUMMARY = "PNG image format decoding library"
>  HOMEPAGE = "http://www.libpng.org/"
>  SECTION = "libs"
>  LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=4791381a76f106ac4699f6261c65ee29 \
> -                    file://png.h;endline=144;md5=090ba5769782e8a1663a45fab1c2b36c \
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=12b4ec50384c800bc568f519671b120c \
> +                    file://png.h;endline=144;md5=15ae15f53376306868259924a9db4e05 \
>                      "
>  DEPENDS = "zlib"
>
>  LIBV = "16"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
> -SRC_URI[md5sum] = "678b7e696a62a193ed3503b04bf449d6"
> -SRC_URI[sha256sum] = "23912ec8c9584917ed9b09c5023465d71709dce089be503c7867fec68a93bcd7"
> +SRC_URI[md5sum] = "df2be2d29c40937fe1f5349b16bc2826"
> +SRC_URI[sha256sum] = "eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319"
>
>  MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/${PV}/"
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

