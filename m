Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F80C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:57:34 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web08.22711.1636984653207310984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkAMoAVO;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id o1so2146877uap.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YPAqtr0QL7lwDTNFPrO1nXh0j02vvkRVX9qPPGOXeWY=;
        b=UkAMoAVOJKxCPKedwGDJ5n0KxqXsEnJA9pp1ac8aooyAPdAOGFKiYzXL46ioKV8mh3
         iCFtpIFjAMCeVkpefXwU406xFlvRYDbX99+GEd7JwqcbXvv56ekDmRQWK1FuDg7CWGuN
         80YGMNV9FBMLH/bspvWMKS8JqhARk89hhzQl4QB5fEI4ASd57DDzlTlPwgFYR5RKAdvR
         M8xtwgko2yDBovyPCXsFnOuM8WQov8omocuod7Z6MQE3PZU5U5uuGWD+Rd4Sz9JinkC7
         vl+Rb+n2FDgTGsSuyI6UzWElAxM3mLWaAUdMS1ZQvLTIrSxvznmYLUod/BqUALjg0Z2C
         esmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YPAqtr0QL7lwDTNFPrO1nXh0j02vvkRVX9qPPGOXeWY=;
        b=SahnQjkT3rGKqJWinLNw2bJ7wek9XbMXV1NJHA+L70YDpuCc8ww3W7VgPWMJuxQP5K
         lEaodrpGORFzAXBniGomODZxNI5okeFjRbE7Cs8hWjQnX0QTxGwiCngz0+G+2h28qB2d
         IVjiPbnJW/eMKox6ng4OaxTHfmZdO60mfnlT0+1vrQMQqXP7zdRWtqBu95HzgDdyqoL0
         A89nCP95sK942AW1y8GdPFwJO1h3iyqc7UYS+jpcIOK0mcTBwbvxxhkNCTFRc7Gzf5YY
         BCT4S+zMpJGarfwec8g6fVopI4uqs2arucK16ZrXrllECLCmzkWb/1jaV1qUmCxvA9CA
         7EpA==
X-Gm-Message-State: AOAM531YA0rLaGOFcVV9nOcsxqj5GLogRZ/RKtOpwG/NVaUdoQhv42AD
	b/OrEEioNBHBlyGaPEB7fnq5q0LX0+/6kGzIQ5o=
X-Google-Smtp-Source: 
 ABdhPJzDy1fxwtVG6Swj2iE3Ym3j4V2ck+B/sMs23FGiStNo5MqJbhpWXCuxwHudOxeAjISDliVvv6wmdFSWzWAONMk=
X-Received: by 2002:ab0:484:: with SMTP id 4mr58406065uaw.71.1636984652398;
 Mon, 15 Nov 2021 05:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20211114202648.316923-1-quaresma.jose@gmail.com>
In-Reply-To: <20211114202648.316923-1-quaresma.jose@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Nov 2021 14:57:20 +0100
Message-ID: 
 <CANNYZj8pUc4Af9zoC0KGOFcbDT7e=5SQMCnv6LL_OcSnV3QQ+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] spirv-headers: upgrade 1.5.4 -> 1.5.5
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000b5852405d0d4302f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 13:57:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158291

--000000000000b5852405d0d4302f
Content-Type: text/plain; charset="UTF-8"

There is no 1.5.5 release or tag here:
https://github.com/KhronosGroup/SPIRV-Headers
so this breaks version checks and automated updates.

If you want to bump SRCREV to a post-release commit, PV should be set like
this:
PV = "1.5.4+git${SRCPV}"

I'll send a patch to correct this.

Alex

On Sun, 14 Nov 2021 at 21:27, Jose Quaresma <quaresma.jose@gmail.com> wrote:

> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  .../spir/{spirv-headers_1.5.4.bb => spirv-headers_1.5.5.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.5.4.bb =>
> spirv-headers_1.5.5.bb} (92%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
> similarity index 92%
> rename from meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
> index 6c978ce51a..101a2e2948 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.5.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.5.5.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c938b85bceb8fb26c1a807f28a52ae2d"
>
> -SRCREV = "6cae8216a6ea19ff3f237af01e54378c1ff81fcd"
> +SRCREV = "c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d"
>  SRC_URI = "git://
> github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=master"
>  UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
>  S = "${WORKDIR}/git"
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158267):
> https://lists.openembedded.org/g/openembedded-core/message/158267
> Mute This Topic: https://lists.openembedded.org/mt/87054847/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b5852405d0d4302f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>There is no 1.5.5 release or tag here:</div><div><a h=
ref=3D"https://github.com/KhronosGroup/SPIRV-Headers">https://github.com/Kh=
ronosGroup/SPIRV-Headers</a></div><div>so this breaks version checks and au=
tomated updates.</div><div><br></div><div>If you want to bump SRCREV to a p=
ost-release commit, PV should be set like this:</div><div>PV =3D &quot;1.5.=
4+git${SRCPV}&quot;</div><div><br></div><div>I&#39;ll send a patch to corre=
ct this.</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 14 Nov 2021 at 21:2=
7, Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com">quaresma.jo=
se@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jos=
e@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../spir/{<a href=3D"http://spirv-headers_1.5.4.bb" rel=3D"noreferrer=
" target=3D"_blank">spirv-headers_1.5.4.bb</a> =3D&gt; <a href=3D"http://sp=
irv-headers_1.5.5.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.=
5.5.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/spir/{<a href=3D"http://spirv-headers_1.=
5.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> =3D=
&gt; <a href=3D"http://spirv-headers_1.5.5.bb" rel=3D"noreferrer" target=3D=
"_blank">spirv-headers_1.5.5.bb</a>} (92%)<br>
<br>
diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5=
.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a> b/me=
ta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.bb" rel=3D"n=
oreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
similarity index 92%<br>
rename from meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.=
4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
rename to meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.=
bb" rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
index 6c978ce51a..101a2e2948 100644<br>
--- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.4.bb" =
rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.4.bb</a><br>
+++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-headers_1.5.5.bb" =
rel=3D"noreferrer" target=3D"_blank">spirv-headers_1.5.5.bb</a><br>
@@ -7,7 +7,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://www.khronos.org/regis=
try/spir-v" rel=3D"noreferrer" target=3D"_blank">https://www.khronos.org/re=
gistry/spir-v</a>&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc938b85bceb8fb26c1a80=
7f28a52ae2d&quot;<br>
<br>
-SRCREV =3D &quot;6cae8216a6ea19ff3f237af01e54378c1ff81fcd&quot;<br>
+SRCREV =3D &quot;c8213b3c5a2cf3a0f5c4d1e7d7b8fc2ac9f4806d&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/KhronosGroup/SPI=
RV-Headers;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_=
blank">github.com/KhronosGroup/SPIRV-Headers;protocol=3Dhttps;branch=3Dmast=
er</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;^(?P&lt;pver&gt;\d+(\.\d+)+)$&qu=
ot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#158267): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/158267" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/158267</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87054847/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87054847/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b5852405d0d4302f--

