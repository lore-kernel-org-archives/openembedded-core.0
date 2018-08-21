Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id A908679009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 11:17:39 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k5-v6so3986544wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 04:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wuIbchNEIKbuC+apMWOFvNaNCpicRsH29UgL0ggH7H4=;
	b=dhPdgaRdY7GykR4oO39nAnhwHmxDN1yY8ryZsn6LgeQ+m+neGqUSbuBPbtQvpnf985
	CzaA+yygp6ioqV1HetYBhJyiPtfeonA4qrHZ7PMBKf1DP2qz5LCGQdw2+FvxUP/hNFg2
	niwQVO6LAkLvVEUp4h7gjL9mLiVWvaMpruMc8VikHlKJUHPqJlpGvVfJhfWkV6ebij6M
	i/8/YMbXjep68+W/YwAUiMIaXM3eyxvqkfcuvU9yGVgb7hd/w9MzZx7ruFt0DpIKX0Dr
	3DFK2rc6pQhIJEKtxJQqhUL8sICbjBCKAXXqwLvH/bCrGBGqknn4Y3NGmI6SvaiLVbCq
	iuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wuIbchNEIKbuC+apMWOFvNaNCpicRsH29UgL0ggH7H4=;
	b=UnHizTXjwm2ADC495gBj6oMCS2jxs92y5cAByOXLhH+yl+evTXjLeltAa7d7faTnrZ
	+U9lEaG7qraomDRMRehpXaTjYX92K2XsneGbNGNwfJmORDH3O2ndvIi4+fsN8PrmDrQY
	gXUWqgYaGuoKR/uLf0ujDrd02uYzT6QEMgEWWLuOvX4EXn5DcznhPwkY91f2YYcXyPd2
	8drCbkC2DEWA8xkj15C7tT9AiWLor5rTMmmqftEKtRSzQBav10RGNDSrd5vq47BGHjyq
	7sHjnI+vXJ9sbxlRyEBGpGwL3pPHbh7NTFUbbnRCoeWRmEdxG7R9HB4pyOL2FpC0/qr0
	EWpA==
X-Gm-Message-State: AOUpUlF2434hy2wmrQBJvgmKX0xc6X3x2j8LJFDVAjSiWWtbtUgNlwCH
	Oc4gpiKwNkFENdgh3ImZoJLcd3z/VAUmQktJI/g=
X-Google-Smtp-Source: AA+uWPwv6oYn5jWd3wFDSrWkOH/POnUK297X6Bqlb3GfBSuBQIZLCDC1TygMhHXIltM2u8Q2vPWT3O/pPW4uQqyUjL8=
X-Received: by 2002:adf:e50f:: with SMTP id
	j15-v6mr30686552wrm.111.1534850260100; 
	Tue, 21 Aug 2018 04:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20180821111004.11245-1-logyourself@gmail.com>
In-Reply-To: <20180821111004.11245-1-logyourself@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 Aug 2018 13:17:28 +0200
Message-ID: <CA+chaQcs=3JD-6DPPtk7qe1EcCo86eHrXOk99pC5yLFnzd=5qQ@mail.gmail.com>
To: logyourself@gmail.com
Cc: jjunil79.kim@lge.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Tue, 21 Aug 2018 11:17:40 -0000
Content-Type: multipart/alternative; boundary="000000000000896e0c0573f02c06"

--000000000000896e0c0573f02c06
Content-Type: text/plain; charset="UTF-8"

Wrong ML, meta-oe changes should go to openembedded-devel ML as the README
file says.

On Tue, Aug 21, 2018 at 1:10 PM Junil Kim <logyourself@gmail.com> wrote:

> From: Junil Kim <jjunil79.kim@lge.com>
>
> Existing URI service was closed and fetch error occurred.
> Change existing repository to another mirrored SRC URI.
>
> Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
> ---
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> index abe015de2..f4033f7c2 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -15,7 +15,7 @@ SRCREV = "c22d359433b333937ee3d803450dc41998115685"
>
>  DEPENDS = "elfutils"
>  RDEPENDS_${PN} = "elfutils"
> -SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master
> \
> +SRC_URI = "git://
> github.com/sparkleholic/ltrace.git;branch=master;protocol=http \
>             file://configure-allow-to-disable-selinux-support.patch \
>             file://0001-replace-readdir_r-with-readdir.patch \
>             file://0001-Use-correct-enum-type.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000896e0c0573f02c06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Wrong ML, meta-oe changes should go to openembedded-devel =
ML as the README file says.</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Tue, Aug 21, 2018 at 1:10 PM Junil Kim &lt;<a href=3D"mailto:logyo=
urself@gmail.com">logyourself@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex">From: Junil Kim &lt;<a href=3D"mailto:jjunil79.kim@lge.=
com" target=3D"_blank">jjunil79.kim@lge.com</a>&gt;<br>
<br>
Existing URI service was closed and fetch error occurred.<br>
Change existing repository to another mirrored SRC URI.<br>
<br>
Signed-off-by: Junil Kim &lt;<a href=3D"mailto:jjunil79.kim@lge.com" target=
=3D"_blank">jjunil79.kim@lge.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.b=
b" rel=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a> b/meta-oe/recipes=
-devtools/ltrace/<a href=3D"http://ltrace_git.bb" rel=3D"noreferrer" target=
=3D"_blank">ltrace_git.bb</a><br>
index abe015de2..f4033f7c2 100644<br>
--- a/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a><br>
+++ b/meta-oe/recipes-devtools/ltrace/<a href=3D"http://ltrace_git.bb" rel=
=3D"noreferrer" target=3D"_blank">ltrace_git.bb</a><br>
@@ -15,7 +15,7 @@ SRCREV =3D &quot;c22d359433b333937ee3d803450dc41998115685=
&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;elfutils&quot;<br>
=C2=A0RDEPENDS_${PN} =3D &quot;elfutils&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://anonscm.debian.org/collab-maint/=
ltrace.git;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank">anonscm.de=
bian.org/collab-maint/ltrace.git;branch=3Dmaster</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/sparkleholic/ltrace.g=
it;branch=3Dmaster;protocol=3Dhttp" rel=3D"noreferrer" target=3D"_blank">gi=
thub.com/sparkleholic/ltrace.git;branch=3Dmaster;protocol=3Dhttp</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure-allow-to-disable=
-selinux-support.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-replace-readdir_r-wit=
h-readdir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-correct-enum-type=
.patch \<br>
-- <br>
2.17.1<br>
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

--000000000000896e0c0573f02c06--
