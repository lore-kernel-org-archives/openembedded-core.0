Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.17899.1604080653714650569
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 10:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XxqoPRKe;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id w25so7585797edx.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 10:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lvRE7YWwoeHt3zkFfwMtLImSoo3bd6KwAyGclisrasg=;
        b=XxqoPRKeHM1p/4BTYAf5b5FG/krpsBzCxwAGB7byFwjOSKLYf8f/iq9Ho1bgXLmoD6
         Gmb5mCAIC4SYTgT3RHD7Cj8NJvMz+ecsLPUN8wOhW56VbomcbuHkMR1aD7XDe8zYJD2J
         +y5WSlmIXAs/iXmNbXsz6eqbQnkmbFFktOmvuEwjMPv24SsQ9zmf/+6A7W+Vq622Xnov
         lpabXgasxemEW7PTkuv/XTjO15i5K9uBJqLWdtiu6NmuSIH6+CmaZxjAVSxyf39LgBCb
         ob1slu19KygxhfEr/tSTZrhhl8vJboSgHRV6GRpo/NaGjzrQWkxDgmH5VirOnm0IH7lz
         QcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lvRE7YWwoeHt3zkFfwMtLImSoo3bd6KwAyGclisrasg=;
        b=Hbt02cuv1GtVuz7ls3mhC4TLEP9V9ePT/qsH9pN1Tep6yaxkh9dZAL35v28ROc0bbk
         7qtx2pJaGk4XwOPtCCoAXl7b+huKPXobFqL2A7Tn1pFMs1SbjcUfTF1c2T+TK6aCK6/Q
         cWb7ZJG/9ztm6eOcbkdEhA+E81Gyb2Qnv90aZVvRSk/G/MA5q3VJwFtNxJMZGG1wCyVO
         iPr+knVqbac1eH3QUTgeGcWBosElmpPCLIxrxlN5gxSbVspz7uIP6ueZLVxd4AQFDQad
         oZoywdakvBgXrFcZZ6giElqBuIBIFTd4nQ9BLRowacozrZPg7iVtt2JK9DvKjorI2GBW
         U1/g==
X-Gm-Message-State: AOAM531l1JxdVR/rslIzsKskvcdBGqKPEMfUN3FMThXXMOruVH/mKo9u
	5QTYxM+vWWj5DpHU1UDkyWfGnAywTqk53hZ26GM=
X-Google-Smtp-Source: ABdhPJwpMa27nfjoenzrui7OZwxICaaip96ThrqDj6sxhAtaQwxTpHkCxyz7Rf8av7+FQSMkDlV825fUUbwJr8bFwXI=
X-Received: by 2002:aa7:dc50:: with SMTP id g16mr3680610edu.95.1604080652111;
 Fri, 30 Oct 2020 10:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201029142806.1830504-1-quaresma.jose@gmail.com>
 <20201029142806.1830504-6-quaresma.jose@gmail.com> <88cd1831e021c2384219da4223981fa004551498.camel@linuxfoundation.org>
 <1642964F5C513D13.27950@lists.openembedded.org> <1642987B07D196A5.27950@lists.openembedded.org>
 <CANPvuRkKDPM8h5d8wjzdvQ95vY_kYHXkxvW0Uvqw8rTYj0yWCQ@mail.gmail.com> <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
In-Reply-To: <f5f3fe375a9174e401c283431de0fca1634539a1.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 30 Oct 2020 17:57:32 +0000
Message-ID: <CANPvuR=h84EFTsLy_6TM7OoDRfrvT-AaU3EkWP7v6X=Bu0JuhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 05/22] gstreamer1.0-plugins-good: upgrade to version 1.18.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
sexta, 30/10/2020 =C3=A0(s) 17:45:
>
> On Fri, 2020-10-30 at 16:47 +0000, Jose Quaresma wrote:
> > nasm is present on sysroot
> >
> > The build log
> > https://errors.yoctoproject.org/Errors/Details/510826/
> >
> > Countain:
> >
> > NOTE: Direct dependencies are:
> > '/home/pokybuild/yocto-worker/qemux86-64-ltp/build/meta/recipes-
> > devtools/nasm/nasm_2.15.05.bb:do_populate_sysroot'
> >
> > NOTE: Skipping as already exists in sysroot:
> > 'nasm'
> >
> > I don't have a build it on qemux86-64 and only build on arm
> > and on arm it is builded without nasm because -Dasm=3Ddisabled
> > Otherwise I think everything is correct with this patch
>
> I was able to reproduce by building qemux86-64, it readily fails. The
> issue is that it needs nasm-native. If I add nasm-native to the
> dependency line it seems to build fine.

Big mistake and I don't see it, of course it was the native nasm that
is needed to build.
Sorry for that and thanks for looking into this.

>
> I'll add that and retest on the autobuilder. If that works I'll squash
> it in.
>
> Cheers,
>
> Richard
>


--=20
best regards,
Jos=C3=A9 Quaresma
