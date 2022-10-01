Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29B3C433F5
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 12:42:38 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.5531.1664628153876553968
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 05:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dmoggAR2;
 spf=pass (domain: gmail.com, ip: 209.85.166.169,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id q11so2894717ilj.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=H16ptcWxt6Kr2lCj0U2jMzhj7wZIRmR7wE+cm44lBTQ=;
        b=dmoggAR2H1zKBSJOmsvzti5mdYM5Ansb98g4GN55fgqhDx6h9iHJB5+fPeECh+sTUS
         tShvICOB3hmwtK0LBpvZRjsUuJp3asoyhX19PG+3+eyAyKIm63acl8hLDpzwS+oInZsA
         Uo7OYaAOOPT6x2MXNgGHrRHRG42DcY1zyA77ETO2wzW01Mdskb1lbWEkcAeNs5JCxgLS
         uZSidk8G6DFNd3lsI52/CMqMMGfoTaXkclTUPgmsohEKmrPJ0kO3Y9511Xe5Zpkxn1kU
         WL/wlDKQ3bLMD3zAG5HFjhsP5gEO9756IRkPL/Y9s8b2yceCGtb0mcFhcruasPIUMAxB
         om8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=H16ptcWxt6Kr2lCj0U2jMzhj7wZIRmR7wE+cm44lBTQ=;
        b=pjqZgXGYtLSC59AfORmQeDo6cJ1wX3F0/dNix784MKpbmSHWzdPgkJf2gCHdQvh5XP
         ej7dJ1lRHzKieeMzbMidf9RJ09nrA4FVYlx+qOCDN9gj+q7urnB2VKQ/I/MSFO59px+o
         qK2NEvlTsQ3fX5BBzwilnudqFPpcRXXKaybVHTktiemK3ifueDKBygtZUbKzZOXPGTCk
         Bv8/YTEOLXntF2e1zl7ncoYJ7FkrHBDD0S4UbTDw8tZsrZJv0Xgcio5jeQMfqnYRYV/r
         w02x+cLuTq2PQYrO6u8csR4h+R0zlkUNIJJriEzg6faGr/2cElVwZXZAeh9DlWVIYlKQ
         9tdA==
X-Gm-Message-State: ACrzQf18vnI2oGKsNmwBp05sHbdPsZlgnjZeji7Lxo6wGdw24L9WwlUm
	Rtg5TnBrHZAiYUpNPW3RvL4b1N+evmOAZOHZemI=
X-Google-Smtp-Source: 
 AMsMyM4VR53tlOEXvi/p36m0eRnuZivxwknJwlUgFS/jTGdHGOEwwCRRnfKwpoGJJxXm9nH8DDlN5gjUn2kZs7YI7XU=
X-Received: by 2002:a05:6e02:17cb:b0:2f9:1fb4:ba3b with SMTP id
 z11-20020a056e0217cb00b002f91fb4ba3bmr5939042ilu.257.1664628153027; Sat, 01
 Oct 2022 05:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220930175520.2850089-1-alex@linutronix.de>
 <20220930175520.2850089-2-alex@linutronix.de>
 <84cfc21230054a3cabc3c6f531f11786@axis.com>
In-Reply-To: <84cfc21230054a3cabc3c6f531f11786@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 1 Oct 2022 14:42:22 +0200
Message-ID: 
 <CANNYZj9zjBdiNY7nYbwzoybwd_qTVkp7czmOv1Ww-syYX0Dj-w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] python3-bcrypt: update 3.2.2 -> 4.0.0
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000be91c805e9f8718c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 12:42:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171251

--000000000000be91c805e9f8718c
Content-Type: text/plain; charset="UTF-8"

Any breakage would quickly be exposed in do_compile as cargo will fail
against mismatching lock file. I usually do the opposite and remove version
numbers everywhere except .bb, as it tends to cause trouble with automated
updates.

Alex

