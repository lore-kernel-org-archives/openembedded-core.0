Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83531C677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:00:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.164651.1673870426764686859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:00:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i7QQ2Ils;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id r2so27242796wrv.7
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 04:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NjYR1AedJCzHD/sN+jkAzFb2UFDn/LgIwurFsoNy17w=;
        b=i7QQ2IlsP0VWAD4PUYv0BpN3GWRjRBYGuEVQhirGWSoyIg1i0S1OF1qGIB3qAKwxZw
         VXy2TE3XQF2F5hE/WvuqhjYF9OxKU8fI67JZ5cdppnRNUMpkpCchT/BviCsMNSFiv+f7
         gPoHgKyMMdlm28AKRrHkrIZ0oMHJLeJjvtadmrvWaMSKNDf78CM9Yz24JakjAvQby/PO
         9nBx5WqxTiKsh6tOCasmuhjuzW37QzKlqM3CjXjFmP7tjaxfuVVJqlPmC2hF28uoV/UN
         6UlT26bV0D19EW+MJMmDB6MmaVx6k95y5a+XuMCsed54f7ixgsZ5f43DNPM8gn2McovD
         +IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NjYR1AedJCzHD/sN+jkAzFb2UFDn/LgIwurFsoNy17w=;
        b=gCFlhwLD9sRf4JL+70OrejGaRuY6hPo5tsrJXh2kFyOPnmKQvivA/BaV85cWpaRwFC
         +Ln8hxHW4gjexofEaA6TSpkm32RLCVhIRdsDKyEF0j/RtxaALx5p277qfvAkusOKqv+f
         Bp5+zDoGj4An9viL/dganLfBQD85C4n/vkdMj9gTx4Ja2P2uVeWNjmMKRpLgtUhUo7ne
         C8CwaXvroGQ4q7gyMreovg8VDDmxa9hgJtriq9UWukhxuA/3ItcaaTeHZ8Fdv399Hljw
         fa7ilBnb+6p+o2M711aX6/M4BpgXEv005BBH/AD7oqHSRj3rEUzGH/2rnQzLGW+ht3vn
         8aJA==
X-Gm-Message-State: AFqh2krBGvJisBz/2vxc8cUKZXfPPofPMYpJIOkyB0vkgA3p84xf8Kti
	edJyoKjjGo0ENKMKmlIq0YbBhpkz6T+NkvWhfo4=
X-Google-Smtp-Source: AMrXdXue2qdn682ilWbwFUz6F04BVv4WB/PnmhFCRcBWomr+Z/Dxa2PVwyCtKHYpkhhnjxPvcpWws/8cCk4JxjgPotE=
X-Received: by 2002:adf:f712:0:b0:2bd:dac9:f25b with SMTP id
 r18-20020adff712000000b002bddac9f25bmr340356wrp.129.1673870424894; Mon, 16
 Jan 2023 04:00:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1673490673.git.steve@sakoman.com> <30119a4797c89b8b501246c4266b08a62467833d.1673490673.git.steve@sakoman.com>
In-Reply-To: <30119a4797c89b8b501246c4266b08a62467833d.1673490673.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jan 2023 13:00:13 +0100
Message-ID: <CA+chaQf9XVD=DzD_+X7qvnROzg9k7198LzYbJfC5jgZ=UW74HQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 03/11] ffmpeg: fix for CVE-2022-3109
To: Steve Sakoman <steve@sakoman.com>, narpat.mali@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000013705005f2605496"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175978

--00000000000013705005f2605496
Content-Type: text/plain; charset="UTF-8"

This patch doesn't apply cleanly on ffmpeg-5.0.1:

ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:

Applying patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
patching file libavcodec/vp3.c
Hunk #1 succeeded at 2677 with fuzz 1 (offset -2 lines).


The context lines in the patches can be updated with devtool:

    devtool modify ffmpeg
    devtool finish --force-patch-refresh ffmpeg <layer_path>

Don't forget to review changes done by devtool!

ERROR: ffmpeg-5.0.1-r0 do_patch: QA Issue: Patch log indicates that patches
do not apply cleanly. [patch-fuzz]

Narpat: Should I send a fix or will you handle that?

