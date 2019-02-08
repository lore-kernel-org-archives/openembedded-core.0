Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFF7D6C102
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 09:28:11 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z19so751141otm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 01:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VY9uL+23VeGLstlSN5H6Ed90KEA9/ftkFgyssw1vU1I=;
	b=kSnoncPm+sJ5mMQSyQXtUAmzYeX2CjdHrZDVDq0EG1QxdukaSzkoByGJNJJ9MXgvdo
	T+wmN5Xd3r6BEoftlD3rMQvuS5NO4Bjru87PSEDEesSuocm90FAQzxeVk6XXA0Do6js+
	FNxAJz9DEFD3qCduFF35zWtypx+7obxLDudG+tQf+QN0lbIAzU8SgxOX14S5210IvMnS
	152/EFPNTAz5Cy4Uz1SSCrBRqTWfGwMX6C8CyiSj8OyY19ghVenVHpBij6EhWyXKV+kf
	dPfVbeVFnBMDT0RkoE5F/30QbFNcCIJ+yBgMWVc5lM1VJo49Zzree3EnZryKjsO0sRK5
	bDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VY9uL+23VeGLstlSN5H6Ed90KEA9/ftkFgyssw1vU1I=;
	b=miW2w00MWGCYqx98OrWtQscy1DxzMFMDxiBw62mwtTI/48yDPvsajko4E6L0IHk0Y2
	+aBY4TkEwM0CMJVbobtgMoz0lusisYdSD9pa+LaNv+ekCeMvYV3y/9BgoViQhw5YhnYT
	zGCFlGXanst50XEf4JfCIkIuCsdKEAEbWHfhrbUwaCEpD7s9P/dDFWE94kC4lPsIkOW+
	lTGfoGar24gEoesAWcXkDwx5lsvoatQC9xbQUVUx/D3l6YMgkyt63poUGKwnbhY3jLl7
	ni31sF/rVIcTn+JfvEjWtGKHf2OlQv45Q9RZsvJtNj9rI5L5TJcubjANFFEDmfLKuXP2
	k++Q==
X-Gm-Message-State: AHQUAuYiBUK0KRS9Yl3FM/WW5cWf13tyX/grGS51dU6cd9EAYlxzgIGl
	8ndIndjidZqvPrYAA2x8DKk5zYaiUKIiRJV87Yc=
X-Google-Smtp-Source: AHgI3IYqWiYtfaVIXsrfYiCHbIGUNbftCXXIFybMIpSi3OlrsACno+2pb6h3QnN+QGLAGrQY+SNgvG878eM44BoQS8g=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr11979142oti.367.1549618092639; 
	Fri, 08 Feb 2019 01:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20190208060733.5096-1-alistair@alistair23.me>
In-Reply-To: <20190208060733.5096-1-alistair@alistair23.me>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Feb 2019 10:28:01 +0100
Message-ID: <CANNYZj-y1ntqO20edE9CMEDfeSqUwfnZ=mUdTEvPztoTHm+j-A@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-lima: Add support for mesa for Mail-4xx GPUs
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
X-List-Received-Date: Fri, 08 Feb 2019 09:28:12 -0000
Content-Type: text/plain; charset="UTF-8"

The status of the driver is described here:
https://www.phoronix.com/scan.php?page=news_item&px=Lima-DRM-Driver-Mainline-V2

Considering the kernel DRM driver is not yet mainlined, and mesa
driver is also developed separately, and the developer says:
"Qiang continues to work on the out-of-tree Lima Mesa driver, which he
says isn't yet ready for daily usage but can run simple tests like the
KMS cube and glmark2."
I think this shouldn't  go to oe-core yet. Once this is in mainline
mesa and kernel, it will be available 'automatically' through version
updates, until then the pieces belong in a suitable BSP layer, I
think.

Alex

On Fri, 8 Feb 2019 at 07:07, Alistair Francis <alistair23@gmail.com> wrote:
>
> Add support for the open source reverse engineered drivers for the
> Mali-4xx GPUs.
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../recipes-graphics/mesa/mesa-lima_18.3.0.bb | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
>
> diff --git a/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
> new file mode 100644
> index 0000000000..0f26ede2c4
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
> @@ -0,0 +1,23 @@
> +require ${BPN}.inc
> +
> +BRANCH = "lima-18.3"
> +SRCREV = "8e713e4781982c700bfc7b09279146189d525a86"
> +SRC_URI = "git://gitlab.freedesktop.org/lima/mesa.git;branch=${BRANCH} \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "python3-native python3-mako python3-mako-native gettext-native libdrm"
> +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr', '', d)}"
> +
> +PACKAGECONFIG[sun4i] = ""
> +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'sun4i', ',lima,sun4i', '', d)}"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install_append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +    fi
> +}
> +
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

