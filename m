Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id D08E06007A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 May 2019 15:42:08 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l203so9921782oia.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 May 2019 08:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qza2iARJpTGgWIKcNtNXOGu9ggiqH7Ax+nFBimA/Dpw=;
	b=QS6YiZiH36kN2j+5Si4oHMuewRCtYvum1aqyosJDGjw7YiQLis6dO1bxGfq0rQxIxl
	e9Edt3Rc8/4Zx7gw/ulNbst8wCbYTD3oaNdMVYveJY1YAeaLzilwantBF2/R2ayDN+Kk
	tckd+IgquoG+uq3aCnRnOEzGuW6+tzb4Q9SEjlRl5wIrzyhNaF5ekNXjGHX3lyXw9CfB
	1TQTaMOkYXA1PX/n3EASAkD8L/7MYQKUKDsQExJ3aQ2/AFvkmzAeH18Z6T4V7KlWK+dW
	IgRfDbmWOKko68gp9q/GBb1PPI8x9gsr7Ei195vB0uCuJg1Pv4yk905AOdgZ+8E7vlAQ
	w7Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qza2iARJpTGgWIKcNtNXOGu9ggiqH7Ax+nFBimA/Dpw=;
	b=CpPOILsKb5WCrsUDCtHGiyjiIFwsZOkm2HsUom4idcad51AJ+v/sKCO/8EWyUerTcW
	W2bxxnEDutPW2yeGf0IU88K1506/Y2i8RXNHIABQGlEwepHjsPKbaXlQKqO0+nNKJcHi
	4K6+RL2R9g6V267+oiPuXfXz7zutSIoNqJ7WkGVz6SoMOJBIBxnqYglIQa2PT/XHZrGw
	sVLiYXNVaGv9PpRn2Zxk3tIeYaNeVf0p33+wJWTtoglWfZcr7YkmfpzeKo+oNeH+4iQz
	EkixiowOWHjMAfq1RVP2p5mNAWsnTPHDdVI9hurCF2ZNZC3UOc5alpQfmimOJZzGzNSk
	hlaw==
X-Gm-Message-State: APjAAAU0aQRoDOc75dkb7uQemh4rs/LAUxev+R1S7B6POsWNTFnARpNQ
	ZbQGDqBXO0gTYIy80MUGJKt2lrb0XTLtg4MPD+A=
X-Google-Smtp-Source: APXvYqzfoR8P7Sk9w8a4F+OmxXkJLFqMgK2Mvh3rsHLc7QazqouS3UfgIzDClnSaZmWshYsqcdRGht5K7rCrEANPuqo=
X-Received: by 2002:a05:6808:18c:: with SMTP id
	w12mr1611386oic.88.1557157329820; 
	Mon, 06 May 2019 08:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190424051620.10065-1-open.source@oleksandr-kravchuk.com>
	<bdd177a6-9d65-ed60-cb2f-20fea4effbea@oleksandr-kravchuk.com>
In-Reply-To: <bdd177a6-9d65-ed60-cb2f-20fea4effbea@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 May 2019 17:41:58 +0200
Message-ID: <CANNYZj9gNDaNgzx=240=thj_QA6h0Wrs_qvwfSabun72-r-Pog@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ell: add recipe
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
X-List-Received-Date: Mon, 06 May 2019 15:42:09 -0000
Content-Type: text/plain; charset="UTF-8"

Please resend, patches do get lost sometimes.

Alex

On Mon, 6 May 2019 at 16:36, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Khem -
>
> Is it being hold for a specific reason or it was just lost? Thanks.
>
> On 24/04/2019 07:16, Oleksandr Kravchuk wrote:
> > ELL has originally been part of meta-openembedded, but newer versions
> > of some of the oe-core components depend on it, e.g. ofono.
> >
> > Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc |  1 +
> >  meta/recipes-core/ell/ell_0.19.bb        | 22 ++++++++++++++++++++++
> >  2 files changed, 23 insertions(+)
> >  create mode 100644 meta/recipes-core/ell/ell_0.19.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 41c2a95d53..c00e5b8c65 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -166,6 +166,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
> > +RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >  RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
> >  RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
> > diff --git a/meta/recipes-core/ell/ell_0.19.bb b/meta/recipes-core/ell/ell_0.19.bb
> > new file mode 100644
> > index 0000000000..8f635e673c
> > --- /dev/null
> > +++ b/meta/recipes-core/ell/ell_0.19.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY  = "Embedded Linux Library"
> > +DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
> > +low-level functionality for system daemons. It typically has no \
> > +dependencies other than the Linux kernel, C standard library, and \
> > +libdl (for dynamic linking). While ELL is designed to be efficient \
> > +and compact enough for use on embedded Linux platforms, it is not \
> > +limited to resource-constrained systems."
> > +SECTION = "libs"
> > +LICENSE  = "LGPLv2.1"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> > +
> > +DEPENDS = "dbus"
> > +
> > +inherit autotools pkgconfig
> > +
> > +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] = "4356397ca11d5f8ec7f1aaf1e91ffea4"
> > +SRC_URI[sha256sum] = "a5a4d45ca002dd91560fcd565e696f59e82631e69c927115dafc640f0b8d779c"
> > +
> > +do_configure_prepend () {
> > +    mkdir -p ${S}/build-aux
> > +}
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

