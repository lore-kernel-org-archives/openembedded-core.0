Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.7288.1624453804714055949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 06:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dQd1RAbb;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id f3-20020a0568301c23b029044ce5da4794so1838497ote.11
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=xx5zDliHFulxz3ridLZ3dKL9bIlCwxAWn/E9HjtVIeM=;
        b=dQd1RAbbe1h7iLMHYr7sCGR3XkrsRO2hz0nWHJCNQ2NbCT8uGuZCRHm0YJerbp4pZ7
         gniJCPylswUdBLSw2KB88Tbomddy5xywxX9mGKYcO/hrR70AJS44Nxvb9j5XEhqulq47
         CGBEJIHecQUzFY5n3V+ZqsrZwpvkj2+zmOsFg/PeVzalhjNj1sLud6puET/+Ilma8z58
         O0FHQdJM2sIABw+ig2vrgBm4itzgWHV53n2Vq6b9UqDZV4mKfZ9XCR4EqZVgX4cPYTgI
         stiNqKtAxuIM/TDKNe5mdqe7gr+Xh3GtYyEkUD+lbmiiCj20LS7X+J2NZ42XcHWY58vP
         hciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=xx5zDliHFulxz3ridLZ3dKL9bIlCwxAWn/E9HjtVIeM=;
        b=S1dAMKanWz7HBsEQh2L2lxHzfXXS8jSZ5e+JCK8LcGQcdrJxgojmKApLyXpsQcFh7q
         qFV3G9LvRVjVK9wqVakfSW49a+64cKCy2c6SlEWbHMsu9P/h+/xZ3fwK2lxLqUQUZ2p2
         z4YrPkTirgAQiXn+2UtxH5XyEdEYuJ5CiDxX4F0LxGF/k86KUkfRpTTn+cYMPVms7a4R
         BWbempMsi4WfUj81A0DI4xPDq+I+Jq8/u1Vp6NcKZzmydTn0D+FbAZhHhmFgiI4HDh8C
         mMlFB0BE/XUEe6Ymgudx9vsNn62AesZ3y8cF0xp9iJPbUBK3DPgyvIpEo2BCPeWD5oFi
         PUpQ==
X-Gm-Message-State: AOAM532V9FzNJJJ1fGzNH/dqwXKjT0iUVvyP2ooDsoZyjCqDtQ66U9jV
	3pJ5c+CtN4bPVUUisDKEEcr1YPGg21d/IWJMeyQXz92zCv0=
X-Google-Smtp-Source: ABdhPJzzGL74xC23wpSS2WJTHimfajtO8FMQyWNZNE3167QucuOvctWtfGHnfIOjqQsAeheXtnaSIYISIHAVewmSKQc=
X-Received: by 2002:a05:6830:2047:: with SMTP id f7mr7989962otp.296.1624453803899;
 Wed, 23 Jun 2021 06:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com> <20210623130637.3314755-2-frederic.martinsons@gmail.com>
In-Reply-To: <20210623130637.3314755-2-frederic.martinsons@gmail.com>
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
Date: Wed, 23 Jun 2021 15:09:52 +0200
Message-ID: <CA+cAkeoV-ncBLKpcGm4MKeuqYjSXyKsCU4NWdNTmO51iUAaqZg@mail.gmail.com>
Subject: Re: [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
To: openembedded-core@lists.openembedded.org, 
	=?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ef7ed405c56e9f70"

--000000000000ef7ed405c56e9f70
Content-Type: text/plain; charset="UTF-8"

Hello, I would like to add a link to a yocto mail where I expose my
problematic that led to this patch series:
https://lists.yoctoproject.org/g/yocto/topic/83622035?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035

After further research, I think these patch can be simplified by modified
only WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of
consequence to have WORKDIR outside of TMPDIR so I didn't take this path.

On Wed, 23 Jun 2021 at 15:06, Frederic Martinsons <
frederic.martinsons@gmail.com> wrote:

> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>  meta/classes/package.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index cf30f33f3d..38e9065f25 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -560,13 +560,20 @@ def copydebugsources(debugsrcdir, sources, d):
>          strip = d.getVar("STRIP")
>          objcopy = d.getVar("OBJCOPY")
>          workdir = d.getVar("WORKDIR")
> -        workparentdir = os.path.dirname(os.path.dirname(workdir))
> +        externalsrc = d.getVar('EXTERNALSRC')
> +        if externalsrc:
> +            workparentdir = os.path.dirname(externalsrc)
> +        else:
> +            workparentdir = os.path.dirname(os.path.dirname(workdir))
> +
>          workbasedir = os.path.basename(os.path.dirname(workdir)) + "/" +
> os.path.basename(workdir)
>
>          # If build path exists in sourcefile, it means toolchain did not
> use
>          # -fdebug-prefix-map to compile
>          if checkbuildpath(sourcefile, d):
>              localsrc_prefix = workparentdir + "/"
> +        elif externalsrc:
> +            localsrc_prefix = os.path.join("/usr/src/debug/",
> workbasedir) + "/"
>          else:
>              localsrc_prefix = "/usr/src/debug/"
>
> --
> 2.25.1
>
>

--000000000000ef7ed405c56e9f70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, I would like to add a link to a yocto mail where I =
expose my problematic that led to this patch series:=C2=A0<a href=3D"https:=
//lists.yoctoproject.org/g/yocto/topic/83622035?p=3D,,,20,0,0,0::recentpost=
date%2Fsticky,,,20,2,0,83622035">https://lists.yoctoproject.org/g/yocto/top=
ic/83622035?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035</a><=
div><br></div><div>After further research, I think these patch can be simpl=
ified by modified only WORKDIR variable to be os.path.dirname(EXTERNALSRC) =
but I fear of consequence to have WORKDIR outside of TMPDIR so I didn&#39;t=
 take this path.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 23 Jun 2021 at 15:06, Frederic Martinsons &lt=
;<a href=3D"mailto:frederic.martinsons@gmail.com">frederic.martinsons@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.marti=
nsons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br=
>
---<br>
=C2=A0meta/classes/package.bbclass | 9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass<br=
>
index cf30f33f3d..38e9065f25 100644<br>
--- a/meta/classes/package.bbclass<br>
+++ b/meta/classes/package.bbclass<br>
@@ -560,13 +560,20 @@ def copydebugsources(debugsrcdir, sources, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strip =3D d.getVar(&quot;STRIP&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy =3D d.getVar(&quot;OBJCOPY&quot;)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar(&quot;WORKDIR&quot;)=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 workparentdir =3D os.path.dirname(os.path.dirn=
ame(workdir))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 externalsrc =3D d.getVar(&#39;EXTERNALSRC&#39;=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if externalsrc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workparentdir =3D os.path.dirnam=
e(externalsrc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 workparentdir =3D os.path.dirnam=
e(os.path.dirname(workdir))<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workbasedir =3D os.path.basename(os.path.=
dirname(workdir)) + &quot;/&quot; + os.path.basename(workdir)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# If build path exists in sourcefile, it =
means toolchain did not use<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# -fdebug-prefix-map to compile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if checkbuildpath(sourcefile, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localsrc_prefix =3D workpar=
entdir + &quot;/&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif externalsrc:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 localsrc_prefix =3D os.path.join=
(&quot;/usr/src/debug/&quot;, workbasedir) + &quot;/&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localsrc_prefix =3D &quot;/=
usr/src/debug/&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000ef7ed405c56e9f70--
