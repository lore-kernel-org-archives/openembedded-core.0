Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02811C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:32:58 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.9376.1714732375890584518
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j9ldOZQ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e1fa2ff499so13002571fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714732374; x=1715337174; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=29zgTfPjwn8s9GHWaKd7JM3kBKSGjmwKhR+aMusdzkA=;
        b=j9ldOZQ4bcsyBEKc5Ta54R93XS0XfVLkvL9AoBZPmYM9+XDV2+QAxz1BwrlEjY8YMW
         jRjMuUXAcpq47drUPgLUP3RnO3NRP4mv3sjQfLq5uinj2ko9sTrl9G38J19SO1SJRtIm
         u58qhTczV4X7naXgCytz1qBmB/U1Zqn1HjWtU1x5NNFnLlMOwAHBMjfXcvao1FXOo6ZA
         iH0ddXkl3k4qLT2jCGgyaYkecHLvNCyGfkea1Lh1CtnasDz+3xs7nWnks6R2Rh4EDlLO
         TpWmAi8nH3Mq0865029b7rSQwHteFPRVdrHWOI6juL7XYrYF68gJH+Xs7aXCxPii2QvT
         7j4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714732374; x=1715337174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29zgTfPjwn8s9GHWaKd7JM3kBKSGjmwKhR+aMusdzkA=;
        b=D9D1rKElzzyMrSBXPrr0b5a5oF8nLmHX0xamrmbSJDmLtKGjledE+hSBLIekc4uD27
         xYcuBbyI1fhrpjpHTXCKQ0uFmtorNqCt7S5FIu+EqqgzzhuaPJ8s5ccGDWWR4bfxcpvK
         LopeEZPY6G60+xT+EUGJbfFa5AtCXznZYyyiQRZO7RYvCNP/d6+UB60BjCrEIlw1L3Cv
         fPU8tIV4CPLZPGVBGBOX0Rr8Bq4zmoEdJjYfiU/9uugoQXkOuKl88IpBCV2hG9RvgwXX
         gjT2seUADLa+XTYWj4K8K9YdAExjoQ7ukNYPnpOAoTHN6u9EKChJtTFoqJXG+ZU0AETD
         YRcg==
X-Gm-Message-State: AOJu0YzEjXWzpuyFhXsVpgMA/4SDSDeQPVxd6zDg8MZHQ3fQGUZVnJFM
	eCCyfYIkuZ7qdTYyfnDEXbnDFiEgyXWwKoMJE0J1fDrkS2R97NJBAptC7BXybAKyFSBJe9LeiCs
	VP0XetYxutMOgYNbFBG+MMsfrH9I=
X-Google-Smtp-Source: AGHT+IF40JwwrLgLAaJkz8pFAN84CuqfCcA06G31GxfpG/jzWiODXlrcirt5ozzIe1DTaFLl1KqqQgRXPOknRSnw+fo=
X-Received: by 2002:a2e:be90:0:b0:2e1:c9bd:eb5c with SMTP id
 a16-20020a2ebe90000000b002e1c9bdeb5cmr1816180ljr.20.1714732373789; Fri, 03
 May 2024 03:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
In-Reply-To: <20240503102624.594443-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 May 2024 12:32:42 +0200
Message-ID: <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000652a606178a3eec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198970

--0000000000000652a606178a3eec
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m sorry, this doesn=E2=80=99t look right. Shouldn=E2=80=99t we ra=
ther ensure $(LIBDIR) is
correctly set? Besides, hardcoding to lib is certainly incorrect as it will
break multilib. We constantly have to fix upstreams in the opposite
direction.

Alex

