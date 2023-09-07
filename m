Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C8EEC8736
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 14:59:42 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.15061.1694098779384458416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Sep 2023 07:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TVjGfnwl;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7a7d7a3d975so94747241.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694098778; x=1694703578; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bRiUme9Bdb33YqwouZ2jskhw47/SANcajETSWz+FKXM=;
        b=TVjGfnwlyH5HYG8YlG3b9qRvfi/AWqCn2d2cdSF0VugWoLdNgyA6A9bx//K5vyM2Lf
         +Z9V94hQmeMaXs1H1JAwPhlXTZUWmJ2N/exutHTKiv5RR0y4tQ9LBm5/Z5OgfweAC7/T
         EMQNxsN+LAHtPjiiRgg7MLZrI16lHGYeflCDZvd+K/9nb2pCMGdOZNKuJMwD9dYyAAHo
         cT1SHMJZKT3l3qNz0xb8AijhGwaalAPGtWe09QVEGG2YRIGtt1hzIbQYwH3Y89gn5FWS
         DvdxQSR7RsZt9SsMD2MlzIY7U2xIwx7e5TGgnKWPW/dJ0QZakJC81fbcAmJL0cWOM5lG
         TNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694098778; x=1694703578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRiUme9Bdb33YqwouZ2jskhw47/SANcajETSWz+FKXM=;
        b=bJ+GJ0/mxECQz2oWuj/ZTF4X/BKtuYwE4O1oz6QpUNgMNNtwuPnzIIyFC6+M2t/1Et
         58+gIC829MMKuSoq+YVbLvDBctfivE43+9Zl9E8rJ/0y3JCOfWBzG3AaDrVabGBYP2Ze
         yXkZtanyjqxXn4whvnmF1Yc1GnLKYpyrrtsRPmqcj33TaqfeXck/4h6jTpQaDyaG2i+y
         29KjJaBJJaNtQvGWVYBQ/34/FL1zYla6EDMCbh11tuwFCUfDqOD4xqUVv98+Pxt9M+wu
         3vcBP9SMbCHEeApEkXBQsm4jZPnnXgBqog4/W9qgMjUfA6+zsIW7oxpNDoYBd2JDoxi8
         pWRQ==
X-Gm-Message-State: AOJu0YwKu9aioGCgI3TbsGuwEwQmdsdKnDjrFUK+Itee7LgYQ+wD3BLj
	PQrkgRDeX2I9DezT5aoI0qniUk8ps1MEpreMz8o=
X-Google-Smtp-Source: AGHT+IGoTaL+5buNcJHMrq6tPqucrlQXFc6CJUf+j+QuE9exRiZiYQDYxgU9dBe6icjQ7SGqAYH82R7VyhRXeMwhHBM=
X-Received: by 2002:a67:ce8c:0:b0:44e:8e28:2852 with SMTP id
 c12-20020a67ce8c000000b0044e8e282852mr7537716vse.10.1694098778387; Thu, 07
 Sep 2023 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230829143541.3837919-1-jose.quaresma@foundries.io> <bf604882ff482c21044429a08a31fe07efc5b0e7.camel@linuxfoundation.org>
In-Reply-To: <bf604882ff482c21044429a08a31fe07efc5b0e7.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 7 Sep 2023 15:59:27 +0100
Message-ID: <CANPvuRmWb+TtJoQ__9nWa9dPmTGNaMKob8pLAL-+tok72UWOvA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] pybootchartgui: also match subtasks of the main ones
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000e676bd0604c61bd9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Sep 2023 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187387

--000000000000e676bd0604c61bd9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
7/09/2023 =C3=A0(s) 15:16:

