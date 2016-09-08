Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id B07C4600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 18:17:33 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id r128so4048124qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 11:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0pzI0Z6NzJsvlW8T4IqKcVMmrx4BC3e5jYzrLfU3uEQ=;
	b=qX0T0OGDdZCyJ+yU+s1oTTZf18uNLWdKTVvzEOO+/W4sMqoRwYGYu+HHN7yrJ7V8Rs
	y7jImv1WVTuNbaPjEtvv8UWAZS7qh9Q8/lE5Uh2unJepVaZ08okdnbcfN9TYanv1714r
	wkzFHGQvZh2Lj9ilhg2pCusWoquuNLhICo1UAqzc/MxEVM03qTZ7UKhVJEGTeW4QMviI
	S2YCQ79GcBR7jJ6FRwGqxagoGBYyWTdTTFjiVAOm7iDX3uTShLl1ydTeOftM4NyuyCzE
	O1VGmtS7O0VCc9jvPMu2qTWv8wMLmRJsuMutFMgP5SZ1o+bn5+z0bUPgFnWMQU2/TMJc
	mNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0pzI0Z6NzJsvlW8T4IqKcVMmrx4BC3e5jYzrLfU3uEQ=;
	b=T5unzH7BdVk2v1TrTWS8Vnx1h0kyrvhDNncq0lDDvuzyy89KCCSNUJe2fO5q7SSrw4
	/1V6/vXtnhl5iMfwuXcvGVwjZu4f9ZgWMZvQnHOwdGeRy0B1DC7zsWiLBihCgyORJGdM
	ocLTk2ABxhx3WXiKZW6wO8kGU2D4LFF97unHi7Q2dpk21hWSVgjjvnxRlVAcFCPWiq+t
	IwUUTkxAb34vpYI7goIHtVydj+D6RRd0jKw3tNGvDM3BRxPB6Mo5ym7vC3lfPP8yiYdz
	9GdkwzSsz8ErVD7Eloe04A31Lz8eOhDNV5cjjZv9A8ABRyX9mdciNGx3nHcYtTUFyltG
	Y9ZA==
X-Gm-Message-State: AE9vXwNditmCwEMlSND2+f72iCC0Gih2SnozIBUzm3VSXaEygAgCbaWGVVOSAmqc6RByNMrH/oiqi6Z9G03aJA==
X-Received: by 10.55.209.140 with SMTP id o12mr1189132qkl.286.1473358653684;
	Thu, 08 Sep 2016 11:17:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.47.189 with HTTP; Thu, 8 Sep 2016 11:17:33 -0700 (PDT)
In-Reply-To: <4d4a31993e794fe69a20600966a7ffb01d1c1245.1473296553.git.bruce.ashfield@windriver.com>
References: <cover.1473296553.git.bruce.ashfield@windriver.com>
	<4d4a31993e794fe69a20600966a7ffb01d1c1245.1473296553.git.bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Sep 2016 14:17:33 -0400
Message-ID: <CADkTA4P38YNhAtSQE_TJApsqOYffmJTJxXm27S6yBQRmBJiLpQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] linux-yocto: update to 4.8-rc5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2016 18:17:34 -0000
Content-Type: multipart/alternative; boundary=001a1147a29e2e026b053c030bb6

--001a1147a29e2e026b053c030bb6
Content-Type: text/plain; charset=UTF-8

I forgot to bump the LINUX_VERSION on this patch. I can send an incremental
change
or amend this one. Which is preferred ?

Bruce

On Wed, Sep 7, 2016 at 9:08 PM, Bruce Ashfield <bruce.ashfield@windriver.com
> wrote:

> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 18 +++++++++---------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> index 9fe0112fff4f..84699ef70908 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> @@ -11,8 +11,8 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
> -SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
> +SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${
> KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> index 7ef5e7e83484..58d3fea6c95d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.8-rc4"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
> -SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
> +SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> index 279c0db924fa..d6837d8a1827 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "20544507201f870a365c43759e5dea1ab49a2d68"
> -SRCREV_machine_qemuarm64 ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
> -SRCREV_machine_qemumips ?= "03d4caf37d133a923e49b8ad6d814ee299cf92c7"
> -SRCREV_machine_qemuppc ?= "3eab887a55424fc2c27553b7bfe32330df83f7b8"
> -SRCREV_machine_qemux86 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
> -SRCREV_machine_qemux86-64 ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
> -SRCREV_machine_qemumips64 ?= "a4793b209b32964533e37ebd28a72b757c0f651a"
> -SRCREV_machine ?= "a7d71794e4e38d2f861c1b1dbff761ae0b0836b3"
> -SRCREV_meta ?= "dd820fa5f7079ac75338f0484151e6454db06951"
> +SRCREV_machine_qemuarm ?= "9a91ef47f85a741d842b876267b29f8ded751f68"
> +SRCREV_machine_qemuarm64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_machine_qemumips ?= "40c7a721efe2822fdb7df4b2902a1994add40a77"
> +SRCREV_machine_qemuppc ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_machine_qemux86 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_machine_qemux86-64 ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_machine_qemumips64 ?= "fe4805532e149324939bf9d8415ed43dac357709"
> +SRCREV_machine ?= "9e7ee5155e3466824abe94eebb641c63ab5cd5f2"
> +SRCREV_meta ?= "25fb74eaaef249519f25e243e7f9bf0cab0e1781"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=
> machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1147a29e2e026b053c030bb6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>I forgot to bump the LINUX_VERSION on this patch=
. I can send an incremental change<br></div>or amend this one. Which is pre=
ferred ?<br><br></div><div>Bruce<br></div><div><div><div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Wed, Sep 7, 2016 at 9:08 PM, Bru=
ce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Signed-off-by: Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver.com</a>&=
gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.8.bb</a>=C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.8.bb</a> |=C2=
=A0 4 ++--<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 18 +++++++++---------<br>
=C2=A03 files changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
index 9fe0112fff4f..84699ef70908 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
@@ -11,8 +11,8 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(&quot;Set PREF=
ERRED_PROVIDER_virtual/<wbr>kernel to linux-yocto-rt to enable it&quot;)<br=
>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>a7d71794e4e38d2f861c1b1dbff761<wbr>ae0b0836=
b3&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>dd820fa5f7079ac75338f0484151e6<wbr>454db06951&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wbr>63ab5cd5=
f2&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>25fb74eaaef249519f25e243e7f9bf<wbr>0cab0e1781&=
quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.8.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.8.git;branch=3D${<wbr>K=
BRANCH};name=3Dmachine</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.8;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
index 7ef5e7e83484..58d3fea6c95d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
@@ -9,8 +9,8 @@ LINUX_VERSION ?=3D &quot;4.8-rc4&quot;<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>3eab887a55424fc2c27553b7bfe323<wbr>30df83f7=
b8&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>dd820fa5f7079ac75338f0484151e6<wbr>454db06951&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wbr>63ab5cd5=
f2&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>25fb74eaaef249519f25e243e7f9bf<wbr>0cab0e1781&=
quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
index 279c0db924fa..d6837d8a1827 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
@@ -11,15 +11,15 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br=
>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;<wbr>20544507201f870a365c43759e5dea<wbr>=
1ab49a2d68&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>3eab887a55424fc2c27553b7bfe323<wb=
r>30df83f7b8&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;<wbr>03d4caf37d133a923e49b8ad6d814e<wbr=
>e299cf92c7&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;<wbr>3eab887a55424fc2c27553b7bfe323<wbr>=
30df83f7b8&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;<wbr>a7d71794e4e38d2f861c1b1dbff761<wbr>=
ae0b0836b3&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>a7d71794e4e38d2f861c1b1dbff761<w=
br>ae0b0836b3&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;<wbr>a4793b209b32964533e37ebd28a72b<w=
br>757c0f651a&quot;<br>
-SRCREV_machine ?=3D &quot;<wbr>a7d71794e4e38d2f861c1b1dbff761<wbr>ae0b0836=
b3&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>dd820fa5f7079ac75338f0484151e6<wbr>454db06951&=
quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;<wbr>9a91ef47f85a741d842b876267b29f<wbr>=
8ded751f68&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wb=
r>63ab5cd5f2&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;<wbr>40c7a721efe2822fdb7df4b2902a19<wbr=
>94add40a77&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wbr>=
63ab5cd5f2&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wbr>=
63ab5cd5f2&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<w=
br>63ab5cd5f2&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;<wbr>fe4805532e149324939bf9d8415ed4<w=
br>3dac357709&quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>9e7ee5155e3466824abe94eebb641c<wbr>63ab5cd5=
f2&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>25fb74eaaef249519f25e243e7f9bf<wbr>0cab0e1781&=
quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.8.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.8.git;name=3D<wbr>machi=
ne;branch=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.8;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto-=
4.8;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div></div></div></div>

--001a1147a29e2e026b053c030bb6--
