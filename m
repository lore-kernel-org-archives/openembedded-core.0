Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285DBC433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 17:24:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.40006.1638725069579431913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 09:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ri7MkaSc;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id m192so9040699qke.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 09:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LqezbbW5ILi4dRplQGdxUPPPLBK5M3yHsBN26R6tOjY=;
        b=Ri7MkaSc+SWXwH6p1FgwkJjPhWEyz3lBSP78efFD6x5Ckrj1Jj0yuZSoMN9v3LDtFE
         HlYj1mvseV+qqvZDu3eOlHHaEhy7yozT31LeGt1djhQDeqhb/e0CXU06ueejM6J1xTLe
         HTk+ZNFEbSSMbplclGXAbb27FlEHYF5ellw/rLqwtd/+9SRvwO29k8/i4tQP/PrGawAq
         lmoIlZiEpWcCEkviliQCM+ACynPsiX1gpomNJjVHrxfqwV6VCt/O3KVxGGADFmg50L/3
         j/wqyNQiffs0B1iDispH1PPIir/Zmr4M9p7c/RfDuUOzGPUj/oPumzkY1zEnG4XmyVae
         MDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LqezbbW5ILi4dRplQGdxUPPPLBK5M3yHsBN26R6tOjY=;
        b=qtEfKTRVOto5uyAkBl+RPPqHE+gqJT8x0fRYvjrxiIEsw5sJRQ2yqs/jUzHDZ1v90Q
         z2axivLfjFMGS/BAj4z1jis1EKnwLq/+bQmUAWvEK6WLatwy7H/DooCowfdKPsKiLfds
         LiPSOL5005CDxg4lof6CKIV9KLaIeE1j6/Yq0xEJzwwDUo4Qy2pvVbuBvgDAlw9GPaM8
         0AiPd9lc5YFZzyReFlb4R9ai/Rhi7dH/0n/5633U3G5sSAtVLdJzF9xA61hZw4+//Opu
         /pObNQ7CCRaDGAlDr/afwVaOB9gskkqOyfD5VvjyW1bPzDydjDCMl4wq41xL4nGLHn0g
         lJig==
X-Gm-Message-State: AOAM532oZPyqroZDku7HUhloCnPYab1c4h1WAGbDHKXJGkU4w9HctnUz
	Ly6T0zMnT5hL8SA8GwpHtRgSDmrnukyyjdbIO69AcJvqATU=
X-Google-Smtp-Source: 
 ABdhPJwNFbOPk/wtrsvNZQp4rgJ+xNDBWAqySIoAwiHmguJj+0Pi34uifYO+M0M61iMH3CjEJZmrgkjiNL7TKbVGOQ4=
X-Received: by 2002:a05:620a:f94:: with SMTP id
 b20mr28513848qkn.463.1638725068616;
 Sun, 05 Dec 2021 09:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20211205113631.609-1-workjagadeesh@gmail.com>
In-Reply-To: <20211205113631.609-1-workjagadeesh@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 5 Dec 2021 09:24:18 -0800
Message-ID: 
 <CAMKF1sq4StttMsyOfM72Vp5VNpe0EF=hQ1QmkfRrmmX4gnqMZQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tune-cortexa72: Add new tune for crc and crypto
To: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000099765c05d26969e1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 17:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159198

--00000000000099765c05d26969e1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 5, 2021 at 3:36 AM Jagadeesh Krishnanjanappa <
workjagadeesh@gmail.com> wrote:

> The newly added cortexa72-crypto tune builds programs for armv8a
> with crc+crypto. Whereas default tune cortexa72 builds programs
> with armv8a only.


There is another patch I sent to add converse infact to support nocrypto
instead because this change you propose will regress existing cortexa72
tunes for machines which have crypto aes implemented in hardware and it
will be not backward compatible since many bsps try to support multiple
releases
So far only rpi4 cortexa72 SOCs are one which don=E2=80=99t have crypto are=
 you
aware of some others ?

