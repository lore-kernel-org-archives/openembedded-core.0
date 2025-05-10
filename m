Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA65C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 14:59:18 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.12182.1746889158377506625
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 07:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eGPcbYqt;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6065251725bso1997198eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889157; x=1747493957; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRdcDn8OiicJROMQBQyD/zkxvJmw3Kg4P0hxf9b4WLI=;
        b=eGPcbYqtOabs7k/zdUHfXsQBqIOHqkRZD69iM1s7xfuHkeTyjYneCjdJ65gm5cyO8D
         BidQMqRrlzeuyoXetqFbI5lNoFheAQ3CSZE1Cen9e/WujRD+guD9KxiZy4HzYlDui2aY
         e+Wui+KwgWGmfrEnqFfnDS6DVyWM4fFevG1l+tptyd2DUrP06R/O29W/al4HJjRamcK/
         nQY7zE4FLaF2HMH+ZnjVxoubahJAovU/NHqD8naybVvkWc2GnHGlaCMgib+FPnVRdZ7p
         27VqT2qai8x6bst0HhSktXjhgdhDiJaSeinGLsAASHgpAPAi/98/VUTekTSiqUrMhOk6
         BvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889157; x=1747493957;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRdcDn8OiicJROMQBQyD/zkxvJmw3Kg4P0hxf9b4WLI=;
        b=wcC8mRAcq14643A23cVQajoAkkEPnzzH3u1T+uIsbBdG3+ykvP0bcrTpxBWHlbcXdO
         EEtqUl/tO+MmtXp9oZoRYKlmN6CN3x8RYq0hi9JBbDSXex9ZhLBGIJJqO3m00YaUio54
         Ll1ORo39SBag9WMHt9XkUmpHDGkVYSqVwYkxXHaDZFBLkH2en2o5hTtkeRI6tQ2LMkN8
         fZ2QEfCl9/0wc5hxNcEF4r0jU3BwoAuKpSGNFiGYEK1HZpOK61/8gwmuQ1ifR9lUfYGJ
         9bPrGAPR2iVFDfvtk4dmd5O9IxCfhpfoyOFZPgjx7B3aEPyfx/3elHRtEXy7adOn0G0P
         oiRQ==
X-Gm-Message-State: AOJu0YwoTMQ1OvmQBq8CGqYtviGd5pQBoQfQhnxjxAut6A+Jf32NvAcV
	/arP9kKc/QBBQTqXa4S4+dhJb5vFpcS2LWalIS6Gebk0FVUkYKv80Q6HkrB27bReG794LPLoN28
	Xjm7NhOKPPxWDekjP5e/Ku7sgbSCRKz5j
X-Gm-Gg: ASbGncv/AW0LRAbgZiHvm56ZxpETJUfOpmaQYZ6hdl6zJD+ApeYYp2jhXk7kKY50Iof
	FmTA1whJanofcpdmawrs671DIgLNr9SjQ4ePsZuB6OEFBQ1cOdOnLCb4To8+YyJl4jlBsk0h8Gd
	6pclqYaFkH9Zi5fcC6Yx+EZqFgPFgvIsQA43afr5Xk+rwduzftoCSXYZrmCL2W6pqBbA==
X-Google-Smtp-Source: AGHT+IHHcHOaLRIwdCgl3D0h54+LkFlGvGjwN7lYcx+03/f1k0cLHnNGjQZCrO7ehvlpynYGJrhchIZoY34HGnUxQu8=
X-Received: by 2002:a05:6820:98b:b0:604:2b3:2c9b with SMTP id
 006d021491bc7-6084b6006fdmr4443423eaf.4.1746889157522; Sat, 10 May 2025
 07:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
 <29977.1746888734129629150@lists.openembedded.org>
In-Reply-To: <29977.1746888734129629150@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2025 07:59:06 -0700
X-Gm-Features: AX0GCFsyrWpYpWZ4rzBdwaIB7tS0x6FvCUSYy1OtmTl268Culmp7XfXjmw0H9TY
Message-ID: <CAMKF1sqHqP9O5po2Z7Egr18rjuksWJ3dv0oQgkDYN9w9VLCvbg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b23a720634c953dc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 14:59:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216274

--000000000000b23a720634c953dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2025 at 7:52=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:

> Hi Khem,
>
> I followed your suggestions to apply the following change on compiler-rt
> recipe and build it for qemuarmv5, the failure remains
>

