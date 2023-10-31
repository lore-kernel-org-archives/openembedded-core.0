Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12F3C4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 23:40:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.10581.1698795597485898706
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 16:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S6nAr10z;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4084de32db5so50922005e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698795596; x=1699400396; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/9pJylPUkxDFx5CVSpDjpMw7S1Vd0POAk/fPv3ZTaP8=;
        b=S6nAr10zPwfd0hi6qMHwdLqqUDj/F4ozfMfVukwujqLtSR8Pi+g/qamLG+2y8R4tA4
         FYEDh1EmwoVNaQqVLXEns48JGCAVLF02BQnGnJDO0/UwRuwggRDzHXcgrstPhMj+p28H
         war7fxHC37Tyc5i1eYelTJDK73QCUFc/Ceg3PwXawU6HVPCmQH1wD5kwmCqVma3WjhPF
         MRGfEJje4q0uAeqbLx1bPJtB+XyUyLoA6QhC0FK9YLTnpt9biWHohx0x0KaJFB1byXKr
         E6LNEewAVeJZcJXpGe7rl1Z8OyUfHa7iEspqI1fVM9dYWT+YG255PbCOXg0fN2b+CK3W
         79dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698795596; x=1699400396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9pJylPUkxDFx5CVSpDjpMw7S1Vd0POAk/fPv3ZTaP8=;
        b=mvEQuUnJOd1wXoaYc1+Q15WZctL1hbQmriLHauM012QxbBEullLRehxBG9S8lXVX8p
         UuYglbxBfNT3ylWssO50+b/1nCT4HOxxeGd285PpI3JqL3zPaBpSoVmzYdau27e30G/X
         WuvloF/MTwqUVVNM12wiD/cBP+q9DJl4OlyK54J7xMZNI/4FeeM/iyoxuQEFi36lzsRP
         kqx4xovCrAfxY6Gbbt4ij8/++Km2x+367O5ywNX7R4zpscVkbzh5SBMV1mMdWxjRZlJE
         tX0Axrgx78gQv7XvCoonQRMTuFqLd+Tdztkgg3uVBauO4CRh9NdC2hmo8B98LkYjVGPh
         q/bQ==
X-Gm-Message-State: AOJu0YyjuK3gdO8xNrrdoF5NMJZ/a/etRZaPADTYQdmQMNdMZ5HcVgpd
	ujxitHlQdRntLJTOtptElF0A7nFeqC8Bo2BFXmo=
X-Google-Smtp-Source: AGHT+IGs5zLM0Z55EwZ4iYAW0aGzndEZAKkrL0THf7KYnr7V2yu3S/3V4P89Mwv/lQuRfWOUgaNTEn9bpt3zCg84O1w=
X-Received: by 2002:a5d:47cf:0:b0:32f:7db1:22f0 with SMTP id
 o15-20020a5d47cf000000b0032f7db122f0mr9040327wrc.20.1698795595391; Tue, 31
 Oct 2023 16:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1698789786.git.steve@sakoman.com> <4dcd5e0a0bb43c23850e3a711fc7e2230575d245.1698789786.git.steve@sakoman.com>
In-Reply-To: <4dcd5e0a0bb43c23850e3a711fc7e2230575d245.1698789786.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 1 Nov 2023 00:39:42 +0100
Message-ID: <CA+chaQeAGGEAYu8tnrsgyEN39+TNtYi6HJoGc4bfyDGjBiTpnQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 3/3] libwebp: Fix CVE-2023-4863
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000002699606090bac4a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 23:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189889

