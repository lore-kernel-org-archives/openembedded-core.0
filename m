Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE91601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 23:56:55 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id w5so4724466qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 16:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PsBiLg9p7fC8rbFcWA30O7tJUbCvS7XslpLv1pU+Pug=;
	b=rJwlgPQBdoooKPUNcI8tFXWUJJluTTwj1RhF8bXYHUmsARA5rqFlfCZEso1WjJumhl
	Dcxavrj8LPocOyxjTl2phkgbzmd+jIyGKI6yxuUsPBuoEImjSVa2SGsCRAiibMkaACEH
	LY12sCWt4/Plob631NCmEaFhmtDGPHzisYcNIahJ1p5GCdahtcK1o3olX1cqmT55M6Z+
	kWSQdX0rPXdCtQiD6zBwa1Rhd0KTckMRX+hpErjq8fmJyOoWlU5mSYYwYXUcX4pr0CaK
	0cnMVtyhZosYa5G8eFzwErb8cejoIW2FlttOPKS4n/e0VhkzX9xig8vmYn2TCRPvx8Wh
	6YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PsBiLg9p7fC8rbFcWA30O7tJUbCvS7XslpLv1pU+Pug=;
	b=LQsNz7vat/fXqmtyeZ7XnWaf264Wc0fH+/+4s6xQcx9NgpoLfGNOz7vHH3H0lPQ9pn
	xxpC4OOT4peaE1eFx/DjrEKqZq4AHbaSZuZ0NVDNstdF/W5gcetkleuFzaQfIwI3AO4F
	wnNeY14YOl32frgyNd6XyVM4fLA/FqeDhA/k/LndAkCjkcRuIPUReNj4U4W9j93ggMsx
	2GqWPr+2D8SBpGza2QtRyBnRCNPEk2ofRj7g1FI6agBXPfNdEphTWkxR0EHxinYjASGV
	Ayj8pi1AGhBaBG42CSEEq7MBlJBrYaEBxbmlGNt5Y6oonrTKtyl1hDflhpSLeKPPIujK
	W8qA==
X-Gm-Message-State: APjAAAVTCueLBvMwrI1tt1NjBug7t4mICkVlGgiK2ak1nolKduy8bc7Q
	Boy18jGtUAm8jRF81yUhMGfHqN52dJ9g9MFqlfdBoGoy
X-Google-Smtp-Source: APXvYqx0G9+aKNJMqEGeOZCJ51kxv+56QV078FWVQQ3f6WcqM3RH0/WMlIpiBL05S/WledZsGaAc/Gta8yiJDu7eBWI=
X-Received: by 2002:a0c:9561:: with SMTP id m30mr662095qvm.224.1553126216037; 
	Wed, 20 Mar 2019 16:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190319114536.2925-1-bunk@stusta.de>
In-Reply-To: <20190319114536.2925-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2019 19:56:45 -0400
Message-ID: <CAMKF1soK74hWae1h+C9+23Shre2EBaUSp+HiK7q8GCPZcTeXLA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Remove the simd tune for armv8a
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
X-List-Received-Date: Wed, 20 Mar 2019 23:56:55 -0000
Content-Type: multipart/alternative; boundary="00000000000065f90f05848f606e"

--00000000000065f90f05848f606e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2019 at 4:45 AM Adrian Bunk <bunk@stusta.de> wrote:

> SIMD instructions are a mandatory part of armv8a
> (they were optional in armv7a), and the gcc docs
> also say that they are always enabled.


This should be ok but please cite the reference to arch specs where it=E2=
=80=99s
mentioned and if someone
Has need to turn it off then they should chime back
Since removing this just removes a detail which we can actually keep
without much effort

