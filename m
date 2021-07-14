Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3107.1626241580167453766
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jul 2021 22:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kB6Ax0vE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id dt7so1298264ejc.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jul 2021 22:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JDr3KFoT9r9cMVUtXtHWh1UrMHjDbky0DXgYBjx2H64=;
        b=kB6Ax0vEWgiEYzgq/Fh70I/gkAFq8tApNCYGmYGwCj8MHKeMD4k5Z3pHYDpmXAUlKm
         2q1ud/2cOmSJCTMIawt3XFbYdzfv9BtmLMQcVQmu4XWtxkf5Ykc7Ht7jwEJbcKs9Rxw1
         DzRFVqZmuzrx7diVWHxPzkn2enRckMsJmKWWEtCJe6nf9/tr3UxnxJRGbcaWWtuUxyty
         lKRDZdOCLfX0e+WFkLAq4rFYvI/tWjU3X3PwCDnBcPBjOinlO3f/ZVKl5a87bBoZYLhP
         2sLcbWu0Grpoh3q1cj3zIj9CGpioWGM3j28q1iYVV8Q30yCqyl3z7pr6K7r5Msj+ruBs
         Y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JDr3KFoT9r9cMVUtXtHWh1UrMHjDbky0DXgYBjx2H64=;
        b=W+Zn/70rlJeBlgwOmVgXE3WBEfIU8+OIDINd4qH3HNaft1yeO9AIShress9ET8baWO
         klcUoO69rRJ61w+nXUgFFFUafcJQqGWseNF1GlLlTyZqNs4foF0XtCqW2qdNFvbW0jpG
         MBy44cPGXKNfkbytgBjN3llXqOZRyrvXSIPfSVoelo3ariX8hJwkj+39UI7/esjwNvCn
         XmZjSnxSGbzBGuhP3ThP4NK7+wPSRyyDyhTW3uY7GMiqpMkfbK7SVg+h8gWwL9JmTnS6
         RqGkqxPz70vMHCncT36BYYRZs4wkFBYJR1JREkTaKUo2gtXB3XQV7x8STJp3ZPxyq2c+
         Uz+Q==
X-Gm-Message-State: AOAM532Of2dyjIP/4W5Lj50REEnpD6M27VYGLmXqUeeiHGSN1zoWdM1f
	PNLrLcfO5yArgGghg5jTVBU51rDOByn34IXtFhI=
X-Google-Smtp-Source: ABdhPJymKyaGovlQqTJrcCDcmucLzzXPwQoxuGpodSJJJgw6Jje6ntB13q/lxRSBUk+wOSAax6qrXPxQP9qFsl5mrII=
X-Received: by 2002:a17:906:af0e:: with SMTP id lx14mr1989238ejb.54.1626241578549;
 Tue, 13 Jul 2021 22:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210714021322.1245535-1-raj.khem@gmail.com>
In-Reply-To: <20210714021322.1245535-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 14 Jul 2021 07:46:06 +0200
Message-ID: <CA+chaQdp4LxhM6LP+xGd3f3j6MEo6h0h1s3Mt_xCpcyfSfOxkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libseccomp: Update to main branch
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009bc51f05c70edf5e"

--0000000000009bc51f05c70edf5e
Content-Type: text/plain; charset="UTF-8"

Did you forget to replace AUTOREV with new SRCREV when you were done?

On Wed, Jul 14, 2021 at 4:13 AM Khem Raj <raj.khem@gmail.com> wrote:

