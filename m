Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id E57F460616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 19:40:35 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id g16so260884uah.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cRm47N1v6M0DRgk8F3tAtGeggCqKZYjc+lJsYAR4W2I=;
	b=L4/upOZW2/Ujxhbb214jmY55X2NWaJvYu1IyUtvokMDoRTfi71z/EwExwV0nTxDNcw
	K/PdqgFRnb0VSGwgfGRPkxKMHoPpQhQnjf8G+ezjwf6r0Wl6yux9/v3t2Mr2UiVd0dVg
	X4a3gbg6ktjw704smEXNsy1x4vljfXAvqPoCxzEtVqR0FiGJeZkNeXmUnR6oWLPF2Rh9
	jQBGEJs2kBmkBi3RxwyFLdoQNFOJ+rrUmULdBY/gmr/gnyakvSTiuc5kLVxGHXbxr0H0
	97paPcHYcaWuawwtUXxWyMpfRn3zFFViYdD9m5RbLrJfd9cOWDQ8gybNo5yCvRPwBB5o
	lYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cRm47N1v6M0DRgk8F3tAtGeggCqKZYjc+lJsYAR4W2I=;
	b=pbTkKeAtCRCVk+nwgksOrwQLqgDy6Wo0DzXTnjxz4bvgjPZRT3ysnSpMSqOsgGnYJm
	5WNziML3zhGpdxZl6rpGvKBKjY7bBqa43jjkRpn5Vfr050/D8hrr1zgG27YQYfPbQLE0
	sjccoK1PYD5Df8rySxae4okP3t62OncE7QskSc6xiP1ltNrFiKAkYYT/3QOaEcNG0cD6
	c7py401jJBMHRT6Cc4eMLgsDdAfn9OLGuD2ualcIoS/DDhtY1NRijVnx7e0vEgKikoGn
	7+AAngzlMh9TqnCpEmmUBCbxap6L4Eq6QoBBCCtn8C7FIvslM5cLsRUYp/3X2YJRkh1A
	/UJg==
X-Gm-Message-State: AHYfb5htrOAPQ/MgmTBzUzTJWt89MAJA+FUfjtGleGNiCoXmaZcWR7O6
	geafurKq1k5tV4N2GTDpLcMCpjCaWA==
X-Google-Smtp-Source: ADKCNb4tUBnjH5yYAyvCPCimx4ZI30VLfdsv4KF2yaMnbPfZXC9ghXWnh/L5fW+GKbWELGOFa9kzjFKIbzjS6wwEurk=
X-Received: by 10.176.82.141 with SMTP id v13mr3958661uav.74.1504208038912;
	Thu, 31 Aug 2017 12:33:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Thu, 31 Aug 2017 12:33:58 -0700 (PDT)
In-Reply-To: <52a4853953250d1f68c9d96775a923346e3c0b78.1504207711.git.bruce.ashfield@windriver.com>
References: <cover.1504207711.git.bruce.ashfield@windriver.com>
	<52a4853953250d1f68c9d96775a923346e3c0b78.1504207711.git.bruce.ashfield@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Aug 2017 15:33:58 -0400
Message-ID: <CADkTA4OxGXdU-5Tk3OWvo9apZaq7avHmDzMLeChjA55mkRLHhQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] linux-yoct/4.12: fix yaffs2 build
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
X-List-Received-Date: Thu, 31 Aug 2017 19:40:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c18f892d3e982055811b927"

--94eb2c18f892d3e982055811b927
Content-Type: text/plain; charset="UTF-8"

typo in the short log has been fixed and the branch re-pushed to
zedd/kernel.

Bruce

