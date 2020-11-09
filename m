Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web09.8295.1604907189173697382
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 23:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HRsNWoFW;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id g3so853933uae.7
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 23:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7FLOGNbgT+6lE4JKzow1xAAF1U5raQ4PwT6WOX2zmhY=;
        b=HRsNWoFWaTbDEmsi6+Ew8myIf9Gy92qjiaiHsH+fVglSLTKfWBsXo8S4CzzhwCR4FA
         FIf8gULhUF+CtwhRUET6JQjqmJjyxiRphkUGpZ+dH6tSopx8rlqtfYrvRHsjvrez8xnj
         SqJLBSR9J8vser1qBBvQ9lGRNw2PdgfY7b7tIQMeU7JUo0pqBfdvTwxd37jA+ZqHXUO3
         iRYCj7IF4o3DQu42nFHMce2S+HkrNYRDEfgXAqd8Yz6gP5p6QvnjUWz54u5ozvLp80fn
         4QVLUInrVc0WFX3FaORg4j2jxcAHy6fpDjH15xTp/gX+8wLFIZYGGRxsFN2s4FkpZnel
         s1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7FLOGNbgT+6lE4JKzow1xAAF1U5raQ4PwT6WOX2zmhY=;
        b=Og3BTeozrq4y0aHBV/9PkNjjkdoD1leUV7sCe3jKU7a0NMG2mRPPwi79rYkXl+ywe6
         5sZfGqAHQ2pVjXaqtAj2YLvkhmEEMbCiVdwYmS1S/pNZnuaFzWiWkme5gVpkvL/HfO0z
         uX7up76yIEUaAyOvFV4wH3i4X5QyXY/O6OMfOmQJAdWeh9U/u4p26/OtuCGHlVH2oyxE
         BXhi4GFXS7qBJd+c0/g9ZyKYawkcKtVO0V7JwEEnwIox3YAg7CqffgNWFuCgQc4dvy79
         mVe/23WO4rKjhmeHfxbZrdaxVPAQpRdFPnR7GT1W9LVD5kTFZVDp7XfgSGx4Qm7bnByX
         PRtA==
X-Gm-Message-State: AOAM532YcuqPlkRq3Vz/SbxFR5DyWhO27aejxKCDsTGx502tygkxe5Gm
	DGma/fVU234cfZGEgSowIL/8Xz8eqc/6FXWn1rkaUTIGjJg=
X-Google-Smtp-Source: ABdhPJxDLRB+GMyu8QwAqBKV1mBs/aqX6mqE4wlAySVFVRQt6RxjNjvOJ/TsuXkd0DDq2BPQ9GX7z0zkSVREgsHgYUM=
X-Received: by 2002:ab0:20b0:: with SMTP id y16mr5518312ual.93.1604907188225;
 Sun, 08 Nov 2020 23:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20201109003123.31494-1-kai.kang@windriver.com>
In-Reply-To: <20201109003123.31494-1-kai.kang@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 9 Nov 2020 08:32:56 +0100
Message-ID: <CANNYZj9dT6GBpFCkfGobL1tJ8K1GRLe9VuJJPaNR4Ubnyr0cCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: remove '-fno-omit-frame-pointer' for x86
To: kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da0a6905b3a792d4"

--000000000000da0a6905b3a792d4
Content-Type: text/plain; charset="UTF-8"

This is not seen on the autobuilder, which does world builds on qemux86.
Something might be wrong on your side?

Alex

On Mon, 9 Nov 2020 at 01:32, kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> It fails to compile webkitgtk for qemux86 if compile option
> '-fno-omit-frame-pointer' is applied:
>
> |
> TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r0/webkitgtk-2.30.1/
>     Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:1:
> | internal compiler error: in find_oldest_value_reg, at regcprop.c:438
> |    47 | }
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.30.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> index 1acba6be1d..11fdb59034 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
> @@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc = " -DENABLE_JIT=OFF "
>  # which is not enough for binaries larger than 32 MiB
>  CFLAGS_append_arc = " -mlong-calls"
>  CXXFLAGS_append_arc = " -mlong-calls"
> +CXXFLAGS_remove_x86 = "-fno-omit-frame-pointer"
>
>  # Javascript JIT is not supported on powerpc
>  EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=OFF "
> --
> 2.17.1
>
>
> 
>
>

--000000000000da0a6905b3a792d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is not seen on the autobuilder, which does world=
 builds on qemux86. Something might be wrong on your side?</div><div><br></=
div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, 9 Nov 2020 at 01:32, kai &lt;<a href=3D"mail=
to:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href=
=
=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.co=
m</a>&gt;<br>
<br>
It fails to compile webkitgtk for qemux86 if compile option<br>
&#39;-fno-omit-frame-pointer&#39; is applied:<br>
<br>
| TOPDIR/tmp-glibc/work/core2-32-wrsmllib32-linux/lib32-webkitgtk/2.30.1-r=
0/webkitgtk-2.30.1/<br>
=C2=A0 =C2=A0 Source/JavaScriptCore/runtime/JSFinalizationRegistry.cpp:47:=
1:<br>
| internal compiler error: in find_oldest_value_reg, at regcprop.c:438<br>
|=C2=A0 =C2=A0 47 | }<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a> b/meta/reci=
pes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb" rel=3D"noreferrer" t=
arget=3D"_blank">webkitgtk_2.30.2.bb</a><br>
index 1acba6be1d..11fdb59034 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.2.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.2.bb</a><br>
@@ -79,6 +79,7 @@ EXTRA_OECMAKE_append_arc =3D &quot; -DENABLE_JIT=3DOFF &=
quot;<br>
=C2=A0# which is not enough for binaries larger than 32 MiB<br>
=C2=A0CFLAGS_append_arc =3D &quot; -mlong-calls&quot;<br>
=C2=A0CXXFLAGS_append_arc =3D &quot; -mlong-calls&quot;<br>
+CXXFLAGS_remove_x86 =3D &quot;-fno-omit-frame-pointer&quot;<br>
<br>
=C2=A0# Javascript JIT is not supported on powerpc<br>
=C2=A0EXTRA_OECMAKE_append_powerpc =3D &quot; -DENABLE_JIT=3DOFF &quot;<br=
>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000da0a6905b3a792d4--
