Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49FCE7E349
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 02:06:33 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k24so549431qtq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=v56dAXSd2oWWNxAs0r/ENL97L6F145FZkTOQE+5314A=;
	b=jxoqb7EHbbpBBMlLN3dsexvRhSHpdaUG50d6jVPSsaZwS11Vt9nyRCQUYEsnPG8z2Z
	P3aIDez6R54Zla2iys8LYnkGoQHws+gBLn6bWEvZaQeag7gLOl/v+QSmvqU/RJfoREA6
	PosYy3mGec4Pcx0Wo1EXmI0s06xRAp2jc6vpU0aa+K9/ASV0GPP+n8hw5o0Rj95k341p
	HKr2ITACOTT53Gt7ORtSB+H76syYNXddFebWQ+W440/QpaFdFjD5bR1ouoCho1PAFviV
	PB3e/1XmTQ7OBasLF1DGyh0YOdyo5Ay9die4YOwwRc+t6qe+ZLt4/5NYZtsAIZ8jjagf
	H3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=v56dAXSd2oWWNxAs0r/ENL97L6F145FZkTOQE+5314A=;
	b=e/xIPVrvSxa/RiTuzG0JMkELIK1O628RK2GiRk8Y0dCpnR3IJx1wmpiavVWuTYRRfa
	9USj9g+m9DctapRr+9QnGfBebwZmzTWYfORRb8zuYHxpPBaWBHbDIIKNH16uYxMUbkPB
	81Kt1QD8MDQKoF/+hu0JVZJODZwhMMN54EPJTbX0MphW9hGoW4yiT2bcwqCfNR182fGH
	cIvDZW6j3S1tMQxmGKAjucWWtTR/gJsgeL9qpsK2ypIt7i2BBz3j1YJvgE8Dir1XDvLo
	PDQ9+s+JVezKn+seIfL+J4bMcXy0gmuK3tjlPFEgRiyoGtYpm8lBOkBbA0F/V0FAZ6Fw
	Bs1Q==
X-Gm-Message-State: APjAAAUSbVMTEN38Eup6UFYLf+IBz8JSgs7wNT8vGa792Yv5YRkpS3iM
	ga90xNIe442nJ7Jogl+ahyBp06vqXykaM0B9sYkH3KXG
X-Google-Smtp-Source: APXvYqzw0soa82wm4bphf3eKrq1+iNcJjzRthT3+UnMzbmM1Xr9T7EJDpgeifuWnOi8tQ2czDEY4ZQ49bCYNhej/6a8=
X-Received: by 2002:aed:3b0a:: with SMTP id p10mr49770347qte.194.1558490794015;
	Tue, 21 May 2019 19:06:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
	<20190521123641.16768-1-luca.boccassi@gmail.com>
In-Reply-To: <20190521123641.16768-1-luca.boccassi@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 May 2019 19:06:08 -0700
Message-ID: <CAMKF1so9O7VG2VrXRCu260FiZzeL5ywTbr1y9CeVpou6T1reAg@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] python*-setuptools: add separate packages for pkg_resources module
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
X-List-Received-Date: Wed, 22 May 2019 02:06:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 21, 2019 at 5:36 AM <luca.boccassi@gmail.com> wrote:
>
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> The pkg_resources Python module is useful by itself, for example for
> automatic loading of resources shipped in a Python package.
> Add separate packages for it, so that users can depend on them
> individually and avoid pulling in the entire setuptools, which
> include scripts to download other packages, which might not be
> desired on minimal images.
>
> Other distributions like Debian and Ubuntu already split setuptools
> and pkg-resources in this way.
>
> The setuptools packages now depend on the new pkg-resources packages,
> to avoid regressions for other packages that depend on them
> already.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: restrict new RDEPENDS to class-target. As advised by Alexander, bitbake
>     cannot resolve native rdeps that mention package names rather than
>     recipe names.
> v3: manually add RPROVIDES to the native class instead of restricting the
>     RDEPENDS to the target class as a better workaround. Also document why
>     the package is being split.
> v4: re-send to the correct thread, no changes.
>
>  meta/recipes-devtools/python/python-setuptools.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
> index 357aa07086..f49e078697 100644
> --- a/meta/recipes-devtools/python/python-setuptools.inc
> +++ b/meta/recipes-devtools/python/python-setuptools.inc
> @@ -37,3 +37,14 @@ do_install_prepend() {
>  }
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +# The pkg-resources module can be used by itself, without the package downloader
> +# and easy_install. Ship it in a separate package so that it can be used by
> +# minimal distributions.
> +PACKAGES =+ "${PYTHON_PN}-pkg-resources "
> +FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
> +# Due to the way OE-Core implemented native recipes, the native class cannot
> +# have a dependency on something that is not a recipe name. Work around that by
> +# manually setting RPROVIDES.
> +RDEPENDS_${PN}_append = " ${PYTHON_PN}-pkg-resources"
> +RPROVIDES_append_class-native = " ${PYTHON_PN}-pkg-resources-native"

do we need to handle nativesdk case ?

> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

