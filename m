Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.2902.1602615483873352446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 11:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M4yvuUtg;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id r21so296102uaw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 11:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qs+EFoElRKncaBqcZvipAUMOCE5+lyw/fbpN+duPXsQ=;
        b=M4yvuUtgnriUzSql+uU8p36jq7phdkckirN7oJafQsLy8OM3c1EnuOE8WYVk/yCe3d
         kAkaULdUQTievRmxvzxwV2/qvgVWnT9L3P7WGxR3eUjejdqFX84qyD3ARttqaiJ8E9FO
         Ehtjbk40kmXv2JCs7rVjy9IqiANtWQcM6QCSOnl/NMLd+KxYfQ4ejKmiqPZB6upuufpi
         AwzTbBRFtJ/oMtthYXweFbqp2iEedMOQbOdGX0prND0JuUuccDRzyCx1Yf2CLEkvBuMT
         yJqrkxn6ZS4Sg+XWKKgg8oelG/1dseINZK70E7QwD8CFn/FevNdn1l5uIQ/xudiV8z1K
         P3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qs+EFoElRKncaBqcZvipAUMOCE5+lyw/fbpN+duPXsQ=;
        b=Ait71Me2j81u2xXbFQfUB5HzvxnEhQf3zfxrU+iSzZwrlfn/9zNETDcxW6+/MjPQDa
         USCft5wtO6Z0WvAAUmW8LMrpGFbTzybi3Ix1zaC7Rz2Jk8hjZ07iZV7diMnTilEIUWkr
         Z2uur+cPbHpt45RbaP5tohRyiff/A2TwB8VlrMaoaEbU/sk6F49siYkFV3iW0qIvQlZv
         n3iCpAVIxMxHitOjYl+cu9IzhgFeP0dIrcNK2ec6O2nkmvH0DJf0NlW2BmK3cZJB5Pcw
         AGsxt4cXnZO8nMg285PtMAZWmrNXtATMFQ/2wPbAUiKRP+6sOqFBINXmiX7179SnrJuY
         tb+w==
X-Gm-Message-State: AOAM531xLWrAKWxYfs8FzNok/uFxu4NX0ju2jZhRXFRuVgOGoZQAdx/U
	FkPA+t68IiLD9f+nkYjVC2uTHCqSgrmS9dx8QJY=
X-Google-Smtp-Source: ABdhPJxBOHNCAgdQKx5l0G1wybslXFX3x0JbJLE6AWC64+jrnUypUySOLMT7J1U940L0VD2PKFs13wIcQEb/dBiMzwo=
X-Received: by 2002:ab0:907:: with SMTP id w7mr1252925uag.100.1602615482775;
 Tue, 13 Oct 2020 11:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201013173502.2245733-1-quaresma.jose@gmail.com>
 <20201013173502.2245733-4-quaresma.jose@gmail.com> <CAHtQpK7jDLgFq3GNgCW9A7PE-z-cdCn_4pceFKMFON_-CQWAJw@mail.gmail.com>
In-Reply-To: <CAHtQpK7jDLgFq3GNgCW9A7PE-z-cdCn_4pceFKMFON_-CQWAJw@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 13 Oct 2020 20:57:51 +0200
Message-ID: <CANNYZj9nJEo0e9Sa5vSJFzusTA1eCU19ZBCW6e=0_yr3HzhkQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] glslang: add receipe
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008ffee705b191fe96"

--0000000000008ffee705b191fe96
Content-Type: text/plain; charset="UTF-8"

Also, github archives are not stable, and can change checksums over time.

Alex

