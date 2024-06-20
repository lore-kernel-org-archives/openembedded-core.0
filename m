Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5245EC2BA1A
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 16:39:22 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.52436.1718901560134168013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 09:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TvPAh9rE;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-63267c30eaaso10742597b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718901559; x=1719506359; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T7s+2Np8MIIDN4mbBHwdBcUqNrklm+7ICn+zf+XDhPA=;
        b=TvPAh9rEVq81/YlCdQK/5/CffU2Ij3OSxC1OVSnB5rfzy1TXQk18VFwPvaPuGdMjti
         SvK8v3+9wvXEZJBG0X6FM4tYTnoBO73hH2Xk5JvqkDE79R+HtA6ePnwSz98V07lKKzmD
         IEZ2IkS8VyppxNGSh2B3YBi/Ra+T1Zm7QeuikqJSBDmU9nd6XgqANp+QMdxtcYS+H87M
         nM2+8igZLeqfhZTNV8HbEvFzt8VI3KDFEy7w3VaaVyKAvYdyVGodJXaywY+es0HaRGiH
         y6xoJBUKj/j9tKG/Oh+t4F1aRerEMrI/sM90Pgrw4uJfiXT4P1xYGN5/cI5Gig2B0QA3
         GOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718901559; x=1719506359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7s+2Np8MIIDN4mbBHwdBcUqNrklm+7ICn+zf+XDhPA=;
        b=Wzj4reD9rNCq1JqxeSQ8Zi1Ss3uMJkSLWYT+4N1ItpIu3+7lJ8s1Ozxc+shhf5bsqi
         NQaT44RKq1r1Kv/fdkxNrH22Bca80uOGUHnohWGvJAQ0i3AdAGUCQqHkulT5kgJGL9JJ
         qlzmSF2jiS5w8gdxRPM2wulmFZ9PWbqzYQQJWu+LcvdWK1dRynaj9jyuAa+ct0f0o3xe
         dKwPPEIx1sqsuI/v8gbG+5LT0zpztMoYCGTgbR113GKJycJ21Dox95tiJB/XReWuSmw7
         f1zUC6DwYcrVhTLnOFWr+BC0XXgLHxki/TMzeL3XQic2HZKlcEdpQVK9H/LXEFlyFo3w
         kIpA==
X-Gm-Message-State: AOJu0YyWPPah+kKqDExNyYTaR0UM7llzi/CrX3MTh5Phe3MgGNs2VENH
	fkKVlI6tRPLshcT/wjvPO/tEObBrVeCQAOx8dogcEXA4pS184U2xXNBkT84JGoQNJV2W1m+Knfq
	Zl8FlDl97VVDAWGMgN3cE9oufKf0dia+e
X-Google-Smtp-Source: AGHT+IFsiUgm5sHiPTrf8IiAERTO/ogc5bfum9B6GONkV3p0OCqS2qf37Ftk/7TRqtwVOAOKy14CbSOxMFRGyYMBgIw=
X-Received: by 2002:a05:690c:24d:b0:63b:eed2:64bf with SMTP id
 00721157ae682-63beed26605mr34220977b3.32.1718901558928; Thu, 20 Jun 2024
 09:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240620140753.392220-1-tgamblin@baylibre.com> <20240620140753.392220-5-tgamblin@baylibre.com>
In-Reply-To: <20240620140753.392220-5-tgamblin@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 20 Jun 2024 09:39:07 -0700
Message-ID: <CANx9H-Cjeo3r7vwF3ZH_kXn-GY9Obzk+STHQdzPMXDvVi+4-rg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 5/6] maintainers.inc: add self for unassigned
 python recipes
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d2ee62061b54f4d7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 16:39:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200966

--000000000000d2ee62061b54f4d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 7:08=E2=80=AFAM Trevor Gamblin via lists.openembedd=
ed.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> Add myself as maintainer for the following:
>
> - python3-setuptools
> - python3-smmap
> - python3-subunit
> - python3-testtools
>
> With that, every Python recipe in oe-core has a maintainer assigned.
>

Thank you for helping out. This is a welcome improvement to our coverage.


