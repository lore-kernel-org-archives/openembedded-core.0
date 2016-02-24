Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 850E177353
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 01:55:02 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id b205so16044386wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 17:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nlml015O8kFFZD2987Xf76kpRaBcCTYDWtbCY5FhK7c=;
	b=ZzKKASdHA5Vb7E4kDVIXeMA9c/tssQNYHQ4+B6D1vjPiypSNWVrNiC0pLv1H/ZnJ8y
	7EUirWUuLH7PHpNK0a/PY1sk509EceD/rbkGSoeDXhLV3S147xIfLQZVaTUf4cSlIqnC
	OJTib9GQqdsvxffvnRJY59Lr7BzZjsSZgyzAeBegxcVpblakiWxmq9OuRCwCHsxldADU
	pOZql7Hebto6clQSFBGHJyEdT/9Jg8iWVhzW/ZfLYhRl/defcjp3FmaBm3BK/mIA3j/T
	czfKwZ2DjFGs5l1ZBf6UHL/FyuEAZB7nIr2jHtHvgKOCwXFMgAxi9qobtw/Hbg+D2oMh
	dxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nlml015O8kFFZD2987Xf76kpRaBcCTYDWtbCY5FhK7c=;
	b=iG+8CMxgb8ZCtdIiTMtJBaLIirR85/z3n8JuTrhbQW6WqiuCm+xYoQczsCMyKnnL1O
	ULPeuRTi2Fkl9ctlm5eZuHi4M+C0Aauams52YUx/wNEDgVQ4OmhD4/CWOBaaLJxu71Ff
	b4+TO0gyGVJbp+JpasBCILZ5pYfvj0aKBbvir7ZxemIYfHxdZ5dfqNMebFqp4w3eNVJo
	k8yppIve4olE0zaDZAQ+YvM2rhnktAzXv1shn60eHB/fHz06qbY+sW8C5Ch8oeeYxVi4
	jHfO6D25MfIwD39wVvig0tudnt1X2lIU6q3PquFidsE9vAsYVSOYE6HQHtf5TZZwxuUq
	8PEQ==
X-Gm-Message-State: AG10YORPqua/zVZktN7uiZZvgPBfnSZguTdHgu5ZPjvHpHK9GHn9O9YwavPgNWDVQQU9iXsiQCqAt/Xfze8CLA==
MIME-Version: 1.0
X-Received: by 10.194.5.36 with SMTP id p4mr36974737wjp.167.1456278903216;
	Tue, 23 Feb 2016 17:55:03 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Tue, 23 Feb 2016 17:55:03 -0800 (PST)
In-Reply-To: <665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
References: <cover.1455107972.git.alexander.kanavin@linux.intel.com>
	<665b18beb51e5fbcfb033bdda22d7ba85b50f903.1455107972.git.alexander.kanavin@linux.intel.com>
Date: Wed, 24 Feb 2016 02:55:03 +0100
Message-ID: <CA+chaQe460XR_hNRMS3MyUh5KGMWjykiQKnVOh58FAg2zk0WVQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] ffmpeg: update to 2.8.6
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
X-List-Received-Date: Wed, 24 Feb 2016 01:55:05 -0000
Content-Type: multipart/alternative; boundary=047d7b5d9c3bb862ad052c7a5a0a

--047d7b5d9c3bb862ad052c7a5a0a
Content-Type: text/plain; charset=UTF-8

Fails to build for qemuarm when thumb is enabled.

Why was:
ARM_INSTRUCTION_SET = "arm"

removed in
http://git.openembedded.org/openembedded-core/commit/?id=77dbf07293df15cd5473422abd678930d6277bb0

without checking if it works?

| {standard input}: Assembler messages:
| {standard input}:288: Error: instruction not supported in Thumb16 mode --
`adds r3,r1,r0,lsr#31'
| {standard input}:289: Error: selected processor does not support `itet
ne' in Thumb mode
| {standard input}:290: Error: Thumb does not support conditional execution
| {standard input}:291: Error: Thumb does not support conditional execution
| {standard input}:292: Error: Thumb does not support conditional execution
| {standard input}:536: Error: instruction not supported in Thumb16 mode --
`adds r3,r1,r0,lsr#31'
| {standard input}:537: Error: selected processor does not support `itet
ne' in Thumb mode
| {standard input}:538: Error: Thumb does not support conditional execution
| {standard input}:539: Error: Thumb does not support conditional execution
| {standard input}:540: Error: Thumb does not support conditional execution
| make: *** [libavfilter/af_dcshift.o] Error 1
| make: *** Waiting for unfinished jobs....
| CC libavfilter/af_pan.o
| WARNING: exit code 1 from a shell command.
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/ffmpeg/2.8.6-r0/temp/log.do_compile.32728)
NOTE: recipe ffmpeg-2.8.6-r0: task do_compile: Failed
ERROR: Task 18801
(/home/jenkins/oe/world/shr-core/openembedded-core/meta/recipes-multimedia/ffmpeg/
ffmpeg_2.8.6.bb, do_compile) failed with exit code '1'

