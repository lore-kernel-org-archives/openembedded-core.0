Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web10.23594.1602874104001525261
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 11:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=B+weuiW1;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id w5so1499569qvn.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXdlGZb96CTi0A2dIlN2AcOuucsSXjTJAcruLKRTbOY=;
        b=B+weuiW1nXiNT//1fbyq+ENUAp85wmQaOurt3+Nb/M9RRz86h6+Su+AX0kVCJHStJe
         XbE0Wxd2kQPYLjg6ScMcNOtyY9mBMefqqQjPBJskw/vvBWdLg/3fCSW9abgccK9FY+VX
         Y+65v58jvrfVf3R+FKtGMzsmSQuwVGnOJnOKJ4ILgIWYZTOLZ7GzUH0JqZmzaZDjXEgo
         SeGtqBiev1mAH4u9LDbn11LQqneESHLkI4CqGG6pcDmy/2z7qPBqOE88xIt9TXvLLe1v
         NJB9OH1WOb5sLHsHCV6c/Z9pl7jVDpA0lKSE8iv4DjiZSqaSW1oZPlzsrU6TQIMVoz30
         CyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXdlGZb96CTi0A2dIlN2AcOuucsSXjTJAcruLKRTbOY=;
        b=Pc8uVi7mrXosz43imyMN1OnOKxguxGR3Edwa1XIGiUM0yItKn4rpYt/D79VEKk1mup
         eDGlnfq5NtqnJAvgYUhB4qLTRVuaMGoXuGm1iAtRGfk/bXOt2nrcsBHKToJZo7oCFc9M
         KURJMz6zpM8ccIjaZ5rqMLuOozUqJT7rf9ZW/8R/RP6Ae82twlLoa1rIwlzvv3t5oPFx
         I1T8ijxvKjgiU7F8bRAQtj6eB3EMn2splJMbKstes5lImNgZIPbX2yI109ozJyiLsklh
         rIErKRNsi44gdNLVTPIrjXYPiAiOuWGZtogfsMvq7D/1xoHv4FzUpjxM70kkMdE1sBta
         qWTQ==
X-Gm-Message-State: AOAM5314z9v97uDFWGfSK5NSSumulKcmvQrXZ/H4FZ4v1jnHC8c52LzM
	qrcDLy4OjvO+JuPctJagPem2QAeAnqeWCDUDB3o=
X-Google-Smtp-Source: ABdhPJyzITF7qirs0i+1eCkloAM/i1E5OQ8bZxjMpIffD0FBQopOVyV0w8z2eigtLk5iVZfh/JoOc8c0TSWt4HksqCQ=
X-Received: by 2002:a05:6214:16d0:: with SMTP id d16mr5603089qvz.38.1602874102894;
 Fri, 16 Oct 2020 11:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201016043341.635385-1-raj.khem@gmail.com> <c671f8ca6bdeb7d7475dbfea8ec440d103045395.camel@linuxfoundation.org>
