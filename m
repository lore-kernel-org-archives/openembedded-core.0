Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E285C433F5
	for <webhook@archiver.kernel.org>; Sat, 22 Jan 2022 21:48:10 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web12.2201.1642888089018756828
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:48:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bkmjG5xb;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id w21so23654774uan.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jan 2022 13:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=OFeMYSdhfTM0DJd05X98JfQKVGQKHWZ5RakFOOZW5Ts=;
        b=bkmjG5xb9ulmLa85rlt0NHKRIWJKiQFWID9ghQaUnWS4vkZoiHwsBw81Nf3zFt7z0F
         mrZouRiU6i0tOEEIji4NnIy2fA9Bzgvj289o9mUjTXrIli2NP978Xjd8O8CmQBbq41qc
         4B9Tlv+K60m04iYg6Vt4frTHpAZ/zjOzZBHYsEsQvfQw7dB7ZkaMqi0TfB/ENemntXZa
         GNDNiUkhz5M8wtHZ2lg04Cut2r6MKWJy9VdqEDjdDBDDi1wEqucVHi0nQwZR1gM0w0QT
         caWkEEiXo9MNx/t85HMabciMqBJqAulcYZRGYDPQ7K+QQzPeWEanAsE8i2avVQ7um0Rd
         QPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=OFeMYSdhfTM0DJd05X98JfQKVGQKHWZ5RakFOOZW5Ts=;
        b=7SmWddguELl5r6I3SK1iviuZ1y+WJOfZWKvG7c+pj1MG+y0KVh5uRCBThkS/rgGqf8
         EHm17JwTfpsHOQTyls6KygL4F5NnyTpiQFZsRg92c4qzTp5KNuZF09ojaqy2lELPFHA3
         yy1+L9GNzCKnhZvAW3ikGKOcihRZhdwtwuk89rHk6P3aE9WxlLJ3SsDfXihOMm9kYoXF
         NEOrmsr/ggX7yucNl4mt+OiQGFCrnrOGTCkxl2xFdFvBoXvhA5BMwFoApF+mhcYs0viW
         UGvoh+8OPFGDRfR1ZuK5sW6S5KTSBBzdC0VlG7L8kCiPuldeO5oH+8wUPZ3WwWpNKo0M
         NKqA==
X-Gm-Message-State: AOAM532ELuzIOJ9l0kD4oFzkwHxx5JAlShZmgMycADPZurY1S+RHuH8j
	dUViNSj/nw8wqDmz+JeeUpso8OZQPFFV51B0cvs=
X-Google-Smtp-Source: 
 ABdhPJymKeptSKU2cTnyLdUzO3Z3T3fSKTKvAP2UFNF0SoQ62OcTed3C0GJkh540eZahYhUBtUgaZ6KXzfTmiP0PYqw=
X-Received: by 2002:a67:c801:: with SMTP id u1mr2132506vsk.73.1642888087960;
 Sat, 22 Jan 2022 13:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
 <16CC6034E1AC2CBC.18829@lists.openembedded.org>
 <16CC67149B14BEF3.29636@lists.openembedded.org>
In-Reply-To: <16CC67149B14BEF3.29636@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Jan 2022 22:47:56 +0100
Message-ID: 
 <CANNYZj-v6bAGrVv9Yh=npMK+ZsOwS2692Vvhh7K1HhbTp7nN_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Khem Raj <raj.khem@gmail.com>, Marek Vasut <marex@denx.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e380e105d632b0d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jan 2022 21:48:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160859

--000000000000e380e105d632b0d9
Content-Type: text/plain; charset="UTF-8"

I have sent additional patches for the four ffmpeg related issues.

Alex

