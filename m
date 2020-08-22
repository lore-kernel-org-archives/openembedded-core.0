Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.145842.1598056382474427846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 17:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pjlqETTr;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: ka6sox@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id j15so1744292lfg.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nh/K+wWisXeuIWcTSZdRzwKlpCTYl9hjireXtZNlYCM=;
        b=pjlqETTrIDuLxIVHZK+fNN0IhVSZioGTh0BWWZ/d02fv003wA14Vr2xE8bZxoNzxfe
         v9oLv8UkxhCSKVjnt1F+4hl4mpNz9kR1LfJ+aL1noqZjlSobC4pGPKSeOci26WiGRuD1
         vXgUK+AW++GgxK1aIeegXDbosoh4nQX6w0y4Xzd1Ic7W9FyWaVqr5pnIHX2CJOrKOcvV
         HbacZpKVpMcnG1m6KY8pos9zKFz6JxfCY10ZCaBJkW2GRQ1KMfleGX+ebcKT+wZCQwHH
         QKb7LlciP3+MncTxOsCXiJmmolYWLvHvvJI040JZQ5SuZ4zmfZzeuegWfJqcMsFaRyoJ
         yIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nh/K+wWisXeuIWcTSZdRzwKlpCTYl9hjireXtZNlYCM=;
        b=cZs198/Ev2FX6Z3sfKPu/lLEOzxmAkzR4katGEofbltyiIfcmNWWM+9HD8QHGr5GzP
         2kYpOaCuptvL3CERJpWXr5h931QCoo/h3BWDBf7OW0P/mCY/c8+UEG6GDmDxQhMfZy6S
         u4cvr7lJ5QylgFhL9Tm+MVSAkJE6g0ScVZpq3KqYax8DqSZBgeTmmVEYNGCq5rJPB8Y1
         mRnHPVWHbnTb4pRY4h6kT1IQxT/J7JuUt9ZYJL5dqYexrvQWLAAzyrkmwTBBFJiqwFn2
         MntfhLkLT15CDDhJzK3JryX3xFMwPt0jkbOAMTcXn3AuFRx0/20dAXlSPO2EtpfPfHY4
         R+hg==
X-Gm-Message-State: AOAM5316v3uzuSopg/0TEUk3mSYGsNtfiXx2AAyl+Dn+2/SZEm9lIW1a
	ElMqB1ddR5R7wfAT2LCW3MmlAQYuTMEd30cHd+o=
X-Google-Smtp-Source: ABdhPJzkPXjEO7uQ6R8ir4sumw/BuiG7yf3i4kiCPcp8ybbBY1lE8kvIUX9FtoZsUWd5XQPzv4+sdwAE9PgD0u6FKJY=
X-Received: by 2002:a05:6512:3138:: with SMTP id p24mr2457159lfd.143.1598056380452;
 Fri, 21 Aug 2020 17:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
In-Reply-To: <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
From: "tom king" <ka6sox@gmail.com>
Date: Fri, 21 Aug 2020 17:32:48 -0700
Message-ID: <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
Subject: Re: [OE-core] cleansstate
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joe Slater <joe.slater@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e3549e05ad6c7e0b"

--000000000000e3549e05ad6c7e0b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What would be a use case for cleanstate?

Tom

On Fri, Aug 21, 2020 at 8:14 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-08-19 at 23:28 +0000, Joe Slater wrote:
> > This might be specific to the distro I am typically using (take a
> > guess) but I notice that cleansstate usually pauses at the 33% mark
> > for a significant amount of time.  I don=E2=80=99t think this used to =
be
> > quite as bad as it is now, but it is hard to remember.  Just an
> > observation that someone might be able to confirm/deny/explain.
>
> sstateclean iterates through all the sstate directories globbing for
> potential things to remove. If your sstate cache is large or remote
> (e.g. NFS), this will be slow.
>
> Note it doesn't remove just the current hash but any sstate for the
> given recipe.
>
> In normal use you should never be needing sstateclean.
>
> Cheers,
>
> Richard
>
>=20
>

--000000000000e3549e05ad6c7e0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What would=C2=A0be a use case for cleanstate?<div><br></di=
v><div>Tom</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Fri, Aug 21, 2020 at 8:14 AM Richard Purdie &lt;<a href=
=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Wed, 2020-08-19 at 23:28 +0000, Joe Slater wrote:<br>
&gt; This might be specific to the distro I am typically using (take a<br>
&gt; guess) but I notice that cleansstate usually pauses at the 33% mark<b=
r>
&gt; for a significant amount of time.=C2=A0 I don=E2=80=99t think this us=
ed to be<br>
&gt; quite as bad as it is now, but it is hard to remember.=C2=A0 Just an<=
br>
&gt; observation that someone might be able to confirm/deny/explain.<br>
<br>
sstateclean iterates through all the sstate directories globbing for<br>
potential things to remove. If your sstate cache is large or remote<br>
(e.g. NFS), this will be slow.<br>
<br>
Note it doesn&#39;t remove just the current hash but any sstate for the<br=
>
given recipe.<br>
<br>
In normal use you should never be needing sstateclean.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000e3549e05ad6c7e0b--
