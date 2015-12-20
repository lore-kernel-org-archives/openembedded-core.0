Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id E19AF607AB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 16:21:14 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id j66so89525725vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 08:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kZpkiHrOU3peJZyet3qzNeyu+R1QkPFrLxRZYBgb1VE=;
	b=NeIqY1GWsA1FE+Qb75Dr7QWbwAy+n1cqRoMZr/iyorfS0tJpH5ac9nYgJ0rtZUIx7y
	4NSHeuTyLynPnai92rLaV6HAe5dcLQkM/MQBmN5BL+Vigw+bMjc4b4T4RqM0NJ2TMceT
	eQEK/WqAWJL7JWBWSpLWedjNY5isXPfuZFxCThis3OqgVfZk2VmRS7MzcrvwEakUGUdW
	AOmjD2lZz1a4i7bJHLtDE7lAoAQJlrwsDYn+zGLm8Ri4WLYjuaH1OyrfNev5iw2U+K2c
	AQgo8g1jxZGgBXGBGTGozJtOIKF4z6jS/WyTimtR2wW+AVPkLDiWmKKv9C5cQfX/FYCq
	p6pA==
MIME-Version: 1.0
X-Received: by 10.31.161.131 with SMTP id k125mr10066187vke.74.1450628474906; 
	Sun, 20 Dec 2015 08:21:14 -0800 (PST)
Received: by 10.31.30.204 with HTTP; Sun, 20 Dec 2015 08:21:14 -0800 (PST)
In-Reply-To: <1450228485-23253-1-git-send-email-liu.ming50@gmail.com>
References: <1450228485-23253-1-git-send-email-liu.ming50@gmail.com>
Date: Sun, 20 Dec 2015 17:21:14 +0100
Message-ID: <CALatG=7PJsCYb1fpf-r4mcUEm=ivHkhFNFvuJxQ83cpGYYtR_A@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "yue.tao" <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH] ncurses: changes ncurses-config to ncurses5-config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 20 Dec 2015 16:21:15 -0000
Content-Type: multipart/alternative; boundary=001a1144071af2ac3b052756c246

--001a1144071af2ac3b052756c246
Content-Type: text/plain; charset=UTF-8

2015-12-16 2:14 GMT+01:00 Ming Liu <liu.ming50@gmail.com>:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> ncurses-config is a wrong name, there is not such file at all, changes it
> to ncurses5-config.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc
> b/meta/recipes-core/ncurses/ncurses.inc
> index 8bfe133..58e6281 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -8,7 +8,7 @@ DEPENDS = "ncurses-native"
>  DEPENDS_class-native = ""
>  INC_PR = "r15"
>
> -BINCONFIG = "${bindir}/ncurses-config"
> +BINCONFIG = "${bindir}/ncurses5-config"
>

"${bindir}/ncursesw5-config" needs to be put into BINCONFIG as well,
otherwise, the SDK install process still reports file conflicting between
ncurses-dev and lib32-ncurses-dev as described in #8801. I will send the V1
soon.

//Ming Liu

>
>  inherit autotools binconfig-disabled multilib_header pkgconfig
>
> --
> 1.9.1
>
>

--001a1144071af2ac3b052756c246
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2015-12-16 2:14 GMT+01:00 Ming Liu <span dir=3D"ltr">&lt;<=
a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.c=
om</a>&gt;</span>:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div>From: Ming Liu=
 &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.com" target=3D"_blan=
k">peter.x.liu@external.atlascopco.com</a>&gt;<br>
<br>
ncurses-config is a wrong name, there is not such file at all, changes it<b=
r>
to ncurses5-config.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com" target=3D"_blank">peter.x.liu@external.atlascopco.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/ncurses/ncurses.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncur=
ses/ncurses.inc<br>
index 8bfe133..58e6281 100644<br>
--- a/meta/recipes-core/ncurses/ncurses.inc<br>
+++ b/meta/recipes-core/ncurses/ncurses.inc<br>
@@ -8,7 +8,7 @@ DEPENDS =3D &quot;ncurses-native&quot;<br>
=C2=A0DEPENDS_class-native =3D &quot;&quot;<br>
=C2=A0INC_PR =3D &quot;r15&quot;<br>
<br>
-BINCONFIG =3D &quot;${bindir}/ncurses-config&quot;<br>
+BINCONFIG =3D &quot;${bindir}/ncurses5-config&quot;<br></div></div></block=
quote><div><br>&quot;${bindir}/ncursesw5-config&quot; needs to be put into =
BINCONFIG as well, otherwise, the SDK install process still reports file co=
nflicting between ncurses-dev and lib32-ncurses-dev as described in #8801. =
I will send the V1 soon.<br>=C2=A0<br></div><div>//Ming Liu<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div><div>
<br>
=C2=A0inherit autotools binconfig-disabled multilib_header pkgconfig<br>
<br>
--<br>
1.9.1<br>
<br>
</div></div></blockquote></div><br></div></div>

--001a1144071af2ac3b052756c246--
