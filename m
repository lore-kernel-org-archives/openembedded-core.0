Return-Path: <liu.ming50@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8CD1175545
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 11:37:13 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id c10so11598384vsk.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 04:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6LtmpKUSs0e/YIAsCkbfUG0LVH6WFefBXlQIJJKjZgE=;
	b=PADj5yk0sWhDtjMoaFqeEQGxSVImPHn79XFQS4vPNMkcP5JLZxwYXE4wvjqq/imJx7
	B33qSx0PB4As44mzz3WtCcyTeQ89UN0QdF0ZKPsPX4neh/Pxg2XKpzz7Ik/WRKyqvCZ2
	bnE1DLRfPBn84Q9S+q8YdylmnqGQfbEEWtpZuYP1XFsw8i5fKnU+5BB98ItciB9GV34I
	IkEYs3zaFkTrRvIi/kJ6ALz84YsiT0xSsiWJdWtEUbOhsSuD092Bbmn8YYiVsBW2ijpy
	Hcb9TEGinjCPsPECHrS0pmAv84as5dPUGjKESA1go+hVSFnWzG9Qivy5xVfzqLpithpN
	30Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6LtmpKUSs0e/YIAsCkbfUG0LVH6WFefBXlQIJJKjZgE=;
	b=MclDg/pJ64ZGfH7/U7X0oMFFlEZ/NOB5WCIID2jLBCZhYX6DsRyrapFWhIS5Y+vciT
	4uilPUzzx5sfheicSH9EB4EAUj6TgSRcuxKBa9HD/TNuVFnvp434nOEpvIEIA//lWBrX
	oh7uWrwu2InD2vlKIj19H07XcuBMxsbJftEh8iGirAyyhgQEjtOcOtxli5K/+nI9giWS
	0751N3R1takSFlDrWNqB3PSXuC5Cixt6KYLjGUSQovzck7ENTC2Rd6bZiBDxbrcbtSME
	B83DHsZcryior/+hPAc596d9WL6kNjUfePKQUNncIq4KnyGnzyRnchYWjIUrHOGRAlXV
	8U/Q==
X-Gm-Message-State: ABuFfohzyvbdvn6eziwVeB2aeM27raWccZUT7bBAiqhXSSxl8eOM0enG
	D3sSsF2S9DjqxMwqU/uK6OyptlOyVUIpdD1vr33bgKpnGSc=
X-Google-Smtp-Source: ACcGV63Bert7146WSHf/yTJ7T5aUOYGaFLOGWS69GA8fHO28TA15wugwymuLgfp0VvlmKop3dq+RRQmpUtEaIn3fbJI=
X-Received: by 2002:a67:4e54:: with SMTP id c81mr2289008vsb.72.1539344234330; 
	Fri, 12 Oct 2018 04:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1539267354-26753-1-git-send-email-liu.ming50@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 12 Oct 2018 13:37:02 +0200
Message-ID: <CALatG=4wF+yKGxkV5EmxBHdPvMr4FMQJpip01f1F6YH=5f6hbA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Cheuk Wing Leung <cwleung@kth.se>
Subject: Re: [PATCH] python3: set PYTHONHOME for nativesdk
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
X-List-Received-Date: Fri, 12 Oct 2018 11:37:13 -0000
Content-Type: multipart/alternative; boundary="000000000000463f050578068235"

--000000000000463f050578068235
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Richard:

> I think its this which is causing breakage:
>
>
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps=
/7/logs/step3b
>
>
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps=
/7/logs/step2b
>
>
https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps=
/7/logs/step1b

Are you sure about this? This patch creates a nativesdk python3 wrapper
which supposes to run on SDK machine, it should not impact native sysroot
binaries, and I could not reproduce the error with the patch applied on my
local machine. (Ubuntu-16.04)

//Ming Liu


