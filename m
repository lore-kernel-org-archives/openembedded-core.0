Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394ACC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 08:36:11 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.31937.1702456569158970418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 00:36:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZdREjqjQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32f8441dfb5so6070961f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 00:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702456567; x=1703061367; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/RDTPDNOEuB7mIz+UzSyConpzu1uyg/z8uNBTsE3JE=;
        b=ZdREjqjQwLWs/V5Y972Ghq350fZQHYh4AaeRHVdiCKRb2J+ViA9tviQCDY+Xd/fXpB
         P0RC2umdzDmKvDA/tDwHLj5W+V9yl4C/msjHPH7rbr+QgIM3YtB5xBAYEXFA+Gy62h6g
         64h4PR+jSX4yRg19L9GRf2hr55nvtPTbKw8obNJa+BXPsFhiORECPKFvNniJgdHLkK2M
         UY+jtFpH8LLYQm4IpgMIRpGV0av6NCD5Mxc/W5zzpM6ZJS68Og/P00MjmjLnFgp68d69
         CS06+m7tBlIwxdCKgSnaGXLHBCYGZJmJUfkvn9sex33DxOe9/IgxlrJXrsAiH9cd9pT6
         Fiiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702456567; x=1703061367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/RDTPDNOEuB7mIz+UzSyConpzu1uyg/z8uNBTsE3JE=;
        b=hPwkudK4G1CdgAtmojFilWWqKkL+WG2E58RSMJVYz6y0H1m+JVttNqf7A9V6GVEMx+
         6XhzL49C9QEgMQrU2dvGYbEuCWhqpZC/UXTtagHIWfHdgAjuGb2bL9DcsfMluq7+yMMx
         fxy7Ob6EeM4AMvKLxvooxDlzYKt1xMV/lNUn4/q3PCmDUHopZbAAa1G08uLAENq1QSLL
         28/W6qu7Bsg8/JakIg5NUs8/Xv+//EP+iEEyXjH/KnsNShfKohtJqBqqatzryMN1rrMy
         QxvuaYVNt37CJ/UaZTdmQVkn2fagot21wpGlWHawAdcETQA36QKCYLryrx2hpYOjTScs
         IrKg==
X-Gm-Message-State: AOJu0YwQcyqAZRxr7vT49Ypj8zkARh+hbwx1R3BHNgoAc4bS9fGokST0
	zO3lDIjLayv5Mvb5QbafWwYT10CltDSYAjMvGw4=
X-Google-Smtp-Source: AGHT+IFoSwgfdz+zafXOZVj6NaVMx1EPGGRj0GbFYjDnTIXjY9bbpus3FlMoXb82LdcXUFrc85flsj0/uLpqr6y+qG0=
X-Received: by 2002:adf:cf04:0:b0:336:3e97:b988 with SMTP id
 o4-20020adfcf04000000b003363e97b988mr209863wrj.118.1702456567319; Wed, 13 Dec
 2023 00:36:07 -0800 (PST)
MIME-Version: 1.0
References: <20231213074323.2547894-1-yoann.congal@smile.fr>
In-Reply-To: <20231213074323.2547894-1-yoann.congal@smile.fr>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Dec 2023 09:35:55 +0100
Message-ID: <CA+chaQftbh0-27atHbh9sVbcO5ZZOivH_nYhtGFqfPui3cb34A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] strace: Disable bluetooth support by default
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000f0cfa6060c600e22"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192271

--000000000000f0cfa6060c600e22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is missing leading space in suggested:
PACKAGECONFIG:append:pn-strace =3D "bluez"

On Wed, Dec 13, 2023 at 8:43=E2=80=AFAM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> of other stuff). Disable it by default to avoid having to build all of
> this when it is not needed.
>
> This decrease the number of tasks run for a core-image-minimal build by
> ~1000 (-21%).
>
> To re-enable bluetooth support in strace, add "bluez" to strace
> PACKAGECONFIG. For example, in local.conf:
>   PACKAGECONFIG:append:pn-strace =3D "bluez"
>
> Fixes [YOCTO #15323]
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Suggested-by: Ross Burton <ross.burton@arm.com>
> ---
> v1->v2:
> * Fixed local.conf example (thanks Tim)
> * Added Suggested-by: Ross (thanks Ross)
> * Removed an extra empty line
> ---
>  meta/recipes-devtools/strace/strace_6.6.bb | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_6.6.bb
> b/meta/recipes-devtools/strace/strace_6.6.bb
> index a3de7941cf..eeffe477b3 100644
> --- a/meta/recipes-devtools/strace/strace_6.6.bb
> +++ b/meta/recipes-devtools/strace/strace_6.6.bb
> @@ -22,10 +22,6 @@ inherit autotools ptest
>  # Not yet ported to rv32
>  COMPATIBLE_HOST:riscv32 =3D "null"
>
> -PACKAGECONFIG:class-target ??=3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
}
> \
> -"
> -
>  PACKAGECONFIG[bluez] =3D
> "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetoot=
h_h=3Dno,bluez5"
>  PACKAGECONFIG[libunwind] =3D
> "--with-libunwind,--without-libunwind,libunwind"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192269):
> https://lists.openembedded.org/g/openembedded-core/message/192269
> Mute This Topic: https://lists.openembedded.org/mt/103145986/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f0cfa6060c600e22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is missing leading space in suggested:<div>PACKAGECO=
NFIG:append:pn-strace =3D &quot;bluez&quot;<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 13, 2023=
 at 8:43=E2=80=AFAM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r">yoann.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">The bluetooth support adds a bluez5 dependency (and=
,recursively, a lot<br>
of other stuff). Disable it by default to avoid having to build all of<br>
this when it is not needed.<br>
<br>
This decrease the number of tasks run for a core-image-minimal build by<br>
~1000 (-21%).<br>
<br>
To re-enable bluetooth support in strace, add &quot;bluez&quot; to strace<b=
r>
PACKAGECONFIG. For example, in local.conf:<br>
=C2=A0 PACKAGECONFIG:append:pn-strace =3D &quot;bluez&quot;<br>
<br>
Fixes [YOCTO #15323]<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
Suggested-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=
=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
v1-&gt;v2:<br>
* Fixed local.conf example (thanks Tim)<br>
* Added Suggested-by: Ross (thanks Ross)<br>
* Removed an extra empty line<br>
---<br>
=C2=A0meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a> | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_6.6.bb</a> b/meta/recipes-devto=
ols/strace/<a href=3D"http://strace_6.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">strace_6.6.bb</a><br>
index a3de7941cf..eeffe477b3 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a><br>
@@ -22,10 +22,6 @@ inherit autotools ptest<br>
=C2=A0# Not yet ported to rv32<br>
=C2=A0COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
<br>
-PACKAGECONFIG:class-target ??=3D &quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluetoo=
th&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
-&quot;<br>
-<br>
=C2=A0PACKAGECONFIG[bluez] =3D &quot;ac_cv_header_bluetooth_bluetooth_h=3Dy=
es,ac_cv_header_bluetooth_bluetooth_h=3Dno,bluez5&quot;<br>
=C2=A0PACKAGECONFIG[libunwind] =3D &quot;--with-libunwind,--without-libunwi=
nd,libunwind&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192269): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192269" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192269</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103145986/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/103145986/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f0cfa6060c600e22--

