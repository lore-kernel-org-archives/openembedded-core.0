Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD30C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 19:26:37 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.2659.1643311595518158744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:26:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iAYmw2Ls;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id k25so8160753ejp.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 11:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uGQgrm7jBU3gRnkjY6n/xxjbk0A1Vixr4ts+/7san50=;
        b=iAYmw2LszkOiFyOBGaDNfwI4zcBTRnPivx2RyHE6fCEfG9Pvh/c57r9qjfCKDzUN/3
         bigoRFlPsaCT8wr23y/9UgjhHcSd5c/bjY1oD3vou4stJXij6bi/5Bws1M2mXHyfB49H
         6xgPOuBO35YBdfXu+yFa95yRzcjwoLZ1N96uw3LNS4XnV85NE+FunlMdTTHJXJxR63xM
         AGlItHkcuoS5BJKIdyACZGlQbOv9jtWG4WHdVqd1BEgGMa5MboCmodYX9sz0hVwT8+na
         DWRg/Xr/U9WvFfa2Caq+tqOu1cZRVWt8Bq/FKN/4ZsrIh8mZ7QA+8qZo/AQWIsN0Vurh
         53iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uGQgrm7jBU3gRnkjY6n/xxjbk0A1Vixr4ts+/7san50=;
        b=MDM9m+O1NkZMrP/5jiBsg7QZdOVbHhWNMvF+vUBuH8d4NBCl1UYRWqFvxrZfYGlXjo
         zQpm6wNpfbgjrmLW+9FkjPsf6bTJjw23TaGHj7En8+uUFmfV9Rnzbk/6Bbmbf7rIImY3
         nfRF6LFO9K5iyBLK6giuwMFOdSKfCL/aBCzbnaqegu3DuMFrcVtsz3wG6sK1Gk8Eqo3C
         qFgM4BlUCp34he6Gh45VSpIliYYMksSSt9fMswLO48PwIrmnAfuzpyDUd+BGAwfahQZm
         4CTq2CwU3pLn1T9lsdnkTRhjCSPrTB+SNvyMBDfCox2uPumq5rQ9d7t+p2TbvWwRCXsh
         PErQ==
X-Gm-Message-State: AOAM5319uhbEIo4RHcmZjND7aiGufQ6pQz7ZOy7+sYKgw/M42Amk9MMO
	pR5kLE3HSVYfNiyhnEJapifnMkdmxdwH7ng4DoE=
X-Google-Smtp-Source: 
 ABdhPJyqJHEqbqGfiarYrnpkrOM+RJ5dzNznpx+jq/mGTwn/AQs+sUf4Y+vo4ThEs9XshDmm0sppGXEQQ+ZZtNYUS3w=
X-Received: by 2002:a17:907:a42a:: with SMTP id
 sg42mr4081753ejc.227.1643311593863;
 Thu, 27 Jan 2022 11:26:33 -0800 (PST)
MIME-Version: 1.0
References: <20220127102005.3050843-1-alex@linutronix.de>
 <20220127102005.3050843-17-alex@linutronix.de>
 <CAMKF1soS8r7zEf7MVMwJ_QBd8jEYDg_kBvAVy61CTNwGuWHiUQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soS8r7zEf7MVMwJ_QBd8jEYDg_kBvAVy61CTNwGuWHiUQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 27 Jan 2022 20:26:22 +0100
Message-ID: 
 <CANNYZj8sVjVt6V4Bss8RQUK5toMo_c02f1iipnP=K+b_ez==LQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/17] gobject-introspection: replace
 prelink-rtld with objdump -p
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000cec04505d6954b58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 19:26:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161051

--000000000000cec04505d6954b58
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Jan 2022 at 19:09, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Jan 27, 2022 at 2:21 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > g-i internally processes the output with regexes, and seems
> > happy with what objdump is printing. It only needs to resolve
> > the library name as passed to the linker to the library file name.
> > Also recursive resolution (that ldd is doing and objdump is not)
> > is not necessary.
> >
>
> thanks for doing this, it further unbolts prelink from core metaddata.
> Objdump -p is good, does it use it from binutils-cross ?
>

$OBJDUMP is set to the executable from there, yes.

Alex



