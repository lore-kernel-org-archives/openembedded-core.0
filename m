Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id B984F71CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:48:21 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id 12so8696142wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 19:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UTxQ8iZOOBZ1ptZR1418L2aifNMaU0BiYCl42+rO8Lw=;
	b=Pq7RiP2UqwrgPMNqIOl/Tvsn6jOyzcI6d8nVfUy57fmZ1SyX+PdTzza9frXtT9XEU7
	9aP4v5H+MlhHLIm16GTqTB00Z9g81LIYamAjkLSE0Bd4hBA0MUkzc8HCZ/eltz5Q2Thx
	SbSfqo5IqwIXekSFnd62UCXKgBtnptbe55As1rXX5RXBTQqNK3YeArYnDwrE7448+1rz
	q7Et7tWTyxXeQ5LYXmKG80+PJcD/zAarc682zPnU2BQfnuq52thy3KKMrCNbtYQje3iG
	/KNvtBtTOueJ+dV/P7fESlC5TLo4cCn4IckokF42XSKPjmRaB2pNqJ/pQ5bwIu1wPm9Y
	Jw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UTxQ8iZOOBZ1ptZR1418L2aifNMaU0BiYCl42+rO8Lw=;
	b=t5fOqjiu8icMnNpl+bo05p9hMU5VdpoQOAemI2PqPz1VG635uPz/8KsTBmiPGcWktY
	xaFCINNXHAa/PEV4NlpSslav96tM416ocAOLZKrmad1kMyiUYY0jg3QGNroogWfjJwWA
	HxSTBgqoNEbP1ysmx4Dhi73WTYVZ1SfLdMcYYFq/5ZmGD2JbwX5lTNcUmKp3YE58/NH7
	TiSa8LW/DkcXDBkZNkD5HF4eyhFlomTOhtZhl+az34KXadHfMxzqWaBCzf0s9m5BTxSk
	v9e4Q/hkorbMmBjCXpdsaW0E/A/X3ThkgFjmeL5ZFW0EctV/KK0hwikUAxdQHjFlQzXn
	NCoQ==
X-Gm-Message-State: AIVw110Hb1Gv/X14kEd/0yqIyuK7vtdfbdj5BNg2PvFXYG9bGmp7MnOu
	+v2xmYEZFaQfsVIX1zup0ItpLjCbJQ==
X-Received: by 10.80.142.172 with SMTP id w41mr51848edw.34.1500346102453; Mon,
	17 Jul 2017 19:48:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.210 with HTTP; Mon, 17 Jul 2017 19:47:51 -0700 (PDT)
In-Reply-To: <20170718002129.8704-1-mkelly@xevo.com>
References: <20170718002129.8704-1-mkelly@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jul 2017 22:47:51 -0400
Message-ID: <CAMKF1spT18TdH6FbS+L0xLrRRxofpUwhLtNQtA3PKxFTRoNCUg@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-python: add new recipe
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
X-List-Received-Date: Tue, 18 Jul 2017 02:48:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 17, 2017 at 8:21 PM, Martin Kelly <mkelly@xevo.com> wrote:
> Previously, we had a gst-python recipe, but it supported only GStreamer
> 0.1. After GStreamer switched the Python bindings to use GObject
> introspection, we were no longer able to build the bindings, and they
> were dropped in this patch:
>
> https://patchwork.openembedded.org/patch/93793/
>
> However, at this point, we have a gobject-introspection class, so we can
> use the bindings again, this time with GStreamer 1.0.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  .../gstreamer/gstreamer1.0-python.inc              | 35 ++++++++++++++++++++++
>  .../gstreamer/gstreamer1.0-python_1.10.4.bb        |  7 +++++
>  2 files changed, 42 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb

I think everything in single file would be better

>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
> new file mode 100644
> index 0000000000..3299b89daa
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python.inc
> @@ -0,0 +1,35 @@
> +SUMMARY = "Python bindings for GStreamer 1.0"
> +HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-python/"
> +SECTION = "multimedia"
> +LICENSE = "LGPLv2"
> +

this should be 2.1 most probably

> +DEPENDS = "gstreamer1.0 python3-pygobject"
> +RDEPENDS_${PN} += "gstreamer1.0 python3-pygobject"
> +
> +PNREAL = "gst-python"
> +
> +SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> +
> +S = "${WORKDIR}/${PNREAL}-${PV}"
> +
> +inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
> +
> +do_install_append() {
> +    # gstpythonplugin hardcodes the location of the libpython from the build
> +    # workspace and then fails at runtime. We can override it using
> +    # --with-libpython-dir=${libdir}, but it still fails because it looks for a
> +    # symlinked library ending in .so instead of the actually library with
> +    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
> +    # we want, it will break again if the library version ever changes. We need
> +    # to think about the best way of handling this and possibly consult
> +    # upstream.
> +    #
> +    # Note that this particular find line is taken from the Debian packaging for
> +    # gst-python1.0.
> +    find "${D}" \
> +        -name '*.pyc' -o \
> +        -name '*.pyo' -o \
> +        -name '*.la' -o \
> +        -name 'libgstpythonplugin*' \
> +        -delete
> +}
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
> new file mode 100644
> index 0000000000..1365f7c6dd
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.10.4.bb
> @@ -0,0 +1,7 @@
> +require gstreamer1.0-python.inc
> +
> +SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "adcdb74f713e28d0b22a0a1e4f831573"
> +SRC_URI[sha256sum] = "59508174b8bc86c05290aa9a7c5d480ac556a6f36306ddbc1d0eacf4f7868212"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

