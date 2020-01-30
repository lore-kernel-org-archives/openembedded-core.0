Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB466069A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 14:01:52 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id n25so2390775lfl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 06:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=plKacpW2yYgXamGEKLwQhPxlb5eyQoNJVUvajXl/Dbo=;
	b=c5SM4Th6S/z2JlUOkSim2cwzfpK6PFXulhEvhq928kFFZ1IAciNvlOQ3mJb9dWLHLI
	RiFoTDENlitdV/o8Kd3hFvWBigKX/1vfqoid45fVMPMqcgg0UcqAyqeIH5QkreNNeA1P
	syJF6C2XKIl4Q7X9MH37XosFZps5gPJ8WVS55alhkr8+FS+UZRZ0bXy0gGri8FEYtW0r
	qbedsEmnl3oWkDsLjWiEYJEEpLa/IpVLbkNKszHK+B2xizs7k+CXizaQtqVykOFzmQxR
	B+pfTnncvl50Fu6U4/e1cwPSafPn5l4WKDfZ9qd+vOAhwb7f7fccvvy5jXkMBvB0CQ3K
	lwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=plKacpW2yYgXamGEKLwQhPxlb5eyQoNJVUvajXl/Dbo=;
	b=BPZnpq4O/mObhDX0ytY3+hUOOaYm9df834nmesL7B0TLPAKB/sMiB+NgYvCadBwlBI
	u7Byf4ql1z6ejmk2G349aT2RDp20uiXmyOnfLaei5MhYgd59talXnNpKlQlItyJ4kFSV
	xXXYRCy13LeOEnOphpWiT2YPBEgkgPvlNqG2OQCG0wA6lc0d29AsokwSLs6sNiqI9Zpd
	12HVhQJ2oo9WkvhZbnlh3QQz9bI34BajNWh85opp+NywiK/JPPR7AMff4Aaxx7MSBhsO
	YPJsNKlPUt1kVje38JlpWrafxC9c68XlI2S+RM36JXLuWpah06CpZ71ct02OD7Z+8FwO
	yBpw==
X-Gm-Message-State: APjAAAVXHZmIal84QLNs5VsZGjsv/enRcQvysJoBvYdIpcHyVqMEVSrN
	pHx84JBCFfsj+9K5dc8jDRqsdOQbE8C3nqwQ+QDbYWQXW4+E4w==
X-Google-Smtp-Source: APXvYqxFqJ1jLLlDAz26RnF3wugFjhPFgotcJRuba19gOydjwzeuwxV81vIm/gfkO7+EOCDtJY0dQvSyC6x5SyFrAK8=
X-Received: by 2002:a19:7711:: with SMTP id s17mr2688086lfc.164.1580392912986; 
	Thu, 30 Jan 2020 06:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20200106091806.49129-1-tanuk@iki.fi>
	<20200106091806.49129-3-tanuk@iki.fi>
In-Reply-To: <20200106091806.49129-3-tanuk@iki.fi>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 30 Jan 2020 15:01:41 +0100
Message-ID: <CAP71WjyMNKJJ0CFzVaVRx0T4rffN0dWJQ-JfJEk7iKHPFegEpA@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/5] alsa-ucm-conf: new recipe, version 1.2.1.2
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:06 -0000
Content-Type: text/plain; charset="UTF-8"

hey,

On Mon, Jan 6, 2020 at 10:18 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> The UCM configuration files were moved from the alsa-lib repository to a
> new alsa-ucm-conf repository. The move was accompanied by a license
> change from LGPL2.1 to BSD-3-Clause.
>
> Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../alsa/alsa-lib_1.2.1.2.bb                  |  2 +-
>  .../alsa/alsa-ucm-conf_1.2.1.2.bb             | 23 +++++++++++++++++++
>  3 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 39eee9475c..c9fb373f52 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
> +RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <tanuk@iki.fi>"
>  RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> index 9565ad1b20..7bc78b8523 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> @@ -33,7 +33,7 @@ FILES_alsa-server = "${bindir}/*"
>  FILES_alsa-conf = "${datadir}/alsa/"
>  FILES_libatopology = "${libdir}/libatopology.so.*"
>
> -RDEPENDS_${PN}_class-target = "alsa-conf"
> +RDEPENDS_${PN}_class-target = "alsa-conf alsa-ucm-conf"
>
>  # upgrade path
>  RPROVIDES_${PN} = "libasound"
> diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> new file mode 100644
> index 0000000000..469d1f7a95
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "ALSA Use Case Manager configuration"
> +HOMEPAGE = "https://alsa-project.org"
> +BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
> +
> +# The tarball doesn't have any toplevel directory. The subdir option tells
> +# Bitbake to unpack the archive to the correct place.
> +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
> +SRC_URI[md5sum] = "b7fa43cfd79df978184a6333766d2a50"
> +SRC_URI[sha256sum] = "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b24554062f"
> +
> +inherit allarch

it's a bit late into the game.. but I have some questions about this
patch. now that the alsa-ucm-conf are allarch, how do we expect a BSP
layer to provide its own UCM config files? if i add a .bbappend file,
I can't change PACKAGE_ARCH to be 'machine' specific. If i create a
new recipe for my custom UCM files, then it's not obvious when I
should install them, since we need them only if alsa-ucm-conf is
installed in the first place..

I was thinking about adding an empty alsa-ucm-machine-conf recipe that
BSP could append,  like gpsd, e.g.:
http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb

Is that a good idea?

> +
> +do_install() {
> +        install -d ${D}/usr/share/alsa
> +        cp -r ${S}/ucm ${D}/usr/share/alsa
> +        cp -r ${S}/ucm2 ${D}/usr/share/alsa
> +}
> +
> +PACKAGES = "${PN}"
> +
> +FILES_${PN} = "*"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

