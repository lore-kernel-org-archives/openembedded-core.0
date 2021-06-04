Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web11.5992.1622797891648084059
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i4LyVIKt;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id e12so2233272ual.7
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=2bjOVHsHQqEsGw+5QePaWc+xmqqGOqLgREeG0Wyt5w0=;
        b=i4LyVIKtY9Wzdmvt4KrHl5FZbDv1OVukF4Diw987Lhs1Ux7oK+PYgIHwD4iK6x4sG0
         7PNemxw/3WOHv6l8YYsP96zSrlkeAkDR/XvrWlOEs58F3LzV7bCv1Ii9HfmT0tLZ/+M9
         q4QmhKIcqSBdLdM2mYeLVJ06n5hDMbhkIWErnoFiwMbJkmwNJ0KOVX0SEwIn4GndlANY
         ld37tOGzCmwRed/Tzq0382Y/Bi30MngKoS4v9SCFsJCIc0szNEx51dyM3rRilfL6lbLd
         jPemDv27IAyylckqPm8DO2GdW7s+bxfmt0m9jnu4/vjamN43YMCoOc9ZV11XauXdyOLF
         oeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=2bjOVHsHQqEsGw+5QePaWc+xmqqGOqLgREeG0Wyt5w0=;
        b=lhtnt5svEvyo1LCtzb2fH18AI+U+NFF2l7GR9UMwUg54SZZjG/4UGPcx8tC/xk6fLn
         PZmUSNOibBy1gElLjaZmiaTkFabkebQC4uisniNK4/NwD5fjJI5g3Oab5/gT9iWLyYxG
         sZYx6P8uR5fGI1LWpCyCXZA76ynqB0LRzD2Da9Pm/4ROJkzFxYrV6IVwHvwKw7N+m4T6
         Qs+0f6HmNMSVHIrb8gGbeUCLYVcaCDQF66LoB7unkzv3R47GPBDVsdxUGR0+Wsco8KWg
         n1tjocgM0AtOGRtZ8ifCBYBNP0TJz7FLNTc1VRuLzOzvXHKkWvEEsN/SccA177PhpfRV
         qvCw==
X-Gm-Message-State: AOAM5332erd9PUMYNLvakrmegUKE0g4HGggznAeYCBY74AxGfPl7uUo+
	A/vcNjymHF4OJEzayT/pgONdPMQyINaNzJmcKEg2YaQ24sA=
X-Google-Smtp-Source: ABdhPJxEhzWDO7ZnCf4EN/1KvSqXdmOxhnFphKVwXXvmlUkZ//YOhLjGe0Sjp5AUyoXLsue7oomKZgn8ciDjNttjqMQ=
X-Received: by 2002:a05:6122:926:: with SMTP id j38mr1444194vka.8.1622797890754;
 Fri, 04 Jun 2021 02:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210604091030.1380877-1-alex.kanavin@gmail.com> <20210604091030.1380877-11-alex.kanavin@gmail.com>
In-Reply-To: <20210604091030.1380877-11-alex.kanavin@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 4 Jun 2021 11:11:19 +0200
Message-ID: <CANNYZj9aL8Po23okcycUe1t-oX-XUstuzntEkPB6KYgwg+zh9w@mail.gmail.com>
Subject: Re: [PATCH 11/11] perlcross fix
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d21de805c3ed139f"

--000000000000d21de805c3ed139f
Content-Type: text/plain; charset="UTF-8"

Whooops, too hasty! Will resend the set.

Alex

