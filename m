Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD53C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 18:43:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.892.1642358598236996989
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 10:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iwcEUIBK;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id y10so16685641qtw.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 10:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wEyRbOqAiJyxVTFkjRz9EJhPKPAG85GKtJZgs3e4eNo=;
        b=iwcEUIBK/fKnLHKDUwy449/mBLK7JV/8uXHM1OjL8FeH0fmXW9HOhaN7U8B9mUj2HV
         lIw9HUoW9xwH51/H4hj0zzyvM34eZdVhfeXXqfxjdmUvhgtXhSbq63LSPvVAPeFLe/3V
         BtIquZpjhnSQQGVLhNKX7uH7pdt9RWIobAYBydVRJWjEz0zKPAj6qyX1XHkKLKnmNbra
         2NESUYfWkWUqWqvnvmKklnyGbbzX8HA8JANR2+2jf9rrXG5JKqu9vyMnSpRx/PcbOlS5
         tsRxTTAL1IiOxKMbv4N4feMKRlLNLHGdu130PDtxqjYqTWStePSNBbnoTCW/e3FDFgOM
         otmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wEyRbOqAiJyxVTFkjRz9EJhPKPAG85GKtJZgs3e4eNo=;
        b=qrYrFcTELAGwe8guQqPKu/QA3Z0V2dq5MF4JzON536K+ymLvhsVUr9ssySeu6NzZns
         Jxls/73ixBNPC5nkXKrjZs/W43dV5a8v7alm7yhMYNTToz3f7nhc2HiU0KPuKPvWPJLk
         dZNAsyWn+2TeThZBiVuG/d8vjYqjXg99vqHle5jdYxK8dhrEJ8Pc1h5sW9szWLQewQKf
         txFLAGcSGRcpTNPPDDQlR4tuIHn3ti16PNpp0tTx3BKRvGU8l5AeLiI4EJDZhMSm4n5e
         qQTTH5184L5JG7v1Mcojg+cibXBwiZmPfs+JvBzCA+EHFjf+JUK7Tbb7sew+OwA1FSMv
         bPBQ==
X-Gm-Message-State: AOAM530dyY70p97fpqW8xW3WSpijF2TQRV1+41JCg3Ad6HGt6CLNXQm2
	hfS8ri+HdPKf1XsNwAXTk/RK6nkvzseahHwlzuVlvt+o
X-Google-Smtp-Source: 
 ABdhPJwB3CzeWUWFV6T9spYhLCVt1aMsjZNubmqlvHqKCZY1UzgtXpcHJ10TxBvwcIAleWLmGYNklDrG70YHKJSAiSQ=
X-Received: by 2002:ac8:7e83:: with SMTP id w3mr9021578qtj.634.1642358597192;
 Sun, 16 Jan 2022 10:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20220116164706.4555-1-kai.kang@windriver.com>
In-Reply-To: <20220116164706.4555-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Jan 2022 10:43:05 -0800
Message-ID: 
 <CAMKF1srUmN7RzBaE3FNFXjUc7rvYWwOeR=qfhaXW71XKVONcKg@mail.gmail.com>
Subject: Re: [PATCH] tcmode-default.inc: clear PREFERRED_VERSION for llvm
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c78e3905d5b7688e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 18:43:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160618

--000000000000c78e3905d5b7688e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 16, 2022 at 8:47 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> When include layer meta-clang which set LLVMVERSION in layer.conf, it
> shows warnings:
>
> | WARNING: preferred version 13.0.1 of llvm-native not available (for ite=
m
> llvm-native)
> | WARNING: versions of llvm-native available: 12.0.1
> | WARNING: preferred version 13.0.1 of llvm not available (for item llvm)
> | WARNING: versions of llvm available: 12.0.1
> | WARNING: preferred version 13.0.1 of llvm not available (for item
> llvm-dev)
> | WARNING: versions of llvm available: 12.0.1
> | WARNING: preferred version 13.0.1 of llvm not available (for item
> llvm-bugpointpasses)
> | WARNING: versions of llvm available: 12.0.1
> | WARNING: preferred version 13.0.1 of llvm not available (for item
> llvm-liboptremarks)
> | WARNING: versions of llvm available: 12.0.1
> | WARNING: preferred version 13.0.1 of llvm not available (for item
> llvm-llvmhello)
> | WARNING: versions of llvm available: 12.0.1
>
> Because only one version llvm exists, remove the PREFERRED_VERSION
> setting for llvm.


I think these are PROVIDERS mismatch more than anything between two recipes
so perhaps it=E2=80=99s better to keep that in sync

Fwiw llvm is not heavily used in oe-core perhaps it should be removed

>
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 49e99af8f2..2622b055a2 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -79,10 +79,6 @@ PREFERRED_VERSION_go-runtime ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go ?=3D "${GOVERSION}"
>  PREFERRED_VERSION_nativesdk-go-runtime ?=3D "${GOVERSION}"
>
> -PREFERRED_VERSION_llvm =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_llvm-native =3D "${LLVMVERSION}"
> -PREFERRED_VERSION_nativesdk-llvm =3D "${LLVMVERSION}"
> -
>  # Rust toolchain preferred versions:
>
>  PREFERRED_VERSION_cargo ?=3D "${RUSTVERSION}"
> --
> 2.17.1
>
>

--000000000000c78e3905d5b7688e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jan 16, 2022 at 8:47 AM &lt;<a href=3D"mailto:kai.k=
ang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
When include layer meta-clang which set LLVMVERSION in layer.conf, it<br>
shows warnings:<br>
<br>
| WARNING: preferred version 13.0.1 of llvm-native not available (for item =
llvm-native)<br>
| WARNING: versions of llvm-native available: 12.0.1<br>
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm)<b=
r>
| WARNING: versions of llvm available: 12.0.1<br>
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-de=
v)<br>
| WARNING: versions of llvm available: 12.0.1<br>
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-bu=
gpointpasses)<br>
| WARNING: versions of llvm available: 12.0.1<br>
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-li=
boptremarks)<br>
| WARNING: versions of llvm available: 12.0.1<br>
| WARNING: preferred version 13.0.1 of llvm not available (for item llvm-ll=
vmhello)<br>
| WARNING: versions of llvm available: 12.0.1<br>
<br>
Because only one version llvm exists, remove the PREFERRED_VERSION<br>
setting for llvm.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>I think these are PROVIDERS mismatch more than anything between two recipe=
s so perhaps it=E2=80=99s better to keep that in sync=C2=A0</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Fwiw llvm is not heavily used in oe-c=
ore perhaps it should be removed=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" =
dir=3D"auto"><br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 49e99af8f2..2622b055a2 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -79,10 +79,6 @@ PREFERRED_VERSION_go-runtime ?=3D &quot;${GOVERSION}&quo=
t;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVERSION}&quot;<=
br>
<br>
-PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<br>
-PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot;<br>
-<br>
=C2=A0# Rust toolchain preferred versions:<br>
<br>
=C2=A0PREFERRED_VERSION_cargo ?=3D &quot;${RUSTVERSION}&quot;<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000c78e3905d5b7688e--

