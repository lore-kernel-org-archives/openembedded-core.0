Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8706DC433F5
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 19:35:44 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web12.564.1642793743920045931
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XSOslapU;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id c36so18683486uae.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 11:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMZPKdCW2P4cjLw8UQ1mSE6V0e8++upHa0wAP7ZqlgU=;
        b=XSOslapUbm4GRIE5noRqYmNRMYhy+Yzq2XvNxCqbv0UDUxTY/2tdyd68UfTPwPtWl9
         eu1F+z1aext2mp1OnjrRKMuOacjF3ShaZcIoJzr3+qHA9OKMw38Bbp16C4T/FxnQCcSC
         YNUEP/FvD1UNzIeuylADj1DfHPif7F0863l/pEt54bxOrpTl3Isog2/KyjvVbnxslHjW
         dRHAsN8hrAi0mCFOowi9RvVBFc/of2lo9NlK8lGgerHMbw53+LVraOqWyI4NDSC3N0IC
         BaWeiyo0cg3VsDyKnPFUgmu8pJz0BezMBlwN9JWEQG94ZvSo+CzWqcdkmUi9fqWhWv45
         KkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMZPKdCW2P4cjLw8UQ1mSE6V0e8++upHa0wAP7ZqlgU=;
        b=pxyplXI3RY0+6bUYetIgHr5J7lUNgjhgFPI0DMnyG3RqvjroJu5zYi9KM59tcr/mSh
         PhWBn8cZHgV28ef6kAS+/mAQ9HIrHM2rp5KN/bWiabm1/dffZ3FCJLXdgTLQPNvBV6Oo
         PpuhqoiQeKYPV8FR332ldhp9MdeY5Pg1hhbVmxfjjcMyxa7331u/19s0BB8UEUK7MFbv
         gMbz78FSylBBwdzE7pQZ+mLN2zJyp/lH42Y+US7ZLR5xMX73BAGa/lvDBU5W2Pbj8mxR
         XiUFOU7V7CxFfa/aoKU2yvv3euooCovlJ9z7iK/8MDldC+G5xeoDb3Fv6NIUdqdmcx0r
         MS7A==
X-Gm-Message-State: AOAM533NR25F5fE58l72wJI3IP8pFlCIkDziQuyXc1s7fQ7vcY4WkWgl
	B/v9j/B5hlRpE0hr/io2+oNNCoM7bi/0/05A6hI=
X-Google-Smtp-Source: 
 ABdhPJz2yA6+QMaQviuzEmjvXExpU21sOqOWjjBhB76gYf5fFyHDS0CpBrOd0rsPc1GqLT5whZLsjxYmS12BmE6y200=
X-Received: by 2002:a9f:3763:: with SMTP id a32mr2367782uae.93.1642793741585;
 Fri, 21 Jan 2022 11:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20220118185043.1778569-1-marex@denx.de>
 <CANNYZj8mJNZW=N-cgSzGGR8Av7Lij=NFzpK6cLWpyMjyHP2Oww@mail.gmail.com>
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srtAJi+xvqJ1qNoi9rnCKpeN226r76o6AY=CMXe3x24Lg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Jan 2022 20:35:30 +0100
Message-ID: 
 <CANNYZj_d3VqM6=Rw-TB5XwpUT0=RYeyHsGJ6TnyRyzb-Z8pqcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Update from 4.4.1 to 5.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000068114e05d61cb9cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 19:35:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160850

--00000000000068114e05d61cb9cd
Content-Type: text/plain; charset="UTF-8"

I'm working on these now.

Alex


On Thu, 20 Jan 2022 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:

> there are bunch of failures in meta-openembedded as well  see
>
> https://errors.yoctoproject.org/Errors/Build/138784/
>
> On Tue, Jan 18, 2022 at 12:48 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This update breaks gst-libav, and I have a patch in the works that fixes
> that too :)
> >
> > Alex
> >
> > On Tue, 18 Jan 2022 at 19:50, Marek Vasut <marex@denx.de> wrote:
> >>
> >> Update ffmpeg to 5.0 , release notes and changelog below:
> >>
> https://git.ffmpeg.org/gitweb/ffmpeg.git/blob/refs/heads/release/5.0:/RELEASE_NOTES
> >> https://git.ffmpeg.org/gitweb/ffmpeg.git/shortlog/n5.0
> >>
> >> The avresample has been removed before 5.0 release in ffmpeg commit
> >> 420cedd497 ("libavresample: Remove deprecated library")
> >>
> >> The ffmpeg 5.0 might be an LTS release, see:
> >> http://www.jbkempf.com/blog/post/2022/FFmpeg-5.0
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >> Cc: Alexander Kanavin <alex@linutronix.de>
> >> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> >> ---
> >>  .../ffmpeg/{ffmpeg_4.4.1.bb => ffmpeg_5.0.bb}            | 9 ++-------
> >>  1 file changed, 2 insertions(+), 7 deletions(-)
> >>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.4.1.bb =>
> ffmpeg_5.0.bb} (95%)
> >>
> >> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> >> similarity index 95%
> >> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> >> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> >> index 3ba07c31d6..4ba5ff4537 100644
> >> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.1.bb
> >> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.bb
> >> @@ -11,7 +11,6 @@ LICENSE:libavcodec =
> "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LG
> >>  LICENSE:libavdevice = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >>  LICENSE:libavfilter = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >>  LICENSE:libavformat = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >> -LICENSE:libavresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >>  LICENSE:libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >>  LICENSE:libpostproc = "GPLv2+"
> >>  LICENSE:libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> 'GPLv2+', 'LGPLv2.1+', d)}"
> >> @@ -26,7 +25,7 @@ LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >>  SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> >>
>  file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
> >>             "
> >> -SRC_URI[sha256sum] =
> "eadbad9e9ab30b25f5520fbfde99fae4a92a1ae3c0257a8d68569a4651e30e02"
> >> +SRC_URI[sha256sum] =
> "51e919f7d205062c0fd4fae6243a84850391115104ccf1efc451733bc0ac7298"
> >>
> >>  # Build fails when thumb is enabled:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
> >>  ARM_INSTRUCTION_SET:armv4 = "arm"
> >> @@ -41,7 +40,7 @@ DEPENDS = "nasm-native"
> >>
> >>  inherit autotools pkgconfig
> >>
> >> -PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample
> swscale postproc avresample \
> >> +PACKAGECONFIG ??= "avdevice avfilter avcodec avformat swresample
> swscale postproc \
> >>                     alsa bzlib lzma pic pthreads shared theora zlib \
> >>                     ${@bb.utils.contains('AVAILTUNES', 'mips32r2',
> 'mips32r2', '', d)} \
> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xv
> xcb', '', d)}"
> >> @@ -54,7 +53,6 @@ PACKAGECONFIG[avformat] =
> "--enable-avformat,--disable-avformat"
> >>  PACKAGECONFIG[swresample] = "--enable-swresample,--disable-swresample"
> >>  PACKAGECONFIG[swscale] = "--enable-swscale,--disable-swscale"
> >>  PACKAGECONFIG[postproc] = "--enable-postproc,--disable-postproc"
> >> -PACKAGECONFIG[avresample] = "--enable-avresample,--disable-avresample"
> >>
> >>  # features to support
> >>  PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
> >> @@ -153,7 +151,6 @@ PACKAGES =+ "libavcodec \
> >>               libavdevice \
> >>               libavfilter \
> >>               libavformat \
> >> -             libavresample \
> >>               libavutil \
> >>               libpostproc \
> >>               libswresample \
> >> @@ -163,7 +160,6 @@ FILES:libavcodec = "${libdir}/libavcodec${SOLIBS}"
> >>  FILES:libavdevice = "${libdir}/libavdevice${SOLIBS}"
> >>  FILES:libavfilter = "${libdir}/libavfilter${SOLIBS}"
> >>  FILES:libavformat = "${libdir}/libavformat${SOLIBS}"
> >> -FILES:libavresample = "${libdir}/libavresample${SOLIBS}"
> >>  FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
> >>  FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
> >>  FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
> >> @@ -175,7 +171,6 @@ INSANE_SKIP:${MLPREFIX}libavdevice = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libavfilter = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libavformat = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
> >> -INSANE_SKIP:${MLPREFIX}libavresample = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
> >>  INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#160678):
> https://lists.openembedded.org/g/openembedded-core/message/160678
> > Mute This Topic: https://lists.openembedded.org/mt/88516624/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000068114e05d61cb9cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr"><div>I&#39;m working on these now.</=
div><div><br></div><div>Alex<br></div></div><br></div><div><br></div><div>O=
n Thu, 20 Jan 2022 at 21:15, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com">raj.khem@gmail.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">there are bunch of failures i=
n meta-openembedded as well=C2=A0 see<br>
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
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#160678): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/160678" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/160678</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88516624=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/88516624/1997914</a><br>
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

--00000000000068114e05d61cb9cd--