>
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  meta/conf/machine/include/arm/arch-armv8a.inc | 6 ++----
>  meta/conf/machine/include/tune-cortexa32.inc  | 4 ++--
>  meta/conf/machine/include/tune-cortexa35.inc  | 4 ++--
>  meta/conf/machine/include/tune-cortexa53.inc  | 4 ++--
>  meta/conf/machine/include/tune-cortexa72.inc  | 2 +-
>  5 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc
> b/meta/conf/machine/include/arm/arch-armv8a.inc
> index 22064559be..44d0ca4557 100644
> --- a/meta/conf/machine/include/arm/arch-armv8a.inc
> +++ b/meta/conf/machine/include/arm/arch-armv8a.inc
> @@ -2,8 +2,6 @@ DEFAULTTUNE ?=3D "armv8a-crc"
>
>  TUNEVALID[armv8a] =3D "Enable instructions for ARMv8-a"
>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv8a', '
> -march=3Darmv8-a', '', d)}"
> -TUNEVALID[simd] =3D "Enable instructions for ARMv8-a Advanced SIMD and
> floating-point"
> -TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'simd', '+simd',
> '', d)}"
>  TUNEVALID[crc] =3D "Enable instructions for ARMv8-a Cyclic Redundancy Ch=
eck
> (CRC)"
>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'crc', '+crc', '=
',
> d)}"
>  TUNEVALID[crypto] =3D "Enable instructions for ARMv8-a cryptographic"
> @@ -18,11 +16,11 @@ ARMPKGARCH_tune-armv8a                    ?=3D "armv8=
a"
>  ARMPKGARCH_tune-armv8a-crc                ?=3D "armv8a"
>  ARMPKGARCH_tune-armv8a-crypto             ?=3D "armv8a"
>  ARMPKGARCH_tune-armv8a-crc-crypto         ?=3D "armv8a"
> -TUNE_FEATURES_tune-armv8a                  =3D "aarch64 armv8a simd"
> +TUNE_FEATURES_tune-armv8a                  =3D "aarch64 armv8a"
>  TUNE_FEATURES_tune-armv8a-crc              =3D
> "${TUNE_FEATURES_tune-armv8a} crc"
>  TUNE_FEATURES_tune-armv8a-crypto           =3D
> "${TUNE_FEATURES_tune-armv8a} crypto"
>  TUNE_FEATURES_tune-armv8a-crc-crypto       =3D
> "${TUNE_FEATURES_tune-armv8a-crc} crypto"
> -PACKAGE_EXTRA_ARCHS_tune-armv8a            =3D "aarch64 armv8a simd"
> +PACKAGE_EXTRA_ARCHS_tune-armv8a            =3D "aarch64 armv8a"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc        =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto     =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto"
>  PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} crypto"
> diff --git a/meta/conf/machine/include/tune-cortexa32.inc
> b/meta/conf/machine/include/tune-cortexa32.inc
> index 4bf7f774e1..9c948f1766 100644
> --- a/meta/conf/machine/include/tune-cortexa32.inc
> +++ b/meta/conf/machine/include/tune-cortexa32.inc
> @@ -10,8 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES +=3D "cortexa32 cortexa32-crypto"
>  ARMPKGARCH_tune-cortexa32             =3D "cortexa32"
>  ARMPKGARCH_tune-cortexa32-crypto      =3D "cortexa32"
> -TUNE_FEATURES_tune-cortexa32          =3D "aarch64 cortexa32 simd crc"
> -TUNE_FEATURES_tune-cortexa32-crypto   =3D "aarch64 cortexa32 simd crc
> crypto"
> +TUNE_FEATURES_tune-cortexa32          =3D "aarch64 cortexa32 crc"
> +TUNE_FEATURES_tune-cortexa32-crypto   =3D "aarch64 cortexa32 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa32             =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto=
"
>  BASE_LIB_tune-cortexa32               =3D "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa35.inc
> b/meta/conf/machine/include/tune-cortexa35.inc
> index 6ece810753..d6df6cd6bd 100644
> --- a/meta/conf/machine/include/tune-cortexa35.inc
> +++ b/meta/conf/machine/include/tune-cortexa35.inc
> @@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES +=3D "cortexa35 cortexa35-crypto"
>  ARMPKGARCH_tune-cortexa35             =3D "cortexa35"
>  ARMPKGARCH_tune-cortexa35-crypto      =3D "cortexa35"
> -TUNE_FEATURES_tune-cortexa35          =3D "aarch64 cortexa35 simd crc"
> -TUNE_FEATURES_tune-cortexa35-crypto   =3D "aarch64 cortexa35 simd crc
> crypto"
> +TUNE_FEATURES_tune-cortexa35          =3D "aarch64 cortexa35 crc"
> +TUNE_FEATURES_tune-cortexa35-crypto   =3D "aarch64 cortexa35 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa35             =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto      =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto=
"
>  BASE_LIB_tune-cortexa35               =3D "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa53.inc
> b/meta/conf/machine/include/tune-cortexa53.inc
> index 9fb37ff639..6c0b443eaf 100644
> --- a/meta/conf/machine/include/tune-cortexa53.inc
> +++ b/meta/conf/machine/include/tune-cortexa53.inc
> @@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
>  AVAILTUNES +=3D "cortexa53 cortexa53-crypto"
>  ARMPKGARCH_tune-cortexa53             =3D "cortexa53"
>  ARMPKGARCH_tune-cortexa53-crypto      =3D "cortexa53"
> -TUNE_FEATURES_tune-cortexa53          =3D "aarch64 cortexa53 simd crc"
> -TUNE_FEATURES_tune-cortexa53-crypto   =3D "aarch64 cortexa53 simd crc
> crypto"
> +TUNE_FEATURES_tune-cortexa53          =3D "aarch64 cortexa53 crc"
> +TUNE_FEATURES_tune-cortexa53-crypto   =3D "aarch64 cortexa53 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa53             =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto      =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto=
"
>  BASE_LIB_tune-cortexa53               =3D "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa72.inc
> b/meta/conf/machine/include/tune-cortexa72.inc
> index 4c2306c4fd..00f7745a22 100644
> --- a/meta/conf/machine/include/tune-cortexa72.inc
> +++ b/meta/conf/machine/include/tune-cortexa72.inc
> @@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8a.inc
>  # Little Endian base configs
>  AVAILTUNES +=3D "cortexa72"
>  ARMPKGARCH_tune-cortexa72             =3D "cortexa72"
> -TUNE_FEATURES_tune-cortexa72          =3D "aarch64 cortexa72 simd crc
> crypto"
> +TUNE_FEATURES_tune-cortexa72          =3D "aarch64 cortexa72 crc crypto"
>  PACKAGE_EXTRA_ARCHS_tune-cortexa72    =3D
> "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72"
>  BASE_LIB_tune-cortexa72               =3D "lib64"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000065f90f05848f606e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 19, 2019 at 4:45 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">SIMD instructions are a mandatory part of armv8a<br>
(they were optional in armv7a), and the gcc docs<br>
also say that they are always enabled.</blockquote><div dir=3D"auto"><br></=
div><div dir=3D"auto">This should be ok but please cite the reference to ar=
ch specs where it=E2=80=99s mentioned and if someone</div><div dir=3D"auto"=
>Has need to turn it off then they should chime back=C2=A0</div><div dir=3D=
"auto">Since removing this just removes a detail which we can actually keep=
 without much effort</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
