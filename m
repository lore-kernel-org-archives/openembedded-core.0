Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50D0C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 11:35:16 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web10.35301.1711539310286625839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 04:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ad492mYP;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4767347552bso473912137.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711539309; x=1712144109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FP4opvA3hGDpILzBUBUqF7aM7MCDM9DKiJ7Ik5XIp3M=;
        b=Ad492mYP9eFyh4TtYyWpOaEK8AzNl2lh28oNspB7xUSExaDSzy9pWzP6osCglT2V9J
         DlO2V33vo1okHX9tIE20M4wjYOwvFbmT5EOGNJy21MO4ptXWoihOBhdaJfdvbbPx4PoA
         D9EqXZzu3WvlCth7K00qB+diTpVIvsZeYcpiq8QNS41toywTlcvODjig50OVlWSsHS8G
         JbfVXjhEJQz3J5oekAlR1Jo7mIRrepVH9xzA+9yCrqKWPo82qllses6UVTQWqkzD8n0F
         KAwzih0nDK8Ds24E8cfYZtTLWLN69jMzq4rWPpV0zk1NcvohtllzSZUdj9otKusPlAW2
         7Acg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539309; x=1712144109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FP4opvA3hGDpILzBUBUqF7aM7MCDM9DKiJ7Ik5XIp3M=;
        b=G2UN9bVoSBc/ACHKjV/XwdvESQgJ2MxlfBnP621o65N//+BZ8JoHfTBxc91onQuy77
         883XJqzlJRVOC12Tawbg3k6R/jq7VK7+4/mJRz3X9ldi3HZ5WQpYsHBgER6bNPk36Enl
         YPRvi1d6b3jWKVb3pA0mY/LPlApVYFAMUt2X1ArzC9mPjM99Y0feEyPNKN80b4PegfZ3
         Fh11SFP4t9+yM2WaRob1ryiC09H287jUG76t/IpLAM/JgR9/ksBpbfoJlj2NwYYZLqwU
         aGTN5NpVBIyFGoYDwzlIl6uBbIHhvjwxGHXyvGv4Db9Tt5heOwV5vRYArrUXrZTVp9h7
         y9Zg==
X-Gm-Message-State: AOJu0YyAwGE3dFPRTBLuBJKt7QJJk/bCJ0QgP6FjrjmqOhAuqL/NGQVy
	hguxCkDbYf6PAPrL2+8GePjKw4BHkl17UbVzUGoiPyiBFYMWgMqdrmsovlQxzsqc0g01hRyZ/Ni
	2sC3lZZe6rQAa/Xl4BxxMZ1uz2MI=
X-Google-Smtp-Source: AGHT+IHuf7yKOvOaRA/uMf2jEIvzt2qODcKrJxMQfeyS+lyDdv3C4dBUJXsdWI1E/6GROJfFwFJzntcNIgB/zh1zo+w=
X-Received: by 2002:a05:6102:1607:b0:478:2d46:7416 with SMTP id
 cu7-20020a056102160700b004782d467416mr3620797vsb.15.1711539308126; Wed, 27
 Mar 2024 04:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com> <1711413292-3025-30-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1711413292-3025-30-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 27 Mar 2024 11:34:57 +0000
Message-ID: <CANPvuR=p-eQk74FA1cQ0=r3GnErzoLMwLiz9QgkG4i7z5dvdXg@mail.gmail.com>
Subject: Re: [OE-Core] [PATCH 30/34] spirv-headers: upgrade 1.3.275.0 -> 1.3.280.0
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007aec6a0614a2ccbe"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 11:35:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197555