On Wed, Feb 10, 2016 at 1:42 PM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Add libxv dependency only when libavdevice is enabled (as nothing else
> needs it).
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb}                   | 8
> ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_2.8.5.bb => ffmpeg_2.8.6.bb}
> (94%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> similarity index 94%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> index 7107803..72393b3 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.5.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_2.8.6.bb
> @@ -15,19 +15,19 @@ LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz"
>
> -SRC_URI[md5sum] = "b34164bd181f4f81c21da3dd131d919d"
> -SRC_URI[sha256sum] =
> "76fb83a267d2d1cb332742dadf28ad8b58af7958165f51bb1a2c226a122f0ac7"
> +SRC_URI[md5sum] = "0cff5dae51375f0a31a651f986ed1534"
> +SRC_URI[sha256sum] =
> "25bcedbdafadac3d09c325c1d46a51f53d858b26a260d5aed6b4f17fea6e07fa"
>
>  # Should be API compatible with libav (which was a fork of ffmpeg)
>  # libpostproc was previously packaged from a separate recipe
>  PROVIDES = "libav libpostproc"
>
> -DEPENDS = "alsa-lib zlib libogg yasm-native libxv"
> +DEPENDS = "alsa-lib zlib libogg yasm-native"
>
>  inherit autotools pkgconfig
>
>  PACKAGECONFIG ??= "avdevice avfilter gpl theora x264
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> -PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice"
> +PACKAGECONFIG[avdevice] = "--enable-avdevice,--disable-avdevice, libxv"
>  PACKAGECONFIG[avfilter] = "--enable-avfilter,--disable-avfilter"
>  PACKAGECONFIG[faac] = "--enable-libfaac,--disable-libfaac,faac"
>  PACKAGECONFIG[gpl] = "--enable-gpl,--disable-gpl"
> --
> 2.7.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b5d9c3bb862ad052c7a5a0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Fails to build for qemuarm when thumb is enabled.</di=
v><div><br></div><div>Why was:</div><div><span style=3D"color:rgb(255,0,0);=
font-family:monospace;font-size:13.3333px;white-space:pre">ARM_INSTRUCTION_=
SET =3D &quot;arm&quot;</span><br></div><div><span style=3D"color:rgb(255,0=
,0);font-family:monospace;font-size:13.3333px;white-space:pre"><br></span><=
/div><div><span style=3D"color:rgb(255,0,0);font-family:monospace;font-size=
:13.3333px;white-space:pre">removed in</span></div><div><font color=3D"#ff0=
000" face=3D"monospace"><span style=3D"font-size:13.3333px;white-space:pre"=
><a href=3D"http://git.openembedded.org/openembedded-core/commit/?id=3D77db=
f07293df15cd5473422abd678930d6277bb0">http://git.openembedded.org/openembed=
ded-core/commit/?id=3D77dbf07293df15cd5473422abd678930d6277bb0</a></span></=
font><br></div><div><font color=3D"#ff0000" face=3D"monospace"><span style=
=3D"font-size:13.3333px;white-space:pre"><br></span></font></div><div><font=
 color=3D"#ff0000" face=3D"monospace"><span style=3D"font-size:13.3333px;wh=
ite-space:pre">without checking if it works?</span></font></div><div><font =
color=3D"#ff0000" face=3D"monospace"><span style=3D"font-size:13.3333px;whi=
te-space:pre"><br></span></font></div><div>| {standard input}: Assembler me=
ssages:</div><div>| {standard input}:288: Error: instruction not supported =
in Thumb16 mode -- `adds r3,r1,r0,lsr#31&#39;</div><div>| {standard input}:=
289: Error: selected processor does not support `itet ne&#39; in Thumb mode=
</div><div>| {standard input}:290: Error: Thumb does not support conditiona=
l execution</div><div>| {standard input}:291: Error: Thumb does not support=
 conditional execution</div><div>| {standard input}:292: Error: Thumb does =
