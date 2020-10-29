Received: from mail-il1-f195.google.com (mail-il1-f195.google.com [209.85.166.195])
 by mx.groups.io with SMTP id smtpd.web12.4776.1604009684663104016
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGwu5//p;
 spf=pass (domain: gmail.com, ip: 209.85.166.195, mailfrom: quaresma.jose@gmail.com)
Received: by mail-il1-f195.google.com with SMTP id f16so4746730ilr.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gVA44MvtQBsxMVeb1zxqidKZH9fCn2gZVZYff8Z8m2I=;
        b=HGwu5//pCLZ+sSfEx4pG/3ZINqHupKyOgdBfCqF5TmW7BKy1kI+ltzaAOf1/U3NpkV
         ljW7o/ehsxLD1VyWRzuFbBsIiu9qhtoPOCm89f410siIPRkEQ5VPMZa8+usfIS/LgykF
         dHb9frRWlrELTRS3FJ+A18JdnGtc4kBq98/PXFvxOJVZA32PxFIGP7ftb6Ch6gXcvNx2
         JWeRU7yqbzgFfHnJCiIZ7LsDrf1YfsrkoNWeJ0KybW+s+02viIK0lF2WDMLE4YaT3l26
         4aHzcA5EQ0pxJRjt1QHZKO/C0zqREVXF20Tz4t+JvtI8L0BV/f1rFbv6StbuF9iKfumi
         7gZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gVA44MvtQBsxMVeb1zxqidKZH9fCn2gZVZYff8Z8m2I=;
        b=hvM+UiSwNZmrvkx2zG937X8LAA6hoM4347gmN3rxTr9Zs4rHeUlqIqD11eoh/YLSf1
         yy2Rt1hadFlTgBBcELI9NFiNKdxQ526pBt+pSI6kj8dM9O+ZFkts4Inpv4TeZCRqylJM
         GUJTu/VvUEjy8mXOz0pm9hS55Z90RZ7uddRIcqwMEPqJv9ySQIbdQkYdKC1Jyeipo+Mw
         LQholin+DwXvth3nkRhlgYqemr9ldxXQLEOU0314lLWh3EZh6ncMP7Iw36HzzkA9Z1Ka
         /7du+k4Dd9DxVJlhDXisvNBMsKc2rIxwciCKWCMPxiju6kxSDOcTesfOLeB/Nc/Tlptv
         Jqqw==
X-Gm-Message-State: AOAM531/okBQtJzsdmJBCxw4BSlfh3ht5nJ3nPtwUhWT+qNn3OA5mO2+
	XHUWb5DQqSUIrDJCAi4wd6nUP6974Ho1J/9hdz7k00m6qAI=
X-Google-Smtp-Source: ABdhPJzSnv0/HIazh3kCtNvDxkLumpFM31sHJ/RftdgJlHimOrR2j43+39Vni319f4lhcLMHa8Rytv1Fx+2DF4OjY2Q=
X-Received: by 2002:a92:d302:: with SMTP id x2mr5077145ila.66.1604009684166;
 Thu, 29 Oct 2020 15:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
In-Reply-To: <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Thu, 29 Oct 2020 22:14:44 +0000
Message-ID: <CANPvuR=T0VzfWQic70q6GPPAujvQPWy7fUV5LkbP449pimLawg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I need to check what's append with this

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
quinta, 29/10/2020 =C3=A0(s) 16:06:
>
> On Thu, 2020-10-29 at 14:27 +0000, Jose Quaresma wrote:
> >     * 0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-som.patch
> >       Removed since these are included in 1.18.0
> >
> > License-Update: remove file://common/coverage/coverage-report.pl
> > Upstream dont have it any more.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  ...defines-GLsync-to-fix-compile-on-som.patch | 70 ---------------
> > ----
> >  ...t-gstqtgl.h-instead-of-gst-gl-gstglf.patch |  8 +--
> >  ...bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} | 14 ++--
> >  3 files changed, 10 insertions(+), 82 deletions(-)
> >  delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-
> > plugins-good/0001-qmlgl-ensure-Qt-defines-GLsync-to-fix-compile-on-
> > som.patch
> >  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-
> > good_1.16.2.bb =3D> gstreamer1.0-plugins-good_1.18.0.bb} (84%)
>
> Thanks for the updated series, I put it in for testing and this time
> we're seeing:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/1305
>
> nasm seems to be needed by plugins-good but is missing?
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