--0000000000007aec6a0614a2ccbe
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
> -Add SPV_NV_raw_access_chains
> -Headers support for SPV_INTEL_maximum_registers extension
> -Add SPV_NV_shader_atomic_fp16_vector
> -SPV_QCOM_image_processing2
> -cmake: Allow external control of test and install options
> -remove Kernel from Image Channel Order and Channel Data Type enums
> -Update FPFastMath token reservation
> -List all licenses in the root LICENSE file.
> -Support SPV_KHR_quad_control (with fixed line endings)
> -SPV_KHR_float_controls2
> -Add SPV_KHR_maximal_reconvergence
> -update copyright dates to 2024
> -Register Zig Compiler tool
> -Add a Source Language for Zig
> -Reserve an FPFastMathMode bit
> -Bump the github-actions group with 1 update
> -Publish the header for the vulkan-shader-profiler embedded reflection
> -Upstream tokens for SPV_INTEL_masked_gather_scatter
> -feat: Create dependabot.yml
>
> License-Update: List all licenses in the root LICENSE file.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...{spirv-headers_1.3.275.0.bb =3D> spirv-headers_1.3.280.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.3.275.0.bb =3D>
> spirv-headers_1.3.280.0.bb} (84%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
> b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
> similarity index 84%
> rename from meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
> index 598a8fc209..26bfd9c4fa 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.3.275.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.3.280.0.bb
> @@ -2,9 +2,9 @@ SUMMARY =3D "Machine-readable files for the SPIR-V Regist=
ry"
>  SECTION =3D "graphics"
>  HOMEPAGE =3D "https://www.khronos.org/registry/spir-v"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc938b85bceb8fb26c1a807f28a52a=
e2d"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd14ee3b13f42e9c9674acc5925c3d=
741"
>
> -SRCREV =3D "1c6bb2743599e6eb6f37b2969acc0aef812e32e3"
> +SRCREV =3D "8b246ff75c6615ba4532fe4fde20f1be090c3764"
>  SRC_URI =3D "git://
> github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmain"
>  PE =3D "1"
>  # These recipes need to be updated in lockstep with each other:
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197518):
> https://lists.openembedded.org/g/openembedded-core/message/197518
> Mute This Topic: https://lists.openembedded.org/mt/105150545/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000007aec6a0614a2ccbe
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
"color:rgb(0,0,0)"><br>Jose</span></div><div></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">wangmy via <a href=3D"ht=
tp://lists.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D<a hre=
f=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembed=
ded.org</a>&gt; escreveu (ter=C3=A7a, 26/03/2024 =C3=A0(s) 00:37):<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a=
 href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a=
>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-Add SPV_NV_raw_access_chains<br>
-Headers support for SPV_INTEL_maximum_registers extension<br>
-Add SPV_NV_shader_atomic_fp16_vector<br>
-SPV_QCOM_image_processing2<br>
-cmake: Allow external control of test and install options<br>
-remove Kernel from Image Channel Order and Channel Data Type enums<br>
-Update FPFastMath token reservation<br>
-List all licenses in the root LICENSE file.<br>
-Support SPV_KHR_quad_control (with fixed line endings)<br>
-SPV_KHR_float_controls2<br>
-Add SPV_KHR_maximal_reconvergence<br>
-update copyright dates to 2024<br>
-Register Zig Compiler tool<br>
-Add a Source Language for Zig<br>
-Reserve an FPFastMathMode bit<br>
-Bump the github-actions group with 1 update<br>
-Publish the header for the vulkan-shader-profiler embedded reflection<br>
-Upstream tokens for SPV_INTEL_masked_gather_scatter<br>
-feat: Create dependabot.yml<br>
<br>
License-Update: List all licenses in the root LICENSE file.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...{<a href=3D"http://spirv-headers_1.3.275.0.bb" rel=3D"noreferrer" =
target=3D"_blank">spirv-headers_1.3.275.0.bb</a> =3D&gt; <a href=3D"http://=
spirv-headers_1.3.280.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-head=
ers_1.3.280.0.bb</a>} | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-headers_1.=
3.275.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.275.0.bb=
</a> =3D&gt; <a href=3D"http://spirv-headers_1.3.280.0.bb" rel=3D"noreferre=
r" target=3D"_blank">spirv-headers_1.3.280.0.bb</a>} (84%)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3=
.275.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.275.0.bb<=
/a> b/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.280.0.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.280.0.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.=
275.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.275.0.bb</=
a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.28=
0.0.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.280.0.bb</a>=
<br>
index 598a8fc209..26bfd9c4fa 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.275.0.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.275.0.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.3.280.0.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.3.280.0.bb</a><br>
@@ -2,9 +2,9 @@ SUMMARY =3D &quot;Machine-readable files for the SPIR-V Reg=
istry&quot;<br>
=C2=A0SECTION =3D &quot;graphics&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/registry/spir-v=
" rel=3D"noreferrer" target=3D"_blank">https://www.khronos.org/registry/spi=
r-v</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc938b85bceb8fb26c1a807f28a=
52ae2d&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd14ee3b13f42e9c9674acc5925=
c3d741&quot;<br>
<br>
-SRCREV =3D &quot;1c6bb2743599e6eb6f37b2969acc0aef812e32e3&quot;<br>
+SRCREV =3D &quot;8b246ff75c6615ba4532fe4fde20f1be090c3764&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Headers;protocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_bl=
ank">github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmain</=
a>&quot;<br>
=C2=A0PE =3D &quot;1&quot;<br>
=C2=A0# These recipes need to be updated in lockstep with each other:<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197518): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197518" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197518</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105150545/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105150545/5052612</a><br>
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

--0000000000007aec6a0614a2ccbe--

