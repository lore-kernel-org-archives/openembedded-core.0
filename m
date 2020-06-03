Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.3045.1591227737143435838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 16:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UWfgrTel;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g62so201391qtd.5
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aDDasVZgw8n+ybSp+bvRYhoeLuQX3fnSuUMjmu/VVus=;
        b=UWfgrTel8MVY5hmM5oCqXKuIJHWs2Nxc34DFbGeEk1yTUMSRj6J0btuAgp7aasZFvW
         5Hqc8ht0jwk2TfKQ0WWgJsaKI0WEePIwJJAlc7CgiDm6nrUf7k9n6Z9XS61RAb5Ignpg
         NOq1p9NmAnhJXXwAMZ2tX4+WfXzfV0oBSI9Q4ji6+85m9n1GXprVqeRT6oyXmZSBZFna
         GHwMVCs8MK9DJX/ZL7kutJHtZp/iNt4HBY4Hx5HBnWRkjtigPvZL2ld9SbdU9PSZZ63Q
         wQB1Wk56yXoKY96S5EV1dMe0IJ71DGtKWRHLcmtP3DuL7inUntIOekk0iQHLTcW2/Ij7
         zGAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aDDasVZgw8n+ybSp+bvRYhoeLuQX3fnSuUMjmu/VVus=;
        b=Ld4fG8WUoWbBakzur8t1MFT25Gmz5LvBojkHw3qDCXCVuTshIwrMgDPrI+F7wCQhoP
         EzocOpKlBDf4Qj0go0j1UdkCvwFEIZbtEdRr6AoBgEPS1M6BW6RBrqV4ZdgVx0tI0B6x
         5P3lQFxObGLYE6PqKFoNlx1kJMert2/4T9YUqv9lSGHweEgLJNV+rebOcHxIx2afcu3a
         V0r9vsC/c+bhgzvzBK/JgMZB3vmDhh0uuJVbukVaGQSWq2IanQAwqotUZwh1/4L1FAYM
         8kZ+IPLdR2IsGKFav1qw07kWiWs43p8RHLmFElAJ2iG1u8fYNRfiXwHiMsn2k4XE9HfS
         UFig==
X-Gm-Message-State: AOAM530g6sC/a+XuU2apASyphvCvYbbVCateqo3pDcYrxkxtn4e0OUQG
	GZA8ebtL9TkcxonDYvPD0GEeoLK/8yqjHb2sC3w=
X-Google-Smtp-Source: ABdhPJzCCdrkoZGMLvsj8PivoBmn8PxoFBC19dD0GP2xnhUw4Ns0XCIeZ0Q/814QCzNxzGlggU5DtKkuqLr2ppV8mk8=
X-Received: by 2002:aed:308e:: with SMTP id 14mr1932620qtf.146.1591227736100;
 Wed, 03 Jun 2020 16:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk> <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net> <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
In-Reply-To: <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Jun 2020 16:41:49 -0700
Message-ID: <CAMKF1so0ihfr=A56FeZ+xhABjHGgh3A7rdo6L02x3yvKoNj9FA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Phil Blundell <pb@pbcl.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>, Andreas Oberritter <obi@opendreambox.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 2, 2020 at 2:46 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
> lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
> >
> > On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
> > > I understand the concern, I am a little torn on this as adding in too
> > > many different controls and options complicates the test matrix and
> > > makes things harder for users.
> > >
> > > You're effectively suggesting a new DISTRO_FEATURE to control this? or
> > > maybe better, perhaps a glibc PACKAGECONFIG?
> >
> > Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
> > outside glibc needs to care.
> >
> > Here are the scenarios that I think matter, ordered from simplest to
> > most complex:
> >
> > 1. Immutable filesystem, every library installed in the place where
> > ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
> > In this case, we don't want ldconfig (because it can never do anything
> > useful), we don't want ld.so.cache and we don't want ld.so.conf
> > because they would cause ld.so to do extra file loads and computation
> > but end up with the same result that it would anyway.
> >
> > 2. Immutable filesystem but some libraries are in places that ld.so
> > wouldn't automatically know about.  In this case we do want ld.so.conf
> > and ld.so.cache, but we still don't want ldconfig.
> >
> > 3. Mutable filesystem where arbitrary binaries can be installed in
> > arbitrary places.  It's probably debatable whether ldconfig is needed
> > in all these cases, but clearly it's needed in some and I think at
> > this point it can be left to a DISTRO decision how exactly they want
> > to optimize things.
> >
> > I think right now oe-core supports #1 and #3.  The proposed patch
> > seems to be aimed at #2, which is a completely valid usecase,
>
> It seems like a weird corner case to me. Where do these libraries come
> from and why can't they be moved or symlinked into a standard path?
>
> If they are somehow special and only used by special applications then
> setting rpath or using LD_LIBRARY_PATH just for those applications
> would seem to be a better solution than enabling them globally.
>
> > but
> > my concern is that we don't want to pessimize #1 in the process.
> >
> > There is a whole parallel discussion to be had about the merits
> > or otherwise of ld.so's hwcaps mechanism.  meta-micro has been
> > carrying a patch for about a decade to turn all that stuff off,
> > on the grounds that it's just a loss on any kind of embedded
> > environment.  Maybe I should make some effort to get it upstream
> > as an option.
>
> Note also that glibc already has a build time option to completely
> disable support for ldconfig:
>
>   https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/configure.ac#l89
>
> Sadly it's not usable in recent versions of glibc (setting
> use_ldconfig=no results in a build failure due to some seemingly
> unrelated missing build dependency which I haven't had time to dig
> into yet) but it worked well for OE 2.2 and gave a noticeable
> reduction in glibc code size.


If we can get this working and perhaps as a packageconfig this would address
concern #1 nicely per distro policies.
