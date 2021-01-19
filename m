Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.11114.1611064103810978919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 05:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20161025 header.b=EXliCVaE;
 spf=pass (domain: google.com, ip: 209.85.166.48, mailfrom: gmouse@google.com)
Received: by mail-io1-f48.google.com with SMTP id q2so37966026iow.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 05:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CMVl9aprrKu8bpe8JC0NTCQd+S3fnrEbm8chmuoV/DI=;
        b=EXliCVaE7vFnzk8JeS4d9gfuxXBMKBvgio3UZdKNr9HZFmXdUR0X8iwS4mjiXLK5Tu
         jkITgQguB3ZrfVb4Ri2wFpTR9ZjBN5144oBqnJLPz3fUDBo6UiZqu58x3Rf4x51+CfNN
         FGeaD/xeQyUXVxTurxRSQ0Ay2iwdOHEdJ38qXJbDqEjowZEfoo/Ubt9ri7tOhjlFVEvL
         KFz+SDl7XKlkrn22c/AB9i3NfEpWmepiMWeUA4ljBdYV1ZZG6Lk6MIAkYk9+0fNUYZAF
         SSgo4x4rmVjTDRq7fZ5sRchIq4mKVrSof2sA3Gn/cYW0Ve/9AiEgTveZb/oNOWrAtvLj
         rskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMVl9aprrKu8bpe8JC0NTCQd+S3fnrEbm8chmuoV/DI=;
        b=JGA2Bl/XenGpNeBYIINZRKkYtBGOixVFAEmmygZ0eKyWxqYTg0AkKQMg8N5GBHEaAm
         eDokMYh2j3rlCPjQwYYvE5lcDlH/0AGABadc6p5aiDj0Tv3FgFUD0vMdxqkH85HXBCQ0
         K+AtdkLPsgeIXo+B7RkKfr5xUzJQPyc+BAW7tYi7KHPtiPFFkBLXkH1Vbl0FR0uxYKdY
         m0+reN40U9+gRPIm+nFvE/SrGDtRyuIAgkBbKu/W/54aOmUp5ZYUkc4wJeVBff1y3txi
         Mv/UJUtUaup+Lb5hVG6Ri2TgQmYVdtXZpkehLf7yK+kEVOPH2OyEku4cawBcDbiGE4wA
         5ugQ==
X-Gm-Message-State: AOAM5314GF5FcuUNr9Qhi87crkhYkBQ5Q6xU/KWW3pXBPcDKqBUhMaKN
	RCt1CNqRSLHXpdlz8jdrCzT2RDODOn5h43Ew9HJwag==
X-Google-Smtp-Source: ABdhPJyDcSUllUnUrYOfSQ5rdmMRYk4qBcQNAQ3uVumRJ1ANN2Nno6WitGiXG8sWKhYybH5jzYSt5HHvCgdYoj0OepQ=
X-Received: by 2002:a6b:dc17:: with SMTP id s23mr2928914ioc.170.1611064103092;
 Tue, 19 Jan 2021 05:48:23 -0800 (PST)
MIME-Version: 1.0
References: <165A723B7A040876.29781@lists.openembedded.org>
 <CADVsX8-aLgbLwqT_zVAh3jBG11KrPMvGKR8Kpi087y75Ao__ow@mail.gmail.com> <7d05167fb80882dea83fb8c4ec0da8f28a61243a.camel@linuxfoundation.org>
In-Reply-To: <7d05167fb80882dea83fb8c4ec0da8f28a61243a.camel@linuxfoundation.org>
From: "Anton Kachalov" <rnouse@google.com>
Date: Tue, 19 Jan 2021 14:48:11 +0100
Message-ID: <CADVsX8_hASp4VjXO0Dk3HmLW3d6TdWiDzzZHdQfAzRRCBz1KAw@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH] rootfs: add option to allow delayed postinsts on read-only rootfs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093ad9305b94117aa"

--00000000000093ad9305b94117aa
Content-Type: text/plain; charset="UTF-8"

Hi, Richard.

Thanks! I've expected some kind of ack :)

On Tue, 19 Jan 2021 at 13:51, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2021-01-19 at 12:39 +0100, Anton Kachalov via
> lists.openembedded.org wrote:
> > Ping on the patch
>
> It merged a couple of days ago:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=49c4fdcb884057c0fc713925c8040e36fd26af8d
>
> ?
>
> Cheers,
>
> Richard
>
>

--00000000000093ad9305b94117aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard.<div><br></div><div>Thanks! I&#39;ve expected =
some kind of ack=C2=A0:)</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 19 Jan 2021 at 13:51, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, 2021-01-19 at 12:39 +0100, Anton Kachalov via <a h=
ref=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">=
lists.openembedded.org</a> wrote:<br>
&gt; Ping on the patch<br>
<br>
It merged a couple of days ago:=C2=A0<br>
<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster-nex=
t&amp;id=3D49c4fdcb884057c0fc713925c8040e36fd26af8d" rel=3D"noreferrer" tar=
get=3D"_blank">http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=3Dmaster=
-next&amp;id=3D49c4fdcb884057c0fc713925c8040e36fd26af8d</a> <br>
<br>
?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000093ad9305b94117aa--
