Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03988C43217
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 22:56:56 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web12.2931.1649285083679199753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 15:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VMUzhs5U;
 spf=pass (domain: gmail.com, ip: 209.85.128.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2eb3db5b172so43179187b3.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 15:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xi6S2y9/+BURpch4dj2g0oMnHt3XiZ8Jo1UEOnzbKbk=;
        b=VMUzhs5UDBQoiCCVFxPWWd/b0zpegXcPLi6qJHDRMO6dp3j9cX/adRo1PtyAztx/Wm
         QHk5nyoa2hRuIR6uCfB/wokW+GV6i/nBuQ7E2DAi5h5zVRYtoGznEJdWpLr/g2AuP8Rt
         y6LkFZNjAy02rC123q7BxooeZoJr6X2ixwqwiFdEYdOWi1rpRhY4GpWEXBnt1VWMzIja
         OCO/NA7dhJCyyvoboNQ+VP1JjhJkjvuoRkPxH8/JXZ8Nczz9kVAG0WydvKSD/ND2bKX3
         1yESS/aMSrDZBKQLp99KhlJs10Eeh6fsuml2btQHxRhm8Ggg/nBt/3xEivZR1aQ96u94
         mEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xi6S2y9/+BURpch4dj2g0oMnHt3XiZ8Jo1UEOnzbKbk=;
        b=KkcFe58L8kLlVy6jpcN8J3Y/pj1eMZZ+7eSfhFwqp/DuzlKdNNt+/7Em23zt8mUgbp
         CEji3LDi53AOK2piKuLWhACBA3STzu8rssS+ep/hdlR73Hl2PGf+FgJeFt3aWu5TgL7v
         laF60VtjDQW6G15oEJ9A/MbAWtC94sMmsrZ5Ny5tF23UAX0JBbyRJ1Hw60SMWi7IP9fD
         6duC0aLxexUPoKlpmHxrot7/XrbdoyUA1FGQ3vko0q8iM+XXTPD2imfR0ATGbZsU7nDk
         lkZFu14kfxOASR6rfo9ugny6/8EyOJBzREw+jIKCR8ip4oZpGoyPo7PirxMWK9R0PGKx
         mZ4A==
X-Gm-Message-State: AOAM533M8yszAcmz7K5twEtm1c4GVbscJsHPK2MUJk6JQof3vfJs8awZ
	BA2FoUKu0M5IVkNyqDt2OHstWZrN3EoMmLBD57/PVnnqU3o=
X-Google-Smtp-Source: 
 ABdhPJwcypLR39OjB1SPkShXaF5P+geQIYHDh/LNo1/+G7yzmlvfRHKP+5ws9xWpeyc9LCm+O64gzfPSuqZA+vZDHiE=
X-Received: by 2002:a81:6188:0:b0:2eb:4bd3:9b86 with SMTP id
 v130-20020a816188000000b002eb4bd39b86mr8717349ywb.46.1649285082755; Wed, 06
 Apr 2022 15:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220406145959.60251-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220406145959.60251-1-sundeep.kokkonda@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Apr 2022 18:44:32 -0400
Message-ID: 
 <CAMKF1sptK8Yqit52waCJfai_0_i6iOnJ0wwErJcAOuGFHA=crA@mail.gmail.com>
Subject: 
 =?UTF-8?Q?Re=3A_=5BOE=2Dcore=5D_=5B=E2=80=9Dmaster=5D=E2=80=9D=5D_meta=3A_rust=3A_Bug_fix_fo?=
	=?UTF-8?Q?r_target_definitions_returning_=27NoneType=27_for_arm?=
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: openembedded-core@lists.openembedded.org, pgowda.cve@gmail.com,
	rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Content-Type: multipart/alternative; boundary="0000000000007db68905dc041bb5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 22:56:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164094

--0000000000007db68905dc041bb5
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 6, 2022 at 11:00 AM Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
wrote:

> The build shows below error while building for arm machines.
> Exception: TypeError: int() argument must be a string, a bytes-like object
> or a number, not 'NoneType'
> Detailed error info :
> https://lists.openembedded.org/g/openembedded-core/message/164004
>
> All the target definitions within tspec dictionary are generted as
> NoneType. The changes will fix this issue.


There is armv7-eabi just below it I wonder if that is correct or not

>
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc
> b/meta/recipes-devtools/rust/rust-common.inc
> index 310aecef22..230d78237f 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -119,13 +119,13 @@ def llvm_features(d):
>
>
>  ## arm-unknown-linux-gnueabihf
> -DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[arm-eabi] = "little"
> -TARGET_POINTER_WIDTH[arm-eabi] = "32"
> -TARGET_C_INT_WIDTH[arm-eabi] = "32"
> -MAX_ATOMIC_WIDTH[arm-eabi] = "64"
> -FEATURES[arm-eabi] = "+v6,+vfp2"
> +DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[arm] = "little"
> +TARGET_POINTER_WIDTH[arm] = "32"
> +TARGET_C_INT_WIDTH[arm] = "32"
> +MAX_ATOMIC_WIDTH[arm] = "64"
> +FEATURES[arm] = "+v6,+vfp2"
>
>  ## armv7-unknown-linux-gnueabihf
>  DATA_LAYOUT[armv7-eabi] =
> "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164084):
> https://lists.openembedded.org/g/openembedded-core/message/164084
> Mute This Topic: https://lists.openembedded.org/mt/90291532/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007db68905dc041bb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Apr 6, 2022 at 11:00 AM Sundeep KOKKONDA &lt;<a hre=
f=3D"mailto:sundeep.kokkonda@gmail.com">sundeep.kokkonda@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">The build shows below error =
while building for arm machines.<br>
Exception: TypeError: int() argument must be a string, a bytes-like object =
or a number, not &#39;NoneType&#39;<br>
Detailed error info : <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/message/164004" rel=3D"noreferrer" target=3D"_blank">https://lists=
.openembedded.org/g/openembedded-core/message/164004</a><br>
<br>
All the target definitions within tspec dictionary are generted as<br>
NoneType. The changes will fix this issue.</blockquote><div dir=3D"auto"><b=
r></div><div dir=3D"auto">There is armv7-eabi just below it I wonder if tha=
t is correct or not=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto">=
<br>
<br>
Signed-off-by: Sundeep KOKKONDA &lt;<a href=3D"mailto:sundeep.kokkonda@gmai=
l.com" target=3D"_blank">sundeep.kokkonda@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/rust/rust-common.inc | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devt=
ools/rust/rust-common.inc<br>
index 310aecef22..230d78237f 100644<br>
--- a/meta/recipes-devtools/rust/rust-common.inc<br>
+++ b/meta/recipes-devtools/rust/rust-common.inc<br>
@@ -119,13 +119,13 @@ def llvm_features(d):<br>
<br>
<br>
=C2=A0## arm-unknown-linux-gnueabihf<br>
-DATA_LAYOUT[arm-eabi] =3D &quot;e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n3=
2-S64&quot;<br>
-LLVM_TARGET[arm-eabi] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
-TARGET_ENDIAN[arm-eabi] =3D &quot;little&quot;<br>
-TARGET_POINTER_WIDTH[arm-eabi] =3D &quot;32&quot;<br>
-TARGET_C_INT_WIDTH[arm-eabi] =3D &quot;32&quot;<br>
-MAX_ATOMIC_WIDTH[arm-eabi] =3D &quot;64&quot;<br>
-FEATURES[arm-eabi] =3D &quot;+v6,+vfp2&quot;<br>
+DATA_LAYOUT[arm] =3D &quot;e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64=
&quot;<br>
+LLVM_TARGET[arm] =3D &quot;${RUST_TARGET_SYS}&quot;<br>
+TARGET_ENDIAN[arm] =3D &quot;little&quot;<br>
+TARGET_POINTER_WIDTH[arm] =3D &quot;32&quot;<br>
+TARGET_C_INT_WIDTH[arm] =3D &quot;32&quot;<br>
+MAX_ATOMIC_WIDTH[arm] =3D &quot;64&quot;<br>
+FEATURES[arm] =3D &quot;+v6,+vfp2&quot;<br>
<br>
=C2=A0## armv7-unknown-linux-gnueabihf<br>
=C2=A0DATA_LAYOUT[armv7-eabi] =3D &quot;e-m:e-p:32:32-i64:64-v128:64:128-a:=
0:32-n32-S64&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#164084): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/164084" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/164084</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90291532/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90291532/1997914</a><br>
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

--0000000000007db68905dc041bb5--

