Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3160260722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 05:12:23 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l127so111617622iof.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 21:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-type; bh=g8FD0aTCNEwS+avJxYTeBqdWTwQYZfjaqDHTLYBGWs4=;
	b=RVTGnDsIMiXWCM8FJhbtUpV5L6hInfpiiBz9LTmIbBiYuJ4bHZjNhzXkPwDpcXZVA5
	mFpkNGmP3wK1osBjjCpIA1tUOPa0su3i94o2DBAzHXJD+7Bg4iOoXTlvLvGjNMX1exKP
	vQmKsfjbZTMsPwfJHReg7PhMYkAkLqgCnx0TSzpedV0XXZVOpalrfWFnA2pECmjfJajU
	3VjkDWD8qfue85++ZBLV58DoTGntbNcED3N5Fn348Ve4ngr9iLgOJJzsl0SI8qfCQsGv
	hR6asoHbS5mzzFTV8byBt6489KEF5AN1ED8jGUYr+miQYSu6nRTG5p9iu7pDOpDSJH2N
	+lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-type;
	bh=g8FD0aTCNEwS+avJxYTeBqdWTwQYZfjaqDHTLYBGWs4=;
	b=iZ+4ABiCE67pgT/1GH4tTNMY8j2Ul7tIlG/hrvuLSa+OuBxe82ElTNeMl0GxrRaDvK
	mJhmATidEStHWpHO9hGRC5pJZtwC+FtgTu/7p6b72g2qTY03USXsTqwaOggCzY8gs+FA
	c8im7oppfwJ81jxzPw1Pl7csnobwRUuOSQs1HnVSFpqX14BOtI7uhT/flLSzm5E2WEp2
	BL8e3nlH47Jx1zO1i+rXA6jrZjQVRrpvD8evmtC4yoJLi87BUm8ojBzdRHP4YX+ei54y
	p+8FyliTY+eq/KEKnOIkqzvkO1HGoUPAvIFOkeqDWMEmRI3aYemfDdWGSheV1MgYIPo/
	bG+g==
X-Gm-Message-State: AG10YOQbU+snNVX9U6Kz8bfYYegZjoCjoRapueHp+ZK9Oat4Q/ss7BWP3Jd9mGyHgw72CAgJIJUr3nRbPchRdA==
X-Received: by 10.107.33.14 with SMTP id h14mr6257580ioh.108.1455340344541;
	Fri, 12 Feb 2016 21:12:24 -0800 (PST)
MIME-Version: 1.0
References: <1455303960-7173-1-git-send-email-markus.lehtonen@linux.intel.com>
In-Reply-To: <1455303960-7173-1-git-send-email-markus.lehtonen@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sat, 13 Feb 2016 05:12:14 +0000
Message-ID: <CABcZAN=cNeb1pkE5tzc-0UB0Dgc9z1BH6Xb0qJiPPm6P+O33QA@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: define RPATH variable
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
X-List-Received-Date: Sat, 13 Feb 2016 05:12:24 -0000
Content-Type: multipart/alternative; boundary=001a1141a3dc43884b052b9fd413

--001a1141a3dc43884b052b9fd413
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 12, 2016 at 12:06 PM Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> Otherwise the nss libs do not get any RPATH/RUNPATH. Consequently, the
> .so dependencies of nss libs are always searched from the base lib
> directories of the host (i.e. /lib/ and /usr/lib). This causes problems
> with nss-native where the .so's should be searched from the base lib
> directories of the sysroot instead of the host file system.
>
> This particular problem has probably been unnoticed as nss-native is
> seldom used and/or most users are likely to have nss libraries installed
> on their host system. In this case everything most likely work as
> expected.
>
> [YOCTO #9041]
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/recipes-support/nss/nss_3.21.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/nss/nss_3.21.bb
> b/meta/recipes-support/nss/nss_3.21.bb
> index 552fd6c..8b9fb71 100644
> --- a/meta/recipes-support/nss/nss_3.21.bb
> +++ b/meta/recipes-support/nss/nss_3.21.bb
> @@ -91,12 +91,16 @@ do_compile() {
>
>      export NSS_DISABLE_GTESTS=1
>
> +    # Need to set RPATH so that chrpath will do its job correctly
> +    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE}
> -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE}
> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
> -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
>

Why are you adding native paths to rpath in a target recipe? If this change
is native-only, this should use the class-native override., no?

--001a1141a3dc43884b052b9fd413
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Feb 12=
, 2016 at 12:06 PM Markus Lehtonen &lt;<a href=3D"mailto:markus.lehtonen@li=
nux.intel.com">markus.lehtonen@linux.intel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Otherwise the nss libs do not get any RPATH/RUNP=
ATH. Consequently, the<br>
.so dependencies of nss libs are always searched from the base lib<br>
directories of the host (i.e. /lib/ and /usr/lib). This causes problems<br>
with nss-native where the .so&#39;s should be searched from the base lib<br=
>
directories of the sysroot instead of the host file system.<br>
<br>
This particular problem has probably been unnoticed as nss-native is<br>
seldom used and/or most users are likely to have nss libraries installed<br=
>
on their host system. In this case everything most likely work as<br>
expected.<br>
<br>
[YOCTO #9041]<br>
<br>
Signed-off-by: Markus Lehtonen &lt;<a href=3D"mailto:markus.lehtonen@linux.=
intel.com" target=3D"_blank">markus.lehtonen@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/nss/<a href=3D"http://nss_3.21.bb" rel=3D"norefe=
rrer" target=3D"_blank">nss_3.21.bb</a> | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-support/nss/<a href=3D"http://nss_3.21.bb" rel=3D=
"noreferrer" target=3D"_blank">nss_3.21.bb</a> b/meta/recipes-support/nss/<=
a href=3D"http://nss_3.21.bb" rel=3D"noreferrer" target=3D"_blank">nss_3.21=
.bb</a><br>
index 552fd6c..8b9fb71 100644<br>
--- a/meta/recipes-support/nss/<a href=3D"http://nss_3.21.bb" rel=3D"norefe=
rrer" target=3D"_blank">nss_3.21.bb</a><br>
+++ b/meta/recipes-support/nss/<a href=3D"http://nss_3.21.bb" rel=3D"norefe=
rrer" target=3D"_blank">nss_3.21.bb</a><br>
@@ -91,12 +91,16 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0export NSS_DISABLE_GTESTS=3D1<br>
<br>
+=C2=A0 =C2=A0 # Need to set RPATH so that chrpath will do its job correctl=
y<br>
+=C2=A0 =C2=A0 RPATH=3D&quot;-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-=
rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE=
} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}&quot;<br></blockquote><div><br><=
/div><div>Why are you adding native paths to rpath in a target recipe? If t=
his change is native-only, this should use the class-native override., no?<=
/div></div></div>

--001a1141a3dc43884b052b9fd413--
