Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id AB95E60119
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 13:02:51 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id u201so63400429oie.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 06:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2nVkZRP0lixui6U56FyXBlkWyEvunYQuzEI9z2Ze7UU=;
	b=mwf0lxqossrGtHC9p2py+LnPY+h0IinSPoiffiPaU9dO0kn1k3d2wbkJ7/tq+ZqcRi
	zwDOsWhdk5aK7Cm0O4gTMx8n7Otf8N2sI6IcGwIZ2OmUr4iG2x0AfvyytoBhNW5geJDi
	El7MlqyfF5EAKekqXHFpUsskB7DGBrVm6kqRlbnvOkuIcWI8RmBdO3Zgktxhir4eTF33
	ShTp0i9+H8HorcpZTIuO5tR2RakMK0fR1ZnpHPyEL9udvJsP5wvY4NRLY5NyuF9rFCgF
	bOmhQWrdj14JOKB+sRdl1J3hNgNtqrsrLTPOS48SMGJ1EM5swFIF8lBGjEWjszYeiy0G
	9yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2nVkZRP0lixui6U56FyXBlkWyEvunYQuzEI9z2Ze7UU=;
	b=MK8Wzb2EobF9gia3V21zRteIHkOTn17TzQoO7HvshuVx7o2lHm6y3pU2/p7fLMIqDZ
	upxJ1qj76yy6B3OYcsCxq0TB4Imm6sfbudYVS9JdD9mSh2of06R5e5lqkKbmhMUvFXp/
	KsuJ21okSh6Ccs9MI0YLwkj/SQvvkRelr4iKdBJL7CnJX1ygk4qr1mXu7vJbSCHy4pIw
	iRJQLar+2veUh7rrgfmBWiakShFHK6rBJMTXMbqGB8t3Qe63Y+w9AwGwriUmk7qJxNMQ
	YGCNulUlhl+iI1fxn8gqF1juMWZgG4dU7f7/3zgL30toJTTqik7/CbOWFmpjGaYEBMKu
	PKuw==
X-Gm-Message-State: ALyK8tKCT5dtP2oPCcNXY7UkXEo3v3nvIk9iwfvKjE4J3MyxdjdZpSaBosRNjlq6Jrnv+lkefKFd3ke8X/Au1t7Y
X-Received: by 10.157.40.150 with SMTP id s22mr10105554ota.62.1467291771692;
	Thu, 30 Jun 2016 06:02:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.79.83 with HTTP; Thu, 30 Jun 2016 06:02:22 -0700 (PDT)
In-Reply-To: <1467290422-19660-1-git-send-email-awais_belal@mentor.com>
References: <1467290422-19660-1-git-send-email-awais_belal@mentor.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 30 Jun 2016 16:02:22 +0300
Message-ID: <CAHiDW_GAUerRu1dxuVJ56cdznn_LVVh0LsyBemEVAvx-FLnOww@mail.gmail.com>
To: Awais Belal <awais_belal@mentor.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: move crypto configs to versioned recipe
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
X-List-Received-Date: Thu, 30 Jun 2016 13:02:52 -0000
Content-Type: multipart/alternative; boundary=001a11c17060d57c9c05367e7ceb

--001a11c17060d57c9c05367e7ceb
Content-Type: text/plain; charset=UTF-8

On 30 June 2016 at 15:40, Awais Belal <awais_belal@mentor.com> wrote:

> Fixes
> WARNING: mesa-2_11.0.8+gitAUTOINC+b9b19162ee-r0 do_configure: QA Issue:
> mesa: configure was passed unrecognised options: --with-sha1
> [unknown-configure-option]
> for git based recipe as it is on an older version of mesa
> which does not support crypto configs.
>

