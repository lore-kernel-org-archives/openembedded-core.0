Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA783CF2579
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 19:37:38 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.38328.1728848257325166376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 12:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FKQN4Bqi;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so424025e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 12:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728848255; x=1729453055; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=17hAYWAj4fa3ufsRECBk3Z69Mcg0azXpQ0QgsOkk/y0=;
        b=FKQN4BqizTdvRJDO/VToVOag1fI5FStQeVoMl1B5zA4xadfSUMiuB6r/80c25wXJoc
         S8fkwR1eaCH8zWondXyN7qis4ektwxwGCk+adJWDIiqYvppg/zM36NIbCOwVpG89yDH6
         I+PapTIveUQgT2wUqlUePAC5XwVBSOLMnkEYOZ8VNnqAxjOy6zk3wub1JpI05BHE21He
         DYfAPWxyfXm7Rctv4qJYI+YkZ6F2J8k4GAzPxIx/Xla1mOU9snSDa6DeMm/k2CXyXtsa
         iu0yKYFxkogWwzxDjUd15ZF2ppg3WIn7etw+HPHoZSghVM/PnU5J+97WUqNpxT3YWXKR
         4ROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728848255; x=1729453055;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17hAYWAj4fa3ufsRECBk3Z69Mcg0azXpQ0QgsOkk/y0=;
        b=jqDy1ux3nTdWf0aWE6RFDolW8owAjkRCw7oMZo6mr0MLDjqwdrQtB1Swq9q8ZFJQW1
         LPw5d7ZHX/anYc9+eEHOLhz2tKVUH8WVQLYQ/w+3pz90dzEuOCGY9TbLvUM+TjC2iNGl
         6gUpPBK4UajIE7NYfW3TeIk2jHtfP86agAX9GwnxQjN8W27wvIL4hPQE1zrZpNaZ3oIl
         j11I9RaMKB1bLYFZYOZmue++XrKFQKUdy0STeM5i0Dl9USp9FIDFrcwNEt+VQxjeX/TX
         I+7wZsmVCYML0+EWn9v0/w+e5fR0ZItKKkpxFtKwGJ+S2+HlcifZxCI4SNQGTVA/FVft
         IXWQ==
X-Gm-Message-State: AOJu0YwezVAFrhk73mlmqSO13wKBZxcJ3Oa98qBt40GnUuMBiWQVydA2
	PS6CRlw86bkIEj59zhiDUl41h+8tnAkXt2Yc8T/IwKBXKlsZqSGC4E7fcZef3VMd2MGncFdTPi+
	eI5yRezCzBzjOj4617VLVCgc8gC0=
X-Google-Smtp-Source: AGHT+IF6c5ZdqsIuwbJRhRfx5PZYgNKSzAsCy4JDgKuNrUCIklcJOhx4uJSwjHjnMo0SzerxbH2COIv7/5EyQy0GLJI=
X-Received: by 2002:a05:6512:2207:b0:539:f748:b568 with SMTP id
 2adb3069b0e04-539f748b8f0mr325530e87.32.1728848254970; Sun, 13 Oct 2024
 12:37:34 -0700 (PDT)
MIME-Version: 1.0
References: <20241013191703.317096-1-raj.khem@gmail.com>
In-Reply-To: <20241013191703.317096-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 13 Oct 2024 21:37:23 +0200
Message-ID: <CANNYZj8xzYfaZwcbi5+gtxCPdoyKjVQK2pjAcTKRfhL3e9dpWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ffmpeg: Disable asm optimizations on x86
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="0000000000001bafc1062460da42"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 19:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205725

--0000000000001bafc1062460da42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Wouldn=E2=80=99t this be a build time error? Why is it not seen on the ab?

Alex

On Sun 13. Oct 2024 at 21.17, Khem Raj via lists.openembedded.org <raj.khem=
=3D
gmail.com@lists.openembedded.org> wrote:

> disable asm code if PIC is required, as the provided asm
> decidedly is not PIC for x86.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> index af66104ebf3..3c66851b8d2 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
> @@ -129,6 +129,8 @@ EXTRA_OECONF =3D " \
>  "
>
>  EXTRA_OECONF:append:linux-gnux32 =3D " --disable-asm"
> +# --enable-pic is used and x86 assembly is not PIC on x86
> +EXTRA_OECONF:append:x86 =3D " --disable-asm"
>
>  EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r6',
> '--disable-mips64r2 --disable-mips32r2', '', d)}"
>  EXTRA_OECONF +=3D "${@bb.utils.contains('TUNE_FEATURES', 'mipsisa64r2',
> '--disable-mips64r6 --disable-mips32r6', '', d)}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205724):
> https://lists.openembedded.org/g/openembedded-core/message/205724
> Mute This Topic: https://lists.openembedded.org/mt/108988536/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001bafc1062460da42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Wouldn=E2=80=99t this be a build time error? Why is it no=
t seen on the ab?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Sun 13. Oct 2024 at 21.17, Khem Raj via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mai=
lto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex=
;border-left-color:rgb(204,204,204)">disable asm code if PIC is required, a=
s the provided asm<br>
decidedly is not PIC for x86.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank=
">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_7.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_7.0.2.bb</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_7.0.2.=
bb" rel=3D"noreferrer" target=3D"_blank">ffmpeg_7.0.2.bb</a> b/meta/recipes=
-multimedia/ffmpeg/<a href=3D"http://ffmpeg_7.0.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ffmpeg_7.0.2.bb</a><br>
index af66104ebf3..3c66851b8d2 100644<br>
--- a/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_7.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_7.0.2.bb</a><br>
+++ b/meta/recipes-multimedia/ffmpeg/<a href=3D"http://ffmpeg_7.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">ffmpeg_7.0.2.bb</a><br>
@@ -129,6 +129,8 @@ EXTRA_OECONF =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF:append:linux-gnux32 =3D &quot; --disable-asm&quot;<br>
+# --enable-pic is used and x86 assembly is not PIC on x86<br>
+EXTRA_OECONF:append:x86 =3D &quot; --disable-asm&quot;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;,=
 &#39;mipsisa64r6&#39;, &#39;--disable-mips64r2 --disable-mips32r2&#39;, &#=
39;&#39;, d)}&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;,=
 &#39;mipsisa64r2&#39;, &#39;--disable-mips64r6 --disable-mips32r6&#39;, &#=
39;&#39;, d)}&quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205724): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205724" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205724</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108988536/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108988536/1686489</a><br>
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

--0000000000001bafc1062460da42--