On Sat 1. Oct 2022 at 14.05, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Alexander Kanavin
> > Sent: den 30 september 2022 19:55
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alexander Kanavin <alex@linutronix.de>
> > Subject: [OE-core] [RFC PATCH 2/2] python3-bcrypt: update 3.2.2 -> 4.0.0
> >
> > The component has been reimplemented in rust, and comes
> > with a large list of dependencies in Cargo.toml/Cargo.lock.
> >
> > Rather than list them by hand, use a file generated with
> > cargo-update-recipe-crates class.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../python/python3-bcrypt-crates.inc          | 53 +++++++++++++++++++
> >  ...crypt_3.2.2.bb => python3-bcrypt_4.0.0.bb} |  6 ++-
> >  2 files changed, 57 insertions(+), 2 deletions(-)
> >  create mode 100644
> meta/recipes-devtools/python/python3-bcrypt-crates.inc
> >  rename meta/recipes-devtools/python/{python3-bcrypt_3.2.2.bb =>
> python3-bcrypt_4.0.0.bb} (76%)
> >
> > diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
> b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
> > new file mode 100644
> > index 0000000000..78c5d5aa22
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
> > @@ -0,0 +1,53 @@
> > +# Autogenerated with 'bitbake -c update_crates python3-bcrypt'
> > +
> > +SRC_URI += " \
> > +        crate://crates.io/autocfg/1.1.0 \
> > +        crate://crates.io/base64/0.13.0 \
> > +        crate://crates.io/bcrypt/0.13.0 \
> > +        crate://crates.io/bcrypt-pbkdf/0.8.1 \
> > +        crate://crates.io/bitflags/1.3.2 \
> > +        crate://crates.io/block-buffer/0.10.2 \
> > +        crate://crates.io/blowfish/0.9.1 \
> > +        crate://crates.io/byteorder/1.4.3 \
> > +        crate://crates.io/cfg-if/1.0.0 \
> > +        crate://crates.io/cipher/0.4.3 \
> > +        crate://crates.io/cpufeatures/0.2.4 \
> > +        crate://crates.io/crypto-common/0.1.6 \
> > +        crate://crates.io/digest/0.10.3 \
> > +        crate://crates.io/generic-array/0.14.6 \
> > +        crate://crates.io/getrandom/0.2.7 \
> > +        crate://crates.io/indoc/0.3.6 \
> > +        crate://crates.io/indoc-impl/0.3.6 \
> > +        crate://crates.io/inout/0.1.3 \
> > +        crate://crates.io/instant/0.1.12 \
> > +        crate://crates.io/libc/0.2.132 \
> > +        crate://crates.io/lock_api/0.4.7 \
> > +        crate://crates.io/once_cell/1.13.1 \
> > +        crate://crates.io/parking_lot/0.11.2 \
> > +        crate://crates.io/parking_lot_core/0.8.5 \
> > +        crate://crates.io/paste/0.1.18 \
> > +        crate://crates.io/paste-impl/0.1.18 \
> > +        crate://crates.io/pbkdf2/0.10.1 \
> > +        crate://crates.io/proc-macro-hack/0.5.19 \
> > +        crate://crates.io/proc-macro2/1.0.43 \
> > +        crate://crates.io/pyo3/0.15.2 \
> > +        crate://crates.io/pyo3-build-config/0.15.2 \
> > +        crate://crates.io/pyo3-macros/0.15.2 \
> > +        crate://crates.io/pyo3-macros-backend/0.15.2 \
> > +        crate://crates.io/quote/1.0.21 \
> > +        crate://crates.io/redox_syscall/0.2.16 \
> > +        crate://crates.io/scopeguard/1.1.0 \
> > +        crate://crates.io/sha2/0.10.2 \
> > +        crate://crates.io/smallvec/1.9.0 \
> > +        crate://crates.io/subtle/2.4.1 \
> > +        crate://crates.io/syn/1.0.99 \
> > +        crate://crates.io/typenum/1.15.0 \
> > +        crate://crates.io/unicode-ident/1.0.3 \
> > +        crate://crates.io/unindent/0.1.10 \
> > +        crate://crates.io/version_check/0.9.4 \
> > +        crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > +        crate://crates.io/winapi/0.3.9 \
> > +        crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +        crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +        crate://crates.io/zeroize/1.5.7 \
> > +"
> > diff --git a/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
> b/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
> > similarity index 76%
> > rename from meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
> > rename to meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
> > index 54070e4b9c..857b38df2c 100644
> > --- a/meta/recipes-devtools/python/python3-bcrypt_3.2.2.bb
> > +++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.0.bb
> > @@ -5,14 +5,16 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
> >
> >  DEPENDS += "${PYTHON_PN}-cffi-native"
> >
> > -SRC_URI[sha256sum] =
> "433c410c2177057705da2a9f2cd01dd157493b2a7ac14c8593a16b3dab6b6bfb"
> > +SRC_URI[sha256sum] =
> "c59c170fc9225faad04dde1ba61d85b413946e8ce2e5f5f5ff30dfd67283f319"
> >
> > -inherit pypi python_setuptools_build_meta ptest
> > +inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates
> >
> >  SRC_URI += " \
> >       file://run-ptest \
> >  "
> >
> > +require ${BPN}-crates.inc
>
> Would it make sense to instead use:
>
> require ${BP}-crates.inc
>
> i.e., make the crates.inc file versioned? That would help to make sure one
> does not forget to update the versions of the crates when the version of
> the recipe is updated. (My assumption is that with the huge lists of
> crates
> for a typical rust application, there will most likely always be updates
> to
> them when the application is updated.)
>
> > +
> >  RDEPENDS:${PN}-ptest += " \
> >       ${PYTHON_PN}-pytest \
> >  "
> > --
> > 2.30.2
>
> //Peter
>
>

