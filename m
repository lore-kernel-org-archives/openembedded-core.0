Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA12AECAAD3
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 12:27:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.5399.1663417623372955571
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 05:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CwKDr0YQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id r20so16592290ljj.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 05:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NHEr5ec/OTri6K0lw8a/CTVlCbWbpsVH1C3Om4n/hEQ=;
        b=CwKDr0YQi3gV6+PELua1sbynGe3dR4lxjtOqCDoy+WAzClgp5pJyBNBIZgrTUUh7oF
         neCZP18HckEew999zUwJ/N7DwUuJIE+vZ8oqVTuabbiusUtnGFIzHhQZ4o74KxszsYMG
         oFWdMIy723aQnmCW3RCyQxr0w8HZhXB+38/O+3g2xxDMInGBEuA2qrAy/GR12X0aqLS3
         oAW+dbhcOh/ulZ3gg6SX4QKAwQepKurNLwMyZ01JkbSkV7g5OVydcqFiBx3dl6whR1ro
         rSlcdwBxW1tp/NiajPUV1+prOHXg2CBp2xBSdmIjbiEZpUAZjUUHM/w/+Tg8fTOXge0U
         0esg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NHEr5ec/OTri6K0lw8a/CTVlCbWbpsVH1C3Om4n/hEQ=;
        b=iOdMB8nrAKGL0BaAWXalTG69jCb79CesB7apRk7PzrKFbDtl7QiDxsvAHCaOef9aT8
         iyeZWAE44TbY+nXGmeaoXY1s08mAnXznK/b9yfAdLrsG5xsy0zcfqdHmuyDeFmduG4eB
         ojvUyxEyIjPtNWG67iqxBuubsCYR4GdNPgsacSJZUvaEHoiqfFTBYzhzBhjb9tZMuu7T
         NfZk/auUYJ4ra9UYcUBCURicyNDI8U4B9CUXlqM3VT6ijziib0tDSpf8osWeM0YdC7gj
         gdTCXfydnst+j3sM7NXOv+ndXH54vQZpTU9QApAM2rp0HPiZJbjWWrnFmwTSnNOVbrLx
         qtFg==
X-Gm-Message-State: ACrzQf3wHOR6wyTYw4jjQcZdT5BkfwWJuqPolTFga8B/4IsuHL+omJF8
	4ZNsyyik8/3eIO03p8y+41vDUoZJG1yUkf+bFbM=
X-Google-Smtp-Source: 
 AMsMyM5ko61X4EYdqgZA8KANEG3/O0KDS4+oWnx25aYUoW8nDEQCoLBDWk0SmX3ZJON+mn6L3naNQ6Iw/u14rlTTBfQ=
X-Received: by 2002:a05:651c:4cf:b0:26b:dc6f:26c6 with SMTP id
 e15-20020a05651c04cf00b0026bdc6f26c6mr2683271lji.41.1663417621431; Sat, 17
 Sep 2022 05:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
 <20220917115642.766941-2-andrey.konovalov@linaro.org>
In-Reply-To: <20220917115642.766941-2-andrey.konovalov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 17 Sep 2022 13:26:50 +0100
Message-ID: 
 <CANNYZj9-K-uToKPjVb1+AwUMZb5gK0opW1F2gHKr1BNe+iNyow@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/1] mesa: fix building OpenCL programs
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007049d105e8de98c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 12:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170829

--0000000000007049d105e8de98c0
Content-Type: text/plain; charset="UTF-8"

Please send this upstream first.

Alex

On Sat 17. Sep 2022 at 12.56, Andrey Konovalov <andrey.konovalov@linaro.org>
wrote:

