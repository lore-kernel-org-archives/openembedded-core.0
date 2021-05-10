Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web10.29826.1620642978688824271
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 03:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aaAka9u4;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id j13so8148164vsf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 03:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTNB1MsrT2xEg18G2BIYPzu/YJMf90Q8b9sSkvdWDyo=;
        b=aaAka9u4nGfpp5eNbE2ThpIGU31Tg01r+KGWo0V3Xi6uJSvt9ZGir2RrZla5G+kN5i
         rwpGbTeDOHmgU7HwULrV6IRf9ouC29qZQTEJ5r0Eg5BdisRjuI6fGtGFw9x4DOwMQQOt
         +s9s2qw8aR9QOTT7JXGHTF10TcXhr0kAx/HEaU3G8F6wo0WQDtaLyp6uF4uwha84Boz/
         GdXHBZY9oewkNkfp6jU81/X6heLt0BPS7KKwkz2jvtoRxU1aaebTPUv9mKREVAiRY3I0
         90xeOHfM1e0JB5+IQsaodsRmSg/jiMR0MaHMwaNLZzk27Zjq61nUudkVugXHm/EeFf6c
         tuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTNB1MsrT2xEg18G2BIYPzu/YJMf90Q8b9sSkvdWDyo=;
        b=BB3I1tVufopP2VwyXs7wBvcO2LezW9+Wgx28BByPzDw5G6BKY8EM7m+2e4UPecSSSq
         xc/Ha+jxFW7GIU/6MNuvzh+Z1k/WIiZ6t+AWCmCTaqmWzfs/BuZiFeY5YRuSd1dIXajZ
         Tv38dv7yoeIA6UX/IbxuNW6AVcm4tp0GrIey1a4G6LFFC1qyMGGRrXBbiXlqlmR4fFht
         KKhc6RX0rYG646jQtFRr2UJqRXtcGredlyoFwK3tx4qtdE0RiAR4I1t8+qr20m0mtPCD
         kwNE1z8HJw0EXXarMyE00aN717Q4e5TfE195554ZI4Vz7RdAB7yRssdFioFQaHfRUCuF
         029A==
X-Gm-Message-State: AOAM532dJoCEq3ak0yESyDlGkdjeNyCDCw2V1sbk2W+rpIB9HZC094KO
	XgrsC3ZS+hXhRFDwHaer9/FHNZGfI2rbrUD9voM=
X-Google-Smtp-Source: ABdhPJxL8pRsMeEDXQ8BYksFtWM3yjKjUkOw8z8xkTlj1Sjx+9bP/oghwn/bTT5pG+kNKAX8czgIRcRiN2f9F3s5Wk0=
X-Received: by 2002:a67:f04a:: with SMTP id q10mr17519297vsm.41.1620642977888;
 Mon, 10 May 2021 03:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
 <20210505151850.660512-2-alex.kanavin@gmail.com> <d1f5adca-a9b8-f041-9bfe-088ee60477e2@gmail.com>
In-Reply-To: <d1f5adca-a9b8-f041-9bfe-088ee60477e2@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 10 May 2021 12:36:06 +0200
Message-ID: <CANNYZj-ni+kkVQgzmcMFaLdsM=63nuFc0LDYkH_p3+ic59Zm4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/61] go: correct upstream version check
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000013c7b05c1f75997"

--000000000000013c7b05c1f75997
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 May 2021 at 21:34, Khem Raj <raj.khem@gmail.com> wrote:

> > +UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>
> I think we should revert
>
> https://git.openembedded.org/openembedded-core/commit/?id=8470e38ac1d9f9bb6d8a4ee43724af452d080057
>
> instead. That fix was unnessary, the problem was in AB download mirror
> which has been fixed.
>

I did that, will send in an updated/rebased set.

Alex

--000000000000013c7b05c1f75997
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 5 May 2021 at 21:34, Khem Raj &lt;<a href=3D"mailto:raj.khem=
@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D=
"https://golang.org/dl/" rel=3D"noreferrer" target=3D"_blank">https://golan=
g.org/dl/</a>&quot;<br>
<br>
I think we should revert<br>
<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D8470=
e38ac1d9f9bb6d8a4ee43724af452d080057" rel=3D"noreferrer" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?id=3D8470e38ac1d9f9b=
b6d8a4ee43724af452d080057</a><br>
<br>
instead. That fix was unnessary, the problem was in AB download mirror <br>
which has been fixed.<br></blockquote><div><br></div><div>I did that, will =
send in an updated/rebased set.</div><div><br></div><div>Alex<br></div></di=
v></div>

--000000000000013c7b05c1f75997--
