Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 811D37875B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 23:23:13 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id h197-v6so10090931lfg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H3DG9TBANFD57RMlDZ1npd8VP8rZeKqJ9te1no/TvnU=;
	b=DCy58LS9Ycm9pA5+ym4cMzuet+9AAQj5e9fbjvX64lzW5cvEGA2tx7XiXt3w/me8/7
	5jiKrIilKtGwhhbwp7HKihmcuBbRy3kNypxQ/grkc/IGjlSYAkWKt6E2r6ZtYB7b+U9z
	2dxyCnb+yErHk+XowxPlj5HzV7G+lETv881vpAF46vmj5qTEGCprtYXM4H1CYBnsun24
	48ahfFTUw6NXsw2AkUHI2MB5Pkpu1d7MZXq0hKqBbJuax3uQyn17g8nPwlAtz2NFrpux
	N1d04N5K23EyhjxvqhbNoIZHhD1B0YERSadgCvbm7cFSTasAABhrbuc+VOQ6FzTfTx/s
	ZFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H3DG9TBANFD57RMlDZ1npd8VP8rZeKqJ9te1no/TvnU=;
	b=YsxJibkulOhzpCXmD/CWxrmKw4WIdpUmcJ0L7Ge6VO45A+/BL24TWRcU8ynqNCEjR/
	5kSTq8Rz8o10KBogijGPVGzUV6ij2U358hKVy81OcpNhPofV5zWGgXmquczUdj2xMJ4n
	NN7Hkx+ROCRW7kzpIGI3s069NEFnDVfjje3/+OBUonSgKHkpho3QZ+3vL5RvIhHzv5F5
	8TmLCrUnKziQIqRh7Ncvtj7P75TvGEv1nkT8WefSNf+fUTPOIB8qxSrI9pFFwMJ+5dE/
	wgexbwJmkQj5A2rjuiIYl+EAQqTVIO8mCKV7xhesFuhogQPyi8dGXLYjAebBWKDvXesO
	KN0g==
X-Gm-Message-State: ALKqPwdTsRkMo/O/RNyd7A2fjt1QePwaa18RVQtiTQ2WwW1R143RAdjT
	twtjdwPV6QRqQbg6/WIxTJFRKqKTCW5e9pnUEarE6w==
X-Google-Smtp-Source: AB8JxZpJHAZkfm1h+KqvJmPRmujuI/67WIezC67081IxMGBQCaKbjGJU/PLMb0m8nPN/1n8Z8r+F3ZaYVHdPAetRSus=
X-Received: by 2002:a2e:9706:: with SMTP id r6-v6mr5050580lji.5.1526080994321; 
	Fri, 11 May 2018 16:23:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.142 with HTTP; Fri, 11 May 2018 16:22:43 -0700 (PDT)
In-Reply-To: <20180511192103.7581-5-Martin.Jansa@gmail.com>
References: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
	<20180511192103.7581-1-Martin.Jansa@gmail.com>
	<20180511192103.7581-5-Martin.Jansa@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 May 2018 16:22:43 -0700
Message-ID: <CAKmqyKPG6x7q8M-EaBwYVV8BRZY6OhsTpRdkhsb=TS=ArEvvGA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 5/5] qemu: use sdl2 instead of sdl1
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
X-List-Received-Date: Fri, 11 May 2018 23:23:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 11, 2018 at 12:21 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * sdl1 since qemu-2.12.0 depends on x11 in DISTRO_FEATURES, switch to sdl2
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-devtools/qemu/qemu.inc | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 9010a04792..8169e55e69 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -74,11 +74,11 @@ do_install_append() {
>  # END of qemu-mips workaround
>
>  PACKAGECONFIG ??= " \
> -       fdt sdl kvm \
> -       ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> -       "
> -PACKAGECONFIG_class-native ??= "fdt alsa kvm"
> -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
> +    fdt sdl sdl2 kvm \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> +"
> +PACKAGECONFIG_class-native ??= "fdt sdl sdl2 alsa kvm"
> +PACKAGECONFIG_class-nativesdk ??= "fdt sdl sdl2 kvm"
>
>  # Handle distros such as CentOS 5 32-bit that do not have kvm support
>  PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
> @@ -87,6 +87,9 @@ PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/includ
>  PACKAGECONFIG_remove_darwin = "kvm"
>  PACKAGECONFIG_remove_mingw32 = "kvm"
>
> +# sdl1 can be used only together with x11 in DISTRO_FEATURES, because since:
> +# https://github.com/qemu/qemu/commit/2ec78706d188df7d3dab43d07b19b05ef7800a44
> +# it explicitly includes X11/Xlib.h for all gtk, sdl1 UI backends
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,libsdl"
>  PACKAGECONFIG[sdl2] = "--with-sdlabi=2.0,--with-sdlabi=1.2,libsdl2"
>  PACKAGECONFIG[virtfs] = "--enable-virtfs --enable-attr,--disable-virtfs,libcap attr,"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