> When building an OpenCL program clover needs to locate opencl-c.h
> include file. This include file location is passed via cpp args using
> CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently
> uses "$(llvm-config --libdir)" which results in path to sysroot included
> into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with
> "fatal error: 'opencl-c.h' file not found".
>
> Work this around by using '/usr/lib' instead of the libdir value
> exported by LLVM.
>
> Microsoft/Intel CLC should suffer from the same issue, and the similar
> workaround should work in this case too.
>
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>  2 files changed, 43 insertions(+)
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
>
> diff --git
> a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
> b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
> new file mode 100644
> index 0000000000..db60fe407f
> --- /dev/null
> +++
> b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
> @@ -0,0 +1,42 @@
> +From: Andrey Konovalov <andrey.konovalov@linaro.org>
> +Date: Fri, 16 Sep 2022 16:58:20 +0000
> +Subject: [PATCH] CLANG_RESOURCE_DIR workaround
> +
> +Setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something"
> +results in clBuildProgram() error when an OpenCL program is being
> +built on the target. The reason is that $(llvm-config --libdir) output
> +includes path to the sysroot directory.
> +
> +Work this around by using '/usr/lib' instead of the libdir value
> +exported by LLVM.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> +
> +---
> +
> +--- a/src/gallium/frontends/clover/meson.build 2022-09-16
> 10:24:55.910577158 +0000
> ++++ b/src/gallium/frontends/clover/meson.build 2022-09-16
> 10:28:13.112804197 +0000
> +@@ -71,8 +71,7 @@ libclllvm = static_library(
> +     clover_opencl_cpp_args,
> +     clover_spirv_cpp_args,
> +     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
> +-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool:
> 'libdir'), 'clang',
> +-      dep_llvm.version(), 'include',
> ++      '/usr/lib', 'clang', dep_llvm.version(), 'include',
> +     )),
> +   ],
> +   gnu_symbol_visibility : 'hidden',
> +--- a/src/compiler/clc/meson.build     2022-09-16 16:40:10.641735401 +0000
> ++++ b/src/compiler/clc/meson.build     2022-09-16 16:50:18.095700452 +0000
> +@@ -39,7 +39,9 @@ files_libclc = files(
> +   'clc_helpers.cpp',
> + )
> +
> +-_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@
> "'.format(clang_resource_dir)]
> ++_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
> ++                       '/usr/lib', 'clang', dep_llvm.version(), 'include'
> ++                    ))]
> + if with_microsoft_clc
> +   _libclc_cpp_args += ['-DUSE_STATIC_OPENCL_C_H=1']
> + endif
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index ea7ed4fd27..0a2fb2150d 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -23,6 +23,7 @@ SRC_URI = "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
>
> file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
>
> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
> +           file://0001-meson.CLANG_RESOURCE_DIR-workaround.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170828):
> https://lists.openembedded.org/g/openembedded-core/message/170828
> Mute This Topic: https://lists.openembedded.org/mt/93741466/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007049d105e8de98c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Please send this upstream first.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex</div></div><div><div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 17. Sep 2022 at =
12.56, Andrey Konovalov &lt;<a href=3D"mailto:andrey.konovalov@linaro.org" =
target=3D"_blank">andrey.konovalov@linaro.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(20=
4,204,204)">When building an OpenCL program clover needs to locate opencl-c=
.h<br>
include file. This include file location is passed via cpp args using<br>
CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently<b=
r>
uses &quot;$(llvm-config --libdir)&quot; which results in path to sysroot i=
ncluded<br>
into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with<br>
&quot;fatal error: &#39;opencl-c.h&#39; file not found&quot;.<br>
<br>
Work this around by using &#39;/usr/lib&#39; instead of the libdir value<br=
>
exported by LLVM.<br>
<br>
Microsoft/Intel CLC should suffer from the same issue, and the similar<br>
workaround should work in this case too.<br>
<br>
Signed-off-by: Andrey Konovalov &lt;<a href=3D"mailto:andrey.konovalov@lina=
ro.org" target=3D"_blank">andrey.konovalov@linaro.org</a>&gt;<br>
---<br>
=C2=A0...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 43 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_=
RESOURCE_DIR-workaround.patch<br>
<br>
diff --git a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR=
-workaround.patch b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOU=
RCE_DIR-workaround.patch<br>
new file mode 100644<br>
index 0000000000..db60fe407f<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workar=
ound.patch<br>
@@ -0,0 +1,42 @@<br>
+From: Andrey Konovalov &lt;<a href=3D"mailto:andrey.konovalov@linaro.org" =
target=3D"_blank">andrey.konovalov@linaro.org</a>&gt;<br>
+Date: Fri, 16 Sep 2022 16:58:20 +0000<br>
+Subject: [PATCH] CLANG_RESOURCE_DIR workaround<br>
+<br>
+Setting CLANG_RESOURCE_DIR to &quot;$(llvm-config --libdir)something&quot;=
<br>
+results in clBuildProgram() error when an OpenCL program is being<br>
+built on the target. The reason is that $(llvm-config --libdir) output<br>
+includes path to the sysroot directory.<br>
+<br>
+Work this around by using &#39;/usr/lib&#39; instead of the libdir value<b=
r>
+exported by LLVM.<br>
+<br>
+Upstream-Status: Inappropriate<br>
+Signed-off-by: Andrey Konovalov &lt;<a href=3D"mailto:andrey.konovalov@lin=
aro.org" target=3D"_blank">andrey.konovalov@linaro.org</a>&gt;<br>
+<br>
+---<br>
+<br>
+--- a/src/gallium/frontends/clover/meson.build 2022-09-16 10:24:55.9105771=
58 +0000<br>
++++ b/src/gallium/frontends/clover/meson.build 2022-09-16 10:28:13.1128041=
97 +0000<br>
+@@ -71,8 +71,7 @@ libclllvm =3D static_library(<br>
+=C2=A0 =C2=A0 =C2=A0clover_opencl_cpp_args,<br>
+=C2=A0 =C2=A0 =C2=A0clover_spirv_cpp_args,<br>
+=C2=A0 =C2=A0 =C2=A0&#39;-DCLANG_RESOURCE_DIR=3D&quot;@0@&quot;&#39;.forma=
t(join_paths(<br>
+-=C2=A0 =C2=A0 =C2=A0 dep_llvm.get_variable(cmake : &#39;LLVM_LIBRARY_DIR&=
#39;, configtool: &#39;libdir&#39;), &#39;clang&#39;,<br>
+-=C2=A0 =C2=A0 =C2=A0 dep_llvm.version(), &#39;include&#39;,<br>
++=C2=A0 =C2=A0 =C2=A0 &#39;/usr/lib&#39;, &#39;clang&#39;, dep_llvm.versio=
n(), &#39;include&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0)),<br>
+=C2=A0 =C2=A0],<br>
+=C2=A0 =C2=A0gnu_symbol_visibility : &#39;hidden&#39;,<br>
+--- a/src/compiler/clc/meson.build=C2=A0 =C2=A0 =C2=A02022-09-16 16:40:10.=
641735401 +0000<br>
++++ b/src/compiler/clc/meson.build=C2=A0 =C2=A0 =C2=A02022-09-16 16:50:18.=
095700452 +0000<br>
+@@ -39,7 +39,9 @@ files_libclc =3D files(<br>
+=C2=A0 =C2=A0&#39;clc_helpers.cpp&#39;,<br>
+ )<br>
+ <br>
+-_libclc_cpp_args =3D [&#39;-DCLANG_RESOURCE_DIR=3D&quot;@0@&quot;&#39;.fo=
rmat(clang_resource_dir)]<br>
++_libclc_cpp_args =3D [&#39;-DCLANG_RESOURCE_DIR=3D&quot;@0@&quot;&#39;.fo=
rmat(join_paths(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&#39;/usr/lib&#39;, &#39;clang&#39;, dep_llvm.version(), &#39;inc=
lude&#39;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ))]=
<br>
+ if with_microsoft_clc<br>
+=C2=A0 =C2=A0_libclc_cpp_args +=3D [&#39;-DUSE_STATIC_OPENCL_C_H=3D1&#39;]=
<br>
+ endif<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index ea7ed4fd27..0a2fb2150d 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -23,6 +23,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Revert-egl-wayland-de=
precate-drm_handle_format-and-d.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-swrast_kms-use-swkmsD=
RI2Extension-instead-of-driDRI2.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-nir-nir_opt_move-fix-=
ALWAYS_INLINE-compiler-error.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-meson.CLANG_RESOURCE_=
DIR-workaround.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;22ced061eb9adab8ea35368246c1995c09723f3f=
71653cd5050c5cec376e671a&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170828): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170828" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170828</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93741466/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93741466/1686489</a><br>
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
</div>

--0000000000007049d105e8de98c0--

