Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6761DC43219
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 10:22:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15319.1669112549846821615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 02:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ALaRSvvt;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id bs21so23996392wrb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2kPbamvHlFc3v/oOzLOVWOO1WGV0dbhZWRZVgxFlCY=;
        b=ALaRSvvt9OsLzCVlfNCtll7BVm+jwLb8nuEtGHSyJDJpxBFtAs6+qMH3zB1mD6oezE
         sbsfP7eUINWWlfpFVPULMBo/952ceJMBV6RC6Ys2GOWej0DRTC33A+u76OtlgBmYrfF1
         f/AfGB+r9qqqUyRbWJTJO0eXt8IjGP25N2M1H3EHjXKidZ0bpxXEU8+d8VTyihdSzi7X
         373aJJ7U7k9JYyIlA4mnCjcXp9el771ZTP4VW9/91lP3QsNEsfnJthgAA7JgrRx+0/34
         WXXTNnEktclf70349XJM3rGrqT6XMBPLYsOwLFUcFjV9gUkVq5LdAYz7st7a9V2PgZoG
         F0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2kPbamvHlFc3v/oOzLOVWOO1WGV0dbhZWRZVgxFlCY=;
        b=FwPodr1dEkbROaE94fpRnjxN9TAMki63RbSVhMcZ54ILKAMQ2ZbOo/+THrZvJuzWPy
         rRT5Gg+w2kHrQwQTu1wQHxaMklKVxZLLk55YqML2g4QCGSsfmYRRLQBxyVR1QLbO7Xos
         M67T9BWequAbhm7WgD7N+EYVg+wSuv61avjJdwHejMUDvoopVmOmMhHLV9+YbXSf0mwT
         fXlrcYFs5rC+WE3o26HDXt7rHAZMlF78izEuyAm56tSN30lEWamGM+mlXxSXf1hDfCPa
         iwR2VKPwmpYRKej850qn2sn1U0/p/MeuCPfpKghrQs5ChVuxwZALnHKtynEqYFoS6cIg
         6yIg==
X-Gm-Message-State: ANoB5pk0H17bzhRVReiI+3JRBvSJ6LFIexCasC/p8tL1LnEiB/DYW82S
	44X5ABK+Tlqh7JHtMboUHT9Wlxjyl3CHw40VEyo=
X-Google-Smtp-Source: AA0mqf4O6pFZs8W9kjQ8Qfaj+bNG0dRpIlL120ZJTxLub0o9Zf9mpuawtW37w3Rjr0Vb0AynRd1WDhoDgdizmACz53k=
X-Received: by 2002:a5d:430e:0:b0:241:bfb6:c6da with SMTP id
 h14-20020a5d430e000000b00241bfb6c6damr3004151wrq.204.1669112548135; Tue, 22
 Nov 2022 02:22:28 -0800 (PST)
MIME-Version: 1.0
References: <20220222033416.2207862-1-changqing.li@windriver.com>
In-Reply-To: <20220222033416.2207862-1-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Nov 2022 11:22:17 +0100
Message-ID: <CA+chaQf5oAQet=JdrAwzZpxtOZBn+uaW8S6J6aMCACh1pRACMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libsndfile1: fix CVE-2021-4156
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000085986405ee0c8cb8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173672

--00000000000085986405ee0c8cb8
Content-Type: text/plain; charset="UTF-8"

Is there a reason why this wasn't merged? Looks like the 1.0.31 version in
kirkstone is still affected (master has 1.1.0 now), I've sent backport for
it now.