On Thu, Jan 12, 2023 at 3:33 AM Steve Sakoman <steve@sakoman.com> wrote:

> From: Narpat Mali <narpat.mali@windriver.com>
>
> An issue was discovered in the FFmpeg package, where vp3_decode_frame in
> libavcodec/vp3.c lacks check of
> the return value of av_malloc() and will cause a null pointer dereference,
> impacting availability.
>
> CVE: CVE-2022-3109
>
> Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568
> ]
>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  ...-vp3-Add-missing-check-for-av_malloc.patch | 44 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |  3 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
>
> diff --git
> a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> new file mode 100644
> index 0000000000..94858a6cdd
> --- /dev/null
> +++
> b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch
> @@ -0,0 +1,44 @@
> +From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001
> +From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> +Date: Tue, 15 Feb 2022 17:58:08 +0800
> +Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc
> +
> +Since the av_malloc() may fail and return NULL pointer,
> +it is needed that the 's->edge_emu_buffer' should be checked
> +whether the new allocation is success.
> +
> +Fixes: d14723861b ("VP3: fix decoding of videos with stride > 2048")
> +Reviewed-by: Peter Ross <pross@xvid.org>
> +Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> +
> +CVE: CVE-2022-3109
> +
> +Upstream-Status: Backport [
> https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af342b37ac4c568
> ]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + libavcodec/vp3.c | 7 ++++++-
> + 1 file changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c
> +index e9ab54d736..e2418eb6fa 100644
> +--- a/libavcodec/vp3.c
> ++++ b/libavcodec/vp3.c
> +@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,
> +                                         AV_GET_BUFFER_FLAG_REF)) < 0)
> +         goto error;
> +
> +-    if (!s->edge_emu_buffer)
> ++    if (!s->edge_emu_buffer) {
> +         s->edge_emu_buffer = av_malloc(9 *
> FFABS(s->current_frame.f->linesize[0]));
> ++        if (!s->edge_emu_buffer) {
> ++            ret = AVERROR(ENOMEM);
> ++            goto error;
> ++        }
> ++    }
> +
> +     if (s->keyframe) {
> +         if (!s->theora) {
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> index 95b4bf50ac..c5bebe9c2d 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
> @@ -26,7 +26,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz
> \
>
> file://0001-libavutil-include-assembly-with-full-path-from-sourc.patch \
>
> file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch \
>
> file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch \
> -           "
> +           file://0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch \
> +          "
>
>  SRC_URI[sha256sum] =
> "ef2efae259ce80a240de48ec85ecb062cecca26e4352ffb3fda562c21a93007b"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175776):
> https://lists.openembedded.org/g/openembedded-core/message/175776
> Mute This Topic: https://lists.openembedded.org/mt/96215555/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000013705005f2605496
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch doesn&#39;t apply cleanly on ffmpeg-5.0.1:<div>=
<br></div><div>ERROR: ffmpeg-5.0.1-r0 do_patch: Fuzz detected:<br><br>Apply=
ing patch 0001-avcodec-vp3-Add-missing-check-for-av_malloc.patch<br>patchin=
g file libavcodec/vp3.c<br>Hunk #1 succeeded at 2677 with fuzz 1 (offset -2=
 lines).<br><br><br>The context lines in the patches can be updated with de=
vtool:<br><br>=C2=A0 =C2=A0 devtool modify ffmpeg<br>=C2=A0 =C2=A0 devtool =
finish --force-patch-refresh ffmpeg &lt;layer_path&gt;<br><br>Don&#39;t for=
get to review changes done by devtool!<br><br>ERROR: ffmpeg-5.0.1-r0 do_pat=
ch: QA Issue: Patch log indicates that patches do not apply cleanly. [patch=
-fuzz]<br></div><div><br></div><div>Narpat: Should I send a fix or will you=
 handle that?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Jan 12, 2023 at 3:33 AM Steve Sakoman &lt;<a hre=
