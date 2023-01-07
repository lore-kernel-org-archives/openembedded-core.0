Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11261C63797
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 18:26:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.26975.1673116015136099849
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 10:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Db2XobNb;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso353472wmq.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vptnfG17Ue324XngO8wmIQzS8iks5rsR7fHESiCE8sk=;
        b=Db2XobNbDqHjPlfjoHq30J5gZaTuMf58HV36YuJXp20JVIf1dvB6Ldk912fL8LZ6MJ
         6pOH1nLA1yYX+KXiuk7BzGMHbWAtsjTghETFl7slyBoM/seUvNVTmZY0Ks02qDh5At2Z
         jc3+XbeaYOv3MVDLMwgV7ydVlrLBRb0AejXwqeeIdoQL2ObYc7I7UXy/NsSMEg2c6oBE
         uhEtqDrBfJenaEFQjA8KIc4wclwvppwCWT6WgcQEIpsw8XH3AFk1TLbjM9zlK+b8MO3y
         vPbbnfPOoWVsQBN5ODFwwtDQ/urpN890wPZUiFMgUeMf2TWcW9mnH1Oq8acxtEZaVJon
         YBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vptnfG17Ue324XngO8wmIQzS8iks5rsR7fHESiCE8sk=;
        b=XTGyf2cdW4hofd5vv93t86RKwvFVL/q8PTdmXx11XLLUQxpw67/t0qlUQLo9OzKypk
         onDf9fDlFvnZwGi7mHbHC6hZZ/Mb/4jWdg7Fa0OHN8T8+4WC5xh+oosB9Cp9X/U3UAZO
         gzDf4ta7+VG6L4Rk6HSBYz9idUAKqgz4qMwdaZpIcNpu9592UItxIfPOdtcutM47ieW3
         NBQ7QMJy8rFF5tVCR8RWcr4pVSwVu7ZEdQU5riO2mnb61nicQS7r0Gtaj77gdUt7375W
         tWbeuB7OFaQRdTQ+ASh2NhQs9wUyEhHL4rExfmcIdNLW8ASeWGexhWXGd1p8PbtyCsZg
         /DMQ==
X-Gm-Message-State: AFqh2kpf76FF9gGhWPLY5DPJCJ/ak4pJOIO/MA8J7LIbz3r0EwRszbmV
	T07Hiq3H8kJx4QS0rkULhey1WyDMRzSj8rfMvIo=
X-Google-Smtp-Source: AMrXdXvw4UyziXwwSpMb9MRB2NXT7CXZU3x4g+bB0W1BtSnzhL6bYML3//WMyGeLYQP+zacCGDBpMEfLWjXr4n7aPv8=
X-Received: by 2002:a05:600c:5544:b0:3d1:f6b1:638d with SMTP id
 iz4-20020a05600c554400b003d1f6b1638dmr3450064wmb.2.1673116013523; Sat, 07 Jan
 2023 10:26:53 -0800 (PST)
MIME-Version: 1.0
References: <17380DD7B4513BE5.3916@lists.openembedded.org>
In-Reply-To: <17380DD7B4513BE5.3916@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 7 Jan 2023 19:26:36 +0100
Message-ID: <CA+chaQfhZrSikwATGQH1Wn-Thbiwu6YU5idxaWm37TPrn5TDYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] tune-x86-64-v3.inc: set QEMU_EXTRAOPTIONS like
 other tune-* files
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a777f205f1b0ad67"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 18:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175620

--000000000000a777f205f1b0ad67
Content-Type: text/plain; charset="UTF-8"

There is also separate issue that VirtualBox CPU doesn't support fma, f16c.
e.g.:
root@qemux86-64:~# mediaindexer
Incompatible processor. This Qt build requires the following features: fma
f16c

There is 7 years old enhancement ticket for Virtualbox without any progress:
https://www.virtualbox.org/ticket/15471

People who use VirtualBox to run qemux86-64 builds, should consider
changing DEFAULTTUNE.

On Sat, Jan 7, 2023 at 3:41 PM Martin Jansa via lists.openembedded.org
<Martin.Jansa=gmail.com@lists.openembedded.org> wrote:

