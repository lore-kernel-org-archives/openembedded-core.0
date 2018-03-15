Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id BF8D378830
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 01:56:59 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id w197so2451288vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 18:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D4wvwqk37kNjA4BhqRbL8cjj1kAaGAjIAHualfno+nw=;
	b=ixoe8M1WJ0OohBn5LGKaVjIox/c0IZq92m4AfGlf2Ot7Yep/rMQvXv4x6pVUF76z8c
	G+CWnHfIsUSBlOB/wpRsaZHk5bWqiL/HVAYNA5NSHo0bvjlkSxCtPFHtNAiiktvXYU33
	dkPOMPQ7z79vDOraIXTtynhbBVdOH9358l8oeuhbvUf5GSOsdY6ARJgcITAI4WAZ/TTu
	3YMFA+oihT7hYcWVxn2Baw5ChUmIADjxRtFvNY+S/duxAWXL25apKEUVpOKtrV/Oa6Aw
	ml+KjPoOofYYMYNN6EQ+GiiW6FHkYerYOp8JFVWyznWGmz0ibEt/VK68xvmSCXKy9cD9
	JO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D4wvwqk37kNjA4BhqRbL8cjj1kAaGAjIAHualfno+nw=;
	b=qrISzu/vMHzdaCUuBiEZmL0VTl4uXCLcdwQ6fMQegpbY2UAniYXYBIWCj6EZYcRIqH
	SesJc7jpNDnfLFZoaXavQN4kIhVEQxQj43zEttSX//bC7LGjUjm0iaRlnTzC5CHlG4oc
	8kpo/XEb/6hBvLdeRQhYnhlNkXCRGipUx//+w5BBwkITSfXUxjG9P/JVYqbT7c8lOFDc
	BOm72E83Gn6EeqSzl9xHKl7mtEbTYGNnYexcr5DEq1K2o9arGk1mEy9cdRsX4mzXbxGJ
	DiCsxjNM6vnl4oQB2AIUCIOiJumrFO7aW7rOwj105biIPuGygzJzXI0S2jKkpNmVgCaL
	moxA==
X-Gm-Message-State: AElRT7EdF2Fd75+XRAb4RbWBPm4eqGDVABJlakX8Sktu7xzMdTXEday9
	DatxYLMbpo5Ta9oIdgVTcetb1IhV+3RvG2fWns0=
X-Google-Smtp-Source: AG47ELtJ39N+XAm6T0XUK5wDomYgVWoPgI2OntJTrc0g+ryFtsggel+9SG1hTe97JceJeizzeOvLyUGLAsFwzUfy1T4=
X-Received: by 10.31.206.198 with SMTP id e189mr4883084vkg.164.1521079020473; 
	Wed, 14 Mar 2018 18:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.61.25 with HTTP; Wed, 14 Mar 2018 18:56:40 -0700 (PDT)
In-Reply-To: <20180315014848.14279-1-raj.khem@gmail.com>
References: <20180315014848.14279-1-raj.khem@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 14 Mar 2018 18:56:40 -0700
Message-ID: <CABcZANnzr1Xpw+Xc0=Wr-HCi95Er-GU+zOLPKj81S33GEnUW0w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Thu, 15 Mar 2018 01:56:59 -0000
Content-Type: multipart/alternative; boundary="001a114e5a44b0e50a056769ce6a"

--001a114e5a44b0e50a056769ce6a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2018 at 6:48 PM, Khem Raj <raj.khem@gmail.com> wrote:

> We allow to set LINKER_HASH_STYLE to be empty so this would fail
> since --with-linker-hash-style needs an argument and cant be empty
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc
> b/meta/recipes-devtools/gcc/gcc-7.3.inc
> index d56d2c5e06..cc428ad3ef 100644
> --- a/meta/recipes-devtools/gcc/gcc-7.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
> @@ -100,7 +100,7 @@ EXTRA_OECONF_BASE =3D "\
>      --disable-bootstrap \
>      --disable-libmudflap \
>      --with-system-zlib \
> -    --with-linker-hash-style=3D${LINKER_HASH_STYLE} \
> +    ${@['','--with-linker-hash-style=3D${LINKER_HASH_STYLE}'][d.getVar('=
LINKER_HASH_STYLE')
> !=3D '']} \
>

That syntax was a hack around the fact that python didn=E2=80=99t have inli=
ne if
statements at the time we started the project, but it does now:

    ${@=E2=80=98=E2=80=94with-linker-hash-style=3D${LINKER_HASH_STYLE}=E2=
=80=99 if
=E2=80=98${LINKER_HASH_STYLE}=E2=80=99 else =E2=80=98'}
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114e5a44b0e50a056769ce6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 14, 2018 at 6:48 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">We allow to set LINKER_HAS=
H_STYLE to be empty so this would fail<br>
since --with-linker-hash-style needs an argument and cant be empty<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-<wbr>7.3.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc b/meta/recipes-devt=
ools/gcc/<wbr>gcc-7.3.inc<br>
index d56d2c5e06..cc428ad3ef 100644<br>
--- a/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc<br>
+++ b/meta/recipes-devtools/gcc/<wbr>gcc-7.3.inc<br>
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0--disable-bootstrap \<br>
=C2=A0 =C2=A0 =C2=A0--disable-libmudflap \<br>
=C2=A0 =C2=A0 =C2=A0--with-system-zlib \<br>
-=C2=A0 =C2=A0 --with-linker-hash-style=3D${<wbr>LINKER_HASH_STYLE} \<br>
+=C2=A0 =C2=A0 ${@[&#39;&#39;,&#39;--with-linker-hash-<wbr>style=3D${LINKER=
_HASH_STYLE}&#39;][<wbr>d.getVar(&#39;LINKER_HASH_STYLE&#39;) !=3D &#39;&#3=
9;]} \<br></blockquote><div><br></div><div>That syntax was a hack around th=
e fact that python didn=E2=80=99t have inline if statements at the time we =
started the project, but it does now:</div><div><br></div><div>=C2=A0 =C2=
=A0 ${@=E2=80=98=E2=80=94with-linker-hash-style=3D${LINKER_HASH_STYLE}=E2=
=80=99 if =E2=80=98${LINKER_HASH_STYLE}=E2=80=99 else =E2=80=98&#39;}</div>=
</div>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at=
 gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Sof=
tware Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a114e5a44b0e50a056769ce6a--