> Get RV32 imlementation
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++++
>  .../libseccomp/libseccomp_2.5.1.bb            |  7 +++--
>  2 files changed, 29 insertions(+), 4 deletions(-)
>  create mode 100644
> meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
>
> diff --git
> a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> new file mode 100644
> index 0000000000..f30ca77465
> --- /dev/null
> +++
> b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version-to-2.5.99.patch
> @@ -0,0 +1,26 @@
> +From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Jun 2021 23:13:20 -0700
> +Subject: [PATCH] configure.ac: Bump version to 2.5.99
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 3e87734..48e796f 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -19,7 +19,7 @@ dnl #
> + dnl ####
> + dnl libseccomp defines
> + dnl ####
> +-AC_INIT([libseccomp], [0.0.0])
> ++AC_INIT([libseccomp], [2.5.99])
> +
> + dnl ####
> + dnl autoconf configuration
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> index 8fe1023901..5f79f3dbcb 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
> @@ -7,14 +7,13 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357c
>
>  DEPENDS += "gperf-native"
>
> -SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
> +SRCREV = "${AUTOREV}"
>
> -SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
> +SRC_URI = "git://github.com/kraj/libseccomp.git;branch=riscv32 \
> +           file://0001-configure.ac-Bump-version-to-2.5.99.patch \
>             file://run-ptest \
>             "
>
> -COMPATIBLE_HOST_riscv32 = "null"
> -
>  S = "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig ptest features_check
> --
> 2.32.0
>
>
> 
>
>

--0000000000009bc51f05c70edf5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Did you forget to replace AUTOREV with new SRCREV when you=
 were done?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, Jul 14, 2021 at 4:13 AM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Get RV32 imlementation<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...-configure.ac-Bump-version-to-2.5.99.patch | 26 +++++++++++++++++=
++<br>
=C2=A0.../libseccomp/<a href=3D"http://libseccomp_2.5.1.bb" rel=3D"norefer=
rer" target=3D"_blank">libseccomp_2.5.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 7 +++--<br>
=C2=A02 files changed, 29 insertions(+), 4 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/libseccomp/files/0001-config=
ure.ac-Bump-version-to-2.5.99.patch<br>
<br>
diff --git a/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-=
version-to-2.5.99.patch b/meta/recipes-support/libseccomp/files/0001-config=
ure.ac-Bump-version-to-2.5.99.patch<br>
new file mode 100644<br>
index 0000000000..f30ca77465<br>
--- /dev/null<br>
+++ b/meta/recipes-support/libseccomp/files/0001-configure.ac-Bump-version=
-to-2.5.99.patch<br>
@@ -0,0 +1,26 @@<br>
+From 00b6bc440a75443f9bea431bbb41df50469b5093 Mon Sep 17 00:00:00 2001<br=
>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
+Date: Tue, 8 Jun 2021 23:13:20 -0700<br>
+Subject: [PATCH] <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: Bump version to 2.5.99<br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">con=
figure.ac</a> | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D=
"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferr=
er" target=3D"_blank">configure.ac</a><br>
+index 3e87734..48e796f 100644<br>
+--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank=
">configure.ac</a><br>
+@@ -19,7 +19,7 @@ dnl #<br>
+ dnl ####<br>
+ dnl libseccomp defines<br>
+ dnl ####<br>
+-AC_INIT([libseccomp], [0.0.0])<br>
++AC_INIT([libseccomp], [2.5.99])<br>
+ <br>
+ dnl ####<br>
+ dnl autoconf configuration<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_=
2.5.1.bb" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a> b/me=
ta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.5.1.bb" rel=3D=
"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
index 8fe1023901..5f79f3dbcb 100644<br>
--- a/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
+++ b/meta/recipes-support/libseccomp/<a href=3D"http://libseccomp_2.5.1.b=
b" rel=3D"noreferrer" target=3D"_blank">libseccomp_2.5.1.bb</a><br>
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;beginline=3D0;=
endline=3D1;md5=3D8eac08d22113880357c<br>
<br>
=C2=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
<br>
-SRCREV =3D &quot;4bf70431a339a2886ab8c82e9a45378f30c6e6c7&quot;<br>
+SRCREV =3D &quot;${AUTOREV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/seccomp/libseccomp.g=
it;branch=3Drelease-2.5" rel=3D"noreferrer" target=3D"_blank">github.com/se=
ccomp/libseccomp.git;branch=3Drelease-2.5</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/kraj/libseccomp.git;=
branch=3Driscv32" rel=3D"noreferrer" target=3D"_blank">github.com/kraj/libs=
eccomp.git;branch=3Driscv32</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.ac-Bump-ve=
rsion-to-2.5.99.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-COMPATIBLE_HOST_riscv32 =3D &quot;null&quot;<br>
-<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0inherit autotools-brokensep pkgconfig ptest features_check<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009bc51f05c70edf5e--
