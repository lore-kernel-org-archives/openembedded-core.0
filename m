Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QoIlx-00088B-OY
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:28:54 +0200
Received: by pzk1 with SMTP id 1so13599256pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2011 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=CO069EfDxkPPAbsYNS9ysX6zOo2M+ewq+4HD8E9kD0Y=;
	b=vJ79OH1BS/ObAf8wCQvE0s1hd7IdzqjrBYZPyIYBJMcqXpfqcdCPmf3AIJ/OKpl49/
	AdR70psFrscuTzr2KPR0wrWjfSU76rGwhysIUN1X9QvLToeo7xvcS89kYEaX60XxdStL
	SyBXlyrj+fzpnCabZF2xghwYpH8Z1ddGXFo+Q=
Received: by 10.68.29.200 with SMTP id m8mr10904293pbh.278.1312305871165; Tue,
	02 Aug 2011 10:24:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.65.130 with HTTP; Tue, 2 Aug 2011 10:24:01 -0700 (PDT)
In-Reply-To: <1312302695-17747-1-git-send-email-galak@kernel.crashing.org>
References: <1312302695-17747-1-git-send-email-galak@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Aug 2011 10:24:01 -0700
Message-ID: <CAMKF1sqRwhhMKb7VH6ubFiD7eT4mgOFRsKQMcdvN5aiCJMZjhw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune/powerpc: Cleanup setting of TUNE_PKGARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Aug 2011 17:28:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 2, 2011 at 9:31 AM, Kumar Gala <galak@kernel.crashing.org> wrot=
e:
> Add some uniformity to the naming scheme and reduce a bit of redudancy.
>
> Names are now back to: ppc603e, ppce300c2, ppce500, ppce500mc,
> ppce500v2.
>
> On 64-bit we'll have something like ppc64e5500.

there are 2 more patches more or less addressing the same problem

http://patches.openembedded.org/patch/9067/
http://patches.openembedded.org/patch/9015/

>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> =C2=A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 =C2=A05=
 +++--
> =C2=A0meta/conf/machine/include/tune-ppc603e.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/machine/include/tune-ppce300c2.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/machine/include/tune-ppce500.inc =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/machine/include/tune-ppce500mc.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A0meta/conf/machine/include/tune-ppce500v2.inc =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A02 +-
> =C2=A06 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc b/meta/co=
nf/machine/include/powerpc/arch-powerpc.inc
> index 93b1c05..a8226ea 100644
> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
> @@ -3,6 +3,7 @@
> =C2=A0# *) Hard Floating Point on 64-bit
>
> =C2=A0DEFAULTTUNE ?=3D "powerpc"
> +TUNE_PKGARCH ?=3D "ppc"
>
> =C2=A0TUNEVALID[m32] =3D "Power ELF32 standard ABI"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m3=
2", "", d)}"
> @@ -12,6 +13,7 @@ TUNEVALID[m64] =3D "Power ELF64 standard ABI"
> =C2=A0TUNE_CONFLICTS[m64] =3D "m32 nf"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "m64", "-m6=
4", "", d)}"
> =C2=A0TUNE_ARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "p=
owerpc64", "", d)}"
> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", [ "m64" ], "64"=
, "", d)}"
>
> =C2=A0TUNEVALID[fpu-hard] =3D "Use hardware FPU."
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-hard",=
 "-mhard-float", "", d)}"
