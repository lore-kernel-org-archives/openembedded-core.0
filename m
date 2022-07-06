Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6800C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 14:15:33 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.6709.1657116930796032767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:15:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dMRvT1/X;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id f14so3444916lfl.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewtaArRyxFel7jQeNzbxX/XtYFldNYha55BuvNjKzkA=;
        b=dMRvT1/X9l6HFKThr2acbwGHGdI+AA0BpR8e6xhrr5/+mu2gwfOOs2tiEen6fsUTVd
         6g9PU3t/53co+mLfUcsQJmcjNOZDh/2EA8U+9YLZsSyQyaaA2iN3ddvv9KD25CLiZ2JU
         d0zdz1ST6UwFEzcPK5WrMWADztNFrU93gtuCMJ5cQ75JUyP2ORiOWtWklp1/LXDqUIVe
         9l3e0m2NBYj3aSx+nuo7JbKwQwUKL00loJfKFh94e68kWn+A+oDxdiSdtETFznTddAnP
         6T7ctkIHTU7LjRZGC8Z3aOfB/J6qaTgZNvaaz2+Rskg5YqxESri3IZ3SN1oK1/vuPiMr
         EcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewtaArRyxFel7jQeNzbxX/XtYFldNYha55BuvNjKzkA=;
        b=8Ik1baNTS/9kPkscIMPZNBr61MKGA/Iies60uad636rSxfp4tC+YlgL44of1TMAy7S
         l9XrIOVHVvt8oMZViwWG82m8FOZuF0VUc+YRfWT1agxEoUUm5pab6Eq3PbX01V6jlpHb
         Mxtz+fWwxLWSaSRC7XySqPe1VagnGTZLa7zdirbLZgvRlnDJoXwe+5hOLa6QeEE8aXxJ
         TCQs8fBG1BeiH/vl+g/H0KkxU2vYkeaJVsvDrhzE0USN9660/SXffjFONV1qr1w9bAMU
         CibE/J8ZIhoOx8BmYO0NQAqDJFFAwF0qvH8vJqSBKOIKpWHZwbvY/NaltnO9pHHQsSBh
         RfPQ==
X-Gm-Message-State: AJIora8lI1KBx0jGPLgSlJdVbZ8onbFIAopYvpWpExQKsAKblO3p/3JZ
	w/oMkq/mQZcjPqGX9U+ENQZ/moKtSy4fvYXOIgg=
X-Google-Smtp-Source: 
 AGRyM1sofLwuFSmTBdBXFP7OEDSvYdiTv+UJStFTyzwCY/Z+ozbGDUly1Vdc4AFt1RS5i/K4OC2yYW09YwFf+m/ggik=
X-Received: by 2002:ac2:5597:0:b0:47f:8d1d:c63d with SMTP id
 v23-20020ac25597000000b0047f8d1dc63dmr25604062lfg.521.1657116928844; Wed, 06
 Jul 2022 07:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220705170339.771017-1-alex@linutronix.de>
 <20220705170339.771017-4-alex@linutronix.de>
 <YsWMiEtNqsWb60Q8@mail.local>
In-Reply-To: <YsWMiEtNqsWb60Q8@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Jul 2022 16:15:17 +0200
Message-ID: 
 <CANNYZj_oWuLGYWDSsP2JAgvBNDFX=DKo1Xsewm30rrHmA64BvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] wayland: update 1.20.0 -> 1.21.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 14:15:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167729

Yes, the fix to meta-mingw was already sent, and is already in master-next.

Alex

On Wed, 6 Jul 2022 at 15:22, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello Alex,
>
> I guess you have seen it in your build but this is probably the cause of
> the meta-mingw failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5467/steps/12/logs/stdio
>
> On 05/07/2022 19:03:36+0200, Alexander Kanavin wrote:
> > Drop the patch, as it is no longer necessary
> > (genereated .pc defines everything as relative to the .pc path).
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...hardcode-the-path-to-wayland-scanner.patch | 27 -------------------
> >  .../{wayland_1.20.0.bb => wayland_1.21.0.bb}  |  5 ++--
> >  2 files changed, 2 insertions(+), 30 deletions(-)
> >  delete mode 100644 meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> >  rename meta/recipes-graphics/wayland/{wayland_1.20.0.bb => wayland_1.21.0.bb} (90%)
> >
> > diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> > deleted file mode 100644
> > index e3e71925b8..0000000000
> > --- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
> > +++ /dev/null
> > @@ -1,27 +0,0 @@
> > -From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Mon, 17 Feb 2020 21:46:18 +0100
> > -Subject: [PATCH] Do not hardcode the path to wayland-scanner
> > -
> > -This results in host contamination during builds.
> > -
> > -Upstream-Status: Inappropriate [oe-core specific]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > -
> > ----
> > - src/meson.build | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/src/meson.build b/src/meson.build
> > -index 15730a3..61edbc8 100644
> > ---- a/src/meson.build
> > -+++ b/src/meson.build
> > -@@ -52,7 +52,7 @@ if get_option('scanner')
> > -                     'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
> > -                     'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
> > -                     'bindir=' + join_paths('${prefix}', get_option('bindir')),
> > --                    'wayland_scanner=${bindir}/wayland-scanner'
> > -+                    'wayland_scanner=wayland-scanner'
> > -             ],
> > -             filebase: 'wayland-scanner'
> > -     )
> > diff --git a/meta/recipes-graphics/wayland/wayland_1.20.0.bb b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
> > similarity index 90%
> > rename from meta/recipes-graphics/wayland/wayland_1.20.0.bb
> > rename to meta/recipes-graphics/wayland/wayland_1.21.0.bb
> > index dd48a29dc4..ce59e601d2 100644
> > --- a/meta/recipes-graphics/wayland/wayland_1.20.0.bb
> > +++ b/meta/recipes-graphics/wayland/wayland_1.21.0.bb
> > @@ -12,12 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
> >
> >  DEPENDS = "expat libffi wayland-native"
> >
> > -SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> > +SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
> >             file://run-ptest \
> > -           file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
> >             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
> >             "
> > -SRC_URI[sha256sum] = "b8a034154c7059772e0fdbd27dbfcda6c732df29cae56a82274f6ec5d7cd8725"
> > +SRC_URI[sha256sum] = "6dc64d7fc16837a693a51cfdb2e568db538bfdc9f457d4656285bb9594ef11ac"
> >
> >  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
> >  UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> > --
> > 2.30.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#167672): https://lists.openembedded.org/g/openembedded-core/message/167672
> > Mute This Topic: https://lists.openembedded.org/mt/92189298/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

