Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45AFC25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 04:14:47 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.2164.1716351281274186479
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 21:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fRS0qGxS;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-622e32414ffso44059537b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 May 2024 21:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716351280; x=1716956080; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vuebKCgT86ZxVJJbI+X8yt4yS9FFvMHVehHqj5qR1xQ=;
        b=fRS0qGxSwxhIY/EEyjb+8pLWTjGjDDAbYZ6uETa7AYWl6RPkPbtYQof7jUKFbfCNdT
         6fO7x2xUwkVvn4Mgk3hNnu0jLdygowe1W27qBHA9knzci4BSKGHl2KLI9DorjEGEI0UB
         Qo4gfM5nhJTb0rUaPxM8sp6p8Y8ixrATPSAwMsouSzvXVAhN6e5bxv1hhFaTirUk9UP9
         LFtft1f75I7vaO5G8KPeXZWX2lsL4yDFgsB3yrHxbNCobAjXdFbTBhjzzBIfpHS7A/1K
         Mo05WQYYHT3xXfqQNOBut8VdNLfy/P2ZSF1GANswQxF0NehYHD6rd+PEy3JcZe3Ef3n0
         q7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716351280; x=1716956080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuebKCgT86ZxVJJbI+X8yt4yS9FFvMHVehHqj5qR1xQ=;
        b=SIqNUWnGYlusRyazvVGEgbW7apJX9EOD43eHYsBuUDrvBbmMtDt6VB+JV3T905JTgI
         Ef06MxncRvZ9y/U37PNA2l0iMX6QFZd3ACX1e00x/V2dlM4hAEGTD8Hz66dDwhqtv8hY
         +HYRNkDdvWo7CEQTG11hpCICgqCghu6rwgvH7vgOeLz9CfaRWhS5/amIXsYIwKOLSQFJ
         6JNOd4Owxi562IHAez6XVMUyGrjAx2KAO87yiJjnG2KnRaz6yTDTYORISGQwbyi3IOkW
         4/C9lrq7WmkAQuxCASdqq5psEEtQbznXZ/a/+g4GajRHnF1u7ChDBg66buLrfYSF9Lnf
         xW7w==
X-Gm-Message-State: AOJu0Yy/jmeD5gAh0A3WQS59Bd+el8iV+bTXIkkj+Bs8VRRvZsyZfrWS
	Jz9rq8WTHN5xzMnTiav4WdPl4vD74SnNCc1OhXwgKQHKylWn5rRCS1i/6CTmw4yCspAdUDSJ2P1
	f7AsG3zSgka1g4+fTc9OI15y+xYI=
X-Google-Smtp-Source: AGHT+IGx0Dk5AxEXP/azPXoMVwrLzNMg4+/FYqA2cEN5j2kFhhLrqofmQwsYyq5wHrq/QsKF0gBe+IhSzzcGbHh9zDQ=
X-Received: by 2002:a81:924e:0:b0:61e:a66:bccd with SMTP id
 00721157ae682-627e48557edmr15331297b3.38.1716351280273; Tue, 21 May 2024
 21:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240521170445.1892398-1-tgamblin@baylibre.com> <20240521170445.1892398-10-tgamblin@baylibre.com>
In-Reply-To: <20240521170445.1892398-10-tgamblin@baylibre.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 21 May 2024 21:14:29 -0700
Message-ID: <CANx9H-C2KMUFoYXu6=tbLwPt9x8x8VuzrwoGepWS4F3a=udHDg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 10/10] maintainers.inc: transfer some python
 recipes to tgamblin
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, tim.orling@konsulko.com
Content-Type: multipart/alternative; boundary="0000000000005ee13f0619032c98"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199680

--0000000000005ee13f0619032c98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 21, 2024 at 10:05=E2=80=AFAM Trevor Gamblin via lists.openembed=
ded.org
<tgamblin=3Dbaylibre.com@lists.openembedded.org> wrote:

> Change maintainer for the following recipes to tgamblin:
>
> python3-hypothesis
> python3-pygments
> python3-pytest
> python3-referencing
> python3-pyproject-metadata
> python3-setuptools-scm
> python3-sphinx
>

Thank you for picking up part of the workload.
This is much appreciated.
=E2=80=94Tim


> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index aab53c22eb8..2124f3e7ec6 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -627,7 +627,7 @@ RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D "Br=
uce
> Ashfield <bruce.ashfield@
>  RECIPE_MAINTAINER:pn-python3-editables =3D "Ross Burton <
> ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-pycryptodome =3D "Joshua Watt <
> JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pycryptodomex =3D "Joshua Watt <
> JPEWhacker@gmail.com>"
> -RECIPE_MAINTAINER:pn-python3-pyproject-metadata =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-pyproject-metadata =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-pyrsistent =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-extras =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-flit-core =3D "Tim Orling <
> tim.orling@konsulko.com>"
> @@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-gitdb =3D "Trevor Gambli=
n <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-hatchling =3D "Ross Burton <
> ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme =3D "Ross Burton <
> ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-hatch-vcs =3D "Ross Burton <
> ross.burton@arm.com>"
> -RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-hypothesis =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-idna =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-imagesize =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D "Tim Orling <
> tim.orling@konsulko.com>"
> @@ -676,19 +676,19 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 =3D "Tim Orling=
 <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pycairo =3D "Zang Ruochen <
> zangruochen@loongson.cn>"
>  RECIPE_MAINTAINER:pn-python3-pycparser =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyelftools =3D "Joshua Watt <
> JPEWhacker@gmail.com>"
> -RECIPE_MAINTAINER:pn-python3-pygments =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-pygments =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-pygobject =3D "Zang Ruochen <
> zangruochen@loongson.cn>"
>  RECIPE_MAINTAINER:pn-python3-pyopenssl =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyparsing =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-pyproject-hooks =3D "Ross Burton <
> ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-pysocks =3D "Tim Orling <
> tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-pytest =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-pytest =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-pytest-runner =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om
> >"
>  RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu <wangmy@fujitsu.com=
>"
> -RECIPE_MAINTAINER:pn-python3-referencing =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-referencing =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-requests =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-rfc3339-validator =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-rfc3986-validator =3D "Bruce Ashfield <
> bruce.ashfield@gmail.com>"
> @@ -699,14 +699,14 @@ RECIPE_MAINTAINER:pn-python3-scons =3D "Tim Orling =
<
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-semantic-version =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-setuptools =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-setuptools-rust =3D "Tim Orling <
> tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-six =3D "Zang Ruochen <zangruochen@loongson=
.cn
> >"
>  RECIPE_MAINTAINER:pn-python3-smartypants =3D "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-smmap =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sortedcontainers =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-spdx-tools =3D "Marta Rybczynska <
> mrybczynska@syslinbit.com>"
> -RECIPE_MAINTAINER:pn-python3-sphinx =3D "Tim Orling <
> tim.orling@konsulko.com>"
> +RECIPE_MAINTAINER:pn-python3-sphinx =3D "Trevor Gamblin <
> tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp =3D "Tim Orling <
> tim.orling@konsulko.com>"
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199666):
> https://lists.openembedded.org/g/openembedded-core/message/199666
> Mute This Topic: https://lists.openembedded.org/mt/106227247/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005ee13f0619032c98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, May 21, 2024 at 10:05=E2=80=AFAM Trevor Gamblin via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;t=
gamblin=3D<a href=3D"mailto:baylibre.com@lists.openembedded.org">baylibre.c=
om@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Change m=
aintainer for the following recipes to tgamblin:<br>
<br>
python3-hypothesis<br>
python3-pygments<br>
python3-pytest<br>
python3-referencing<br>
python3-pyproject-metadata<br>
python3-setuptools-scm<br>
python3-sphinx<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you for pi=
cking up part of the workload.</div><div dir=3D"auto">This is much apprecia=
ted.</div><div dir=3D"auto">=E2=80=94Tim</div><div dir=3D"auto"><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:tgamblin@baylibre.com" =
target=3D"_blank">tgamblin@baylibre.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index aab53c22eb8..2124f3e7ec6 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -627,7 +627,7 @@ RECIPE_MAINTAINER:pn-python3-dtschema-wrapper =3D &quot=
;Bruce Ashfield &lt;bruce.ashfield@<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-editables =3D &quot;Ross Burton &lt;<a h=
ref=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pycryptodome =3D &quot;Joshua Watt &lt;<=
a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pycryptodomex =3D &quot;Joshua Watt &lt;=
<a href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.=
com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-pyproject-metadata =3D &quot;Tim Orling &lt;<=
a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@kons=
ulko.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-pyproject-metadata =3D &quot;Trevor Gamblin &=
lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@bayl=
ibre.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyrsistent =3D &quot;Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-extras =3D &quot;Trevor Gamblin &lt;<a h=
ref=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-flit-core =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
@@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-gitdb =3D &quot;Trevor Gam=
blin &lt;<a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgambli=
n@baylibre.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-hatchling =3D &quot;Ross Burton &lt;<a h=
ref=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a=
>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-hatch-fancy-pypi-readme =3D &quot;Ross B=
urton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.bur=
ton@arm.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-hatch-vcs =3D &quot;Ross Burton &lt;<a h=
ref=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.com</a=
>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-hypothesis =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-hypothesis =3D &quot;Trevor Gamblin &lt;<a hr=
ef=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com=
</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-idna =3D &quot;Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-imagesize =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D &quot;Tim Orling =
&lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling=
@konsulko.com</a>&gt;&quot;<br>
@@ -676,19 +676,19 @@ RECIPE_MAINTAINER:pn-python3-pyasn1 =3D &quot;Tim Orl=
ing &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.or=
ling@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pycairo =3D &quot;Zang Ruochen &lt;<a hr=
ef=3D"mailto:zangruochen@loongson.cn" target=3D"_blank">zangruochen@loongso=
n.cn</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pycparser =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyelftools =3D &quot;Joshua Watt &lt;<a =
href=3D"mailto:JPEWhacker@gmail.com" target=3D"_blank">JPEWhacker@gmail.com=
</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-pygments =3D &quot;Tim Orling &lt;<a href=3D"=
mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</=
a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-pygments =3D &quot;Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pygobject =3D &quot;Zang Ruochen &lt;<a =
href=3D"mailto:zangruochen@loongson.cn" target=3D"_blank">zangruochen@loong=
son.cn</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyopenssl =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyparsing =3D &quot;Trevor Gamblin &lt;<=
a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyproject-hooks =3D &quot;Ross Burton &l=
t;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.burton@arm.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pysocks =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-pytest =3D &quot;Tim Orling &lt;<a href=3D"ma=
ilto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-pytest =3D &quot;Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pytest-runner =3D &quot;Tim Orling &lt;<=
a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@kons=
ulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pytz =3D &quot;Tim Orling &lt;<a href=3D=
"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-pyyaml =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-rdflib =3D &quot;Wang Mingyu &lt;<a href=
=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;=
&quot;<br>
-RECIPE_MAINTAINER:pn-python3-referencing =3D &quot;Tim Orling &lt;<a href=
=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.c=
om</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-referencing =3D &quot;Trevor Gamblin &lt;<a h=
ref=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.co=
m</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-requests =3D &quot;Tim Orling &lt;<a hre=
f=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.=
com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-rfc3339-validator =3D &quot;Bruce Ashfie=
ld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.=
ashfield@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-rfc3986-validator =3D &quot;Bruce Ashfie=
ld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.=
ashfield@gmail.com</a>&gt;&quot;<br>
@@ -699,14 +699,14 @@ RECIPE_MAINTAINER:pn-python3-scons =3D &quot;Tim Orli=
ng &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orl=
ing@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-semantic-version =3D &quot;Tim Orling &l=
t;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@k=
onsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-setuptools =3D &quot;Unassigned &lt;<a h=
ref=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoc=
toproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-setuptools-rust =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D &quot;Tim Orling &lt;<a hr=
ef=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko=
.com</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-setuptools-scm =3D &quot;Trevor Gamblin &lt;<=
a href=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre=
.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-six =3D &quot;Zang Ruochen &lt;<a href=
=3D"mailto:zangruochen@loongson.cn" target=3D"_blank">zangruochen@loongson.=
cn</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-smartypants =3D &quot;Alexander Kanavin =
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-smmap =3D &quot;Unassigned &lt;<a href=
=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctop=
roject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D &quot;Tim Orling &lt=
;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@ko=
nsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sortedcontainers =3D &quot;Tim Orling &l=
t;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@k=
onsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-spdx-tools =3D &quot;Marta Rybczynska &l=
t;<a href=3D"mailto:mrybczynska@syslinbit.com" target=3D"_blank">mrybczynsk=
a@syslinbit.com</a>&gt;&quot;<br>
-RECIPE_MAINTAINER:pn-python3-sphinx =3D &quot;Tim Orling &lt;<a href=3D"ma=
ilto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulko.com</a>=
&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-python3-sphinx =3D &quot;Trevor Gamblin &lt;<a href=
=3D"mailto:tgamblin@baylibre.com" target=3D"_blank">tgamblin@baylibre.com</=
a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinxcontrib-applehelp =3D &quot;Tim Or=
ling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.o=
rling@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp =3D &quot;Tim Orli=
ng &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orl=
ing@konsulko.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-python3-sphinxcontrib-htmlhelp =3D &quot;Tim Orl=
ing &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.or=
ling@konsulko.com</a>&gt;&quot;<br>
-- <br>
2.45.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199666): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199666" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199666</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106227247/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/106227247/924729</a><br>
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

--0000000000005ee13f0619032c98--