>
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/classes/gobject-introspection.bbclass    |  2 +-
> >  ...-error-return-codes-from-ldd-wrapper.patch | 28 -------------------
> >  .../gobject-introspection_1.70.0.bb           | 14 ++--------
> >  3 files changed, 3 insertions(+), 41 deletions(-)
> >  delete mode 100644
> meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> >
> > diff --git a/meta/classes/gobject-introspection.bbclass
> b/meta/classes/gobject-introspection.bbclass
> > index 4db1b362d9..7bf9feb0d6 100644
> > --- a/meta/classes/gobject-introspection.bbclass
> > +++ b/meta/classes/gobject-introspection.bbclass
> > @@ -29,7 +29,7 @@ EXTRA_OEMESON:prepend:class-nativesdk = "${@['',
> '${GIRMESONBUILD}'][d.getVar('G
> >
> >  # Generating introspection data depends on a combination of native and
> target
> >  # introspection tools, and qemu to run the target tools.
> > -DEPENDS:append:class-target = " gobject-introspection
> gobject-introspection-native qemu-native prelink-native"
> > +DEPENDS:append:class-target = " gobject-introspection
> gobject-introspection-native qemu-native"
> >
> >  # Even though introspection is disabled on -native,
> gobject-introspection package is still
> >  # needed for m4 macros.
> > diff --git
> a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> > deleted file mode 100644
> > index b484b5e9e6..0000000000
> > ---
> a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> > +++ /dev/null
> > @@ -1,28 +0,0 @@
> > -From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Wed, 5 Sep 2018 16:46:52 +0200
> > -Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
> > -
> > -prelink-rtld, which we use instead of ldd returns 127 when it can't
> find a library.
> > -It is not an error per se, but it breaks subprocess.check_output().
> > -
> > -Upstream-Status: Inappropriate [oe-core specific]
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > -
> > ----
> > - giscanner/shlibs.py | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> > -index d67df95..80352a6 100644
> > ---- a/giscanner/shlibs.py
> > -+++ b/giscanner/shlibs.py
> > -@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary,
> libraries):
> > -             args.extend(['otool', '-L', binary.args[0]])
> > -         else:
> > -             args.extend(['ldd', binary.args[0]])
> > --        output = subprocess.check_output(args)
> > -+        output = subprocess.run(args, check=False,
> stdout=subprocess.PIPE).stdout
> > -         if isinstance(output, bytes):
> > -             output = output.decode("utf-8", "replace")
> > -
> > diff --git a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.70.0.bb
> b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.70.0.bb
> > index d4ee03d33c..4f72a33bfa 100644
> > --- a/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.70.0.bb
> > +++ b/meta/recipes-gnome/gobject-introspection/
> gobject-introspection_1.70.0.bb
> > @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=c434e8128a68bedd59b80b2ac1eb1c4a \
> >                      "
> >
> >  SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}",
> 2)}/${BPN}-${PV}.tar.xz \
> > -
>  file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
> >             file://0001-build-Avoid-the-doctemplates-hack.patch \
> >             "
> >
> > @@ -33,9 +32,7 @@ DEPENDS += " libffi zlib glib-2.0 python3 flex-native
> bison-native autoconf-arch
> >  # target build needs qemu to run temporary introspection binaries
> created
> >  # on the fly by g-ir-scanner and a native version of itself to run
> >  # native versions of its own tools during build.
> > -# Also prelink-rtld is used to find out library dependencies of
> introspection binaries
> > -# (standard ldd doesn't work when cross-compiling).
> > -DEPENDS:append:class-target = " gobject-introspection-native
> qemu-native prelink-native"
> > +DEPENDS:append:class-target = " gobject-introspection-native
> qemu-native"
> >
> >  # needed for writing out the qemu wrapper script
> >  export STAGING_DIR_HOST
> > @@ -55,13 +52,6 @@ EXTRA_OEMESON:class-target = " \
> >      ${@'-Dgir_dir_prefix=${libdir}' if d.getVar('MULTILIBS') else ''} \
> >  "
> >
> > -# Need to ensure ld.so.conf exists so prelink-native works
> > -# both before we build and if we install from sstate
> > -do_configure[prefuncs] += "gobject_introspection_preconfigure"
> > -python gobject_introspection_preconfigure () {
> > -    oe.utils.write_ld_so_conf(d)
> > -}
> > -
> >  do_configure:prepend:class-native() {
> >          # Tweak the native python scripts so that they don't refer to
> the
> >          # full path of native python binary (the solution is taken from
> glib-2.0 recipe)
> > @@ -113,7 +103,7 @@ EOF
> >          # for a different architecture
> >          cat > ${B}/g-ir-scanner-lddwrapper << EOF
> >  #!/bin/sh
> > -prelink-rtld --root=$STAGING_DIR_HOST "\$@"
> > +$OBJDUMP -p "\$@"
> >  EOF
> >          chmod +x ${B}/g-ir-scanner-lddwrapper
> >
> > --
> > 2.20.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#161039):
> https://lists.openembedded.org/g/openembedded-core/message/161039
> > Mute This Topic: https://lists.openembedded.org/mt/88718372/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000cec04505d6954b58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 27 Jan 2022 at 19:09, Khem Ra=
j &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 2=
7, 2022 at 2:21 AM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; g-i internally processes the output with regexes, and seems<br>
&gt; happy with what objdump is printing. It only needs to resolve<br>
&gt; the library name as passed to the linker to the library file name.<br>
&gt; Also recursive resolution (that ldd is doing and objdump is not)<br>
&gt; is not necessary.<br>
&gt;<br>
<br>
thanks for doing this, it further unbolts prelink from core metaddata.<br>
Objdump -p is good, does it use it from binutils-cross ?<br></blockquote><d=
iv><br></div><div>$OBJDUMP is set to the executable from there, yes.</div><=
div><br></div><div>Alex<br></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/gobject-introspection.bbclass=C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
&gt;=C2=A0 ...-error-return-codes-from-ldd-wrapper.patch | 28 -------------=
------<br>
&gt;=C2=A0 .../<a href=3D"http://gobject-introspection_1.70.0.bb" rel=3D"no=
referrer" target=3D"_blank">gobject-introspection_1.70.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++--------<br>
&gt;=C2=A0 3 files changed, 3 insertions(+), 41 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobj=
ect-introspection/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper=
.patch<br>
&gt;<br>
&gt; diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes=
/gobject-introspection.bbclass<br>
&gt; index 4db1b362d9..7bf9feb0d6 100644<br>
&gt; --- a/meta/classes/gobject-introspection.bbclass<br>
&gt; +++ b/meta/classes/gobject-introspection.bbclass<br>
&gt; @@ -29,7 +29,7 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D &quot;${@[=
&#39;&#39;, &#39;${GIRMESONBUILD}&#39;][d.getVar(&#39;G<br>
&gt;<br>
&gt;=C2=A0 # Generating introspection data depends on a combination of nati=
ve and target<br>
&gt;=C2=A0 # introspection tools, and qemu to run the target tools.<br>
&gt; -DEPENDS:append:class-target =3D &quot; gobject-introspection gobject-=
introspection-native qemu-native prelink-native&quot;<br>
&gt; +DEPENDS:append:class-target =3D &quot; gobject-introspection gobject-=
introspection-native qemu-native&quot;<br>
&gt;<br>
&gt;=C2=A0 # Even though introspection is disabled on -native, gobject-intr=
ospection package is still<br>
&gt;=C2=A0 # needed for m4 macros.<br>
&gt; diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspe=
ction/0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/met=
a/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-=
ignore-error-return-codes-from-ldd-wrapper.patch<br>
&gt; deleted file mode 100644<br>
&gt; index b484b5e9e6..0000000000<br>
&gt; --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0=
001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,28 +0,0 @@<br>
&gt; -From f742da8b3913f4818d3f419117076afe62f4dbf4 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com"=
 target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -Date: Wed, 5 Sep 2018 16:46:52 +0200<br>
&gt; -Subject: [PATCH] giscanner: ignore error return codes from ldd-wrappe=
r<br>
&gt; -<br>
&gt; -prelink-rtld, which we use instead of ldd returns 127 when it can&#39=
;t find a library.<br>
&gt; -It is not an error per se, but it breaks subprocess.check_output().<b=
r>
&gt; -<br>
&gt; -Upstream-Status: Inappropriate [oe-core specific]<br>
&gt; -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@g=
mail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; -<br>
&gt; ----<br>
&gt; - giscanner/shlibs.py | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; -<br>
&gt; -diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py<br>
&gt; -index d67df95..80352a6 100644<br>
&gt; ---- a/giscanner/shlibs.py<br>
&gt; -+++ b/giscanner/shlibs.py<br>
&gt; -@@ -102,7 +102,7 @@ def _resolve_non_libtool(options, binary, librari=
es):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.extend([&#39;oto=
ol&#39;, &#39;-L&#39;, binary.args[0]])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args.extend([&#39;ldd=
&#39;, binary.args[0]])<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.check_output(args)=
<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 output =3D subprocess.run(args, check=3D=
False, stdout=3Dsubprocess.PIPE).stdout<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if isinstance(output, bytes):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0output =3D output.dec=
ode(&quot;utf-8&quot;, &quot;replace&quot;)<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-gnome/gobject-introspection/<a href=3D"http:=
//gobject-introspection_1.70.0.bb" rel=3D"noreferrer" target=3D"_blank">gob=
ject-introspection_1.70.0.bb</a> b/meta/recipes-gnome/gobject-introspection=
/<a href=3D"http://gobject-introspection_1.70.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">gobject-introspection_1.70.0.bb</a><br>
&gt; index d4ee03d33c..4f72a33bfa 100644<br>
&gt; --- a/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobje=
ct-introspection_1.70.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-in=
trospection_1.70.0.bb</a><br>
&gt; +++ b/meta/recipes-gnome/gobject-introspection/<a href=3D"http://gobje=
ct-introspection_1.70.0.bb" rel=3D"noreferrer" target=3D"_blank">gobject-in=
trospection_1.70.0.bb</a><br>
&gt; @@ -14,7 +14,6 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dc434=
e8128a68bedd59b80b2ac1eb1c4a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_versio=
n(&quot;${PV}&quot;, 2)}/${BPN}-${PV}.tar.xz \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-giscanner-ignore=
-error-return-codes-from-ldd-wrapper.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-build-Avoid=
-the-doctemplates-hack.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt; @@ -33,9 +32,7 @@ DEPENDS +=3D &quot; libffi zlib glib-2.0 python3 fle=
x-native bison-native autoconf-arch<br>
&gt;=C2=A0 # target build needs qemu to run temporary introspection binarie=
s created<br>
&gt;=C2=A0 # on the fly by g-ir-scanner and a native version of itself to r=
un<br>
&gt;=C2=A0 # native versions of its own tools during build.<br>
&gt; -# Also prelink-rtld is used to find out library dependencies of intro=
spection binaries<br>
&gt; -# (standard ldd doesn&#39;t work when cross-compiling).<br>
&gt; -DEPENDS:append:class-target =3D &quot; gobject-introspection-native q=
emu-native prelink-native&quot;<br>
&gt; +DEPENDS:append:class-target =3D &quot; gobject-introspection-native q=
emu-native&quot;<br>
&gt;<br>
&gt;=C2=A0 # needed for writing out the qemu wrapper script<br>
&gt;=C2=A0 export STAGING_DIR_HOST<br>
&gt; @@ -55,13 +52,6 @@ EXTRA_OEMESON:class-target =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ${@&#39;-Dgir_dir_prefix=3D${libdir}&#39; if d.get=
Var(&#39;MULTILIBS&#39;) else &#39;&#39;} \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; -# Need to ensure ld.so.conf exists so prelink-native works<br>
&gt; -# both before we build and if we install from sstate<br>
&gt; -do_configure[prefuncs] +=3D &quot;gobject_introspection_preconfigure&=
quot;<br>
&gt; -python gobject_introspection_preconfigure () {<br>
&gt; -=C2=A0 =C2=A0 oe.utils.write_ld_so_conf(d)<br>
&gt; -}<br>
&gt; -<br>
&gt;=C2=A0 do_configure:prepend:class-native() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Tweak the native python scripts so=
 that they don&#39;t refer to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # full path of native python binary =
(the solution is taken from glib-2.0 recipe)<br>
&gt; @@ -113,7 +103,7 @@ EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # for a different architecture<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cat &gt; ${B}/g-ir-scanner-lddwrappe=
r &lt;&lt; EOF<br>
&gt;=C2=A0 #!/bin/sh<br>
&gt; -prelink-rtld --root=3D$STAGING_DIR_HOST &quot;\$@&quot;<br>
&gt; +$OBJDUMP -p &quot;\$@&quot;<br>
&gt;=C2=A0 EOF<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x ${B}/g-ir-scanner-lddwrappe=
r<br>
&gt;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#161039): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/161039" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/161039</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88718372=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88718372/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000cec04505d6954b58--

