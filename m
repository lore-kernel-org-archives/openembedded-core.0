Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id E1E6A60602
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 09:46:00 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id w194so14008558vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 01:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RvmXGTgsnPQCk+9eIIEGPWGwsR0cNIY9KKBNqyeQTRU=;
	b=ovUxY6H2s9Bi1WgAZNpz7NITg2fa8mg2ZZa91PEXY9RFFWvRFiTx706QBsIS4v6+08
	UTR2QkbGSsRomtqK2BNGK3wCQJnC82RplT60kj8hj2/ZQvWqJy4IvCZ1M3aDMdwSm6wb
	XSO6Gmpi7PqXOk1eL+O+xN0flLjdKLsgroV7AcIwDfnYDiMiVIo/T6MIWbxq23hG18jW
	nJ8xu4aukT6wqQhyvsNjGd2HWFKvSEt9ZLr4qBspliEKuI9mUQ9+lJ2qJPALEhAP9uvY
	Yg3pcFOfikpxYaN6HBQJX6Pv/128mCALHQ2cvSkXjCESLuJ80GYXJ86tzLzK0kxecis1
	//2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RvmXGTgsnPQCk+9eIIEGPWGwsR0cNIY9KKBNqyeQTRU=;
	b=Y7ra+yZ3r7PwupXsIQp+RlFiYsa3Pl83hBGulon+UFKg3ei/5Tbo04UTu4K70L4j85
	n0DHqSeXJ2oLuN6e3VHQISB/vji52GJfMKP9JYfxGCoWvgcJtfK0FPef+kiybz/mTFIZ
	f2/gxTDTtw8CTT3Uf+GtiHG4vLeiY9jWq9YaOSqLw3n1/q0TKvjEbNvoKKY2x2/OKH+T
	5VbYaCIiUWmu3LqXov3BzeQG9FYywBZJlnBnk+Dzw80LJJ1iydpu7IrQJsJDyQAhVR3Y
	eL2QJeIlCVfXMMate0caHLrY6P8Eq+72W9sbMDgP7LkRM63LbnL4PDYyWFsBfVhFZ+LA
	FaOg==
X-Gm-Message-State: AKaTC01konhz2OHYzFQiEMh6t1c2JYKAAgZwVp2taK1drbzDFWnY+IQi2CTlZUgUnou/s3e/hc63Cz/PK3OdpA==
X-Received: by 10.31.88.1 with SMTP id m1mr1018492vkb.83.1479375961852; Thu,
	17 Nov 2016 01:46:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Thu, 17 Nov 2016 01:46:01 -0800 (PST)
In-Reply-To: <1479372964-21409-1-git-send-email-jussi.kukkonen@intel.com>
References: <cover.1479301275.git.jussi.kukkonen@intel.com>
	<1479372964-21409-1-git-send-email-jussi.kukkonen@intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 17 Nov 2016 10:46:01 +0100
Message-ID: <CALbNGRQiOMdkinrafMm2ZCYmPdGu2wHy9FJ9OAs3TO6eTgJooA@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Upgrade 2.4.71 -> 2.4.73
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
X-List-Received-Date: Thu, 17 Nov 2016 09:46:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 17, 2016 at 9:56 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>
> I've pushed this into the mesa-piglit update branch:
>
>   git://git.yoctoproject.org/poky-contrib jku/mesa-piglit
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/mesa-piglit
>
> Thanks,
>  Jussi
>
>
>  meta/recipes-graphics/drm/{libdrm_2.4.71.bb => libdrm_2.4.73.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/drm/{libdrm_2.4.71.bb => libdrm_2.4.73.bb} (93%)
>
> diff --git a/meta/recipes-graphics/drm/libdrm_2.4.71.bb b/meta/recipes-graphics/drm/libdrm_2.4.73.bb
> similarity index 93%
> rename from meta/recipes-graphics/drm/libdrm_2.4.71.bb
> rename to meta/recipes-graphics/drm/libdrm_2.4.73.bb
> index 152cf55..3315014 100644
> --- a/meta/recipes-graphics/drm/libdrm_2.4.71.bb
> +++ b/meta/recipes-graphics/drm/libdrm_2.4.73.bb
> @@ -16,8 +16,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
>             file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
>            "
>
> -SRC_URI[md5sum] = "776bccc84618b616fc57a7143836ae7a"
> -SRC_URI[sha256sum] = "c66287ddeee5f46ea8f8880b94b80acb3bbc33ba6321d17767eef145046df9b8"
> +SRC_URI[md5sum] = "bc1cee09cde72ffe3b952e8f50ccdaa8"
> +SRC_URI[sha256sum] = "96bfd39242fe168017d95f22e141645a35591f5902a7d98c2fa4ca8c31df5e4d"
>
>  inherit autotools pkgconfig manpages
>
> --
> 2.1.4
>
Thanks!

Andreas

