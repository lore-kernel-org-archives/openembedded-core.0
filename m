Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.35.1622750444211870262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 13:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tAYfb56/;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id z15so3656084vsn.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QwoUMzk1S7uCkpxN3xYIPKnnVLIhF/5JQQJfiqVHyOI=;
        b=tAYfb56/gOptr5355Yoe/sK99tdzdMY1s3zyF3GXcN5kzXVUwMWzhl+o1SXSOvDcIX
         Lrj2rdnLCZBX1LZfRfpLo/G+rD5agBmPGm5WjlNcLkIH/udfUeLISPof/TdRZ8SxKqks
         i+eijHX7lJCQL0GNxIE3rcyph9WAlfHz4ghX1BYCTGU+JLBilB1FZyqsUp2JfnnM5l+V
         l5aIb0s1Nf08Tke4slKy0C0qHm4xYSiJ41qx7hjsKJmPoPTZDtwxhzeA6urPyJcYmCs4
         rVe/42DbYfhVEd8hwW7LWC0mfhBO5LDK0BHLqe4cOe3t+RVZ9za5hF5Mtl/+9vpi77Qd
         DmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QwoUMzk1S7uCkpxN3xYIPKnnVLIhF/5JQQJfiqVHyOI=;
        b=N4Gmoju8oyHv6FpDzPXyQOBHi3TYg0GD2P3HHb1ClZhd2uTcx8akCErxuPBRJU6oN0
         SOsJ1Z/icFIGc/EhPaGzx557Xsc8s8u4ghcL5ZhkyEoDVfUawAZEKVirevz0DGXDGiwj
         MzmLm+gHEd0ORhhBf8RI7iBrHvZCRH6LjIKDzDAxw4XhsrbuEtg0f2KWIv10pgiDA7kD
         3tZ213XZ6755DlL4hXXcWyQ+LRvonfcrT466xeFoJF1lfSD6UACpwCXt35Altw+GRh9J
         YoUXpr0cYfpIrJDEj9n29wz+WEHdlKRn1IGo2m1qfzgASicPvROJXoKt72IVKsnVaWrz
         f43w==
X-Gm-Message-State: AOAM533KH51qJxOyI1fUZiiW/Y+cyhEGUHfwoRes5Np0cBR6eYobYX0P
	k9+IVrIMkvXrU/cNWHYjx8JNJHfSPCQKkqZamJ8=
X-Google-Smtp-Source: ABdhPJztLqjyHb6B60LsSMfQ18df9u7ATP/e6hzRAnsEZoWqZGY/4kJ7zPGv+y7sitjfay5HKmRJTVKQ6FZHWcJwB3o=
X-Received: by 2002:a05:6102:3203:: with SMTP id r3mr202707vsf.20.1622750443359;
 Thu, 03 Jun 2021 13:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
 <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com> <f33e8c790fa4ef0364b91b91a514dd0ec308a008.camel@gmail.com>
In-Reply-To: <f33e8c790fa4ef0364b91b91a514dd0ec308a008.camel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Jun 2021 22:00:31 +0200
Message-ID: <CANNYZj_hsuFNQ7gC3txtGfW5A-X7_G9BCN54y9oAyhDj9_7Y1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta-skeleton: add a ptest example
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc541b05c3e20746"

--000000000000bc541b05c3e20746
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jun 2021 at 21:53, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> On Thu, 2021-06-03 at 19:46 +0200, Alexander Kanavin wrote:
> > Rather than construct an artificial example, is there an actual
> > existing ptest in oe-core that can be extended to do this junit xml
> > stuff?
> So far there is no test which creates xml reports and I don't know if
> oe-core would have interest in something like that.
>
> In general, a minimalist ptest example could be quite useful. I get
> asked about it from time to time. However, I see your point that the
> example is somewhat artificial. What do you mean if I replace the xml
> with a simple "example report" for example?
>

What I'm getting at is that I'm not sure if this should be in oe-core if
nothing in oe-core or other public layers actually benefits from this.

A much stronger case would be to enable these reports in some existing
recipe, then extend the ptest infrastructure on the yocto autobuilder to
make good use of them.

Alex

--000000000000bc541b05c3e20746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 3 Jun 2021 at 21:53, Adrian Freihofer &lt;<a href=3D"mailto:=
adrian.freihofer@gmail.com" target=3D"_blank">adrian.freihofer@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, 2021-06-03 at 19:46 +0200, Alexander Kanavin wrote:<br>
&gt; Rather than construct an artificial example, is there an actual<br>
&gt; existing ptest in oe-core that can be extended to do this junit xml<br=
>
&gt; stuff?<br>
So far there is no test which creates xml reports and I don&#39;t know if<b=
r>
oe-core would have interest in something like that.<br>
<br>
In general, a minimalist ptest example could be quite useful. I get<br>
asked about it from time to time. However, I see your point that the<br>
example is somewhat artificial. What do you mean if I replace the xml<br>
with a simple &quot;example report&quot; for example?<br></blockquote><div>=
<br></div><div>What I&#39;m getting at is that I&#39;m not sure if this sho=
uld be in oe-core if nothing in oe-core or other public layers actually ben=
efits from this.</div><div><br></div><div>A much stronger case would be to =
enable these reports in some existing recipe, then extend the ptest infrast=
ructure on the yocto autobuilder to make good use of them.</div><div><br></=
div><div>Alex<br></div></div></div>

--000000000000bc541b05c3e20746--
