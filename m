Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 51EDA7C64E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 01:17:01 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l5so16039074wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O4ykZEwhEBMrbCsjVdQUyQUgWH4pVRnfRpquUDdXFY0=;
	b=kudvBarLL7O8x5zuuA6E5ospNnKo9Bfr5YgbEx0VPkCMXwUQtcFE0HcEC45Mremtbw
	HkFHojKZa2P8EFFikXiU2CmS12Eha6EuddvYC99jPLCwFUIEWaQk/d5Q8+DyJa4aZDtU
	u4/FaE+LPoA1ZeVzTcOq/q2AFSzgzRX0TRux0vdrgyk900w8H2YDZnJ+HRfYBX5qXRVl
	VToU8iesuOIWR3xGYiZiVWZYihv9bg60ANHyxoQAnAH8bsXSTAklhjPunNLf8yz5w549
	WrCaOn7PPXlbck9UwCQdGOjoTYv5FECPbnffg6cssWDfvDBg4G6OFLjxcDgVGzV1dQzJ
	koUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O4ykZEwhEBMrbCsjVdQUyQUgWH4pVRnfRpquUDdXFY0=;
	b=ASrxZpmQtxAdhQJBN2IIEWehBJaJC+s3d5QagprKAlwTZMl8DjJtC6YVPCMlEacLJU
	zkThU/u05KA+8KXiEdFJF24Mpe1fKGEIVCz1lOjQmZC/AI6m/FBzYysmJQ7NHSWaBOoN
	TorLLKClBqJKKblR/T4rCDXun7vfwimJmACZZaUlJnvaFg1j2gpOBK5/gp25yCjdlMpR
	dwz15J6l5hyrTOAwe7ZUTprcyMncU1FUTccCfnxO5/1vhGjcJf2oOtXzxcY/aD+hNZSe
	aQww3Ms8335jVJwoWrfmtLv/YdbqKkmGBC/nZZkndGpun5wJpdnOlQSoro9fr71lu284
	u/yg==
X-Gm-Message-State: APjAAAUeXIuVQA6fyZIun4Z5+hIh0hBHE241MfQbjcszIilTplzbjd2G
	PxsXo1Voso37deSmGWn6axqRgXsZOklIJrld+Ig=
X-Google-Smtp-Source: APXvYqxc9xh+FIIeNcDwdOkcfz0ZABVP37/lyDu/XuNB9e6vZUS3AVFHRfnIpy8jgCqfnBMfgPfKQLEyEBqKyQ2UIiE=
X-Received: by 2002:adf:fc87:: with SMTP id g7mr337133wrr.136.1551230221989;
	Tue, 26 Feb 2019 17:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20190225231742.13855-1-raj.khem@gmail.com>
	<20190225231742.13855-2-raj.khem@gmail.com>
In-Reply-To: <20190225231742.13855-2-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Feb 2019 02:16:52 +0100
Message-ID: <CA+chaQeG6F_D0Tv3dMqk=F8kR-2Th8-6e4Y_VRL50PkCiOpnjQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] mesa-gl: Set PACKAGECONFIG for target
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
X-List-Received-Date: Wed, 27 Feb 2019 01:17:01 -0000
Content-Type: multipart/alternative; boundary="00000000000058beae0582d5ee33"

--00000000000058beae0582d5ee33
Content-Type: text/plain; charset="UTF-8"

Fixes e.g.:
ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The file
/usr/lib/libEGL.so.1.0.0 is installed by both mesa-gl and libhybris,
aborting

but there is still:
ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The file
/usr/include/KHR/khrplatform.h is installed by both mesa-gl and libhybris,
aborting

I believe this header wasn't included in mesa-gl before recent changes,
maybe something else needs to be filtered out?

On Tue, Feb 26, 2019 at 12:18 AM Khem Raj <raj.khem@gmail.com> wrote:

> mesa.inc uses PACKAGECONFIG_class-target override to setup default
> packageconfigs, which means that when we build mesa-gl for target then
> it does no honor the ??= setting we have in mesa-gl recipe, and ends up
> compiling egl, gles2 as well, which is not intended.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> index 73267eb4f0..d4b1c1c454 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> @@ -7,3 +7,4 @@ PROVIDES = "virtual/libgl virtual/mesa"
>  S = "${WORKDIR}/mesa-${PV}"
>
>  PACKAGECONFIG ??= "opengl dri ${@bb.utils.filter('DISTRO_FEATURES',
> 'x11', d)}"
> +PACKAGECONFIG_class-target = "opengl dri
> ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000058beae0582d5ee33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Fixes e.g.:<br></di=
v><div dir=3D"ltr">ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The fi=
le /usr/lib/libEGL.so.1.0.0 is installed by both mesa-gl and libhybris, abo=
rting</div><div dir=3D"ltr"><br></div><div>but there is still:</div><div><d=
iv>ERROR: weston-5.0.0-r0 do_prepare_recipe_sysroot: The file /usr/include/=
KHR/khrplatform.h is installed by both mesa-gl and libhybris, aborting</div=
></div><div><br></div><div>I believe this header wasn&#39;t included in mes=
a-gl before recent changes, maybe something else needs to be filtered out?<=
/div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Feb 26, 2019 at 12:18 AM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">mesa.inc uses=
 PACKAGECONFIG_class-target override to setup default<br>
packageconfigs, which means that when we build mesa-gl for target then<br>
it does no honor the ??=3D setting we have in mesa-gl recipe, and ends up<b=
r>
compiling egl, gles2 as well, which is not intended.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.3.4.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.3.4.bb=
" rel=3D"noreferrer" target=3D"_blank">mesa-gl_18.3.4.bb</a> b/meta/recipes=
-graphics/mesa/<a href=3D"http://mesa-gl_18.3.4.bb" rel=3D"noreferrer" targ=
et=3D"_blank">mesa-gl_18.3.4.bb</a><br>
index 73267eb4f0..d4b1c1c454 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.3.4.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_18.3.4.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_18.3.4.bb</a><br>
@@ -7,3 +7,4 @@ PROVIDES =3D &quot;virtual/libgl virtual/mesa&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/mesa-${PV}&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;opengl dri ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
+PACKAGECONFIG_class-target =3D &quot;opengl dri ${@bb.utils.filter(&#39;DI=
STRO_FEATURES&#39;, &#39;x11&#39;, d)}&quot;<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000058beae0582d5ee33--
