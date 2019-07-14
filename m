Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 334367F0AF
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 14:07:14 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so13073615qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NniI+dui0GX39QncwYIBEh3YqbSTi+mbAB5t38XYtHM=;
	b=porGlfXIOOqXMZ7X7Kl5TyTwak1dGf228fnzztAGSABSOMz3ROdfhvW7p+it8Vbskm
	xnwYgPAvPfm+NE6WILz0ulYpGeIHqIKz7rJUtsaacM1zGL9S5dFufuJEznfd9ARKVP0u
	TVSXpRynrRsUFCfS+RNn7S38L5wI/JZToEcTmITZDjV3MPB7rrcI6nlPS0OAE3OUaEwn
	7Ur8/HJ8GN78M+Om0sO4P2f7sk3vZaIjOg/fF3E+YFzEJTTd4x1v4LtmYEIEe4uhLRaX
	RyqKetzCQKTyLd2ZdjXqI2OHeVEwmSBgvBO+f7A7JKIfJ59BN48hbfr6ZzHYDBDlb6Zt
	RaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NniI+dui0GX39QncwYIBEh3YqbSTi+mbAB5t38XYtHM=;
	b=LcIhgdW7BZbhamaJ1cIZ0W7M3o8AfduN3vVxJ8N22zTjm+8SvompJbQMvezG9216k3
	y3jJdIKmJxeWVJ+wMWwhvkYohOcsEAZosaDXQ1UbVRmo99TjcetuCZd0SFTcee5WJJmQ
	auYD3xcy75hxMOJ34KUiiBjkI/+vyepj9fkKp+25U9QwxVGC2m6/8cTsaHioziG0bfWU
	BP+7iYlGCbwOqsAJu5ha8AXWlIpmQcXgVXT1xD3tZA7YVoV4n0bGDK/xetYax/1Hwodo
	sae9EYyx44t8jeqSaKrnQdBxW4fUHONh4baubetLxa6e/RarwHzHD6orsdIKFKtJgudR
	Mkmg==
X-Gm-Message-State: APjAAAW/p/o6xa/80cSvtGV7vgc8CvneEMw4LAVn9wOc8rjtplq9Ha1E
	BYajMyH47n/tONEM0dOv5JTavk4yU4xQdZOuOM6WHb7ddvo=
X-Google-Smtp-Source: APXvYqz4sd+JRg3ZC250Mw0Ljvc6Hw+mXFPk/DTYUpNTA3jHUl/PD+6OcD+P1ZnRNUaWpv/aS9bJChoeFyc7ZD4wKjM=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr15140746qvg.181.1563113235510;
	Sun, 14 Jul 2019 07:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190712193726.22793-1-oleksandr.kravchuk@pelagicore.com>
In-Reply-To: <20190712193726.22793-1-oleksandr.kravchuk@pelagicore.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Jul 2019 07:07:00 -0700
Message-ID: <CAMKF1sq1+bRSoC1zfNnYPOr9i3asihfUXX0GnLnydxfAsJw_nQ@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpciaccess: update to 0.15
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
X-List-Received-Date: Sun, 14 Jul 2019 14:07:15 -0000
Content-Type: text/plain; charset="UTF-8"

fails for arm/musl
https://errors.yoctoproject.org/Errors/Details/252021/

On Fri, Jul 12, 2019 at 12:38 PM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Removed patch was upstreamed.
>
> Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> ---
>  .../0004-Don-t-include-sys-io.h-on-arm.patch  | 28 -------------------
>  ...pciaccess_0.14.bb => libpciaccess_0.15.bb} |  8 ++----
>  2 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
>  rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.14.bb => libpciaccess_0.15.bb} (62%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
> deleted file mode 100644
> index f532858244..0000000000
> --- a/meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From b6df5202306bd71158b482f25ca2e6919645d4dd Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Thu, 4 Jun 2015 20:55:06 -0700
> -Subject: [PATCH 4/4] Don't include sys/io.h on arm
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - src/linux_sysfs.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
> -index 3f95e53..1e3aad3 100644
> ---- a/src/linux_sysfs.c
> -+++ b/src/linux_sysfs.c
> -@@ -50,7 +50,7 @@
> - #include <dirent.h>
> - #include <errno.h>
> -
> --#if defined(__i386__) || defined(__x86_64__) || defined(__arm__)
> -+#if defined(__i386__) || defined(__x86_64__)
> - #include <sys/io.h>
> - #else
> - #define inb(x) -1
> ---
> -2.1.4
> -
> diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
> similarity index 62%
> rename from meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
> rename to meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
> index d030c31bd0..16393ac3bb 100644
> --- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.14.bb
> +++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.15.bb
> @@ -5,12 +5,8 @@ PCI bus and devices in a platform-independent way."
>
>  require xorg-lib-common.inc
>
> -SRC_URI += "\
> -            file://0004-Don-t-include-sys-io.h-on-arm.patch \
> -"
> -
> -SRC_URI[md5sum] = "8f436e151d5106a9cfaa71857a066d33"
> -SRC_URI[sha256sum] = "3df543e12afd41fea8eac817e48cbfde5aed8817b81670a4e9e493bb2f5bf2a4"
> +SRC_URI[md5sum] = "843e92d0eef94684a4eb9a2d311bfb12"
> +SRC_URI[sha256sum] = "a75643bb5cd02f6da8667d437b76492842dd56bc88e3dfb8410f5d535b99f5dc"
>
>  LICENSE = "MIT & MIT-style"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

