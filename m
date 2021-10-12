Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77BA1C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 10:49:45 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web09.12066.1634035783164731902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eZUyqClu;
 spf=pass (domain: gmail.com, ip: 209.85.221.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f180.google.com with SMTP id f126so9162465vke.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jKRq5f/1NiAy8OSku1vWOMvkmZZydm59NoygP1MTHOY=;
        b=eZUyqClur/BR9GMheayd0/PYwlqyk9zCQLboZzJNf+z/24JNUr1BeqMGZcXfY6gdon
         uvsWachoE6K6QqDI2+ESmKMpUeZOSTNHklWWhtXKDHpgpeQurwZZ6jSUQfG5A2s/k80l
         CfSbmyT8jhqYMZ2szKWOy84cOS58ad4piXtQpN4lkj1VaOe6bCz0QXvX5vbAtT1yD4Dk
         oUcfjOG3gJakOoRRwK6vbuOGNdB0PdMPOPf5YSd8eLFfkQh8Q9muF+lCxdqxEAo7vM+M
         8IXvSCxbcpYENi+o70CqLWubFfOyPtV09guyxwYjP1+xKyWBE5DMzVoo9J2B5GzWC1ql
         ybOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jKRq5f/1NiAy8OSku1vWOMvkmZZydm59NoygP1MTHOY=;
        b=DwS2udzm2ITzq04nMu2FVWoIzGXvZvg43cpzmBKVz1eWqXHLi8wC0J5InU1dkk1WGN
         C5WkOmkK7NKtIWGHXFDhpVvdE4FH9p+ZmR7+9VbP16Wbsp0sCsELcuDGWxpLmFphkqQW
         1KJm0MRZ44680Oj0UdfM+Fsl7lLEEedL7UUkoo5QL7Atra42UU/CQW+OtbrWOgaVMtSv
         TjUBe6VYJvl66yzBzVqHmeKcZ9MTI9w9oOrDL+PpNKzXFzsVuLD2Nvz7mDQOhDsa2bPI
         uRB7tAFneRDLmbS/hTZOu4eoU68zzLuj8VDjUIB4Nsm5S8kH3F0IRMCDIbaTZNN8zg/o
         y3vA==
X-Gm-Message-State: AOAM530nHJ3lILTTyFSUDCmJ5ojNWtkSn5mib7i3GvWDHnSRyyL+DKKO
	ut3Wn2TbXCns+dTi/KuL6A7kEY1EXqaR//JTyOY=
X-Google-Smtp-Source: 
 ABdhPJxa36W7/5FXPDy3RrkZUXQiIg63r3BQI2yEQl+M8hO3J1W2horVu+PDgwVChi+HpymNaVp85kgUx8Q2xwUNIps=
X-Received: by 2002:a1f:1c56:: with SMTP id c83mr6242263vkc.6.1634035782106;
 Tue, 12 Oct 2021 03:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211012101233.49978-1-randy.li@synaptics.com>
 <20211012101233.49978-3-randy.li@synaptics.com>
In-Reply-To: <20211012101233.49978-3-randy.li@synaptics.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Oct 2021 12:49:30 +0200
Message-ID: 
 <CANNYZj9wu6gCuU5_4AU6ancy=i1sjwvtwLz9YLE87gmB9QkSFA@mail.gmail.com>
Subject: Re: [PATCH 2/2] [WIP]: meson: install native file in sdk
To: Hsia-Jun Li <randy.li@synaptics.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000057c26f05ce259abe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 10:49:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156871

--00000000000057c26f05ce259abe
Content-Type: text/plain; charset="UTF-8"

Can you add a nativesdk testcase for this please? Into
meta/lib/oeqa/sdk/cases/.

Alex

On Tue, 12 Oct 2021 at 12:13, Hsia-Jun Li <randy.li@synaptics.com> wrote:

> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>
> Without a native environment file, find_program() can't
> locate the native program inside SDK.
>
> That stops wayland compositor using wayland scanner.
>
> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
> ---
>  meta/classes/meson-routines.bbclass           |  4 ++
>  .../meson/meson/meson-setup.py                |  2 +
>  .../meson/meson/meson-wrapper                 |  1 +
>  .../meson/nativesdk-meson_0.59.1.bb           | 38 +++++++++++++++++++
>  4 files changed, 45 insertions(+)
>
> diff --git a/meta/classes/meson-routines.bbclass
> b/meta/classes/meson-routines.bbclass
> index be3aeedeba..a74a9916d8 100644
> --- a/meta/classes/meson-routines.bbclass
> +++ b/meta/classes/meson-routines.bbclass
> @@ -4,6 +4,10 @@ def meson_array(var, d):
>      items = d.getVar(var).split()
>      return repr(items[0] if len(items) == 1 else items)
>
> +def meson_list_str(var, d):
> +    items = d.getVar(var).split()
> +    return repr(items[0]) if len(items) == 1 else ', '.join(repr(s) for s
> in items)
> +
>  # Map our ARCH values to what Meson expects:
>  # http://mesonbuild.com/Reference-tables.html#cpu-families
>  def meson_cpu_family(var, d):
> diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py
> b/meta/recipes-devtools/meson/meson/meson-setup.py
> index 7ac4e3ad47..4a0a967fef 100755
> --- a/meta/recipes-devtools/meson/meson/meson-setup.py
> +++ b/meta/recipes-devtools/meson/meson/meson-setup.py
> @@ -27,6 +27,8 @@ except KeyError:
>
>  template_file = os.path.join(sysroot,
> 'usr/share/meson/meson.cross.template')
>  cross_file = os.path.join(sysroot, 'usr/share/meson/%smeson.cross' %
> os.environ["TARGET_PREFIX"])
> +native_template_file = os.path.join(sysroot,
> 'usr/share/meson/meson.native.template')
> +native_file = os.path.join(sysroot, 'usr/share/meson/meson.native')
>
>  with open(template_file) as in_file:
>      template = in_file.read()
> diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper
> b/meta/recipes-devtools/meson/meson/meson-wrapper
> index d4ffe60f9a..d4b5187f8d 100755
> --- a/meta/recipes-devtools/meson/meson/meson-wrapper
> +++ b/meta/recipes-devtools/meson/meson/meson-wrapper
> @@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP
>
>  exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
>       --cross-file
> "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
> +     --native-file
> "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
>       "$@"
> diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> index 5657397ddc..f537204a2d 100644
> --- a/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> +++ b/meta/recipes-devtools/meson/nativesdk-meson_0.59.1.bb
> @@ -15,6 +15,44 @@ SRC_URI += "file://meson-setup.py \
>  #   them.
>  do_install:append() {
>      install -d ${D}${datadir}/meson
> +
> +    cat >${D}${datadir}/meson/meson.native.template <<EOF
> +[binaries]
> +c = ${@meson_array('BUILD_CC', d)}
> +cpp = ${@meson_array('BUILD_CXX', d)}
> +ar = ${@meson_array('BUILD_AR', d)}
> +nm = ${@meson_array('BUILD_NM', d)}
> +strip = ${@meson_array('BUILD_STRIP', d)}
> +readelf = ${@meson_array('BUILD_READELF', d)}
> +pkgconfig = 'pkg-config-native'
> +
> +[built-in options]
> +c_args = ['-isystem' @OECORE_NATIVE_SYSROOT '${includedir_native}' ,
> ${@meson_list_str('BUILD_OPTIMIZATION', d)}]
> +c_link_args = ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
> +               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
> +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
> '${libdir_native}',
> +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
> '${base_libdir_native}',
> +               '-Wl,--allow-shlib-undefined',
> +               '-Wl,--dynamic-linker=' @OECORE_NATIVE_SYSROOT
> '${base_libdir_native}'
> +               '${@bb.utils.contains('BUILD_ARCH', 'x86_64',
> 'ld-linux-x86-64.so.2', '', d)}
> +                ${@bb.utils.contains('BUILD_ARCH', 'i686',
> 'ld-linux.so.2', '', d)}
> +                ${@bb.utils.contains('BUILD_ARCH', 'aarch64',
> 'ld-linux-aarch64.so.1', '', d)}'
> +]
> +cpp_args = ['-isystem@OECORE_NATIVE_SYSROOT' 'usr/include',
> ${@meson_list_str('BUILD_OPTIMIZATION', d)}]
> +cpp_link_args = ['-L' @OECORE_NATIVE_SYSROOT '${libdir_native}',
> +               '-L' @@OECORE_NATIVE_SYSROOT '${base_libdir_native}',
> +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
> '${libdir_native}',
> +               '-Wl,-rpath-link,' @OECORE_NATIVE_SYSROOT
> '${base_libdir_native}',
> +               '-Wl,--allow-shlib-undefined',
> +               '-Wl,--dynamic-linker=' @OECORE_NATIVE_SYSROOT
> '${base_libdir_native}'
> +               '${@bb.utils.contains('BUILD_ARCH', 'x86_64',
> 'ld-linux-x86-64.so.2', '', d)}
> +                ${@bb.utils.contains('BUILD_ARCH', 'i686',
> 'ld-linux.so.2', '', d)}
> +                ${@bb.utils.contains('BUILD_ARCH', 'aarch64',
> 'ld-linux-aarch64.so.1', '', d)}'
> +]
> +[properties]
> +sys_root = @OECORE_NATIVE_SYSROOT
> +EOF
> +
>      cat >${D}${datadir}/meson/meson.cross.template <<EOF
>  [binaries]
>  c = @CC
> --
> 2.17.1
>
>

