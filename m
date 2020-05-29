Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.31831.1590747254052577562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 03:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Krosl2FR;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: maurofrqueiros@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id e125so981969lfd.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=EYgZ94AeuAc4S7usVs5ud/TTq9s9So5SL/LX+lpARTQ=;
        b=Krosl2FRdPrWob0RhyVxsuk5WYcigIik2ZXvFn5Nb4vS2Nb8b/9yQ9jdcFwswqZvfJ
         1qIFT8OQGx6Lj2kmco/l/HlW/Ig64/4f6TuvR0vUtQBj7UR7AYyipchxZRsuYKi2V/Jz
         rhHeutWnyw5icdDh9wkLIIFNdxcSz8+CEQeh3r64MJrLaGClM7jS1GJMNQSnQjTm89ft
         Fe2d+TJLq0vNEkXuIyl/t2ULz/IB0V5a2j7b0VLsJUmVYR/deJ/W9Z2zLvlMc9o7WtNx
         4EiSGs9SShahnT7O36atOHI40DyNrCulh4tL8y5OfsPMYw1eLz0fz94ZQXEfsTZiXr4q
         lThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=EYgZ94AeuAc4S7usVs5ud/TTq9s9So5SL/LX+lpARTQ=;
        b=RnHK+d/lqSQEIrjsELLeIqA/CMZlokTJzfm2dfmpQoZIms7a+jjyoiy6G+3fui3O2P
         zIdDa539m1Z0eixfDKWtmBK+7WbYHRhbX5B1+/RsCK55vHOADVWNSTE1wD6XTtZcs2Xr
         F6Ds/61XdzUd2FY7DnG4EQI0hY+WAK3K/ZDy9jpgrIUqeCAMmOppCCEZRD0wDdw59kwG
         GXOkoxQ1rJzf7RGMibdFKftkQkYE9Pvw4d+xioq73dQrAQyP6cRtaIdc0tbpXMJojURd
         fiBMjeJWMkEJYGYkUHu2ub/zvQN3ZMJdgmo2GA3tH+Qq3PtkO14Asa6ZkUHBDefPCiUq
         WSHg==
X-Gm-Message-State: AOAM531kKTyO4XUzlYuAAczRjLrhp9TljccjmRrcVrXOtWnIcswAbYXi
	LKoGh9Ifs1QaWphYgzhPNmfhigbC7kCd/De+35VaDu3G
X-Google-Smtp-Source: ABdhPJwuo0ZunwSTtXQSzSVRD0jE+vZN5ur5kN32qlq7+Vud5P8R9RALMr/Rt+hhg2oBHaLSZluORJ31jMeP+tgX9Hc=
X-Received: by 2002:a19:86c3:: with SMTP id i186mr4093137lfd.166.1590747251806;
 Fri, 29 May 2020 03:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200529100159.32393-1-maurofrqueiros@gmail.com> <20200529100159.32393-2-maurofrqueiros@gmail.com>
In-Reply-To: <20200529100159.32393-2-maurofrqueiros@gmail.com>
From: =?UTF-8?B?TWF1cm8gUXVlaXLDs3M=?= <maurofrqueiros@gmail.com>
Date: Fri, 29 May 2020 11:14:00 +0100
Message-ID: <CAOev9Bey-mExUMEcSzN5QRkDAi4WPVafctOSt12D8j4ZFWLVtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] git.py: LFS bitbake note should not be printed if need_lfs is not set.
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000df179b05a6c6b4d9"

--000000000000df179b05a6c6b4d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please ignore. This was meant to bitbake-devel mailing list.

Mauro Queiros <maurofrqueiros@gmail.com> escreveu no dia sexta, 29/05/2020
=C3=A0(s) 11:02:

> The message "Repository %s has LFS content but it is not being fetched" w=
as
> being printed, even when Git-LFS was available and "lfs=3D1" was set. In
> those
> situations, we want to fetch LFS content, so that message would not make
> sense.
>
> Signed-off-by: Mauro Queiros <maurofrqueiros@gmail.com>
> ---
>  lib/bb/fetch2/git.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
> index 4c7d388e..eab76a10 100644
> --- a/lib/bb/fetch2/git.py
> +++ b/lib/bb/fetch2/git.py
> @@ -509,7 +509,7 @@ class Git(FetchMethod):
>          if self._contains_lfs(ud, d, destdir):
>              if need_lfs and not self._find_git_lfs(d):
>                  raise bb.fetch2.FetchError("Repository %s has LFS
> content, install git-lfs on host to download (or set lfs=3D0 to ignore it=
)" %
> (repourl))
> -            else:
> +            elif not need_lfs:
>                  bb.note("Repository %s has LFS content but it is not
> being fetched" % (repourl))
>
>          if not ud.nocheckout:
> --
> 2.17.1
>
>

--000000000000df179b05a6c6b4d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please ignore. This was meant to bitbake-devel mailing lis=
t.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com">maurofr=
queiros@gmail.com</a>&gt; escreveu no dia sexta, 29/05/2020 =C3=A0(s) 11:02=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The message &q=
uot;Repository %s has LFS content but it is not being fetched&quot; was<br>
being printed, even when Git-LFS was available and &quot;lfs=3D1&quot; was =
set. In those<br>
situations, we want to fetch LFS content, so that message would not make se=
nse.<br>
<br>
Signed-off-by: Mauro Queiros &lt;<a href=3D"mailto:maurofrqueiros@gmail.com=
" target=3D"_blank">maurofrqueiros@gmail.com</a>&gt;<br>
---<br>
=C2=A0lib/bb/fetch2/git.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py<br>
index 4c7d388e..eab76a10 100644<br>
--- a/lib/bb/fetch2/git.py<br>
+++ b/lib/bb/fetch2/git.py<br>
@@ -509,7 +509,7 @@ class Git(FetchMethod):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self._contains_lfs(ud, d, destdir):<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if need_lfs and not self._f=
ind_git_lfs(d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.fetc=
h2.FetchError(&quot;Repository %s has LFS content, install git-lfs on host =
to download (or set lfs=3D0 to ignore it)&quot; % (repourl))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif not need_lfs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note(&quot=
;Repository %s has LFS content but it is not being fetched&quot; % (repourl=
))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not ud.nocheckout:<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000df179b05a6c6b4d9--
