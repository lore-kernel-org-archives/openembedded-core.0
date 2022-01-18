Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1CCC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 20:48:23 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.113.1642538903007208599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 12:48:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kjoVrM7h;
 spf=pass (domain: gmail.com, ip: 209.85.222.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id p1so453581uap.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 12:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f8XmXko4V8/c3sCsJ16o9GVvvJLP6JuPArf3MvJVjpc=;
        b=kjoVrM7hKUsNrGAlZNaoFYJBi/ckc+9eNbNi87cux+k2F+lLc7kUx+YZq2FUelVvw8
         NfeyOpvV6ATP4kVtxSvY/ElVZGlATc9S1Ow0r23lQo5Jzmakd1cj+3kRSUoeKV99ak04
         mXDHRWi5V1cG/pJRQ/oIrXiyJ4xJUYp6uPx3envSPS4u/ZXLY/40EP7OMTq2eoAh5XM4
         ipka0j9mQvIn3SMckOpYZDqtyaNco/THrlSyEDBwb183gIDrf44epvFjX4YMey4VJtF7
         NiSiKlA/rUXy1CVeiQ/j0P5QZ0mKa5+LItjy+xNvhkW0KqS34P+Pqnqp5HKOI+EXwjsB
         A/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f8XmXko4V8/c3sCsJ16o9GVvvJLP6JuPArf3MvJVjpc=;
        b=TkYj2HJLrtJgCctsxN5/gzP0RG2tQCgUgjkqDInbIWIYflxOmnPppQGKfwULJI1KtJ
         E0tWKccyIHv/0e5Js69ZAjYRvrXa7DBOI8dZ+hu30iQQkK5I14bJun+D+ldslLdpYAQS
         GzCNvctNl75RItrTn4HRWm80NRypVZQ/KOtDArZvXet8996FdXtpTk6sOzwORIKMhQOR
         BbSVjfhCJPyC61xgXQ3n2uJxxg8bfyLb+nHv7JQ3DxKaDYki6SBIphfNmFaM0+0NkYvE
         SahE/IBtSmm9+xs4dt20iS68g3KN27pldRE9ziDHpRsP5CIkdbxkXqaBoUYTTFBa4eor
         UlNA==
X-Gm-Message-State: AOAM531XFa5zzr7snHqBCOrxDYcYd7p4V9q1r9WT4DCR0otHm2l6GZxw
	lrUlkOFu+g0ClU1zwhT5EhE4g8pGgQzshjiCI7Q=
X-Google-Smtp-Source: 
 ABdhPJx+KSGDXa7ni472jGz5lNFoa3RIvKNexVmB8h25PmjPou7tqbXHZsFd1+LbESaxhZxf1Bl8AJAacm0jb18eVz4=
X-Received: by 2002:a67:e95a:: with SMTP id p26mr6335418vso.38.1642538901987;
 Tue, 18 Jan 2022 12:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
In-Reply-To: <20220118185043.1778569-1-marex@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jan 2022 21:48:10 +0100
Message-ID: 
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000c865f205d5e163c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 20:48:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160678

--000000000000c865f205d5e163c6
Content-Type: text/plain; charset="UTF-8"

This update breaks gst-libav, and I have a patch in the works that fixes
that too :)

Alex

On Tue, 18 Jan 2022 at 19:50, Marek Vasut <marex@denx.de> wrote:

> Update ffmpeg to 5.0 , release notes and changelog below:
>
> https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES
> https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0
>
> The avresample has been removed before 5.0 release in ffmpeg commit
> 420cedd497 ("libavresample: Remove deprecated library")
>
> The ffmpeg 5.0 might be an LTS release, see:
> http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb}            | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb}
> (95%)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> similarity index 95%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> index 3ba07c31d6..4ba5ff4537 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> @@ -11,7 +11,6 @@ LICENSE:libavcodec =
> "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LG
>  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>  LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>  LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> -LICENSE:libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>  LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
>  LICENSE:libpostproc = "GPLv2+"
>  LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> @@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>
> file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>             "
> -SRC_URI[sha256sum] =
> "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
> +SRC_URI[sha256sum] =
> "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
>
>  # Build fails when thumb is enabled:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>  ARM_INSTRUCTION_SET:armv4 = "arm"
> @@ -41,7 +40,7 @@ DEPENDS = "nasm-native"
>
>  inherit autotools pkgconfig
>
> -PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale
> postproc avresample \
> +PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample swscale
> postproc \
>                     alsa bzlib lzma pic pthreads shared theora zlib \
>                     ${@bb.utils.contains('AVAILTUNES', 'mips32r2',
> 'mips32r2', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv
> xcb', '', d)}"
> @@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =
> "--enable-avformat,--disable-avformat"
>  PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
>  PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
>  PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
> -PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
>
>  # features to support
>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> @@ -153,7 +151,6 @@ PACKAGES =+ "libavcodec \
>               libavdevice \
>               libavfilter \
>               libavformat \
> -             libavresample \
>               libavutil \
>               libpostproc \
>               libswresample \
> @@ -163,7 +160,6 @@ FILES:libavcodec = "${libdir}/libavcodec${SOLIBS}"
>  FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
>  FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
>  FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
> -FILES:libavresample = "${libdir}/libavresample${SOLIBS}"
>  FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
>  FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
>  FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
> @@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
>  INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
>  INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
>  INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
> -INSANE_SKIP:${MLPREFIX}libavresample = "textrel"
>  INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
>  INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
>  INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160676):
> https://lists.openembedded.org/g/openembedded-core/message/160676
> Mute This Topic: https://lists.openembedded.org/mt/88516624/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000c865f205d5e163c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This update breaks gst-libav, and I have a patch in t=
he works that fixes that too :)</div><div><br></div><div>Alex<br></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On T=
ue, 18 Jan 2022 at 19:50, Marek Vasut &lt;<a href=3D"mailto:marex@denx.de">=
marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Update ffmpeg to 5.0 , release notes and changelog below:<br>
<a href=3D"https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release=
/5.0:/RELEASE_NOTES" rel=3D"noreferrer" target=3D"_blank">https://git.ffmpe=
g.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES</a><br>
<a href=3D"https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0" rel=3D"n=
oreferrer" target=3D"_blank">https://git.ffmpeg.org/gitweb/ffmpeg.git/short=
log/n5.0</a><br>
<br>
The avresample has been removed before 5.0 release in ffmpeg commit<br>
420cedd497 (&quot;libavresample: Remove deprecated library&quot;)<br>
<br>
The ffmpeg 5.0 might be an LTS release, see:<br>
<a href=3D"http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0" rel=3D"norefer=
rer" target=3D"_blank">http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0</a>=
<br>
<br>
Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_=
blank">marex@denx.de</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" target=3D"_=
blank">alex@linutronix.de</a>&gt;<br>
Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0.../ffmpeg/{<a href=3D"http://ffmpeg_4.4.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">ffmpeg_4.4.1.bb</a> =3D&gt; <a href=3D"http://ffmpeg_5.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a>}=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++-------<br>
=C2=A01 file changed, 2 insertions(+), 7 deletions(-)<br>
=C2=A0rename meta/recipes-multimedia/ffmpeg/{<a href=3D"http://ffmpeg_4.4.1=
.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a> =3D&gt; <a hr=
ef=3D"http://ffmpeg_5.0.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0=
.bb</a>} (95%)<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.1.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a> b/meta/recipes=
-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">ffmpeg_5.0.bb</a><br>
similarity index 95%<br>
rename from meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.1.b=
b" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a><br>
rename to meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.bb" r=
el=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a><br>
index 3ba07c31d6..4ba5ff4537 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a><br>
@@ -11,7 +11,6 @@ LICENSE:libavcodec =3D &quot;${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LG<br>
=C2=A0LICENSE:libavdevice =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
=C2=A0LICENSE:libavfilter =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
=C2=A0LICENSE:libavformat =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
-LICENSE:libavresample =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#3=
9;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
=C2=A0LICENSE:libavutil =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#=
39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br>
=C2=A0LICENSE:libpostproc =3D &quot;GPLv2+&quot;<br>
=C2=A0LICENSE:libswresample =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot;<br=
>
@@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db23=
4ee4d69f5fce4486a80fdaf4a4263 \<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases/$%7BBP%7=
D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmpeg.org/relea=
ses/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libavutil-include-ass=
embly-with-full-path-from-sourc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257=
a8d68569a4651e30e02&quot;<br>
+SRC_URI[sha256sum] =3D &quot;51e919f7d205062c0fd4fae6243a84850391115104ccf=
1efc451733bc0ac7298&quot;<br>
<br>
=C2=A0# Build fails when thumb is enabled: <a href=3D"https://bugzilla.yoct=
oproject.org/show_bug.cgi?id=3D7717" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717</a><br>
=C2=A0ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
@@ -41,7 +40,7 @@ DEPENDS =3D &quot;nasm-native&quot;<br>
<br>
=C2=A0inherit autotools pkgconfig<br>
<br>
-PACKAGECONFIG ??=3D &quot;avdevice avfilter avcodec avformat swresample sw=
scale postproc avresample \<br>
+PACKAGECONFIG ??=3D &quot;avdevice avfilter avcodec avformat swresample sw=
scale postproc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa =
bzlib lzma pic pthreads shared theora zlib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;AVAILTUNES&#39;, &#39;mips32r2&#39;, &#39;mips32r2&#39=
;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;xv xcb&#39;,=
 &#39;&#39;, d)}&quot;<br>
@@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =3D &quot;--enable-avformat,--dis=
able-avformat&quot;<br>
=C2=A0PACKAGECONFIG[swresample] =3D &quot;--enable-swresample,--disable-swr=
esample&quot;<br>
=C2=A0PACKAGECONFIG[swscale] =3D &quot;--enable-swscale,--disable-swscale&q=
uot;<br>
=C2=A0PACKAGECONFIG[postproc] =3D &quot;--enable-postproc,--disable-postpro=
c&quot;<br>
-PACKAGECONFIG[avresample] =3D &quot;--enable-avresample,--disable-avresamp=
le&quot;<br>
<br>
=C2=A0# features to support<br>
=C2=A0PACKAGECONFIG[alsa] =3D &quot;--enable-alsa,--disable-alsa,alsa-lib&q=
uot;<br>
@@ -153,7 +151,6 @@ PACKAGES =3D+ &quot;libavcodec \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavdevice \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavfilter \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavformat \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavresample \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libavutil \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libpostproc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libswresample \<br>
@@ -163,7 +160,6 @@ FILES:libavcodec =3D &quot;${libdir}/libavcodec${SOLIBS=
}&quot;<br>
=C2=A0FILES:libavdevice =3D &quot;${libdir}/libavdevice${SOLIBS}&quot;<br>
=C2=A0FILES:libavfilter =3D &quot;${libdir}/libavfilter${SOLIBS}&quot;<br>
=C2=A0FILES:libavformat =3D &quot;${libdir}/libavformat${SOLIBS}&quot;<br>
-FILES:libavresample =3D &quot;${libdir}/libavresample${SOLIBS}&quot;<br>
=C2=A0FILES:libavutil =3D &quot;${libdir}/libavutil${SOLIBS}&quot;<br>
=C2=A0FILES:libpostproc =3D &quot;${libdir}/libpostproc${SOLIBS}&quot;<br>
=C2=A0FILES:libswresample =3D &quot;${libdir}/libswresample${SOLIBS}&quot;<=
br>
@@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice =3D &quot;textrel&qu=
ot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libavfilter =3D &quot;textrel&quot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libavformat =3D &quot;textrel&quot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libavutil =3D &quot;textrel&quot;<br>
-INSANE_SKIP:${MLPREFIX}libavresample =3D &quot;textrel&quot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libswscale =3D &quot;textrel&quot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libswresample =3D &quot;textrel&quot;<br>
=C2=A0INSANE_SKIP:${MLPREFIX}libpostproc =3D &quot;textrel&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160676): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160676" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160676</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88516624/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88516624/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000c865f205d5e163c6--

