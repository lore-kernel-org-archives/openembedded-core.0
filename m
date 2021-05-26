Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.8167.1622038766720960929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 07:19:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NUNVSDJI;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 76so1079200qkn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 07:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OFKxCOkA7pQ1HZ0OqxexCjZsCdbCgWgIinAZL/9ACLc=;
        b=NUNVSDJI5jrS4g+nJRtlGf+jQ9wjbuPXXZ22Pin8GN93uMnE2KbeiiGLF1kAcjkwA0
         mzYVfXOFh2Hk41nwc0nBhGbPyMkW5GZm4yIANhcD5SD9bMK9oKj1tFx6lLY1xwIaKqU6
         Z1BxkNt53MwAoht9fNQqZDJk5xhgkTVXVLjri70Jl+b4ZoCjbFlmxBdmoU3/M/cLkNI0
         3HFEDvJ/wqh7t3k8JFkIA4Q4hFaRiJ7i3atMOqmlbLRGIOIieMBN6IMId/DbiT/OhAco
         UULawY1534aXX9I1n+otuWGfEMf4L1Ox8BLgRHeASAmzUjW5NJbk3nL5lgpT/VEZBPjq
         AsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OFKxCOkA7pQ1HZ0OqxexCjZsCdbCgWgIinAZL/9ACLc=;
        b=doH/O6cLXa7yrPpqHw9zNM+mTKgjEqdLqWsKtKa6jueBeCUR829ET/CG+9sUmJL5xu
         kPCRBSIRVpSsiqJ0Eqfmvr3UM3bVEXt3BNXBpfId79PBMOlSMq6NLATbPqF65OUVu+gp
         2O6lAwWlDCuk1h4SHQhiqKSpuXfEBsawSSwKAtfk9SUUPH3D5XEsAELb+YfYwzhziKm/
         RNhORRVtHA0uG/68HTAo/YztGqDdSd0bGpmuB5YCf7HRqXA/lTNYWpQqGRfi1YzVgN5V
         ArEquDI4zmoX41zQ4+93RFyZBMNU7wGAAOGHfUe8Lvy1wrz+Nxq8jUAZdkkfU67FhR9v
         LiHQ==
X-Gm-Message-State: AOAM530yAmWVIMm8p8ab4HAP0ymLBxK2/aKBtXIly3bUbf3nU7y0WLwL
	Dtd3LEOWAB8Fmr/ZPw6+n0qLNLTigdneOLmWSKc=
X-Google-Smtp-Source: ABdhPJylw8Y2YRaxFKudTB8PKlyrdgjYEO7vrNpMEP1WKrkPfzlp+iFzoXZU1/Y3e4iop5ZLs1IpJ7eRYZpYxTur+g4=
X-Received: by 2002:a37:ef06:: with SMTP id j6mr43916611qkk.25.1622038765686;
 Wed, 26 May 2021 07:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152106.4160032-1-raj.khem@gmail.com> <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
In-Reply-To: <CAAnfSTvgOiJ5hvG41fTqW3XD73bBB5nJOG7FaySPzspcGOj1bg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 May 2021 07:18:59 -0700
Message-ID: <CAMKF1soOUcqa6huRjbn5QgP0hkBaFafS2PkgWHbVazW4R0NRnQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc: Update to latest on release/gcc-11 branch
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 3:55 AM Ross Burton <ross@burtonini.com> wrote:
>
> I think this breaks non-Linux builds.  All of our Zephyr targets now fail:
>
> ERROR: gcc-runtime-11.1.0-r0 do_package:
> QA Issue: gcc-runtime: Files/directories were installed but not
> shipped in any package:
> /usr/lib/-gdb.py

this should have had some prefix. do you have this script around if so
then share

>
> Ross
>
> Ross
>
> On Mon, 24 May 2021 at 16:21, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > There has been 150+ fixes made available after gcc 11.1.0
> > was released, details of these fixes is here
> >
> > https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff_plain;hp=releases/gcc-11.1.0;h=9ee61d2b51d
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Use download mirror to fetch the patch
> >
> >  meta/recipes-devtools/gcc/gcc-11.1.inc | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-11.1.inc b/meta/recipes-devtools/gcc/gcc-11.1.inc
> > index 713002266a..aa7ac9be59 100644
> > --- a/meta/recipes-devtools/gcc/gcc-11.1.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-11.1.inc
> > @@ -6,7 +6,7 @@ PV = "11.1.0"
> >
> >  # BINV should be incremented to a revision after a minor gcc release
> >
> > -BINV = "11.1.0"
> > +BINV = "11.1.1"
> >
> >  FILESEXTRAPATHS =. "${FILE_DIRNAME}/gcc:${FILE_DIRNAME}/gcc/backport:"
> >
> > @@ -25,7 +25,10 @@ LIC_FILES_CHKSUM = "\
> >
> >  #RELEASE ?= "5b2ac9b40c325e9209c0bd55955db84aad4a0cc5"
> >  #BASEURI ?= "https://github.com/gcc-mirror/gcc/archive/${RELEASE}.zip;downloadfilename=gcc-${PV}-${RELEASE}.zip"
> > -BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz"
> > +
> > +BASEURI ?= "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.xz \
> > +            http://downloads.yoctoproject.org/mirror/sources/gcc-11.1.0-9ee61d2b51df012c659359873637cc2162ecccf3.patch;apply=yes;name=backports \
> > +           "
> >  SRC_URI = "\
> >             ${BASEURI} \
> >             file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
> > @@ -67,6 +70,7 @@ SRC_URI = "\
> >             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
> >  "
> >  SRC_URI[sha256sum] = "4c4a6fb8a8396059241c2e674b85b351c26a5d678274007f076957afa1cc9ddf"
> > +SRC_URI[backports.sha256sum] = "69274bebd6c069a13443d4af61070e854740a639ec4d66eedf3e80070363587b"
> >
> >  S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
> >
> > --
> > 2.31.1
> >
> >
> > 
> >
