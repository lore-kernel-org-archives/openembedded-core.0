Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.2166.1591064827502641379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 19:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z4s+ol5D;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id f18so11228512qkh.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 19:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3a+LcDiBIa1+Z7Xd1T6+IYTTUCuLs58clBUlNxLm1UI=;
        b=Z4s+ol5DBxbH/VzeaCvisMoodJiAczuW59XuaG1ZtHfl9efLKWcjGLbk4HFw/2Iaxm
         gwBMvqnDYKGI6R4CvPmJDWxfjy93O/Ha1dJ5VGmgzPFKUYKvAoyklTPixVFnRf54LuZP
         vUoq/NsEGfZQr+ghwlJ963XEDQHpamhteOsEHU+eIIr5JxcgvEJbKUv+YT1cSTjCONBT
         52UGf0nXhiU95OWrkAg3BMoV8V3giKb2U2wYSyshTjTDgWE7mQlqJqIp4/mG3V47elb6
         2jdYeGOfopLVtA8+EN9uA4DjSpoQ5pgJi0yJDjyR2vMdxhHKFq3Uvh3Y6daFf/W1vheU
         VLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3a+LcDiBIa1+Z7Xd1T6+IYTTUCuLs58clBUlNxLm1UI=;
        b=HVdPbl+yKR68hu7I7QsRwwoSV2uRJv7OuAMto0tEBDSgjRFQk7J87z+bHWpSSkjFZT
         BEgLQL5DgduJKk/sTYgbF1FSgtS+WR4TGd5AuXdFOMN25zSNhYwbslzp5z6j3YwEuSyK
         ha6Pc/SAr9b8utIaZLpPTSlMdctpUp16B0/O6aSc71SdtrRveTT+cJb3ZJBzltMhebVM
         uihEEV1tmc7Ybo5+iTXLM2L6nH0YEiqvdTKCMZJfRi/48QjwRgxywJm3aCvXqeeFvw5d
         qIOv6wPOimj5CgcnAqPaWieL9uq9C4AXjf2uh/gHA8YCnJfK7oJoY0MFkw32iVjOGTDl
         +w8g==
X-Gm-Message-State: AOAM532fJqE8akQ3kiqQ5r4mNwK7/8N/QCUUA0Avn1QCisd34g4EH+m3
	d1FlBmKPWllQMXAKhz004va8EwnSbkYDWJXSswM=
X-Google-Smtp-Source: ABdhPJwiTdV4w5b3pjYrOd4BBvAOJXx1Ltwpmq1k98r7LjhaA+5tR0G8rvpAiG3mBtf9zZWuWmv4YBtrjJ9NPZUIe9s=
X-Received: by 2002:a37:9c55:: with SMTP id f82mr22617082qke.225.1591064826462;
 Mon, 01 Jun 2020 19:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com> <20200531155254.10283-17-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-17-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 19:26:55 -0700
Message-ID: <CAMKF1sry+bdb+JF9o74GfgERR0=fKwC4ZT34B5pZKN5to+Z=hQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/70] strace: upgrade 5.5 -> 5.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cbc7e105a710a5cb"

--000000000000cbc7e105a710a5cb
Content-Type: text/plain; charset="UTF-8"

On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../strace/{strace_5.5.bb => strace_5.6.bb}                 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/strace/{strace_5.5.bb => strace_5.6.bb}
> (90%)
>
> diff --git a/meta/recipes-devtools/strace/strace_5.5.bb
> b/meta/recipes-devtools/strace/strace_5.6.bb
> similarity index 90%
> rename from meta/recipes-devtools/strace/strace_5.5.bb
> rename to meta/recipes-devtools/strace/strace_5.6.bb
> index ae552da028..53679cd0d2 100644
> --- a/meta/recipes-devtools/strace/strace_5.5.bb
> +++ b/meta/recipes-devtools/strace/strace_5.6.bb
> @@ -15,8 +15,8 @@ SRC_URI = "
> https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>             "
> -SRC_URI[md5sum] = "dbce2e84632b39a4ed86b9fc60447af9"
> -SRC_URI[sha256sum] =
> "9f58958c8e59ea62293d907d10572e352b582bd7948ed21aa28ebb47e5bf30ff"
> +SRC_URI[md5sum] = "f8e0394d4e537b3faadf0a72f5d1d17e"
> +SRC_URI[sha256sum] =
> "189968eeae06ed9e20166ec55a830943c84374676a457c9fe010edc7541f1b01"
>
>  inherit autotools ptest
>
> @@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??= "\
>  PACKAGECONFIG[bluez] =
> "ac_cv_header_bluetooth_bluetooth_h=yes,ac_cv_header_bluetooth_bluetooth_h=no,bluez5"
>  PACKAGECONFIG[libunwind] =
> "--with-libunwind,--without-libunwind,libunwind"
>
> -EXTRA_OECONF += "--enable-mpers=no"
> +EXTRA_OECONF += "--enable-mpers=no --disable-gcc-Werror"


