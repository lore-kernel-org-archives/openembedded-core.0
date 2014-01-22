Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id D016C615AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2014 01:02:55 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d17so4539345eek.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 17:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gOrz4FdsEmfZWPZyCc7fGeZQnGGlBemKOOlaitar+C0=;
	b=Wxyy9bbopYHRcs3BGzKIx3Mr8KG44yLMko7p7IZ9Dm63WKk/s8xqwXa/LFL7UV69JK
	PrEexuMn5K+T5GRm0Rpy4GobF/mkxSzd+G2xag8ktN4ZuLwZyVYLz0zCz6CRKFCwXbEI
	l9/gmCzhTk6Q9n71kJSkljBgTj1LrUPu5MlG5940XdgAvftKIQG71S8jEkEaBknRQhMh
	pcJ2C5ZG75KjYM0BYegqJl/Xb03BJae5rmuTQl63SVRqq791lzSItuWO/KPzHZ83Z/9i
	h5/C37xDTqZVJISGw5LRtXiRZUOFTHjhqBnR+zZLG4FBCTR2OHtptqhghjw/aPDMD7+R
	s9+w==
X-Received: by 10.14.0.201 with SMTP id 49mr27075972eeb.38.1390352576406;
	Tue, 21 Jan 2014 17:02:56 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm20797727ees.4.2014.01.21.17.02.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 17:02:55 -0800 (PST)
Date: Wed, 22 Jan 2014 02:02:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140122010255.GP4100@jama>
References: <cover.1390351667.git.dvhart@linux.intel.com>
	<e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e6c72bf867006ab15d62d0beb1cd8aafe19db72a.1390351667.git.dvhart@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org, Poky <poky@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCH 01/19] x86: Replace ia32 with x86 when referring to the generic architecture
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
X-List-Received-Date: Wed, 22 Jan 2014 01:02:56 -0000
X-Groupsio-MsgNum: 49345
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/6IVfYouxg+lu1D"
Content-Disposition: inline

