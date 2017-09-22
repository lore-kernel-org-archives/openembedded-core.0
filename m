Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7FEF377D9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:51:38 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id i13so739838qtc.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 04:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0n73piPDRvNCCGvxpHTwZu4lIR7MzkYZRpjn+9dwcRo=;
	b=GZTxARWl9ZfBWe/6ktbZynlgdgqi7V0jHFyrJmrnQrR0/T6KJc3fXbidmRL5g9764F
	HYNyEwcezniD9EHwoOEFQJ4ropjx4KlV6HcCTMb+3QQ7IctP8+c9iZq1WVm64bcz7hbg
	x/gE3F1jj5d+ceD6lnROHhQoxlHN5dbNL7+ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0n73piPDRvNCCGvxpHTwZu4lIR7MzkYZRpjn+9dwcRo=;
	b=NME4Cox0lBAvfAGGO/73vgxDKGmRfJ8Hm7otdUypQJ2E+8Dc0W6YL8mAUlJti7bz+o
	o5VYdNbkEancfHzJ7kwcQMZjKaYKqguBFvd8n7+uK6eT9vrSd1SHz8CBXuEEuD5gMIr1
	SPQD8Y96Oq/goZ9NNyJ+lEK9s/birPQNoHpiRscM+sUeGuRr1VpgFa4+koyM8+lmAYa4
	f50G5mIVl+udCc6J9nWcIj2Wi5dgze7OA0JeI/p3S9BhqotUS4wdZj+gpm+dCU/d0Nny
	9avib1tYorgHe5xnSVPIU1hpvmrzOZrNBxvILM1Wf5NT8nggcPi4ZINM8qQIZBZoI0RJ
	OIBQ==
X-Gm-Message-State: AHPjjUhIptfhLPJsVmBoDChWm/F18CbJTd23iogRuq8yVBbqDUeGrBSC
	5vWc0BV530NaAzfXd2gGufZrCDtKyRMMYhEZBupvlmHwssQ=
X-Google-Smtp-Source: AOwi7QB7MDw24/QiVNHM4f0eAJZkZUBzOMGdFWljPBsz81O0ab4t1w0GZ/Xa5sfD7fVXuLlX5EVrRYwMWqU54uPvM6U=
X-Received: by 10.237.53.225 with SMTP id d30mr7999910qte.164.1506081099374;
	Fri, 22 Sep 2017 04:51:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.42.182 with HTTP; Fri, 22 Sep 2017 04:51:18 -0700 (PDT)
In-Reply-To: <20170922110243.10454-4-fabien.lahoudere@collabora.co.uk>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
	<20170922110243.10454-4-fabien.lahoudere@collabora.co.uk>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 22 Sep 2017 13:51:18 +0200
Message-ID: <CAP71WjwZ0BVhtRGGLRGaCzDZ2SfJvAzERtujG-dw_hmbDB1WaA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] mesa: Bump to version 17.2.0
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
X-List-Received-Date: Fri, 22 Sep 2017 11:51:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 22, 2017 at 1:02 PM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  meta/recipes-graphics/mesa/mesa_17.2.0.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/mesa_17.2.0.bb

* the diff looks suspicious. you should have renamed the existing
recipe, not just added a new one.
* there is already a patch being discussed on the list for 17.2.1, please check.
* we will not merge any x.y.0 release of mesa, the .0 release are not
meant for production use, as mentioned in the release notes: "Mesa
17.2.0 is a new development release. People who are concerned with
stability and reliability should stick with a previous release or wait
for Mesa 17.2.1."

>
> diff --git a/meta/recipes-graphics/mesa/mesa_17.2.0.bb b/meta/recipes-graphics/mesa/mesa_17.2.0.bb
> new file mode 100644
> index 0000000000..e522e0bbfe
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa_17.2.0.bb
> @@ -0,0 +1,24 @@
> +require ${BPN}.inc
> +
> +SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> +           file://replace_glibc_check_with_linux.patch \
> +           file://disable-asm-on-non-gcc.patch \
> +           file://0001-Use-wayland-scanner-in-the-path.patch \
> +           file://0002-hardware-gloat.patch \
> +           file://vulkan-mkdir.patch \
> +           file://llvm-config-version.patch \
> +           file://0001-winsys-svga-drm-Include-sys-types.h.patch \
> +           file://0001-configure.ac-Always-check-for-expat.patch \
> +           "
> +SRC_URI[md5sum] = "1d8d7323d11146767a37c3cb6a6d411d"
> +SRC_URI[sha256sum] = "3123448f770eae58bc73e15480e78909defb892f10ab777e9116c9b218094943"
> +
> +DEPENDS += " llvm-native wayland-protocols "
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install_append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +    fi
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