<liu.ming50@gmail.com> =E6=96=BC 2018=E5=B9=B410=E6=9C=8811=E6=97=A5 =E9=80=
=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:16=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Cheuk Wing Leung <cwleung@kth.se>
>
> commit c5629268b0f8ae0a425c98337d13e8dc83107e13:
> [
>     python: set PYTHONHOME for nativesdk
>
>     This ensures that the nativesdk python functions correctly without
> needing to
>     set PYTHONHOME in the sdk environment setup script.
> ]
>
> it's also needed for python3.
>
> Signed-off-by: Cheuk Wing Leung <cwleung@kth.se>
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/recipes-devtools/python/python3_3.5.6.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb
> b/meta/recipes-devtools/python/python3_3.5.6.bb
> index e179658..c481aad 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -179,7 +179,7 @@ do_install() {
>  }
>
>  do_install_append_class-nativesdk () {
> -       create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo=
:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE=3D'1'
> +       create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN}
> PYTHONHOME=3D'${prefix}'
> TERMINFO_DIRS=3D'${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo=
:/usr/share/misc/terminfo:/lib/terminfo'
> PYTHONNOUSERSITE=3D'1'
>  }
>
>  SSTATE_SCAN_FILES +=3D "Makefile"
> --
> 2.7.4
>
>

--000000000000463f050578068235
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Richard:<div><br></div><div>&gt; I think its this whic=
h is causing breakage:<br>&gt;<br>&gt;=C2=A0<a href=3D"https://autobuilder.=
yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step3b" rel=
=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/typh=
oon/#/builders/20/builds/106/steps/7/logs/step3b</a><br>&gt;<br>&gt;=C2=A0<=
a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds=
/106/steps/7/logs/step2b" rel=3D"noreferrer" target=3D"_blank">https://auto=
builder.yoctoproject.org/typhoon/#/builders/20/builds/106/steps/7/logs/step=
2b</a><br>&gt;<br>&gt;=C2=A0<a href=3D"https://autobuilder.yoctoproject.org=
/typhoon/#/builders/20/builds/106/steps/7/logs/step1b" rel=3D"noreferrer" t=
arget=3D"_blank">https://autobuilder.yoctoproject.org/typhoon/#/builders/20=
/builds/106/steps/7/logs/step1b</a><br><div><br></div><div>Are you sure abo=
ut this? This patch creates a nativesdk python3 wrapper which supposes to r=
un on SDK machine, it should not impact native sysroot binaries, and I coul=
d not reproduce the error with the patch applied on my local machine. (Ubun=
tu-16.04)</div><div><br></div><div>//Ming Liu</div><div><br></div></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr">&lt;<a href=3D"mailto:li=
u.ming50@gmail.com">liu.ming50@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B410=
=E6=9C=8811=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=884:16=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Cheuk Wing Le=
ung &lt;<a href=3D"mailto:cwleung@kth.se" target=3D"_blank">cwleung@kth.se<=
/a>&gt;<br>
<br>
commit c5629268b0f8ae0a425c98337d13e8dc83107e13:<br>
[<br>
=C2=A0 =C2=A0 python: set PYTHONHOME for nativesdk<br>
<br>
=C2=A0 =C2=A0 This ensures that the nativesdk python functions correctly wi=
thout needing to<br>
=C2=A0 =C2=A0 set PYTHONHOME in the sdk environment setup script.<br>
]<br>
<br>
it&#39;s also needed for python3.<br>
<br>
Signed-off-by: Cheuk Wing Leung &lt;<a href=3D"mailto:cwleung@kth.se" targe=
t=3D"_blank">cwleung@kth.se</a>&gt;<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.b=
b" rel=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a> b/meta/recipes=
-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=3D"noreferrer" tar=
get=3D"_blank">python3_3.5.6.bb</a><br>
index e179658..c481aad 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.5.6.bb" rel=
=3D"noreferrer" target=3D"_blank">python3_3.5.6.bb</a><br>
@@ -179,7 +179,7 @@ do_install() {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-nativesdk () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/python${PYTHON_MAJ=
MIN} TERMINFO_DIRS=3D&#39;${sysconfdir}/terminfo:/etc/terminfo:/usr/share/t=
erminfo:/usr/share/misc/terminfo:/lib/terminfo&#39; PYTHONNOUSERSITE=3D&#39=
;1&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0create_wrapper ${D}${bindir}/python${PYTHON_MAJ=
MIN} PYTHONHOME=3D&#39;${prefix}&#39; TERMINFO_DIRS=3D&#39;${sysconfdir}/te=
rminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/term=
info&#39; PYTHONNOUSERSITE=3D&#39;1&#39;<br>
=C2=A0}<br>
<br>
=C2=A0SSTATE_SCAN_FILES +=3D &quot;Makefile&quot;<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div>

--000000000000463f050578068235--