--5/6IVfYouxg+lu1D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 04:58:46PM -0800, Darren Hart wrote:
> ia32 implies 32bit, while these files provide descriptions for IA32,
> X86_64, and X32 architectures. The term "x86" fits this used better
> without resorting to using the term "Intel" which isn't quite right as
> it excludes things like the tune-c3 file describing a Via CPU.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Paul Eggleton <paul.eggleton@intel.com>
> Cc: Tom Zanussi <tom.zanussi@intel.com>
> Cc: Nitin Kamble <nitin.a.kamble@intel.com>
> Cc: Mark Hatle <mark.hatle@windriver.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/conf/machine/include/tune-c3.inc              |    2 +-
>  meta/conf/machine/include/tune-i586.inc            |    2 +-
>  meta/conf/machine/include/tune-x86_64.inc          |    2 +-
>  .../include/{ia32-base.inc =3D> x86-base.inc}        |   18 +++++++++---=
------
>  meta/conf/machine/include/{ia32 =3D> x86}/README     |    6 +++---
>  .../{ia32/arch-ia32.inc =3D> x86/arch-x86.inc}       |    2 +-
>  6 files changed, 16 insertions(+), 16 deletions(-)
>  rename meta/conf/machine/include/{ia32-base.inc =3D> x86-base.inc} (72%)
>  rename meta/conf/machine/include/{ia32 =3D> x86}/README (81%)
>  rename meta/conf/machine/include/{ia32/arch-ia32.inc =3D> x86/arch-x86.i=
nc} (97%)
>=20
> diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/in=
clude/tune-c3.inc
> index 18865b7..fafc28a 100644
> --- a/meta/conf/machine/include/tune-c3.inc
> +++ b/meta/conf/machine/include/tune-c3.inc
> @@ -1,4 +1,4 @@
> -require conf/machine/include/ia32/arch-ia32.inc
> +require conf/machine/include/x86/arch-x86.inc
> =20
>  TUNEVALID[c3] =3D "VIA Cyrix III or VIA C3 specific optimizations"
>  TUNECONFLICTS[c3] =3D "m64 mx32"
> diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/=
include/tune-i586.inc
> index 4542b9b..a315b35 100644
> --- a/meta/conf/machine/include/tune-i586.inc
> +++ b/meta/conf/machine/include/tune-i586.inc
> @@ -1,6 +1,6 @@
>  DEFAULTTUNE ?=3D "i586"
> =20
> -require conf/machine/include/ia32/arch-ia32.inc
> +require conf/machine/include/x86/arch-x86.inc
> =20
>  # Extra tune features
>  TUNEVALID[i586] =3D "Enable i586 specific processor optimizations"
> diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machin=
e/include/tune-x86_64.inc
> index 31e06da..ae48124 100644
> --- a/meta/conf/machine/include/tune-x86_64.inc
> +++ b/meta/conf/machine/include/tune-x86_64.inc
> @@ -1,4 +1,4 @@
>  DEFAULTTUNE ?=3D "x86-64"
> =20
> -require conf/machine/include/ia32/arch-ia32.inc
> +require conf/machine/include/x86/arch-x86.inc
> =20
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/=
include/x86-base.inc
> similarity index 72%
> rename from meta/conf/machine/include/ia32-base.inc
> rename to meta/conf/machine/include/x86-base.inc
> index e15f927..d6c4d60 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/x86-base.inc
> @@ -1,9 +1,9 @@
>  #
> -# base machine settings for ia32-architecture BSPs
> +# Base machine settings for X86 architecture BSPs
>  #
> =20
>  #
> -# common settings for Intel-based machines
> +# common settings for X86 machines
>  #
>  MACHINE_FEATURES +=3D "screen keyboard pci usbhost ext2 ext3 x86 \
>                       acpi serial usbgadget alsa"
> @@ -25,28 +25,28 @@ PREFERRED_VERSION_linux-yocto ??=3D "3.0%"
>  #
>  # XSERVER subcomponents, used to build the XSERVER variable
>  #
> -XSERVER_IA32_BASE =3D "xserver-xorg \
> +XSERVER_X86_BASE =3D "xserver-xorg \
>             xf86-input-mouse \
>             xf86-input-keyboard \
>             xf86-input-evdev \
>             xf86-input-synaptics \
>             "
> =20
> -XSERVER_IA32_EXT =3D " \
> +XSERVER_X86_EXT =3D " \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-e=
xtension-glx', '', d)} \
>             xserver-xorg-module-libint10 \
>             "
> =20
> -XSERVER_IA32_I915 =3D "xf86-video-intel \
> +XSERVER_X86_I915 =3D "xf86-video-intel \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i9=
15', '', d)} \
>             "
> =20
> -XSERVER_IA32_I965 =3D "xf86-video-intel \
> +XSERVER_X86_I965 =3D "xf86-video-intel \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i9=
65', '', d)} \
>             "
> =20
> -XSERVER_IA32_VESA =3D "xf86-video-vesa"
> +XSERVER_X86_VESA =3D "xf86-video-vesa"
> =20
> -XSERVER_IA32_FBDEV =3D "xf86-video-fbdev"
> +XSERVER_X86_FBDEV =3D "xf86-video-fbdev"
> =20
> -XSERVER_IA32_MODESETTING =3D "xf86-video-modesetting"
> +XSERVER_X86_MODESETTING =3D "xf86-video-modesetting"
> diff --git a/meta/conf/machine/include/ia32/README b/meta/conf/machine/in=
clude/x86/README
> similarity index 81%
> rename from meta/conf/machine/include/ia32/README
> rename to meta/conf/machine/include/x86/README
> index 8f80a5b..d8b6793 100644
> --- a/meta/conf/machine/include/ia32/README
> +++ b/meta/conf/machine/include/x86/README
> @@ -1,12 +1,12 @@
>  2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
>   - Initial version
> =20
> -Most of the items for the IA architecture are defined in the single=20
> -arch-ia32 file.
> +Most of the items for the Intel architectures are defined in the single=
=20
> +arch-x86 file.

still few intel-isms left

>  Three ABIs are define, m32, mx32 and m64.
> =20
> -The following is the list of ia32 specific variables:
> +The following is the list of intel specific variables:

still few intel-isms left

>  X86ARCH32 - This is the 32-bit architecture GNU canonical arch, TUNE_ARC=
H.
> =20
> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/mac=
hine/include/x86/arch-x86.inc
> similarity index 97%
> rename from meta/conf/machine/include/ia32/arch-ia32.inc
> rename to meta/conf/machine/include/x86/arch-x86.inc
> index aa83896..298bddc 100644
> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
> +++ b/meta/conf/machine/include/x86/arch-x86.inc
> @@ -1,5 +1,5 @@
>  #
> -# IA32 Architecture definition
> +# X86 Architecture definition (IA32, X86_64, and X32)
>  #
> =20
>  DEFAULTTUNE ?=3D "x86"
> --=20
> 1.7.9.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5/6IVfYouxg+lu1D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLfGL8ACgkQN1Ujt2V2gByl4gCeI6c0lHY8IuuMNWgL+Paj+Pks
vUsAn1ZuP8F26CgNQi5kkhRD9czjibXR
=r+S7
-----END PGP SIGNATURE-----

--5/6IVfYouxg+lu1D--