--000000000000be91c805e9f8718c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Any breakage would quickly be exposed in do_compile as ca=
rgo will fail against mismatching lock file. I usually do the opposite and =
remove version numbers everywhere except .bb, as it tends to cause trouble =
with automated updates.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat 1. Oct 2022 at 14.05, Peter Kjellerstedt &lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin<br>
&gt; Sent: den 30 september 2022 19:55<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=
=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; Subject: [OE-core] [RFC PATCH 2/2] python3-bcrypt: update 3.2.2 -&gt; =
4.0.0<br>
&gt; <br>
&gt; The component has been reimplemented in rust, and comes<br>
&gt; with a large list of dependencies in Cargo.toml/Cargo.lock.<br>
&gt; <br>
&gt; Rather than list them by hand, use a file generated with<br>
&gt; cargo-update-recipe-crates class.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../python/python3-bcrypt-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 53 +++++++++++++++++++<br>
&gt;=C2=A0 ...<a href=3D"http://crypt_3.2.2.bb" rel=3D"noreferrer" target=
=3D"_blank">crypt_3.2.2.bb</a> =3D&gt; <a href=3D"http://python3-bcrypt_4.0=
.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_4.0.0.bb</a>} |=
=C2=A0 6 ++-<br>
&gt;=C2=A0 2 files changed, 57 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/python3-bcrypt-c=
rates.inc<br>
&gt;=C2=A0 rename meta/recipes-devtools/python/{<a href=3D"http://python3-b=
crypt_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_3.2.2.b=
b</a> =3D&gt; <a href=3D"http://python3-bcrypt_4.0.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-bcrypt_4.0.0.bb</a>} (76%)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/=
meta/recipes-devtools/python/python3-bcrypt-crates.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..78c5d5aa22<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc<br>
&gt; @@ -0,0 +1,53 @@<br>
&gt; +# Autogenerated with &#39;bitbake -c update_crates python3-bcrypt&#39=
;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autoc=
fg/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/base6=
4/0.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/base64/0.13.0</a> =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bcryp=
t/0.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bcrypt/0.13.0</a> =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bcryp=
t-pbkdf/0.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/bcrypt-pbkdf/=
0.8.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitfl=
ags/1.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/block=
-buffer/0.10.2" rel=3D"noreferrer" target=3D"_blank">crates.io/block-buffer=
/0.10.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/blowf=
ish/0.9.1" rel=3D"noreferrer" target=3D"_blank">crates.io/blowfish/0.9.1</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteo=
rder/1.4.3" rel=3D"noreferrer" target=3D"_blank">crates.io/byteorder/1.4.3<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-i=
f/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciphe=
r/0.4.3" rel=3D"noreferrer" target=3D"_blank">crates.io/cipher/0.4.3</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cpufe=
atures/0.2.4" rel=3D"noreferrer" target=3D"_blank">crates.io/cpufeatures/0.=
2.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crypt=
o-common/0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crypto-commo=
n/0.1.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/diges=
t/0.10.3" rel=3D"noreferrer" target=3D"_blank">crates.io/digest/0.10.3</a> =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/gener=
ic-array/0.14.6" rel=3D"noreferrer" target=3D"_blank">crates.io/generic-arr=
ay/0.14.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getra=
ndom/0.2.7" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.2.7<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc=
/0.3.6" rel=3D"noreferrer" target=3D"_blank">crates.io/indoc/0.3.6</a> \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indoc=
-impl/0.3.6" rel=3D"noreferrer" target=3D"_blank">crates.io/indoc-impl/0.3.=
6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/inout=
/0.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/inout/0.1.3</a> \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/insta=
nt/0.1.12" rel=3D"noreferrer" target=3D"_blank">crates.io/instant/0.1.12</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/=
0.2.132" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.132</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lock_=
api/0.4.7" rel=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.4.7</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_=
cell/1.13.1" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.13.=
1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parki=
ng_lot/0.11.2" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lot/0=
.11.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/parki=
ng_lot_core/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_l=
ot_core/0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste=
/0.1.18" rel=3D"noreferrer" target=3D"_blank">crates.io/paste/0.1.18</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/paste=
-impl/0.1.18" rel=3D"noreferrer" target=3D"_blank">crates.io/paste-impl/0.1=
.18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pbkdf=
2/0.10.1" rel=3D"noreferrer" target=3D"_blank">crates.io/pbkdf2/0.10.1</a> =
\<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-=
macro-hack/0.5.19" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macr=
o-hack/0.5.19</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-=
macro2/1.0.43" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macro2/1=
.0.43</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3/=
0.15.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3/0.15.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-=
build-config/0.15.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-bu=
ild-config/0.15.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-=
macros/0.15.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-macros/0=
.15.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pyo3-=
macros-backend/0.15.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pyo3-=
macros-backend/0.15.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote=
/1.0.21" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/1.0.21</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/redox=
_syscall/0.2.16" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_sysca=
ll/0.2.16</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scope=
guard/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.=
0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/sha2/=
0.10.2" rel=3D"noreferrer" target=3D"_blank">crates.io/sha2/0.10.2</a> \<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/small=
vec/1.9.0" rel=3D"noreferrer" target=3D"_blank">crates.io/smallvec/1.9.0</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/subtl=
e/2.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/subtle/2.4.1</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1=
.0.99" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/1.0.99</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/typen=
um/1.15.0" rel=3D"noreferrer" target=3D"_blank">crates.io/typenum/1.15.0</a=
> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unico=
de-ident/1.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-iden=
t/1.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unind=
ent/0.1.10" rel=3D"noreferrer" target=3D"_blank">crates.io/unindent/0.1.10<=
/a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/versi=
on_check/0.9.4" rel=3D"noreferrer" target=3D"_blank">crates.io/version_chec=
k/0.9.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/=
0.11.0+wasi-snapshot-preview1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/wasi/0.11.0+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winap=
i/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winap=
i-i686-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/winapi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winap=
i-x86_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zeroi=
ze/1.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/zeroize/1.5.7</a> =
\<br>
&gt; +&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-bc=
rypt_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_3.2.2.bb=
</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-bcrypt_4.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_4.0.0.bb</a><br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-devtools/python/<a href=3D"http://python3-bcr=
ypt_3.2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_3.2.2.bb<=
/a><br>
&gt; rename to meta/recipes-devtools/python/<a href=3D"http://python3-bcryp=
t_4.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_4.0.0.bb</a=
><br>
&gt; index 54070e4b9c..857b38df2c 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-bcrypt_3.=
2.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_3.2.2.bb</a><br=
>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-bcrypt_4.=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_4.0.0.bb</a><br=
>
&gt; @@ -5,14 +5,16 @@ HOMEPAGE =3D &quot;<a href=3D"https://pypi.org/proje=
ct/bcrypt/" rel=3D"noreferrer" target=3D"_blank">https://pypi.org/project/b=
crypt/</a>&quot;<br>
&gt; <br>
&gt;=C2=A0 DEPENDS +=3D &quot;${PYTHON_PN}-cffi-native&quot;<br>
&gt; <br>
&gt; -SRC_URI[sha256sum] =3D &quot;433c410c2177057705da2a9f2cd01dd157493b2a=
7ac14c8593a16b3dab6b6bfb&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c59c170fc9225faad04dde1ba61d85b413946e8c=
e2e5f5f5ff30dfd67283f319&quot;<br>
&gt; <br>
&gt; -inherit pypi python_setuptools_build_meta ptest<br>
&gt; +inherit pypi python_setuptools3_rust ptest cargo-update-recipe-crates=
<br>
&gt; <br>
&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
&gt;=C2=A0 &quot;<br>
&gt; <br>
&gt; +require ${BPN}-crates.inc<br>
<br>
Would it make sense to instead use:<br>
<br>
require ${BP}-crates.inc<br>
<br>
i.e., make the crates.inc file versioned? That would help to make sure one =
<br>
does not forget to update the versions of the crates when the version of <b=
r>
the recipe is updated. (My assumption is that with the huge lists of crates=
 <br>
for a typical rust application, there will most likely always be updates to=
 <br>
them when the application is updated.)<br>
<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-pytest \<br>
&gt;=C2=A0 &quot;<br>
&gt; --<br>
&gt; 2.30.2<br>
<br>
//Peter<br>
<br>
</blockquote></div></div>

--000000000000be91c805e9f8718c--

