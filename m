Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web12.25102.1611129075025490091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tBKePdmD;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id o19so12583085vsn.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 23:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Qw3NPK8ZuimjWxJbyYNFuAl8bsyxNoLgVQzX1qlIhI=;
        b=tBKePdmDm/YbOTA55oxKS2VCg9pbfjxi8Mny2xgN7XVGXPhCSUvKYPuG1FntjeAGHo
         5ad7EtFD1n05AhFV/dIoFHWtZmwD6LnJ13uXudeKIKodkx+t14DeYtVDHKziUD1IMy56
         9G4b3gUhjnuOFuwOWdsJUf5CFIvPBt6mDeF3O/JCJdUHBH+QRhiw287rGMVyqjfrPFId
         FFw0gUHUYXrKGJSLTYJlh+1dArVx6W30t8DejwPgOrfi6/fY9SJ/LdaYPm8JmrL3ujFl
         q6kyvd7x+KAESyV+cqg5IzcZDjasaSIDU65RhZC+Yj7XnXBfjs4G+1Q/4w9CaTxe05H2
         CPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Qw3NPK8ZuimjWxJbyYNFuAl8bsyxNoLgVQzX1qlIhI=;
        b=CHVZ/unjArkovngeuM9oAfQImRdX3MHKX8+qA56ZvSUhfbANQjjoJgxYY1VsWh3N+5
         5hmRZBs8Tg4p4MY6TJiQdJay22xYLBM3+zlZlrQxScTwP6+azUXjWTRRO9sdjSTTvWIS
         IWJrHFPiLIK7HRoepdC7AwViLCdlxAUP3YGG7v18JkEs+lSvzqMlQFdPi4xRW9A69SO4
         RKQlH7858vUa2KijQM5TSgODkJwzwMClNtG/1QiiuiSzU0rphgvvxRxLqsDa9fhnvKvQ
         ZcQb9in2qWApNjxqlFdktyftr63oXxBQJ11zNDns+nabq2pJMZkEz4w0I3s+hev+YqUH
         gkWA==
X-Gm-Message-State: AOAM533qpwa8KUVNvj/FRP2gRdglGQdEOBVHLpSTR+2KXPSy9Egm8j6R
	NwUldmka5ejd5KhhLzXMdO3KUlxkQwvhxIfvLEQ=
X-Google-Smtp-Source: ABdhPJxR1eFQLxyfT0MYTfnwKdvWcqMysBrxRl8MrW+Hn40IPVvueCR95JK+vMYNw/KlqWk1rikgBmilcVsX9RIosz8=
X-Received: by 2002:a67:7750:: with SMTP id s77mr5696213vsc.31.1611129073474;
 Tue, 19 Jan 2021 23:51:13 -0800 (PST)
MIME-Version: 1.0
References: <20210120074058.252462-1-anuj.mittal@intel.com>
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 20 Jan 2021 08:51:01 +0100
Message-ID: <CANNYZj-hdZcV1emWWncrBsxrpEGACnCv-hZAYxGhNOD3Za8RsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/10] acpica: upgrade 20201217 -> 20210105
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001c9e2905b950389f"

--0000000000001c9e2905b950389f
Content-Type: text/plain; charset="UTF-8"

Thanks for picking these up Anuj, much appreciated! I'd like version
updates to not be only 'Alex's problem', and spread the work a bit more.

Alex

On Wed, 20 Jan 2021 at 08:41, Anuj Mittal <anuj.mittal@intel.com> wrote:

> License-Update: copyright years changed
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../acpica/{acpica_20201217.bb => acpica_20210105.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/acpica/{acpica_20201217.bb =>
> acpica_20210105.bb} (91%)
>
> diff --git a/meta/recipes-extended/acpica/acpica_20201217.bb
> b/meta/recipes-extended/acpica/acpica_20210105.bb
> similarity index 91%
> rename from meta/recipes-extended/acpica/acpica_20201217.bb
> rename to meta/recipes-extended/acpica/acpica_20210105.bb
> index 91bcd8a46d..48b560db53 100644
> --- a/meta/recipes-extended/acpica/acpica_20201217.bb
> +++ b/meta/recipes-extended/acpica/acpica_20210105.bb
> @@ -10,14 +10,14 @@ HOMEPAGE = "http://www.acpica.org/"
>  SECTION = "console/tools"
>
>  LICENSE = "Intel | BSD | GPLv2"
> -LIC_FILES_CHKSUM =
> "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=6adbcb81e9ee6ae50c569b94fe12f7c5"
> +LIC_FILES_CHKSUM =
> "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=c33ce358fdcd142684e41e336b7992e8"
>
>  COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
>
>  DEPENDS = "m4-native flex-native bison-native"
>
>  SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz
> "
> -SRC_URI[sha256sum] =
> "df6bb667c60577c89df5abe3270539c1b9716b69409d1074d6a7fc5c2fea087b"
> +SRC_URI[sha256sum] =
> "a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0c9b0f6049f996dbb1ff8"
>
>  UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
>
> --
> 2.29.2
>
>
> 
>
>

--0000000000001c9e2905b950389f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for picking these up Anuj, much appreciated! I=
&#39;d like version updates to not be only &#39;Alex&#39;s problem&#39;, an=
d spread the work a bit more.</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, 20 Jan 2021 at 08:41, Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel=
.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">License-Update: copyright years changed<br>
<br>
Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" ta=
rget=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
---<br>
=C2=A0.../acpica/{<a href=3D"http://acpica_20201217.bb" rel=3D"noreferrer"=
 target=3D"_blank">acpica_20201217.bb</a> =3D&gt; <a href=3D"http://acpica_=
20210105.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20210105.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/acpica/{<a href=3D"http://acpica_202012=
17.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20201217.bb</a> =3D&gt; =
<a href=3D"http://acpica_20210105.bb" rel=3D"noreferrer" target=3D"_blank">=
acpica_20210105.bb</a>} (91%)<br>
<br>
diff --git a/meta/recipes-extended/acpica/<a href=3D"http://acpica_2020121=
7.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20201217.bb</a> b/meta/re=
cipes-extended/acpica/<a href=3D"http://acpica_20210105.bb" rel=3D"noreferr=
er" target=3D"_blank">acpica_20210105.bb</a><br>
similarity index 91%<br>
rename from meta/recipes-extended/acpica/<a href=3D"http://acpica_20201217=
.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20201217.bb</a><br>
rename to meta/recipes-extended/acpica/<a href=3D"http://acpica_20210105.b=
b" rel=3D"noreferrer" target=3D"_blank">acpica_20210105.bb</a><br>
index 91bcd8a46d..48b560db53 100644<br>
--- a/meta/recipes-extended/acpica/<a href=3D"http://acpica_20201217.bb" r=
el=3D"noreferrer" target=3D"_blank">acpica_20201217.bb</a><br>
+++ b/meta/recipes-extended/acpica/<a href=3D"http://acpica_20210105.bb" r=
el=3D"noreferrer" target=3D"_blank">acpica_20210105.bb</a><br>
@@ -10,14 +10,14 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.acpica.org/" =
rel=3D"noreferrer" target=3D"_blank">http://www.acpica.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/tools&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;Intel | BSD | GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://source/compiler/aslcompile.c;beginline=
=3D7;endline=3D150;md5=3D6adbcb81e9ee6ae50c569b94fe12f7c5&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://source/compiler/aslcompile.c;beginline=
=3D7;endline=3D150;md5=3Dc33ce358fdcd142684e41e336b7992e8&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;(i.86|x86_64|arm|aarch64).*-linux&quot;<br=
>
<br>
=C2=A0DEPENDS =3D &quot;m4-native flex-native bison-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://acpica.org/sites/acpica/files/a=
cpica-unix-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://a=
cpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;df6bb667c60577c89df5abe3270539c1b9716b69409d=
1074d6a7fc5c2fea087b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a9be7b749025e60f93fde2fe531bfe0d84a33641d3e0=
c9b0f6049f996dbb1ff8&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://acpica.org/downloads=
" rel=3D"noreferrer" target=3D"_blank">https://acpica.org/downloads</a>&quo=
t;<br>
<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000001c9e2905b950389f--