On Fri, 21 Jan 2022 at 22:41, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I have now sent out the meson 0.61 fixes for meta-oe. They're all of the
> same type, and could be done quickly.
>
> The remaining failures from the list are:
> - folks (not in meta-oe layers)
> - minidlna, libvncserver, mpd, opencv (ffmpeg 5.0 api errors, each recipe
> needs individual attention)
>
> Alex
>
> On Fri, 21 Jan 2022 at 20:35, Alexander Kanavin via lists.openembedded.org
> <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>
>> I'm working on these now.
>>
>> Alex
>>
>>
>> On Thu, 20 Jan 2022 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> there are bunch of failures in meta-openembedded as well  see
>>>
>>> https://errors.yoctoproject.org/Errors/Build/138784/
>>>
>>> On Tue, Jan 18, 2022 at 12:48 PM Alexander Kanavin
>>> <alex.kanavin@gmail.com> wrote:
>>> >
>>> > This update breaks gst-libav, and I have a patch in the works that
>>> fixes that too :)
>>> >
>>> > Alex
>>> >
>>> > On Tue, 18 Jan 2022 at 19:50, Marek Vasut <marex@denx.de> wrote:
>>> >>
>>> >> Update ffmpeg to 5.0 , release notes and changelog below:
>>> >>
>>> https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES
>>> >> https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0
>>> >>
>>> >> The avresample has been removed before 5.0 release in ffmpeg commit
>>> >> 420cedd497 ("libavresample: Remove deprecated library")
>>> >>
>>> >> The ffmpeg 5.0 might be an LTS release, see:
>>> >> http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0
>>> >>
>>> >> Signed-off-by: Marek Vasut <marex@denx.de>
>>> >> Cc: Alexander Kanavin <alex@linutronix.de>
>>> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> >> ---
>>> >>  .../ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb}            | 9
>>> ++-------
>>> >>  1 file changed, 2 insertions(+), 7 deletions(-)
>>> >>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb =>
>>> ffmpeg_5.0.bb} (95%)
>>> >>
>>> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
>>> b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>>> >> similarity index 95%
>>> >> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
>>> >> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>>> >> index 3ba07c31d6..4ba5ff4537 100644
>>> >> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
>>> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
>>> >> @@ -11,7 +11,6 @@ LICENSE:libavcodec =
>>> "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LG
>>> >>  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
>>> 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >>  LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
>>> 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >>  LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
>>> 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >> -LICENSE:libavresample = "${@bb.utils.contains('PACKAGECONFIG',
>>> 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >>  LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
>>> 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >>  LICENSE:libpostproc = "GPLv2+"
>>> >>  LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG',
>>> 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
>>> >> @@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>> >>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>>> >>
>>>  file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>>> >>             "
>>> >> -SRC_URI[sha256sum] =
>>> "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
>>> >> +SRC_URI[sha256sum] =
>>> "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
>>> >>
>>> >>  # Build fails when thumb is enabled:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
>>> >>  ARM_INSTRUCTION_SET:armv4 = "arm"
>>> >> @@ -41,7 +40,7 @@ DEPENDS = "nasm-native"
>>> >>
>>> >>  inherit autotools pkgconfig
>>> >>
>>> >> -PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample
>>> swscale postproc avresample \
>>> >> +PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample
>>> swscale postproc \
>>> >>                     alsa bzlib lzma pic pthreads shared theora zlib \
>>> >>                     ${@bb.utils.contains('AVAILTUNES', 'mips32r2',
>>> 'mips32r2', '', d)} \
>>> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>>> 'xv xcb', '', d)}"
>>> >> @@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =
>>> "--enable-avformat,--disable-avformat"
>>> >>  PACKAGECONFIG[swresample] =
>>> "--enable-swresample,--disable-swresample"
>>> >>  PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
>>> >>  PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
>>> >> -PACKAGECONFIG[avresample] =
>>> "--enable-avresample,--disable-avresample"
>>> >>
>>> >>  # features to support
>>> >>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
>>> >> @@ -153,7 +151,6 @@ PACKAGES =+ "libavcodec \
>>> >>               libavdevice \
>>> >>               libavfilter \
>>> >>               libavformat \
>>> >> -             libavresample \
>>> >>               libavutil \
>>> >>               libpostproc \
>>> >>               libswresample \
>>> >> @@ -163,7 +160,6 @@ FILES:libavcodec = "${libdir}/libavcodec${SOLIBS}"
>>> >>  FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
>>> >>  FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
>>> >>  FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
>>> >> -FILES:libavresample = "${libdir}/libavresample${SOLIBS}"
>>> >>  FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
>>> >>  FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
>>> >>  FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
>>> >> @@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
>>> >> -INSANE_SKIP:${MLPREFIX}libavresample = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
>>> >>  INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
>>> >> --
>>> >> 2.34.1
>>> >>
>>> >>
>>> >>
>>> >>
>>> >
>>> >
>>> >
>>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160851):
> https://lists.openembedded.org/g/openembedded-core/message/160851
> Mute This Topic: https://lists.openembedded.org/mt/88516624/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e380e105d632b0d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I have sent additional patches for the four ffmpeg re=
lated issues.</div><div><br></div><div>Alex<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 21 Jan 2022 =
at 22:41, Alexander Kanavin via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div=
>I have now sent out the meson 0.61 fixes for meta-oe. They&#39;re all of t=
he same type, and could be done quickly.</div><div><br></div><div>The remai=
ning failures from the list are:</div><div>- folks (not in meta-oe layers)<=
/div><div>- minidlna, libvncserver, mpd, opencv (ffmpeg 5.0 api errors, eac=
h recipe needs individual attention)</div><div><br></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 21 Jan 2022 at 20:35, Alexander Kanavin via <a href=3D"http://list=
s.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;alex.k=
anavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_bla=
nk">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div>I&#39;m working on these now.</div><div><br></div><div>Alex<br></div><=
/div><br></div><div><br></div><div>On Thu, 20 Jan 2022 at 21:15, Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">there are bunch of failures in meta-openembedded a=
s well=C2=A0 see<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Build/138784/" rel=3D"nor=
eferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Build/138=
784/</a><br>
<br>
On Tue, Jan 18, 2022 at 12:48 PM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This update breaks gst-libav, and I have a patch in the works that fix=
es that too :)<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt; On Tue, 18 Jan 2022 at 19:50, Marek Vasut &lt;<a href=3D"mailto:marex@=
denx.de" target=3D"_blank">marex@denx.de</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Update ffmpeg to 5.0 , release notes and changelog below:<br>
&gt;&gt; <a href=3D"https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/head=
s/release/5.0:/RELEASE_NOTES" rel=3D"noreferrer" target=3D"_blank">https://=
git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES=
</a><br>
&gt;&gt; <a href=3D"https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0"=
 rel=3D"noreferrer" target=3D"_blank">https://git.ffmpeg.org/gitweb/ffmpeg.=