Signed-off-by: Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"=
_blank">bunk@stusta.de</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/arm/arch-armv8a.inc | 6 ++----<br>
=C2=A0meta/conf/machine/include/tune-cortexa32.inc=C2=A0 | 4 ++--<br>
=C2=A0meta/conf/machine/include/tune-cortexa35.inc=C2=A0 | 4 ++--<br>
=C2=A0meta/conf/machine/include/tune-cortexa53.inc=C2=A0 | 4 ++--<br>
=C2=A0meta/conf/machine/include/tune-cortexa72.inc=C2=A0 | 2 +-<br>
=C2=A05 files changed, 9 insertions(+), 11 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/arm/arch-armv8a.inc b/meta/conf/mach=
ine/include/arm/arch-armv8a.inc<br>
index 22064559be..44d0ca4557 100644<br>
--- a/meta/conf/machine/include/arm/arch-armv8a.inc<br>
+++ b/meta/conf/machine/include/arm/arch-armv8a.inc<br>
@@ -2,8 +2,6 @@ DEFAULTTUNE ?=3D &quot;armv8a-crc&quot;<br>
<br>
=C2=A0TUNEVALID[armv8a] =3D &quot;Enable instructions for ARMv8-a&quot;<br>
=C2=A0TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, =
&#39;armv8a&#39;, &#39; -march=3Darmv8-a&#39;, &#39;&#39;, d)}&quot;<br>
-TUNEVALID[simd] =3D &quot;Enable instructions for ARMv8-a Advanced SIMD an=
d floating-point&quot;<br>
-TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;=
simd&#39;, &#39;+simd&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0TUNEVALID[crc] =3D &quot;Enable instructions for ARMv8-a Cyclic Redun=
dancy Check (CRC)&quot;<br>
=C2=A0TUNE_CCARGS .=3D &quot;${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, =
&#39;crc&#39;, &#39;+crc&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0TUNEVALID[crypto] =3D &quot;Enable instructions for ARMv8-a cryptogra=
phic&quot;<br>
@@ -18,11 +16,11 @@ ARMPKGARCH_tune-armv8a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;armv8a&quot;<br>
=C2=A0ARMPKGARCH_tune-armv8a-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ?=3D &quot;armv8a&quot;<br>
=C2=A0ARMPKGARCH_tune-armv8a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0?=3D &quot;armv8a&quot;<br>
=C2=A0ARMPKGARCH_tune-armv8a-crc-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=
=3D &quot;armv8a&quot;<br>
-TUNE_FEATURES_tune-armv8a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;aarch64 armv8a simd&quot;<br>
+TUNE_FEATURES_tune-armv8a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =3D &quot;aarch64 armv8a&quot;<br>
=C2=A0TUNE_FEATURES_tune-armv8a-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =3D &quot;${TUNE_FEATURES_tune-armv8a} crc&quot;<br>
=C2=A0TUNE_FEATURES_tune-armv8a-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;${TUNE_FEATURES_tune-armv8a} crypto&quot;<br>
=C2=A0TUNE_FEATURES_tune-armv8a-crc-crypto=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &q=
uot;${TUNE_FEATURES_tune-armv8a-crc} crypto&quot;<br>
-PACKAGE_EXTRA_ARCHS_tune-armv8a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;aarch64 armv8a simd&quot;<br>
+PACKAGE_EXTRA_ARCHS_tune-armv8a=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D &quot;aarch64 armv8a&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-armv8a-crc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &q=
uot;${PACKAGE_EXTRA_ARCHS_tune-armv8a} crc&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-armv8a-crypto=C2=A0 =C2=A0 =C2=A0=3D &quot;$=
{PACKAGE_EXTRA_ARCHS_tune-armv8a} crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto =3D &quot;${PACKAGE_EXTRA_=
ARCHS_tune-armv8a-crc} crypto&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machi=
ne/include/tune-cortexa32.inc<br>
index 4bf7f774e1..9c948f1766 100644<br>
--- a/meta/conf/machine/include/tune-cortexa32.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa32.inc<br>
@@ -10,8 +10,8 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa32 cortexa32-crypto&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa32&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa32-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortex=
a32&quot;<br>
-TUNE_FEATURES_tune-cortexa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa32 simd crc&quot;<br>
-TUNE_FEATURES_tune-cortexa32-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa3=
2 simd crc crypto&quot;<br>
+TUNE_FEATURES_tune-cortexa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa32 crc&quot;<br>
+TUNE_FEATURES_tune-cortexa32-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa3=
2 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32&quo=
t;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto=C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto=
&quot;<br>
=C2=A0BASE_LIB_tune-cortexa32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machi=
ne/include/tune-cortexa35.inc<br>
index 6ece810753..d6df6cd6bd 100644<br>
--- a/meta/conf/machine/include/tune-cortexa35.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa35.inc<br>
@@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa35 cortexa35-crypto&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa35&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa35-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortex=
a35&quot;<br>
-TUNE_FEATURES_tune-cortexa35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa35 simd crc&quot;<br>
-TUNE_FEATURES_tune-cortexa35-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa3=
5 simd crc crypto&quot;<br>
+TUNE_FEATURES_tune-cortexa35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa35 crc&quot;<br>
+TUNE_FEATURES_tune-cortexa35-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa3=
5 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa35&quo=
t;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa35-crypto=C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa35 cortexa35-crypto=
&quot;<br>
=C2=A0BASE_LIB_tune-cortexa35=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machi=
ne/include/tune-cortexa53.inc<br>
index 9fb37ff639..6c0b443eaf 100644<br>
--- a/meta/conf/machine/include/tune-cortexa53.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa53.inc<br>
@@ -9,8 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa53 cortexa53-crypto&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa53&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =3D &quot;cortex=
a53&quot;<br>
-TUNE_FEATURES_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa53 simd crc&quot;<br>
-TUNE_FEATURES_tune-cortexa53-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa5=
3 simd crc crypto&quot;<br>
+TUNE_FEATURES_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa53 crc&quot;<br>
+TUNE_FEATURES_tune-cortexa53-crypto=C2=A0 =C2=A0=3D &quot;aarch64 cortexa5=
3 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0=3D &quot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa53&quo=
t;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa53-crypto=C2=A0 =C2=A0 =C2=A0 =3D &qu=
ot;${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa53 cortexa53-crypto=
&quot;<br>
=C2=A0BASE_LIB_tune-cortexa53=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machi=
ne/include/tune-cortexa72.inc<br>
index 4c2306c4fd..00f7745a22 100644<br>
--- a/meta/conf/machine/include/tune-cortexa72.inc<br>
+++ b/meta/conf/machine/include/tune-cortexa72.inc<br>
@@ -8,6 +8,6 @@ require conf/machine/include/arm/arch-armv8a.inc<br>
=C2=A0# Little Endian base configs<br>
=C2=A0AVAILTUNES +=3D &quot;cortexa72&quot;<br>
=C2=A0ARMPKGARCH_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D &quot;cortexa72&quot;<br>
-TUNE_FEATURES_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa72 simd crc crypto&quot;<br>
+TUNE_FEATURES_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;a=
arch64 cortexa72 crc crypto&quot;<br>
=C2=A0PACKAGE_EXTRA_ARCHS_tune-cortexa72=C2=A0 =C2=A0 =3D &quot;${PACKAGE_E=
XTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72&quot;<br>
=C2=A0BASE_LIB_tune-cortexa72=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;lib64&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000065f90f05848f606e--