>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 42599267c1..422a3751d6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -696,12 +696,12 @@ RECIPE_MAINTAINER:pn-python3-rpds-py =3D "Tim Orlin=
g <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-ruamel-yaml =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-scons =3D "Tim Orling <tim.orling@konsulko.=
com
> >"
>  RECIPE_MAINTAINER:pn-python3-semantic-version =3D "Tim Orling <
> tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-setuptools =3D "Unassigned <
> unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-python3-setuptools =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-setuptools-rust =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-six =3D "Zang Ruochen <zangruochen@loongson=
.cn
> >"
>  RECIPE_MAINTAINER:pn-python3-smartypants =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> -RECIPE_MAINTAINER:pn-python3-smmap =3D "Unassigned <
> unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-python3-smmap =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sortedcontainers =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-spdx-tools =3D "Marta Rybczynska <
> mrybczynska@syslinbit.com>"
> @@ -714,8 +714,8 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery =3D
> "Tim Orling <tim.orling@kons
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml =3D "Tim Orli=
ng <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme =3D "Tim Orling <
> tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-subunit =3D "Unassigned <
> unassigned@yoctoproject.org>"
> -RECIPE_MAINTAINER:pn-python3-testtools =3D "Unassigned <
> unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-python3-subunit =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
> +RECIPE_MAINTAINER:pn-python3-testtools =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-toml =3D "Tim Orling <tim.orling@konsulko.c=
om
> >"
>  RECIPE_MAINTAINER:pn-python3-tomli =3D "Tim Orling <tim.orling@konsulko.=
com
> >"
>  RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200960):
> https://lists.openembedded.org/g/openembedded-core/message/200960
> Mute This Topic: https://lists.openembedded.org/mt/106780486/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d2ee62061b54f4d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 20, 2024 at 7:08=E2=80=AF=
AM Trevor Gamblin via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;tgamblin=3D<a href=3D"mailto:baylibre.com@lists.openemb=
edded.org">baylibre.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Add myself as maintainer for =
the following:<br>
<br>
- python3-setuptools<br>
- python3-smmap<br>
- python3-subunit<br>
- python3-testtools<br>
<br>
With that, every Python recipe in oe-core has a maintainer assigned.<br></b=
lockquote><div><br></div><div>Thank you for helping out. This is a welcome =
improvement to our coverage.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 42599267c1..422a3751d6 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -696,12 +696,12 @@ RECIPE_MAINTAINER:pn-python3-rpds-py =3D &quot;Tim Or=
ling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.o=
rling@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-ruamel-yaml =3D &quot;Bruce Ashfield &lt=
;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfie=
ld@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-scons =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-semantic-version =3D &quot;Tim Orling &l=
t;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@k=
onsulko.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-setuptools =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-setuptools =3D &quot;Trevor Gamblin &lt;<a hr=
ef=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-setuptools-rust =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D &quot;Trevor Gamblin =
&lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@bay=
libre.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-six =3D &quot;Zang Ruochen &lt;<a href=
=3D"mailto:zangruochen@loongson.cn" target=3D"_blank">zangruochen@loongson.=
cn</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-smartypants =3D &quot;Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-smmap =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-smmap =3D &quot;Trevor Gamblin &lt;<a href=3D=
"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</a>&=
gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sortedcontainers =3D &quot;Tim Orling &l=
t;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@k=
onsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-spdx-tools =3D &quot;Marta Rybczynska &l=
t;<a href=3D"mailto:mrybczynska@syslinbit.com" target=3D"_blank">mrybczynsk=
a@syslinbit.com</a>&gt;&quot;<br>
@@ -714,8 +714,8 @@ RECIPE_MAINTAINER:pn-python3-sphinxcontrib-jquery =3D &=
quot;Tim Orling &lt;tim.orling@kons<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp =3D &quot;Tim Orlin=
g &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orli=
ng@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinxcontrib-serializinghtml =3D &quot;=
Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank"=
>tim.orling@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinx-rtd-theme =3D &quot;Tim Orling &l=
t;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@k=
onsulko.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-subunit =3D &quot;Unassigned &lt;<a href=3D"m=
ailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoprojec=
t.org</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-testtools =3D &quot;Unassigned &lt;<a href=3D=
"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproj=
ect.org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-subunit =3D &quot;Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-testtools =3D &quot;Trevor Gamblin &lt;<a hre=
f=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-toml =3D &quot;Tim Orling &lt;<a href=3D=
"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-tomli =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D &quot;Trevor Gambl=
in &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@=
baylibre.com</a>&gt;&quot;<br>
-- <br>
2.45.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#200960): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/200960" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/200960</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106780486/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106780486/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d2ee62061b54f4d7--

