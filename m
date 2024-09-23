Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46123CF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 09:06:32 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.32350.1727082384944736829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 02:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=notczVfZ;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49bc672bb46so1320037137.2
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 02:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727082384; x=1727687184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GzKAYdQLO/vv4r/C5yuTgXzaTiQ5ObLgdmZEE0jUyEw=;
        b=notczVfZ7pSOMt6jkNuDo317Xeth15sD6LYV1VnDHcUnHsFnKsxl9k0G/hIvmd3gZ1
         mALpPoeVP09irQOvld0SaZqLwY5WAHqd6gUkDzg4DMjjRlneVr8rJwuZujbbLmglY8z3
         udw+8U7Pb+tgDTP4J2CmKUFoqbNgb51za4nIf8SRHVgX1LvvSkopYIgeF1kVwtoiMK5K
         lcTRxw0y9fTQIkQMtoWcWzmg29f9UTfAPns4fzj+tS69P4feDlrQDuNiaSMD3HbRJD9u
         og2NxvdM9yOTYmJDvU1ZHbfI5m5yxZnR2pesC4die8ChB3WJbg3tfub1LeNI2kticY3k
         A71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082384; x=1727687184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzKAYdQLO/vv4r/C5yuTgXzaTiQ5ObLgdmZEE0jUyEw=;
        b=WuqMCPKdiv3zh/EZQg9NpJdEfgKOJhagZ2C0t6Y6js9ZcJyYsq31J02oumL4l3m7Sy
         LzGLzTmInKhUkdgAaIsFen0lYEzHaRxKZUDMzUtaH7UmgnBLCTxqsUrkiH3PtlU2+EUw
         POGSLie1Hh6hQUdH3dcdjnY76VWqiGPsOxci1KTd0LgUPLLjKBZDJe/r9bQ1GYZoat/e
         DW+REXo59wqe37Vua9i2YWYTn0JXprutMW925svTh9mWh2fvyC+ISgtZ6mpFP0CIkmMg
         bk4H2Dft9J93mrbMGg6/FBkjTT2n8886688Ne2RpsDsdPiJWZnosDDQhsTWTT7wOhMV2
         0QIQ==
X-Gm-Message-State: AOJu0YzVgU8CFTWMvrh6CSLQdkeUbxmrD+Pk+KfVlJIvTB2SblN6tnbi
	6Ja8c3g/KNcMMtTCmeMT71Nv5KtDyCxudxy4t+FP0u8eejQBl8ylH8z717PLeOFA2btnZPMwbfa
	G2bWPzBcx1JOEvcEUXW6pZIR6FHk=
X-Google-Smtp-Source: AGHT+IGXEx9zXFhA70ttOJTU0FdDNVbRYQbc/HZEQIx4hnF/FDnYuDmxc247T3ubENpyJS8eFt5pYK4ZGBPplKtbA8k=
X-Received: by 2002:a05:6102:c8d:b0:49a:1dd2:3cc8 with SMTP id
 ada2fe7eead31-49fc9660201mr6117886137.24.1727082383826; Mon, 23 Sep 2024
 02:06:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240923085948.49447-1-an010@live.com> <20240923085948.49447-4-an010@live.com>
In-Reply-To: <20240923085948.49447-4-an010@live.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 23 Sep 2024 10:06:13 +0100
Message-ID: <CANPvuRktR9NbXAzFOJsusgctrXcmeHxoHpXO5882+tNsgyJvwQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] scripts/install-buildtools: Update to 4.0.21
To: aleksandar.nikolic010@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Content-Type: multipart/alternative; boundary="000000000000fc69640622c5b306"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 09:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204800

--000000000000fc69640622c5b306
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aleksandar,

Aleksandar Nikolic via lists.openembedded.org <aleksandar.nikolic010=3D
gmail.com@lists.openembedded.org> escreveu (segunda, 23/09/2024 =C3=A0(s) 1=
0:00):

