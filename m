Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id B706D6093B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:19:39 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z8so22587560wrh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rgqTz7egOiyauzmQGkvJjBAQnJHm4e0esEdgznVhlho=;
	b=NG6ACWQEcvuMgCVdlN0PqpYe1J0XGZ4vooDqR+pgYr8lu0jNhk5fF/zotjJa0wIAmM
	p/NZXIS+BgjkDOV2sIf7HUv/SYGMn2mzQ2ff6kuTE0s3p8eYwwzfLIwKvPrenQBg4JFq
	uq4t0tNL59msdN4twO6m5RcP4m+v6FysbQlvJ6EYvaui25R8AjY3Q6e8SKyYn2+wcC9+
	f4iZStI7dcg/8IQauycLqZkKKpfqkB8BNqndVmONe56FwaG4sVem4ApbawA7pVh0/7RW
	/SH8W2XEj8SaIgm59/CWNNemnV3TfKEGk0XXdlxLurwL+LlZfIfUtR93Wo1eFU8qG8Wn
	qkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rgqTz7egOiyauzmQGkvJjBAQnJHm4e0esEdgznVhlho=;
	b=Kx3GpDfWVX0+46+94i9rEZko7Q2jwoWNzv9fZ1ruvY2zc6HFBt+miTB8HFj65S2kYR
	kPyiXKkL4JjZ+plTY20/zFrYi8Pq1dxX2qSKEjSiuOLyJYHNS4oXUm75V3UDBVML84kw
	ShuyYfIdVVjv8fqsMGTPOqCnmCmGce6xMa0kMpUaZwLIX01IZKG+CxXgY8cFFuPR5tCb
	7mMpT+edQFzTuDXS1Xk3+p7A26+3vCtYxmM/OuhBMl3n5ZI8yNA2klssITG2343ZJ//u
	9hG8FB+BtAfNZQiucfUntXto79ZQhbFRNlO2skdAGj1oKOmpZWyeuKlPu6+rVqcvVJRy
	TL6A==
X-Gm-Message-State: AElRT7H6iSxrVGyjp1e69Dr51V9CbzxikmPCICAzjRI8Lnig1f6MCzeN
	+g4Fa57/RwtK8SeQmZ0U5QMPj37QKmXyJSJIfm0=
X-Google-Smtp-Source: AG47ELvqcUXrRTLjfMw82ZVaKEOgTeWiaQOjBuK4EL7OTvJEOL0v9ymqKGy1eEL8fv0dPpZVu9kjojHSKlwdj4pKvEk=
X-Received: by 10.223.134.4 with SMTP id 4mr27152662wrv.230.1522160380272;
	Tue, 27 Mar 2018 07:19:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Tue, 27 Mar 2018 07:19:39 -0700 (PDT)
