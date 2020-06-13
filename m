Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.17704.1592085775500009961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Jun 2020 15:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SzgAzxso;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id k13so7293239vsm.13
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Jun 2020 15:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZF+kj6h2OzkqtkNFQAPAEgVNM5kuyZ38whlb7HiDIkk=;
        b=SzgAzxsoZkQvDoU2EF55bVG9afOatyh4bwIR/XJSLr2M3247vEhYTlMNayHgagDEOV
         DD71UQcLYcXUDWIApvLQC51cZJaNue1m+ZMGCu/fuX4gCmJ7xOURf8QURL9GC6FBiVfw
         cwISBdK4ceD7L4627bSiKjPfUbFsSXklA7G5B6yj1n62fUD48vfkWTJdHRtI7dgPz9e2
         vHj7p9naQABGXoX5UfQK9ACDvOJceyaB0Taab63rS49yC4k6Od2dT5tRdHq5rdogfxYV
         9HmNYav8BzL/b7u8ofJLpgq7pem9A7UwJ8KHAqZLt5ZqLDdlFgxrBeAHn6i8DpasElAv
         L9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZF+kj6h2OzkqtkNFQAPAEgVNM5kuyZ38whlb7HiDIkk=;
        b=QCpFSwl4UoXcLqFmPRR1r0gskhhR9k8prEjBdZ844FR0IeEhBTItnFNbIhBWNlNAri
         qMGAVrlOvx+MgQcfBMxNfUmHMUrzJeDIJDk2pEXnh9gFD3LsT3Z0r95wzvZMz12SMwbZ
         OgMqt/ocuSP1FMx9wu+DdTXf4k9Iu0U1wiLbNHKNsGxrsTnD2SYz4RJX3OqoXsfeh2d+
         aquDVfnLnpJERM4CWysQr3FDkLIrsjBguWPwoB5JB7l96AN3/gawmJwJf/JQrxBqQ75i
         dp0uL636amEQyyoZDFkgu1Ni05UaNxuLuD9pQzjVWWB/J8aP6zz7Ys6+gu0gYnK/HdFa
         3xqA==
X-Gm-Message-State: AOAM53339gNNG2fodK51CZBSyoKyJgFmeEsivZ64xMvejWbkUqFiaBV5
	PO+Ix85KJk9x8koCyBgBEx891ZViOrM9XOD/Kzc=
X-Google-Smtp-Source: ABdhPJzwl06wTlTNxwiDK43vG5NhHwpdvBtjdnLHNLKIwBMiQaqkCWw2HGRWchUg13RJk7zrvQg9evxHaUgvjJJhXjg=
X-Received: by 2002:a67:8c09:: with SMTP id o9mr15720200vsd.23.1592085774639;
 Sat, 13 Jun 2020 15:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200608074659.7051-1-alex.kanavin@gmail.com> <20200608074659.7051-15-alex.kanavin@gmail.com>
 <CAHtQpK4zcKXmF0hfDkVmXy_69UkvEbhYhMWAoS3AgLrm6FGhpA@mail.gmail.com>
In-Reply-To: <CAHtQpK4zcKXmF0hfDkVmXy_69UkvEbhYhMWAoS3AgLrm6FGhpA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 14 Jun 2020 00:02:43 +0200
Message-ID: <CANNYZj839s4Fqz+voO-5OrToqPcXVm=W0N68kXu=64nWTFpFtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/42] cogl-1.0: upgrade 1.22.6 -> 1.22.8
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ca6a005a7fe5b14"

--0000000000000ca6a005a7fe5b14
Content-Type: text/plain; charset="UTF-8"

Unfortunately not. These items are tested on the autobuilder in various
configurations, and it gave green light for all of them.

You should probably check how your mesa is configured, and how that differs
from poky.

Alex

On Sat, 13 Jun 2020 at 22:44, Andrey Zhizhikin <andrey.z@gmail.com> wrote:

> Hello Alex,
>
> On Mon, Jun 8, 2020 at 9:48 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb | 6 ------
> >  meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb | 5 +++++
> >  2 files changed, 5 insertions(+), 6 deletions(-)
> >  delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> >  create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> >
> > diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> b/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> > deleted file mode 100644
> > index 86bbdbff69..0000000000
> > --- a/meta/recipes-graphics/cogl/cogl-1.0_1.22.6.bb
> > +++ /dev/null
> > @@ -1,6 +0,0 @@
> > -require cogl-1.0.inc
> > -
> > -SRC_URI[archive.md5sum] = "7bcc01edb5462d4d08d01bf893feddb0"
> > -SRC_URI[archive.sha256sum] =
> "6d134bd3e48c067507167c001200b275997fb9c68b08b48ff038211c8c251b75"
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
> > diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> > new file mode 100644
> > index 0000000000..78f6b0e7a3
> > --- /dev/null
> > +++ b/meta/recipes-graphics/cogl/cogl-1.0_1.22.8.bb
> > @@ -0,0 +1,5 @@
> > +require cogl-1.0.inc
> > +
> > +SRC_URI[archive.sha256sum] =
> "a805b2b019184710ff53d0496f9f0ce6dcca420c141a0f4f6fcc02131581d759"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1b1a508d91d25ca607c83f92f3e31c84"
> > --
> > 2.26.2
> >
>
> I'm seeing a lot of errors like the one below after this upgrade,
> reverting back to 1.22.6 seems to fix those...
>
> In file included from ../../cogl-1.22.8/cogl/cogl-egl-private.h:34,
> |                  from
> ../../cogl-1.22.8/cogl/winsys/cogl-winsys-private.h:48,
> |                  from ../../cogl-1.22.8/cogl/cogl-fence-private.h:36,
> |                  from ../../cogl-1.22.8/cogl/cogl-journal-private.h:37,
> |                  from
> ../../cogl-1.22.8/cogl/cogl-framebuffer-private.h:36,
> |                  from ../../cogl-1.22.8/cogl/cogl-primitive.c:43:
> | ./cogl-egl-defines.h:38:10: fatal error: EGL/eglmesaext.h: No such
> file or directory
> |    38 | #include <EGL/eglmesaext.h>
> |       |          ^~~~~~~~~~~~~~~~~~
> | compilation terminated.
>
> Do I miss something in my setup? Maybe cogl requires new mesa?
>
> Have you seen those errors as well?
>
> > 
>
>
>
> --
> Regards,
> Andrey.
>