On Fri 3. May 2024 at 12.26, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> openssl update from 3.2.1 to 3.3.0 changed pkg-config generators
> and libdir changed from /usr/lib to /lib. This breaks builds
> of recipes which use openssl pkg-config files for library install
> etc paths. For example meta-security tpm2-openssl fails to build:
>
> ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue:
> tpm2-openssl: Files/directories were installed but not shipped in any
> package:
>   /usr/ossl-modules/tpm2.so
>
> Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc
>
> Fix this by hard coding LIBDIR variable to "lib". Prefix should
> be correctly used as before.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  .../openssl/openssl_pkg-config_libdir.patch   | 31 +++++++++++++++++++
>  .../openssl/openssl_3.3.0.bb                  |  1 +
>  2 files changed, 32 insertions(+)
>  create mode 100644
> meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.patch
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.pat=
ch
> b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.pat=
ch
> new file mode 100644
> index 0000000000..e3b4249a69
> --- /dev/null
> +++
> b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.pat=
ch
> @@ -0,0 +1,31 @@
> +openssl: fix pkg-config file libdir from /usr back to /usr/lib
> +
> +openssl update from 3.2.1 to 3.3.0 changed pkg-config generators
> +and libdir changed from /usr/lib to /lib. This breaks builds
> +of recipes which use openssl pkg-config files for library install
> +etc paths. For example meta-security tpm2-openssl fails to build:
> +
> +ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue:
> tpm2-openssl: Files/directories were installed but not shipped in any
> package:
> +  /usr/ossl-modules/tpm2.so
> +
> +Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc
> +
> +Fix this by hard coding LIBDIR variable to "lib". Prefix should
> +be correctly used as before.
> +
> +Upstream-Status: Inappropriate [configuration change]
> +
> +Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> +
> +--- a/exporters/build.info
> ++++ b/exporters/build.info
> +@@ -19,7 +19,7 @@ DEPEND[openssl.pc]=3Dlibcrypto.pc libssl.pc
> + DEPEND[""]=3Dopenssl.pc
> +
> + GENERATE[../installdata.pm]=3D../util/mkinstallvars.pl \
> +-    "PREFIX=3D$(INSTALLTOP)" BINDIR=3Dbin "LIBDIR=3D$(LIBDIR)" \
> ++    "PREFIX=3D$(INSTALLTOP)" BINDIR=3Dbin LIBDIR=3Dlib \
> +     INCLUDEDIR=3Dinclude APPLINKDIR=3Dinclude/openssl \
> +     "ENGINESDIR=3D$(ENGINESDIR)" "MODULESDIR=3D$(MODULESDIR)" \
> +     "PKGCONFIGDIR=3D$(PKGCONFIGDIR)" "CMAKECONFIGDIR=3D$(CMAKECONFIGDIR=
)" \
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
> b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
> index 2cdaf4c75d..5ee8375ebc 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "
> http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>
> file://0001-Added-handshake-history-reporting-when-test-fails.patch \
>             file://bti.patch \
> +           file://openssl_pkg-config_libdir.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198969):
> https://lists.openembedded.org/g/openembedded-core/message/198969
> Mute This Topic: https://lists.openembedded.org/mt/105885236/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000652a606178a3eec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m sorry, this doesn=E2=80=99t look right. Shoul=
dn=E2=80=99t we rather ensure $(LIBDIR) is correctly set? Besides, hardcodi=
ng to lib is certainly incorrect as it will break multilib. We constantly h=
ave to fix upstreams in the opposite direction.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri 3. May 2024 at 12.26, Mikko Rapeli =
via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &l=
t;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembedded.org">linar=
o.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-=
left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">opens=
sl update from 3.2.1 to 3.3.0 changed pkg-config generators<br>
and libdir changed from /usr/lib to /lib. This breaks builds<br>
of recipes which use openssl pkg-config files for library install<br>
etc paths. For example meta-security tpm2-openssl fails to build:<br>
<br>
ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue: tpm2-op=
enssl: Files/directories were installed but not shipped in any package:<br>
=C2=A0 /usr/ossl-modules/tpm2.so<br>
<br>
Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc<br>
<br>
Fix this by hard coding LIBDIR variable to &quot;lib&quot;. Prefix should<b=
r>
be correctly used as before.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl_pkg-config_libdir.patch=C2=A0 =C2=A0| 31 ++++++++=
+++++++++++<br>
=C2=A0.../openssl/<a href=3D"http://openssl_3.3.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssl_3.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 32 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl_=
pkg-config_libdir.patch<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_l=
ibdir.patch b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_=
libdir.patch<br>
new file mode 100644<br>
index 0000000000..e3b4249a69<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/openssl/openssl/openssl_pkg-config_libdir.p=
atch<br>
@@ -0,0 +1,31 @@<br>
+openssl: fix pkg-config file libdir from /usr back to /usr/lib<br>
+<br>
+openssl update from 3.2.1 to 3.3.0 changed pkg-config generators<br>
+and libdir changed from /usr/lib to /lib. This breaks builds<br>
+of recipes which use openssl pkg-config files for library install<br>
+etc paths. For example meta-security tpm2-openssl fails to build:<br>
+<br>
+ERROR: mc:trs-qemuarm64:tpm2-openssl-1.1.1-r0 do_package: QA Issue: tpm2-o=
penssl: Files/directories were installed but not shipped in any package:<br=
>
+=C2=A0 /usr/ossl-modules/tpm2.so<br>
+<br>
+Affected pkg-config files are: libssl.pc, openssl.pc and libcrypto.pc<br>
+<br>
+Fix this by hard coding LIBDIR variable to &quot;lib&quot;. Prefix should<=
br>
+be correctly used as before.<br>
+<br>
+Upstream-Status: Inappropriate [configuration change]<br>
+<br>
+Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org"=
 target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