f=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">From: Narpat Mali &lt;<a hr=
ef=3D"mailto:narpat.mali@windriver.com" target=3D"_blank">narpat.mali@windr=
iver.com</a>&gt;<br>
<br>
An issue was discovered in the FFmpeg package, where vp3_decode_frame in li=
bavcodec/vp3.c lacks check of<br>
the return value of av_malloc() and will cause a null pointer dereference, =
impacting availability.<br>
<br>
CVE: CVE-2022-3109<br>
<br>
Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FFmpeg/comm=
it/656cb0450aeb73b25d7d26980af342b37ac4c568" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af3=
42b37ac4c568</a>]<br>
<br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0...-vp3-Add-missing-check-for-av_malloc.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a> |=C2=A0 3 +-<br>
=C2=A02 files changed, 46 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec=
-vp3-Add-missing-check-for-av_malloc.patch<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-mis=
sing-check-for-av_malloc.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001=
-avcodec-vp3-Add-missing-check-for-av_malloc.patch<br>
new file mode 100644<br>
index 0000000000..94858a6cdd<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-vp3-Add-missing-ch=
eck-for-av_malloc.patch<br>
@@ -0,0 +1,44 @@<br>
+From 656cb0450aeb73b25d7d26980af342b37ac4c568 Mon Sep 17 00:00:00 2001<br>
+From: Jiasheng Jiang &lt;<a href=3D"mailto:jiasheng@iscas.ac.cn" target=3D=
"_blank">jiasheng@iscas.ac.cn</a>&gt;<br>
+Date: Tue, 15 Feb 2022 17:58:08 +0800<br>
+Subject: [PATCH] avcodec/vp3: Add missing check for av_malloc<br>
+<br>
+Since the av_malloc() may fail and return NULL pointer,<br>
+it is needed that the &#39;s-&gt;edge_emu_buffer&#39; should be checked<br=
>
+whether the new allocation is success.<br>
+<br>
+Fixes: d14723861b (&quot;VP3: fix decoding of videos with stride &gt; 2048=
&quot;)<br>
+Reviewed-by: Peter Ross &lt;<a href=3D"mailto:pross@xvid.org" target=3D"_b=
lank">pross@xvid.org</a>&gt;<br>
+Signed-off-by: Jiasheng Jiang &lt;<a href=3D"mailto:jiasheng@iscas.ac.cn" =
target=3D"_blank">jiasheng@iscas.ac.cn</a>&gt;<br>
+<br>
+CVE: CVE-2022-3109<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/FFmpeg/FFmpeg/com=
mit/656cb0450aeb73b25d7d26980af342b37ac4c568" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/FFmpeg/FFmpeg/commit/656cb0450aeb73b25d7d26980af=
342b37ac4c568</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com=
" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
+---<br>
+ libavcodec/vp3.c | 7 ++++++-<br>
+ 1 file changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/libavcodec/vp3.c b/libavcodec/vp3.c<br>
+index e9ab54d736..e2418eb6fa 100644<br>
+--- a/libavcodec/vp3.c<br>
++++ b/libavcodec/vp3.c<br>
+@@ -2679,8 +2679,13 @@ static int vp3_decode_frame(AVCodecContext *avctx,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AV=
_GET_BUFFER_FLAG_REF)) &lt; 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
+ <br>
+-=C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer)<br>
++=C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;edge_emu_buffer =3D av_malloc(9 * =
FFABS(s-&gt;current_frame.f-&gt;linesize[0]));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!s-&gt;edge_emu_buffer) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D AVERROR(ENOMEM);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (s-&gt;keyframe) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s-&gt;theora) {<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a> b/meta/recipes=
-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ffmpeg_5.0.1.bb</a><br>
index 95b4bf50ac..c5bebe9c2d 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_5.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_5.0.1.bb</a><br>
@@ -26,7 +26,8 @@ SRC_URI =3D &quot;<a href=3D"https://www.ffmpeg.org/relea=
ses/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://www.ffmp=
eg.org/releases/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libavutil-include-ass=
embly-with-full-path-from-sourc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avcodec-rpzaenc-stop-=
accessing-out-of-bounds-frame.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avcodec-smcenc-stop-a=
ccessing-out-of-bounds-frame.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-avcodec-vp3-Add-missi=
ng-check-for-av_malloc.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ef2efae259ce80a240de48ec85ecb062cecca26e=
4352ffb3fda562c21a93007b&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175776): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175776" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175776</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96215555/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96215555/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000013705005f2605496--

