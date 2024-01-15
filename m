Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F880C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 16:39:37 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.86187.1705336774574788455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 08:39:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YUG5Gcoz;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2043e721daaso5690260fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 08:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705336774; x=1705941574; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFGvVIzaYop7gXp2gzBQ3YCzQR3MRYllTB4+ifDX8j0=;
        b=YUG5GcozH/j7ohhEqQb9W/b5asuf0du46H0tAix1wr+Uh+8B/ZQbMtMtTPHTkhuiHi
         vxPz9pTNa0q9EBrEPqRna/mhqIqBV5BfPRqsHK5LL6CL0CxczLSUJkU4ibSrfpgqtMck
         V3lzjScwQVr0TppOgwZxc7nF3M5aw69Pqm9I8dIvu+WKjqGGzkFcYkJCnJqcgN/ohWut
         YE6OME+ldI1AhwbJIPdX09FRo3RCdaP3i9egaVWU71b2pWPIVP7upWmr0bPNWEG+Spox
         cgbTCxJvmb3y/8zMWLYzqiVldZAZevzZ1t7fczINV/xFJwQrypQ0IcPl6jURr+T51IyM
         Mxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705336774; x=1705941574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFGvVIzaYop7gXp2gzBQ3YCzQR3MRYllTB4+ifDX8j0=;
        b=JnJ4aND5GvMTT/UnFspwUO1e1P7i4P0dcsV4PSl/l+INshKHrMC7LXoC/5/JO7tezA
         0JMyyNoz4dhdEEG/J4iNS2VcY/hTW9QOUGWV0Y/oHepcLAPSoYM0wYHAz9FG+dM0CSOq
         nLWDSo1gGf7mwB4JLunSFpOwX088itsyr/43pR9tw4Cab0wDNvgnEdewVkf+6tsqOJto
         iI7q94aRB7DloAFs19PgNA4WkXNz7gqibQSfbG8SdfJthSmmKXCtx3q9Oks45//jc6kg
         8e+Uf3pgWLpW74L2xh3e53kHsIWEosaoedLrxmpKalLb6zXxEHkkYhLqQzUDxutOCeUo
         w5ng==
X-Gm-Message-State: AOJu0YwSCRcMxINOtdy8/4de02COvcF7YNf3RZ/y52HJieyikjjHjZ/O
	pxZ67vqTCM9JDV7IT4hQe3L6NOpl4P+blVtTaWM=
X-Google-Smtp-Source: AGHT+IHQWtivV8sjTukbRkd5HpFZq2KB+VRdyBkfHVnSZI5vLFy1V72EIXdo09T83fcYiRNQ5qD4UO9pjN6XCFy8QNU=
X-Received: by 2002:a05:6870:6b8b:b0:203:49b8:aac4 with SMTP id
 ms11-20020a0568706b8b00b0020349b8aac4mr8802369oab.54.1705336772969; Mon, 15
 Jan 2024 08:39:32 -0800 (PST)
MIME-Version: 1.0
References: <20240109192923.3183219-1-raj.khem@gmail.com> <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
In-Reply-To: <3B3DBDDB-9E17-431A-B3E8-DC8E072066FC@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Jan 2024 08:39:22 -0800
Message-ID: <CAMKF1so70hh_XBPgDrSjpfVx4=qv=WPBAe2bj2WScuDKZRmHjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] glib-networking: Fix ptest failures with
 openssl backend
To: Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000934925060efea89a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 16:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193687

--000000000000934925060efea89a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 5:41=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 9 Jan 2024, at 19:29, Khem Raj via lists.openembedded.org <raj.khem=3D
> gmail.com@lists.openembedded.org> wrote:
> > ++  #ifndef BACKEND_IS_OPENSSL
> > +   g_test_add ("/tls/" BACKEND "/connection/unclean-close-by-server",
> TestConnection, NULL,
> > +               setup_connection, test_unclean_close_by_server,
> teardown_connection);
> > ++  #endif
>
> Personally, unless upstream say =E2=80=9Cyes this test doesn=E2=80=99t wo=
rk on openssl
> yet=E2=80=9D and mark it as such, this is still a test failure that is fa=
iling for
> unknown reasons.
>
> We could #if 0 out every test that failed and rejoice in our 100% pass
> test cases but that would be a terrible idea, so why is this different?
>

This however is not the case here. Upstream has accepted the bug already
and marked it so as well. I am not sure why we should act more stricter in
accepting patches than upstream activity here.


> Ross

--000000000000934925060efea89a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jan 15, 2024 at 5:41=E2=80=AFAM Ross Bur=
ton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On 9 Jan 2024, at 19:29, Khe=
m Raj via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:g=
mail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br>
&gt; ++=C2=A0 #ifndef BACKEND_IS_OPENSSL<br>
&gt; +=C2=A0 =C2=A0g_test_add (&quot;/tls/&quot; BACKEND &quot;/connection/=
unclean-close-by-server&quot;, TestConnection, NULL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0setup_connecti=
on, test_unclean_close_by_server, teardown_connection);<br>
&gt; ++=C2=A0 #endif<br>
<br>
Personally, unless upstream say =E2=80=9Cyes this test doesn=E2=80=99t work=
 on openssl yet=E2=80=9D and mark it as such, this is still a test failure =
that is failing for unknown reasons.<br>
<br>
We could #if 0 out every test that failed and rejoice in our 100% pass test=
 cases but that would be a terrible idea, so why is this different?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This however is =
not the case here. Upstream has accepted the bug already and marked it so a=
s well. I am not sure why we should act more stricter in accepting patches =
than upstream activity here.=C2=A0</div><div dir=3D"auto"><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Ross</blockquote></div></div>

--000000000000934925060efea89a--

