Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250A9C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 21:21:28 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 by mx.groups.io with SMTP id smtpd.web08.557.1634592087436133604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 14:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FbC3mENG;
 spf=pass (domain: gmail.com, ip: 209.85.221.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f179.google.com with SMTP id f126so9314498vke.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 14:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nu6dUCotGfTWw7kaMm9+qzxhHHlRQoZyAmLh6+qfN/w=;
        b=FbC3mENG/T09nQhFR9PtanKED22DX5dUu3DfW0VJdcSZFodXVOK9OpHdnkudcQV92p
         O0VpqzlNcDDm2hS+2gDWT/RjeA2dJLbQSRDzDZRA+02MpfWzTDp4CpiXyfdr4O0t7Bqq
         dVpJ18+ILeJbcnMFEzInvpDL5vir0D7heNT2Us/aF2NWNmnMabh0/fASJb85kPiuf1dJ
         x9D3W9mQVF/q9p80CL3rrG+/q1x4DMYnxQV1DuxE0Lh92ds8kyXA96LacXHvOnG22yzd
         vRy8EE/n280tYKW0f917Z5Ly5eDePmvTIkVC6OzPQ245mFPSUCDcMxa41vlPZ4M3v6Pk
         SoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nu6dUCotGfTWw7kaMm9+qzxhHHlRQoZyAmLh6+qfN/w=;
        b=WafDNMcWzNKrmj0OiIPE8MR4eNCehrFiDI87l0rsVS3fg0rudo8n/g87w2eyspkLZO
         dq4LhB9XHFiUssJWgpGyzjNahU1QDwGdoF/Qd/kp9dXupPpeMnrFqZetop7A7M2Kz8bS
         hkhMzyFA5B33U9/DmFXPGvycVfgcO3JxDiwxkDqPHvoeTZyqBb5KR4HHmz85NsJ2tC6Y
         4obpVLSUFbKY5cOr8L0zebbmFoTNk/fBD2a9LjrtX01cM4bEblBitAXcM3Hs/baCAapW
         pDmjm4m7UOgdXcZ8thpIxWQZ3T0Gu/D67lXCCbUXyc53qNh2w1wE/i2gOcWu9hLxf7z7
         vG1w==
X-Gm-Message-State: AOAM5337vinK+mhb9IfBqZvFVXr/vhDC9+27s/ZlixdTMHKPtPuNhrrV
	Ji3BohBSxBMkfx5N5E8p1tIArXpcrXK0o9RlnME=
X-Google-Smtp-Source: 
 ABdhPJxQpnTgjkltJdTWeGQitXmutLg6KJIkcboQBmVFWinEspq2gSevbyNi1x5wNyWkTqq+49vtTQeBTXkbfllcOOU=
X-Received: by 2002:a1f:1c56:: with SMTP id c83mr27805544vkc.6.1634592086623;
 Mon, 18 Oct 2021 14:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211018211004.11706-1-kekiefer@gmail.com>
In-Reply-To: <20211018211004.11706-1-kekiefer@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Oct 2021 23:21:15 +0200
Message-ID: 
 <CANNYZj--rnmjARC+0cn3nkBPapjssEsq_pd_8PA2cu=jUJhc2Q@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] mozjs: move large static library into
 staticdev package
To: Kurt Kiefer <kekiefer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Kurt Kiefer <kurt.kiefer@arthrex.com>
Content-Type: multipart/alternative; boundary="000000000000ad094e05cea7208a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 21:21:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157096

--000000000000ad094e05cea7208a
Content-Type: text/plain; charset="UTF-8"

Thanks, both patches should go to oe-devel list though.

Alex

On Mon, 18 Oct 2021 at 23:10, Kurt Kiefer <kekiefer@gmail.com> wrote:

> From: Kurt Kiefer <kurt.kiefer@arthrex.com>
>
> The libmozjs package was including /usr/lib/libjs_static.ajs, not
> required for runtime usage.
>
> Keep this file, but move it to the staticdev package.
>
> Signed-off-by: Kurt Kiefer <kurt.kiefer@arthrex.com>
> ---
>  .../meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/
> mozjs_91.1.0.bb
> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/
> mozjs_91.1.0.bb
> index 9b9d2cea8..88aeb2dae 100644
> --- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/
> mozjs_91.1.0.bb
> +++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/
> mozjs_91.1.0.bb
> @@ -62,5 +62,6 @@ do_install:append() {
>             -i ${D}${bindir}/js91-config
>  }
>
> -PACKAGES =+ "lib${BPN}"
> +PACKAGES =+ "lib${BPN}-staticdev lib${BPN}"
> +FILES:lib${BPN}-staticdev += "${libdir}/libjs_static.ajs"
>  FILES:lib${BPN} += "${libdir}/lib*"
> --
> 2.29.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157095):
> https://lists.openembedded.org/g/openembedded-core/message/157095
> Mute This Topic: https://lists.openembedded.org/mt/86425371/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ad094e05cea7208a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, both patches should go to oe-devel list thoug=
h.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 23:10, Kur=
t Kiefer &lt;<a href=3D"mailto:kekiefer@gmail.com">kekiefer@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Kurt Kiefer &lt;<a href=3D"mailto:kurt.kiefer@arthrex.com" target=3D"_blank=
">kurt.kiefer@arthrex.com</a>&gt;<br>
<br>
The libmozjs package was including /usr/lib/libjs_static.ajs, not<br>
required for runtime usage.<br>
<br>
Keep this file, but move it to the staticdev package.<br>
<br>
Signed-off-by: Kurt Kiefer &lt;<a href=3D"mailto:kurt.kiefer@arthrex.com" t=
arget=3D"_blank">kurt.kiefer@arthrex.com</a>&gt;<br>
---<br>
=C2=A0.../meta-python/recipes-extended/mozjs/<a href=3D"http://mozjs_91.1.0=
.bb" rel=3D"noreferrer" target=3D"_blank">mozjs_91.1.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/<a h=
ref=3D"http://mozjs_91.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs_9=
1.1.0.bb</a> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/<a=
 href=3D"http://mozjs_91.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs=
_91.1.0.bb</a><br>
index 9b9d2cea8..88aeb2dae 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/<a href=3D"=
http://mozjs_91.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs_91.1.0.b=
b</a><br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/<a href=3D"=
http://mozjs_91.1.0.bb" rel=3D"noreferrer" target=3D"_blank">mozjs_91.1.0.b=
b</a><br>
@@ -62,5 +62,6 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${D}${bindir}/js91-config<br>
=C2=A0}<br>
<br>
-PACKAGES =3D+ &quot;lib${BPN}&quot;<br>
+PACKAGES =3D+ &quot;lib${BPN}-staticdev lib${BPN}&quot;<br>
+FILES:lib${BPN}-staticdev +=3D &quot;${libdir}/libjs_static.ajs&quot;<br>
=C2=A0FILES:lib${BPN} +=3D &quot;${libdir}/lib*&quot;<br>
-- <br>
2.29.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157095): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157095" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157095</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86425371/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86425371/1686489</a><br>
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

--000000000000ad094e05cea7208a--