> @@ -23,8 +25,7 @@ TARGET_FPU .=3D "${@bb.utils.contains("TUNE_FEATURES", =
"fpu-soft", "soft", "", d)}
> =C2=A0ABIEXTENSION =3D "${@['','spe'][d.getVar('TARGET_FPU', True) in ['p=
pc-efd', 'ppc-efs']]}"
>
> =C2=A0PPCPKGSFX_FPU =3D "${@bb.utils.contains("TUNE_FEATURES", "fpu-soft"=
, "-nf", "", d)}"
> -
> -TUNE_PKGARCH ?=3D "${TUNE_ARCH}${PPCPKGSFX_FPU}"
> +TUNE_PKGARCH .=3D "${PPCPKGSFX_FPU}"
>
> =C2=A0# Basic tune definitions
> =C2=A0AVAILTUNES +=3D "powerpc powerpc-nf"
> diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machi=
ne/include/tune-ppc603e.inc
> index 7c05394..12ba425 100644
> --- a/meta/conf/machine/include/tune-ppc603e.inc
> +++ b/meta/conf/machine/include/tune-ppc603e.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =C2=A0TUNEVALID[ppc603e] =3D "Enable ppc603e specific processor optimizat=
ions"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", =
"-mcpu=3D603e", "", d)}"
> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "ppc=
603e", "", d)}"
> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppc603e", "603=
e", "", d)}"
>
> =C2=A0AVAILTUNES +=3D "ppc603e"
> =C2=A0TUNE_FEATURES_tune-ppc603e =3D "m32 fpu-hard ppc603e"
> diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/mac=
hine/include/tune-ppce300c2.inc
> index bad2611..6fe3e42 100644
> --- a/meta/conf/machine/include/tune-ppce300c2.inc
> +++ b/meta/conf/machine/include/tune-ppce300c2.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =C2=A0TUNEVALID[ppce300c2] =3D "Enable ppce300c2 specific processor optim=
izations"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2"=
, "-mcpu=3De300c2", "", d)}"
> -TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "pp=
ce300c2", "${TUNE_ARCH}", d)}"
> +TUNE_PKGARCH =3D "${@bb.utils.contains("TUNE_FEATURES", "ppce300c2", "e3=
00c2", "${TUNE_ARCH}", d)}"
>
> =C2=A0AVAILTUNES +=3D "ppce300c2"
> =C2=A0TUNE_FEATURES_tune-ppce300c2 =3D "m32 fpu-soft ppce300c2"
> diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machi=
ne/include/tune-ppce500.inc
> index c34d631..0e850f1 100644
> --- a/meta/conf/machine/include/tune-ppce500.inc
> +++ b/meta/conf/machine/include/tune-ppce500.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =C2=A0TUNEVALID[ppce500] =3D "Enable ppce500 specific processor optimizat=
ions"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", =
"-mcpu=3D8540", "", d)}"
> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "ppc=
e500", "", d)}"
> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500", "e50=
0", "", d)}"
>
> =C2=A0TUNEVALID[spe] =3D "Enable SPE ABI extensions"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "spe", "-ma=
bi=3Dspe -mspe", "", d)}"
> diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/mac=
hine/include/tune-ppce500mc.inc
> index 73217dd..9fee226 100644
> --- a/meta/conf/machine/include/tune-ppce500mc.inc
> +++ b/meta/conf/machine/include/tune-ppce500mc.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =C2=A0TUNEVALID[ppce500mc] =3D "Enable ppce500mc specific processor optim=
izations"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc"=
, "-mcpu=3De500mc", "", d)}"
> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "p=
pce500mc", "", d)}"
> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500mc", "e=
500mc", "", d)}"
>
> =C2=A0AVAILTUNES +=3D "ppce500mc"
> =C2=A0TUNE_FEATURES_tune-ppce500mc =3D "m32 fpu-hard ppce500mc"
> diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/mac=
hine/include/tune-ppce500v2.inc
> index 819d68a..2a0451b 100644
> --- a/meta/conf/machine/include/tune-ppce500v2.inc
> +++ b/meta/conf/machine/include/tune-ppce500v2.inc
> @@ -4,7 +4,7 @@ require conf/machine/include/powerpc/arch-powerpc.inc
>
> =C2=A0TUNEVALID[ppce500v2] =3D "Enable ppce500v2 specific processor optim=
izations"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2"=
, "-mcpu=3D8548", "", d)}"
> -TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "p=
pce500v2", "", d)}"
> +TUNE_PKGARCH .=3D "${@bb.utils.contains("TUNE_FEATURES", "ppce500v2", "e=
500v2", "", d)}"
>
> =C2=A0TUNEVALID[spe] =3D "Enable SPE ABI extensions"
> =C2=A0TUNE_CCARGS +=3D "${@bb.utils.contains("TUNE_FEATURES", "spe", "-ma=
bi=3Dspe -mspe", "", d)}"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


