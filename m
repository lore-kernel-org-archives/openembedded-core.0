Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.9122.1604144436127036159
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 04:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mpiPeAXP;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id v4so9389797edi.0
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 04:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hYUCxqA0pUFCbCn9Nn4glUmwwL28E+3J9YTpfazrYf8=;
        b=mpiPeAXPNUbxKQz3PhTdd+yi14QE/KgMPr+3eBarcC7lM7LNahjkKnWUSDQ4JpepTm
         ry0EqVbTx+32S4ejWOPm2X3JQDUsYXq507DYdbj/NtZmGO/ncU9HQ4BPwI9B7WRs2wzZ
         tYA9z1FxY4BAsFiks1/OLHj5PfwNYjQj6yXblQxZXaQvRQRloWQEqJ1YY85UVaRsJZ7Q
         uxQIBtOtHxoiUA/qVpwDwBr9EEiDYn+yZLeohu1jPmRhx3384onlue6+iAg7sLd+8rtz
         K5Ncu6txi/V/Ky6FQ4UfHBXCpCwI5ylbAvjQY4jC9zHcrWUj5+/uygjWNWA/MXUGwmtU
         B1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hYUCxqA0pUFCbCn9Nn4glUmwwL28E+3J9YTpfazrYf8=;
        b=anH0MjB1BdoPyFWTSngYnNypolTEgQtP2PLWNPO9TJqdCI92MG3+tiwgdRsaUkAnUX
         MmMmpoAGKfQ3bNSaEnZLfFXbaT/zooa2FBgjncfZhaPzoKS0+jKBnRY6/DKZGSrJmkmN
         dG+NVBtpYQHwO6aehK7vWjyxPjQHPMdmWNiLzBr/tDNkRB93b4Va5IaX2EOmdDrLu01o
         Za7xU6MGZHm1wP2ht2wwZfrlS4SbWKWkQdpb8Wzdm6AlPMyBLw2bWGypxDnhmbfTcgeF
         UqQxuSv8TyqMxrYl72L6eitIgzKIIOYEjZbiaBG/qizE0VOn/T3+A4n2hcgc34qkkzpZ
         uSww==
X-Gm-Message-State: AOAM5308xVDfDAYxTRHj5z0970xNE5APq14GZ2ZJny93QGuVpjDClF0e
	d1LifUb56OzQ/koeTbZAoCbSzMcRZdASwwM0WD4=
X-Google-Smtp-Source: ABdhPJwsO4K0SzL66rCOz0IB4Jyg3ddt5bM92uHiTF+ZAK7qUPnlRvzlsjja+8BPXSgwrhjJG4+labMiTyRWPDZGKgY=
X-Received: by 2002:a05:6402:17ac:: with SMTP id j12mr7090552edy.31.1604144434473;
 Sat, 31 Oct 2020 04:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201030232256.624297-1-quaresma.jose@gmail.com> <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
In-Reply-To: <aa090613e34863ee936811011d3019eafba3db81.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Sat, 31 Oct 2020 11:40:36 +0000
Message-ID: <CANPvuRk3P=9Ho7w=PzdUVKQpVgoechnSX0cTY3TaTdcOaqiHHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer: use git to fetch the sources
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
s=C3=A1bado, 31/10/2020 =C3=A0(s) 00:32:
>
> On Fri, 2020-10-30 at 23:22 +0000, Jose Quaresma wrote:
> > gstreamer has the code hosted on [1] and this repo as tags.
> > manage code with git its more convenient than with tarball archives.
> >
> > [1] - https://gitlab.freedesktop.org/gstreamer
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>
> I'm not 100% sure about this. Tarballs tend to be less overhead for
> fetching and make for easier source archiving. The git repos are easier
> for day to day dev work but tend to be harder for the AUH to handle and
> slower to fetch for the users taking up more space to download and
> unpack. I'm therefore torn. I know where we have used git for other
> core components it has caused performance issues.

I have the same opinion that tarballs have less overhead, It's much smaller=
.
In this specific case the git repos are very big because the gstreamer proj=
ect
started a long time ago and it contains the full evolution of the project.

However I sent this patch because I think it is easy managing patches with
git but with the devtool we can achieve a very similar workflow.
With the difference that more steps are needed, to do a backport for exampl=
e.

>
> We do also have the option of the devupstream class although I know
> that doesn't quite work for the native cases yet sadly.

I don't understand this sentence. What is the opinion of devupstream class?

>
> Cheers,
>
> Richard
>
>
>

Someone on the mailing list has suggested that git is preferred over the ar=
chive
but now I understand that this is only for github and it's mainly
because of the inconsistency
of the archives that they generate.

--=20
best regards,
Jos=C3=A9 Quaresma
