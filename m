Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2A9C47073
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 20:06:04 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.23372.1704657958784599711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 12:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSzQpy9o;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd0c17e42bso11691351fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704657957; x=1705262757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mnICdkwBRRiln893ZRSgrHi96ETrq/yapjx2iNzTFIA=;
        b=XSzQpy9oW0RGmawfPBjvNZwZzEy3cLvIMiWWKKI1IMMqqTpHGEAL8W3mSj5xJ12lmG
         e4bj5tU1hIki6fOtMStO0JI3X5YWYG8AIw7RBZKSGKK6aWX1whkIFaAgM8FaZZ7zviML
         BuZw1+CyhrfFmtJOx/et0gYw2vG3l2LCwyTf9xy5+dKXwO126TUVNfBZrKshF2ld0AbV
         lqrTD1wjKgJfCB0gKHe8GHLIld9CxG83Ewn6PeTxrM4l22h2IJaefv9tliv0uhIhFZTm
         dz6o8QoAIYgStEcxd1G6BhKNrtDgQ+tfuNdds9oyvA4lORMep7+R5q3UqI2QfkwlwEmv
         gZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704657957; x=1705262757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mnICdkwBRRiln893ZRSgrHi96ETrq/yapjx2iNzTFIA=;
        b=DEfHo5ZPmxj1IcN/uXODbbPiNiUS8W8ZLDv2tIDktbmv1PW84tz5oKWF1g5DT/kzx7
         HE3X5p3ysbk38lIZmUgEZVp0c3HG5S6/ONdJ4DhNC2Yl4xo3J2vRPcN2qrfveh2JFaUb
         MfuMxKnPTVNi5j/3eyoyfoKTyDVN+bvvA+/RxHAuUAJK4efrK4gZevGjqUQpC8UxX1vb
         L2CQf6UQK+PfnPWQTsk+Tz+JCMqsUqGIsnJ45MP+WS0HchOsznJt28oVyNyvnVDGy6m0
         hyiyIWKy2hfziv85mRp8WdQqY4bjiv9oOON9BwHF9/95G/7HTHdm9iNw397kyGxJVy/5
         DDTw==
X-Gm-Message-State: AOJu0YwtSt96ASQBPFeiGgozKX5t8WM7VRHSSjcwxiXJvzZkZJQEZKYt
	DKqfu3DwQ6exCTHRUW5HQSaNMJeDb3RnOFlZoAs=
X-Google-Smtp-Source: AGHT+IFPUYwWNQDQ+Uc3hg2xQz6pR0j6GqTqszLCO+kQJf/UTAGSmc5dpq/l1YtWfVNybgnTyamx7zGEFDWdCGjPOn8=
X-Received: by 2002:ac2:5468:0:b0:50e:7693:7084 with SMTP id
 e8-20020ac25468000000b0050e76937084mr719660lfn.57.1704657956612; Sun, 07 Jan
 2024 12:05:56 -0800 (PST)
MIME-Version: 1.0
References: <20240105133543.3017997-1-alex@linutronix.de> <20240105133543.3017997-3-alex@linutronix.de>
 <20240107195418f0ae009a@mail.local>
In-Reply-To: <20240107195418f0ae009a@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 7 Jan 2024 21:05:45 +0100
Message-ID: <CANNYZj_6afrVd3n=pYkmpGRugmkW43a9qf39du-hdpg7AUPGrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] python3-cython: update 0.29.36 -> 3.0.7
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 20:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193391

2024-01-07 15:06:26,597 - oe-selftest - INFO - FAIL:
devtool.DevtoolAddTests.test_devtool_add_fetch_simple
(subunit.RemotedTestCase)
ERROR: Nothing PROVIDES 'pv'

2024-01-07 06:40:56,859 - oe-selftest - INFO - FAIL:
devtool.DevtoolAddTests.test_devtool_add_git_style1
(subunit.RemotedTestCase)
ERROR: Nothing PROVIDES 'mbedtls'

I'm totally puzzled. Why do you suspect cython?

Alex

On Sun, 7 Jan 2024 at 20:54, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I believe this causes those failures on fedora, oe-selftest passed on
> the other hosts:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6287/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6288/steps/14/logs/stdio
>
> Or maybe fedora38-ty-4 is the issue, I've started a build without the
> patch on this worker now.
>
>
> On 05/01/2024 14:35:43+0100, Alexander Kanavin wrote:
> > pep517 build backends require cython 3.x when
> > python is at 3.12, so we can't hold this update any
> > longer. There are only a few things in meta-oe
> > and meta that break anymore, and fixes for them
> > are provided at the same time as this patch.
> >
> > License-update: http -> https
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/recipes-devtools/python/python-cython.inc             | 7 +++++--
> >  .../{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} | 0
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.7.bb} (100%)
> >
> > diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
> > index 6aec6b012f1..bc1953c5045 100644
> > --- a/meta/recipes-devtools/python/python-cython.inc
> > +++ b/meta/recipes-devtools/python/python-cython.inc
> > @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
> >  and the messy, low-level world of C."
> >  SECTION = "devel/python"
> >  LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
> >  PYPI_PACKAGE = "Cython"
> >  BBCLASSEXTEND = "native nativesdk"
> >
> > -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
> > +SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
> >  UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
> >
> >  inherit pypi
> > @@ -39,4 +39,7 @@ do_install:append() {
> >       for PYTHSCRIPT in `grep -rIl '^#!.*python' ${D}`; do
> >               sed -i -e '1s|^#!.*|#!/usr/bin/env ${PYTHON_PN}|' $PYTHSCRIPT
> >       done
> > +
> > +        # remove build paths from generated sources
> > +        sed -i -e 's|${WORKDIR}||' ${S}/Cython/*.c ${S}/Cython/Compiler/*.c ${S}/Cython/Plex/*.c
> >  }
> > diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
> > rename to meta/recipes-devtools/python/python3-cython_3.0.7.bb
> > --
> > 2.39.2
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#193357): https://lists.openembedded.org/g/openembedded-core/message/193357
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

