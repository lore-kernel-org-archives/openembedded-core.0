Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 958C075534
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 17:18:34 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id m21-v6so217083uan.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lVqSMvt+E2+dNcJmqbdXyYYrOY8G7OSEYs2vH1uGtuw=;
	b=e2DL31LtevyledYM+hOmtnMiug+G8xxFo4QvkPmYz43EWrfjwaIE4A8Cj6VckhuyPS
	qgxbQ0WocNuhNL2+CwnsvXO6tIgOy2t+YGwNzGXTiTyudjpuEE481VXFp+iNU4hBFR8j
	4ulMeQGcx4WmUgev8estwzPKBlrhfhAYHbvyUMWun2kzFotg2XCA2Qp30pE2JaQvv3bd
	wr84VHhzCFl3bnJhtTO+dts9SZrPJ64UuiA1Wzlrf2ED8hmyVx9AwHD30Fr5RI+lKdLn
	6M/G02ykmMgNkVPt4il+eBYyf74B+WpmZY2rRn8v8/9zJRBkXK44sh8mW1xbgpw+gIse
	SFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lVqSMvt+E2+dNcJmqbdXyYYrOY8G7OSEYs2vH1uGtuw=;
	b=HVTTulSdKL/yUAvqRose1EPK7a8HLP+3eqFtlFqWpGRJu+FfzE7uIeJrbt2yloobtk
	vaUByJWd/mOXq52vlSbz/hOGalFL4YE6PwLmAUEAxyWv5tNRMLx6NlVhyHsgu/6fs6tB
	7HM9kxPQUUmS7sZxt35MXpL7ttx6k5x5OG9SoQB0AM3QJ433aji6ZogVUPDlhKC+1OxA
	oKMaIXqxEVu1+cbNTYZ4Xso8lvcR1MZ4ISZA1sZtXAsnM24r5/y8aOnn5HAulBO1JxWl
	9EhGz0zQcHWpliBZcyV3q8Wx34nP8xePUFEnAcXOi0mlT1Nf2ETrg1BiUXznRkcI7pgA
	Triw==
X-Gm-Message-State: APt69E3kZF5KzAUtNZXY45ksVPxQnmzFFoS6THhBWRJb3zOLeXKlbUdD
	kXVuwmcYsT9SyN39Zrh8lMVFs8j7+QfPIdhxeds=
X-Google-Smtp-Source: ADUXVKKAIzYLKIsdlWgAze4fZF+is6ncJS2HwzLAFySR64jfCqrJwbC0YUaVVOTutj+uR0alJa2vvz6xti9SgZsjAAk=
X-Received: by 2002:ab0:50f0:: with SMTP id
	d45-v6mr13950667uaa.45.1529515110592; 
	Wed, 20 Jun 2018 10:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <1529503642-7158-1-git-send-email-maxin.john@intel.com>
	<1529503642-7158-5-git-send-email-maxin.john@intel.com>
In-Reply-To: <1529503642-7158-5-git-send-email-maxin.john@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2018 10:18:04 -0700
Message-ID: <CAMKF1spbWUXYQ-Gz1z-sbm+f_QYz_FPHh0bR=uqmVbfUTcSULA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] harfbuzz: upgrade 1.7.5 -> 1.8.1
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
X-List-Received-Date: Wed, 20 Jun 2018 17:18:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 20, 2018 at 7:07 AM Maxin B. John <maxin.john@intel.com> wrote:
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb}             | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.1.bb} (82%)
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> similarity index 82%
> rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> index 0a9b029..f8b0056 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.1.bb
> @@ -12,8 +12,8 @@ DEPENDS = "glib-2.0 cairo fontconfig freetype"
>
>  SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
>
> -SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
> -SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
> +SRC_URI[md5sum] = "97cb89c6e2a914c05c8b7e858703885f"
> +SRC_URI[sha256sum] = "fbed6392ddb085e45e6090a9f389f72926d0e355f4b0a2ef51d35cf21686df45"
>
>  inherit autotools pkgconfig lib_package gtk-doc
>
> @@ -27,6 +27,10 @@ EXTRA_OECONF = " \
>      --with-glib \
>      --without-graphite2 \
>  "
> +do_install_append() {
> +    # Remove unnecessary cmake files
> +    rm -rf ${D}${libdir}/cmake
> +}

perhaps they should go into -dev package instead.

>
>  PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
>
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

