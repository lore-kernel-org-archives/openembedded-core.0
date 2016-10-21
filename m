Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 46DF46E660
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 13:21:51 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n189so7136890qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 06:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n+jNYfXYM7F5DKfhJPeRsZa1S01KlleglcDf8Bx3eJA=;
	b=HxU0zqDmwm4LnAXf6l4SDI9VYNGac18rJ5GWjDDlysJmUfP3bUxHaI8efo0ev79Frp
	E7ARJoS93P1Et3y3ltf1Z2U1yq4JP1oAyyWsNAaTphhlUA+IvGg2qyjCp7bqlkldRWmP
	phpQGihIU7Tyf06aVH3mnYKzLusCeQjrSq9Ehd4FQNDIBIJ+1donfJmCXh1vcQruXtXK
	o63TtRAJd1PALImwbeN+f1HPoNsjLkL6MiF2Vut/g7yS/0/XPNv8FlfcGKxl8bg4FRXO
	Qjg2ogG4R0n7BchZ+Yj5YfN6bAnWCD36Dpl27JKmXhiSsKIP+enT4Bicz7JAmikGK9Kf
	SlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n+jNYfXYM7F5DKfhJPeRsZa1S01KlleglcDf8Bx3eJA=;
	b=U3e1E+FuiCNFCl6j16MpY5t62vekdTKEL7toPEijljgW5C067GrFcpLBAN3nMwOG/3
	x2KnXx7ZcY9bRdtaIqGsJ5wgk0XM4cgsRAjnq5gNltrgGJbOTqwHUI3BCqfEU2CsjkHY
	BAyW136YbvzIuSKqLecbVH/Nz/JtTNa5VQBuK4gpMNkgg857HjQ/GUiE4Vbi8kEU0ISE
	qZkRL7SFbkkmu0op4AEF/J6zId/Jt0h+jnUaoQjf2z0gAr+/B9NvbRE6EBQkVjX/W7Vt
	H0ez1+kf/03x/vNo8gM7eq1NIDdc+SQvinTzfitvb0Rt7rMFvqj5iDptMCooTKnaI9zN
	r7lA==
X-Gm-Message-State: ABUngvceO/M2DE3HVRySj4M6+9gn2YTLSEYNQQ+Fb66lyQ4PZZ3lwZUf21p57A1CaFcH4RON7c1ihZpDCW6hKg==
X-Received: by 10.55.138.129 with SMTP id m123mr1054033qkd.159.1477056113205; 
	Fri, 21 Oct 2016 06:21:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Fri, 21 Oct 2016 06:21:52 -0700 (PDT)
In-Reply-To: <1477054126-23044-1-git-send-email-bruce.ashfield@windriver.com>
References: <1477054126-23044-1-git-send-email-bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 21 Oct 2016 09:21:52 -0400
Message-ID: <CADkTA4OpvrKkjRGaB51zzi+KCmw56T=uiS4g58YSr5kLMiDwdg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto/4.8: update to v4.8.3
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
X-List-Received-Date: Fri, 21 Oct 2016 13:21:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c074b1af102ec053f5fec71

--94eb2c074b1af102ec053f5fec71
Content-Type: text/plain; charset=UTF-8

Hi all,

I had exchanged email with Richard about doing this -stable update, and
while it
isn't necessary to get into the 2.2 release, I wanted to send this along to
ensure
that it was queued for post release, and is something we can immediately
pull
into any -stable branches.

If there is a -rc5, this can be considered for inclusion. I built and
booted all arches
against the update and didn't find any issues.

Cheers,

Bruce


