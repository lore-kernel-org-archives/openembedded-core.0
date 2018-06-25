Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6CD560237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 20:52:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id g3-v6so7108035ljk.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 13:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OFRYrFbcGj13425ylUgcLKpz7okvZOatCgPgwvgLBEA=;
	b=ibrWoQl4+NBLclEfLbEjnRzc44bZey+2w9dEgM0toR8tFphTLitaruKv3T1X7JTP5e
	K4aMuwceL7I82IjkM1GxFNDx5N5T6beL4B87uItgqLDAISUwGmWQNNN39/5wTNsKu3dx
	G0tYUJ0DFq7YpSmDvjjGG2l1A8uoJWEbo0rmmIWd0HNngNTOxQ9WrsfzGHvah5DPYJbP
	hNARZzibTWl4KwL/z7Dgr6jHTVbb6tSN6bSVBmzyILRRkoHYB9hGXONPfDsjQNUt38VW
	QW5rRpqA12wudDXjRSo+Wx4jmlfojcqBxM4pgcLOom4E1croFDkVViWTRpoRrw4BRLKI
	jNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OFRYrFbcGj13425ylUgcLKpz7okvZOatCgPgwvgLBEA=;
	b=qhD/HSBtbMa09bSWCTgpJn9qZs5fqGTsLD5MdA2cq0MmmiFQt9Cdj6d0g8f2fPSwLN
	Wq+a0h6cesaG10RyvQwfATKTnlKhWnC9c+FOVWn3qM5Wx1kiwKYiGSPZ80brcXXWUgBi
	LRnSOLXVDlihwf+ZVCpxgbOCOP8zLbVBytXjrzIXT3stVCmnc8eJlTZwOTkwrLauFA0L
	ouykEGeFpCVJko7j1QwKXeHUr6f/Gggi7rnOiQvPJp7f5QdUouMoY4vJstFeld/hrlH9
	yIdJJVl58ON3gYlWztiRSknlr8PSFmGnpG2oSFUWQ3zzv8qG5T0BHWnvgMNrEQ5MUnRK
	WZqw==
X-Gm-Message-State: APt69E2DyiIFRe6XJfORgBITEcGuyU+IMa2gdyuIfHRJU4sGdzX4zgkD
	RHt9SHlQFJc+uiyOpmeEM92wCRwamzwlJ4AARxo=
X-Google-Smtp-Source: ADUXVKKPVGsuZu+ktLIJ/Z3uG4cdJU8WdDapRpRqYRMY/wyZOqYZABeE+clKmnIFomacKw/qZcebw+hLIxUZ+5gAAsk=
X-Received: by 2002:a2e:1207:: with SMTP id
	t7-v6mr3674878lje.129.1529959976712; 
	Mon, 25 Jun 2018 13:52:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5408:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 13:52:55
	-0700 (PDT)
In-Reply-To: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
References: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 25 Jun 2018 16:52:55 -0400
Message-ID: <CADkTA4P881jar5PygYaY+i4VD_rXYsXOOhU3eZDLWGDn4xRcCA@mail.gmail.com>
To: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Mon, 25 Jun 2018 20:52:57 -0000
Content-Type: multipart/alternative; boundary="000000000000eebe45056f7d90dc"

--000000000000eebe45056f7d90dc
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 25, 2018 at 1:50 PM, Jon Szymaniak <jon.szymaniak.foss@gmail.com
> wrote:

> An optional dependency upon the capstone disassembler was introduced
> in QEMU v2.11.0-rc0. The necessary version of capstone is included
> in the QEMU repository as a git submodule.
>
> The QEMU configure script uses pkg-config to determine if an
> installation of capstone already exists on the system, and defaults to
> this, if found. However, there does not appear to be any capstone
> version or API compatibility checks.
>
> To avoid any potential version conflicts or API incompatibility issues
> in the future, use the `--enable-capstone=git` argument to force the use
> of the capstone version included by QEMU as a git submodule.
>

How exactly does that work when the default qemu recipe is a tar.bz2
download ?

We can't have the recipe going out to the 'net and fetching / downloading
source code .. and looking at the option, that appears to be what it would
do. Or maybe I'm missing where the code is being fetched into place.

This is something that looks like it could be controlled via packageconfig,
or similar mechanism, versus being hard coded into the configure line.

Also, the patch is missing your Signed-off-by:

Cheers,

Bruce


> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index 094a975177..37f8398967 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -23,6 +23,7 @@ EXTRA_OECONF = " \
>      --libexecdir=${libexecdir} \
>      --localstatedir=${localstatedir} \
>      --with-confsuffix=/${BPN} \
> +    --enable-capstone=git \
>      --disable-strip \
>      --disable-werror \
>      --target-list=${@get_qemu_target_list(d)} \
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--000000000000eebe45056f7d90dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Jun 25, 2018 at 1:50 PM, Jon Szymaniak <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jon.szymaniak.foss@gmail.com" target=3D"_blank">jon.szymani=
ak.foss@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">A=
n optional dependency upon the capstone disassembler was introduced<br>
in QEMU v2.11.0-rc0. The necessary version of capstone is included<br>
in the QEMU repository as a git submodule.<br>
<br>
The QEMU configure script uses pkg-config to determine if an<br>
installation of capstone already exists on the system, and defaults to<br>
this, if found. However, there does not appear to be any capstone<br>
version or API compatibility checks.<br>
<br>
To avoid any potential version conflicts or API incompatibility issues<br>
in the future, use the `--enable-capstone=3Dgit` argument to force the use<=
br>
of the capstone version included by QEMU as a git submodule.<br></blockquot=
e><div><br></div><div>How exactly does that work when the default qemu reci=
pe is a tar.bz2 download ?</div><div><br></div><div>We can&#39;t have the r=
ecipe going out to the &#39;net and fetching / downloading source code .. a=
nd looking at the option, that appears to be what it would do. Or maybe I&#=
39;m missing where the code is being fetched into place.</div><div><br></di=
v><div>This is something that looks like it could be controlled via package=
config, or similar mechanism, versus being hard coded into the configure li=
ne.</div><div><br></div><div>Also, the patch is missing your Signed-off-by:=
</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0meta/recipes-devtools/qemu/<wbr>qemu.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu.inc b/meta/recipes-devtoo=
ls/qemu/<wbr>qemu.inc<br>
index 094a975177..37f8398967 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu.inc<br>
@@ -23,6 +23,7 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0--libexecdir=3D${libexecdir} \<br>
=C2=A0 =C2=A0 =C2=A0--localstatedir=3D${<wbr>localstatedir} \<br>
=C2=A0 =C2=A0 =C2=A0--with-confsuffix=3D/${BPN} \<br>
+=C2=A0 =C2=A0 --enable-capstone=3Dgit \<br>
=C2=A0 =C2=A0 =C2=A0--disable-strip \<br>
=C2=A0 =C2=A0 =C2=A0--disable-werror \<br>
=C2=A0 =C2=A0 =C2=A0--target-list=3D${@get_qemu_<wbr>target_list(d)} \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.14.1<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--000000000000eebe45056f7d90dc--
