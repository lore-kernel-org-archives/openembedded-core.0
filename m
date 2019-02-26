Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 61CCD7CC7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 07:47:37 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id v83so2722492itf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 23:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RdN8QQdmH3gxlDHll2S8GR20cU5kdgQesUy9rkx/PW4=;
	b=MX657/XZ2XeO/HYwNT8565lD3U44wtW4yy3NNAZRJ+1aojoVI7O1Kpj7vvQWtlzrRI
	pvQEcMy+RT0+5XlP//MDKEen5FEkdWMb2Wi5oxw28gPdLwKbLvHalcRwPlmZPnEKRMYw
	KijBBHV7DUlrwe1HlGzYSSCGJokeqDf+e9xTwto4GWFjqEnWwBMZp1dyJX8By8D1IskI
	Kl/KxRtjFfdI2uJL3pw9I1oKZh3iu6hQe05KhNT6Hpcwu/5MyAfKGu+wyyf3y400gPzL
	AEN0UWH/WzSqjwOL+7L/H7ssoPcE8P2ETO6bECQ1mu5/8JRtYlz2WVgSEr0fCITTfhxJ
	tjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RdN8QQdmH3gxlDHll2S8GR20cU5kdgQesUy9rkx/PW4=;
	b=BcREvJP4kd1j1Ggpb7DidMatsOxN8RTfLBJB/DF+qaOEufWpNqzLujiuz2VZvDLwH2
	xhm6ujPtPg5KkO+IS0TciV/BV9YxEykQndchy6kKC6zBjZTbMKtL5+iZv8/PD2/zuD1V
	AtbIOLARxoDIBa2whwmqSJ6Hkru6n4pUh+UNerszOmoORsgwNKUkcO/7fVOOdggxG3bH
	BLjJw+JbuIjcTuGWEGb7hNqCMdQAPwXRhD9KmaQvHnkBIDiRRHrvZ/QxSptu3lFTnhw+
	DrxekNKKrsObXZJk8V1c4+q8d6Wa/WQIsRvZHQWyLfwKbF2ehaAxUu6ra97YuSwT++mg
	RWLQ==
X-Gm-Message-State: APjAAAXuQ+cig5zEBG7NVcVnSGpkepZU81VYZsCp6cA/Yq/GAuNRab1U
	tFmRkcmgAdRWn5rYzIvhalvbNIGCCSgJTZqJ3ASnwSDvjfI=
X-Google-Smtp-Source: APXvYqxfPs67O5absdmzaaREdaNEn8GLoasoX0/54I2DExFEkpSIqvwt+Z8+2SfkmfCB8cjlhtaBw+uNZQrXPjzw/IQ=
X-Received: by 2002:a24:13c4:: with SMTP id 187mr1825945itz.130.1551167258371; 
	Mon, 25 Feb 2019 23:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20190226060000.4210-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190226060000.4210-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2019 07:47:26 +0000
Message-ID: <CAJTo0LYDxoCGTJEwzuDkLo52cNYqJ2=cvrZPUChq3n9vi4eL_A@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] wayland:Upgrade to 1.16.91
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
X-List-Received-Date: Tue, 26 Feb 2019 07:47:37 -0000
Content-Type: text/plain; charset="UTF-8"

From https://wayland.freedesktop.org/releases.html:

"The alphas for Wayland 1.17 (version 1.16.91) and Weston 6.0 (version
5.0.91) were released."

We don't ship alpha releases.

Ross

On Tue, 26 Feb 2019 at 05:59, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade wayland from 1.16.0 to 1.16.91.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/wayland/{wayland_1.16.0.bb => wayland_1.16.91.bb} (92%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland_1.16.0.bb b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
> similarity index 92%
> rename from meta/recipes-graphics/wayland/wayland_1.16.0.bb
> rename to meta/recipes-graphics/wayland/wayland_1.16.91.bb
> index 112ee1a25e..8d7a06cdde 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.16.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.16.91.bb
> @@ -15,8 +15,8 @@ DEPENDS = "expat libxml2 libffi wayland-native"
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>            file://fixpathinpcfiles.patch \
>             "
> -SRC_URI[md5sum] = "0c215e53de71d6fb26f7102cdc6432d3"
> -SRC_URI[sha256sum] = "4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5"
> +SRC_URI[md5sum] = "711fea532899f2de096ebafdc54d1e3f"
> +SRC_URI[sha256sum] = "d51b83a51034ed5474517e0b0bca2d4e7056e4c51d720ea885f0c34f243fee90"
>
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>
> --
> 2.17.2
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

