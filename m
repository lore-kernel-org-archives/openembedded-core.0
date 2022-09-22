Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C745C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:30:26 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web12.6539.1663849815780310385
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mllBeHex;
 spf=pass (domain: gmail.com, ip: 209.85.208.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id l12so10780959ljg.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YSUDE/SEp+9Ei+O5fso1/7VF1ljyk+2eV7tNSLH/rgw=;
        b=mllBeHexwPB4R1vKvrNE8XCXPLZLx/qnkczExjlAX0md633SOlE4vPoQyx8UHJ/0/j
         tn03dS5NKKT0fsv5lpBi0hZbXgINBe9ajPX64k7v9xEf0fNRKoY7veCC+1wDK5G/VHMk
         Ov6qdR2ektS0H9SUGo2WavqTBMXSQUmIBZApg7bJhMraoxE/D92p3cTb9tIfWytIUpRC
         57xiO1jedDWd52N9lelTmcdsUBdHemafF1uZ4IBxRFeBEBLSuydnvu1wkFdx0UmtzS7U
         XHn3cTKlbeXpohdoxj1UWk5+SkZOaVZ79M+8O0+rSKfFPpSgWh/Fex7TmDBdA7B39+fJ
         CyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YSUDE/SEp+9Ei+O5fso1/7VF1ljyk+2eV7tNSLH/rgw=;
        b=ij5Lk0kAuqs1MXUDmVrDjSl0C3ivO/fQ+EFyIvnQK0eNPvurJ5pgnG2nF2P6GEb4M/
         DXQkq6Ajw+stBBGXFxvgjTihKEHsjWGIZvtxPghmiKhJ5v++RJfoLbRPYz0FaPOyNw7h
         3ppaCBZN1wcZ2HPT2cgG4GKHAQQFBzi5AI4WuYcxBb3qBqGsjPfBQ2sFMrHSFO726+CL
         rfzcp7n8GTxyhmPP6SVSg7YYKZ0M98WY9W3cQSNGyk2KcYeg8Y1S/DkXxeHCwhBXnlpm
         DODjXC2H0kV+CNdnM0I3VXly8A16cxto5+y5ZdsPkPGjZs/0jsFuRWLJoQh85qiYmRee
         Vyzg==
X-Gm-Message-State: ACrzQf1LUe9wUA1gAgB0anl4NGgXkyP/AMo4AVVtERcAbd8TZyw19BxX
	TK0npS6IZW9rhzQ4uwwd5U5Cyl89qAGxDBuaK3s=
X-Google-Smtp-Source: 
 AMsMyM47jDhcXKBPtA1IODxok2avnkNa8aS9hFrHb3YMJ5Li2txrc/fVeJjpyEpeHJoe1LEXLVlrH/aHwQ/DNhKj1R0=
X-Received: by 2002:a2e:6d02:0:b0:26a:cf02:40c4 with SMTP id
 i2-20020a2e6d02000000b0026acf0240c4mr1065610ljc.513.1663849813844; Thu, 22
 Sep 2022 05:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220922122402.32710-1-mikko.rapeli@linaro.org>
In-Reply-To: <20220922122402.32710-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 Sep 2022 13:30:02 +0100
Message-ID: 
 <CANNYZj9d4OBa4J_uo=YgZoUt_XnuMMb_G44H3JQG9T4rdZ-Rzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] poky.conf: allow changes to DISTRO_VERSION,
 SDK_VERSION and MAINTAINER
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001d285b05e943396e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170971

--0000000000001d285b05e943396e
Content-Type: text/plain; charset="UTF-8"

This is for poky list, not core.

Alex

On Thu 22. Sep 2022 at 13.24, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> For users who build their own variants of poky, they want to stay close
> to poky.conf and thus use it, but would still like to change the
> version details and maintainers to their own. With this change
> these variables can be changed in local.conf, for example.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta-poky/conf/distro/poky.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-poky/conf/distro/poky.conf
> b/meta-poky/conf/distro/poky.conf
> index 856c88554d..6df71ce18a 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -1,12 +1,12 @@
>  DISTRO = "poky"
>  DISTRO_NAME = "Poky (Yocto Project Reference Distro)"
> -DISTRO_VERSION = "4.1+snapshot-${METADATA_REVISION}"
> +DISTRO_VERSION ?= "4.1+snapshot-${METADATA_REVISION}"
>  DISTRO_CODENAME = "langdale"
>  SDK_VENDOR = "-pokysdk"
> -SDK_VERSION =
> "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}',
> 'snapshot')}"
> +SDK_VERSION ?=
> "${@d.getVar('DISTRO_VERSION').replace('snapshot-${METADATA_REVISION}',
> 'snapshot')}"
>  SDK_VERSION[vardepvalue] = "${SDK_VERSION}"
>
> -MAINTAINER = "Poky <poky@lists.yoctoproject.org>"
> +MAINTAINER ?= "Poky <poky@lists.yoctoproject.org>"
>
>  TARGET_VENDOR = "-poky"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170969):
> https://lists.openembedded.org/g/openembedded-core/message/170969
> Mute This Topic: https://lists.openembedded.org/mt/93847066/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001d285b05e943396e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is for poky list, not core.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu 22. Sep 2022 at 13.24, Mikko Rap=
eli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org">mikko.rapeli@linaro.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">For users who build their own vari=
ants of poky, they want to stay close<br>
to poky.conf and thus use it, but would still like to change the<br>
version details and maintainers to their own. With this change<br>
these variables can be changed in local.conf, for example.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta-poky/conf/distro/poky.conf | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.c=
onf<br>
index 856c88554d..6df71ce18a 100644<br>
--- a/meta-poky/conf/distro/poky.conf<br>
+++ b/meta-poky/conf/distro/poky.conf<br>
@@ -1,12 +1,12 @@<br>
=C2=A0DISTRO =3D &quot;poky&quot;<br>
=C2=A0DISTRO_NAME =3D &quot;Poky (Yocto Project Reference Distro)&quot;<br>
-DISTRO_VERSION =3D &quot;4.1+snapshot-${METADATA_REVISION}&quot;<br>
+DISTRO_VERSION ?=3D &quot;4.1+snapshot-${METADATA_REVISION}&quot;<br>
=C2=A0DISTRO_CODENAME =3D &quot;langdale&quot;<br>
=C2=A0SDK_VENDOR =3D &quot;-pokysdk&quot;<br>
-SDK_VERSION =3D &quot;${@d.getVar(&#39;DISTRO_VERSION&#39;).replace(&#39;s=
napshot-${METADATA_REVISION}&#39;, &#39;snapshot&#39;)}&quot;<br>
+SDK_VERSION ?=3D &quot;${@d.getVar(&#39;DISTRO_VERSION&#39;).replace(&#39;=
snapshot-${METADATA_REVISION}&#39;, &#39;snapshot&#39;)}&quot;<br>
=C2=A0SDK_VERSION[vardepvalue] =3D &quot;${SDK_VERSION}&quot;<br>
<br>
-MAINTAINER =3D &quot;Poky &lt;<a href=3D"mailto:poky@lists.yoctoproject.or=
g" target=3D"_blank">poky@lists.yoctoproject.org</a>&gt;&quot;<br>
+MAINTAINER ?=3D &quot;Poky &lt;<a href=3D"mailto:poky@lists.yoctoproject.o=
rg" target=3D"_blank">poky@lists.yoctoproject.org</a>&gt;&quot;<br>
<br>
=C2=A0TARGET_VENDOR =3D &quot;-poky&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#170969): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/170969" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/170969</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93847066/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93847066/1686489</a><br>
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

--0000000000001d285b05e943396e--