> From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
>
> Update to the 4.0.21 release of the 4.0 series for buildtools.
>
> Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
> ---
>  scripts/install-buildtools | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index 4f85fe87d4..9054eb5f36 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -56,9 +56,9 @@ PROGNAME =3D 'install-buildtools'
>  logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)
>
>  DEFAULT_INSTALL_DIR =3D
> os.path.join(os.path.split(scripts_path)[0],'buildtools')
> -DEFAULT_BASE_URL =3D 'http://downloads.yoctoproject.org/releases/yocto'
> -DEFAULT_RELEASE =3D 'yocto-4.1'
> -DEFAULT_INSTALLER_VERSION =3D '4.1'
> +DEFAULT_BASE_URL =3D 'https://downloads.yoctoproject.org/releases/yocto'
> +DEFAULT_RELEASE =3D 'yocto-4.0.21'
> +DEFAULT_INSTALLER_VERSION =3D '4.0.21'
>

This first patch in the series updates this version to 4.1.
What is the reason to downgrade this now on the last patch?

Jose


>  DEFAULT_BUILDDATE =3D '202110XX'
>
>  # Python version sanity check
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204799):
> https://lists.openembedded.org/g/openembedded-core/message/204799
> Mute This Topic: https://lists.openembedded.org/mt/108604377/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000fc69640622c5b306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Aleksandar,</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Aleksandar Nikolic via <a h=
ref=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;aleksa=
ndar.nikolic010=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail=
.com@lists.openembedded.org</a>&gt; escreveu (segunda, 23/09/2024 =C3=A0(s)=
 10:00):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: A=
leksandar Nikolic &lt;<a href=3D"mailto:aleksandar.nikolic@zeiss.com" targe=
t=3D"_blank">aleksandar.nikolic@zeiss.com</a>&gt;<br>
<br>
Update to the 4.0.21 release of the 4.0 series for buildtools.<br>
<br>
Signed-off-by: Aleksandar Nikolic &lt;<a href=3D"mailto:aleksandar.nikolic@=
zeiss.com" target=3D"_blank">aleksandar.nikolic@zeiss.com</a>&gt;<br>
---<br>
=C2=A0scripts/install-buildtools | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/install-buildtools b/scripts/install-buildtools<br>
index 4f85fe87d4..9054eb5f36 100755<br>
--- a/scripts/install-buildtools<br>
+++ b/scripts/install-buildtools<br>
@@ -56,9 +56,9 @@ PROGNAME =3D &#39;install-buildtools&#39;<br>
=C2=A0logger =3D scriptutils.logger_create(PROGNAME, stream=3Dsys.stdout)<b=
r>
<br>
=C2=A0DEFAULT_INSTALL_DIR =3D os.path.join(os.path.split(scripts_path)[0],&=
#39;buildtools&#39;)<br>
-DEFAULT_BASE_URL =3D &#39;<a href=3D"http://downloads.yoctoproject.org/rel=
eases/yocto" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctopro=
ject.org/releases/yocto</a>&#39;<br>
-DEFAULT_RELEASE =3D &#39;yocto-4.1&#39;<br>
-DEFAULT_INSTALLER_VERSION =3D &#39;4.1&#39;<br>
+DEFAULT_BASE_URL =3D &#39;<a href=3D"https://downloads.yoctoproject.org/re=
leases/yocto" rel=3D"noreferrer" target=3D"_blank">https://downloads.yoctop=
roject.org/releases/yocto</a>&#39;<br>
+DEFAULT_RELEASE =3D &#39;yocto-4.0.21&#39;<br>
+DEFAULT_INSTALLER_VERSION =3D &#39;4.0.21&#39;<br></blockquote><div><br></=
div><div>This first patch in the series=C2=A0updates this version to 4.1.</=
div><div>What is the reason to downgrade=C2=A0this now on the last patch?</=
div><div><br></div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
=C2=A0DEFAULT_BUILDDATE =3D &#39;202110XX&#39;<br>
<br>
=C2=A0# Python version sanity check<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#204799): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/204799" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/204799</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108604377/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108604377/5052612</a><br>
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

--000000000000fc69640622c5b306--

