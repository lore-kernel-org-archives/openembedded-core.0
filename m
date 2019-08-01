Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id D4CC77CDC0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 05:19:34 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s145so51037801qke.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 22:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9SIaJY6dPVKerJe6jASHM0ATgp0YpQLoZFlRiSeral0=;
	b=eFcscSz3hsVOuxyYMFaLL7wyebGSqdwNU+gwen9pzaqPEDyxr/YdSPhVCB/9HYEv04
	JqUKjIBSIqA/2zr7HaP0sUCHuj+X+7YwirimCZRW+B1umP8hOlvivI7PA9HusvBsHAqV
	agP3vXEVlfCsGL2g1gIpv0LWbH5nGmgMJUiXPVljlu2Tj5kUg57+tikjGSwxKWuv4su1
	g/qW7ruqKA2R9AogXV48G8hzLPROjA2tSZyNcJ5T8jJ2cGETIyFTzwBR1RSAwl+Ih9Kd
	C/9HJYfL/s8AsvZEde13ZEJZlsEV+hNoHWhLWrBXRAscbdAbV9vVtAH92NW3ms5bFeZ2
	xUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9SIaJY6dPVKerJe6jASHM0ATgp0YpQLoZFlRiSeral0=;
	b=Oyk4zkgVeTiQEPVIBgdaXDIKkp0saWImY75C/PJMnIMCC9gGzmvpjYJNKXEGfD/Cs7
	zSxRJ/NGbG9LwIMOuE9QAZ3Spob/4eFLZtskI5I3C01Vho5AtLEwjHpzzerYFEiH1Y/K
	80VAai9qbCsYP1gaSRT3Ul/NT3FIvaKVUBcaxZ+Cn0Ke/aDACC6s3KtDmeOFOQti33NT
	ctYS3t6iUyX7tfJRODhvK2UQDqiamsw09mXZPaFikGJWnBnaAWtIkhMq5BrU5vhQoROC
	qzPlQAJJsE8XVM9NzyWHObRy4QimLhDgpKyG4hxyKYKd2scovdm2b34qgEvUVBMf8I57
	sAgA==
X-Gm-Message-State: APjAAAUr3DCKmIV/Yhjp5snp3OQ27gHtbQLTtMDzQCTwk2G4FV2CXacK
	poKAW3KXxdES2Ty4sRjoUdEAZpJK21CLYfBAGU8v9w4k
X-Google-Smtp-Source: APXvYqyI0cKfTyfMG/HqT5+NN0fwe88cC8thf19rk8LN/5NLzwT/4rssvPtiEOVIZa+1hpp87QyMaM0XIRcAWt64Ars=
X-Received: by 2002:ae9:f101:: with SMTP id k1mr50606265qkg.337.1564636775394; 
	Wed, 31 Jul 2019 22:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190801045001.19548-1-bunk@stusta.de>
In-Reply-To: <20190801045001.19548-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jul 2019 22:19:24 -0700
Message-ID: <CAMKF1so74xJArBvgMKUi34Lh65C5+BHV5xznsG=HUfXa18tQZg@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkitgtk: Stop disabling gold on aarch64 and mips
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
X-List-Received-Date: Thu, 01 Aug 2019 05:19:35 -0000
Content-Type: multipart/alternative; boundary="000000000000333114058f07636f"

--000000000000333114058f07636f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don=E2=80=99t remember if mips disable reason was same as aarch64 I hope =
it was
not a runtime failure can you dig a bit

On Wed, Jul 31, 2019 at 9:50 PM Adrian Bunk <bunk@stusta.de> wrote:

> The binutils bug appears to have gone away.
>
> Using gold on powerpc still fails for seemingly unrelated reasons.
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.24.3.bb | 4 ----
>  1 file changed, 4 deletions(-
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
> index f65d79b0fb..81cbf34198 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.3.bb
> @@ -87,10 +87,6 @@ EXTRA_OECMAKE_append_armv5 =3D " -DENABLE_JIT=3DOFF "
>  EXTRA_OECMAKE_append_armv6 =3D " -DENABLE_JIT=3DOFF "
>  EXTRA_OECMAKE_append_armv4 =3D " -DENABLE_JIT=3DOFF "
>
> -# binutils 2.25.1 has a bug on aarch64:
> -# https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430
> -EXTRA_OECMAKE_append_aarch64 =3D " -DUSE_LD_GOLD=3DOFF "
> -EXTRA_OECMAKE_append_mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
>  EXTRA_OECMAKE_append_powerpc =3D " -DUSE_LD_GOLD=3DOFF "
>
>  # JIT not supported on MIPS either
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000333114058f07636f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I don=E2=80=99t remember if mips disable reason was =
same as aarch64 I hope it was not a runtime failure can you dig a bit=C2=A0=
</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jul 31, 2019 at 9:50 PM Adrian Bunk &lt;<a href=3D"mailt=
o:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">The binutils bug appears to have gone away.<br>
<br>
Using gold on powerpc still fails for seemingly unrelated reasons.<br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.3.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.3.bb</a> | 4 ----<br>
=C2=A01 file changed, 4 deletions(-<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.3.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.3.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.24.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.24.3.bb</a><br>
index f65d79b0fb..81cbf34198 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.3.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.3.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.3.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.3.bb</a><br>
@@ -87,10 +87,6 @@ EXTRA_OECMAKE_append_armv5 =3D &quot; -DENABLE_JIT=3DOFF=
 &quot;<br>
=C2=A0EXTRA_OECMAKE_append_armv6 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
=C2=A0EXTRA_OECMAKE_append_armv4 =3D &quot; -DENABLE_JIT=3DOFF &quot;<br>
<br>
-# binutils 2.25.1 has a bug on aarch64:<br>
-# <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D18430</a><br>
-EXTRA_OECMAKE_append_aarch64 =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<br>
-EXTRA_OECMAKE_append_mipsarch =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<br>
=C2=A0EXTRA_OECMAKE_append_powerpc =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<br=
>
<br>
=C2=A0# JIT not supported on MIPS either<br>
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

--000000000000333114058f07636f--
