Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web12.18.1592433088804221230
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 15:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ePBgoPAZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id t6so2967964otk.9
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 15:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tOwEYfMM0M0dO+nGJ0bMmdd8MTNHxmPvI5WpUicQKUg=;
        b=ePBgoPAZgf+ZbUe8cnD42r/gWTeA0wtv1BZAQFsPjafvEioGtQ0/wkLnOW38VDcqAf
         bCz4l85/d2bqEAonDgAIBGmv2Wr5EodnxZz7m/u+nt1fR9TRSf9Wubei3K1ZxWeyOjyP
         3XfwshYJ5fAxzfx5aTEvqM7GeWZv8/4Vgv408P/OUPyFCVIAYafapjopgGkIohrLS+Zo
         rMsruhmBcS5hZexlY4majtMfNZ6514FWq9COVSOhSlR4i47bmF0ShcLk/de/iIl+eTMp
         gT3sSH1fym9i44O/tweyjCqbkAikJPeW83zRS9miiek703ttAxBrEGIEXr7Y8X7zcX0o
         gmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tOwEYfMM0M0dO+nGJ0bMmdd8MTNHxmPvI5WpUicQKUg=;
        b=kmgXkbC7ltsIe+2pPVlK/AUgOmKF0UOZoPmt2vb/CT/Myq0hAI53B/AzQlbmELtfF7
         qtdFk5Gos9gZrOuQi3BvwFDWLwnkRf5mzETTRU1Z9f2Z2khFUpPjTso6QlBcu2zJvyCQ
         zXU5XodGUGTULjKec/kYkRa1aGQ0bcy+aGESEZwf9tpiRdq0mNB0LQ2T70WJZR5PrRzc
         qGzFUjNvpyEb9Y94osM7LT8HrECgsHwenuOTWdF17bivfIg++62tk46a2sHRBWcinvsM
         +cMdsSh3qVMSYC6kGxAw7o4IQrkM01aiK6VNKEe0zdd5Q2DHYB4KKbmWLVhsNNeyV+GK
         GwXA==
X-Gm-Message-State: AOAM533CewELjhRKLm36/FFg9SXqHQ1p/TBibvc7/7nUbyWLEEkbMbz8
	+Kod0/xLJUKwypcgqsI6T+CNy5VZcrhFuq20WeY=
X-Google-Smtp-Source: ABdhPJysiozBJMQkKPp+9Iv7f7jvwLuvlQaJOsoYdOWD4kInHuAseU+N1FmOhHIoyhpzewNnkwsIczpUGG3ZwhxJ4Yc=
X-Received: by 2002:a05:6830:1441:: with SMTP id w1mr1015611otp.372.1592433088144;
 Wed, 17 Jun 2020 15:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190413144853.3765-1-jacob.kroon@gmail.com> <CACMJ4GaTed_mZsxhP2A_60AN1pmg-OfJDk=Zf-hTqZoC4YorjQ@mail.gmail.com>
 <7f904c18-4aa0-a671-557b-bc9136ed3a94@gmail.com> <6cbda490-30ea-aab9-7657-b1fe809324dd@gmail.com>
 <49b05d0672f3fa4b90d1a11df522b1a47f48c5ec.camel@linuxfoundation.org>
In-Reply-To: <49b05d0672f3fa4b90d1a11df522b1a47f48c5ec.camel@linuxfoundation.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 17 Jun 2020 15:31:16 -0700
Message-ID: <CACMJ4GbMeTkouh2vfi6Q76noDGeQYK257xaVp6hS0M1iC1rnbw@mail.gmail.com>
Subject: Re: grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools?
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 17, 2020 at 5:35 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-06-17 at 11:15 +0200, Jacob Kroon wrote:
> > On 6/17/20 8:07 AM, Jacob Kroon wrote:
> > > On 6/17/20 4:28 AM, Christopher Clark wrote:
> > > > was: Re: [OE-core] [PATCH] grub-efi-native: Install grub-editenv
> > > >
> > > > On Sat, Apr 13, 2019 at 7:49 AM Jacob Kroon <
> > > > jacob.kroon@gmail.com>
> > > > wrote:
> > > > > Having a native version of grub-editenv around can be useful
> > > > > for
> > > > > setting the targets grub environment.
> > > >
> > > > Would it be acceptable to replace the tools being packaged in
> > > > grub-efi-native with a RDEPENDS from grub-efi-native to grub-
> > > > native,
> > > > and so use the grub-mkimage and grub-editenv tools from the grub
> > > > recipe instead?
> > > >
> > > > The problem I'm encountering with the current dual packaging of
> > > > grub-mkimage and grub-editenv tools, in both grub and grub-efi
> > > > recipes, is that it prevents grub-native and grub-efi-native from
> > > > being installed concurrently, and breaks my image build:
> > > >
> > > > ERROR: xen-image-minimal-1.0-r0 do_image_wic: The file
> > > > /usr/bin/grub-mkimage is installed by both grub-efi-native and
> > > > grub-native, aborting
> > > >
> > > > There's a wic script here:
> > > > openembedded-core/scripts/lib/wic/plugins/source/bootimg-
> > > > biosplusefi.py
> > > > that may also be affected since it creates a boot partition with
> > > > both
> > > > legacy and EFI content.
> > > >
> > > > The patch below resolves the error that I encountered. Does this
> > > > change look OK?
> > > >
> > > > Christopher
> > > >
> > > >
> > > > diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > > b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > > index b9d6225d27..5dd3398540 100644
> > > > --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > > +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
> > > > @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
> > > >
> > > >   DEPENDS_append_class-target = " grub-efi-native"
> > > >   RDEPENDS_${PN}_class-target = "grub-common virtual/grub-
> > > > bootconf"
> > > > +RDEPENDS_${PN}_class-native = "grub-native"
> > > >
> > > >   SRC_URI += " \
> > > >              file://cfg \
> > > > @@ -61,9 +62,7 @@ do_install_append_class-target() {
> > > >   }
> > > >
> > > >   do_install_class-native() {
> > > > -       install -d ${D}${bindir}
> > > > -       install -m 755 grub-mkimage ${D}${bindir}
> > > > -       install -m 755 grub-editenv ${D}${bindir}
> > > > +        :
> > > >   }
> > > >
> > > >   do_install_class-target() {
> > > >
> > >
> > > This change looks good to me. I added 'grub-editenv' before
> > > realizing
> > > that the tools were duplicated in 'grub', and I believe they are
> > > interchangeable.
> > >
> >
> > .. but this make grub-efi-native's sysroot empty in my build. Which
> > then
> > begs the question whether a native version of grub-efi is necessary
> > at all ?

That is a fair question. I don't know of a reason for it to remain,
other than perhaps to ease transition to use of grub-native instead?

> If someone can confirm these tools are the same and have no difference
> in functionality, then yes, grub-native and grub-efi-native should be
> merged.

The two binaries currently installed in grub-efi-native are:
- grub-editenv
- grub-mkimage

In my local build: The grub-editenv binary is identical when built
with either grub-native or grub-efi-native recipe.
The grub-mkimage binary produced is almost identical (compared via
objdump) and the differences appear to be due to the slightly
different filesystem paths that are recorded via the GRUB_PKGLIBDIR
argument that is passed into compilation. Running 'strings
grub-mkimage | grep recipe-sysroot' shows four filesystem paths that
refer to the native build directory, and these paths differ slightly
between the two recipe builds.

Based on that, I believe that these tools are the same and have no
difference in functionality; so it looks OK to retire the
grub-efi-native versions in favour of grub-native.

Christopher