>
>
> [YOCTO #14641]
>
> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
> ---
>  .../conf/machine/include/arm/armv8a/tune-cortexa72.inc | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> index 2a510bd45b..8c32286c84 100644
> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
> @@ -6,8 +6,12 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES',
> 'cortexa72', ' -mcpu=3Dcorte
>  require conf/machine/include/arm/arch-armv8a.inc
>
>  # Little Endian base configs
> -AVAILTUNES +=3D "cortexa72"
> +AVAILTUNES +=3D "cortexa72 cortexa72-crypto"
>  ARMPKGARCH:tune-cortexa72             =3D "cortexa72"
> -TUNE_FEATURES:tune-cortexa72          =3D
> "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
> -PACKAGE_EXTRA_ARCHS:tune-cortexa72    =3D
> "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
> +ARMPKGARCH:tune-cortexa72-crypto      =3D "cortexa72"
> +TUNE_FEATURES:tune-cortexa72          =3D "${TUNE_FEATURES:tune-armv8a}
> cortexa72"
> +TUNE_FEATURES:tune-cortexa72-crypto   =3D "${TUNE_FEATURES:tune-cortexa7=
2}
> crc crypto"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72    =3D
> "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto    =3D
> "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto=
"
>  BASE_LIB:tune-cortexa72               =3D "lib64"
> +BASE_LIB:tune-cortexa72-crypto        =3D "lib64"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159190):
> https://lists.openembedded.org/g/openembedded-core/message/159190
> Mute This Topic: https://lists.openembedded.org/mt/87515896/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000099765c05d26969e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Dec 5, 2021 at 3:36 AM Jagadeesh Krishnanjanappa &l=
t;<a href=3D"mailto:workjagadeesh@gmail.com">workjagadeesh@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">The newly added cortexa72-=
crypto tune builds programs for armv8a<br>
with crc+crypto. Whereas default tune cortexa72 builds programs<br>
with armv8a only.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>There is another patch I sent to add converse infact to support nocrypto i=
nstead because this change you propose will regress existing cortexa72 tune=
s for machines which have crypto aes implemented in hardware and it will be=
 not backward compatible since many bsps try to support multiple releases=
=C2=A0</div><div dir=3D"auto">So far only rpi4 cortexa72 SOCs are one which=
 don=E2=80=99t have crypto are you aware of some others ?=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex" dir=3D"auto"><br>
<br>
[YOCTO #14641]<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:workjagadees=
h@gmail.com" target=3D"_blank">workjagadeesh@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../conf/machine/include/arm/armv8a/tune-cortexa72.inc | 10 +++++++--=
-<br>
=C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc b/meta=
/conf/machine/include/arm/armv8a/tune-cortexa72.inc<br>
index 2a510bd45b..8c32286c84 100644<br>
--- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc<br>
+++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc<br>
@@ -6,8 +6,12 @@ TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEAT=
URES&#39;, &#39;cortexa72&#39;, &#39; -mcpu=3Dcorte<br>
=C2=A0require conf/machine/include/arm/arch-armv8a.inc<br>
<br>
=C2=A0# Little Endian base configs<br>
-AVAILTUNES +=3D &quot;cortexa72&quot;<br>
+AVAILTUNES +=3D &quot;cortexa72 cortexa72-crypto&quot;<br>
=C2=A0ARMPKGARCH:tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa72&quot;<br>
-TUNE_FEATURES:tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;$=
{TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72&quot;<br>
-PACKAGE_EXTRA_ARCHS:tune-cortexa72=C2=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_=
ARCHS:tune-armv8a-crc-crypto} cortexa72&quot;<br>
+ARMPKGARCH:tune-cortexa72-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortexa72&q=
uot;<br>
+TUNE_FEATURES:tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;$=
{TUNE_FEATURES:tune-armv8a} cortexa72&quot;<br>
+TUNE_FEATURES:tune-cortexa72-crypto=C2=A0 =C2=A0=3D &quot;${TUNE_FEATURES:=
tune-cortexa72} crc crypto&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-cortexa72=C2=A0 =C2=A0 =3D &quot;${PACKAGE_EXTRA_=
ARCHS:tune-armv8} cortexa72&quot;<br>
+PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto=C2=A0 =C2=A0 =3D &quot;${PACKAGE=
_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto&quot;<br>
=C2=A0BASE_LIB:tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
+BASE_LIB:tune-cortexa72-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;lib64&=
quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159190): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159190" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159190</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87515896/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87515896/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000099765c05d26969e1--

