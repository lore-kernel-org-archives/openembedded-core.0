Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FFBC4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 17:56:32 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.61173.1699293383250485342
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 09:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpVb38S2;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7afc13d58c6so1640295241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 09:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699293382; x=1699898182; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qFkBBfDlVJeDkB4dmBUd5+nMTh2k5bH4AukK2KQID6o=;
        b=dpVb38S2EaMFRki/i9dj8HTqCewYOJcKttP5/oBQGLZtJukyGWqhnX+qA3E88EqqDg
         pxX2AhEWeBCyGq0uXqgDfUqThOr8vG87Do32AEGcNZksxX9YreYKgZSFmZih809PB3jf
         ecUDRXNZsWbAxHhPy6faq5LJd3csZKA+G3pkUnCmCgCwBDisGJRB3nZtBUNAnlrEwoVX
         x2rUsKydlS3ZZRU5x33C2m47dnkKuP9Hn/bPOcOWpoqhr0irPTaLeC2tii3oiHsBSlO4
         kfBl2SLaZm90KvwmH/LZWJ8csS7btgKnBDpGham1/MFUo1w/88SbxrEYi5LEBSjdypGC
         DXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699293382; x=1699898182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFkBBfDlVJeDkB4dmBUd5+nMTh2k5bH4AukK2KQID6o=;
        b=TlL8iApK+dsF7NoRa6CqKlya2ilpjAns/0mdSlRq8fgmvuX/WNBFMW5S4raHKL1sNd
         ha5XtwRn5zM1yI5UA9C//8GRQzdFLUyKxbJEAsTDKHWO3X6V74Qqtb+KlgPXdWDhd2Qk
         NEnAXysbvHz8wjnZtxb636K/JkasWmlAopeiaLQucYfueigMtD0slIdrwUYbTtxc49Dp
         3J11T1iLtP04k4QpzyNo+YCMm9oJ833F0JmzIu4milpH1RFrOLcosL7lYeuyj+lwHStV
         yROikMVug9sMgiG3xeaP11QOL7X+1eCmN37FLBscOsKFuAMffFqSEclvdynHLPvwOAy1
         gcGA==
X-Gm-Message-State: AOJu0Yw1/BF31w3InggeYU9/jCTvtEIcuWETs1vvkXmo4MKwJPt0Tbn2
	QKPg8hFUd275qsu/Z/Ed2R8gegtCtTdbK5/WC9k=
X-Google-Smtp-Source: AGHT+IERc525kaTOJu0+VWoJNkodEINglTyX8OiFNZnQd1sOMHJHiBdvljIrVfLPr9SUqZj00IfaLD+/C08DfDBwJc4=
X-Received: by 2002:a05:6102:4746:b0:452:b96c:313b with SMTP id
 ej6-20020a056102474600b00452b96c313bmr26890378vsb.13.1699293380648; Mon, 06
 Nov 2023 09:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20231106170934.3738696-1-raj.khem@gmail.com>
In-Reply-To: <20231106170934.3738696-1-raj.khem@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 6 Nov 2023 17:56:09 +0000
Message-ID: <CANPvuRmwQifz2ZsMGEJd9SiRqr-xMBrFLdUqfqE2YYZLDABgsA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Make libnss-mymachines conditional
 upon packageconfig
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Florian Wickert <fw@ferncast.de>
Content-Type: multipart/alternative; boundary="00000000000052a99c06097f9295"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 17:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190242

--00000000000052a99c06097f9295
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia segunda, 6/11/2023 =C3=A0(s) =
17:09:

> nss-mymachines packageconfig controls this features therefore add this
> dependency only when it is enabled.
>
> Fixes
>     ERROR: systemd-1_254.4-r0 do_package_qa: QA Issue: systemd-container
> rdepends on libnss-mymachines, but it isn't a build dependency? [build-de=
ps]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Florian Wickert <fw@ferncast.de>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> b/meta/recipes-core/systemd/systemd_254.4.bb
> index 8a8ff545995..f22e5bfd059 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -542,7 +542,7 @@ FILES:${PN}-container =3D
> "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
>
> ${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \
>                          "
>
> -RDEPENDS:${PN}-container =3D "libnss-mymachines"
> +$RDEPENDS:${PN}-container =3D "{@bb.utils.contains('PACKAGECONFIG',
> 'nss-mymachines', 'libnss-mymachines', '', d)}"
>

extra $ nitpick.


>
>  # "machinectl import-tar" uses "tar --numeric-owner", not supported by
> busybox.
>  RRECOMMENDS:${PN}-container +=3D "\
> --
> 2.42.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190239):
> https://lists.openembedded.org/g/openembedded-core/message/190239
> Mute This Topic: https://lists.openembedded.org/mt/102424819/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000052a99c06097f9295
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia segunda, 6/11/2023=
 =C3=A0(s) 17:09:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">nss-mymachines packageconfig controls this features therefore add this<br=
>
dependency only when it is enabled.<br>
<br>
Fixes<br>
=C2=A0 =C2=A0 ERROR: systemd-1_254.4-r0 do_package_qa: QA Issue: systemd-co=
ntainer rdepends on libnss-mymachines, but it isn&#39;t a build dependency?=
 [build-deps]<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Florian Wickert &lt;<a href=3D"mailto:fw@ferncast.de" target=3D"_blank"=
>fw@ferncast.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_254.4.bb</a> b/meta/recipes-co=
re/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"noreferrer" target=3D=
"_blank">systemd_254.4.bb</a><br>
index 8a8ff545995..f22e5bfd059 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_254.4.bb" rel=3D"=
noreferrer" target=3D"_blank">systemd_254.4.bb</a><br>
@@ -542,7 +542,7 @@ FILES:${PN}-container =3D &quot;${sysconfdir}/dbus-1/sy=
stem.d/org.freedesktop.import1.c<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ${datadir}/polkit-1/actions/org.freedesktop.machine1.poli=
cy \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-RDEPENDS:${PN}-container =3D &quot;libnss-mymachines&quot;<br>
+$RDEPENDS:${PN}-container =3D &quot;{@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;nss-mymachines&#39;, &#39;libnss-mymachines&#39;, &#39;&#39;, d=
)}&quot;<br></blockquote><div><br>extra $ nitpick.<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0# &quot;machinectl import-tar&quot; uses &quot;tar --numeric-owner&qu=
ot;, not supported by busybox.<br>
=C2=A0RRECOMMENDS:${PN}-container +=3D &quot;\<br>
-- <br>
2.42.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190239): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190239" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190239</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102424819/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102424819/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000052a99c06097f9295--

