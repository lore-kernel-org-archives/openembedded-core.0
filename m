Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.89.1608826457659982775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 08:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P/qdogK7;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id q22so3884922eja.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sGnpUK9A7juoHYzokFbqxyrJ2ArDKTSZwbjD4Cswwq0=;
        b=P/qdogK7n6rPTGtK13Eb6EnoqMzxQyaWzoeStCMEDZYtCzBsXsnKZuJV8pctzdq65o
         aF6Y0ujdiiJLEcI+Zf2IOdtMsAHGQ6Rpa7I974QhWwHwzK7oM/qLeKL3V9Erz00wIl2b
         soYuagUb3AlTyeeJYhz1w0bqkTsGg/aWYcAKkIMTdxi3YuPxGv0kwzM5iHVwBm/7gwQt
         elxUr0Boi9Jeer7UmPDnf+ean5jird+6dG/OW4fcVvP3Gh240Ba2GmZvh9ypstrYUemH
         US4GznEAYFczTWxEqZ2gvUiL4MHxtB71VX8/yVwKEkxiE2tJjMw6vImuxriG3iFtq0yX
         ssUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sGnpUK9A7juoHYzokFbqxyrJ2ArDKTSZwbjD4Cswwq0=;
        b=cDB/NFiv1j8D8K1Vu/mtUn6MeWxvM2Bz1WkzVaqVwJLKz+iRaJ3H5Ff24tOEXzvyMa
         6IA1N9fxIssqj1VguGjrnEgrVuCg5oAkB+3WozWaWDJIy+CImtiZzn/jEAbtleIbutNJ
         v8eQtFAiYnyo2U0vLGlbRBugrtZvsH/XSvNvnv9wDmJpvrbi8HJta151eh+IDuXVA6Qe
         KbYIKljJahAy3H25yEfotLqd59Odc4TU8XHx8JvfQiiwdi7dXxVtCkK0AdPqWXElJt+1
         iF+oYTj0Bej0BbCo0NiAlAyREyQ51iHVSKHdIKA4GabOZAFEPiznOs0c8jeyfOYSaIMd
         MDMw==
X-Gm-Message-State: AOAM533ilv8K5HdnGyfwujYETaCywpgZTs8n/LEDTA6UOqMekajAbLJG
	85akjvB6GtY8JkkaDcXQpkxVVgt1GlsnBoWBtHqHDA==
X-Google-Smtp-Source: ABdhPJzQSnGKmZ956Va/Ji1t+4xUHT26he7SzjE56w1lTWxxxWEVsdAqSu3LYFBaVnEf3TTRM7Q4j6epiEOF8msSF38=
X-Received: by 2002:a17:906:edc8:: with SMTP id sb8mr28768394ejb.247.1608826456109;
 Thu, 24 Dec 2020 08:14:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
 <dc87d7fa7cb4fb8870daf5277aa9b993e371f9d6.1608646697.git.bruce.ashfield@gmail.com>
 <CAOSpxdbZ766i_xyxwCAGwr3H8Zfahcjtrwoj-CsnLPWuDq=8RQ@mail.gmail.com> <CADkTA4Oh2VcELuN7v6-VEgiiQj60-Tphv9MjZBy5gTizodyNPQ@mail.gmail.com>
In-Reply-To: <CADkTA4Oh2VcELuN7v6-VEgiiQj60-Tphv9MjZBy5gTizodyNPQ@mail.gmail.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Thu, 24 Dec 2020 06:14:05 -1000
Message-ID: <CAOSpxdZmCeg8nG88wHG4UGBf2fn2PUJ6P-_qcseqqNT_v-HByg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/9] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 24, 2020 at 5:27 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Thu, Dec 24, 2020 at 9:48 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > On Tue, Dec 22, 2020 at 4:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Integrating the following configuration commit(s):
> > >
> > >     72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'
> >
> > What is the reason behind this change?  Trying to decide if it is
> > something I should take for dunfell (minus the 5.8 changes of course)
> >
>
> It fixes a warning that popped up due to my kern-tools changes (they
> were masking some warnings).
>
> So if you take my kern-tools SRCREV bumps, you'd need this (and the
> others I've been sending out for 5.4 kernel meta-data)
>
> Those tools bumps aren't necessary (they are bug fixes, but not bugs
> that would break anything), so I leave that up to you.

Thanks Bruce!  I'll pass on the tools bump for now.

Steve

> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
> > >  6 files changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > index d415c3c63a..8bc93bf438 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > @@ -12,7 +12,7 @@ python () {
> > >  }
> > >
> > >  SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
> > > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> > >
> > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > > index 033dfc76a2..f5f7c87a31 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > > @@ -12,7 +12,7 @@ python () {
> > >  }
> > >
> > >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> > >
> > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > index 33ca5856a3..3b462d5872 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > >
> > >  SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
> > >  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> > >
> > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > > index 50cee07620..4afddae092 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > > @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> > >
> > >  SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
> > >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> > >
> > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > index 1a14c8bdb5..456875a7b5 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > >  SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > >  SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
> > >  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> > >
> > >  # remap qemuarm to qemuarma15 for the 5.4 kernel
> > >  # KMACHINE_qemuarm ?= "qemuarma15"
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > > index af576891e2..3f94d22654 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > > @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > >  SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > >  SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
> > >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> > >
> > >  # remap qemuarm to qemuarma15 for the 5.8 kernel
> > >  # KMACHINE_qemuarm ?= "qemuarma15"
> > > --
> > > 2.19.1
> > >
> > >
> > > 
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
