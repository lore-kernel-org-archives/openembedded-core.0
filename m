Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621E9C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:04:20 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.15646.1702998251105386697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:04:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kiBlKuKh;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b9dbbaa9a9so4281720b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702998250; x=1703603050; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AjbhymxEVB2KK/w05EmuBFuXY0VuCdUQsGVfd55Gezg=;
        b=kiBlKuKhapGl4YRVEAJKpn8UHi8sGX379NWQ1obR7OfSkCG/yICm/6GKbLNdjAsjDt
         HmOL8qOrZ3WMdjmjDhxcMYvnOxEM+kN/dJXXYK6sI1vX4gsL5eFKc17BAK5o8N9nEcY+
         JQEpGi9IixZ6VzWGiIs8iFXRRx+CfEFvaoeoizwc7qFVbQ3RBwZST437OGkCEJrN2+0R
         8gXiEeVsWuMggOEm/qr/nyxHGhBGnqeBdOnGtY/4PES9PgirmbQFur/Ep3SwGPM6SGHk
         Thf1o47A22JhGP86hm59Gv1/AWoYTweLPY8SPBsk5Eb212tnuPTQWrm+eLk+eyjpV4+R
         ufvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998250; x=1703603050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjbhymxEVB2KK/w05EmuBFuXY0VuCdUQsGVfd55Gezg=;
        b=pdAyMU6X+pzD32/f1nrh2HokM+mUtj7oWQE/NMp9ucVPjtJUqb1qV8Edtzz/CceZ7G
         uKlSBsIpQChVC1HdgURGmyYaMb8/cz5qYbsA/snUkey8Tp/+92g5v9uE4w3SNhsdcNKd
         6ZNzhm0w40icE9Xmalw4plL18Y3Xs/B3OTuaZ8Qb8iHwIMjq/2Y76GYYxukvHl86eb8g
         +bPh/qibhasmx4yQ3c+hNvTZYYN8zQjKbq8etnwqbNWwtxLEfJlmkHt+ttSsiTgKFEaP
         zdT6BTfEzfOMqA4y1mi+5M8bO1s11xj6PJwRAkkFMPwsIwAN4reP08Ecfp9oVjzpC++q
         264w==
X-Gm-Message-State: AOJu0Yx1sF7ndzaj3ftIJ5hA+3dciSJimv7Xoyi2mfUmPhbOpFkE2H2h
	dVZ0XDlE74uG5vZ6GwA/hB3Rx4N29UXrYrz3hSf/GIxZAeWVEw==
X-Google-Smtp-Source: AGHT+IHEvzfKGLZnJWlGqPWBpBqOt2YMNynaPqbDKuB1WUSUhOBjGn/JtoiZmtMG+xh4HyaOH0WQEKFXldPmuaN3AU4=
X-Received: by 2002:a05:6808:1416:b0:3b9:96a1:1f2c with SMTP id
 w22-20020a056808141600b003b996a11f2cmr24436559oiv.51.1702998250356; Tue, 19
 Dec 2023 07:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org> <20231219143531.3514266-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20231219143531.3514266-5-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 19 Dec 2023 15:03:59 +0000
Message-ID: <CANPvuRkcAQPdRKmUekp5K77hrzi6mvEk+kUQt3Fbj0kym-vnNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] oeqa/selftest/overlayfs: Don't overwrite DISTRO_FEATURES
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c408d6060cde2d2b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192745

--000000000000c408d6060cde2d2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
19/12/2023 =C3=A0(s) 14:35:

> Whilst debugging an autobuilder failure, I wondered why it was rebuilding
> qemu-system-native
> instead of reusing from sstate. The reason was it was overwriting
> DISTRO_FEATURES,
> in this case removing opengl which caused much to rebuild.
>
> The test doesn't need that so don't do it.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py
> b/meta/lib/oeqa/selftest/cases/overlayfs.py
> index 4031ded0fe4..a20fa6acc2d 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -79,7 +79,7 @@ DISTRO_FEATURES:append =3D " systemd overlayfs usrmerge=
"
>
>          config =3D """
>  IMAGE_INSTALL:append =3D " overlayfs-user"
> -DISTRO_FEATURES +=3D "systemd overlayfs usrmerge"
> +DISTRO_FEATURES:append "systemd overlayfs usrmerge"
>

The equal sign is not there and also the extra space before systemd.

DISTRO_FEATURES:append =3D " systemd overlayfs usrmerge"

Jose


>  OVERLAYFS_QA_SKIP[mnt-overlay] =3D "mount-configured"
>  """
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192744):
> https://lists.openembedded.org/g/openembedded-core/message/192744
> Mute This Topic: https://lists.openembedded.org/mt/103263022/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c408d6060cde2d2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 19/12/2023 =C3=A0(s) 14:35:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Whilst debugging an autobuilder=
 failure, I wondered why it was rebuilding qemu-system-native<br>
instead of reusing from sstate. The reason was it was overwriting DISTRO_FE=
ATURES,<br>
in this case removing opengl which caused much to rebuild.<br>
<br>
The test doesn&#39;t need that so don&#39;t do it.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/self=
test/cases/overlayfs.py<br>
index 4031ded0fe4..a20fa6acc2d 100644<br>
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py<br>
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py<br>
@@ -79,7 +79,7 @@ DISTRO_FEATURES:append =3D &quot; systemd overlayfs usrme=
rge&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D &quot;&quot;&quot;<br>
=C2=A0IMAGE_INSTALL:append =3D &quot; overlayfs-user&quot;<br>
-DISTRO_FEATURES +=3D &quot;systemd overlayfs usrmerge&quot;<br>
+DISTRO_FEATURES:append &quot;systemd overlayfs usrmerge&quot;<br></blockqu=
ote><div><br></div><div>The equal sign is not there and also the extra spac=
e before systemd.<br><br>DISTRO_FEATURES:append =3D &quot; systemd overlayf=
s usrmerge&quot;<div><br></div></div><div>Jose</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
=C2=A0OVERLAYFS_QA_SKIP[mnt-overlay] =3D &quot;mount-configured&quot;<br>
=C2=A0&quot;&quot;&quot;<br>
<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192744): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192744" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192744</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103263022/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103263022/5052612</a><br>
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

--000000000000c408d6060cde2d2b--

