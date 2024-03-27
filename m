Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB32CC47DD9
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 11:34:56 +0000 (UTC)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
 by mx.groups.io with SMTP id smtpd.web11.35270.1711539294722335419
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 04:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bogCpHOT;
 spf=pass (domain: gmail.com, ip: 209.85.221.181, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4d452e2f0aeso2481427e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 04:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711539293; x=1712144093; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3Mw1NtBsBmYqcMwhqUPjRMPiY42cZxdNtLbirwWAHw=;
        b=bogCpHOTTi88XV9umCGkM+rEA1jA88RhwNv5LT2K2WKQcbK48LNR/sdyeCk4nE0dCG
         NdwLmrX6utZ8TTuBg/OVGGwYqD1f5TAbMgEEvOoGQSFHd3Y9a429iQOfIF3hq+pPO+3c
         cTGJ+KNxRgQjbHZS55YikNsGX68tx97LKxoNiNanpk5nRD/ijmPDjR7yh9gZ/I5Zy0y0
         eOY+DyWn44kpcclOZoeSeUySeXFG/pX1O4Razmnat3eJvarl2njSNOtElliPvzZVX9Zx
         JhIMAP8ca6F7c3W2Vu4h40d4RPZLFFdUkpDkZ6g7iisTkbMtKMyT3KirDUeiqAcdkgxT
         HH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539293; x=1712144093;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3Mw1NtBsBmYqcMwhqUPjRMPiY42cZxdNtLbirwWAHw=;
        b=GqdVfQPltZpQ7H4VkE+bATZPABEFCmDhjXt5/W+dMaYecfPSS3Dj/7vi4IjNqR+QA0
         /VRhkLSAM+MgFHRRW/erpVKjfyXmGD9SaMnCl3IcGeQGv2YhboWpiiNANo2BJOsCT/xD
         bT4lHFHS45hnB6muHHLLLWO1u30vm6oowKoRVdLSoDvC8HpfcmmwGUnJswinzyBcYg2H
         pTw1vLY+mM0sGPybqLs12Q+Pdy6zdxXefBatocvT25wQ+7tYg5nkq5akd7CfCrUoNpP3
         BzKrEw3umHk+mPkkHRfnCdB6BxDY8BQ1se3omZCoBfyeVS/cvYV1spdemFeVvjquL+/P
         h/8w==
X-Gm-Message-State: AOJu0YypEvCuuSsj1GoLtIOfMIXIff19t4hDuz/5PjF1Eh3zV5sWhxAi
	HeZgpv0mAktpZNV/FLLpner/BzA1udbIk+mG5MVNeMZKdFfLxqkzQtoD/pXimR03qOQP66oWJmh
	A4NQIOCmiMC9IBhjPPensDaU48o8=
X-Google-Smtp-Source: AGHT+IH8bbYhmURDzBg+mAJYW2ZYK00MtLhF01aieooqPYFQGiP8hlNAMhZOSoMcWzzd+XQ3Rm9jjX5D/YfQPf9Umg4=
X-Received: by 2002:a67:f4d7:0:b0:476:c08d:1093 with SMTP id
 s23-20020a67f4d7000000b00476c08d1093mr2643333vsn.10.1711539293468; Wed, 27
 Mar 2024 04:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com> <1711413292-3025-31-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1711413292-3025-31-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Mar 2024 11:34:42 +0000
Message-ID: <CANPvuRm4rOYNstWRR1d+koEigLJvnzCsnNrBhEOU-naEx70TuA@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH 31/34] spirv-tools: upgrade 1.3.275.0 -> 1.3.280.0
To: wangmy@fujitsu.com, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009b435d0614a2cb0c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 11:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197554

--0000000000009b435d0614a2cb0c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I see this is still on
https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next but
it should be dropped
because it is included in the vulkan v2
https://lists.openembedded.org/g/openembedded-core/message/197546

This spirv and glslang recipes should be updated in lockstep with vulkan as
printed by AlexK on
https://lists.openembedded.org/g/openembedded-core/message/197529

Jose


