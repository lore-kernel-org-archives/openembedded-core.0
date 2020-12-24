Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.12093.1608823629585909713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Dec 2020 07:27:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RU9zRwHq;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id w1so3663043ejf.11
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Dec 2020 07:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=noxKdb0Tq4gVdO5NiJ3446kpiThUid4431xBlCrIGys=;
        b=RU9zRwHqnv9NDNoP4fjbmWONxl97HbpQN1GzHU3MXQdQAabKt7MtXRJXvf5LijzUFW
         m1th6UrTLza/2HcdeUVGfoYQdK4X7yc/Iu+6NugHjSsjWkjd2g9IUmcxTF/QnOgMr+3P
         j290cfyMajGv3Jrv/gNUl/gNOQCwej9FPuGMMoGLouelsjjHGYf1VNACizKS46daz2WC
         CVc6RmUNhYnyWeWW6vK3OndUJXths2YA3JoCyR83Wb5WzqF3M4Y/y6bRt8yl/tMDr8sV
         lZasPZkisQItSfIaWIsF3Gw0O6PkpOPUxb1TTmXE1oBAygROn5TCNAsvCoTJq5Y5vTAw
         ClsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=noxKdb0Tq4gVdO5NiJ3446kpiThUid4431xBlCrIGys=;
        b=nwZ6LaB8WHVBR6gfhoFNssG7dNBTjCiSYk5/wW1QZKmARBjtrqxTHtr4fdEXSx+vLA
         4P3EZryHs/qquEpGWCROKOSLBcstdTefjcJwFa1Wlb97vcACkqffqSorGiH/8ovqa/r9
         CV0naInGHJUc38U6MhkeOEPt+Nzo28JmgD+tTGLtgdToA2F0W0qACJ8Xvw5Q+bMoy1XE
         KGUEo+2DpdiiuO+L03YIGqwtuQ/aYu5dbRASFkg3coY/kOSs5TH626O7gGB5dGYTav4B
         Xm63XVtsZQT2ZPJyfMKX49QsPgZBrt684CCkV/+ZYejk3GA49F240MEQ1A3VzaOGUWO+
         tG0A==
X-Gm-Message-State: AOAM531dniThhyDqEcasEK7XEW+JLZUArDm2LQa7egDX/xwE4/+iaiyX
	mhOorCnL75b0zHBfOycETFwINDgEvl+h29bOQR4=
X-Google-Smtp-Source: ABdhPJxTvm95TFb+uXeozvZaDzRwT2urOasXiR2v3LBpAA8zJtk/wGz0UATwdZCiZDsz3OFSE7jHdVjJSp3GiJlfTOc=
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr27216275ejb.298.1608823628019;
 Thu, 24 Dec 2020 07:27:08 -0800 (PST)
MIME-Version: 1.0
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
 <dc87d7fa7cb4fb8870daf5277aa9b993e371f9d6.1608646697.git.bruce.ashfield@gmail.com>
 <CAOSpxdbZ766i_xyxwCAGwr3H8Zfahcjtrwoj-CsnLPWuDq=8RQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbZ766i_xyxwCAGwr3H8Zfahcjtrwoj-CsnLPWuDq=8RQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 24 Dec 2020 10:26:57 -0500
Message-ID: <CADkTA4Oh2VcELuN7v6-VEgiiQj60-Tphv9MjZBy5gTizodyNPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/9] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 24, 2020 at 9:48 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Tue, Dec 22, 2020 at 4:28 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following configuration commit(s):
> >
> >     72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'
>
> What is the reason behind this change?  Trying to decide if it is
> something I should take for dunfell (minus the 5.8 changes of course)
>

It fixes a warning that popped up due to my kern-tools changes (they
were masking some warnings).

So if you take my kern-tools SRCREV bumps, you'd need this (and the
others I've been sending out for 5.4 kernel meta-data)

Those tools bumps aren't necessary (they are bug fixes, but not bugs
that would break anything), so I leave that up to you.

Bruce

> Thanks!
>
> Steve
>
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
> >  meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
> >  6 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > index d415c3c63a..8bc93bf438 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > @@ -12,7 +12,7 @@ python () {
> >  }
> >
> >  SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
> > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > index 033dfc76a2..f5f7c87a31 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
> > @@ -12,7 +12,7 @@ python () {
> >  }
> >
> >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > index 33ca5856a3..3b462d5872 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >
> >  SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
> >  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > index 50cee07620..4afddae092 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
> > @@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
> >
> >  SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
> >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > index 1a14c8bdb5..456875a7b5 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> >  SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> >  SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
> >  SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
> > -SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
> > +SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
> >
> >  # remap qemuarm to qemuarma15 for the 5.4 kernel
> >  # KMACHINE_qemuarm ?= "qemuarma15"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > index af576891e2..3f94d22654 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
> > @@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> >  SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> >  SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
> >  SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
> > -SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
> > +SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
> >
> >  # remap qemuarm to qemuarma15 for the 5.8 kernel
> >  # KMACHINE_qemuarm ?= "qemuarma15"
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