On Fri, 4 Jun 2021 at 11:10, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc            | 2 +-
>  meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb | 6 ++++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 6024d57717..89dec1f86a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -558,7 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils = "Chen Qi <
> Qi.Chen@windriver.com>"
>  RECIPE_MAINTAINER_pn-pcmanfm = "Alexander Kanavin <alex.kanavin@gmail.com
> >"
>  RECIPE_MAINTAINER_pn-perf = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER_pn-perl = "Alexander Kanavin <alex.kanavin@gmail.com>"
> -RECIPE_MAINTAINER_pn-perl-cross = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> +RECIPE_MAINTAINER_pn-perlcross = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-piglit = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER_pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER_pn-pinentry = "Armin Kuster <akuster808@gmail.com>"
> diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> index 83b7b415af..339075f0c4 100644
> --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
> @@ -8,6 +8,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
>  # but is not provided inside the release tarballs
>  LIC_FILES_CHKSUM =
> "file://${WORKDIR}/README.md;md5=252fcce2026b765fee1ad74d2fb07a3b"
>
> +inherit allarch
> +
>  SRC_URI = "
> https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross-${PV}.tar.gz;name=perl-cross
> \
>             file://README.md \
>
> file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
> @@ -27,9 +29,9 @@ do_configure () {
>  do_compile () {
>  }
>
> -do_install() {
> +do_install_class-native() {
>      mkdir -p ${D}/${datadir}/perl-cross/
> -    cp -rfp ${S}/* ${D}/${datadir}/perl-cross/
> +    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>  }
>
>  BBCLASSEXTEND = "native"
> --
> 2.31.1
>
>

--000000000000d21de805c3ed139f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Whooops, too hasty! Will resend the set.</div><div><b=
r></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, 4 Jun 2021 at 11:10, Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-o=
ff-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
=C2=A0meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a> | 6 ++++--<br=
>
=C2=A02 files changed, 5 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 6024d57717..89dec1f86a 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -558,7 +558,7 @@ RECIPE_MAINTAINER_pn-pciutils =3D &quot;Chen Qi &lt;<a =
href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-pcmanfm =3D &quot;Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-perf =3D &quot;Bruce Ashfield &lt;<a href=3D"mai=
lto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-perl =3D &quot;Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt;&quot;<br>
-RECIPE_MAINTAINER_pn-perl-cross =3D &quot;Alexander Kanavin &lt;<a href=3D=
"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a=
>&gt;&quot;<br>
+RECIPE_MAINTAINER_pn-perlcross =3D &quot;Alexander Kanavin &lt;<a href=3D"=
mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>=
&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-piglit =3D &quot;Ross Burton &lt;<a href=3D"mail=
to:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a>&gt;&quot;=
<br>
=C2=A0RECIPE_MAINTAINER_pn-pigz =3D &quot;Hongxu Jia &lt;<a href=3D"mailto:=
hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt=
;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-pinentry =3D &quot;Armin Kuster &lt;<a href=3D"m=
ailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;&=
quot;<br>
diff --git a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1=
.3.6.bb" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a> b/meta=
/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
index 83b7b415af..339075f0c4 100644<br>
--- a/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
+++ b/meta/recipes-devtools/perl-cross/<a href=3D"http://perlcross_1.3.6.bb=
" rel=3D"noreferrer" target=3D"_blank">perlcross_1.3.6.bb</a><br>
@@ -8,6 +8,8 @@ LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
=C2=A0# but is not provided inside the release tarballs<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/README.md;md5=3D252fcce2=
026b765fee1ad74d2fb07a3b&quot;<br>
<br>
+inherit allarch<br>
+<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://github.com/arsv/perl-cross/relea=
ses/download/$%7BPV%7D/perl-cross-$%7BPV%7D.tar.gz;name=3Dperl-cross" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/arsv/perl-cross/releas=
es/download/${PV}/perl-cross-${PV}.tar.gz;name=3Dperl-cross</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://README.md \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-configure_tool.sh-do-=
not-quote-the-argument-to-comma.patch \<br>
@@ -27,9 +29,9 @@ do_configure () {<br>
=C2=A0do_compile () {<br>
=C2=A0}<br>
<br>
-do_install() {<br>
+do_install_class-native() {<br>
=C2=A0 =C2=A0 =C2=A0mkdir -p ${D}/${datadir}/perl-cross/<br>
-=C2=A0 =C2=A0 cp -rfp ${S}/* ${D}/${datadir}/perl-cross/<br>
+=C2=A0 =C2=A0 cp -rf ${S}/* ${D}/${datadir}/perl-cross/<br>
=C2=A0}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000d21de805c3ed139f--
