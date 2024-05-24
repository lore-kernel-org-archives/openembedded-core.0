Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA3E0C25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 16:09:12 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.19730.1716566944606589543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 09:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6tF7c+e;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3c9b74043b1so4331038b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 09:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716566944; x=1717171744; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=boTgYrD7e6QZj2JIVXg1S12aDtUMAKza5BI34RJF2mE=;
        b=H6tF7c+eLtjTsA/EnUHGQwZi3BzUgPyAWQzJs+f41H5XVPZA6ehMu9Sm4ltqeM/otC
         zaoWqGgXGdZy7CADGxxBiRRmcQnFbmySLX4ICTIQy+hT1gM5yXHkhGBS8mJyD/WoeC8R
         sCSUevq5eafRS1iuAsZIX0X6EPTxeN0XYhjQMHDAgWtN4aGhAEwkAY/4bU0loL30NpJx
         oKWhkkH0+M1epmipUXs04Cua/MiOlFJr2fdLg05E6b3aePE/J3OBjJtALNOFvq+LZ4iq
         xI5qfFoBGI9l5t5Jifw38crQxyB5B2t/d35bRSzchd0vSLEW7ccyYgiWVfhDd8vhVOzG
         AjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716566944; x=1717171744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=boTgYrD7e6QZj2JIVXg1S12aDtUMAKza5BI34RJF2mE=;
        b=OdPusSxyy3FbkhHlmQLihH0ayCR2WdhF5d4lpNnZhHu67SFC87i/p6ANzMzrjeKamK
         ZU/3L1qLwjsPmj0hHgNGdY8DeErOe/1fIoMCH7UHiLaLq+sr+/qDclGBbPG9VkPI0umK
         kJLNWcwBSjIo9FCC2v6iQ8eC7X14JNXcHxj/HGrSGplItJeO7A5BV1/RXVGR4R1+9hMD
         LvEocDOr1epip8gQ5T1VAGlie9JDazXm3W4VYKR4GOaDOsvwNAzo1g498yVKiDm9OAJj
         +ehK1r9IOovCxTTWd5C0WH234PVwdgB5FxGtAskPtJb2BXNhiqvexIawioy1wPiJMDP5
         B4Sg==
X-Gm-Message-State: AOJu0Yzg+MT9EHNu7sQLuY9F/XCJCs8dcGGxqv9GJJ3x6vZ5YCGGOu89
	HIGBBDLGV49caIrPCsrxGK68F8zIyQ2HgXmDDsZVa8TD667w8Mk9NJ5d348yK8R96Kf/3D0E5V5
	xfRRMvpWHztwhMfZEbfEQAdf5L49Y6hAdQiM=
X-Google-Smtp-Source: AGHT+IEXVwinQYRvWRKtRENHLZ1U1S+RE5AaCCiJNp9vpLn5AvnJlAysgdBAiSRjmQHFynBM1fy1eVaHZlbmWWAhgEY=
X-Received: by 2002:a05:6808:1118:b0:3c9:a316:d52a with SMTP id
 5614622812f47-3d1a7c30f4fmr2308412b6e.53.1716566943800; Fri, 24 May 2024
 09:09:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20240524151838.2450718-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 24 May 2024 17:08:52 +0100
Message-ID: <CANPvuRk9gEcdqPts-T3tHRS2jZFNiN9+qBQEr_-RY_=h7jzwuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] layer.conf: Add os-release to SIGGEN_EXCLUDERECIPES_ABISAFE
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eb25f1061935628d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 16:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199856

--000000000000eb25f1061935628d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie via lists.openembedded.org <richard.purdie=3D
linuxfoundation.org@lists.openembedded.org> escreveu (sexta, 24/05/2024
=C3=A0(s) 16:18):

> This rebuilds whenever DISTRO_VERSION changes (i.e. any commit is made)
> and systemd depends upon it so lots of things end up rebuilding which
> isn't necessary,
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index f2bca0aa5ba..65eb657fd93 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    ca-certificates \
>    shared-mime-info \
>    desktop-file-utils \
> +  os-release \
>

Acked-by: Jose Quaresma <j <martin.jansa@gmail.com>ose.quaresma@foundries.i=
o
>

I've had this on the Linux microPlatform distro for a while now but I
forgot to submit
https://github.com/foundriesio/meta-lmp/blob/efe9acade717181a5b9d3c520d90aa=
53049abb27/meta-lmp-base/conf/layer.conf#L37

Jose

 "
>
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199852):
> https://lists.openembedded.org/g/openembedded-core/message/199852
> Mute This Topic: https://lists.openembedded.org/mt/106283450/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000eb25f1061935628d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;richard.purdie=3D<a =
href=3D"mailto:linuxfoundation.org@lists.openembedded.org">linuxfoundation.=
org@lists.openembedded.org</a>&gt; escreveu (sexta, 24/05/2024 =C3=A0(s) 16=
:18):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This rebui=
lds whenever DISTRO_VERSION changes (i.e. any commit is made)<br>
and systemd depends upon it so lots of things end up rebuilding which<br>
isn&#39;t necessary,<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/layer.conf | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index f2bca0aa5ba..65eb657fd93 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -45,6 +45,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D &quot; \<br>
=C2=A0 =C2=A0ca-certificates \<br>
=C2=A0 =C2=A0shared-mime-info \<br>
=C2=A0 =C2=A0desktop-file-utils \<br>
+=C2=A0 os-release \<br></blockquote><div><br></div><span class=3D"gmail-il=
" style=3D"color:rgb(0,0,0)">Acked</span><span style=3D"color:rgb(0,0,0)">-=
by: Jose Quaresma &lt;</span><a href=3D"mailto:martin.jansa@gmail.com" targ=
et=3D"_blank">j</a><a href=3D"mailto:ose.quaresma@foundries.io">ose.quaresm=
a@foundries.io</a><span style=3D"color:rgb(0,0,0)">&gt;<br></span><br>I&#39=
;ve had this on the Linux microPlatform distro for a while now but I forgot=
 to submit</div><div class=3D"gmail_quote"><a href=3D"https://github.com/fo=
undriesio/meta-lmp/blob/efe9acade717181a5b9d3c520d90aa53049abb27/meta-lmp-b=
ase/conf/layer.conf#L37">https://github.com/foundriesio/meta-lmp/blob/efe9a=
cade717181a5b9d3c520d90aa53049abb27/meta-lmp-base/conf/layer.conf#L37</a><b=
r>=C2=A0<br>Jose</div><div class=3D"gmail_quote"><br><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199852): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199852" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199852</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106283450/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/106283450/5052612</a><br>
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

--000000000000eb25f1061935628d--

