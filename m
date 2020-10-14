Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.7420.1602664742906318387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mJkOHQu6;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id c22so3709402ejx.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2020 01:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CYOZBAlww04MMX8b30xiMr2VKpWPcftX58y1loz710g=;
        b=mJkOHQu63xLobdNBVaNcDU2nDkzRs0rfme11uSJ3Sac6W2OKDrRutW2Y3DDpdGVPHZ
         7o8rdacgToiVLmiEwKfk4ysu1olngQva3FtW4xzMLpQ+IbFJPEgc9MnLMyxGRX/Z034F
         +ZaFQLfrf3RK3NpbSqBt5kYh5z8+PUmebj1wggMxWOxWGy+bsdm/BlqXy2JA166OT/Qj
         XswEgefbim+3WRWQ4zr71Pt2t5NvPJWGlTnDK10dbP/vr9CrUaahvnsyrA7q+JSWuARf
         nemooWgc7pumIyyfp8fUBHgIxt9HdEEQoITQBiYjUQouoGMQuzcTahz/e603nC+YSGAE
         e+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CYOZBAlww04MMX8b30xiMr2VKpWPcftX58y1loz710g=;
        b=QZnjnP7xWY+qd3s4UeD2ZCDYaWB/FY1at1Z0/Etr14H2pMEZ8iR4B27jgsgh8o+xmF
         WzizCLnmlgXxYF6dRrHJBZGBmiKoIqnuy8HlLPQ4g5ZwCQtOhvNredXBCDMlwWAh6U9r
         rVct7luwqsH+WB6k/H7TBMBCKHGDSlzmuU5ZzSFz4mW0OlIkKHkTZmuLvKM3rWWUrxCq
         cw5OEwnybOVU15iY+aVkXr/H5JIdAymHIJjCy69p1o/pJHD3i/7Zx6wX4DyGsBC1qmcV
         +aYU7iJkjFz6e4Ylunod0uy6JmSr+lnarweUtIIJ8cmvGESXpfVqTQYQHBr6qyPHqTfJ
         2FPA==
X-Gm-Message-State: AOAM531ayT9Vp/+fVTAYvQW6Li+GmvRCTdCizF0EKCZ/a7U9t+EO+9sb
	w3Fk97P3f8Lu2R01U2pkwsriTHuqgLCaRokMWNK+pmh1YVD7HC8S
X-Google-Smtp-Source: ABdhPJyhNYDMllfvI5kk9EW0rE/xA9DN6R6rKUNUwGXPZpMeU0oHKh+ln1b/t1ze7n2gZCa+C3t53YtdNtWG4SdYPzA=
X-Received: by 2002:a17:906:d7ad:: with SMTP id pk13mr4010190ejb.33.1602664741348;
 Wed, 14 Oct 2020 01:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201013234452.2294860-1-quaresma.jose@gmail.com>
 <20201013234452.2294860-2-quaresma.jose@gmail.com> <CAP9ODKpoU+3vk8_5VGJ-sGPrht-zbbEbtok9TxVk-SAtcu2UxQ@mail.gmail.com>
In-Reply-To: <CAP9ODKpoU+3vk8_5VGJ-sGPrht-zbbEbtok9TxVk-SAtcu2UxQ@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Wed, 14 Oct 2020 09:38:52 +0100
Message-ID: <CANPvuRkFv2e_-vH=2Q_LCRXXNgO9H+6GFwLjokpDYh23hrS=Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/4] spirv-tools: enable native build and install more header files
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Otavio Salvador <otavio.salvador@ossystems.com.br> escreveu no dia
quarta, 14/10/2020 =C3=A0(s) 01:01:
>
> Em ter., 13 de out. de 2020 =C3=A0s 20:45, Jose Quaresma
> <quaresma.jose@gmail.com> escreveu:
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/recipes-graphics/spir/spirv-tools_git.bb | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/reci=
pes-graphics/spir/spirv-tools_git.bb
> > index 8e8388e8d4..89ebd72d31 100644
> > --- a/meta/recipes-graphics/spir/spirv-tools_git.bb
> > +++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
> > @@ -28,8 +28,12 @@ EXTRA_OECMAKE +=3D "-DSPIRV_WERROR=3DOFF"
> >
> >  do_install_append() {
> >         install -d ${D}/${includedir}/spirv
> > -       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* =
${D}/${includedir}/spirv
> > +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* =
${D}/${includedir}/spirv
> > +       install -d ${D}/${includedir}/spirv/unified1
> > +       install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unifie=
d1/* ${D}/${includedir}/spirv/unified1
>
> Indenting changes; please follow the recipe style.

The indenting is because I remove an extra space at the end of line.
I will add an extra patch to fix the indentation before my changes.

>
> >  }
> >
> >  FILES_SOLIBSDEV =3D ""
> >  FILES_${PN} +=3D "${libdir}/*.so"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.28.0
> >
> >
> >=20
> >
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750



--=20
best regards,
Jos=C3=A9 Quaresma
