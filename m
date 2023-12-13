Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC82C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 03:46:08 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.25494.1702439160026288948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 19:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F9OPZUBY;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d9caf5cc948so6205716276.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 19:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702439159; x=1703043959; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oSl/UnhREn9RV4rhmAkECjAH0kRKrMpT9z+th24eqTA=;
        b=F9OPZUBYHlpBX5kRHkarYz7HkgKXLcH9kHGUJrs+1ObCVks1AU8lwpSoYkzSTk8vCe
         7M3NMdpnkKyYE/rAG0ajFTEQIDSAPbHJKsqF1BYBrhLYrFp0hMvYQQhbm8Gr4beAXPXC
         tDnyYAUUKd+DH7hDCHTHoDghtX2/4PfEi9AsNGt8zsYrB7j8x1+6kBz7DWUnCK4x4oXG
         5VWGNyB4mDE7yZQeaek9vjlXyfMUThtn8Wd/U6fLZnGQkZrnMsF2gE2ijWpaMGCvsi+e
         NJCKckTpg20/Wn4twALtsrfWqFGpPi6/2YXYWr2lqsfPC9tYqrvy8ZHQQXGIn1hHooTT
         GCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702439159; x=1703043959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSl/UnhREn9RV4rhmAkECjAH0kRKrMpT9z+th24eqTA=;
        b=qCZiXxpFmIIB5stHmUNhit9G8EklDDHlXdrxUS0iNne1Bz0xYZWOhk2wkZe0pemQ6c
         e91nD3j6Q+EaPqlbgf8zSNyOGhu6iTn2g7gASPa1FTcPRwRpJEKRmzwAXC4ePwSVCNmF
         AYy9lkVNkSH5AnvoFC3/ws+YV/pkshC3sqX75zv/nX1DElingiiOh7Av60bmdrumAQm4
         KVGLh5BeiPssWqIDK8oSty2sRcZS+qIk4jNx0jtp6JwI6LJBPlC75+peZvT79/CsuMDW
         x0jKOIpoQnnn800hosBZXGREWNM1UOtcY6YIkpeCLVmluF5bInANUFEP0u70+dA1pzVu
         Ncwg==
X-Gm-Message-State: AOJu0Yw0mvVr+0k/jmKQuo8wFME+91hpatfoIbN4lWvQkGRqrBBhrt9Q
	srZ6CvSDPixLf/vkxxZNVNQL/lpmM7d9n3/ZIbI=
X-Google-Smtp-Source: AGHT+IHps/JjB9sDLTs229sB+DJy/TiAQRcqGGniaknXTKNsLpBbDOCgbtzLlKKPKJZUZ1wK6tMPEN5irW3ucNkGnRU=
X-Received: by 2002:a0d:dfd1:0:b0:5e2:859f:63f4 with SMTP id
 i200-20020a0ddfd1000000b005e2859f63f4mr723298ywe.33.1702439158772; Tue, 12
 Dec 2023 19:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20231212233723.2543380-1-yoann.congal@smile.fr>
In-Reply-To: <20231212233723.2543380-1-yoann.congal@smile.fr>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 12 Dec 2023 19:45:48 -0800
Message-ID: <CANx9H-Bju7jVxihXMdKSzDB91iijtLbzY+X9NkP3m4LvxaSdYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: Disable bluetooth support by default
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f782a060c5c01f0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 03:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192259

--0000000000004f782a060c5c01f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 3:37=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
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
>   PACKAGECONFIG:append:pn-strace =3D "bluetooth"

typo: =3D =E2=80=9Cbluez=E2=80=9D unless you meant to reference the DISTRO_=
FEATURE?

>
>
> Fixes [YOCTO #15323]
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-devtools/strace/strace_6.6.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_6.6.bb
> b/meta/recipes-devtools/strace/strace_6.6.bb
> index a3de7941cf..c355b45b20 100644
> --- a/meta/recipes-devtools/strace/strace_6.6.bb
> +++ b/meta/recipes-devtools/strace/strace_6.6.bb
> @@ -22,9 +22,6 @@ inherit autotools ptest
>  # Not yet ported to rv32
>  COMPATIBLE_HOST:riscv32 =3D "null"
>
> -PACKAGECONFIG:class-target ??=3D "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)=
}
> \
> -"
>
>  PACKAGECONFIG[bluez] =3D
> "ac_cv_header_bluetooth_bluetooth_h=3Dyes,ac_cv_header_bluetooth_bluetoot=
h_h=3Dno,bluez5"
>  PACKAGECONFIG[libunwind] =3D
> "--with-libunwind,--without-libunwind,libunwind"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192253):
> https://lists.openembedded.org/g/openembedded-core/message/192253
> Mute This Topic: https://lists.openembedded.org/mt/103140540/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004f782a060c5c01f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Dec 12, 2023 at 3:37=E2=80=AFPM Yoann Congal &lt;<a=
 href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-le=
ft-color:rgb(204,204,204)">The bluetooth support adds a bluez5 dependency (=
and,recursively, a lot<br>
of other stuff). Disable it by default to avoid having to build all of<br>
this when it is not needed.<br>
<br>
This decrease the number of tasks run for a core-image-minimal build by<br>
~1000 (-21%).<br>
<br>
To re-enable bluetooth support in strace, add &quot;bluez&quot; to strace<b=
r>
PACKAGECONFIG. For example, in local.conf:<br>
=C2=A0 PACKAGECONFIG:append:pn-strace =3D &quot;bluetooth&quot;</blockquote=
><div dir=3D"auto">typo: =3D =E2=80=9Cbluez=E2=80=9D unless you meant to re=
ference the DISTRO_FEATURE?</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Fixes [YOCTO #15323]<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a> | 3 ---<br>
=C2=A01 file changed, 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">strace_6.6.bb</a> b/meta/recipes-devto=
ols/strace/<a href=3D"http://strace_6.6.bb" rel=3D"noreferrer" target=3D"_b=
lank">strace_6.6.bb</a><br>
index a3de7941cf..c355b45b20 100644<br>
--- a/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a><br>
+++ b/meta/recipes-devtools/strace/<a href=3D"http://strace_6.6.bb" rel=3D"=
noreferrer" target=3D"_blank">strace_6.6.bb</a><br>
@@ -22,9 +22,6 @@ inherit autotools ptest<br>
=C2=A0# Not yet ported to rv32<br>
=C2=A0COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
<br>
-PACKAGECONFIG:class-target ??=3D &quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;bluetoo=
th&#39;, &#39;bluez&#39;, &#39;&#39;, d)} \<br>
-&quot;<br>
<br>
=C2=A0PACKAGECONFIG[bluez] =3D &quot;ac_cv_header_bluetooth_bluetooth_h=3Dy=
es,ac_cv_header_bluetooth_bluetooth_h=3Dno,bluez5&quot;<br>
=C2=A0PACKAGECONFIG[libunwind] =3D &quot;--with-libunwind,--without-libunwi=
nd,libunwind&quot;<br>
-- <br>
2.30.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#192253): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192253" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/192253</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103140540/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/103140540/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004f782a060c5c01f0--

