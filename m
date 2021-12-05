Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A69C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 18:48:08 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web12.41213.1638730087333460676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 10:48:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TJkgynFi;
 spf=pass (domain: gmail.com, ip: 209.85.219.176,
 mailfrom: workjagadeesh@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id y68so25281701ybe.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 10:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gdr1Vf0NpWXrYrY5G1hoOtrv4xDTbzVtCNeoqS8bgEQ=;
        b=TJkgynFi5nRCltrxNuIBrRvLYD2bY2uxgJ1PCOooOcs1rs0LHMSseJ5x0USPr3RkrX
         vkAn1MA74erKOQXz6rRYTvMBLLAUdTiIbkg1xK6ktTBOhVsZWayhfMGv5qcCjajqR10F
         5AJqZW86kxEVFuQUQoCvVk76hv8ZQya3UD8Z9ZUlsQ51/raOmVJIbhmNLFUqt9O3hv6l
         qD/jVPx8btpKpkJ95s2tbd9Do7ToMIpx7dhg+HICso/3QcKTUqX3q8uZSolOrh+7EN4h
         7SwQm0f0vsCpNaYS1DAANehtx1tk8G3He/Aj2U2C+/T2uwjJsdJFSXNz4L3bhqrMxaOe
         T19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gdr1Vf0NpWXrYrY5G1hoOtrv4xDTbzVtCNeoqS8bgEQ=;
        b=06PH7M9mLQm8BEDZbYMoquA+0EQDRi8UZIGuQ9eh9sHVjs0Us/qcfRhtIw1iZF9qkH
         D/N/Iw5B5I9NzsfzlUrYd2u4f9BjQNecctzE9hjau/ZzUKdO3DA7qNCQuQt7BaA6rQmR
         JEk5SGG6lrBf5zMcWUVwHKTomXj4EGnzIytHXTb0wZ3dzHpATbMrnoHUo0BK7aGACZWd
         PHll+hHzNLktbZ67JGssYK6A+yQ6iKtQ6r+ELh5UXEffQYHXItO0TMLakaiT/tEjZ9lE
         BkG/3N75wi41/CwCG3YH2Tl/fITNvZwYnugoMoXDsJnEN+DoadXGaqcUgazFPoGOYnRb
         +LPA==
X-Gm-Message-State: AOAM531zkPkoCvyq+QYaQbI5NOpuyxYlPjgyzT/2N2Y4FOzEBc/AO8bO
	49NhWu08iSsv2wOEjysD8+wEZhMCrC+M8P/zymQ=
X-Google-Smtp-Source: 
 ABdhPJz6HkSo2xlqx8CfDo9oHFihzMw0J6adAaKCQGomI4Fm1iChbrYOZR9yAD/pDFtbOrLb1I0ZJUHWOXLO9WHrPTI=
X-Received: by 2002:a25:b50:: with SMTP id 77mr38667890ybl.72.1638730086521;
 Sun, 05 Dec 2021 10:48:06 -0800 (PST)
MIME-Version: 1.0
References: <20211205113631.609-1-workjagadeesh@gmail.com>
 <CAMKF1sq4StttMsyOfM72Vp5VNpe0EF=hQ1QmkfRrmmX4gnqMZQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sq4StttMsyOfM72Vp5VNpe0EF=hQ1QmkfRrmmX4gnqMZQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
Date: Mon, 6 Dec 2021 00:17:58 +0530
Message-ID: 
 <CAM682A2U2NVQW5sdT6FUqJudjm5A0bMCR=UjkM+B_bAgTfUXfQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] tune-cortexa72: Add new tune for crc and crypto
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b09db705d26a94f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 18:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159200

--000000000000b09db705d26a94f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

So far only rpi4 cortexa72 SOCs are one which don=E2=80=99t have crypto are=
 you
aware of some others ?
JK: I do not know other SoCs which do not have crypto. The change is
similar to other
meta/conf/machine/include/arm/armv8a/tune-cortexa*.inc files where crypto
has been added as
separate DEFAULTTUNE.

Regards,
Jagadeesh


