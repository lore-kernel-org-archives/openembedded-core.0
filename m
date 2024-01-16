Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F09C47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 17:21:06 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.22299.1705425659693124555
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 09:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZDTZrnX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso113996631fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705425658; x=1706030458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tu2RSEidH3sSNfGy/pJTnAVrbD6s/1Qkzj67uNQo0qQ=;
        b=aZDTZrnX/69Kj9IGMSAWoN0tpyflperqubzi5CAVkVxQTcfpc79kqOkLK/MLO6UWyh
         wDZYdcvLe+lFQCIB/5XpUARvhx59RktJeCAKIvRLzPVcwhSCXFouVwd6dbTHA4hFk/U3
         KSnpSnl6WyATQWcg8XaaQxMoDDk+Xv9l0jvmhJ2yY2aRiPrjx7NyiM+/X5NtQXouNtuK
         NyzASYLu73bLfOouz7GhCUWY5KODierWn1ourQ/kzulqdVqr1Ecivp2SJRFbyvCrbnU+
         vCTLjFY0hu33xImk4yGmuZ/qmA3sfBuZP6LsT1RDIP42Y2ApAu04jhOCqHbnOUcxGwrw
         kNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705425658; x=1706030458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tu2RSEidH3sSNfGy/pJTnAVrbD6s/1Qkzj67uNQo0qQ=;
        b=ULfoDSnJGVrxrrc81bFsDtw5FPsaVl5nzQLRyZArNhRK9nWRq/NeNDpBE2UFI5rUkv
         kUvJoVCQi/+LjyifdmzivLJ+YF//RIN0NlxTe6VkbiFhq70q9rNyuXgcRJKTmJSPuIzK
         dfQq4A3BiVupJ8Zy/vN0JUSRMXetma9mhPRpYfLZeO5eKeyDl85kOEn5yJ30fU8TnsTw
         vXcLvsQ/2Tt/Ii/j7+MqYU8v/bmaAoBrpVUDzm+jsm8ZupNkU0cJ+SXfO/lMC/CqzK8k
         VuxDZ7JqbBrlm5AnK+KIszsEtLiYBlauLfbX2BkVnh5GP16bDcd1bM/qSUORV5+RTT0t
         W6BQ==
X-Gm-Message-State: AOJu0YyvI6gePpiYgILicNwwoQKW51p2+ElexoCz/bL1zTAqs/PHucm5
	veaTw7bysVrQmq9ieI9IR/2HqJQvPvvD/mA4VzQ=
X-Google-Smtp-Source: AGHT+IF3sbg1dtjA/v3rOeGHacAYwQ+AZ+JAfKmO10ghwZkGjSm7iLvQom3I/R8Msf3knj54xu5v0EYHuv/w9KxIafw=
X-Received: by 2002:a2e:8193:0:b0:2cd:217:4605 with SMTP id
 e19-20020a2e8193000000b002cd02174605mr3498632ljg.50.1705425657401; Tue, 16
 Jan 2024 09:20:57 -0800 (PST)
MIME-Version: 1.0
References: <20240116165602.2053194-1-William.Lyu@windriver.com> <20240116165602.2053194-2-William.Lyu@windriver.com>
In-Reply-To: <20240116165602.2053194-2-William.Lyu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Jan 2024 18:20:46 +0100
Message-ID: <CANNYZj_OVth=cfNE_+VY4gb27hNcx45VagwZf1J_eEUEm0Ltvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] openssl: Fix ptest dependencies on
 perl-module-* being ignored by COMPLEMENTARY_GLOB
To: william.lyu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000801454060f135adc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193868

--000000000000801454060f135adc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

How about simple depending on specific module packages? I don=E2=80=99t thi=
nk
OpenSSL truly needs all modules.

Alex

On Tue 16. Jan 2024 at 17.56, Lyu, William via lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:

> From: William Lyu <William.Lyu@windriver.com>
>
> Change the openssl-ptest RDEPENDS from perl-modules to
> perl-modules-force-all which RDEPENDS on the same set of packages
> perl-module-* recommended by perl-modules. So, when openssl-ptest is
> added via COMPLEMENTARY_GLOB "ptest-pkgs", its dependencies on these
> perl-module-* packages still get added.
>
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> index d041d2d214..7076bd3a7b 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
> @@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D
> "${sysconfdir}/ssl/openssl.cnf"
>
>  RRECOMMENDS:libcrypto +=3D "openssl-conf ${PN}-ossl-module-legacy"
>  RDEPENDS:${PN}-misc =3D "perl"
> -RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
> +RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules-force-all bash =
sed"
>
>  RDEPENDS:${PN}-bin +=3D "openssl-conf"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193866):
> https://lists.openembedded.org/g/openembedded-core/message/193866
> Mute This Topic: https://lists.openembedded.org/mt/103766390/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000801454060f135adc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">How about simple depending on specific module packages? I=
 don=E2=80=99t think OpenSSL truly needs all modules.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Tue 16. Jan 2024 at 17.56, Lyu, W=
illiam via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;william.lyu=3D<a href=3D"mailto:windriver.com@lists.openembedded.o=
rg">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width=
:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204=
,204)">From: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com" t=
arget=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
<br>
Change the openssl-ptest RDEPENDS from perl-modules to<br>
perl-modules-force-all which RDEPENDS on the same set of packages<br>
perl-module-* recommended by perl-modules. So, when openssl-ptest is<br>
added via COMPLEMENTARY_GLOB &quot;ptest-pkgs&quot;, its dependencies on th=
ese<br>
perl-module-* packages still get added.<br>
<br>
Signed-off-by: William Lyu &lt;<a href=3D"mailto:William.Lyu@windriver.com"=
 target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
2.0.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a> b/meta/re=
cipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb" rel=3D"noref=
errer" target=3D"_blank">openssl_3.2.0.bb</a><br>
index d041d2d214..7076bd3a7b 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.2.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">openssl_3.2.0.bb</a><br>
@@ -247,7 +247,7 @@ CONFFILES:openssl-conf =3D &quot;${sysconfdir}/ssl/open=
ssl.cnf&quot;<br>
<br>
=C2=A0RRECOMMENDS:libcrypto +=3D &quot;openssl-conf ${PN}-ossl-module-legac=
y&quot;<br>
=C2=A0RDEPENDS:${PN}-misc =3D &quot;perl&quot;<br>
-RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules bash sed&quo=
t;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;openssl-bin perl perl-modules-force-all ba=
sh sed&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-bin +=3D &quot;openssl-conf&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#193866): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/193866" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/193866</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103766390/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103766390/1686489</a><br>
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

--000000000000801454060f135adc--

