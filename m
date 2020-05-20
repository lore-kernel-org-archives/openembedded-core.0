Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.522.1589991381955527869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 09:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EARy/zK1;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: sakoman@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id g14so379067wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52VIl9/6rXqNeNL0OBRoerhIkjDekPGRz7xMB8yTYsM=;
        b=EARy/zK16Z49nwCGhQ2UBN03f9Nnue0QPtlNdMVtu7V2ts4yu7l6+H6XbSUuoZG1X0
         zoH57tl79x7xLpn4QCFazOtm/+mDEwfOxNoBlqEVWSVvN2GBw1OXShihzqTyb0D16duj
         gN+1J38JKG9uob6GfWYPmQySBm/hWihWdtuIHpGXwukGaPcdnhUhVKyMPoFiFkY1lL/w
         eZk+y81u/V+GmZqyftpifebDFqIiAFTyZZWiCkdhQP7fdw/dSwyh/g1UMYPjdJLA1ckY
         hOWhS2HTlCjTE6KokCoRwg3tjsc+ZcIpvpbf+YACG/ow0su/jnamcQV3J8x1DJKvJzlz
         oyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52VIl9/6rXqNeNL0OBRoerhIkjDekPGRz7xMB8yTYsM=;
        b=NS8dzYL6QXIgBxuY0IiK8BCwdgHA9OpK5sLKY2QszD3Ihp5K9mXd5AutxGXn9UQ5Lz
         YDYy8xtQ9h32ucFCxWywGwnZaeuy74o0qfJ8zWDNY+rXxXNYKU21n8QO0BKkX7PRUJbd
         8zyCnb0LZ3/RVyKyxoqev2GlhHhzeALy2S975HG/VmJ9zBZhShZYRTNrQrkn966vdXX2
         K6mryaXXdP67GIYNkBzM73M20PrcMxnQeLNIS5HrmsrzHiOrbWg820VOUwR2nFca5Mo8
         M5OH0/SFM50OQIa0N3J+dw+9YKlENR3QepVih7Y0qt5A3UwrEM65Mrmm3DKaJuG+izim
         G4hw==
X-Gm-Message-State: AOAM531k232UP3f7smuey3HKxXlapQMEPvCz6vjWuGVMdqBdpDZIQeZD
	rGxM2IBjbCuVtkGlit6l5F86sIKX54w1B3wcReo=
X-Google-Smtp-Source: ABdhPJzexYpIbx+xro1GfPRArlhGyb4RdZNsJ89OSbjdXjDcL0H4ghhJlJDcWnKhO6I2KQw/2g+xmAjE0PQIopCX4ss=
X-Received: by 2002:a1c:64c1:: with SMTP id y184mr3949305wmb.175.1589991380555;
 Wed, 20 May 2020 09:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1sqLxWZD6U1YHrr3Ngb1Vh8JpjCvUXRD7ybarit9wz5KfA@mail.gmail.com>
 <CAGDS+n=taO-HkbecAKihO_oD=WGusAjoL4UoJV-7mgmYwXa5ow@mail.gmail.com> <CAMKF1spt-rNn-SsC1qfC_aQZa4H60m8-f=7aDZwe0xq_j7vHTg@mail.gmail.com>
In-Reply-To: <CAMKF1spt-rNn-SsC1qfC_aQZa4H60m8-f=7aDZwe0xq_j7vHTg@mail.gmail.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 20 May 2020 06:16:09 -1000
Message-ID: <CAGDS+nn_+PQdzFjCkgWvc_-=3-hFcEPzhNhy9OJ=nCaUe3ZLDw@mail.gmail.com>
Subject: Re: Dunfell backport request
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 20, 2020 at 6:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> I think I can create a pull

That would be much appreciated!  Remember to tag it with [dunfell]!

Steve

> On Wed, May 20, 2020 at 8:44 AM Steve Sakoman <sakoman@gmail.com> wrote:
> >
> > On Mon, May 18, 2020 at 12:21 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > > I would like to request backporting following master commits into dunfell
> > >
> > > https://git.openembedded.org/openembedded-core/commit/?id=fd4a454b5a357c7a26792bf486212957c698839c
> > > https://git.openembedded.org/openembedded-core/commit/?id=882df891e13ce5c64718c364efb9ef2bf189eabf
> > > https://git.openembedded.org/openembedded-core/commit/?id=2c7e0e0bf32eb1ed0b7d8acddb16c0d1e93f2aa1
> > > https://git.openembedded.org/openembedded-core/commit/?id=48b6f7e31ff042a4900307e830f9ed9375a8041a
> > > https://git.openembedded.org/openembedded-core/commit/?id=ce6c50ea68c34e02b487d54fdd9288e04833cdef
> > > https://git.openembedded.org/openembedded-core/commit/?id=886333c5d1c336da99300d24fb3c15ab0b37d1cb
> > > https://git.openembedded.org/openembedded-core/commit/?id=03b04fcfa5549a54fe6f335df14433934a7d5128
> > > https://git.openembedded.org/openembedded-core/commit/?id=e114c670d1e670397c1c04292688b7550f54027c
> > > https://git.openembedded.org/openembedded-core/commit/?id=030cd9021ef50d71482f6acf0e05fe425038c822
> > > https://git.openembedded.org/openembedded-core/commit/?id=a5331c5a8bbe63c6c2e56ebec496b28968d4663d
> >
> > These changes are intrusive enough that I'd really like to see some
> > discussion on the list before I decide to take them.
> >
> > In the future it would make it much easier for people to review the
> > backport request if you sent it as a traditional patch series.  A list
> > of commit IDs is much less likely to get the attention of the right
> > people!
> >
> > Steve
