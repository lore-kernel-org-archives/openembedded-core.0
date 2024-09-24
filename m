Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052D4CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 04:18:21 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.6165.1727151498504192225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 21:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JS7HHIsS;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5369f1c7cb8so6351045e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 21:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727151497; x=1727756297; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T6jtiIffcq1x0hl9nB3nqymSj2t/LHY50QphEzNb820=;
        b=JS7HHIsSmFXPQYhTbzYyLPc1gRk9oGsJA2PdaY0ofSvrVIA9vAMlB9E00hjzDYhSHV
         ujGATMKyR736fzbDZlK5XvoIoHu7B3h3LrRX3+eIKrxoWKKZgWf5I1TbVifZ7LxYT/0w
         ne/BOx9CnGMxuZiUQSVrD2mMnqD+RnV4oBeS71NKS9gr5hs5zDUnJD14p30ilgKTYufe
         dJqn1SYXdNe3bpalxR+Gocx1gBJHLEZeaIPGCxE3OiQbYoMr1AYnd2iVj2Va8G8RcXQA
         7ntv6Q4KXSyyQ8TXySmfV+hTGFNlSMVsUXwB7+Pz4CsoEVnPABjfe5aD/hdYQHMAavLc
         0EQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727151497; x=1727756297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6jtiIffcq1x0hl9nB3nqymSj2t/LHY50QphEzNb820=;
        b=s27t2Ec24k8LjtPerOZMArqOY+kv7Ueh8JhYnQCJpj3qveojWpcESXCNGxl6H+rraf
         +gXuqGFolvQ6rIvv8vscaH7HncRJnLJB9gmjOjBGCq50KJpgmKVzeMZHnv+RBnFuTysk
         pxQeqHBB/nWXQJmSmmCMH2lGb/L/u5JZ3oOdlbAsh1I+aQExbP/3VOfS0GA5wlSD1B1c
         iz8kwTkV9Y74aZoGNyNHGoQEGLwyrmihYIgCNteA3zJs8C12pKI2gZw8DgDvqn9Q96VS
         Oellz3729RFhXDZSH4V+8uQBvbo6ntbm6g3pGD+OM/SAO6CzTviXtADKjTFozt9JL4gB
         p9+Q==
X-Gm-Message-State: AOJu0Yw6jntjm2y02/Isk3XANqYd5X5CP9c6tA0zAW432kpXPWgAGc5M
	1vuM8lRUGsYuN13HXS2dg8h14y4V3gdGYkyAFS9BY7ycVewGnwWPUG9m2yZeKfESi8f93hMR3Sm
	hmbfQOe2PCf9iDnXOZArsNdrkMC4=
X-Google-Smtp-Source: AGHT+IEHp9IOldK0Vq8nwTm6yCyUojHmG+1JWQFC2+Pi5Zb7HJjr24mYFgCb8n6hsFfOUWIAJW92DHXW3Na6qY0urbo=
X-Received: by 2002:a05:6512:1385:b0:536:a52d:f94b with SMTP id
 2adb3069b0e04-536ac2ce3a3mr6258581e87.8.1727151496201; Mon, 23 Sep 2024
 21:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240923234336.3978188-1-raj.khem@gmail.com>
In-Reply-To: <20240923234336.3978188-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Sep 2024 06:18:05 +0200
Message-ID: <CANNYZj9jZywpqjYRZhtxPZTE6g8T=G2gsF2K86MwPxNXoVdnAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vte: Upgrade to 0.78.0
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006792320622d5cbda"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 04:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204831

--0000000000006792320622d5cbda
Content-Type: text/plain; charset="UTF-8"

How can the crash be reproduced? This must be specified. Could it be
specific to your setup? Qemu usermode is pretty robust with standard poky.

Alex

On Tue 24. Sep 2024 at 1.43, Khem Raj via lists.openembedded.org <raj.khem=
gmail.com@lists.openembedded.org> wrote:

> - Needed for Gnome-47 components e.g. gnome-console
> - Disable GI_DATA on arm, it uses qemu usermode and qemu-user crashes
>   while running qemu_Vte-3.91
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-support/vte/{vte_0.76.3.bb => vte_0.78.0.bb} (94%)
>
> diff --git a/meta/recipes-support/vte/vte_0.76.3.bb
> b/meta/recipes-support/vte/vte_0.78.0.bb
> similarity index 94%
> rename from meta/recipes-support/vte/vte_0.76.3.bb
> rename to meta/recipes-support/vte/vte_0.78.0.bb
> index 515ff228fd4..f44d39ac451 100644
> --- a/meta/recipes-support/vte/vte_0.76.3.bb
> +++ b/meta/recipes-support/vte/vte_0.78.0.bb
> @@ -15,11 +15,11 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2
> libxml2-native gperf-native i
>
>  GIR_MESON_OPTION = 'gir'
>  GIDOCGEN_MESON_OPTION = "docs"
> -
> +GI_DATA_ENABLED:armv7ve = "False"
>  inherit gnomebase gi-docgen features_check upstream-version-is-even
> gobject-introspection systemd vala
>
>  SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
> -SRC_URI[archive.sha256sum] =
> "f678e94c056f377fd0021214adff5450cb172e9a08b160911181ddff7b7d5d60"
> +SRC_URI[archive.sha256sum] =
> "07f09c6228a8bb3c1599dd0f5a6ec797b30d3010c3ac91cf21b69d9635dfaf7c"
>
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204827):
> https://lists.openembedded.org/g/openembedded-core/message/204827
> Mute This Topic: https://lists.openembedded.org/mt/108619476/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000006792320622d5cbda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><span style=3D"font-family:-apple-system,helveticane=
ue;font-size:16px;font-style:normal;font-weight:400;letter-spacing:normal;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text=
-decoration:none;float:none;display:inline!important;background-color:rgba(=
0,0,0,0);border-color:rgb(0,0,0);color:rgb(0,0,0)">How can the crash be rep=
roduced? This must be specified. Could it be specific to your setup? Qemu u=
sermode is pretty robust with standard poky.</span></div><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue 24. Sep 2024 at 1.43, Khem Raj via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;raj.khem=3D<a hr=
ef=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">- Needed for Gnome-47 compone=
nts e.g. gnome-console<br>
- Disable GI_DATA on arm, it uses qemu usermode and qemu-user crashes<br>
=C2=A0 while running qemu_Vte-3.91<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/vte/{<a href=3D"http://vte_0.76.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">vte_0.76.3.bb</a> =3D&gt; <a href=3D"http://vte_=
0.78.0.bb" rel=3D"noreferrer" target=3D"_blank">vte_0.78.0.bb</a>} | 4 ++--=
<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-support/vte/{<a href=3D"http://vte_0.76.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.76.3.bb</a> =3D&gt; <a href=3D"http=
://vte_0.78.0.bb" rel=3D"noreferrer" target=3D"_blank">vte_0.78.0.bb</a>} (=
94%)<br>
<br>
diff --git a/meta/recipes-support/vte/<a href=3D"http://vte_0.76.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.76.3.bb</a> b/meta/recipes-support/=
vte/<a href=3D"http://vte_0.78.0.bb" rel=3D"noreferrer" target=3D"_blank">v=
te_0.78.0.bb</a><br>
similarity index 94%<br>
rename from meta/recipes-support/vte/<a href=3D"http://vte_0.76.3.bb" rel=
=3D"noreferrer" target=3D"_blank">vte_0.76.3.bb</a><br>
rename to meta/recipes-support/vte/<a href=3D"http://vte_0.78.0.bb" rel=3D"=
noreferrer" target=3D"_blank">vte_0.78.0.bb</a><br>
index 515ff228fd4..f44d39ac451 100644<br>
--- a/meta/recipes-support/vte/<a href=3D"http://vte_0.76.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.76.3.bb</a><br>
+++ b/meta/recipes-support/vte/<a href=3D"http://vte_0.78.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">vte_0.78.0.bb</a><br>
@@ -15,11 +15,11 @@ DEPENDS =3D &quot;glib-2.0 glib-2.0-native gtk+3 libpcr=
e2 libxml2-native gperf-native i<br>
<br>
=C2=A0GIR_MESON_OPTION =3D &#39;gir&#39;<br>
=C2=A0GIDOCGEN_MESON_OPTION =3D &quot;docs&quot;<br>
-<br>
+GI_DATA_ENABLED:armv7ve =3D &quot;False&quot;<br>
=C2=A0inherit gnomebase gi-docgen features_check upstream-version-is-even g=
object-introspection systemd vala<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-Add-W_EXITCODE-macro-for-non-glibc-sys=
tems.patch&quot;<br>
-SRC_URI[archive.sha256sum] =3D &quot;f678e94c056f377fd0021214adff5450cb172=
e9a08b160911181ddff7b7d5d60&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;07f09c6228a8bb3c1599dd0f5a6ec797b30d3=
010c3ac91cf21b69d9635dfaf7c&quot;<br>
<br>
=C2=A0ANY_OF_DISTRO_FEATURES =3D &quot;${GTK3DISTROFEATURES}&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204827): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204827" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204827</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108619476/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108619476/1686489</a><br>
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

--0000000000006792320622d5cbda--