On Sun, Dec 5, 2021 at 10:54 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On Sun, Dec 5, 2021 at 3:36 AM Jagadeesh Krishnanjanappa <
> workjagadeesh@gmail.com> wrote:
>
>> The newly added cortexa72-crypto tune builds programs for armv8a
>> with crc+crypto. Whereas default tune cortexa72 builds programs
>> with armv8a only.
>
>
> There is another patch I sent to add converse infact to support nocrypto
> instead because this change you propose will regress existing cortexa72
> tunes for machines which have crypto aes implemented in hardware and it
> will be not backward compatible since many bsps try to support multiple
> releases
> So far only rpi4 cortexa72 SOCs are one which don=E2=80=99t have crypto a=
re you
> aware of some others ?
>
>>
>>
>> [YOCTO #14641]
>>
>> Signed-off-by: Jagadeesh Krishnanjanappa <workjagadeesh@gmail.com>
>> ---
>>  .../conf/machine/include/arm/armv8a/tune-cortexa72.inc | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
>> b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
>> index 2a510bd45b..8c32286c84 100644
>> --- a/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
>> +++ b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
>> @@ -6,8 +6,12 @@ TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES',
>> 'cortexa72', ' -mcpu=3Dcorte
>>  require conf/machine/include/arm/arch-armv8a.inc
>>
>>  # Little Endian base configs
>> -AVAILTUNES +=3D "cortexa72"
>> +AVAILTUNES +=3D "cortexa72 cortexa72-crypto"
>>  ARMPKGARCH:tune-cortexa72             =3D "cortexa72"
>> -TUNE_FEATURES:tune-cortexa72          =3D
>> "${TUNE_FEATURES:tune-armv8a-crc-crypto} cortexa72"
>> -PACKAGE_EXTRA_ARCHS:tune-cortexa72    =3D
>> "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72"
>> +ARMPKGARCH:tune-cortexa72-crypto      =3D "cortexa72"
>> +TUNE_FEATURES:tune-cortexa72          =3D "${TUNE_FEATURES:tune-armv8a}
>> cortexa72"
>> +TUNE_FEATURES:tune-cortexa72-crypto   =3D "${TUNE_FEATURES:tune-cortexa=
72}
>> crc crypto"
>> +PACKAGE_EXTRA_ARCHS:tune-cortexa72    =3D
>> "${PACKAGE_EXTRA_ARCHS:tune-armv8} cortexa72"
>> +PACKAGE_EXTRA_ARCHS:tune-cortexa72-crypto    =3D
>> "${PACKAGE_EXTRA_ARCHS:tune-armv8a-crc-crypto} cortexa72 cortexa72-crypt=
o"
>>  BASE_LIB:tune-cortexa72               =3D "lib64"
>> +BASE_LIB:tune-cortexa72-crypto        =3D "lib64"
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159190):
>> https://lists.openembedded.org/g/openembedded-core/message/159190
>> Mute This Topic: https://lists.openembedded.org/mt/87515896/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000b09db705d26a94f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"box-sizing:border-box;color:rgb(51,51,51);fo=
nt-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:1=
4px">So far only rpi4 cortexa72 SOCs are one which don=E2=80=99t have crypt=
o are you aware of some others ?=C2=A0</div>JK: I do not know other SoCs wh=
ich do not have crypto. The change is similar to other=C2=A0<div>meta/conf/=
machine/include/arm/armv8a/tune-cortexa*.inc files where crypto has been ad=
ded as</div><div>separate DEFAULTTUNE.</div><div><br></div><div>Regards,</d=
iv><div>Jagadeesh</div><div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 5, 2021 at 10:54 PM Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br></=
div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Dec 5, 2021 at 3:36 AM Jagadeesh Krishnanjanappa &lt;<a href=3D"=
mailto:workjagadeesh@gmail.com" target=3D"_blank">workjagadeesh@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Th=
e newly added cortexa72-crypto tune builds programs for armv8a<br>
with crc+crypto. Whereas default tune cortexa72 builds programs<br>
with armv8a only.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>There is another patch I sent to add converse infact to support nocrypto i=
nstead because this change you propose will regress existing cortexa72 tune=
s for machines which have crypto aes implemented in hardware and it will be=
 not backward compatible since many bsps try to support multiple releases=
=C2=A0</div><div dir=3D"auto">So far only rpi4 cortexa72 SOCs are one which=
 don=E2=80=99t have crypto are you aware of some others ?=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex" dir=3D"auto"><br>
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
</blockquote></div>

--000000000000b09db705d26a94f2--