Why is this needed ? Perhaps description in comment will help


>
>  CFLAGS_append_libc-musl = " -Dsigcontext_struct=sigcontext"
>
> --
> 2.26.2
>
> 
>

--000000000000cbc7e105a710a5cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 31, 2020 at 8:53 AM Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin=
@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../strace/{<a href=3D"http://strace_5.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">strace_5.5.bb</a> =3D&gt; <a href=3D"http://strace_5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">strace_5.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/strace/{<a href=3D"http://strace_5.5.bb=
" rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a> =3D&gt; <a href=3D=
"http://strace_5.6.bb" rel=3D"noreferrer" target=3D"_blank">strace_5.6.bb</=
a>} (90%)<br>
<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a> b/meta/recipes-devt=
ools/strace/<a href=3D"http://strace_5.6.bb" rel=3D"noreferrer" target=3D"_=
blank">strace_5.6.bb</a><br>
similarity index 90%<br>
rename from meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_5.5.bb</a><br>
rename to meta/recipes-devtools/strace/<a href=3D"http://strace_5.6.bb" re=
l=3D"noreferrer" target=3D"_blank">strace_5.6.bb</a><br>
index ae552da028..53679cd0d2 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_5.5.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.5.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_5.6.bb" rel=3D=
"noreferrer" target=3D"_blank">strace_5.6.bb</a><br>
@@ -15,8 +15,8 @@ SRC_URI =3D &quot;<a href=3D"https://strace.io/files/$%7=
BPV%7D/strace-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//strace.io/files/${PV}/strace-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://uintptr_t.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-strace-fix-reproduci=
bilty-issues.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;dbce2e84632b39a4ed86b9fc60447af9&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9f58958c8e59ea62293d907d10572e352b582bd7948e=
d21aa28ebb47e5bf30ff&quot;<br>
+SRC_URI[md5sum] =3D &quot;f8e0394d4e537b3faadf0a72f5d1d17e&quot;<br>
+SRC_URI[sha256sum] =3D &quot;189968eeae06ed9e20166ec55a830943c84374676a45=
7c9fe010edc7541f1b01&quot;<br>
<br>
=C2=A0inherit autotools ptest<br>
<br>
@@ -27,7 +27,7 @@ PACKAGECONFIG_class-target ??=3D &quot;\<br>
=C2=A0PACKAGECONFIG[bluez] =3D &quot;ac_cv_header_bluetooth_bluetooth_h=3D=
yes,ac_cv_header_bluetooth_bluetooth_h=3Dno,bluez5&quot;<br>
=C2=A0PACKAGECONFIG[libunwind] =3D &quot;--with-libunwind,--without-libunw=
ind,libunwind&quot;<br>
<br>
-EXTRA_OECONF +=3D &quot;--enable-mpers=3Dno&quot;<br>
+EXTRA_OECONF +=3D &quot;--enable-mpers=3Dno --disable-gcc-Werror&quot;</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Why is this needed =
? Perhaps description in comment will help=C2=A0</div><div dir=3D"auto"><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br>
<br>
=C2=A0CFLAGS_append_libc-musl =3D &quot; -Dsigcontext_struct=3Dsigcontext&=
quot;<br>
<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div></div>

--000000000000cbc7e105a710a5cb--