> On Tue, 2023-08-29 at 14:35 +0000, Jose Quaresma wrote:
> > This will match other deviation subtask of the same main task,
> > a couple of them can be found on oe-core layer:
> >  do_compile_kernelmodules
> >  do_compile_ptest
> >  native_add_do_populate_sysroot_deps
> >  do_package_qa
> >  cmake_do_configure
> >  setuptools3_do_configure
> >  cargo_common_do_configure
> >  python_pyo3_do_configure
> >  python_setuptools3_rust_do_configure
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++---------
> >  1 file changed, 9 insertions(+), 9 deletions(-)
> >
> > diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py
> b/scripts/pybootchartgui/pybootchartgui/draw.py
> > index 3d1ff695c1..2beb3c7c67 100644
> > --- a/scripts/pybootchartgui/pybootchartgui/draw.py
> > +++ b/scripts/pybootchartgui/pybootchartgui/draw.py
> > @@ -661,20 +661,20 @@ def render_processes_chart(ctx, options, trace,
> curr_y, width, h, sec_w):
> >
> >              #print("proc at %s %s %s %s" % (x, y, w, proc_h))
> >              col =3D None
> > -            if task =3D=3D "do_compile":
> > +            if "_setscene" in task:
> > +                col =3D WHITE
> > +            elif "do_compile" in task:
> >                  col =3D TASK_COLOR_COMPILE
> > -            elif task =3D=3D "do_configure":
> > +            elif "do_configure" in task:
> >                  col =3D TASK_COLOR_CONFIGURE
> > -            elif task =3D=3D "do_install":
> > +            elif "do_install" in task:
> >                  col =3D TASK_COLOR_INSTALL
> > -            elif task =3D=3D "do_populate_sysroot":
> > +            elif "do_populate_sysroot" in task:
> >                  col =3D TASK_COLOR_SYSROOT
> > -            elif task =3D=3D "do_package":
> > -                col =3D TASK_COLOR_PACKAGE
> > -            elif task =3D=3D "do_package_write_rpm" or \
> > -                     task =3D=3D "do_package_write_deb" or \
> > -                     task =3D=3D "do_package_write_ipk":
> > +            elif "do_package_write" in task:
> >                  col =3D TASK_COLOR_PACKAGE_WRITE
> > +            elif "do_package" in task:
> > +                col =3D TASK_COLOR_PACKAGE
> >              else:
> >                  col =3D WHITE
> >
>
> I'm a bit torn on this as the patch changes the approach of the code.
>
> Currently, the tasks are marked without any fuzz, i.e. it matches
> do_compile alone. The code is entirely consistent in that all the other
> areas match specific tasks too.
>
> After the change you're changing the meaning to "any compile task"  and
> "any configure task".
>

Yeah that was my intention and they still be consistent by color but now
matching a sequential group of tasks:

"any configure task" -> "any compile task" -> "any package task" -> "any
package write task" -> "do_populate_sysroot"

and in this way it is easier to identify the color patterns of the above
groups,
currently we get a couple of white bars for the majority of the tasks.


> I'm not entirely convinced this is a good thing. Should do_package
> match do_package_qa for example? Those are quite different. I think
> we're swapping something which is currently at least quite clear for
> something which is very fuzzy and not easy for the user to understand
> without looking at the code :/.
>

I can rework the patch to have the same colors as before with more new
colors
for the new tasks I added but with many colors It will be harder to
understand.

Another option can be just group the configure and compile tasks
as these usually do the same thing as the ones alone.

Anyway feel free to drop this patch since no serious problem is being fixed
and
it would be more the usability that would be affected.

Jose


