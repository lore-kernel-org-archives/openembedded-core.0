Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.9199.1604144980673849852
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 04:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rsl1Gymz;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id l16so9395550eds.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xxQu87THKPigw/WKiOMFAb2B+Lkb3cKBGb3ZVEzNkzw=;
        b=Rsl1GymzUai7Ah2/d1lkZcZpdyz75QrwZ8CeFdVnF9fBQKjb6531r7h8PFM9tz07fu
         W0kPMdQahFpZyspzFK/gylnjgWfpaS5zix3qixxiiOox6Pdo3m/5Q1MIZOzFOnogcnj2
         3xngd+C+E7vlFC+rSXj3MRNv7MTetilX9J7BuSPksGuXiJobgWWWPaq4NcmU2PRXrvb+
         Y6hkMu9hTKz0GsXdmbuPm7Tgn59DSZbo9FCniha4pRaHMhYL5ZEAl3KZVecSNp5jUe5E
         da4sR90VmkFxYRw8RPG1w72EtLbEP9D9xv2VzSCNhCE8Iw/4TL1Dlz6wReZlRkEmbMm5
         2d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xxQu87THKPigw/WKiOMFAb2B+Lkb3cKBGb3ZVEzNkzw=;
        b=Dor4vb1Q962cdfVLy9jj193BCc1TYe+rXwXXPathKlaqOiqq3oDispQIxyg/ldtg6+
         p5l1xjwIrBD3glb9viuhag2oC54L9jSzR4Hj9SwipW8iRJHLgXT1cY29LlwqYbbkYUyv
         ayWMg9rQEFmngGncP+RpPesbW4dQV5oEJuhdzmUcR1YoQTKjHBuJZUvnAtWLook0G+P4
         E3REh3AY3JJEJ76pirGiGCOUtLs6V/hc47eikYyViQuJ13D5eM3w3pRdhyo1hNykO7XK
         6YNcKLzsDFDEeT6xMpV2qW0y///MmqqcAL+M2pFUqaNSI3+m4oJvbUBYHDPGAarFmWbL
         GeyA==
X-Gm-Message-State: AOAM532wqAcBlk/Zzhcr+gTXhzswyKCZyPlPrpcEwI2pHtTrdFczDXif
	/ZcuLzZDNpbLxKlwoggwZ5kVfTenbZEMwFgP5/k=
X-Google-Smtp-Source: ABdhPJy6UmELS+s5V1moZ4luQ8z2SwgDrcz/lUSJ2VtVEzsgNfTT5UaKRnwXYpaJkzAjc1aPo0fUbqayRuzPFpUGfM8=
X-Received: by 2002:a50:99c3:: with SMTP id n3mr7263256edb.213.1604144979073;
 Sat, 31 Oct 2020 04:49:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
 <1642D6DB2EF0C3ED.10902@lists.openembedded.org> <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
 <3b12ced1f6625fe0a9bdeb9e5c0cd5a7ca004d50.camel@linuxfoundation.org> <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org>
In-Reply-To: <b298f53a7fceab3d51ec69ab1b9356269074e712.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sat, 31 Oct 2020 11:49:40 +0000
Message-ID: <CANPvuRn+ZOcnS+Mg_y5dcX+D1QJH__APYqLECGrBt8KVx0fU1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:49:
>
> On Fri, 2020-10-30 at 19:23 +0000, Richard Purdie wrote:
> > On Fri, 2020-10-30 at 18:23 +0000, Jose Quaresma wrote:
> > > Hi Richard,
> > >
> > > I see your fix:
> > >
> > > -PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
> > > +PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm nasm-
> > > native"
> > >
> > > and only nasm-native is needed,
> > > because nasm is not needed on target and it's only needed at build
> > > time.
> >
> > I was thinking about that after I sent the email. I've tweaked it
> > again
> > in master-next and squashed it into the series since it was easiest
> > to
> > do that.
> >
> > > I can fix it and send v6 series and I have another fix for this
> > > series that remove 0004-capfix.patc in gstreamer1.0: upgrade to
> > > version 1.18.0 What do you think?
> >
> > We can make this one a follow up to the series.
> >
> > > I hope this is the last version and I will be more careful next
> > > time
> > > I submit a big patch series.
> >
> > No problem, thanks for doing the work in creating it! The end result
> > should be good and its nice to stay close to upstream releases. I'm
> > think we're just about there now.
>
> Just to follow up, you renamed gst->validate -> gst-devtool but didn't
> update the maintainers entry. I've added that. We also found that a
> dependency you added, json-glib had reproducibility failures[1] as it
> wasn't being tested previously. I spotted a previous similar issue we
> fixed like this and Alex was kind enough to send a patch.

Once again I forget maintainers! Thanks for the update.
About the json-glib I only build the gst-devtool and don't have any
tool to check
the reproducibility. Thanks to Alex for the quick solution he found.

>
> [1] e.g. https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-2020=
1030-ld3_vz4a/packages/diff-html/

There are great tools on the OE core to check this type of problems.
Congratulations for the autobuilder infrastructure. I will try to
setup it in near future
because they are very useful.

>
> I'm running another test build, hopefully this one will be better!
>
> Cheers,
>
> Richard
>
>
>


--=20
best regards,
Jos=C3=A9 Quaresma