--00000000000057c26f05ce259abe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can you add a nativesdk testcase for this please? Int=
o meta/lib/oeqa/sdk/cases/.<br></div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 12 Oct 2021 at 12:13, Hsia-Jun Li &lt;<a href=3D"mailto:randy.li@synapt=
ics.com">randy.li@synaptics.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: &quot;Hsia-Jun(Randy) Li&quot; &lt;<=
a href=3D"mailto:randy.li@synaptics.com" target=3D"_blank">randy.li@synapti=
cs.com</a>&gt;<br>
<br>
Without a native environment file, find_program() can&#39;t<br>
locate the native program inside SDK.<br>
<br>
That stops wayland compositor using wayland scanner.<br>
<br>
Signed-off-by: Hsia-Jun(Randy) Li &lt;<a href=3D"mailto:randy.li@synaptics.=
com" target=3D"_blank">randy.li@synaptics.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/meson-routines.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 4 ++<br>
=C2=A0.../meson/meson/meson-setup.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +<br>
=C2=A0.../meson/meson/meson-wrapper=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A0.../meson/<a href=3D"http://nativesdk-meson_0.59.1.bb" rel=3D"norefer=
rer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 38 +++++++++++++++++++<br>
=C2=A04 files changed, 45 insertions(+)<br>
<br>
diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routi=
nes.bbclass<br>
index be3aeedeba..a74a9916d8 100644<br>
--- a/meta/classes/meson-routines.bbclass<br>
+++ b/meta/classes/meson-routines.bbclass<br>
@@ -4,6 +4,10 @@ def meson_array(var, d):<br>
=C2=A0 =C2=A0 =C2=A0items =3D d.getVar(var).split()<br>
=C2=A0 =C2=A0 =C2=A0return repr(items[0] if len(items) =3D=3D 1 else items)=
<br>
<br>
+def meson_list_str(var, d):<br>
+=C2=A0 =C2=A0 items =3D d.getVar(var).split()<br>
+=C2=A0 =C2=A0 return repr(items[0]) if len(items) =3D=3D 1 else &#39;, &#3=
9;.join(repr(s) for s in items)<br>
+<br>
=C2=A0# Map our ARCH values to what Meson expects:<br>
=C2=A0# <a href=3D"http://mesonbuild.com/Reference-tables.html#cpu-families=
" rel=3D"noreferrer" target=3D"_blank">http://mesonbuild.com/Reference-tabl=
es.html#cpu-families</a><br>
=C2=A0def meson_cpu_family(var, d):<br>
diff --git a/meta/recipes-devtools/meson/meson/meson-setup.py b/meta/recipe=
s-devtools/meson/meson/meson-setup.py<br>
index 7ac4e3ad47..4a0a967fef 100755<br>
--- a/meta/recipes-devtools/meson/meson/meson-setup.py<br>
+++ b/meta/recipes-devtools/meson/meson/meson-setup.py<br>
@@ -27,6 +27,8 @@ except KeyError:<br>
<br>
=C2=A0template_file =3D os.path.join(sysroot, &#39;usr/share/meson/meson.cr=
oss.template&#39;)<br>
=C2=A0cross_file =3D os.path.join(sysroot, &#39;usr/share/meson/%smeson.cro=
ss&#39; % os.environ[&quot;TARGET_PREFIX&quot;])<br>
+native_template_file =3D os.path.join(sysroot, &#39;usr/share/meson/meson.=
native.template&#39;)<br>
+native_file =3D os.path.join(sysroot, &#39;usr/share/meson/meson.native&#3=
9;)<br>
<br>
=C2=A0with open(template_file) as in_file:<br>
=C2=A0 =C2=A0 =C2=A0template =3D in_file.read()<br>
diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes=
-devtools/meson/meson/meson-wrapper<br>
index d4ffe60f9a..d4b5187f8d 100755<br>
--- a/meta/recipes-devtools/meson/meson/meson-wrapper<br>
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper<br>
@@ -11,4 +11,5 @@ unset CC CXX CPP LD AR NM STRIP<br>
<br>
=C2=A0exec &quot;$OECORE_NATIVE_SYSROOT/usr/bin/meson.real&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 --cross-file &quot;${OECORE_NATIVE_SYSROOT}/usr/share/=
meson/${TARGET_PREFIX}meson.cross&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0--native-file &quot;${OECORE_NATIVE_SYSROOT}/usr/share=
/meson/meson.native&quot; \<br>
=C2=A0 =C2=A0 =C2=A0 &quot;$@&quot;<br>
diff --git a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_=
0.59.1.bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</=
a> b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.59.1.b=
b" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a><br>
index 5657397ddc..f537204a2d 100644<br>
--- a/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.59.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a><br>
+++ b/meta/recipes-devtools/meson/<a href=3D"http://nativesdk-meson_0.59.1.=
bb" rel=3D"noreferrer" target=3D"_blank">nativesdk-meson_0.59.1.bb</a><br>
@@ -15,6 +15,44 @@ SRC_URI +=3D &quot;file://meson-setup.py \<br>
=C2=A0#=C2=A0 =C2=A0them.<br>
=C2=A0do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${datadir}/meson<br>
+<br>
+=C2=A0 =C2=A0 cat &gt;${D}${datadir}/meson/meson.native.template &lt;&lt;E=
OF<br>
+[binaries]<br>
+c =3D ${@meson_array(&#39;BUILD_CC&#39;, d)}<br>
+cpp =3D ${@meson_array(&#39;BUILD_CXX&#39;, d)}<br>
+ar =3D ${@meson_array(&#39;BUILD_AR&#39;, d)}<br>
+nm =3D ${@meson_array(&#39;BUILD_NM&#39;, d)}<br>
+strip =3D ${@meson_array(&#39;BUILD_STRIP&#39;, d)}<br>
+readelf =3D ${@meson_array(&#39;BUILD_READELF&#39;, d)}<br>
+pkgconfig =3D &#39;pkg-config-native&#39;<br>
+<br>
+[built-in options]<br>
+c_args =3D [&#39;-isystem&#39; @OECORE_NATIVE_SYSROOT &#39;${includedir_na=
tive}&#39; , ${@meson_list_str(&#39;BUILD_OPTIMIZATION&#39;, d)}]<br>
+c_link_args =3D [&#39;-L&#39; @OECORE_NATIVE_SYSROOT &#39;${libdir_native}=
&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-L&#39; @@OECO=
RE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,-rpath-lin=
k,&#39; @OECORE_NATIVE_SYSROOT &#39;${libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,-rpath-lin=
k,&#39; @OECORE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,--allow-sh=
lib-undefined&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,--dynamic-=
linker=3D&#39; @OECORE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;${@bb.utils.co=
ntains(&#39;BUILD_ARCH&#39;, &#39;x86_64&#39;, &#39;ld-linux-x86-64.so.2&#3=
9;, &#39;&#39;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contai=
ns(&#39;BUILD_ARCH&#39;, &#39;i686&#39;, &#39;ld-linux.so.2&#39;, &#39;&#39=
;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contai=
ns(&#39;BUILD_ARCH&#39;, &#39;aarch64&#39;, &#39;ld-linux-aarch64.so.1&#39;=
, &#39;&#39;, d)}&#39;<br>
+]<br>
+cpp_args =3D [&#39;-isystem@OECORE_NATIVE_SYSROOT&#39; &#39;usr/include&#3=
9;, ${@meson_list_str(&#39;BUILD_OPTIMIZATION&#39;, d)}]<br>
+cpp_link_args =3D [&#39;-L&#39; @OECORE_NATIVE_SYSROOT &#39;${libdir_nativ=
e}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-L&#39; @@OECO=
RE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,-rpath-lin=
k,&#39; @OECORE_NATIVE_SYSROOT &#39;${libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,-rpath-lin=
k,&#39; @OECORE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,--allow-sh=
lib-undefined&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-Wl,--dynamic-=
linker=3D&#39; @OECORE_NATIVE_SYSROOT &#39;${base_libdir_native}&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;${@bb.utils.co=
ntains(&#39;BUILD_ARCH&#39;, &#39;x86_64&#39;, &#39;ld-linux-x86-64.so.2&#3=
9;, &#39;&#39;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contai=
ns(&#39;BUILD_ARCH&#39;, &#39;i686&#39;, &#39;ld-linux.so.2&#39;, &#39;&#39=
;, d)}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contai=
ns(&#39;BUILD_ARCH&#39;, &#39;aarch64&#39;, &#39;ld-linux-aarch64.so.1&#39;=
, &#39;&#39;, d)}&#39;<br>
+]<br>
+[properties]<br>
+sys_root =3D @OECORE_NATIVE_SYSROOT<br>
+EOF<br>
+<br>
=C2=A0 =C2=A0 =C2=A0cat &gt;${D}${datadir}/meson/meson.cross.template &lt;&=
lt;EOF<br>
=C2=A0[binaries]<br>
=C2=A0c =3D @CC<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000057c26f05ce259abe--

