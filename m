Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC48C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 21:15:18 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.16619.1634678118227734056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 14:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GqalEPZH;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id r2so20541370pgl.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UVfLRTBmFTY5PvCCvPCQq7DIWc3TT4aYpSRnM6o4/q4=;
        b=GqalEPZHhAkfn1MX3bzSnMYBNvwait6ih/yKKvD9GWw8OC9j4uNJ4QGy0RXIT/dOsM
         GLFQislhtiOivNwZToi976pn1vEDxEsdfSHoZhijapFcXNUpBDIco3qSn9k1qM5uRWql
         gKVDkz9Mh+rvon2vaFdQrdcvYVfi6EEt1uFWnRvIAu2gpUF9BzvzplrN7Rse5onGC33n
         Nu+bMv3L7spcEvhyCWLVL4U2iK3wHMm9herxfYI0NiFaCRrv28k05kxhFo3MB+yQG4F+
         /oxlKR5PQ5Nvts+qPa3PpUn9a7qaByLhQ+jSh52CgzfRtJdgU0NudjrTyPYx88bTyNQo
         +YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UVfLRTBmFTY5PvCCvPCQq7DIWc3TT4aYpSRnM6o4/q4=;
        b=SbXbxnEGj3/MCXxnXzK9+9jHgTBNE+4yZ4ke1ye/QOfK2lgrEofAFFYepE5zZDZZjV
         B17NRlQA9OuxLlky3BoJ92DLeP4AmwofP0ekTeuSNSWeAdOKW2dDciOd7yrZe/NXNP3Y
         Dld9UAXmOAV8QLdGxGnfBfQAp72JTUQQ6fTbsp4hZx6AZvAPZo7uAApqw154twRnYK3a
         btKLMvN5EMmF+ebPmTk40pKhyoJ0D5S5m/wbTtj2GFrvzvcTjvGCU36s+cYD58fXVfiY
         WEKU+j7FQjlZe/MqxCs2w8r5ZL/CgOyNOHd13PXcrxixontN4zU+OVD6xHtg9PtUNYHR
         /7HA==
X-Gm-Message-State: AOAM531lZexPC9UtEiluzfn22hOiY9xCRrw6vCCxfK/svzjaNLqaQsR2
	AeVtT3gTwlXE5f2Q3gCqpU4eh1RtbkC33oAuOzU=
X-Google-Smtp-Source: 
 ABdhPJyCh8aukm/e43gmFC51HDpyvM4+Dd7Vyojj1EgmzghYtVlcP5srmt4cRd73KsDr3y+Ttvdij9r/VtB4nhGuah0=
X-Received: by 2002:aa7:9f46:0:b0:44c:7912:9b2e with SMTP id
 h6-20020aa79f46000000b0044c79129b2emr2186398pfr.11.1634678117794; Tue, 19 Oct
 2021 14:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211019124332.14158-1-Martin.Jansa@gmail.com>
 <fb4a068fa1dc4786be0fb969392d910f@axis.com>
In-Reply-To: <fb4a068fa1dc4786be0fb969392d910f@axis.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 19 Oct 2021 23:15:06 +0200
Message-ID: 
 <CA+chaQe=A4ua3r33xgGjCczNCfsk_NdRUg5dsZH3X59PJc+bjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] boost: allow searching for python310
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000088881b05cebb28e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 21:15:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157246

--00000000000088881b05cebb28e7
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 19, 2021 at 10:59 PM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > +
> > +-  if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9])$")
> > ++  if("${comp}" MATCHES
> "^(python|numpy|mpi_python)([1-9])([0-9][0-9]?)$")
>
> Why not make that:
>
>   if("${comp}" MATCHES "^(python|numpy|mpi_python)([1-9])([0-9]+)$")
>
> or we will have the same problem when Python 3.100 comes around. ;)
> Though I guess things will get interesting at version 10.0 as well...
>

It was already merged upstream, if you want to improve it, you should
probably start there.

and similar regexp unfortunately isn't only in boost, I've found couple
recipes failing in similar fashion or installing their files to
/usr/lib/python3.1 because who cares about 2 digit minor versions..

Most of these functions will fail in various ways with python-4 already and
we can only hope that python-2 support will be completely gone before that
:).

Cheers,

--00000000000088881b05cebb28e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Oct 19, 2021 at 10:59 PM Peter Kj=
ellerstedt &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjeller=
stedt@axis.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&gt; +<br>
&gt; +-=C2=A0 if(&quot;${comp}&quot; MATCHES &quot;^(python|numpy|mpi_pytho=
n)([1-9])([0-9])$&quot;)<br>
&gt; ++=C2=A0 if(&quot;${comp}&quot; MATCHES &quot;^(python|numpy|mpi_pytho=
n)([1-9])([0-9][0-9]?)$&quot;)<br>
<br>
Why not make that:<br>
<br>
=C2=A0 if(&quot;${comp}&quot; MATCHES &quot;^(python|numpy|mpi_python)([1-9=
])([0-9]+)$&quot;)<br>
<br>
or we will have the same problem when Python 3.100 comes around. ;)<br>
Though I guess things will get interesting at version 10.0 as well...<br></=
blockquote><div><br></div><div>It was already merged upstream, if you want =
to improve it, you should probably start there.</div><div><br></div><div>an=
d similar regexp unfortunately isn&#39;t only in boost, I&#39;ve found coup=
le recipes failing in similar fashion or installing their files to /usr/lib=
/python3.1 because who cares about 2 digit minor versions..</div><div><br><=
/div><div>Most of these functions will fail in various ways with python-4 a=
lready and we can only hope that python-2 support will be completely gone b=
efore that :).</div><div><br></div><div>Cheers,</div></div></div>

--00000000000088881b05cebb28e7--