In-Reply-To: <1522159989-22111-1-git-send-email-akuster808@gmail.com>
References: <1522159989-22111-1-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Mar 2018 16:19:39 +0200
Message-ID: <CA+chaQdyCn5gma9YFDY9eQ-Ja62vMUmjhYT6CKi_PFG7BjSLCA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: "akuster@mvista" <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [V3][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Tue, 27 Mar 2018 14:19:40 -0000
Content-Type: multipart/alternative; boundary="001a1147d44cc1e6d60568659437"

--001a1147d44cc1e6d60568659437
Content-Type: text/plain; charset="UTF-8"

Looks like you have forgot to remove it from SRC_URI.

On Tue, Mar 27, 2018 at 4:13 PM, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> refreshed patch
>
> [v2]
> Remove dangling space in patch
>
> [v3]
> remove patch as changes on in update
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../xorg-lib/libxshmfence/extensions.patch              | 17
> -----------------
>  .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}        |  4 ++--
>  2 files changed, 2 insertions(+), 19 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-
> lib/libxshmfence/extensions.patch
>  rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb =>
> libxshmfence_1.3.bb} (77%)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> deleted file mode 100644
> index 4cc9e05..0000000
> --- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call
> -AC_USE_SYSTEM_EXTENSIONS to get that defined.
> -
> -Upstream-Status: Submitted
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 0c98875..ebf4dee 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
> - AC_CONFIG_HEADERS([config.h])
> -
> -+AC_USE_SYSTEM_EXTENSIONS
> -+
> - # Initialize Automake
> - AM_INIT_AUTOMAKE([foreign dist-bzip2])
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
> b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> similarity index 77%
> rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
> rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> index 1df068d..f6f5fb2 100644
> --- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
> @@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"
>
>  SRC_URI += "file://extensions.patch"
>
> -SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
> -SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb2
> 3f8fd231dcf891465b8debe636a9054b0c"
> +SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
> +SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a3
> 9831cb75f92bed5ccf9836345b459220c7"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147d44cc1e6d60568659437
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like you have forgot to remove it from SRC_URI.</div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Mar 27, =
2018 at 4:13 PM, Armin Kuster <span dir=3D"ltr">&lt;<a href=3D"mailto:akust=
er808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">From: Armin Kuster &lt;<a href=3D"mail=
to:akuster@mvista.com">akuster@mvista.com</a>&gt;<br>
<br>
refreshed patch<br>
<br>
[v2]<br>
Remove dangling space in patch<br>
<br>
[v3]<br>
remove patch as changes on in update<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../xorg-lib/libxshmfence/<wbr>extensions.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 17 -----------------<br>
=C2=A0.../{<a href=3D"http://libxshmfence_1.2.bb" rel=3D"noreferrer" target=
=3D"_blank">libxshmfence_1.2.bb</a> =3D&gt; <a href=3D"http://libxshmfence_=
1.3.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.3.bb</a>}=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A02 files changed, 2 insertions(+), 19 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/e=
xtensions.<wbr>patch<br>
=C2=A0rename meta/recipes-graphics/xorg-<wbr>lib/{<a href=3D"http://libxshm=
fence_1.2.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.2.bb</a> =
=3D&gt; <a href=3D"http://libxshmfence_1.3.bb" rel=3D"noreferrer" target=3D=
"_blank">libxshmfence_1.3.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<w=
br>patch b/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr=
>patch<br>
deleted file mode 100644<br>
index 4cc9e05..0000000<br>
--- a/meta/recipes-graphics/xorg-<wbr>lib/libxshmfence/extensions.<wbr>patc=
h<br>
+++ /dev/null<br>
@@ -1,17 +0,0 @@<br>
-With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call<br>
-AC_USE_SYSTEM_EXTENSIONS to get that defined.<br>
-<br>
-Upstream-Status: Submitted<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 0c98875..ebf4dee 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am]<wbr>)<br>
- AC_CONFIG_HEADERS([config.h])<br>
-<br>
-+AC_USE_SYSTEM_EXTENSIONS<br>
-+<br>
- # Initialize Automake<br>
- AM_INIT_AUTOMAKE([foreign dist-bzip2])<br>
diff --git a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmf=
ence_1.2.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.2.bb</a> b=
/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmfence_1.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.3.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmfe=
nce_1.2.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.2.bb</a><br=
>
rename to meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmfenc=
e_1.3.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.3.bb</a><br>
index 1df068d..f6f5fb2 100644<br>
--- a/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmfence_1.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.2.bb</a><br>
+++ b/meta/recipes-graphics/xorg-<wbr>lib/<a href=3D"http://libxshmfence_1.=
3.bb" rel=3D"noreferrer" target=3D"_blank">libxshmfence_1.3.bb</a><br>
@@ -15,5 +15,5 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://extensions.patch&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>66662e76899112c0f99e22f2fc775a<wbr>7e&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>d21b2d1fd78c1efbe1f2c16dae1cb2<wbr>3f8fd=
231dcf891465b8debe636a905<wbr>4b0c&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>42dda8016943dc12aff2c03a036e09<wbr>37&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>b884300d26a14961a076fbebc762a3<wbr>9831c=
b75f92bed5ccf9836345b4592<wbr>20c7&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--001a1147d44cc1e6d60568659437--
