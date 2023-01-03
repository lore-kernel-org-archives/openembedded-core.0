Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4665C3DA7D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 07:46:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.59042.1672731960939999742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 23:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VCvDLv4Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id e13so28447778ljn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i84j8BLfPy4j2hikMAoo7qQ+h/wLA+A4VwnkvGdpGDE=;
        b=VCvDLv4YqW0IqAxAOJjjMXV+l/Cpz8R4C2N6b1JkGssgcANAaxX7t/fdxp2CR38w4k
         W5tppOacFtaPDYSP65FzWDR5td+Y8f4t9O3/D/oTpytljSEZWXpVeBSzgabKV0SRJzBs
         I7cvhEr5mcI2LSdpESjOIE8I3S2noZ+lEhwnOI576RTe8+DE34UQmlZKxIgfUlGojX1j
         xuLq+TgcCnXo/HqZ1/PdLdFAkw6/fkPlkNsH6yJoUQQ/pV1DfzIZ80BJjwJb1ufaFOs+
         5fUIcGI/WYAhQ4vQfoxZNZLAUxn8GY7v97+gU8LdmXkDVa97oOf4Z4iDceO9fKslc47F
         Bq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i84j8BLfPy4j2hikMAoo7qQ+h/wLA+A4VwnkvGdpGDE=;
        b=zCdvAPc6C91UoX6mlVt5hMdVVPbnfwhbYDfqGvbo4xrilKCTFU/LwHXF4A56fXPSa2
         0y629/NKp7S9vCfssjptRr4szENeJF0fqoFskobM8S/jJaepbH3pN019Evc3Q/IXqd+d
         6tgplcWM7X9z8YOeAk2YO9LAFPFSGCaMBSAeDqPMFcmsyv7UowqsOiqm/QFJ8jbo6Kii
         Us3tl7ujL1SZwVEYokelk0iybEs1cmVV1yt9lKX//Q+ZZ4BUp46J0rxhY9W4d67UPq+a
         P+3f7e+2VKXR6w90Z1uzMb3sBAJFNnCoRVRKrOLdo30+zm7ElK8q3G4EllmsuBGEAYJJ
         vMeQ==
X-Gm-Message-State: AFqh2kpKRCHukb6gxF2n6DJvLVEQoiFNgRmH10p+Tx2GZnhbf/PDd2SH
	IEh0aRaUccnw2jCGJEW3TNNTGTq1kDTBXPZZQn4=
X-Google-Smtp-Source: AMrXdXu8Y1XZHmIRkKt9iW0cWtrNJC0sqMAn7VmrgBEDah/OyWw4Z7g7UgniGt4Dya4xEqjcqOqDo+xDHdDk0/Lu2X4=
X-Received: by 2002:a05:651c:3d0:b0:27f:fdab:5028 with SMTP id
 f16-20020a05651c03d000b0027ffdab5028mr128650ljp.453.1672731959060; Mon, 02
 Jan 2023 23:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20230102224744.287985-1-alex.kiernan@gmail.com>
 <20230102224744.287985-2-alex.kiernan@gmail.com> <d11d0390a0022a2659a6aa224b7b1d92e290fa7c.camel@linuxfoundation.org>
In-Reply-To: <d11d0390a0022a2659a6aa224b7b1d92e290fa7c.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 3 Jan 2023 07:45:47 +0000
Message-ID: <CAO5Uq5SecaZGmvKrYadZBmCkCT0d3GXOaWZ4QGT6kXYfyXjKhw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 2/2] default-distrovars: Include "c" in
 IMAGE_LINGUAS for glibc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 07:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175335

On Mon, Jan 2, 2023 at 11:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2023-01-02 at 22:47 +0000, Alex Kiernan wrote:
> > glibc 2.35 introduced C.UTF-8, we should include this by default.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  meta/conf/distro/include/default-distrovars.inc | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> > index abf48f79f08a..5324bd543d22 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -5,6 +5,8 @@ KERNEL_CONSOLE ?= "ttyS0"
> >  KEEPUIMAGE ??= "yes"
> >
> >  IMAGE_LINGUAS ?= "en-us en-gb"
> > +IMAGE_LINGUAS:libc-glibc ?= "c en-us en-gb"
> > +
> >  ENABLE_BINARY_LOCALE_GENERATION ?= "1"
> >  LOCALE_UTF8_ONLY ?= "0"
> >  LOCALE_UTF8_IS_DEFAULT ?= "1"
>
> I suspect this will catch people out since if someone does:
>
> IMAGE_LINGUAS = "xxx"
>
> then it won't work for glibc due to the override. I suspect what we
> need will be more like:
>
> DEFAULT_IMAGE_LINGUAS = "en-us en-gb"
> DEFAULT_IMAGE_LINGUAS:libc-glibc = "c en-us en-gb"
> IMAGE_LINGUAS ?= "${DEFAULT_IMAGE_LINGUAS}"
>
> ?

I was slightly surprised when it did appear to work,expecting the
override to win - but I guess that's possibly because I've set it in
local.conf and not an image recipe:

#
# $IMAGE_LINGUAS [4 operations]
#   set /home/alexk/poky/build/conf/local.conf:303
#     ""
#   set? /home/alexk/poky/meta/conf/distro/include/default-distrovars.inc:7
#     "en-us en-gb"
#   set /home/alexk/poky/meta/conf/documentation.conf:218
#     [doc] "Specifies the list of locales to install into the image
during the root filesystem construction process."
#   override[libc-glibc]:set?
/home/alexk/poky/meta/conf/distro/include/default-distrovars.inc:8
#     "c en-us en-gb"
# pre-expansion value:
#   ""
IMAGE_LINGUAS=""

But the DEFAULT_IMAGE_LINGUAS is much more obvious and for some reason
simply didn't occur when I wrote this! I'll send a v2.

-- 
Alex Kiernan