On Thu, Aug 31, 2017 at 3:30 PM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> Yaffs2 needs some tweaks to build against the 4.12 kernel, we
> import the following two commits:
>
>   084d8ae2f349 fs: yaffs2: includes the missing header file
>   595f7d1759d9 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 18
> +++++++++---------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> index 49f5bf3522ad..1b1bf9f76270 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -11,8 +11,8 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
> +SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${
> KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> index ff395e0ad7e3..bdf660e6ce9e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> @@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.12.7"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
> +SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> index ce223ca081f3..964dbce3e79e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "dc7fc6edebaa6d20967c953a2cd27bac5e955463"
> -SRCREV_machine_qemuarm64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_machine_qemumips ?= "ff11a70047bbab2c801f9b4f7b9d4bc1d38dbed1"
> -SRCREV_machine_qemuppc ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_machine_qemux86 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_machine_qemux86-64 ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_machine_qemumips64 ?= "a4d6ef2c5428e57f7f9982d230b09459683ddb1d"
> -SRCREV_machine ?= "d09f2ce584d60ecb7890550c22a80c48b83c2e19"
> -SRCREV_meta ?= "edb42d48052dee4dbc3ed9d5e1e39c1375e85fe0"
> +SRCREV_machine_qemuarm ?= "a5227887cfadd94068717e8166879bf88d00ef73"
> +SRCREV_machine_qemuarm64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_machine_qemumips ?= "a6983bac4e93ba7e892f666ad8c58b32c2d10945"
> +SRCREV_machine_qemuppc ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_machine_qemux86 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_machine_qemux86-64 ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_machine_qemumips64 ?= "b344c1888b03e40683ba109bb45b44e9cf4d1eb4"
> +SRCREV_machine ?= "084d8ae2f349a7621e1e51c81b4494b123f3c09a"
> +SRCREV_meta ?= "9acd7f92a1b3248310ec17407063f968732ad130"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=
> machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;
> name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
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

--94eb2c18f892d3e982055811b927
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">typo in the short log has been fixed and the branch re-pus=
hed to zedd/kernel.<div><br></div><div>Bruce</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, Aug 31, 2017 at 3:30 PM, Bru=
ce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Yaffs2 needs some tweaks to build agains=
t the 4.12 kernel, we<br>
import the following two commits:<br>
<br>
=C2=A0 084d8ae2f349 fs: yaffs2: includes the missing header file<br>
=C2=A0 595f7d1759d9 fs: yaffs2: replace CURRENT_TIME by other appropriate a=
pis<br>
<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windrive=
r.com">bruce.ashfield@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-rt_4.12.bb</a>=C2=A0 =
=C2=A0|=C2=A0 4 ++--<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto-tiny_4.12.bb</a> |=
=C2=A0 4 ++--<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linu<wbr>x-yocto_4.12.bb</a>=C2=A0 =C2=A0=
 =C2=A0 | 18 +++++++++---------<br>
=C2=A03 files changed, 13 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
index 49f5bf3522ad..1b1bf9f76270 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.12.bb" r=
el=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-rt_4.12.bb</a><br>
@@ -11,8 +11,8 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipPackage(&quot;Set PREF=
ERRED_PROVIDER_virtual/<wbr>kernel to linux-yocto-rt to enable it&quot;)<br=
>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wbr>48b83c2e=
19&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>edb42d48052dee4dbc3ed9d5e1e39c<wbr>1375e85fe0&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wbr>b123f3c0=
9a&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>9acd7f92a1b3248310ec17407063f9<wbr>68732ad130&=
quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.12.git;branch=3D${KBRANCH};name=3Dmachine" rel=3D"noreferrer" targe=
t=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.12.git;branch=3D${<wbr=
>KBRANCH};name=3Dmachine</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.12=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.12;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4=
.12.bb" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
index ff395e0ad7e3..bdf660e6ce9e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_4.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto-tiny_4.12.bb</a><br>
@@ -9,8 +9,8 @@ LINUX_VERSION ?=3D &quot;4.12.7&quot;<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wbr>48b83c2e=
19&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>edb42d48052dee4dbc3ed9d5e1e39c<wbr>1375e85fe0&=
quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wbr>b123f3c0=
9a&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>9acd7f92a1b3248310ec17407063f9<wbr>68732ad130&=
quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.b=
b" rel=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=3D"norefer=
rer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
index ce223ca081f3..964dbce3e79e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.12.bb" rel=
=3D"noreferrer" target=3D"_blank">li<wbr>nux-yocto_4.12.bb</a><br>
@@ -11,15 +11,15 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;standard/base&quot;<br=
>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;<wbr>dc7fc6edebaa6d20967c953a2cd27b<wbr>=
ac5e955463&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wb=
r>48b83c2e19&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;<wbr>ff11a70047bbab2c801f9b4f7b9d4b<wbr=
>c1d38dbed1&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wbr>=
48b83c2e19&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wbr>=
48b83c2e19&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<w=
br>48b83c2e19&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;<wbr>a4d6ef2c5428e57f7f9982d230b094<w=
br>59683ddb1d&quot;<br>
-SRCREV_machine ?=3D &quot;<wbr>d09f2ce584d60ecb7890550c22a80c<wbr>48b83c2e=
19&quot;<br>
-SRCREV_meta ?=3D &quot;<wbr>edb42d48052dee4dbc3ed9d5e1e39c<wbr>1375e85fe0&=
quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;<wbr>a5227887cfadd94068717e8166879b<wbr>=
f88d00ef73&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wb=
r>b123f3c09a&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;<wbr>a6983bac4e93ba7e892f666ad8c58b<wbr=
>32c2d10945&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wbr>=
b123f3c09a&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wbr>=
b123f3c09a&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<w=
br>b123f3c09a&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;<wbr>b344c1888b03e40683ba109bb45b44<w=
br>e9cf4d1eb4&quot;<br>
+SRCREV_machine ?=3D &quot;<wbr>084d8ae2f349a7621e1e51c81b4494<wbr>b123f3c0=
9a&quot;<br>
+SRCREV_meta ?=3D &quot;<wbr>9acd7f92a1b3248310ec17407063f9<wbr>68732ad130&=
quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.12.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" targe=
t=3D"_blank">git.yoctoproject.org/<wbr>linux-yocto-4.12.git;name=3D<wbr>mac=
hine;branch=3D${KBRANCH}</a>; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.12=
;destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoproje=
ct.org/<wbr>yocto-kernel-cache;type=3Dkmeta;<wbr>name=3Dmeta;branch=3Dyocto=
-4.12;<wbr>destsuffix=3D${KMETA}</a>&quot;<br>
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
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c18f892d3e982055811b927--
