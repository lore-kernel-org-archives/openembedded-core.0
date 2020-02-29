Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3C13461A39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 19:43:04 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id u17so2363562iog.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 11:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qkOC6ZsBfXQYmgYNMPYg1iUm0f4R4Jc0+7S5BOhOpSM=;
	b=RqwsNC55ug/SPLwwmwxjK36Dd4S5tvog9jdmPEkk+eRuvh4mgcsC5w3KSZ/zf1Ffkl
	6vz+0x+tp3hpghR6oXgJPKRn5NjHu9iYm51AA+ShEwiycUMmta7Ngx+BPoid5BkX3xn9
	ZpSUdDTh2GrcRYePXHSjvuEobBgZ7u4IbLlLwr6LelqoumqRciNCYg39LgylYvs9n54G
	YGrzzrsv2m5WcqCA8gmsIR2YwmVvcExCjzuXnyx+M2SgP8GMvdwVjl8+25kQzW6FOQ+g
	rMvP2Gd0jfxIhrOjvppDBYTbMP9G4kFDwbP0pKgji9KsAKzC66f7QzCvMBjKAV5dBo6k
	RHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qkOC6ZsBfXQYmgYNMPYg1iUm0f4R4Jc0+7S5BOhOpSM=;
	b=aiJp4lGZOY+RWHeEzIJUrehnnA+Z30cU33SFltHasWuiq+G7z+3shQEfi2kQkjOrD4
	2L1Aft9vt4uNAFLf40wF2xabiXL37AGutOeUD0sC9PyjezE+fmFpCeFZ/Q6uVTCVA2cW
	tZs0lGsicfEERhtBeqP9dFJWer77mUBa3/hyQR6h598vJ1dkhQUs9+DNgw/UodWD/MS6
	4CrqXtsKdDHUyELRa6gjhgE/pIEDe4qk0zRiaDxJJnMbR9B/tPVFD0Bd7NnaacpOTUWA
	jLQNY91Y8hJ2J91mVsJzoWFIVqXVUy5KbI+261bL+a9GOrkSMGLXaC/hLgLcM/jaZfMW
	RafQ==
X-Gm-Message-State: APjAAAXrRQf01mNYBrMc0fIM6XMelDsOVtehyxMZrAdI59ipuXraW/FQ
	T1DBqJQtPFS2mttolDETczrMwAjsBj81nJKCCQY=
X-Google-Smtp-Source: APXvYqyHnkHqbEgbRhH8T7MPm+5jyqVz4wy3C+tNRrwlgvJEGFdCTdhFq+oqwW/8N+y3as+dnhXXR9S/5j+uCD/6dhU=
X-Received: by 2002:a05:6602:210a:: with SMTP id
	x10mr7974414iox.151.1583005385690; 
	Sat, 29 Feb 2020 11:43:05 -0800 (PST)
MIME-Version: 1.0
References: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200229161603.495994-1-richard.purdie@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 29 Feb 2020 11:42:55 -0800
Message-ID: <CANx9H-C=PdOAXZ9eZqXF97c=Pt2Cc9MOAKup9Fb-FPJ9-w2dOw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python3-scons: Fix license file collision
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
X-List-Received-Date: Sat, 29 Feb 2020 19:43:05 -0000
Content-Type: multipart/alternative; boundary="000000000000b117a7059fbc296d"

--000000000000b117a7059fbc296d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you. It bothered me but I didn=E2=80=99t think if this rather simple =
solution.

On Sat, Feb 29, 2020 at 8:16 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Downloading a file called "LICENSE" into DL_DIR is 'problematic' and
> collides with the
> file from other versions of the recipe at best.
>
> Rename it to something more specific to avoid collision problems.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3-scons_3.1.2.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> index aa7a2a8300d..ce117a92d4f 100644
> --- a/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> +++ b/meta/recipes-devtools/python/python3-scons_3.1.2.bb
> @@ -1,10 +1,10 @@
>  SUMMARY =3D "Software Construction tool (make/autotools replacement)"
>  SECTION =3D "devel/python"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/LICENSE;md5=3De14e1b33428df24a40a782ae142785d0"
> +LIC_FILES_CHKSUM =3D
> "file://${WORKDIR}/LICENSE-python3-scons-${PV};md5=3De14e1b33428df24a40a7=
82ae142785d0"
>
>  # pypi package does not have a valid license file
> -SRC_URI +=3D "
> https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;name=3Dlicens=
e"
> +SRC_URI +=3D "
> https://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;downloadfilen=
ame=3DLICENSE-python3-scons-${PV};name=3Dlicense
> "
>
>  SRC_URI[md5sum] =3D "f9c4ad06dcf1427be95472eaf380c81a"
>  SRC_URI[sha256sum] =3D
> "8aaa483c303efeb678e6f7c776c8444a482f8ddc3ad891f8b6cdd35264da9a1f"
> --
> 2.25.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000b117a7059fbc296d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thank you. It bothered me but I didn=E2=80=99t think=
 if this rather simple solution.</div></div><div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 29, 2020 at 8:16 AM =
Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ri=
chard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Downloading a file called &quot;LICENSE&quot; into DL_DIR is =
&#39;problematic&#39; and collides with the<br>
file from other versions of the recipe at best.<br>
<br>
Rename it to something more specific to avoid collision problems.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.1.2.bb</a> | 4 ++--<=
br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.1.2.bb</a> b/=
meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.1.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-scons_3.1.2.bb</a><br>
index aa7a2a8300d..ce117a92d4f 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.1.2.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3-scons_3.1.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-scons_3.1.2.bb</a><br>
@@ -1,10 +1,10 @@<br>
=C2=A0SUMMARY =3D &quot;Software Construction tool (make/autotools replacem=
ent)&quot;<br>
=C2=A0SECTION =3D &quot;devel/python&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/LICENSE;md5=3De14e1b33428df24=
a40a782ae142785d0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${WORKDIR}/LICENSE-python3-scons-${PV};m=
d5=3De14e1b33428df24a40a782ae142785d0&quot;<br>
<br>
=C2=A0# pypi package does not have a valid license file<br>
-SRC_URI +=3D &quot;<a href=3D"https://raw.githubusercontent.com/SCons/scon=
s/$%7BPV%7D/LICENSE;name=3Dlicense" rel=3D"noreferrer" target=3D"_blank">ht=
tps://raw.githubusercontent.com/SCons/scons/${PV}/LICENSE;name=3Dlicense</a=
>&quot;<br>
+SRC_URI +=3D &quot;<a href=3D"https://raw.githubusercontent.com/SCons/scon=
s/$%7BPV%7D/LICENSE;downloadfilename=3DLICENSE-python3-scons-$%7BPV%7D;name=
=3Dlicense" rel=3D"noreferrer" target=3D"_blank">https://raw.githubusercont=
ent.com/SCons/scons/${PV}/LICENSE;downloadfilename=3DLICENSE-python3-scons-=
${PV};name=3Dlicense</a>&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;f9c4ad06dcf1427be95472eaf380c81a&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;8aaa483c303efeb678e6f7c776c8444a482f8ddc=
3ad891f8b6cdd35264da9a1f&quot;<br>
-- <br>
2.25.0<br>
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

--000000000000b117a7059fbc296d--
