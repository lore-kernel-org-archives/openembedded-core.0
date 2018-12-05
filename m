Return-Path: <ticotimo@gmail.com>
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail.openembedded.org (Postfix) with ESMTP id A32536D435
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 06:52:40 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id n10so2615866vso.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2018 22:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VybxMuMoN3DGl7e+1etOjv0L/3/y8m0YOEN0H1TIBZI=;
	b=Z65ByuGR25ZiL7J8soMLFn/EmQdbOvPvHj9HmBm1mK8QyJi/pivL4gfx8bHzviSIHu
	MK0dJ9lhXPdquCpqckNL/qVHYECyzeOZ/Fst36Cm3Oj5X9ZCptvzBsjeLkh22q4bxXUU
	HjGIpGkok7hSuXUZmLYFiSZXq5GVskAllnbkpeXOCqQHNI3+eCMbIWV/2UQIeyzPaG7U
	JiKhS+QTU9p7JqPaAYT7d9UbDKJiwE8Tzgp+NMyhX3e9loc854BbK2mbD2divqWjXduX
	YmnIWFHydnTBmZmLSlN5oZsOoXrYJjIXR3s26/D+QV1SnJpOASuGsqahBdOGW5S2zwSO
	xIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VybxMuMoN3DGl7e+1etOjv0L/3/y8m0YOEN0H1TIBZI=;
	b=MeBtJ1VtygJMDI402iIEkHFTW5Hjm4zp1BI0uXhvvpwVPYEsgpSLzN+Fq14SMI0IRJ
	5M794bZXI75BX9s6NX8yBLwoiBy1GB55059T+xgeRKxehM721coQJ5EB+HWRHjOR6MAl
	KqwVefvJR5nydt1NGMKM4dZT3gGbQ4aTRRGvwOFSjfZ0lBBveDkNc9jZWtWXTmOYyJIk
	Gp8S8VCxOqTmC8H7kKBCM6wtL/oCqoTiXLVid+6wCt9CkoPpsXIzyZFdXKGcCdeZMEaN
	X4ngp39XOn44mmqT188xfRkqzng14Ye+B1FCYnIhT5+vDRHOtGhl+mcLKgDCJr7/mU1g
	bqPw==
X-Gm-Message-State: AA+aEWa+mmswErZV5m/mstheys0gqJ4TmrvJi6nS2dv4J5V4FhvA+gno
	cLnX+H0ujMcNda9kmh+dxCQEVbJhSpnP611LkPk=
X-Google-Smtp-Source: AFSGD/W6vAmrNDHPR17CPxMEPWeKJirO1ORfEkXsMXkBR2Oi4ySTLuWi0369548rlhLZY0RoeF79r8TZGNiCIJ0pnc0=
X-Received: by 2002:a67:1106:: with SMTP id 6mr10198649vsr.213.1543992761326; 
	Tue, 04 Dec 2018 22:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20181205012132.27831-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181205012132.27831-1-hongl.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 4 Dec 2018 22:52:30 -0800
Message-ID: <CANx9H-Dt-J71_DAXm3_P0Nh+4dX_tz-CzHu8LMCtGsFMWqCZfQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] tcl:upgrade to 8.6.9
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
X-List-Received-Date: Wed, 05 Dec 2018 06:52:40 -0000
Content-Type: multipart/alternative; boundary="0000000000001322f6057c40d412"

--0000000000001322f6057c40d412
Content-Type: text/plain; charset="UTF-8"

Can you also upgrade the tk recipe in meta-oe please?

On Tue, Dec 4, 2018 at 5:19 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:

> 1.Upgrade tcl from 8.6.8 to 8.6.9.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} (95%)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
> b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> similarity index 95%
> rename from meta/recipes-devtools/tcltk/tcl_8.6.8.bb
> rename to meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> index 4be2e89..7f37781 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> @@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
>             file://alter-includedir.patch \
>             file://run-ptest \
>  "
> -SRC_URI[md5sum] = "81656d3367af032e0ae6157eff134f89"
> -SRC_URI[sha256sum] =
> "c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc717234a65cbcfd3f96a"
> +SRC_URI[md5sum] = "aa0a121d95a0e7b73a036f26028538d4"
> +SRC_URI[sha256sum] =
> "ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e"
>
>  SRC_URI_class-native = "${BASE_SRC_URI}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001322f6057c40d412
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Can you also upgrade the tk recipe in meta-oe please=
?</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue, D=
ec 4, 2018 at 5:19 PM Hong Liu &lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.=
com">hongl.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">1.Upgrade tcl from 8.6.8 to 8.6.9.<br>
<br>
Signed-off-by: Hong Liu &lt;<a href=3D"mailto:hongl.fnst@cn.fujitsu.com" ta=
rget=3D"_blank">hongl.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/tcltk/{<a href=3D"http://tcl_8.6.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">tcl_8.6.8.bb</a> =3D&gt; <a href=3D"http://tcl=
_8.6.9.bb" rel=3D"noreferrer" target=3D"_blank">tcl_8.6.9.bb</a>} | 4 ++--<=
br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/tcltk/{<a href=3D"http://tcl_8.6.8.bb" r=
el=3D"noreferrer" target=3D"_blank">tcl_8.6.8.bb</a> =3D&gt; <a href=3D"htt=
p://tcl_8.6.9.bb" rel=3D"noreferrer" target=3D"_blank">tcl_8.6.9.bb</a>} (9=
5%)<br>
<br>
diff --git a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.8.bb" re=
l=3D"noreferrer" target=3D"_blank">tcl_8.6.8.bb</a> b/meta/recipes-devtools=
/tcltk/<a href=3D"http://tcl_8.6.9.bb" rel=3D"noreferrer" target=3D"_blank"=
>tcl_8.6.9.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.8.bb" rel=
=3D"noreferrer" target=3D"_blank">tcl_8.6.8.bb</a><br>
rename to meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.9.bb" rel=
=3D"noreferrer" target=3D"_blank">tcl_8.6.9.bb</a><br>
index 4be2e89..7f37781 100644<br>
--- a/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.8.bb" rel=3D"no=
referrer" target=3D"_blank">tcl_8.6.8.bb</a><br>
+++ b/meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.9.bb" rel=3D"no=
referrer" target=3D"_blank">tcl_8.6.9.bb</a><br>
@@ -24,8 +24,8 @@ SRC_URI =3D &quot;${BASE_SRC_URI} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://alter-includedir.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
-SRC_URI[md5sum] =3D &quot;81656d3367af032e0ae6157eff134f89&quot;<br>
-SRC_URI[sha256sum] =3D &quot;c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc=
717234a65cbcfd3f96a&quot;<br>
+SRC_URI[md5sum] =3D &quot;aa0a121d95a0e7b73a036f26028538d4&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d=
5f53ccbba3feb915f4e&quot;<br>
<br>
=C2=A0SRC_URI_class-native =3D &quot;${BASE_SRC_URI}&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
<br>
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

--0000000000001322f6057c40d412--