wangmy via lists.openembedded.org <wangmy=3Dfujitsu.com@lists.openembedded.=
org>
escreveu (ter=C3=A7a, 26/03/2024 =C3=A0(s) 00:37):

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Add tooling support for SPV_KHR_maximal_reconvergence
> - Add support for SPV_KHR_float_controls2
> - SPV_KHR_quad_control
> - Fold 64-bit int operations
> - update image enum tests to remove Kernel capability
> - Support operand kind for SPV_INTEL_maximum_registers
> - SPV_NV_shader_atomic_fp16_vector
> - Support for SPV_QCOM_image_processing2 (#5582)
> - Fix access chain struct checks
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../spir/{spirv-tools_1.3.275.0.bb =3D> spirv-tools_1.3.280.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/spir/{spirv-tools_1.3.275.0.bb =3D>
> spirv-tools_1.3.280.0.bb} (96%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> similarity index 96%
> rename from meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> index 05c6de1b50..d2b6acf946 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.280.0.bb
> @@ -7,7 +7,7 @@ SECTION =3D "graphics"
>  LICENSE  =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6b=
d57"
>
> -SRCREV =3D "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
> +SRCREV =3D "04896c462d9f3f504c99a4698605b6524af813c1"
>  SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmain;protocol=3Dhttps"
>  PE =3D "1"
>  # These recipes need to be updated in lockstep with each other:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197520):
> https://lists.openembedded.org/g/openembedded-core/message/197520
> Mute This Topic: https://lists.openembedded.org/mt/105150547/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000009b435d0614a2cb0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alexandre,<br><br><div>I see this is still on <a href=
=3D"https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next=
">https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next</=
a> but it should be dropped<br></div><div>because it is included in the vul=
kan v2 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/197546">https://lists.openembedded.org/g/openembedded-core/message/197546=
</a></div><div><br></div><div><span style=3D"color:rgb(0,0,0)">This </span>=
<span class=3D"gmail-il" style=3D"color:rgb(0,0,0)">spirv</span><span style=
=3D"color:rgb(0,0,0)">=C2=A0and glslang recipes should be updated in lockst=
ep with vulkan as printed=C2=A0by AlexK on</span></div><div><a href=3D"http=
s://lists.openembedded.org/g/openembedded-core/message/197529">https://list=
s.openembedded.org/g/openembedded-core/message/197529</a><br><span style=3D=
"color:rgb(0,0,0)"><br>Jose</span></div><div><span style=3D"color:rgb(0,0,0=
)"><br></span></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">wangmy via <a href=3D"http://lists.openembedded.org">li=
sts.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.o=
penembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; escreveu (ter=
=C3=A7a, 26/03/2024 =C3=A0(s) 00:37):<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujits=
u.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Add tooling support for SPV_KHR_maximal_reconvergence<br>
- Add support for SPV_KHR_float_controls2<br>
- SPV_KHR_quad_control<br>
- Fold 64-bit int operations<br>
- update image enum tests to remove Kernel capability<br>
- Support operand kind for SPV_INTEL_maximum_registers<br>
- SPV_NV_shader_atomic_fp16_vector<br>
- Support for SPV_QCOM_image_processing2 (#5582)<br>
- Fix access chain struct checks<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../spir/{<a href=3D"http://spirv-tools_1.3.275.0.bb" rel=3D"noreferr=
er" target=3D"_blank">spirv-tools_1.3.275.0.bb</a> =3D&gt; <a href=3D"http:=
//spirv-tools_1.3.280.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tool=
s_1.3.280.0.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-tools_1.3.=
275.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.275.0.bb</a>=
 =3D&gt; <a href=3D"http://spirv-tools_1.3.280.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">spirv-tools_1.3.280.0.bb</a>} (96%)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.2=
75.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.275.0.bb</a> =
b/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.280.0.bb" re=
l=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.280.0.bb</a><br>
similarity index 96%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.27=
5.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.275.0.bb</a><b=
r>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.280.=
0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.280.0.bb</a><br>
index 05c6de1b50..d2b6acf946 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.275.0.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.275.0.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-tools_1.3.280.0.bb=
" rel=3D"noreferrer" target=3D"_blank">spirv-tools_1.3.280.0.bb</a><br>
@@ -7,7 +7,7 @@ SECTION =3D &quot;graphics&quot;<br>
=C2=A0LICENSE=C2=A0 =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D3b83ef96387f14655fc85=
4ddc3c6bd57&quot;<br>
<br>
-SRCREV =3D &quot;f0cc85efdbbe3a46eae90e0f915dc1509836d0fc&quot;<br>
+SRCREV =3D &quot;04896c462d9f3f504c99a4698605b6524af813c1&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Tools.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/KhronosGroup/SPIRV-Tools.git;branch=3Dmain;protocol=3Dhtt=
ps</a>&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
=C2=A0# These recipes need to be updated in lockstep with each other:<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197520): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197520" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197520</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105150547/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105150547/5052612</a><br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--0000000000009b435d0614a2cb0c--