+<br>
+--- a/exporters/<a href=3D"http://build.info" rel=3D"noreferrer" target=3D=
"_blank">build.info</a><br>
++++ b/exporters/<a href=3D"http://build.info" rel=3D"noreferrer" target=3D=
"_blank">build.info</a><br>
+@@ -19,7 +19,7 @@ DEPEND[openssl.pc]=3Dlibcrypto.pc libssl.pc<br>
+ DEPEND[&quot;&quot;]=3Dopenssl.pc<br>
+ <br>
+ GENERATE[../<a href=3D"http://installdata.pm" rel=3D"noreferrer" target=
=3D"_blank">installdata.pm</a>]=3D../util/<a href=3D"http://mkinstallvars.p=
l" rel=3D"noreferrer" target=3D"_blank">mkinstallvars.pl</a> \<br>
+-=C2=A0 =C2=A0 &quot;PREFIX=3D$(INSTALLTOP)&quot; BINDIR=3Dbin &quot;LIBDI=
R=3D$(LIBDIR)&quot; \<br>
++=C2=A0 =C2=A0 &quot;PREFIX=3D$(INSTALLTOP)&quot; BINDIR=3Dbin LIBDIR=3Dli=
b \<br>
+=C2=A0 =C2=A0 =C2=A0INCLUDEDIR=3Dinclude APPLINKDIR=3Dinclude/openssl \<br=
>
+=C2=A0 =C2=A0 =C2=A0&quot;ENGINESDIR=3D$(ENGINESDIR)&quot; &quot;MODULESDI=
R=3D$(MODULESDIR)&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0&quot;PKGCONFIGDIR=3D$(PKGCONFIGDIR)&quot; &quot;CMAKE=
CONFIGDIR=3D$(CMAKECONFIGDIR)&quot; \<br>
+<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.3.0.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.3.0.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.3.0.bb</a><br>
index 2cdaf4c75d..5ee8375ebc 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.3.0.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.3.0.bb</a><br>
@@ -13,6 +13,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.openssl.org/sourc=
e/openssl-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://www=
.openssl.org/source/openssl-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Configure-do-not-twea=
k-mips-cflags.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Added-handshake-histo=
ry-reporting-when-test-fails.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bti.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://openssl_pkg-config_libdir.=
patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI:append:class-nativesdk =3D &quot; \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#198969): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/198969" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/198969</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105885236/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105885236/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000652a606178a3eec--

