Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAD560589
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:26:56 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c52so1250257qte.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 12:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/qtJBh0jq1Su/GyaD0I0J1T0KswVnbr2Fe4VuUjKmik=;
	b=q4iW9+NVjPSUpJMKYGaA13lMwO+e2fPm28fQ2KKzYVtqPh3+BovtHMBwV153K0pnZ2
	G45/PkSiixlwxmPKm+cr6khos0yw+HlJKTWwMKIY2cDiDjctm/iLZVtvseeyE0U3Mhrx
	BX7W/lmmPWeaAW2KjCAJswZXTYeAUcZd93QXkijQDIGye2HiRsQiQjUchj2m7yZxdRlB
	DIxiFrv0bzKtM4iRQcDwflLil9UZdzHCBpmqFHqM3H+YVxFfcymjbQMOR1xeJxtQoO/E
	FfaIOdqED48CqDbEsoCA6u8MFlipQ3yC/WFcEbBAmwJY/X6NO+nzbZ+HQyM2+uBkWh5h
	JNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/qtJBh0jq1Su/GyaD0I0J1T0KswVnbr2Fe4VuUjKmik=;
	b=ecdOBgdv/YzZi0sF5l1AjhI+D0pUJ/4dFXLuuN06hZ4Hsa6WVw6JG2GZumXKqVKGPA
	SbvROZYoub1bXfBh1Qwbcbbz36HA8OgwKxzb82Oi8ZOi0aUG0APxK4b4jp6ftG6gVOAc
	jllbJgnMCmWhRNiEtHdSXMJQuavkDSkFVbn5OnpnweXHikA3SPyuZhhQFE1N5AgceXoO
	QwhnbLtdgxsdNp48OkozypvGLZ9UcvO/6m6mshq1t0LMy4gfGlYp7Z9Gi3Dx+q+PLs92
	bFecgpnByev0Y5AkRf8laVuz41jlwWO36tUe5HBuki6VfH8tkzmZwJ6F+W7rig7Wyw9Q
	08Pg==
X-Gm-Message-State: ALyK8tK+1E6tejqxEyzyaOP5DIkBXUaOh8Fh64FnWBcoRw/MyGprtWoO7ucNNyg6vtWMVx1dFc2f3APDDi1rNg==
X-Received: by 10.200.38.107 with SMTP id v40mr10884008qtv.76.1468956417197;
	Tue, 19 Jul 2016 12:26:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Tue, 19 Jul 2016 12:26:27 -0700 (PDT)
In-Reply-To: <1468876796-16026-1-git-send-email-clopez@igalia.com>
References: <1468876796-16026-1-git-send-email-clopez@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2016 12:26:27 -0700
Message-ID: <CAMKF1spPAi60QxGcUJ8JtPSxih+wgkbPY5+tgDhDDMV4+aktTA@mail.gmail.com>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Switch the ARMv7 build to Thumb2 and enable back the JSC JIT.
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
X-List-Received-Date: Tue, 19 Jul 2016 19:26:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 2:19 PM, Carlos Alberto Lopez Perez
<clopez@igalia.com> wrote:
> * The JSC JIT is broken on ARMv7 without Thumb2.
>
> [YOCTO #9474]
>
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> index c5e5432..536fa23 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
> @@ -71,10 +71,6 @@ EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=OFF "
>  EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
>
> -# ARM JIT can build on armv7a, but doesnt' work on runtime, cause
> -# displaying problems or ephiphany hang.
> -EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
> -
>  # binutils 2.25.1 has a bug on aarch64:
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
>  EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
> @@ -89,7 +85,18 @@ SECURITY_CFLAGS_append_aarch64 = " -fPIE"
>  FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
>
>  # http://errors.yoctoproject.org/Errors/Details/20370/
> -ARM_INSTRUCTION_SET = "arm"
> +ARM_INSTRUCTION_SET_armv4 = "arm"
> +ARM_INSTRUCTION_SET_armv5 = "arm"
> +ARM_INSTRUCTION_SET_armv6 = "arm"
> +
> +# https://bugzilla.yoctoproject.org/show_bug.cgi?id=9474
> +# https://bugs.webkit.org/show_bug.cgi?id=159880
> +# JSC JIT can build on ARMv7 with -marm, but doesn't work on runtime.
> +# Upstream only tests regularly the JSC JIT on ARMv7 with Thumb2 (-mthumb).
> +ARM_INSTRUCTION_SET_armv7a = "thumb"
> +ARM_INSTRUCTION_SET_armv7r = "thumb"
> +ARM_INSTRUCTION_SET_armv7m = "thumb"
> +ARM_INSTRUCTION_SET_armv7ve = "thumb"

This should be ok. Do we need to specify 'm' ?
they should be thumb only anyway

>
>  # Invalid data memory access: 0x00000000
>  # ...
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