not support conditional execution</div><div>| {standard input}:536: Error: =
instruction not supported in Thumb16 mode -- `adds r3,r1,r0,lsr#31&#39;</di=
v><div>| {standard input}:537: Error: selected processor does not support `=
itet ne&#39; in Thumb mode</div><div>| {standard input}:538: Error: Thumb d=
oes not support conditional execution</div><div>| {standard input}:539: Err=
or: Thumb does not support conditional execution</div><div>| {standard inpu=
t}:540: Error: Thumb does not support conditional execution</div><div>| mak=
e: *** [libavfilter/af_dcshift.o] Error 1</div><div>| make: *** Waiting for=
 unfinished jobs....</div><div>| CC<span class=3D"" style=3D"white-space:pr=
e">	</span>libavfilter/af_pan.o</div><div>| WARNING: exit code 1 from a she=
ll command.</div><div>| ERROR: oe_runmake failed</div><div>| ERROR: Functio=
n failed: do_compile (log file is located at /home/jenkins/oe/world/shr-cor=
e/tmp-glibc/work/armv5te-oe-linux-gnueabi/ffmpeg/2.8.6-r0/temp/log.do_compi=
le.32728)</div><div>NOTE: recipe ffmpeg-2.8.6-r0: task do_compile: Failed</=
div><div>ERROR: Task 18801 (/home/jenkins/oe/world/shr-core/openembedded-co=
re/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.6.bb">ffmpeg=
_2.8.6.bb</a>, do_compile) failed with exit code &#39;1&#39;</div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 10, 2016=
 at 1:42 PM, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto:alex=
ander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@linux.in=
tel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add libxv d=
ependency only when libavdevice is enabled (as nothing else needs it).<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0.../ffmpeg/{<a href=3D"http://ffmpeg_2.8.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ffmpeg_2.8.5.bb</a> =3D&gt; <a href=3D"http://ffmpeg_2.8.6.b=
b" rel=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.6.bb</a>}=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/ffmpeg/{<a href=3D"http://ffmpeg_2.8.5=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.5.bb</a> =3D&gt; <a hr=
ef=3D"http://ffmpeg_2.8.6.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_2=
.8.6.bb</a>} (94%)<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.5.bb</a> b/meta/recipes=
-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.6.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ffmpeg_2.8.6.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.5.b=
b" rel=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.5.bb</a><br>
rename to meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.6.bb</a><br>
index 7107803..72393b3 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.5.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.5.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_2.8.6.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_2.8.6.bb</a><br>
@@ -15,19 +15,19 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db=
234ee4d69f5fce4486a80fdaf4a4263 \<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases/${BP}.ta=
r.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmpeg.org/releases/=
${BP}.tar.xz</a>&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;b34164bd181f4f81c21da3dd131d919d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;76fb83a267d2d1cb332742dadf28ad8b58af7958165f5=
1bb1a2c226a122f0ac7&quot;<br>
+SRC_URI[md5sum] =3D &quot;0cff5dae51375f0a31a651f986ed1534&quot;<br>
+SRC_URI[sha256sum] =3D &quot;25bcedbdafadac3d09c325c1d46a51f53d858b26a260d=
5aed6b4f17fea6e07fa&quot;<br>
<br>
=C2=A0# Should be API compatible with libav (which was a fork of ffmpeg)<br=
>
=C2=A0# libpostproc was previously packaged from a separate recipe<br>
=C2=A0PROVIDES =3D &quot;libav libpostproc&quot;<br>
<br>
-DEPENDS =3D &quot;alsa-lib zlib libogg yasm-native libxv&quot;<br>
+DEPENDS =3D &quot;alsa-lib zlib libogg yasm-native&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;avdevice avfilter gpl theora x264 ${@bb.uti=
ls.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&=
#39;, d)}&quot;<br>
-PACKAGECONFIG[avdevice] =3D &quot;--enable-avdevice,--disable-avdevice&quo=
t;<br>
+PACKAGECONFIG[avdevice] =3D &quot;--enable-avdevice,--disable-avdevice, li=
bxv&quot;<br>
=C2=A0PACKAGECONFIG[avfilter] =3D &quot;--enable-avfilter,--disable-avfilte=
r&quot;<br>
=C2=A0PACKAGECONFIG[faac] =3D &quot;--enable-libfaac,--disable-libfaac,faac=
&quot;<br>
=C2=A0PACKAGECONFIG[gpl] =3D &quot;--enable-gpl,--disable-gpl&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7b5d9c3bb862ad052c7a5a0a--
