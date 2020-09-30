Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.4516.1601426303941406588
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 17:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=KTpaUAdL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.193, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f193.google.com with SMTP id e5so3871243ils.10
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1V+3zuo1e8G5+ogrBfsrtsr6rHzA46ePvILAaxOEAc=;
        b=KTpaUAdLDWWf9hxZofoP7Thmk3UX2oTJBfVrYQ+8ePUw6kZgSUePO/kbmIIGnblGsi
         16YWoCylVvjkPbibSWCD/CnQ/5ZlsxC8oBOJ6QCOSlemcV/IA6Wb2d3GdizQ4MVJ9Xqb
         VcDrUs3vkSyIZXc+KZCDZEyYC3r2Nci3sSDdEAEW2Fqc5AOs7zx6mHAIGd+8E4enElLE
         AtK9TX3k/AMZ3WVGenjdnb5l99/+5Tayvep5plSUaJYIIxb+i9CFK9IXxnsKCTb0JIHk
         TyZNrCBsB9dPEfY/KXTdd0aGiTEEsqYlRVsh0jT+vqVqIIiNQiUDbwGWdFGsoIB9+Yn5
         dOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1V+3zuo1e8G5+ogrBfsrtsr6rHzA46ePvILAaxOEAc=;
        b=bRj3nSV6USCtmY0QwKPiFIKDBQYdsHaTKpWNuvOZmSi8Gf5IFKHUaHB37lyoTDSU6q
         oMEQ8FpPFGHcQ2SbF2vJ4eh0z/33SDSgu9TKaISFLPN6sO1PnE2+XoQxdQbtUzyBENP0
         FiOdIl+Hg8rVUuVIuvWg3stqEvfvaRam7Ew/tIeI2CMPCRdY2AYOJpaQcSvj/4gdn5vt
         9GONsNvFvNgFGPFdw6DkguzRVeuoFJmQrAaqsoAMy9FdTQvlOGGVOmjCykPbKW1rVoIZ
         7D0SrddmyQzUsyY0/1rEccuhR2lUj2NCrcbrkgSj56ASBF1Cg4XAF6vqnSs2iWGwxV6l
         6iYA==
X-Gm-Message-State: AOAM533NCvjxewv7h0Fw30R0hFeGmB8OHQrerGPrkc5wHvknVyuhpBy7
	km9xWrAVDhKV20QyqD2aMnZmdUHovW0QUStJps2sPg==
X-Google-Smtp-Source: ABdhPJyS2wxuowJ1pviuctQU+dnNvzlVlbtLTcMVHuBFHr/fd2uACM1odQpUuLwRkyHAQi7NkN1UXxKcC8CMxFHWFBA=
X-Received: by 2002:a92:874a:: with SMTP id d10mr5346781ilm.163.1601426303032;
 Tue, 29 Sep 2020 17:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200928130551.21346-1-jon.mason@arm.com> <20200928130551.21346-7-jon.mason@arm.com>
 <CAMKF1spUKBY8ff3zphQ--H_9__jTKgs=hkHH7maMVJ4ZktjsHw@mail.gmail.com>
In-Reply-To: <CAMKF1spUKBY8ff3zphQ--H_9__jTKgs=hkHH7maMVJ4ZktjsHw@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Tue, 29 Sep 2020 20:38:10 -0400
Message-ID: <CAPoiz9w4iYci=mQPSEveAymTPDwLwspM22KQNH+wsLO0NC_7ew@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v4 6/6] tunes/armv8: move to a new location
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020 at 5:58 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Lets not do it. For couple of reasons,
>
> There are BSPs including these include files which are using same
> branch across multiple yocto releases, this will break them
> files under include/<ARCH> are common at arch level, this moved the
> CPU implementation ( cortex* ) under it, seems odd and even more odd
> when you consider arm32 tunes.

There are so many specific files and I'm about to add even more
(cortex-m).  I agree that it should be done uniformly, instead of
doing just the armv8 ones.  So, let's drop this patch (not the
series), and I'll address it after the gatesgarth release.

Thanks,
Jon


>
> On Mon, Sep 28, 2020 at 6:06 AM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > Move the ARMv8a tunes into a separate location (per generation).  This
> > should help reduce the number of tunes in the more generic location.
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc | 0
> >  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc | 0
> >  .../machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc     | 0
> >  .../include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc | 0
> >  .../include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc | 0
> >  .../machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc     | 0
> >  meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc   | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc   | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc   | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc   | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc       | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc   | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc       | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc   | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc       | 0
> >  .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc       | 0
> >  meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc   | 0
> >  meta/conf/machine/qemuarm64.conf                                | 2 +-
> >  21 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa65ae.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75-cortexa55.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa75.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76-cortexa55.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa76ae.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa77.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa34.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa35.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
> >  rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73.inc (100%)
> >
> > diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa55.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa65.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa65.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa65ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa65ae.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa75-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa75-cortexa55.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa75.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa75.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa76-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa76-cortexa55.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa76.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa76.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa76ae.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa76ae.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa77.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa77.inc
> > rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa32.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa34.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa34.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa35.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa53.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa57-cortexa53.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa57.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa72.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa73-cortexa35.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
> > diff --git a/meta/conf/machine/include/tune-cortexa73.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> > similarity index 100%
> > rename from meta/conf/machine/include/tune-cortexa73.inc
> > rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
> > diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> > index 2f61eb0aed5f..c4096d0eeea4 100644
> > --- a/meta/conf/machine/qemuarm64.conf
> > +++ b/meta/conf/machine/qemuarm64.conf
> > @@ -2,7 +2,7 @@
> >  #@NAME: QEMU ARMv8 machine
> >  #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
> >
> > -require conf/machine/include/tune-cortexa57.inc
> > +require conf/machine/include/arm/armv8a/tune-cortexa57.inc
> >  require conf/machine/include/qemu.inc
> >
> >  KERNEL_IMAGETYPE = "Image"
> > --
> > 2.20.1
> >
> >
> > 
> >
