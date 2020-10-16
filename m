Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web12.11472.1602839533308916975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 02:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hX5jgGog;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id r1so1015335vsi.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TeWvqjsmBQYt50ln6Ba70Rg1ls1km7OyQ8KWZJwQMaE=;
        b=hX5jgGogWojUNKOfQylKOYm/CIGmDPzJSxdIcs113CvIRSFRDpWoovPfG1aet7C8Fr
         6/uN2V0VD8xEyiDvOH/KmB/J8FdUF8DwYbu6IDUdAHzZ4CS9POOQ9X9ww/GHLdkkkS/l
         TtTiyrL3F8dpP4LxZq5/ObipSpTgcKsOD65WhfivSCxzKgi0qrilgSaDUj0xu2xDJYqR
         CeLKYPHEuVsrunqgTFMNvmyWp+OTLR2sPAmRewjsi5zPm0mQKaqH0pIAjhPfuUEZ21eH
         wYwtaugR5QptHskmVRT/M2FfuMjpWle/hrIH5FRXrvgGVGmlO12q3f5xtFBsRx0XSBO1
         o0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TeWvqjsmBQYt50ln6Ba70Rg1ls1km7OyQ8KWZJwQMaE=;
        b=i2IqPPyhS49CxZBcxZCovQDJ5a8fOShjVF+LLR2oYV9ciqQhmTTL1JiKaoqgaJCIH8
         UGLfaku3KpuVY0xlGQY4WSZPKePsqv5aiJpwkEtZSrwOEFDqJijbs/RcQMycg1jgqtBW
         D+KgM3CY5rGR1t/fLWfVTnCsvHNeyLz/QRr2x8lf/qEZhHrFCCzUeI1/lEmgEZuTHxm1
         BEIFW58YHUHuoTHc6U2L5zGgt3HkCiiyIYwdMPD7TCyjbQzOYl8lGfs1pHNhklBVvpWz
         8WoEEAYvxhQVvKYlL+K2qsFtYV2bgUThX8Ou4n3apKHrTyXWs+D17+mGF24O1u/WEioC
         tLNw==
X-Gm-Message-State: AOAM531mzmJPJzW2MORUtUij3ZTd3819UWhU372WYJLOt3C9o1M+W8Ps
	8sRb1JLrxAzczh/XcNmVAW9lp22e5ENq58YMwxA=
X-Google-Smtp-Source: ABdhPJwxllFluvP7R0a6C4Xl3C3sWQcH8xF0KLgWLes2BTiIsMnoFxT6TL7sfyBHaLZ2OFautRlsJCGZ9ym54vLwTRA=
X-Received: by 2002:a67:1087:: with SMTP id 129mr1273638vsq.41.1602839532207;
 Fri, 16 Oct 2020 02:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <1602814842-29798-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <1602814842-29798-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 16 Oct 2020 11:11:58 +0200
Message-ID: <CANNYZj9p3F05Zp9o+CBD5d8fxyDKk3f1zL_rjpgmjY2puLq_qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: upgrade 5.8 -> 5.9
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f303b905b1c62839"

--000000000000f303b905b1c62839
Content-Type: text/plain; charset="UTF-8"

Thank you for the update - but please note that right the feature freeze
for the release is in effect, which means no recipe version updates are
accepted. It's better to hold the patches until the new release is out. You
can find the current status from weekly status emails sent to this list.

Alex

On Fri, 16 Oct 2020 at 04:21, zangrc <zangrc.fnst@cn.fujitsu.com> wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/strace/{strace_5.8.bb => strace_5.9.bb}
> (95%)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.8.bb
> b/meta/recipes-devtools/strace/strace_5.9.bb
> similarity index 95%
> rename from meta/recipes-devtools/strace/strace_5.8.bb
> rename to meta/recipes-devtools/strace/strace_5.9.bb
> index 0415588b97..bee2616a44 100644
> --- a/meta/recipes-devtools/strace/strace_5.8.bb
> +++ b/meta/recipes-devtools/strace/strace_5.9.bb
> @@ -16,7 +16,7 @@ SRC_URI = "
> https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>
> file://0001-xlat-Mark-IPPROTO_MAX-last-in-IPPROTO_-constants.patch \
>             "
> -SRC_URI[sha256sum] =
> "df4a669f7fff9cc302784085bd4b72fab216a426a3f72c892b28a537b71e7aa9"
> +SRC_URI[sha256sum] =
> "39473eb8465546c3e940fb663cb381eba5613160c7302794699d194a4d5d66d9"
>
>  inherit autotools ptest
>
> --
> 2.25.1
>
>
>
>
> 
>
>

--000000000000f303b905b1c62839
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for the update - but please note that right=
 the feature freeze for the release is in effect, which means no recipe ver=
sion updates are accepted. It&#39;s better to hold the patches until the ne=
w release is out. You can find the current status from weekly status emails=
 sent to this list.</div><div><br></div><div>Alex<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 16 Oct 2=
020 at 04:21, zangrc &lt;<a href=3D"mailto:zangrc.fnst@cn.fujitsu.com">zang=
rc.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Signed-off-by: Zang Ruochen &lt;<a href=3D"mailto:zan=
grc.fnst@cn.fujitsu.com" target=3D"_blank">zangrc.fnst@cn.fujitsu.com</a>&g=
t;<br>
---<br>
=C2=A0meta/recipes-devtools/strace/{<a href=3D"http://strace_5.8.bb" rel=
=3D"noreferrer" target=3D"_blank">strace_5.8.bb</a> =3D&gt; <a href=3D"htt=
p://strace_5.9.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.9.bb</a>} =
| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/strace/{<a href=3D"http://strace_5.8.bb=
" rel=3D"noreferrer" target=3D"_blank">strace_5.8.bb</a> =3D&gt; <a href=3D=
"http://strace_5.9.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.9.bb</=
a>} (95%)<br>
<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.8.bb"=
 rel=3D"noreferrer" target=3D"_blank">strace_5.8.bb</a> b/meta/recipes-devt=
ools/strace/<a href=3D"http://strace_5.9.bb" rel=3D"noreferrer" target=3D"_=
blank">strace_5.9.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/strace/<a href=3D"http://strace_5.8.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_5.8.bb</a><br>
rename to meta/recipes-devtools/strace/<a href=3D"http://strace_5.9.bb" re=
l=3D"noreferrer" target=3D"_blank">strace_5.9.bb</a><br>
index 0415588b97..bee2616a44 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.8.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.8.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.9.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.9.bb</a><br>
@@ -16,7 +16,7 @@ SRC_URI =3D &quot;<a href=3D"https://strace.io/files/$%7=
BPV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-strace-fix-reproduci=
bilty-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-xlat-Mark-IPPROTO_MA=
X-last-in-IPPROTO_-constants.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;df4a669f7fff9cc302784085bd4b72fab216a426a3f7=
2c892b28a537b71e7aa9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;39473eb8465546c3e940fb663cb381eba5613160c730=
2794699d194a4d5d66d9&quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f303b905b1c62839--