On Fri, Oct 21, 2016 at 8:48 AM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> Integrating the korg -stable release.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20
> ++++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> index fc1c40caf7b2..00c3d2c7bc1f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "b266f7ba78f0cb3d7073e1bf7bd7dfc92bec7431"
> -SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
> +SRCREV_machine ?= "320bceb35315d118c1e209effd441eb8a8dbad57"
> +SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${
> KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "4.8"
> +LINUX_VERSION ?= "4.8.3"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> index 41ff5637ec59..799c3f37577d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?= "4.8"
> +LINUX_VERSION ?= "4.8.3"
>
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
> +SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> index 5738f4974b9b..56fbfc7001bf 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "f46e49344b4c66a6f0917c5a2e9a1d146176519d"
> -SRCREV_machine_qemuarm64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_machine_qemumips ?= "5a299402ae58d61429ab091f94748550efe45858"
> -SRCREV_machine_qemuppc ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_machine_qemux86 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_machine_qemux86-64 ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_machine_qemumips64 ?= "674818dad577cdfc23c6c857aa2b769fc64e379c"
> -SRCREV_machine ?= "67813e7efa3a4614e209c2f058d92ef9a636441a"
> -SRCREV_meta ?= "552a83790b1797b6dd4e4c48ff5bc8f215ed57da"
> +SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
> +SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
> +SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
> +SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
> +SRCREV_meta ?= "6d028d2818603cd82cfb707b3231b8a9038f13bb"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=
> machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "4.8"
> +LINUX_VERSION ?= "4.8.3"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
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

--94eb2c074b1af102ec053f5fec71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div class=3D"gmail_extra">Hi all,<br></div><div clas=
s=3D"gmail_extra"><br>I had exchanged email with Richard about doing this -=
stable update, and while it<br></div><div class=3D"gmail_extra">isn&#39;t n=
ecessary to get into the 2.2 release, I wanted to send this along to ensure=
<br></div><div class=3D"gmail_extra">that it was queued for post release, a=
nd is something we can immediately pull <br></div><div class=3D"gmail_extra=
">into any -stable branches.<br><br></div><div class=3D"gmail_extra">If the=
re is a -rc5, this can be considered for inclusion. I built and booted all =
arches<br></div><div class=3D"gmail_extra">against the update and didn&#39;=
t find any issues.<br><br></div><div class=3D"gmail_extra">Cheers,<br><br><=
/div><div class=3D"gmail_extra">Bruce<br></div><div class=3D"gmail_extra"><=
br><br><div class=3D"gmail_quote">On Fri, Oct 21, 2016 at 8:48 AM, Bruce As=
hfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windriver.com=
" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Integrating the korg -stable release.<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.8.bb</a>=C2=A0 =C2=
=A0|=C2=A0 6 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.8.bb</a> |=C2=
=A0 6 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.8.bb</a>=C2=A0 =C2=A0 =
=C2=A0 | 20 ++++++++++----------<br>
=C2=A03 files changed, 16 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8=
.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
index fc1c40caf7b2..00c3d2c7bc1f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.8.bb</a><br>
@@ -11,13 +11,13 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(&quot;Set PREF=
ERRED_PROVIDER_virtual/<wbr>kernel to linux-yocto-rt to enable it&quot;)<br=
>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>b266f7ba78f0cb3d7073e1bf7bd7df<wbr>c92bec74=
31&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>552a83790b1797b6dd4e4c48ff5bc8<wbr>f215ed57da&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>320bceb35315d118c1e209effd441e<wbr>b8a8dbad=
57&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>6d028d2818603cd82cfb707b3231b8<wbr>a9038f13bb&=
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
<br>
-LINUX_VERSION ?=3D &quot;4.8&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.8.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" re=
l=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
index 41ff5637ec59..799c3f37577d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.8.bb" =
rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.8.bb</a><br>
@@ -4,13 +4,13 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
<br>
=C2=A0require recipes-kernel/linux/linux-<wbr>yocto.inc<br>
<br>
-LINUX_VERSION ?=3D &quot;4.8&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<wbr>f9a63644=
1a&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>552a83790b1797b6dd4e4c48ff5bc8<wbr>f215ed57da&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<wbr>7bba42a7=
94&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>6d028d2818603cd82cfb707b3231b8<wbr>a9038f13bb&=
quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=3D"noreferrer=
" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
index 5738f4974b9b..56fbfc7001bf 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.8.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.8.bb</a><br>
@@ -11,20 +11,20 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br=
>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;<wbr>f46e49344b4c66a6f0917c5a2e9a1d<wbr>=
146176519d&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<wb=
r>f9a636441a&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;<wbr>5a299402ae58d61429ab091f947485<wbr=
>50efe45858&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<wbr>=
f9a636441a&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<wbr>=
f9a636441a&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<w=
br>f9a636441a&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;<wbr>674818dad577cdfc23c6c857aa2b76<w=
br>9fc64e379c&quot;<br>
-SRCREV_machine ?=3D &quot;<wbr>67813e7efa3a4614e209c2f058d92e<wbr>f9a63644=
1a&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>552a83790b1797b6dd4e4c48ff5bc8<wbr>f215ed57da&=
quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;<wbr>4cc544ad09ad704322cb66fe4ba197<wbr>=
a6a05dc71f&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<wb=
r>7bba42a794&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;<wbr>c285969d4f9376a671167ecf397578<wbr=
>c8ad3e6a75&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<wbr>=
7bba42a794&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<wbr>=
7bba42a794&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<w=
br>7bba42a794&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;<wbr>64f96ba530e58456070f26b0f3fcce<w=
br>3f64988b72&quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>1adf9d36338dc3c63cdbf6f98bcbdc<wbr>7bba42a7=
94&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>6d028d2818603cd82cfb707b3231b8<wbr>a9038f13bb&=
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
<br>
-LINUX_VERSION ?=3D &quot;4.8&quot;<br>
+LINUX_VERSION ?=3D &quot;4.8.3&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
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
</div></div></div>

--94eb2c074b1af102ec053f5fec71--
