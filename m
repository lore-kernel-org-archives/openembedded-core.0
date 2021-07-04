Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web09.627.1625418236615583109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 10:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d8DM20Dt;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id r9so6038233ual.7
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=80JfXbVsVpZuqy9Ob8INFlshLfRE3CWWE4VSgVZKrhw=;
        b=d8DM20Dta1IKY6sHRvFjwkdRqM+aQ26+hLlyaaocnXDGyDl9FOwdmR3slxa1+YYoGu
         SJymv3yL+OM3o0BZyAEkKg1/IWkY9IL8GeJ1bvpJReqtoFOlkdD7yCIfrz8VmIPlKdIk
         MrpBreJ90/EZ/3ayjlalsLNluqltynpRLInfVAZyNi56EJ1eu5JoiAqZ3AL8O/UyczEN
         msaykQfCN3lkHQj2Gm03uvv4eDbQvmlKRRVE44XR4mfJEumC/onNmSf6dyrZROifVs1i
         akU+mCQiT6JbeSFqmoAS93RhmmZNXX9JdatKjvQ764T9vrOo3wOG62G54Dxmgb2T2J5A
         nkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=80JfXbVsVpZuqy9Ob8INFlshLfRE3CWWE4VSgVZKrhw=;
        b=MRJ+n1FpWe0gk249Vb5qKgKd4cuiqh414kfzmtYko3+SXMXu9zLEgQQAUwhT1G89qP
         3a3GNdHGFvYwJ0sJcz144L58RlrfJ9lDeoeJBJTEodz9lrVqrTCoS+wdvjDhdUyrrVU1
         XAipzkRVJ2pECKOtQBX+hjKUtjIY8kRA3Pfx8g2Yyts8dECKSsdiduj5zf9m/5i/Xzf8
         I+aoEAxp1POl0UbvqacxF2GH+sKKKsYbd3ApCp8fM/YKN/YspaF/YG3pJX6lcOd3SuWO
         XxZ/7OqM7VXq6z4SAW2qwlRXbS51Qh8Vns0kT19P8kOVCnNajxUcN3Tidwump8/5xgek
         Svvg==
X-Gm-Message-State: AOAM5335DhX1CB0OXevFV+jBa4IDWR1hd0WzDxNtE/WQs9Yqi2DlgGCh
	bQZWtDpuJZijqzCejaRy7Q1fSkG0hEx0bhPD5d8=
X-Google-Smtp-Source: ABdhPJwrXXgNIk8jWXeSOcMPi362bkKnX0Zb0RUU0cNGvZ4scl3aLAUra+RCqVURnMCdoYkliKFqVSVy+4RjusyvIr0=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr7762197uad.89.1625418235612;
 Sun, 04 Jul 2021 10:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <CANUMPcU0ibVFbf5x0OzEunTymSd8+_chCD3432xa3CTeL7QzjA@mail.gmail.com>
 <20210704112159.150061-1-vinay.m.engg@gmail.com>
In-Reply-To: <20210704112159.150061-1-vinay.m.engg@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 4 Jul 2021 19:03:44 +0200
Message-ID: <CANNYZj9_peVZSZNZX_aB_ETx6Hsnk1YK1Ok4Yc0vjSBNxFXxGw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc-package.inc: To fix build issue with glibc-testsuite.
To: Vinay Kumar <vinay.m.engg@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh kalappa0 <umesh.kalappa0@gmail.com>, 
	vinay.kumar@blackfigtech.com
Content-Type: multipart/alternative; boundary="0000000000008b903005c64f2cc6"

--0000000000008b903005c64f2cc6
Content-Type: text/plain; charset="UTF-8"

This looks like a workaround that does not fix the actual issue. Can you
please look into what is causing the failure, if it is reproducible
reliably, and at which point it regressed?

Alex

Alex

On Sun, 4 Jul 2021 at 13:22, Vinay Kumar <vinay.m.engg@gmail.com> wrote:

> Added condition to check "$cleanupdir${datadir}" exists.
>
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index 92e5dbac61..df3f612192 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -230,7 +230,9 @@ stash_locale_cleanup () {
>         rm -rf $cleanupdir${libdir}/gconv
>         rm -rf $cleanupdir${localedir}
>         rm -rf $cleanupdir${datadir}/locale
> +  if [ -d $cleanupdir${datadir} ]; then
>         rmdir --ignore-fail-on-non-empty $cleanupdir${datadir}
> +  fi;
>
>         if [ "${libdir}" != "${exec_prefix}/lib" ] && [
> "${root_prefix}/lib" != "${exec_prefix}/lib" ]; then
>                 if [ -d "$cleanupdir${exec_prefix}/lib" ]; then
> --
> 2.31.1
>
>
> 
>
>

--0000000000008b903005c64f2cc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This looks like a workaround that does not fix the ac=
tual issue. Can you please look into what is causing the failure, if it is =
reproducible reliably, and at which point it regressed?</div><div><br></div=
><div>Alex<br></div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 4 Jul 2021 =
at 13:22, Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com">vinay.m=
.engg@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Added condition to check &quot;$cleanupdir${datadir}&quot; e=
xists.<br>
<br>
Signed-off-by: Vinay Kumar &lt;<a href=3D"mailto:vinay.m.engg@gmail.com" t=
arget=3D"_blank">vinay.m.engg@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-package.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core=
/glibc/glibc-package.inc<br>
index 92e5dbac61..df3f612192 100644<br>
--- a/meta/recipes-core/glibc/glibc-package.inc<br>
+++ b/meta/recipes-core/glibc/glibc-package.inc<br>
@@ -230,7 +230,9 @@ stash_locale_cleanup () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $cleanupdir${libdir}/gconv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $cleanupdir${localedir}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf $cleanupdir${datadir}/locale<br>
+=C2=A0 if [ -d $cleanupdir${datadir} ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir --ignore-fail-on-non-empty $cleanupdir${=
datadir}<br>
+=C2=A0 fi;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${libdir}&quot; !=3D &quot;${exec_p=
refix}/lib&quot; ] &amp;&amp; [ &quot;${root_prefix}/lib&quot; !=3D &quot;$=
{exec_prefix}/lib&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -d &quot;$cle=
anupdir${exec_prefix}/lib&quot; ]; then<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000008b903005c64f2cc6--