> Cheers,
>
> Richard
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e676bd0604c61bd9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia quinta, 7/09/2023 =C3=A0(s) 15:16:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Tue, 2023-08-29 at 14:35 +0000, J=
ose Quaresma wrote:<br>
&gt; This will match other deviation subtask of the same main task,<br>
&gt; a couple of them can be found on oe-core layer:<br>
&gt;=C2=A0 do_compile_kernelmodules<br>
&gt;=C2=A0 do_compile_ptest<br>
&gt;=C2=A0 native_add_do_populate_sysroot_deps<br>
&gt;=C2=A0 do_package_qa<br>
&gt;=C2=A0 cmake_do_configure<br>
&gt;=C2=A0 setuptools3_do_configure<br>
&gt;=C2=A0 cargo_common_do_configure<br>
&gt;=C2=A0 python_pyo3_do_configure<br>
&gt;=C2=A0 python_setuptools3_rust_do_configure<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 scripts/pybootchartgui/pybootchartgui/draw.py | 18 +++++++++----=
-----<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/scripts/pybootchartgui/pybootchartgui/draw.py b/scripts/p=
ybootchartgui/pybootchartgui/draw.py<br>
&gt; index 3d1ff695c1..2beb3c7c67 100644<br>
&gt; --- a/scripts/pybootchartgui/pybootchartgui/draw.py<br>
&gt; +++ b/scripts/pybootchartgui/pybootchartgui/draw.py<br>
&gt; @@ -661,20 +661,20 @@ def render_processes_chart(ctx, options, trace, =
curr_y, width, h, sec_w):<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #print(&quot;proc at %=
s %s %s %s&quot; % (x, y, w, proc_h))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D None<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if task =3D=3D &quot;do_com=
pile&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;_setscene&quot; in=
 task:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D WHITE=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_compile&quot;=
 in task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
TASK_COLOR_COMPILE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D &quot;do_c=
onfigure&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_configure&quo=
t; in task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
TASK_COLOR_CONFIGURE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D &quot;do_i=
nstall&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_install&quot;=
 in task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
TASK_COLOR_INSTALL<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D &quot;do_p=
opulate_sysroot&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_populate_sysr=
oot&quot; in task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
TASK_COLOR_SYSROOT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D &quot;do_p=
ackage&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D TASK_=
COLOR_PACKAGE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif task =3D=3D &quot;do_p=
ackage_write_rpm&quot; or \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0task =3D=3D &quot;do_package_write_deb&quot; or \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0task =3D=3D &quot;do_package_write_ipk&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_package_write=
&quot; in task:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
TASK_COLOR_PACKAGE_WRITE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &quot;do_package&quot;=
 in task:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D TASK_=
COLOR_PACKAGE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col =3D =
WHITE<br>
&gt;=C2=A0 <br>
<br>
I&#39;m a bit torn on this as the patch changes the approach of the code.<b=
r>
<br>
Currently, the tasks are marked without any fuzz, i.e. it matches<br>
do_compile alone. The code is entirely consistent in that all the other<br>
areas match specific tasks too.<br>
<br>
After the change you&#39;re changing the meaning to &quot;any compile task&=
quot;=C2=A0 and<br>
&quot;any configure task&quot;.<br></blockquote><div><br></div><div>Yeah th=
at was my intention and they still be consistent by color but now=C2=A0</di=
v><div>matching a sequential group of tasks:<br><br>&quot;any configure tas=
k&quot; -&gt; &quot;any compile task&quot; -&gt; &quot;any package task&quo=
t; -&gt; &quot;any package write task&quot; -&gt; &quot;do_populate_sysroot=
&quot;</div><div><br></div><div>and in this way it is easier to identify th=
e color patterns of the above groups,</div><div>currently we get a couple o=
f white bars for the majority of the tasks.=C2=A0</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m not entirely convinced this is a good thing. Should do_package<br>
match do_package_qa for example? Those are quite different. I think<br>
we&#39;re swapping something which is currently at least quite clear for<br=
>
something which is very fuzzy and not easy for the user to understand<br>
without looking at the code :/.<br></blockquote><div><br>I can rework the p=
atch to have the same colors as before with more new colors</div><div>for t=
he new tasks I added but with many colors=C2=A0It will be harder to underst=
and.</div><div><br>Another option can be just group the configure and compi=
le tasks=C2=A0</div><div>as these usually=C2=A0do the same thing=C2=A0as th=
e ones alone.<br><br>Anyway feel free to drop this patch since no serious p=
roblem is being fixed and</div><div>it would be more the usability that wou=
ld be affected.</div><div><br></div><div>Jose</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000e676bd0604c61bd9--

