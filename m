Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
 by mx.groups.io with SMTP id smtpd.web08.1528.1629570207707355835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 11:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RzLFwu+2;
 spf=pass (domain: gmail.com, ip: 209.85.217.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f46.google.com with SMTP id d16so8323013vsf.12
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2HKmwcc1MAzNiuAgDJUETG8gWhs2nBSTax8lITP4zQ=;
        b=RzLFwu+2o9d99+sJV/19yuYVnXAlzIzH0GYedGRrVIeIX8rD8tkKAGoZ6vessfoE0p
         2rlRS+iecXWJ0bgQLFB4rUMmNBTAPe0onzEXqo502d8MYALh0ZkhCnBfBQx3vQDREq+G
         TJsiBE7g+2OUgMAb6GWLqmrX1xWguhbr38iP9ggx/mqS6dZw6Wm3FJzUXrJwNf7Ndc7W
         kl6Ae9Qz8l7sP/rQ9+0AiCvMgmsMOoY/EbwijBza2EHmZtQoCnM6pROepnl6eiClz4RK
         YFIqH4NPoEPqVi+ZttMniQOO9ogkmyAGwhgqz3b4mwLFr5gPWnLQ0z5L296hBUoyu1oQ
         6q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2HKmwcc1MAzNiuAgDJUETG8gWhs2nBSTax8lITP4zQ=;
        b=nMHrTDb+B+Q6va3WgDQZ1nXNDvxDyaXAoOECafW+cehYi6FPRGGR62zorx/Jk7q82/
         CiHXDPeT+cLmDr6UzPWU/jGliVtG5dZQtHYlHxREkMWRmYkMNk7FquN9Q0VBLIbmgIcs
         E5BvuX5mmBRZ6Z5CfQuUOj+d3h1jdb3BGEYXBCrHLYgUYNJaYeaKXgHEB7s/x+z9a25U
         Qa4c2AnfkS0DvrzTeDuWEmGgBmbV5u9DtLPBPZbjYaZj9Ci4Ygh7WLioAAFdISiRKIYm
         ObO9q/S3np+pSn9cAFUrr789owAuOVtQOjhMXbwCYgRLwdshr/OscPQamaF+cEtPOZV0
         qo3Q==
X-Gm-Message-State: AOAM531UBuN7+VxjbDvMOI4eDnnl1p3quNWC/0TEL2aZogsz3r8HnRry
	T80JyXJl3iT3KaH3IQYxP+257L1iYu2anRvjXro=
X-Google-Smtp-Source: ABdhPJy726qAQM8R1HZ45UIYtYmN3vLCKmSqB5OWCajaY+CjlTSpgQ/gTQQwrlv/FY1NHkrkwnfMthClDjbXd2gF5q8=
X-Received: by 2002:a67:844:: with SMTP id 65mr20296959vsi.20.1629570206860;
 Sat, 21 Aug 2021 11:23:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
 <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
 <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
 <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
 <CANNYZj8R=FhyEZ9kqnDPb9x-NYYOJOiaFimR2EJN1uoP2wbFsw@mail.gmail.com> <1525a52d4968846b8a95e2db1ed2aa6230d448b9.camel@linuxfoundation.org>
In-Reply-To: <1525a52d4968846b8a95e2db1ed2aa6230d448b9.camel@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 21 Aug 2021 20:23:15 +0200
Message-ID: <CANNYZj9aQZyKrCKK-f6=DzjjQQAy=4DmkC=yTrxfqbtMBx-Ccg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000510a3e05ca15e12a"

--000000000000510a3e05ca15e12a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 21 Aug 2021 at 16:46, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2021-08-21 at 14:17 +0200, Alexander Kanavin wrote:
> > Then let=E2=80=99s just go for it.
>
> It isn't that simple. There are member organisations who care about this
> and
> would not be happy at that approach. We're probably talking a load of
> meetings
> and discussion and a need to provide documentation/solutions and debug
> issues.
> There will be a request to do this with a notice period, probably a coupl=
e
> of
> years. I suspect a chunk will fall to me as I'm the only person officiall=
y
> able
> to have tasks assigned and nobody else will want to do it. I guess that i=
s
> why I
> end up fixing it as there are other things that need the time more
> urgently.
>

Is the following realistic?
- meta-gpl2 is maintained in master builds until the next LTS is out in
April 2022
- thereafter it is maintained only in that LTS release, until (at least)
April 2024
- if, at that point, someone still has products where the bash problem is
not resolved,
it is not unreasonable to ask that they copy the old bash recipe to their
private layer
and maintain it there for themselves.


> > I think there are enough examples on how to make gpl3 free images
> without it,
> > and mbition has a full infotainment build based on recent master with n=
o
> gpl3
> > and no meta-gpl2. It=E2=80=99s doable and highly overdue.
>
> That doesn't solve the bash issue. Yes, it works if you can remove any ba=
sh
> script from your target image.
>

I suspect the problem becomes easier once member organizations enforce
no-gpl
only for the images that ship to customers with the HW. Test and developer
images that never leave
the organization or its subcontractors (that can reflash the target HW) can
do as they please.

Alex

--000000000000510a3e05ca15e12a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 21 Aug 2021 at 16:46, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Sat, 2021-08-21 at 14:17 +0200, Alexander Kanavin wrote:<br>
&gt; Then let=E2=80=99s just go for it.=C2=A0<br>
<br>
It isn&#39;t that simple. There are member organisations who care about thi=
s and<br>
would not be happy at that approach. We&#39;re probably talking a load of m=
eetings<br>
and discussion and a need to provide documentation/solutions and debug issu=
es.<br>
There will be a request to do this with a notice period, probably a couple =
of<br>
years. I suspect a chunk will fall to me as I&#39;m the only person officia=
lly able<br>
to have tasks assigned and nobody else will want to do it. I guess that is =
why I<br>
end up fixing it as there are other things that need the time more urgently=
.<br></blockquote><div><br></div><div>Is the following realistic?<br></div>=
<div>- meta-gpl2 is maintained in master builds until the next LTS is out i=
n April 2022</div><div>- thereafter it is maintained only in that LTS relea=
se, until (at least) April 2024<br></div><div>- if, at that point, someone =
still has products where the bash problem is not resolved,</div><div>it is =
not unreasonable to ask that they copy the old bash recipe to their private=
 layer</div><div>and maintain it there for themselves.<br></div><div>=C2=A0=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I think there are enough examples on how to make gpl3 free images with=
out it,<br>
&gt; and mbition has a full infotainment build based on recent master with =
no gpl3<br>
&gt; and no meta-gpl2. It=E2=80=99s doable and highly overdue.<br>
<br>
That doesn&#39;t solve the bash issue. Yes, it works if you can remove any =
bash<br>
script from your target image.<br></blockquote><div><br></div><div>I suspec=
t the problem becomes easier once member organizations enforce no-gpl <br><=
/div><div>only for the images that ship to customers with the HW. Test and =
developer images that never leave</div><div>the organization or its subcont=
ractors (that can reflash the target HW) can do as they please.</div><div><=
br></div><div>Alex<br></div></div></div>

--000000000000510a3e05ca15e12a--