--00000000000002699606090bac4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm surprised this one does apply in kirkstone as there is this security
issue already fixed as 2023-5129 (see dunfell commit
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&id=3D7dc=
e529515baa843ba3e5c89b2ad605b9845c59b
and
a bit more details in
https://lists.openembedded.org/g/openembedded-core/message/189262 )

Is
https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26f0=
b006037c520
really related to CVE-2023-4863 ?

On Tue, Oct 31, 2023 at 11:05=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Heap buffer overflow in WebP in Google Chrome prior to
> 116.0.5845.187 allowed a remote attacker to perform an
> out of bounds memory write via a crafted HTML page.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-4863
> https://security-tracker.debian.org/tracker/CVE-2023-4863
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../webp/files/CVE-2023-4863.patch            | 53 +++++++++++++++++++
>  meta/recipes-multimedia/webp/libwebp_1.2.4.bb |  1 +
>  2 files changed, 54 insertions(+)
>  create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.patc=
h
>
> diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> new file mode 100644
> index 0000000000..2b1817822c
> --- /dev/null
> +++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch
> @@ -0,0 +1,53 @@
> +From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Mon, 11 Sep 2023 16:06:08 +0200
> +Subject: [PATCH] Fix invalid incremental decoding check.
> +
> +The first condition is only necessary if we have not read enough
> +(enough being defined by src_last, not src_end which is the end
> +of the image).
> +The second condition now fits the comment below: "if not
> +incremental, and we are past the end of buffer".
> +
> +BUG=3Doss-fuzz:62136
> +
> +Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f
> +
> +CVE: CVE-2023-4863
> +
> +Upstream-Status: Backport [
> https://github.com/webmproject/libwebp/commit/95ea5226c870449522240ccff26=
f0b006037c520
> ]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + src/dec/vp8l_dec.c | 15 +++++++++++++--
> + 1 file changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c
> +index 186b0b2..59a9e64 100644
> +--- a/src/dec/vp8l_dec.c
> ++++ b/src/dec/vp8l_dec.c
> +@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const dec=
,
> uint32_t* const data,
> +   }
> +
> +   br->eos_ =3D VP8LIsEndOfStream(br);
> +-  if (dec->incremental_ && br->eos_ && src < src_end) {
> ++  // In incremental decoding:
> ++  // br->eos_ && src < src_last: if 'br' reached the end of the buffer
> and
> ++  // 'src_last' has not been reached yet, there is not enough data.
> 'dec' has to
> ++  // be reset until there is more data.
> ++  // !br->eos_ && src < src_last: this cannot happen as either the
> buffer is
> ++  // fully read, either enough has been read to reach 'src_last'.
> ++  // src >=3D src_last: 'src_last' is reached, all is fine. 'src' can
> actually go
> ++  // beyond 'src_last' in case the image is cropped and an LZ77 goes
> further.
> ++  // The buffer might have been enough or there is some left. 'br->eos_=
'
> does
> ++  // not matter.
> ++  assert(!dec->incremental_ || (br->eos_ && src < src_last) || src >=3D
> src_last);
> ++  if (dec->incremental_ && br->eos_ && src < src_last) {
> +     RestoreState(dec);
> +-  } else if (!br->eos_) {
> ++  } else if ((dec->incremental_ && src >=3D src_last) || !br->eos_) {
> +     // Process the remaining rows corresponding to last row-block.
> +     if (process_func !=3D NULL) {
> +       process_func(dec, row > last_row ? last_row : row);
> +--
> +2.40.0
> diff --git a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> index 4defdd5e42..0728ca60f5 100644
> --- a/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> +++ b/meta/recipes-multimedia/webp/libwebp_1.2.4.bb
> @@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D6e8dee932c26f2dab503abf70c96d8bb \
>  SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz=
 \
>             file://CVE-2023-1999.patch \
>             file://CVE-2023-5129.patch \
> +           file://CVE-2023-4863.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac5fba4d5480c205331d9494df"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189873):
> https://lists.openembedded.org/g/openembedded-core/message/189873
> Mute This Topic: https://lists.openembedded.org/mt/102307907/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000002699606090bac4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m surprised this one does apply in kirkstone as ther=
e is this security issue already fixed as 2023-5129 (see dunfell commit=C2=
=A0<a href=3D"https://git.openembedded.org/openembedded-core/commit/?h=3Ddu=
nfell&amp;id=3D7dce529515baa843ba3e5c89b2ad605b9845c59b" target=3D"_blank">=
https://git.openembedded.org/openembedded-core/commit/?h=3Ddunfell&amp;id=
=3D7dce529515baa843ba3e5c89b2ad605b9845c59b</a>=C2=A0and a bit more details=
 in=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/mess=
age/189262">https://lists.openembedded.org/g/openembedded-core/message/1892=
62</a> )<div><br></div><div>Is=C2=A0<a href=3D"https://github.com/webmproje=
ct/libwebp/commit/95ea5226c870449522240ccff26f0b006037c520">https://github.=
com/webmproject/libwebp/commit/95ea5226c870449522240ccff26f0b006037c520</a>=
 really related to CVE-2023-4863 ?</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 31, 2023 at 11:05=E2=80=
=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_bla=
nk">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">From: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@=
windriver.com" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
<br>
Heap buffer overflow in WebP in Google Chrome prior to<br>
116.0.5845.187 allowed a remote attacker to perform an<br>
out of bounds memory write via a crafted HTML page.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4863" rel=3D"noreferre=
r" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2023-4863</a><br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-4863" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-4863</a><br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2238431#c12" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2238431#c12</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.co=
m" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0.../webp/files/CVE-2023-4863.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 53 +++++++++++++++++++<br>
=C2=A0meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.2.4.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-4863.p=
atch<br>
<br>
diff --git a/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch b/meta/=
recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
new file mode 100644<br>
index 0000000000..2b1817822c<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/webp/files/CVE-2023-4863.patch<br>
@@ -0,0 +1,53 @@<br>
+From 95ea5226c870449522240ccff26f0b006037c520 Mon Sep 17 00:00:00 2001<br>
+From: Vincent Rabaud &lt;<a href=3D"mailto:vrabaud@google.com" target=3D"_=
blank">vrabaud@google.com</a>&gt;<br>
+Date: Mon, 11 Sep 2023 16:06:08 +0200<br>
+Subject: [PATCH] Fix invalid incremental decoding check.<br>
+<br>
+The first condition is only necessary if we have not read enough<br>
+(enough being defined by src_last, not src_end which is the end<br>
+of the image).<br>
+The second condition now fits the comment below: &quot;if not<br>
+incremental, and we are past the end of buffer&quot;.<br>
+<br>
+BUG=3Doss-fuzz:62136<br>
+<br>
+Change-Id: I0700f67c62db8e1c02c2e429a069a71e606a5e4f<br>
+<br>
+CVE: CVE-2023-4863<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/webmproject/libwe=
bp/commit/95ea5226c870449522240ccff26f0b006037c520" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/webmproject/libwebp/commit/95ea5226c870449=
522240ccff26f0b006037c520</a>]<br>
+<br>
+Signed-off-by: Soumya Sambu &lt;<a href=3D"mailto:soumya.sambu@windriver.c=
om" target=3D"_blank">soumya.sambu@windriver.com</a>&gt;<br>
+---<br>
+ src/dec/vp8l_dec.c | 15 +++++++++++++--<br>
+ 1 file changed, 13 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/dec/vp8l_dec.c b/src/dec/vp8l_dec.c<br>
+index 186b0b2..59a9e64 100644<br>
+--- a/src/dec/vp8l_dec.c<br>
++++ b/src/dec/vp8l_dec.c<br>
+@@ -1241,9 +1241,20 @@ static int DecodeImageData(VP8LDecoder* const dec, =
uint32_t* const data,<br>
+=C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0br-&gt;eos_ =3D VP8LIsEndOfStream(br);<br>
+-=C2=A0 if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; src &lt=
; src_end) {<br>
++=C2=A0 // In incremental decoding:<br>
++=C2=A0 // br-&gt;eos_ &amp;&amp; src &lt; src_last: if &#39;br&#39; reach=
ed the end of the buffer and<br>
++=C2=A0 // &#39;src_last&#39; has not been reached yet, there is not enoug=
h data. &#39;dec&#39; has to<br>
++=C2=A0 // be reset until there is more data.<br>
++=C2=A0 // !br-&gt;eos_ &amp;&amp; src &lt; src_last: this cannot happen a=
s either the buffer is<br>
++=C2=A0 // fully read, either enough has been read to reach &#39;src_last&=
#39;.<br>
++=C2=A0 // src &gt;=3D src_last: &#39;src_last&#39; is reached, all is fin=
e. &#39;src&#39; can actually go<br>
++=C2=A0 // beyond &#39;src_last&#39; in case the image is cropped and an L=
Z77 goes further.<br>
++=C2=A0 // The buffer might have been enough or there is some left. &#39;b=
r-&gt;eos_&#39; does<br>
++=C2=A0 // not matter.<br>
++=C2=A0 assert(!dec-&gt;incremental_ || (br-&gt;eos_ &amp;&amp; src &lt; s=
rc_last) || src &gt;=3D src_last);<br>
++=C2=A0 if (dec-&gt;incremental_ &amp;&amp; br-&gt;eos_ &amp;&amp; src &lt=
; src_last) {<br>
+=C2=A0 =C2=A0 =C2=A0RestoreState(dec);<br>
+-=C2=A0 } else if (!br-&gt;eos_) {<br>
++=C2=A0 } else if ((dec-&gt;incremental_ &amp;&amp; src &gt;=3D src_last) =
|| !br-&gt;eos_) {<br>
+=C2=A0 =C2=A0 =C2=A0// Process the remaining rows corresponding to last ro=
w-block.<br>
+=C2=A0 =C2=A0 =C2=A0if (process_func !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0process_func(dec, row &gt; last_row ? last_row =
: row);<br>
+--<br>
+2.40.0<br>
diff --git a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4.b=
b" rel=3D"noreferrer" target=3D"_blank">libwebp_1.2.4.bb</a> b/meta/recipes=
-multimedia/webp/<a href=3D"http://libwebp_1.2.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libwebp_1.2.4.bb</a><br>
index 4defdd5e42..0728ca60f5 100644<br>
--- a/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.2.4.bb</a><br>
+++ b/meta/recipes-multimedia/webp/<a href=3D"http://libwebp_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">libwebp_1.2.4.bb</a><br>
@@ -16,6 +16,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6e8dee932=
c26f2dab503abf70c96d8bb \<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://downloads.webmproject.org/release=
s/webp/$%7BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://downlo=
ads.webmproject.org/releases/webp/${BP}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-1999.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-5129.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-4863.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7bf5a8a28cc69bcfa8cb214f2c3095703c6b73ac=
5fba4d5480c205331d9494df&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189873): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189873" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189873</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102307907/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102307907/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000002699606090bac4a--