In-Reply-To: <c671f8ca6bdeb7d7475dbfea8ec440d103045395.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 16 Oct 2020 11:47:56 -0700
Message-ID: <CAMKF1sotEEnaqk98JEDJtxg-TWP2Qa5isQtKLptE1cX+qA95Lw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] recipes: Use GPL-2.0-only instead of GPL-2.0 for LIC_FILES_CHKSUM
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Meh Mbeh Ida Delphine <idadelm@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 16, 2020 at 2:05 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Khem,
>
> This patch fixes issues introduced by a patch I tested in -next from
> Meh Mbeh Ida Delphine <idadelm@gmail.com> (cc'd). I have removed it
> from the queue as it failed testing. This patch may be useful so they
> can fix their patch though.
>
> Note the fixes Khem found for glibc-collateral and devicetree.bbclass
> in addition to the recipes.

Thanks, other layers also rely on these names. So perhaps this should
wait till master opens for next release
and address those layers too.

>
> Cheers,
>
> Richard
>
> On Thu, 2020-10-15 at 21:33 -0700, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Add devicetree.bbclass and glibc-collateral.inc
> >
> >  meta/classes/devicetree.bbclass                              | 2 +-
> >  meta/recipes-connectivity/connman/connman-conf.bb            | 2 +-
> >  meta/recipes-core/busybox/busybox-inittab_1.32.0.bb          | 2 +-
> >  meta/recipes-core/glibc/glibc-collateral.inc                 | 4 ++-
> > -
> >  meta/recipes-core/systemd/systemd-serialgetty.bb             | 2 +-
> >  meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb       | 2 +-
> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
> >  7 files changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/meta/classes/devicetree.bbclass
> > b/meta/classes/devicetree.bbclass
> > index c772ab2ab9..ece883accf 100644
> > --- a/meta/classes/devicetree.bbclass
> > +++ b/meta/classes/devicetree.bbclass
> > @@ -18,7 +18,7 @@ SECTION ?= "bsp"
> >  # device trees built with them are at least GPLv2 (and in some cases
> > dual
> >  # licensed). Default to GPLv2 if the recipe does not specify a
> > license.
> >  LICENSE ?= "GPLv2"
> > -LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-
> > 2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM ?= "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> > only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  INHIBIT_DEFAULT_DEPS = "1"
> >  DEPENDS += "dtc-native"
> > diff --git a/meta/recipes-connectivity/connman/connman-conf.bb
> > b/meta/recipes-connectivity/connman/connman-conf.bb
> > index 9a519ec866..85fee09258 100644
> > --- a/meta/recipes-connectivity/connman/connman-conf.bb
> > +++ b/meta/recipes-connectivity/connman/connman-conf.bb
> > @@ -2,7 +2,7 @@ SUMMARY = "Connman config to setup wired interface on
> > qemu machines"
> >  DESCRIPTION = "This is the ConnMan configuration to set up a Wired \
> >  network interface for a qemu machine."
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  inherit systemd
> >
> > diff --git a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > index 61fb8cbad1..2129acd8d3 100644
> > --- a/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > +++ b/meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> > @@ -1,6 +1,6 @@
> >  SUMMARY = "inittab configuration for BusyBox"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  SRC_URI = "file://inittab"
> >
> > diff --git a/meta/recipes-core/glibc/glibc-collateral.inc
> > b/meta/recipes-core/glibc/glibc-collateral.inc
> > index 52880791a7..4f81f07da7 100644
> > --- a/meta/recipes-core/glibc/glibc-collateral.inc
> > +++ b/meta/recipes-core/glibc/glibc-collateral.inc
> > @@ -1,7 +1,7 @@
> >  require glibc-common.inc
> >
> > -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-
> > 2.0;md5=801f80980d171dd6425610833a22dbe6 \
> > -                     file://${COMMON_LICENSE_DIR}/LGPL-
> > 2.1;md5=1a6d268fd218675ffea8be556788b780"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-
> > only;md5=801f80980d171dd6425610833a22dbe6 \
> > +                     file://${COMMON_LICENSE_DIR}/LGPL-2.1-
> > only;md5=1a6d268fd218675ffea8be556788b780"
> >
> >  deltask do_fetch
> >  deltask do_unpack
> > diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > index 0cc0dc8c79..9a63c9f0a8 100644
> > --- a/meta/recipes-core/systemd/systemd-serialgetty.bb
> > +++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
> > @@ -1,7 +1,7 @@
> >  SUMMARY = "Serial terminal support for systemd"
> >  HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
> >  LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  PR = "r5"
> >
> > diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > index 8781492d47..d95d1a63f5 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> > @@ -1,6 +1,6 @@
> >  SUMMARY = "Inittab configuration for SysVinit"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  PR = "r10"
> >
> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-
> > scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-
> > scripts_1.0.bb
> > index 1ab248fed5..8a02bc7f48 100644
> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> > @@ -1,6 +1,6 @@
> >  SUMMARY = "Build tools needed by external modules"
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> >
> >  inherit kernel-arch
> >  inherit pkgconfig
> > 
> >
>
