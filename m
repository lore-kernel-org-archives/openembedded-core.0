Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web12.188.1589922709116974383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 14:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F/HMpbda;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id j21so706782ejy.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 14:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iWT8a8kfhGR17FZfbJmhEuiDVGar+hGMDQUSwB7B8uQ=;
        b=F/HMpbda5FETWO0zaO8z26du7/77mhh16QxmZxv1YrzVrqscgGrrjCXqRK2kIJKR0u
         8O735CjHlNDwMgYiyzLaePSiPMCtsomTeGhL/jW3ltIFyp6Z8dkzhJ+ASJ3gRzLg6bD8
         813nkbeLNMwYlwnkKLW+NNjw9xq+4xLW/rRyaJ1g5Xda8dI8pHbCCH9MmXZQunjWVtGW
         3JV76TqJ7oirzRSdIc/c6BxMj39EE2JnlUqnAy+zyed6epZAFhjuSeXqWKWaMS9eFDsT
         uqOTmJfjfRcikQNaP0o0MaFstgneC7qWWZSV+ckqlBygF630a6wKcA8AUOH9oWOvrg7j
         rjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iWT8a8kfhGR17FZfbJmhEuiDVGar+hGMDQUSwB7B8uQ=;
        b=VzT//+Yb5IoJuTS6BT7po8GIIwNPW+ecX9Qy5rui55gBzbG+9Fvnur+aGxPS/jN/tV
         ftJS5+jOYKuY4cWNcxqxqFAZg4lhChf6KUw+hICWacNcWQZSr8t6fFla7eC8rPCMLQEK
         SGRlJAB5n4CKxNvczMTQUopgdgxi/BUrHtGVVXQoOP0HZVxLyA4duyDEzkGcHV996d1J
         jUVIFUi5o+EA1Y4XQLIHnoKl5/fJs36LSHiqtOd+M7rO4EeOcRVAgjA6lMjUMWXSqEMt
         t1SB6gdWoYfkdyvQG4/cwarI6c+xW6h/1+VIVENSIvdHy2OUB5y74FOcRDL8DNRvwKLz
         uXTw==
X-Gm-Message-State: AOAM532ZIeAMj0bwgx/pB2hnQlS1XQypAqOyVf1b5gRYg6EHHv8xMJFs
	8chkTZ7zKeEmQfAny9XkGbGyb6HgIlDF6RodbQ4=
X-Google-Smtp-Source: ABdhPJxCENb/VuXAIH0BVn/ZVaO9RIDt2FBCKTxNBQnAHYMHWnE1SvDdON9ID2O8FI+aozv0fBpUAYqunmfo5VG4l90=
X-Received: by 2002:a17:906:6d44:: with SMTP id a4mr1049456ejt.541.1589922707509;
 Tue, 19 May 2020 14:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200519210928.1995-1-joe.slater@windriver.com> <20200519210928.1995-3-joe.slater@windriver.com>
In-Reply-To: <20200519210928.1995-3-joe.slater@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 19 May 2020 23:11:36 +0200
Message-ID: <CA+chaQf2Uq=rg5cg9T4kz-s68-b2_YPL-4T0tp267-b8=Twq3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] syslinux: gcc-10
To: Joe Slater <joe.slater@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000033982505a606ba9e"

--00000000000033982505a606ba9e
Content-Type: text/plain; charset="UTF-8"

Wasn't this fixed by:
https://lists.openembedded.org/g/openembedded-core/message/138364
?

On Tue, May 19, 2020 at 11:10 PM Joe Slater <joe.slater@windriver.com>
wrote:

> Add -fcommon to CFLAGS to avoid multiple definition errors for
> uninitialized variables.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> index e9dbefb930..5dfcfeec02 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.04-pre2.bb
> @@ -40,6 +40,10 @@ EXTRA_OEMAKE = " \
>         DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
>  "
>
> +# necessary for gcc-10
> +#
> +CFLAGS_append = " -fcommon"
> +
>  do_configure() {
>         # drop win32 targets or build fails
>         sed -e 's,win32/\S*,,g' -i Makefile
> --
> 2.26.2
>
> 
>

--00000000000033982505a606ba9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wasn&#39;t this fixed by:<div><a href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/message/138364">https://lists.openembedde=
d.org/g/openembedded-core/message/138364</a><br></div><div>?</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, M=
ay 19, 2020 at 11:10 PM Joe Slater &lt;<a href=3D"mailto:joe.slater@windriv=
er.com">joe.slater@windriver.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">Add -fcommon to CFLAGS to avoid multiple =
definition errors for uninitialized variables.<br>
<br>
Signed-off-by: Joe Slater &lt;<a href=3D"mailto:joe.slater@windriver.com" =
target=3D"_blank">joe.slater@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.=
bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a> | 4 ++++=
<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.0=
4-pre2.bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a> b=
/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.bb" re=
l=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
index e9dbefb930..5dfcfeec02 100644<br>
--- a/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.=
bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
+++ b/meta/recipes-devtools/syslinux/<a href=3D"http://syslinux_6.04-pre2.=
bb" rel=3D"noreferrer" target=3D"_blank">syslinux_6.04-pre2.bb</a><br>
@@ -40,6 +40,10 @@ EXTRA_OEMAKE =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DATADIR=3D${datadir} MANDIR=3D${mandir} INCDIR=
=
=3D${includedir} \<br>
=C2=A0&quot;<br>
<br>
+# necessary for gcc-10<br>
+#<br>
+CFLAGS_append =3D &quot; -fcommon&quot;<br>
+<br>
=C2=A0do_configure() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # drop win32 targets or build fails<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s,win32/\S*,,g&#39; -i Makefile<br=
>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--00000000000033982505a606ba9e--
