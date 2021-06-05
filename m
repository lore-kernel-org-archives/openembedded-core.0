Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.15807.1622922471668498638
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 12:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CCNRbs4s;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id b1so5009114vsh.7
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 12:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XceB4AT/MXzlqynkeWq6s0Fu99VKzZZpcYJgS71SJxk=;
        b=CCNRbs4sgRDhtii80wlHiUVWC7mq4IEQGAp7EvphGscKun6DptKirGe27h4JKTPv7H
         bgQBLWQdafHcBeZ7wYqmQEq6CEeIbUNghACDqoGkSOM32Gi4OtGJF8+H/cS42mQT5PRJ
         BMS4siHTpgQMwpmbuCI6st9AolSszirBmZfLrFfD/w8GYYsKuDOEnTONLjA+2yoR8cmz
         5sFpLXqG7WLUMz+m2bLQShNYOwjT1RK5P8aD28Ww5LsinNyNNZ1sB7buees6F8KbkXNp
         DY2hn3xPzkbI6qn3pt31DjOeVPMye9co2NLTs5sA5gXyWq7cTIkEQOrlcX9rulzVxn66
         bRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XceB4AT/MXzlqynkeWq6s0Fu99VKzZZpcYJgS71SJxk=;
        b=bfC5lnYx2R2brDYjZHutwZcx2DvKYzh676eefFTuhkiwFh3sLt1nCfyLEE3kbeb4WO
         3HrGpqWmMtr9rPZ+5VfyOCXPWndhJJ82xhRrVReduzHUWZoVUBSb0fnzfVURRRDzPETY
         QBLs37xlGLbqmFpBU4wVX9Fim40wXaKgQSWft2xj5ro8o/i7QRyyPJwylGGtYPcb3x4W
         h2H4b0sQqib2AaqhHM0XqLH+rlM3GJTdeKuNB+DZipabRSpabPhJz3NFzPkneNNpr3iR
         p+PNfpyIE0mC220ex/GLR+bV/PgPVbg8MENfVU6nP9HAZIp232+hD75xyx6sEY1mpWr0
         3HZA==
X-Gm-Message-State: AOAM532R7jp+om5iQZJ76qMjpIeKab5qiAn2aPvcfjwtqaHGLjuVaydq
	g1ZT9fqsxu//f5qMY30VvJO6z8Bo/ZAxAas+90U=
X-Google-Smtp-Source: ABdhPJy3YvE4xCerVOyT1OIZMOUvXyDsQRshSoIuVNBYNZgRyu3yFmv38wI+ZibzGg0dBjS5AQ7awRFl1S4C7EZ7t4w=
X-Received: by 2002:a67:1502:: with SMTP id 2mr6038719vsv.54.1622922470878;
 Sat, 05 Jun 2021 12:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
 <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com>
 <f33e8c790fa4ef0364b91b91a514dd0ec308a008.camel@gmail.com>
 <CANNYZj_hsuFNQ7gC3txtGfW5A-X7_G9BCN54y9oAyhDj9_7Y1w@mail.gmail.com> <f55293fdc6d774eb27d155d779c702f65a70cf23.camel@gmail.com>
In-Reply-To: <f55293fdc6d774eb27d155d779c702f65a70cf23.camel@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 5 Jun 2021 21:47:39 +0200
Message-ID: <CANNYZj_=Z8bywdqp=nn+BbQV9tQ+=t=vfD44X-qYerQ46vR+1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta-skeleton: add a ptest example
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005ff37405c40a150b"

--0000000000005ff37405c40a150b
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Jun 2021 at 10:38, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> > What I'm getting at is that I'm not sure if this should be in oe-core
> > if nothing in oe-core or other public layers actually benefits from
> > this.
> >
> > A much stronger case would be to enable these reports in some existing
> > recipe, then extend the ptest infrastructure on the yocto autobuilder
> > to make good use of them.
>
> Right, my goal here is primarily to support application development.
> But we should not consider application development as a "weak case". It
> is probably the area where most companies using Yocto put the most
> effort into embedded device development. Yocto should therefore provide
> the best possible support.
> I don't know if there are packages in Yocto core that could benefit
> from using JUnit or similar reports. I also don't know how this would
> then be integrated with Buildbot. However, in the industry I see mostly
> test frameworks like googletest and auto-builders like Jenkins and
> GitLab CI that support rendering such reports.
>

From that perspective, yes. I guess it should be RP's call to take it or
not, maybe we need a third opinion.

Alex

--0000000000005ff37405c40a150b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Sat, 5 Jun 2021 at 10:38, Adrian Freihofer &lt;<a href=3D"mailto:=
adrian.freihofer@gmail.com">adrian.freihofer@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">&gt; What I&#39;m get=
ting at is that I&#39;m not sure if this should be in oe-core<br>
&gt; if nothing in oe-core or other public layers actually benefits from<br=
>
&gt; this.<br>
&gt; <br>
&gt; A much stronger case would be to enable these reports in some existing=
<br>
&gt; recipe, then extend the ptest infrastructure on the yocto autobuilder<=
br>
&gt; to make good use of them.<br>
<br>
Right, my goal here is primarily to support application development. <br>
But we should not consider application development as a &quot;weak case&quo=
t;. It<br>
is probably the area where most companies using Yocto put the most<br>
effort into embedded device development. Yocto should therefore provide<br>
the best possible support. <br>
I don&#39;t know if there are packages in Yocto core that could benefit<br>
from using JUnit or similar reports. I also don&#39;t know how this would<b=
r>
then be integrated with Buildbot. However, in the industry I see mostly<br>
test frameworks like googletest and auto-builders like Jenkins and<br>
GitLab CI that support rendering such reports.<br>
</blockquote><div><br></div><div>From that perspective, yes. I guess it sho=
uld be RP&#39;s call to take it or not, maybe we need a third opinion.</div=
><div><br></div><div>Alex<br></div></div></div>

--0000000000005ff37405c40a150b--
