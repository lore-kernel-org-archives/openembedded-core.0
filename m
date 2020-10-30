Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web09.14760.1604069107096404922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 07:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.ro header.s=google header.b=JbyJlQe8;
 spf=none, err=SPF record not found (domain: gherzan.ro, ip: 209.85.219.193, mailfrom: andrei@gherzan.ro)
Received: by mail-yb1-f193.google.com with SMTP id a12so5281398ybg.9
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gherzan.ro; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VNODcYn/uOScVOaWs+zzjLcXYldmiXuO0r4E776ugkw=;
        b=JbyJlQe8FolY33TsfSlEGGHVFTNRLZpg1R9i8AV4RdUfC7jspPWUFML/Hv9rGIOCTv
         fxaAVWNTVhAPsCEPbzo2ORXsZL1CkBRPjoHdzqvrwJy9NxKzMQmM+6CK4HeMATV63E4C
         CCrgFfzTO80W8QAtm794+HsyhKI4FSFPkqvsWoVqBqwB6n98zRoJ9yERlc99gdIfBzYy
         n0lZ13IkfXtUc5O5dX8BwBYmomHSidektMbybevzeqszBgxr9klW6WBxqhVjkk8pI51/
         NP95I6OnEfqpS4+AeOJdTiND6uxvqJazcWGVjUpMLSiT0PjbQ/kVz3ygXzJ/2GaYTqOT
         YX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VNODcYn/uOScVOaWs+zzjLcXYldmiXuO0r4E776ugkw=;
        b=CQhYdA54vwt5ud//RqkQbS9lC3GQKAbcIKrb4NiGge4uNTVYh5H3U1Nbz3mpgcul0S
         FG63M+jzFh/Y88h1hyAnlvN2J2C4WA5QI5zfLkBWi0CGjgdmfeX7J9OA+RdbHlBV1OpZ
         k+MkhCJlB7S+NeCGNQwN9EuRNJMONa6be7lw0BGESKRTIq1b0noP3G1cGtMShzvVFEqv
         vTePfJz0rXS0Q0MU3X5Lx9gWWhtEulFgnWqaGL6Kvs7N3y0Gzv2oKP9Ei8F8puKLHzPw
         hLUgjhycYthaWyYpyLD/s8nNyxkC9NC5Rm6hHoA4J1X5Ad/P3zQLESlcTWBL35Y1a0LY
         HLdw==
X-Gm-Message-State: AOAM531AOXWaVabz8mTOLH7K3Gpk5s3b/aYZiTlFpU0CvYgNOONc82HA
	AcCznyH5Nw+bJzDLhe8vgAqIHpYbB6zG9oVSferWLA==
X-Google-Smtp-Source: ABdhPJx+BqjUGl7EOnPWFgoCrl/HImxk9EPkbChfkW6q7TPu9HiOj0/iNEtigr01ZEJVqsvs6qMiT8vUGx+jnlJfniE=
X-Received: by 2002:a25:146:: with SMTP id 67mr4207535ybb.156.1604069106348;
 Fri, 30 Oct 2020 07:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201030054703.422319-1-raj.khem@gmail.com> <CAK18fxHc0AObD7MFbvrY6teGr5VqoFkTck=NBfCbj2V47dZYxg@mail.gmail.com>
 <CAMKF1so-90wzS36YHJhzhdCBVtf=Uz3m9BxzmRghi_6EV0sksw@mail.gmail.com>
In-Reply-To: <CAMKF1so-90wzS36YHJhzhdCBVtf=Uz3m9BxzmRghi_6EV0sksw@mail.gmail.com>
From: "Andrei Gherzan" <andrei@gherzan.ro>
Date: Fri, 30 Oct 2020 14:44:29 +0000
Message-ID: <CAK18fxFoKB1Jx6cDPqybHBUJjWQwwRUaODcsdhO-rZEHLCkdRQ@mail.gmail.com>
Subject: Re: [PATCH] musl: Add .file directive in crt assembly files
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000478b6605b2e47138"

--000000000000478b6605b2e47138
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Oct 30, 2020 at 2:42 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Oct 30, 2020 at 5:07 AM Andrei Gherzan <andrei@gherzan.ro> wrote:
> >
> >
> > On Fri, Oct 30, 2020 at 5:47 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> This helps linker to noot emit absolute paths into .debug_line sections
> >> of liked binaries and libraries and therefore make them reproducible
> >>
> >> Reported-by: Andrei Gherzan <andrei@gherzan.ro>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../musl/0001-crt-Add-.file-directive.patch   | 300 ++++++++++++++++++
> >>  meta/recipes-core/musl/musl_git.bb            |   1 +
> >>  2 files changed, 301 insertions(+)
> >>  create mode 100644
> meta/recipes-core/musl/musl/0001-crt-Add-.file-directive.patch
> >
> >
> > Tested - works as expected. One small NIT to maintain consistency with
> the Glibc fix: ".S" vs ".s".
> >
>
> .file directive is to specify the name of the file so it should match
> it. In glibc the files are called .S because they are preprocessed
> through gcc
> where as the musl files are pure asm files.
>

Makes sense. Scratch that.

--
Andrei Gherzan

--000000000000478b6605b2e47138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 30, 2020 at 2:42 PM Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Oct 3=
0, 2020 at 5:07 AM Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro" =
target=3D"_blank">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Oct 30, 2020 at 5:47 AM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; This helps linker to noot emit absolute paths into .debug_line sec=
tions<br>
&gt;&gt; of liked binaries and libraries and therefore make them reproducib=
le<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.r=
o" target=3D"_blank">andrei@gherzan.ro</a>&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../musl/0001-crt-Add-.file-directive.patch=C2=A0 =C2=A0| 30=
0 ++++++++++++++++++<br>
&gt;&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D=
"noreferrer" target=3D"_blank">musl_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;&gt;=C2=A0 2 files changed, 301 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta/recipes-core/musl/musl/0001-crt-Add-=
.file-directive.patch<br>
&gt;<br>
&gt;<br>
&gt; Tested - works as expected. One small NIT to maintain consistency with=
 the Glibc fix: &quot;.S&quot; vs &quot;.s&quot;.<br>
&gt;<br>
<br>
.file directive is to specify the name of the file so it should match<br>
it. In glibc the files are called .S because they are preprocessed<br>
through gcc<br>
where as the musl files are pure asm files.<br></blockquote><div><br></div>=
<div>Makes sense. Scratch that.<br></div><div><br></div><div><div>--</div>A=
ndrei Gherzan <br></div></div></div>

--000000000000478b6605b2e47138--
