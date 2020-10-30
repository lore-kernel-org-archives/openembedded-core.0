Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.18258.1604082195355710444
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 11:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l0kPCTug;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id p93so7614536edd.7
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zac7yCZGUKhXOqDnRb41CS+12GEXmm2c1MwP6oPnXuw=;
        b=l0kPCTugLkmqhp7dk5MW7D1TltmN+XIpk9DqyW/zyoBSRCfzK+yJFhrXUk3MIEd2VB
         51NRIm+AsfnVe0gxlSqjdNLdOuPxLARSWQvnIaKLzKtWlt29V8n9PLA1huReUarG0LS2
         Jmycuv1GCCozuKuLcY15jWqW1xNDKb6wkdIZqTpb6weYaC25ox+RtAFvmRW3p/M5nY50
         lvdFnf52d6pGx0YQ/6DzjvL04itJcktyJnBP621pZ9X3ZxGhbrGPLV/0NhvGVQliXgmY
         xh8sT5nedlSjdKWoycViGeStPY7lC788/u8YYK2ZxC74so2Eal97Co5ffKUruA/t5vJ/
         djaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Zac7yCZGUKhXOqDnRb41CS+12GEXmm2c1MwP6oPnXuw=;
        b=Uo+1hXPt3DpQimnilroV/RUepdmSeLtwE4VTZoEIBXIPd9l3XujVO/50FgoeQ4yteZ
         xQciSL4eHBPyBerGwrcf2iCESsNfsVyf5euMIldUYsstoNcm1td0UgpkzrwvDsBkhHvz
         V4rlsJ+jm/DE3iMIRbTsFB3nEXw6wduFS9spWjaRKWrFHFDOMp0GM90uOjxIS0Gv+rOR
         4TvhzopQCS52o3TC/x8E/1yFeCWan59Qgvr+Rh7pvuVi06VL1to0hGSQ+85G41yWHFYu
         i4w0pgaU1rba2pj2M+41ih0KVlHmJ5EUEumddD9bNLeebfDxi1eGUp9vI3GeYj6GOGfR
         sU1A==
X-Gm-Message-State: AOAM532Q4aCrFICp6ABXa1WjSmPX2m3JIKAUOMBhLcwARJwz9jU4wplT
	Zcc7g95rXHjqJwVXQIjoGWq1i4NiIEXppI0v8zw=
X-Google-Smtp-Source: ABdhPJyiYBtcualBHxyqEY5dcIb6+L23YWGPoc4X7DXhSzyXVNBdySKxnK01KD7JwQ1XY10bDIlANSpr3XLt9OI7iTo=
X-Received: by 2002:aa7:d597:: with SMTP id r23mr3745833edq.19.1604082193793;
 Fri, 30 Oct 2020 11:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com>
 <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org> <1642D6DB2EF0C3ED.10902@lists.openembedded.org>
In-Reply-To: <1642D6DB2EF0C3ED.10902@lists.openembedded.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 30 Oct 2020 18:23:13 +0000
Message-ID: <CANPvuRnjYPZabjLDTW7rttaaH6qUW7sV_ZEyS31bGZHsZHjXsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I see your fix:

-PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm"
+PACKAGECONFIG[asm] =3D "-Dasm=3Denabled,-Dasm=3Ddisabled,nasm nasm-native=
"

and only nasm-native is needed,
because nasm is not needed on target and it's only needed at build time.

I can fix it and send v6 series and I have another fix for this series
that remove
0004-capfix.patc in gstreamer1.0: upgrade to version 1.18.0
What do you think?

I hope this is the last version and I will be more careful next time I
submit a big patch series.

Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu no dia
sexta, 30/10/2020 =C3=A0(s) 17:57:
>
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> sexta, 30/10/2020 =C3=A0(s) 17:45:
> >
> > On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:
> > > nasm is present on sysroot
> > >
> > > The build log
> > > https://errors.yoctoproject.org/Errors/Details/510826/
> > >
> > > Countain:
> > >
> > > NOTE: Direct dependencies are:
> > > '/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-
> > > devtools/nasm/nasm_2.15.05.bb:do_populate_sysroot'
> > >
> > > NOTE: Skipping as already exists in sysroot:
> > > 'nasm'
> > >
> > > I don't have a build it on qemux86-64 and only build on arm
> > > and on arm it is builded without nasm because -Dasm=3Ddisabled
> > > Otherwise I think everything is correct with this patch
> >
> > I was able to reproduce by building qemux86-64, it readily fails. The
> > issue is that it needs nasm-native. If I add nasm-native to the
> > dependency line it seems to build fine.
>
> Big mistake and I don't see it, of course it was the native nasm that
> is needed to build.
> Sorry for that and thanks for looking into this.
>
> >
> > I'll add that and retest on the autobuilder. If that works I'll squash
> > it in.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> best regards,
> Jos=C3=A9 Quaresma
>
>=20
>


--=20
best regards,
Jos=C3=A9 Quaresma