git/shortlog/n5.0</a><br>
&gt;&gt;<br>
&gt;&gt; The avresample has been removed before 5.0 release in ffmpeg commi=
t<br>
&gt;&gt; 420cedd497 (&quot;libavresample: Remove deprecated library&quot;)<=
br>
&gt;&gt;<br>
&gt;&gt; The ffmpeg 5.0 might be an LTS release, see:<br>
&gt;&gt; <a href=3D"http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0" rel=
=3D"noreferrer" target=3D"_blank">http://www.jbkempf.com/blog/post/2022/FFm=
peg-5.0</a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" ta=
rget=3D"_blank">marex@denx.de</a>&gt;<br>
&gt;&gt; Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" ta=
rget=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; Cc: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfound=
ation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../ffmpeg/{<a href=3D"http://ffmpeg_4.4.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">ffmpeg_4.4.1.bb</a> =3D&gt; <a href=3D"http://ffmpe=
g_5.0.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a>}=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ++-------<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 7 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-multimedia/ffmpeg/{<a href=3D"http://ffm=
peg_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a> =3D&=
gt; <a href=3D"http://ffmpeg_5.0.bb" rel=3D"noreferrer" target=3D"_blank">f=
fmpeg_5.0.bb</a>} (95%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmp=
eg_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a> b/met=
a/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.bb" rel=3D"norefer=
rer" target=3D"_blank">ffmpeg_5.0.bb</a><br>
&gt;&gt; similarity index 95%<br>
&gt;&gt; rename from meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpe=
g_4.4.1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a><br>
&gt;&gt; rename to meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a><br>
&gt;&gt; index 3ba07c31d6..4ba5ff4537 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_4.4.=
1.bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_4.4.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.bb</a><br>
&gt;&gt; @@ -11,7 +11,6 @@ LICENSE:libavcodec =3D &quot;${@bb.utils.contain=
s(&#39;PACKAGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LG<br>
&gt;&gt;=C2=A0 LICENSE:libavdevice =3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&q=
uot;<br>
&gt;&gt;=C2=A0 LICENSE:libavfilter =3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&q=
uot;<br>
&gt;&gt;=C2=A0 LICENSE:libavformat =3D &quot;${@bb.utils.contains(&#39;PACK=
AGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&q=
uot;<br>
&gt;&gt; -LICENSE:libavresample =3D &quot;${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quot=
;<br>
&gt;&gt;=C2=A0 LICENSE:libavutil =3D &quot;${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}&quo=
t;<br>
&gt;&gt;=C2=A0 LICENSE:libpostproc =3D &quot;GPLv2+&quot;<br>
&gt;&gt;=C2=A0 LICENSE:libswresample =3D &quot;${@bb.utils.contains(&#39;PA=
CKAGECONFIG&#39;, &#39;gpl&#39;, &#39;GPLv2+&#39;, &#39;LGPLv2.1+&#39;, d)}=
&quot;<br>
&gt;&gt; @@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;=
md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt;&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/releases=
/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmpeg.=
org/releases/${BP}.tar.xz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-libavut=
il-include-assembly-with-full-path-from-sourc.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;eadbad9e9ab30b25f5520fbfde99fae4a92a=
1ae3c0257a8d68569a4651e30e02&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;51e919f7d205062c0fd4fae6243a84850391=
115104ccf1efc451733bc0ac7298&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Build fails when thumb is enabled: <a href=3D"https://bugz=
illa.yoctoproject.org/show_bug.cgi?id=3D7717" rel=3D"noreferrer" target=3D"=
_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D7717</a><br>
&gt;&gt;=C2=A0 ARM_INSTRUCTION_SET:armv4 =3D &quot;arm&quot;<br>
&gt;&gt; @@ -41,7 +40,7 @@ DEPENDS =3D &quot;nasm-native&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;&gt;<br>
&gt;&gt; -PACKAGECONFIG ??=3D &quot;avdevice avfilter avcodec avformat swre=
sample swscale postproc avresample \<br>
&gt;&gt; +PACKAGECONFIG ??=3D &quot;avdevice avfilter avcodec avformat swre=
sample swscale postproc \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0alsa bzlib lzma pic pthreads shared theora zlib \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${@bb.utils.contains(&#39;AVAILTUNES&#39;, &#39;mips32r2&#39;, &#=
39;mips32r2&#39;, &#39;&#39;, d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#=
39;xv xcb&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; @@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =3D &quot;--enable-avfor=
mat,--disable-avformat&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[swresample] =3D &quot;--enable-swresample,--di=
sable-swresample&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[swscale] =3D &quot;--enable-swscale,--disable-=
swscale&quot;<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[postproc] =3D &quot;--enable-postproc,--disabl=
e-postproc&quot;<br>
&gt;&gt; -PACKAGECONFIG[avresample] =3D &quot;--enable-avresample,--disable=
-avresample&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # features to support<br>
&gt;&gt;=C2=A0 PACKAGECONFIG[alsa] =3D &quot;--enable-alsa,--disable-alsa,a=
lsa-lib&quot;<br>
&gt;&gt; @@ -153,7 +151,6 @@ PACKAGES =3D+ &quot;libavcodec \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavdevice =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavfilter =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavformat =
\<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavresample \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libavutil \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libpostproc =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libswresampl=
e \<br>
&gt;&gt; @@ -163,7 +160,6 @@ FILES:libavcodec =3D &quot;${libdir}/libavcode=
c${SOLIBS}&quot;<br>
&gt;&gt;=C2=A0 FILES:libavdevice =3D &quot;${libdir}/libavdevice${SOLIBS}&q=
uot;<br>
&gt;&gt;=C2=A0 FILES:libavfilter =3D &quot;${libdir}/libavfilter${SOLIBS}&q=
uot;<br>
&gt;&gt;=C2=A0 FILES:libavformat =3D &quot;${libdir}/libavformat${SOLIBS}&q=
uot;<br>
&gt;&gt; -FILES:libavresample =3D &quot;${libdir}/libavresample${SOLIBS}&qu=
ot;<br>
&gt;&gt;=C2=A0 FILES:libavutil =3D &quot;${libdir}/libavutil${SOLIBS}&quot;=
<br>
&gt;&gt;=C2=A0 FILES:libpostproc =3D &quot;${libdir}/libpostproc${SOLIBS}&q=
uot;<br>
&gt;&gt;=C2=A0 FILES:libswresample =3D &quot;${libdir}/libswresample${SOLIB=
S}&quot;<br>
&gt;&gt; @@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice =3D &quot;t=
extrel&quot;<br>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libavfilter =3D &quot;textrel&quot;<b=
r>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libavformat =3D &quot;textrel&quot;<b=
r>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libavutil =3D &quot;textrel&quot;<br>
&gt;&gt; -INSANE_SKIP:${MLPREFIX}libavresample =3D &quot;textrel&quot;<br>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libswscale =3D &quot;textrel&quot;<br=
>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libswresample =3D &quot;textrel&quot;=
<br>
&gt;&gt;=C2=A0 INSANE_SKIP:${MLPREFIX}libpostproc =3D &quot;textrel&quot;<b=
r>
&gt;&gt; --<br>
&gt;&gt; 2.34.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>
<br>
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160851): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160851" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160851</a><br>
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

--000000000000e380e105d632b0d9--