On Tue, 13 Oct 2020 at 20:54, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Glslang is the official reference compiler front end for the
> > OpenGL ES and OpenGL shading languages. It implements a strict
> interpretation
> > of the specifications for these languages. It is open and free for
> anyone to use,
> > either from a command line or programmatically.
> >
> > This receipe is needed to build the new shaderc
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  .../glslang/glslang_8.13.3559.bb              | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> >
> > diff --git a/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> > new file mode 100644
> > index 0000000000..2008ba59d8
> > --- /dev/null
> > +++ b/meta/recipes-graphics/glslang/glslang_8.13.3559.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "OpenGL / OpenGL ES Reference Compiler"
> > +DESCRIPTION = "Glslang is the official reference compiler front end for
> the \
> > +OpenGL ES and OpenGL shading languages. It implements a strict
> interpretation \
> > +of the specifications for these languages. It is open and free for
> anyone to use, \
> > +either from a command line or programmatically."
> > +SECTION = "graphics"
> > +HOMEPAGE = "
> https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=918e668376010a04448a312fb37ae69b"
> > +
> > +SRC_URI = "https://github.com/KhronosGroup/glslang/archive/${PV}.tar.gz
> "
> > +SRC_URI[md5sum] = "cb32322377cee2bc1cee5b60ebe46133"
> > +SRC_URI[sha256sum] =
> "c58fdcf7e00943ba10f9ae565b2725ec9d5be7dab7c8e82cac72fcaa83c652ca"
>
> Any reason why archive is preferred here over GIT? I can see that the
> source repository has tags defined, so it would be better to use GIT
> instead of archive here.
>
> > +
> > +inherit cmake python3native
> > +
> > +EXTRA_OECMAKE = ""
> This is not needed, as there are no extra cmake arguments supplied anyway.
>
> > +
> > +BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.28.0
> >
> >
> >
> >
>
>
> --
> Regards,
> Andrey.
>
> 
>
>

--0000000000008ffee705b191fe96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Also, github archives are not stable, and can change =
checksums over time.</div><div><br></div><div>Alex<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 13 Oct =
2020 at 20:54, Andrey Zhizhikin &lt;<a href=3D"mailto:andrey.z@gmail.com">a=
ndrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Tue, Oct 13, 2020 at 7:35 PM Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.=
com</a>&gt; wrote:<br>
&gt;<br>
&gt; Glslang is the official reference compiler front end for the<br>
&gt; OpenGL ES and OpenGL shading languages. It implements a strict interp=
retation<br>
&gt; of the specifications for these languages. It is open and free for an=
yone to use,<br>
&gt; either from a command line or programmatically.<br>
&gt;<br>
&gt; This receipe is needed to build the new shaderc<br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmai=
l.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../glslang/<a href=3D"http://glslang_8.13.3559.bb" rel=3D"nore=
ferrer" target=3D"_blank">glslang_8.13.3559.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 19 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 19 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/glslang/<a href=3D"htt=
p://glslang_8.13.3559.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13=
.3559.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/glslang/<a href=3D"http://glslang_=
8.13.3559.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3559.bb</a>=
 b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_8.13.3559.bb" re=
l=3D"noreferrer" target=3D"_blank">glslang_8.13.3559.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..2008ba59d8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/glslang/<a href=3D"http://glslang_8.13.35=
59.bb" rel=3D"noreferrer" target=3D"_blank">glslang_8.13.3559.bb</a><br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +SUMMARY =3D &quot;OpenGL / OpenGL ES Reference Compiler&quot;<br>
&gt; +DESCRIPTION =3D &quot;Glslang is the official reference compiler fro=
nt end for the \<br>
&gt; +OpenGL ES and OpenGL shading languages. It implements a strict inter=
pretation \<br>
&gt; +of the specifications for these languages. It is open and free for a=
nyone to use, \<br>
&gt; +either from a command line or programmatically.&quot;<br>
&gt; +SECTION =3D &quot;graphics&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/opengles/sdk/t=
ools/Reference-Compiler" rel=3D"noreferrer" target=3D"_blank">https://www.k=
hronos.org/opengles/sdk/tools/Reference-Compiler</a>&quot;<br>
&gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=3D918e668376010a04=
448a312fb37ae69b&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"https://github.com/KhronosGroup/glslang=
/archive/$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/KhronosGroup/glslang/archive/${PV}.tar.gz</a>&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;cb32322377cee2bc1cee5b60ebe46133&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c58fdcf7e00943ba10f9ae565b2725ec9d5be7d=
ab7c8e82cac72fcaa83c652ca&quot;<br>
<br>
Any reason why archive is preferred here over GIT? I can see that the<br>
source repository has tags defined, so it would be better to use GIT<br>
instead of archive here.<br>
<br>
&gt; +<br>
&gt; +inherit cmake python3native<br>
&gt; +<br>
&gt; +EXTRA_OECMAKE =3D &quot;&quot;<br>
This is not needed, as there are no extra cmake arguments supplied anyway.=
<br>
<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
Regards,<br>
Andrey.<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008ffee705b191fe96--
