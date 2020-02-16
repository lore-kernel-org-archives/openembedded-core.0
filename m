Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 72250611A8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:15:01 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id c188so14318735qkg.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1LeGfHvekUuShduO0T20Gu/LB4kB+AGmReF2QrQyTM8=;
	b=Pwx9JoNUqQVFiOWd11BPW3zoS7s0FybUjvWd3JV5OH5rQKKkuLlIPcW0n2uULQCikx
	YP43kKtxKYw8mLhaWhUg18SivPfljBtl2Eoz7m6ClbWVJDCVrCIouRZ2C2hkwsKEee1m
	FF7WLm541qJspUhEDCFLAYbEo80PDJVi1Nd8d2mExte7O4SXQTfaou5wjM2cJByR3CEY
	2pmVq5YCoII7KEMy4gNkTHDsnEqb6K40UkObpGuHOWOnmiPhfyNOsICBgGiCy0zF9gVm
	5U5t7hYMZhXKm8NnJDO8XQMdnDtweLjTss7acoX2uGW806nVTlCBETHDLYARfW+LWdc/
	IG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1LeGfHvekUuShduO0T20Gu/LB4kB+AGmReF2QrQyTM8=;
	b=bSuewY8o69gDveQepDJPyMunvNIzjtXicDS7HItcDHoq7pMN+kZatMcKOVC7GkyeLW
	SSO0LElPqJXuCuB7pQ6jm2P3IXclr6HRyR7SV8KstzmBYkcCQDsugUOPbtb9daLDgYNo
	xoOYaIifm/SHwFp2kXnenkpYlw+qNfUePIPtlJ+s5Ru8NYn/2J2w8OL9Tm/rIgOa+NHd
	+Hequ6Lb9l927YoykkvOldqU8UzqLB2/NkU52Dmzja05aSYEVbvua+tj6qehpD5fTFI+
	QihRGXu0X/M1XubGE4PC7VUB73mdqO5Pq2mjDm5qs5e0BGhaJkO0Juv3sZStxDR9Qc9E
	tUtQ==
X-Gm-Message-State: APjAAAWbhCzt4TevinAjFy2iKlzKghDyFOq8GcLIoiYxmv6ZRxn5BZpR
	UzLalTM9gxzq8MEz5uG8jQ/OReMhWS1q4qt/R1A=
X-Google-Smtp-Source: APXvYqwYnJuOp+nQrdLpjjpg3DAWuKX0i5YFAgMvhBUC0jox1TxzCLAtU8h0zgCibbNPW7fMve1rNiugg0eeUNdyGnY=
X-Received: by 2002:a37:de05:: with SMTP id h5mr11942449qkj.474.1581884101851; 
	Sun, 16 Feb 2020 12:15:01 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
In-Reply-To: <20200216155015.21738-8-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 12:14:35 -0800
Message-ID: <CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 16 Feb 2020 20:15:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> webkit nowadays requires a couple of supplementary libraries for this,
> so bring them in (courtesy of meta-browser, which will hopefully
> adjust without a lot of trouble).

its not meta-browser, I guess you should credit meta-wpe here [1]
and perhaps Cc the meta-wpe maintainer as a courtesy.

[1] https://github.com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-wpe/libwpe
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-sato/webkit/libwpe_1.4.0.1.bb    | 19 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb  |  2 +-
>  .../webkit/wpebackend-fdo_1.4.1.bb            | 19 +++++++++++++++++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>  create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>
> diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> new file mode 100644
> index 0000000000..b9c71f9dc5
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "General-purpose library specifically developed for the WPE-flavored port of WebKit."
> +HOMEPAGE = "https://github.com/WebPlatformForEmbedded/libwpe"
> +BUGTRACKER = "https://github.com/WebPlatformForEmbedded/libwpe/issues"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
> +DEPENDS = "virtual/egl libxkbcommon"
> +
> +# Workaround build issue with RPi userland EGL libraries.
> +CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
> +
> +inherit cmake
> +
> +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "1d4d38413ee0d0043f74d0445cab906f"
> +SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
> +SRC_URI[sha1sum] = "a41480a0a85cfa11b3f87f801b7c37bc3410e060"
> +SRC_URI[sha384sum] = "30488e375d956809a84b0d8af7b386a332541c77dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0"
> +SRC_URI[sha512sum] = "cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd26175670"
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> index 4aa8533b42..8d87ad49a3 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> @@ -44,7 +44,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
>                     libsecret \
>                    "
>
> -PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
> +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
>  PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
>  PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>  PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
> diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> new file mode 100644
> index 0000000000..84df0c2535
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "WPE's backend based on a freedesktop.org stack."
> +HOMEPAGE = "https://github.com/Igalia/WPEBackend-fdo"
> +BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
> +DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
> +
> +DEPENDS_append_class-target = " wayland-native"
> +
> +inherit cmake
> +
> +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "c6362491a4a38ddac42b66f140e1cff2"
> +SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
> +SRC_URI[sha1sum] = "9217c8a5511bc53544b42cb23390256580ac4b0c"
> +SRC_URI[sha384sum] = "79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d"
> +SRC_URI[sha512sum] = "8fdd13843c77b95b96b3feffea463bce565620997680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63bbdbfc4d4"
> +
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