Right I think the issue is that it also needs arch value set to armv5te
from toolchain triple and we use arm-poky-Linux-gnueabi and that confuses
compiler-rt cmake as well I think it needs to be fixed as well along with
host arch


> --- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> @@ -74,6 +74,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>
> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>
> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>
> -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \
> +
> -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contains('TUNE_FEATURES',
> 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
>                 -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
>  "
> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb
> b/meta/recipes-devtools/clang/compiler-rt_git.bb
> index 93928541273..8073bc139eb 100644
> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> @@ -80,6 +80,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
>
> -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
>
> -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \
>
> -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}${HF} \
> +
> -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contains('TUNE_FEATURES',
> 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
>  "
>
> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
> $ bitbake compiler-rt
> ...
> /buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3-r0=
/llvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2:
> error: #error DMB is only supported on ARMv6+
>    22 | #error DMB is only supported on ARMv6+
>       |  ^~~~~
> ...
>
> //Hongxu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216273):
> https://lists.openembedded.org/g/openembedded-core/message/216273
> Mute This Topic: https://lists.openembedded.org/mt/112897300/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b23a720634c953dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, May 10, 2025 at 7:52=E2=80=AFAM=
 hongxu via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.openembedd=
ed.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div>Hi Khem,</div>
<div>=C2=A0</div>
<div>I followed your suggestions to apply the following change on compiler-=
rt recipe and build it for qemuarmv5, the failure remains</div></blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">Right I think the issue is t=
hat it also needs arch value set to armv5te from toolchain triple and we us=
e arm-poky-Linux-gnueabi and that confuses compiler-rt cmake as well I thin=
k it needs to be fixed as well along with host arch=C2=A0</div><div dir=3D"=
auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"></div>
<div>=C2=A0</div>
<div>--- a/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt-saniti=
zers_git.bb" target=3D"_blank">compiler-rt-sanitizers_git.bb</a><br>+++ b/m=
eta/recipes-devtools/clang/<a href=3D"http://compiler-rt-sanitizers_git.bb"=
 target=3D"_blank">compiler-rt-sanitizers_git.bb</a><br>@@ -74,6 +74,7 @@ E=
XTRA_OECMAKE:append:class-target =3D &quot;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TAR=
GET_PREFIX}llvm-ar \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_C_COMPILE=
R_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${HOST_OS} \<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.u=
tils.contains(&#39;TUNE_FEATURES&#39;, &#39;armv5 thumb dsp&#39;, &#39;armv=
5te&#39;, &#39;${HOST_ARCH}&#39;, d)} \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_POSITION_INDEPEND=
ENT_CODE=3DON \<br>=C2=A0&quot;<br>diff --git a/meta/recipes-devtools/clang=
/<a href=3D"http://compiler-rt_git.bb" target=3D"_blank">compiler-rt_git.bb=
</a> b/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" ta=
rget=3D"_blank">compiler-rt_git.bb</a><br>index 93928541273..8073bc139eb 10=
0644<br>--- a/meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git=
.bb" target=3D"_blank">compiler-rt_git.bb</a><br>+++ b/meta/recipes-devtool=
s/clang/<a href=3D"http://compiler-rt_git.bb" target=3D"_blank">compiler-rt=
_git.bb</a><br>@@ -80,6 +80,7 @@ EXTRA_OECMAKE:append:class-target =3D &quo=
t;\<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_AR=
=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_NM=3D${STAGING_BINDIR_TOO=
LCHAIN}/${TARGET_PREFIX}llvm-nm \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-${=
HOST_OS}${HF} \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCOM=
PILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contains(&#39;TUNE_FEATURES&#39;=
, &#39;armv5 thumb dsp&#39;, &#39;armv5te&#39;, &#39;${HOST_ARCH}&#39;, d)}=
 \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DCMAKE_POSIT=
ION_INDEPENDENT_CODE=3DON \<br>=C2=A0&quot;</div>
<div>=C2=A0</div>
<div>$ echo &#39;MACHINE =3D &quot;qemuarmv5&quot;&#39; &gt;&gt; conf/local=
.conf</div>
<div>$ bitbake compiler-rt</div>
<div>...</div>
<div>/buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3=
-r0/llvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: e=
rror: #error DMB is only supported on ARMv6+<br>=C2=A0 =C2=A022 | #error DM=
B is only supported on ARMv6+<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0^~~~~</div>
<div>...</div>
<div>=C2=A0</div>
<div>//Hongxu</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#216273): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/216273" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/216273</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112897300/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112897300/1997914</a><br>
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

--000000000000b23a720634c953dc--

