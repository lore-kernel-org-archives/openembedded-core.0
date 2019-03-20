Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7136C601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 23:49:01 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id b74so15297733qkg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ViAR84gSBMbzBMG8s5qqfnk9icDntWckCReMr6UnH9g=;
	b=WqOovxlacJzr5f66qdshYdhb1zz7+Ta9tzSBaxQAsjhQIjhyIawO9zeXpNTM1Io0BT
	RQ1JqziBujvrA1DZEguCpUNd7opeJ2pWZ74dIVqEzKhyho+EDx71CouA9Ur7fegYLbDK
	6bv4/nTOvWHNwKPnMUNDYCS04bVEMwgCkd1QghpknxmR0GZshEz6Z2jTJeEv8+BXu06Y
	fP8y8K4mhhH38K/64qPMb955bNIsjJpA/6lvYpzj0+1sc1PIKB6pRf7vvxomLUb/l5/O
	ZqGrbGcyVRIuFt/Zoa5yC6KQBLNhiAqzq1riZi0heJB5kuu5Xv4qW31+fmjRv5HyKqqf
	+ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ViAR84gSBMbzBMG8s5qqfnk9icDntWckCReMr6UnH9g=;
	b=rPyipVBny5CCmTgFFxuDFA1IJAOP3UHdzVyHhAwYblos1PRiHNAb5dV17zkaF7PBBi
	nxnnXp8OGxjGwq/toocNNDengN5lhu8MySIp76A0KIwNSTYchqB0kReIZusWp64d8iMt
	ewYIB/xbURuvgEqzAULMEZajnvZrnX17WGKE9wFf3aKZrtdzBIcn+ICakFCMx+BRgu+o
	fknKBUgYThyd5k/r4jyaVepOMvjGiNIooEAONgWCE9t98EMF+QWq15k8huU5IrAeXQVU
	Y61nftdOj+p868pGSEl9Dc1ALm3RV/H0+7Q2FLuvxjgOn1hddJ86IODlQzhDUV14yjJn
	MNhA==
X-Gm-Message-State: APjAAAUQFWYYtRG0Qu5D2c8zXJdBtcnUZcqzTpTbDBwlEXkPBnCVXNYL
	djzpZXw4hFuJN4kgR5fRwk87ZTMLc0qV5kqcCvxyQw==
X-Google-Smtp-Source: APXvYqyogyOKCe/ZSIbLFNxTR0VAJ6b0e5CziJIHpUtzu4hzpigc+uDBLsG+nZlrUfArXOWskOC1g76orL+XnmHcDSQ=
X-Received: by 2002:a37:4c88:: with SMTP id z130mr319878qka.206.1553125742111; 
	Wed, 20 Mar 2019 16:49:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190320230557.7094-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2019 19:48:51 -0400
Message-ID: <CAMKF1sq--Z+cf5PvATNveGoajjPdf1Wa_Hs7q6P7c-b-1qkuNg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ninja: upate to 1.9.0
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
X-List-Received-Date: Wed, 20 Mar 2019 23:49:01 -0000
Content-Type: multipart/alternative; boundary="000000000000266f1005848f4498"

--000000000000266f1005848f4498
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 20, 2019 at 4:06 PM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>


Looks good

>
> ---
>  meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/ninja/{ninja_1.8.2.bb => ninja_1.9.0.bb}
> (92%)
>
> diff --git a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/ninja/ninja_1.8.2.bb
> rename to meta/recipes-devtools/ninja/ninja_1.9.0.bb
> index c6fcfef3dd..5c4f87cf93 100644
> --- a/meta/recipes-devtools/ninja/ninja_1.8.2.bb
> +++ b/meta/recipes-devtools/ninja/ninja_1.9.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
>
>  DEPENDS = "re2c-native ninja-native"
>
> -SRCREV = "253e94c1fa511704baeb61cf69995bbf09ba435e"
> +SRCREV = "b25c08bda4949192c69cea4cee057887341a2ffc"
>
>  SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000266f1005848f4498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 20, 2019 at 4:06 PM Oleksandr Kravchuk &lt;<a h=
ref=3D"mailto:open.source@oleksandr-kravchuk.com">open.source@oleksandr-kra=
vchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-o=
ff-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravc=
huk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&gt;</bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">Looks good</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><br>
---<br>
=C2=A0meta/recipes-devtools/ninja/{<a href=3D"http://ninja_1.8.2.bb" rel=3D=
"noreferrer" target=3D"_blank">ninja_1.8.2.bb</a> =3D&gt; <a href=3D"http:/=
/ninja_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a>} |=
 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-devtools/ninja/{<a href=3D"http://ninja_1.8.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">ninja_1.8.2.bb</a> =3D&gt; <a href=3D=
"http://ninja_1.9.0.bb" rel=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb=
</a>} (92%)<br>
<br>
diff --git a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" =
rel=3D"noreferrer" target=3D"_blank">ninja_1.8.2.bb</a> b/meta/recipes-devt=
ools/ninja/<a href=3D"http://ninja_1.9.0.bb" rel=3D"noreferrer" target=3D"_=
blank">ninja_1.9.0.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" r=
el=3D"noreferrer" target=3D"_blank">ninja_1.8.2.bb</a><br>
rename to meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ninja_1.9.0.bb</a><br>
index c6fcfef3dd..5c4f87cf93 100644<br>
--- a/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.8.2.bb" rel=3D"=
noreferrer" target=3D"_blank">ninja_1.8.2.bb</a><br>
+++ b/meta/recipes-devtools/ninja/<a href=3D"http://ninja_1.9.0.bb" rel=3D"=
noreferrer" target=3D"_blank">ninja_1.9.0.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Da81586a64ad=
4e476c791cda7e2f2c52e&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;re2c-native ninja-native&quot;<br>
<br>
-SRCREV =3D &quot;253e94c1fa511704baeb61cf69995bbf09ba435e&quot;<br>
+SRCREV =3D &quot;b25c08bda4949192c69cea4cee057887341a2ffc&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/ninja-build/ninj=
a.git;branch=3Drelease" rel=3D"noreferrer" target=3D"_blank">github.com/nin=
ja-build/ninja.git;branch=3Drelease</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;.*)&quot;<br>
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
</blockquote></div></div>

--000000000000266f1005848f4498--
