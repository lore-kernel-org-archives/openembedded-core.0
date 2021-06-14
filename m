Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web08.29516.1623676684816051713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 06:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HoCkEbCp;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id l7so4135823vkk.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=52G+N28jDbjM66bZ1HhJhH57XrNp/dhoDqj0Xq/QC0w=;
        b=HoCkEbCpsy0YiqbVeb79tDGIZxz0nA1SACHjdttwQuObQgxHxT1RijNurBHFd7j4vX
         zH3tHMwiNsyVxCgFWlh+iEYLMDwkwGn0Hqz69aNpbxlPq0WS+MsEFKQvUHgzlBmQoahg
         DZM80W7OtYEtK5mdBy5cQNDdmZg94VA5diBlBjkue0+TNxVx26H1UUxurWmnCF4XJxW3
         TBKja4mf1O+dULbFUmtURp506sgLzIPzdL1bCWor3kqSgFjAZCfPVxnHpEgnYo5tDzfM
         PWZZKeOU31oLwPHSGxdJ/5y6YmcEC3ruz57M9GR3mBxcA28uu7mYF8AVfGggQrD8pgYn
         yMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=52G+N28jDbjM66bZ1HhJhH57XrNp/dhoDqj0Xq/QC0w=;
        b=IyVQ4sPsxeBoTgiW/uv32t/s3P9Eo4gheP/1hu6qjH18DzWKe8ZJC52AGZjey6SgH3
         +S4F8AiXjYwipb12+scheyK4Us89nImh+H97aWYoyjvps6upJ4IDtKV/tNMSCZllGXjO
         D3eGv0EJc7oKDy01SaJXtSlbVRdrq62s2ECQF3Ufdkce3uR2FJamc1KQS/HSbhNedlL6
         PI9kubegG84qIy7ma91eK6ZHrdAfbE8poT6aiRhePlCK09fVDSGI4tY5iBxS67hIzhty
         zGe9pbDmmSdvFAzDFCr3HqFySk/izjhYYn7gGYsYd4OZ1nw17TYV9eLFLpC1dWSFbDuU
         L0QQ==
X-Gm-Message-State: AOAM532/aJcXdiTbtmllxzTwhJ4wtV98UGXYH0J+XdXUW6uMcQHEpylV
	kyDAco30YmnprPrpSoRnF5LIsmyHfKEBhyWimEA=
X-Google-Smtp-Source: ABdhPJz+meOQxFbc/D43SDixnI/ZNeNtEOqELJUuK1bbJDf52tizDmQ/bgOuSPLKnsE+uHArU5cCH/qhFsF6haS76/I=
X-Received: by 2002:a05:6122:43:: with SMTP id q3mr16389444vkn.10.1623676682573;
 Mon, 14 Jun 2021 06:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210612221006.2888173-1-raj.khem@gmail.com> <8825b363-ef7b-626c-908b-a2c6405410ff@bootlin.com>
In-Reply-To: <8825b363-ef7b-626c-908b-a2c6405410ff@bootlin.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 14 Jun 2021 15:17:51 +0200
Message-ID: <CANNYZj_3wjJSczi0pNAoHxhGF=TmyH9Tgz0nR3GR1TdY0Qrv2w@mail.gmail.com>
Subject: Re: [docs] [OE-core] [PATCH] musl: Set UPSTREAM_CHECK_COMMITS
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e51b0805c4b9afd3"

--000000000000e51b0805c4b9afd3
Content-Type: text/plain; charset="UTF-8"

That would be very useful, but you should check if the entire nomenclature
of UPSTREAM_CHECK_* variables is documented as well
(_COMMITS, _REGEX, _URI, _GITTAGREGEX).

Alex

On Mon, 14 Jun 2021 at 15:12, Michael Opdenacker <
michael.opdenacker@bootlin.com> wrote:

> Hi Khem
>
> On 6/13/21 12:10 AM, Khem Raj wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> > index 6569d1b37b..bd9d5f1d4b 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -84,3 +84,5 @@ RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
> >  LEAD_SONAME = "libc.so"
> >  INSANE_SKIP_${PN}-dev = "staticdev"
> >  INSANE_SKIP_${PN} = "libdir"
> > +
> > +UPSTREAM_CHECK_COMMITS = "1"
>
>
> Thanks for the patch.
> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>
> I realize that the UPSTREAM_CHECK_COMMITS variable doesn't appear in the
> documentation, and it's in relatively frequent use.
>
> Would it make sense to propose to add a description based on the initial
> commit
> (
> https://git.openembedded.org/openembedded-core/commit/?id=591d57877d3d3e659d78c0ed33f4c515e3f6f8fb
> )?
>
> Thanks in advance,
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> 
>
>

--000000000000e51b0805c4b9afd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That would be very useful, but you should check if th=
e entire nomenclature of UPSTREAM_CHECK_* variables is documented as well</=
div><div>(_COMMITS, _REGEX, _URI, _GITTAGREGEX).</div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 14 Jun 2021 at 15:12, Michael Opdenacker &lt;<a href=
=3D"mailto:michael.opdenacker@bootlin.com">michael.opdenacker@bootlin.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i Khem<br>
<br>
On 6/13/21 12:10 AM, Khem Raj wrote:<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"no=
referrer" target=3D"_blank">musl_git.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" re=
l=3D"noreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/musl=
/<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">musl_g=
it.bb</a><br>
&gt; index 6569d1b37b..bd9d5f1d4b 100644<br>
&gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"no=
referrer" target=3D"_blank">musl_git.bb</a><br>
&gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D"no=
referrer" target=3D"_blank">musl_git.bb</a><br>
&gt; @@ -84,3 +84,5 @@ RPROVIDES_${PN} +=3D &quot;ldd libsegfault rtld(GNU=
_HASH)&quot;<br>
&gt;=C2=A0 LEAD_SONAME =3D &quot;libc.so&quot;<br>
&gt;=C2=A0 INSANE_SKIP_${PN}-dev =3D &quot;staticdev&quot;<br>
&gt;=C2=A0 INSANE_SKIP_${PN} =3D &quot;libdir&quot;<br>
&gt; +<br>
&gt; +UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
<br>
<br>
Thanks for the patch.<br>
Reviewed-by: Michael Opdenacker &lt;<a href=3D"mailto:michael.opdenacker@b=
ootlin.com" target=3D"_blank">michael.opdenacker@bootlin.com</a>&gt;<br>
<br>
I realize that the UPSTREAM_CHECK_COMMITS variable doesn&#39;t appear in t=
he<br>
documentation, and it&#39;s in relatively frequent use.<br>
<br>
Would it make sense to propose to add a description based on the initial<b=
r>
commit<br>
(<a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D59=
1d57877d3d3e659d78c0ed33f4c515e3f6f8fb" rel=3D"noreferrer" target=3D"_blank=
">https://git.openembedded.org/openembedded-core/commit/?id=3D591d57877d3d3=
e659d78c0ed33f4c515e3f6f8fb</a>)?<br>
<br>
Thanks in advance,<br>
Michael.<br>
<br>
-- <br>
Michael Opdenacker, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https=
://bootlin.com</a><br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e51b0805c4b9afd3--
