Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 407A36E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:55:21 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id e49so4439332eek.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 14:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vPBvy2un51rtw1Fl73S1VVEdIkwyHbgV08zWBDNRj0I=;
	b=QhxrSou/Tybt50rRpnjA4mDaMXyk3r6OnVX0cO0B9HPVoHHgF1WeQ7FhMuP2WLkg1k
	FSxx1Mc28f0NS8aG2BuCOcOGZTAroMiHUeFVgOVw/Qtxb3OUod7cvjlm9diTwEzYXkbq
	mNpdN3+FD+vIF5E9tqdF067TM94zGve1cW+aKUdU+RPx9BUfEirAwhXjhW/dJMD7F7y0
	exJg9FIebxyZi+KRTiTtfGr2+MxQURUFPlizraDqcTUYrePRbJrER8Gc72IY8rYAoXcz
	1nNHx58tLIqpy37WEu95OB40wKicrRxJyCN4+tK4HiTEdyr/te4YjXwMD6le9tPm+AEf
	U95A==
X-Received: by 10.14.204.135 with SMTP id h7mr171582eeo.104.1390344921351;
	Tue, 21 Jan 2014 14:55:21 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 46sm19869066ees.4.2014.01.21.14.55.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Jan 2014 14:55:20 -0800 (PST)
Date: Tue, 21 Jan 2014 23:55:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140121225520.GL4100@jama>
References: <cover.1390342768.git.dvhart@linux.intel.com>
	<67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Richard Purdie <richard.purdie@intel.com>, Poky <poky@yoctoproject.org>,
	Paul Eggleton <paul.eggleton@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/15] x86: Replace ia32 with x86 when referring to the generic architecture
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
X-List-Received-Date: Tue, 21 Jan 2014 22:55:22 -0000
X-Groupsio-MsgNum: 49309
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L1EIGrW/+75u5Nmw"
Content-Disposition: inline

--L1EIGrW/+75u5Nmw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2014 at 02:39:47PM -0800, Darren Hart wrote:
> ia32 implies 32bit, while these files provide descriptions for IA32,
> X86_64, and X32 architectures. The term "x86" fits this used better
> without resorting to using the term "Intel" which isn't quite right as
> it excludes things like the tune-c3 file describing a Via CPU.
>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@intel.com>
> Cc: Paul Eggleton <paul.eggleton@intel.com>
> Cc: Tom Zanussi <tom.zanussi@intel.com>
> Cc: Nitin Kamble <nitin.a.kamble@intel.com>
> Cc: Mark Hatle <mark.hatle@windriver.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/conf/machine/include/tune-c3.inc              |    2 +-
>  meta/conf/machine/include/tune-i586.inc            |    2 +-
>  meta/conf/machine/include/tune-x86_64.inc          |    2 +-
>  .../include/{ia32-base.inc =3D> x86-base.inc}        |   16 ++++++++----=
----
>  meta/conf/machine/include/{ia32 =3D> x86}/README     |    6 +++---
>  .../{ia32/arch-ia32.inc =3D> x86/arch-x86.inc}       |    2 +-
>  6 files changed, 15 insertions(+), 15 deletions(-)
>  rename meta/conf/machine/include/{ia32-base.inc =3D> x86-base.inc} (75%)
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
> similarity index 75%
> rename from meta/conf/machine/include/ia32-base.inc
> rename to meta/conf/machine/include/x86-base.inc
> index e15f927..421bdee 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/x86-base.inc
> @@ -1,5 +1,5 @@
>  #
> -# base machine settings for ia32-architecture BSPs
> +# Base machine settings for Intel architecture BSPs

does it apply for AMD, Cyrix as well?

>  #
> =20
>  #
> @@ -25,28 +25,28 @@ PREFERRED_VERSION_linux-yocto ??=3D "3.0%"
>  #
>  # XSERVER subcomponents, used to build the XSERVER variable
>  #
> -XSERVER_IA32_BASE =3D "xserver-xorg \
> +XSERVER_INTEL_BASE =3D "xserver-xorg \

the same, why not us XSERVER_X86_BASE?

>             xf86-input-mouse \
>             xf86-input-keyboard \
>             xf86-input-evdev \
>             xf86-input-synaptics \
>             "
> =20
> -XSERVER_IA32_EXT =3D " \
> +XSERVER_INTEL_EXT =3D " \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-e=
xtension-glx', '', d)} \
>             xserver-xorg-module-libint10 \
>             "
> =20
> -XSERVER_IA32_I915 =3D "xf86-video-intel \
> +XSERVER_INTEL_I915 =3D "xf86-video-intel \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i9=
15', '', d)} \
>             "
> =20
> -XSERVER_IA32_I965 =3D "xf86-video-intel \
> +XSERVER_INTEL_I965 =3D "xf86-video-intel \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i9=
65', '', d)} \
>             "
> =20
> -XSERVER_IA32_VESA =3D "xf86-video-vesa"
> +XSERVER_INTEL_VESA =3D "xf86-video-vesa"
> =20
> -XSERVER_IA32_FBDEV =3D "xf86-video-fbdev"
> +XSERVER_INTEL_FBDEV =3D "xf86-video-fbdev"
> =20
> -XSERVER_IA32_MODESETTING =3D "xf86-video-modesetting"
> +XSERVER_INTEL_MODESETTING =3D "xf86-video-modesetting"
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
> =20
>  Three ABIs are define, m32, mx32 and m64.
> =20
> -The following is the list of ia32 specific variables:
> +The following is the list of intel specific variables:
> =20
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
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--L1EIGrW/+75u5Nmw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLe+tgACgkQN1Ujt2V2gByz4gCbB95oX/4CF21kAF5eRhLwLdBB
RecAoJJFQxmsV4sPKhwbFINxD4ky5aO2
=1ZHE
-----END PGP SIGNATURE-----

--L1EIGrW/+75u5Nmw--
