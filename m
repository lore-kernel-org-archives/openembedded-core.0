Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.256.1620237099179016480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 10:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Edf/351t;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id a22so1816260qkl.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 10:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmbbLaPap0KlYsz2IAQys7HP5GPpAI06DhHFSOPS6L0=;
        b=Edf/351tVcRcJFEGrPTQN+dyBQTAm9PbmnytbrukDjUQ1Uo/cFODS0Q8UPYpgZI11J
         wFEwVH4ykFHxWhIq2X37TP46fvSGO9vqW7E/TxG0X5Bj+f+Nqw3cHsjN91gSw+1EqQeI
         OtPHk1YZjGVDB++KwWokejuTPwmenyca5NQrYOaFnGXDAoEt4/vY93CGSKGFUz3yRzJ6
         b1cgo+CdPsbzkH+XO4mau+yrMbDTxVAk+R1u6A4v3kzP5DTsKJEtsWgHQhzqpjx5xzC6
         nMP4DZCkq4RqeiEvs0/4Gpl+w1P6PW1fiHBPj9wHs6eT7VEoWyPL51XhGMh188VbbTT8
         sTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmbbLaPap0KlYsz2IAQys7HP5GPpAI06DhHFSOPS6L0=;
        b=QIxoKgYelhEsV6mUjz9OvvHhvScFDtfQjASbDspu6yMLz6QDTtAuzdFoYbUj4xnuGI
         UEBgvh6+o3DDJ0pwjIml/r3p/Bd1/X7+MbqwqGmvWuXtL4mEseqDsFgUqlZ29QH7BrJq
         jpJWXEXCBVazZRQ2x7hor3HQyhh+h8juXYixxynVXxGLVLUdgW7Rb55llt3nlFnFYb2H
         QXuZu0+EovaSIm1ORKMnRJBygfId5/roXjIbthYU8JH1WI6TXnEZo/RQTsOrRBuZXmcU
         yroqfbyZZAdXtjAR2i2T2Ta4tRLy7lahCvv8JVuNQJsVroTYWVzSwZDkhLs56gv4I563
         myuA==
X-Gm-Message-State: AOAM532oskDdGsGQZB4hlCsjeJ1ZMygNmaq1bD2LNBPZG2NjU276ReQo
	lidroHmOrK6X8CUoPsSfHJad8Y65nvJ4DBpdN6c=
X-Google-Smtp-Source: ABdhPJxA+w/Tvg0eCb7yxJWaVAxKIqHTkViODsvbvdNwY3HZTwVfcqoXZU/r84C/XnCRT/71im+2ou6TgLImkGKobUs=
X-Received: by 2002:a37:270d:: with SMTP id n13mr28450342qkn.146.1620237098292;
 Wed, 05 May 2021 10:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-57-alex.kanavin@gmail.com> <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: <AM9PR09MB4642132C2006E4609CA966C7A8599@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 10:51:12 -0700
Message-ID: <CAMKF1sreCuyXW2wNh_1xaG+E_T=NFLuLq68vmFQegDJ1HTWiYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 57/61] python3: add markdown/smartypants/typogrify modules
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:39 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 05.05.21 17:18, Alexander Kanavin wrote:
> > This is needed to enable gi-docgen, a successor to gtk-doc
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >   meta/conf/distro/include/maintainers.inc           |  3 +++
> >   .../python/python3-markdown_3.3.3.bb               | 14 ++++++++++++++
> >   .../python/python3-smartypants_2.0.0.bb            | 12 ++++++++++++
> >   .../python/python3-typogrify_2.0.7.bb              | 14 ++++++++++++++
> >   4 files changed, 43 insertions(+)
> >   create mode 100644 meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> >   create mode 100644 meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> >   create mode 100644 meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> > index 140f7b490e..0c3e3628ba 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -608,6 +608,7 @@ RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfound
> >   RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
> >   RECIPE_MAINTAINER_pn-python3-magic = "Joshua Watt <JPEWhacker@gmail.com>"
> >   RECIPE_MAINTAINER_pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> > +RECIPE_MAINTAINER_pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> >   RECIPE_MAINTAINER_pn-python3-more-itertools = "Tim Orling <timothy.t.orling@linux.intel.com>"
> >   RECIPE_MAINTAINER_pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> > @@ -630,11 +631,13 @@ RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.
> >   RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >   RECIPE_MAINTAINER_pn-python3-setuptools-scm = "Tim Orling <timothy.t.orling@linux.intel.com>"
> >   RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@fujitsu.com>"
> > +RECIPE_MAINTAINER_pn-python3-smartypants = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >   RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Tim Orling <timothy.t.orling@linux.intel.com>"
> >   RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >   RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> >   RECIPE_MAINTAINER_pn-python3-toml = "Tim Orling <timothy.t.orling@linux.intel.com>"
> > +RECIPE_MAINTAINER_pn-python3-typogrify = "Alexander Kanavin <alex.kanavin@gmail.com>"
> >   RECIPE_MAINTAINER_pn-python3-wcwidth = "Tim Orling <timothy.t.orling@linux.intel.com>"
> >   RECIPE_MAINTAINER_pn-python3-zipp = "Tim Orling <timothy.t.orling@linux.intel.com>"
> >   RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
> > diff --git a/meta/recipes-devtools/python/python3-markdown_3.3.3.bb b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> > new file mode 100644
> > index 0000000000..c456f05541
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-markdown_3.3.3.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "A Python implementation of John Gruber's Markdown."
> > +HOMEPAGE = "https://python-markdown.github.io/"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=745aaad0c69c60039e638bff9ffc59ed"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE = "Markdown"
> > +SRC_URI[md5sum] = "034e3bccfde211d44b4a7a69cb290ba0"
> > +SRC_URI[sha256sum] = "5d9f2b5ca24bc4c7a390d22323ca4bad200368612b5aaa7796babf971d2b2f18"
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > +RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
> > diff --git a/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
> > new file mode 100644
> > index 0000000000..8acc971c35
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-smartypants_2.0.0.bb
>
> According to pypi this isn't the latest version, but 2.0.1 isn't
> available as sources - also this project is unmaintained and the repo
> isn't even available anymore - what's the process for these kind of recipes?
>

looking at the URL https://pythonhosted.org/smartypants/

 As of 2016-12-28, smartypants is looking for new maintainer to take
over, please contact project owner on Bitbucket.

yeah we should not add unmaintained new recipe additions for dead
packages to at least oe-core
if gi-docgen, is next-gen for gtk-doc then report it upstream that
they have such a dependency and whats their plan
because next-gen tells me that they might looking into future

> > @@ -0,0 +1,12 @@
> > +SUMMARY = "Translator of plain ASCII punctuation characters into 'smart' typographic punctuation HTML entities"
> > +HOMEPAGE = "https://pythonhosted.org/smartypants/"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=977036977591ac666c728921ecc54c4f"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE = "smartypants"
> > +SRC_URI[sha256sum] = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > diff --git a/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> > new file mode 100644
> > index 0000000000..3becb0dd8d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-typogrify_2.0.7.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "Filters to enhance web typography, including support for Django & Jinja templates"
> > +HOMEPAGE = "https://github.com/mintchaos/typogrify"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=12bc792d6f5415dbf421f3fd183c6dd2"
> > +
> > +inherit pypi setuptools3
> > +
> > +PYPI_PACKAGE = "typogrify"
> > +SRC_URI[sha256sum] = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"
> > +
> > +BBCLASSEXTEND = "native"
> > +
> > +RDEPENDS_${PN} += "${PYTHON_PN}-smartypants"
> > +
> >
> >
> >
> >
> >
>
> 
>