On Tue, Feb 22, 2022 at 4:34 AM Changqing Li <changqing.li@windriver.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsndfile1/CVE-2021-4156.patch           | 32 +++++++++++++++++++
>  .../libsndfile/libsndfile1_1.0.28.bb          |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
>
> diff --git
> a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
> b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
> new file mode 100644
> index 0000000000..b0ff1a0885
> --- /dev/null
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
> @@ -0,0 +1,32 @@
> +From 5adbc377cd90aa40f0cd56ae325ca70065a8aa19 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Thu, 13 Jan 2022 16:45:59 +0800
> +Subject: [PATCH] flac: Fix improper buffer reusing
> +
> +CVE: CVE-2021-4156.patch
> +Upstream-Status: Backport [
> https://github.com/libsndfile/libsndfile/issues/731]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + src/flac.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/flac.c b/src/flac.c
> +index 0be82ac..6548bba 100644
> +--- a/src/flac.c
> ++++ b/src/flac.c
> +@@ -952,7 +952,11 @@ flac_read_loop (SF_PRIVATE *psf, unsigned len)
> +       /* Decode some more. */
> +       while (pflac->pos < pflac->len)
> +       {       if (FLAC__stream_decoder_process_single (pflac->fsd) == 0)
> ++              {       psf_log_printf (psf,
> "FLAC__stream_decoder_process_single returned false\n") ;
> ++                      /* Current frame is busted, so NULL the pointer. */
> ++                      pflac->frame = NULL ;
> +                       break ;
> ++                }
> +               state = FLAC__stream_decoder_get_state (pflac->fsd) ;
> +               if (state >= FLAC__STREAM_DECODER_END_OF_STREAM)
> +               {       psf_log_printf (psf,
> "FLAC__stream_decoder_get_state returned %s\n",
> FLAC__StreamDecoderStateString [state]) ;
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> index 443ca95e32..884d680fbe 100644
> --- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> +++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
> @@ -20,6 +20,7 @@ SRC_URI = "
> http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
>             file://CVE-2017-12562.patch \
>             file://CVE-2018-19758.patch \
>             file://CVE-2019-3832.patch \
> +           file://CVE-2021-4156.patch \
>            "
>
>  SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162113):
> https://lists.openembedded.org/g/openembedded-core/message/162113
> Mute This Topic: https://lists.openembedded.org/mt/89310155/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000085986405ee0c8cb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a reason why this wasn&#39;t merged? Looks like t=
he 1.0.31 version in kirkstone is still affected (master has 1.1.0 now), I&=
#39;ve sent backport for it now.</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 22, 2022 at 4:34 AM Changqing L=
i &lt;<a href=3D"mailto:changqing.li@windriver.com">changqing.li@windriver.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" tar=
get=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libsndfile1/CVE-2021-4156.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 32 +++++++++++++++++++<br>
=C2=A0.../libsndfile/<a href=3D"http://libsndfile1_1.0.28.bb" rel=3D"norefe=
rrer" target=3D"_blank">libsndfile1_1.0.28.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 33 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE=
-2021-4156.patch<br>
<br>
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.p=
atch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch<b=
r>
new file mode 100644<br>
index 0000000000..b0ff1a0885<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch<br=
>
@@ -0,0 +1,32 @@<br>
+From 5adbc377cd90aa40f0cd56ae325ca70065a8aa19 Mon Sep 17 00:00:00 2001<br>
+From: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com" targe=
t=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+Date: Thu, 13 Jan 2022 16:45:59 +0800<br>
+Subject: [PATCH] flac: Fix improper buffer reusing<br>
+<br>
+CVE: CVE-2021-4156.patch<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libsndfile/libsnd=
file/issues/731" rel=3D"noreferrer" target=3D"_blank">https://github.com/li=
bsndfile/libsndfile/issues/731</a>]<br>
+<br>
+Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.c=
om" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
+---<br>
+ src/flac.c | 4 ++++<br>
+ 1 file changed, 4 insertions(+)<br>
+<br>
+diff --git a/src/flac.c b/src/flac.c<br>
+index 0be82ac..6548bba 100644<br>
+--- a/src/flac.c<br>
++++ b/src/flac.c<br>
+@@ -952,7 +952,11 @@ flac_read_loop (SF_PRIVATE *psf, unsigned len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Decode some more. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0while (pflac-&gt;pos &lt; pflac-&gt;len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0if (FLAC__stream_de=
coder_process_single (pflac-&gt;fsd) =3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =
=C2=A0psf_log_printf (psf, &quot;FLAC__stream_decoder_process_single return=
ed false\n&quot;) ;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Current frame is busted, so NULL the pointer. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pflac-&gt;frame =3D NULL ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break ;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0state =3D FLAC__str=
eam_decoder_get_state (pflac-&gt;fsd) ;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (state &gt;=3D F=
LAC__STREAM_DECODER_END_OF_STREAM)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=
=A0 =C2=A0psf_log_printf (psf, &quot;FLAC__stream_decoder_get_state returne=
d %s\n&quot;, FLAC__StreamDecoderStateString [state]) ;<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-multimedia/libsndfile/<a href=3D"http://libsndfil=
e1_1.0.28.bb" rel=3D"noreferrer" target=3D"_blank">libsndfile1_1.0.28.bb</a=
> b/meta/recipes-multimedia/libsndfile/<a href=3D"http://libsndfile1_1.0.28=
.bb" rel=3D"noreferrer" target=3D"_blank">libsndfile1_1.0.28.bb</a><br>
index 443ca95e32..884d680fbe 100644<br>
--- a/meta/recipes-multimedia/libsndfile/<a href=3D"http://libsndfile1_1.0.=
28.bb" rel=3D"noreferrer" target=3D"_blank">libsndfile1_1.0.28.bb</a><br>
+++ b/meta/recipes-multimedia/libsndfile/<a href=3D"http://libsndfile1_1.0.=
28.bb" rel=3D"noreferrer" target=3D"_blank">libsndfile1_1.0.28.bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.mega-nerd.com/lib=
sndfile/files/libsndfile-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz</a> =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-12562.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2018-19758.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2019-3832.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-4156.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;646b5f98ce89ac60cdb060fcd398247c&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162113): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162113" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162113</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89310155/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89310155/3617156</a><br>
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

--00000000000085986405ee0c8cb8--