I was about to suggest removing the git recipe (or at least bumping the
revision) instead... but mesa-2_11.0.8 is actually not a oe-core
recipe/version at all?

 Jussi

Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc       | 6 ------
>  meta/recipes-graphics/mesa/mesa_11.2.2.bb | 6 ++++++
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 1d084c0..b227abc 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -64,12 +64,6 @@ PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm
> --enable-llvm-shared-libs,
>  export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
>  PACKAGECONFIG[xa]  = "--enable-xa, --disable-xa"
>
> -# Mesa requires one of the following crypto implementation, pick one of
> them
> -MESA_CRYPTO ??= "openssl"
> -PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
> -PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
> -PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
> -
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_11.2.2.bb
> b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
> index a864b54..87c12c8 100644
> --- a/meta/recipes-graphics/mesa/mesa_11.2.2.bb
> +++ b/meta/recipes-graphics/mesa/mesa_11.2.2.bb
> @@ -1,5 +1,11 @@
>  require ${BPN}.inc
>
> +# Mesa requires one of the following crypto implementation, pick one of
> them
> +MESA_CRYPTO ??= "openssl"
> +PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
> +PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
> +PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
> +
>  SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/mesa-${PV}.tar.xz \
>             file://replace_glibc_check_with_linux.patch \
>  "
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11c17060d57c9c05367e7ceb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 3=
0 June 2016 at 15:40, Awais Belal <span dir=3D"ltr">&lt;<a href=3D"mailto:a=
wais_belal@mentor.com" target=3D"_blank">awais_belal@mentor.com</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">Fixes<br>
WARNING: mesa-2_11.0.8+gitAUTOINC+b9b19162ee-r0 do_configure: QA Issue: mes=
a: configure was passed unrecognised options: --with-sha1 [unknown-configur=
e-option]<br>
for git based recipe as it is on an older version of mesa<br>
which does not support crypto configs.<br></blockquote><div><br></div><div>=
I was about to suggest removing the git recipe (or at least bumping the rev=
ision) instead... but mesa-2_11.0.8 is actually not a oe-core recipe/versio=
n at all?</div><div>=C2=A0</div><div>=C2=A0Jussi</div><div><br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding=
-left:1ex">
Signed-off-by: Awais Belal &lt;<a href=3D"mailto:awais_belal@mentor.com">aw=
ais_belal@mentor.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ---=
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_11.2.2.bb</a> | 6 ++++++<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 1d084c0..b227abc 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -64,12 +64,6 @@ PACKAGECONFIG[gallium-llvm] =3D &quot;--enable-gallium-l=
lvm --enable-llvm-shared-libs,<br>
=C2=A0export WANT_LLVM_RELEASE =3D &quot;${MESA_LLVM_RELEASE}&quot;<br>
=C2=A0PACKAGECONFIG[xa]=C2=A0 =3D &quot;--enable-xa, --disable-xa&quot;<br>
<br>
-# Mesa requires one of the following crypto implementation, pick one of th=
em<br>
-MESA_CRYPTO ??=3D &quot;openssl&quot;<br>
-PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,openssl&quot;<br=
>
-PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,nettle&quot;<br>
-PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,libgcrypt&quot;<b=
r>
-<br>
=C2=A0# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)<b=
r>
=C2=A0FULL_OPTIMIZATION_append =3D &quot; -fno-omit-frame-pointer&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_11.2.2.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_11.2.2.bb</a><br>
index a864b54..87c12c8 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_11.2.2.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_11.2.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_11.2.2.bb</a><br>
@@ -1,5 +1,11 @@<br>
=C2=A0require ${BPN}.inc<br>
<br>
+# Mesa requires one of the following crypto implementation, pick one of th=
em<br>
+MESA_CRYPTO ??=3D &quot;openssl&quot;<br>
+PACKAGECONFIG[openssl] =3D &quot;--with-sha1=3Dlibcrypto,,openssl&quot;<br=
>
+PACKAGECONFIG[nettle] =3D &quot;--with-sha1=3Dlibnettle,,nettle&quot;<br>
+PACKAGECONFIG[gcrypt] =3D &quot;--with-sha1=3Dlibgcrypt,,libgcrypt&quot;<b=
r>
+<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"ftp://ftp.freedesktop.org/pub/mesa/${PV}=
/mesa-${PV}.tar.xz" rel=3D"noreferrer" target=3D"_blank">ftp://ftp.freedesk=
top.org/pub/mesa/${PV}/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://replace_glibc_check_with_l=
inux.patch \<br>
=C2=A0&quot;<br>
<span class=3D""><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core<br></a><br></font></span></blockquote><div>=C2=
=A0</div></div></div></div>

--001a11c17060d57c9c05367e7ceb--
