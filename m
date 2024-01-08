Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E363C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 08:10:31 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.2351.1704701427599814207
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 00:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlnAFelH;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd56c2017bso5855881fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 00:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704701426; x=1705306226; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g01yAoo9pk6i2qE8p2iRv0w8BxvI9LAGgsu5juGc0IU=;
        b=ZlnAFelHDP/z66UXFlJAuM3DdMN8dVLh+Bwm4LVlpKk1k3bO1JzCx5z5z/TYInEX+S
         l/DnbbiOuGKSR4Lx/KZ8BHzuSJEQxHwMTp4uyUdmgKSVsVkCugLopIL0L4Bcxm7jtA00
         0Gk2TKn/y99e0ta+fThdwgZPorCVuVuSFo3uIwWYmclCvANIighjbMSDWVdl9yY9RLYz
         g/55Owvkb2QzEo5fQ9qPS7P8jkSLxtiauVtAC3pxMNYUb5G3gS/WIBAjnTmOgn06fCeY
         d1sTbsUzSGy/epSaHHinYNDAq2mSvTvCB91SFrGgo1h4IkDS6UFQZ0rKypHZ5IIddpWi
         zsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704701426; x=1705306226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g01yAoo9pk6i2qE8p2iRv0w8BxvI9LAGgsu5juGc0IU=;
        b=U1uyj4UlVBLRafoa55+eyVRDlK8rErHwk9T9Ng1oRE8S3ZNAzitZX9iEbDP2Omv7mc
         PYbg9sJ0+Z7gkl+CISJaKIWKG4+B4+H/wXRK5hDnLNzGR0jRYtP6rL+1GRzBxcV27FHD
         7CWubDC9Zfo2rR+dkEgzrSmH+E602+kHfNg9e9nbR6ADYpTITj/ensIllV/FzBqv4oFd
         qyBuyXG/EdCZ5Gu0a2b9laiC0h5oeKmWTVXf0A3PyhERUxDOS3HyMuh6YsJkvWpeGA7S
         IXgoeJDkALz/9Lvmr0PiETIoS2dvpAk2LDsdLr+qTHWVJjefdOS0vdOTV4AmyKdunGPl
         mqow==
X-Gm-Message-State: AOJu0YzApwbS31YNIp5Yes83dz6N+dLLeSWFzNoGMOksHIjXHjYQycWO
	kA+/ZU0gP5yIVmeJhSRP/0O/QkGtB9pAQ7DjRAk=
X-Google-Smtp-Source: AGHT+IHSHI37Ms6hre853VsIy12Y8SKMaaqmM6lhmkHx/P9duwpmqzybfmqil17rCDq9hx1ie2UyaY5GRJJGdTQa89k=
X-Received: by 2002:a05:651c:85:b0:2cc:9372:63bd with SMTP id
 5-20020a05651c008500b002cc937263bdmr1285345ljq.60.1704701425489; Mon, 08 Jan
 2024 00:10:25 -0800 (PST)
MIME-Version: 1.0
References: <20240105133543.3017997-1-alex@linutronix.de> <20240105133543.3017997-3-alex@linutronix.de>
 <17A828BF39EB0275.11644@lists.openembedded.org> <20240108073957f097fbdb@mail.local>
In-Reply-To: <20240108073957f097fbdb@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 8 Jan 2024 09:10:14 +0100
Message-ID: <CANNYZj_n98oA_9mxbQLQim6J398=zECm8h9E5pRAcvafZ537Hg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 08:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193396

I suspect this might have been a transient network issue. Both tests
fetch stuff from 3rd party servers.

Alex

On Mon, 8 Jan 2024 at 08:39, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 07/01/2024 20:54:18+0100, Alexandre Belloni via lists.openembedded.org wrote:
> > Hello,
> >
> > I believe this causes those failures on fedora, oe-selftest passed on
> > the other hosts:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6287/steps/14/logs/stdio
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6288/steps/14/logs/stdio
> >
> > Or maybe fedora38-ty-4 is the issue, I've started a build without the
> > patch on this worker now.
> >
>
> Amazingly, I can't reproduce anymore...
>
> >
> > On 05/01/2024 14:35:43+0100, Alexander Kanavin wrote:
> > > pep517 build backends require cython 3.x when
> > > python is at 3.12, so we can't hold this update any
> > > longer. There are only a few things in meta-oe
> > > and meta that break anymore, and fixes for them
> > > are provided at the same time as this patch.
> > >
> > > License-update: http -> https
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
> > >  .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
> > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> > > index 6aec6b012f1..bc1953c5045 100644
> > > --- a/meta/recipes-devtools/python/python-cython.inc
> > > +++ b/meta/recipes-devtools/python/python-cython.inc
> > > @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
> > >  and the messy, low-level world of C."
> > >  SECTION = "devel/python"
> > >  LICENSE = "Apache-2.0"
> > > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> > > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
> > >  PYPI_PACKAGE = "Cython"
> > >  BBCLASSEXTEND = "native nativesdk"
> > >
> > > -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> > > +SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
> > >  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
> > >
> > >  inherit pypi
> > > @@ -39,4 +39,7 @@ do_install:append() {
> > >     for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
> > >             sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
> > >     done
> > > +
> > > +        # remove build paths from generated sources
> > > +        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
> > >  }
> > > diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> > > rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > > --
> > > 2.39.2
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193390): https://lists.openembedded.org/g/openembedded-core/message/193390
> > Mute This Topic: https://lists.openembedded.org/mt/103542146/3617179
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