--0000000000000ca6a005a7fe5b14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Unfortunately not. These items are tested on the auto=
builder in various configurations, and it gave green light for all of them.=
</div><div><br></div><div>You should probably check how your mesa is config=
ured, and how that differs from poky.<br></div><div><br></div><div>Alex<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Sat, 13 Jun 2020 at 22:44, Andrey Zhizhikin &lt;<a href=3D"mailto:=
andrey.z@gmail.com">andrey.z@gmail.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hello Alex,<br>
<br>
On Mon, Jun 8, 2020 at 9:48 AM Alexander Kanavin &lt;<a href=3D"mailto:ale=
x.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.6.bb=
" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.6.bb</a> | 6 ------<br=
>
&gt;=C2=A0 meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.8.bb=
" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.8.bb</a> | 5 +++++<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 6 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-graphics/cogl/<a href=3D"http:/=
/cogl-1.0_1.22.6.bb" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.6.b=
b</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-graphics/cogl/<a href=3D"http:/=
/cogl-1.0_1.22.8.bb" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.8.b=
b</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.=
22.6.bb" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.6.bb</a> b/meta=
/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.6.bb" rel=3D"norefer=
rer" target=3D"_blank">cogl-1.0_1.22.6.bb</a><br>
&gt; deleted file mode 100644<br>
&gt; index 86bbdbff69..0000000000<br>
&gt; --- a/meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.6.bb=
" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.6.bb</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,6 +0,0 @@<br>
&gt; -require cogl-1.0.inc<br>
&gt; -<br>
&gt; -SRC_URI[archive.md5sum] =3D &quot;7bcc01edb5462d4d08d01bf893feddb0&q=
uot;<br>
&gt; -SRC_URI[archive.sha256sum] =3D &quot;6d134bd3e48c067507167c001200b27=
5997fb9c68b08b48ff038211c8c251b75&quot;<br>
&gt; -<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1b1a508d91d25ca607c8=
3f92f3e31c84&quot;<br>
&gt; diff --git a/meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.=
22.8.bb" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.8.bb</a> b/meta=
/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.8.bb" rel=3D"norefer=
rer" target=3D"_blank">cogl-1.0_1.22.8.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..78f6b0e7a3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-graphics/cogl/<a href=3D"http://cogl-1.0_1.22.8.bb=
" rel=3D"noreferrer" target=3D"_blank">cogl-1.0_1.22.8.bb</a><br>
&gt; @@ -0,0 +1,5 @@<br>
&gt; +require cogl-1.0.inc<br>
&gt; +<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;a805b2b019184710ff53d0496f9f0ce=
6dcca420c141a0f4f6fcc02131581d759&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D1b1a508d91d25ca607c8=
3f92f3e31c84&quot;<br>
&gt; --<br>
&gt; 2.26.2<br>
&gt;<br>
<br>
I&#39;m seeing a lot of errors like the one below after this upgrade,<br>
reverting back to 1.22.6 seems to fix those...<br>
<br>
In file included from ../../cogl-1.22.8/cogl/cogl-egl-private.h:34,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/cogl-1.22.8/cogl/winsys/cogl-winsys-private.h:48,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/cogl-1.22.8/cogl/cogl-fence-private.h:36,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/cogl-1.22.8/cogl/cogl-journal-private.h:37,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/cogl-1.22.8/cogl/cogl-framebuffer-private.h:36,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from ../..=
/cogl-1.22.8/cogl/cogl-primitive.c:43:<br>
| ./cogl-egl-defines.h:38:10: fatal error: EGL/eglmesaext.h: No such<br>
file or directory<br>
|=C2=A0 =C2=A0 38 | #include &lt;EGL/eglmesaext.h&gt;<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~~~~~<br>
| compilation terminated.<br>
<br>
Do I miss something in my setup? Maybe cogl requires new mesa?<br>
<br>
Have you seen those errors as well?<br>
<br>
&gt; <br>
<br>
<br>
<br>
--<br>
Regards,<br>
Andrey.<br>
</blockquote></div>

--0000000000000ca6a005a7fe5b14--