> * use Skylake-Client to match QB_CPU_KVM as changed in:
>
> https://git.openembedded.org/openembedded-core/commit/?id=6f2af1e5d1537b4d31e14946292bf58f0fd76fc9
>
> * explicitly set -cpu instead of letting qemu to choose based
>   on host cpu
>
> * check=false is still useful as e.g. on on AMD Threadripper 3970X:
>   orc/0.4.33-r0 $ PSEUDO_UNLOAD=1 qemu-x86_64 -r 3.2.0 -cpu
> Skylake-Client  -L recipe-sysroot -E
> LD_LIBRARY_PATH=recipe-sysroot//usr/lib:recipe-sysroot//lib
>   orc/0.4.33-r0/build/meson-private/sanitycheckc_cross.exe
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.01H:ECX.pcid [bit 17]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.01H:ECX.x2apic [bit 21]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.01H:ECX.tsc-deadline [bit 24]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.07H:EBX.hle [bit 4]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.07H:EBX.invpcid [bit 10]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.07H:EBX.rtm [bit 11]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.07H:EBX.rdseed [bit 18]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.80000001H:ECX.3dnowprefetch [bit 8]
>   qemu-x86_64: warning: TCG doesn't support requested feature:
> CPUID.0DH:EAX.xsavec [bit 1]
>
> * if this still doesn't work for you on your host, you might need to
> downgrade
>   DEFAULTTUNE to e.g. corei7-64 (all all the way back to core2-64), for
>   more details see:
>
> https://www.openembedded.org/pipermail/openembedded-core/2018-April/150178.html
>
> * the leading space shouldn't be needed, I've kept it for consistency
>   with other QEMU_EXTRAOPTIONS
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/x86/tune-x86-64-v3.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc
> b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
> index 267c12ff50..254f03c590 100644
> --- a/meta/conf/machine/include/x86/tune-x86-64-v3.inc
> +++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc
> @@ -21,9 +21,11 @@ TUNE_FEATURES:tune-x86-64-v3 =
> "${TUNE_FEATURES:tune-x86-64} x86-64-v3"
>  BASE_LIB:tune-x86-64-v3 = "lib64"
>  TUNE_PKGARCH:tune-x86-64-v3 = "x86-64-v3"
>  PACKAGE_EXTRA_ARCHS:tune-x86-64-v3 =
> "${PACKAGE_EXTRA_ARCHS:tune-corei7-64} x86-64-v3"
> +QEMU_EXTRAOPTIONS_x86-64-v3 = " -cpu Skylake-Client,check=false"
>
>  AVAILTUNES += "x86-64-v3-x32"
>  TUNE_FEATURES:tune-x86-64-v3-x32 = "${TUNE_FEATURES:tune-x86-64-x32}
> x86-64-v3"
>  BASE_LIB:tune-x86-64-v3-x32 = "libx32"
>  TUNE_PKGARCH:tune-x86-64-v3-x32 = "x86-64-v3-x32"
>  PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-x32 =
> "${PACKAGE_EXTRA_ARCHS:tune-corei7-64-x32} x86-64-v3-x32"
> +QEMU_EXTRAOPTIONS_x86-64-v3-x32 = " -cpu Skylake-Client,check=false"
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175619):
> https://lists.openembedded.org/g/openembedded-core/message/175619
> Mute This Topic: https://lists.openembedded.org/mt/96113630/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a777f205f1b0ad67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is also separate issue that VirtualBox CPU doesn&#39=
;t support fma, f16c. e.g.:<br>root@qemux86-64:~# mediaindexer<br>Incompati=
ble processor. This Qt build requires the following features: fma f16c<br><=
br>There is 7 years old enhancement ticket for Virtualbox without any progr=
ess:<br><a href=3D"https://www.virtualbox.org/ticket/15471">https://www.vir=
tualbox.org/ticket/15471</a><br><div><br></div><div>People who use VirtualB=
ox to run qemux86-64 builds, should consider changing DEFAULTTUNE.</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, Jan 7, 2023 at 3:41 PM Martin Jansa via <a href=3D"http://lists.openem=
bedded.org">lists.openembedded.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* use Sk=
ylake-Client to match QB_CPU_KVM as changed in:<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D6f2af1e5d1537b4d31e14946292bf58f0fd76fc9" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D6f2af1e5=
d1537b4d31e14946292bf58f0fd76fc9</a><br>
<br>
* explicitly set -cpu instead of letting qemu to choose based<br>
=C2=A0 on host cpu<br>
<br>
* check=3Dfalse is still useful as e.g. on on AMD Threadripper 3970X:<br>
=C2=A0 orc/0.4.33-r0 $ PSEUDO_UNLOAD=3D1 qemu-x86_64 -r 3.2.0 -cpu Skylake-=
Client=C2=A0 -L recipe-sysroot -E LD_LIBRARY_PATH=3Drecipe-sysroot//usr/lib=
:recipe-sysroot//lib<br>
=C2=A0 orc/0.4.33-r0/build/meson-private/sanitycheckc_cross.exe<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.01H:ECX.pcid [bit 17]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.01H:ECX.x2apic [bit 21]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.01H:ECX.tsc-deadline [bit 24]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.07H:EBX.hle [bit 4]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.07H:EBX.invpcid [bit 10]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.07H:EBX.rtm [bit 11]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.07H:EBX.rdseed [bit 18]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.80000001H:ECX.3dnowprefetch [bit 8]<br>
=C2=A0 qemu-x86_64: warning: TCG doesn&#39;t support requested feature: CPU=
ID.0DH:EAX.xsavec [bit 1]<br>
<br>
* if this still doesn&#39;t work for you on your host, you might need to do=
wngrade<br>
=C2=A0 DEFAULTTUNE to e.g. corei7-64 (all all the way back to core2-64), fo=
r<br>
=C2=A0 more details see:<br>
=C2=A0 <a href=3D"https://www.openembedded.org/pipermail/openembedded-core/=
2018-April/150178.html" rel=3D"noreferrer" target=3D"_blank">https://www.op=
enembedded.org/pipermail/openembedded-core/2018-April/150178.html</a><br>
<br>
* the leading space shouldn&#39;t be needed, I&#39;ve kept it for consisten=
cy<br>
=C2=A0 with other QEMU_EXTRAOPTIONS<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/x86/tune-x86-64-v3.inc | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/conf/machine/include/x86/tune-x86-64-v3.inc b/meta/conf/m=
achine/include/x86/tune-x86-64-v3.inc<br>
index 267c12ff50..254f03c590 100644<br>
--- a/meta/conf/machine/include/x86/tune-x86-64-v3.inc<br>
+++ b/meta/conf/machine/include/x86/tune-x86-64-v3.inc<br>
@@ -21,9 +21,11 @@ TUNE_FEATURES:tune-x86-64-v3 =3D &quot;${TUNE_FEATURES:t=
une-x86-64} x86-64-v3&quot;<br>
=C2=A0BASE_LIB:tune-x86-64-v3 =3D &quot;lib64&quot;<br>
=C2=A0TUNE_PKGARCH:tune-x86-64-v3 =3D &quot;x86-64-v3&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-x86-64-v3 =3D &quot;${PACKAGE_EXTRA_ARCHS:tu=
ne-corei7-64} x86-64-v3&quot;<br>
+QEMU_EXTRAOPTIONS_x86-64-v3 =3D &quot; -cpu Skylake-Client,check=3Dfalse&q=
uot;<br>
<br>
=C2=A0AVAILTUNES +=3D &quot;x86-64-v3-x32&quot;<br>
=C2=A0TUNE_FEATURES:tune-x86-64-v3-x32 =3D &quot;${TUNE_FEATURES:tune-x86-6=
4-x32} x86-64-v3&quot;<br>
=C2=A0BASE_LIB:tune-x86-64-v3-x32 =3D &quot;libx32&quot;<br>
=C2=A0TUNE_PKGARCH:tune-x86-64-v3-x32 =3D &quot;x86-64-v3-x32&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS:tune-x86-64-v3-x32 =3D &quot;${PACKAGE_EXTRA_ARCH=
S:tune-corei7-64-x32} x86-64-v3-x32&quot;<br>
+QEMU_EXTRAOPTIONS_x86-64-v3-x32 =3D &quot; -cpu Skylake-Client,check=3Dfal=
se&quot;<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175619): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175619" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175619</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96113630/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96113630/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a777f205f1b0ad67--

