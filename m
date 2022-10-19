Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B82C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 05:51:10 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.4782.1666158660767794124
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 22:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VVp1gUFf;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id b18so20752942ljr.13
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BgjevFmQj4o41ZOlWZ0dxk6i/6A0GNwF7lPK4wDelRA=;
        b=VVp1gUFfyjNh23CGMi5U/JWyORGvVvbKfMHqEeJkkJz6Teg3jnqgd4gszBXxNYmOJH
         595GJsdhM4MZviHgkK+q/qWgW4T64vH1kX7ZN3rhWY5P23c0V/HynTX4AjdYW81H3tEf
         vFDlELu7/pLt6avCUqrSPjVo0cMnVWOnv6iOAO6vO9BBzYrM8WA3agql8uoA/1wd7Vad
         Y0xL2pGN30/x8YVnbE2WRL8l3BdW4RObsOiPLXISSstfj6yCv2odcue40RXciqWRQTbN
         duBgNzmRTUUO61GPWGw/uC33/XF8507Q79KTtvnH2HmraV7NZsDOBSQr5XrEmED4+oeR
         eEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BgjevFmQj4o41ZOlWZ0dxk6i/6A0GNwF7lPK4wDelRA=;
        b=KRV9UvPHqOf0nB4W0I3WP16mfhNmSZGwLT72WwNHQzClniJYqZaI4AXzXJ8aCYRhUv
         7WzWHBE2dyH8ytNaPQU3XR4TJDfRxggRTmxT0yYXo+59AfBbPvyh7zdJ3/tgI567maxP
         ffuHmeBSAAvj1W3hEY0xzedaLG15W+3tbj02IgSw7HYhWop2298dPErdlPIN/uGNGTbg
         l+kz8igmY906zbsQ0Q9RdwAS7DgYbAy1UZ/Gi94U0XBc9Ghy9MY9RQV4524fV4GvVf0d
         ApJdIMEfoaCVvcMJ873N4ltjBzEYy31CheJmXxSMDoRCgTDlCbtRqif0xt3FzTiS53ZV
         60Lg==
X-Gm-Message-State: ACrzQf3GOBas/NVcHJWdIzhx715AoWQ9QW2kh1iziHRa2VcEB8YjGRP9
	PpB2W8C7ijDPep1dtMJd7BUhOycKIh5cteBq+lA=
X-Google-Smtp-Source: AMsMyM44QsDi/akbUUYu6RuwpXfDEPa2nhf+A9OYNylI2n1b7K+8NjTRHDxzmvYjeAZVXPbqvXFtitTt4r3RjAC7AOw=
X-Received: by 2002:a05:651c:1950:b0:26f:e54b:8c54 with SMTP id
 bs16-20020a05651c195000b0026fe54b8c54mr2134362ljb.108.1666158658684; Tue, 18
 Oct 2022 22:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <171F61FEE1540458.9064@lists.openembedded.org>
In-Reply-To: <171F61FEE1540458.9064@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Oct 2022 07:50:47 +0200
Message-ID: <CANNYZj8sYJ9-RfzTAwpiiPSmmSRQvrjhTyFYPn-hub0eSUC2PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: alex.kanavin@gmail.com
Cc: Kai Kang <kai.kang@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fd8ca105eb5cca11"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Oct 2022 05:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171955

--000000000000fd8ca105eb5cca11
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Come to think of it, the right thing to do is to actually not do anything
at all, just adjust the patch explaining that it is needed on 18.04 hosts.
Is there a problem when it is applied for the target?

Alex

On Wed 19. Oct 2022 at 7.42, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:

> Can you show examples where this is needed? Custom variable does not seem
> a good idea. I also worry that it=E2=80=99ll break automated updates (it=
=E2=80=99s bad
> enough with mesa-gl, this might make it worse)
>
> Alex
>
> On Wed 19. Oct 2022 at 1.08, Khem Raj <raj.khem@gmail.com> wrote:
>
>> This helps override the SRC_URI in entirety if needed by
>> and overriding recipe
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2: Weakly define NATIVE_PATCHES
>>
>>  meta/recipes-graphics/mesa/mesa.inc | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>> index c94e439363..04d78a6aa5 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -19,10 +19,11 @@ SRC_URI =3D "
>> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>>
>> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>>             file://0001-util-format-Check-for-NEON-before-using-it.patch=
 \
>> +           ${NATIVE_PATCHES} \
>>             "
>> -
>> +NATIVE_PATCHES ?=3D ""
>>  # required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD
>> enabled
>> -SRC_URI:append:class-native =3D "
>> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>> +NATIVE_PATCHES:class-native =3D
>> "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
>>
>>  SRC_URI[sha256sum] =3D
>> "b1f9c8fd08f2cae3adf83355bef4d2398e8025f44947332880f2d0066bdafa8c"
>>
>> --
>> 2.38.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171954):
> https://lists.openembedded.org/g/openembedded-core/message/171954
> Mute This Topic: https://lists.openembedded.org/mt/94420106/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fd8ca105eb5cca11
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Come to think of it, the right thing to do is to actually=
 not do anything at all, just adjust the patch explaining that it is needed=
 on 18.04 hosts. Is there a problem when it is applied for the target?</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed 19. Oct 2022=
 at 7.42, Alexander Kanavin via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)"><div><div dir=3D"auto">Can you show examples where thi=
s is needed? Custom variable does not seem a good idea. I also worry that i=
t=E2=80=99ll break automated updates (it=E2=80=99s bad enough with mesa-gl,=
 this might make it worse)</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Alex</div></div><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed 19. Oct 2022 at 1.08, Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div></div></div></div><div><div><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)" dir=3D"auto">This helps override the SRC_URI in entirety if need=
ed by<br>
and overriding recipe<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank=
">kai.kang@windriver.com</a>&gt;<br>
---<br>
v2: Weakly define NATIVE_PATCHES<br>
<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index c94e439363..04d78a6aa5 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -19,10 +19,11 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.o=
rg/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http=
s://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-meson-misdetects-64bi=
t-atomics-on-mips-clang.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-util-format-Check-for=
-NEON-before-using-it.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${NATIVE_PATCHES} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
+NATIVE_PATCHES ?=3D &quot;&quot;<br>
=C2=A0# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUI=
LD enabled<br>
-SRC_URI:append:class-native =3D &quot; file://0001-nir-nir_opt_move-fix-AL=
WAYS_INLINE-compiler-error.patch&quot;<br>
+NATIVE_PATCHES:class-native =3D &quot;file://0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b1f9c8fd08f2cae3adf83355bef4d2398e8025f4=
4947332880f2d0066bdafa8c&quot;<br>
<br>
-- <br>
2.38.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div><div><div><div class=3D"gmail_quote"></div><=
/div>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171954): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171954" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171954</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94420106/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94420106/1686489</a><br>
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

--000000000000fd8ca105eb5cca11--

