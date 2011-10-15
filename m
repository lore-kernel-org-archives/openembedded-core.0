Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF1ae-0007Kb-CJ
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:35:40 +0200
Received: by bkat8 with SMTP id t8so3120722bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:29:54 -0700 (PDT)
Received: by 10.223.65.68 with SMTP id h4mr10088668fai.24.1318674593891;
	Sat, 15 Oct 2011 03:29:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u6sm9500484faf.3.2011.10.15.03.29.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:29:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 15 Oct 2011 12:29:52 +0200
Message-Id: <363ECAF1-8602-4139-ADC9-2044FCB5456C@dominion.thruhere.net>
References: <1318674260-8320-1-git-send-email-Martin.Jansa@gmail.com>
	<1318674260-8320-2-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] mesa-dri: move extra DRIMODULES to EXTRA_DRIMODULES
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
X-List-Received-Date: Sat, 15 Oct 2011 10:35:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 okt. 2011, om 12:24 heeft Martin Jansa het volgende geschreven:

> * this way we can use
>  EXTRA_DRIMODULES_armv4t +=3D ",glamo" in meta-openmoko layer and
>  EXTRA_DRIMODULES_armv4t +=3D ",foo" in meta-bar layer without =
knowledge
>  of other modules in other layers in stack

The above talks about 'MODULES', the actual patch about 'DRIVERS' :)

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-graphics/mesa/mesa-dri.inc |    6 ++++--
> 1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc =
b/meta/recipes-graphics/mesa/mesa-dri.inc
> index 795144a..4557bf8 100644
> --- a/meta/recipes-graphics/mesa/mesa-dri.inc
> +++ b/meta/recipes-graphics/mesa/mesa-dri.inc
> @@ -4,9 +4,11 @@ LIB_DEPS +=3D "libdrm expat"
> # most of our targets do not have DRI so will use mesa-xlib
> DEFAULT_PREFERENCE =3D "-1"
>=20
> +EXTRA_DRIDRIVERS =3D ""
> +EXTRA_DRIDRIVERS_x86 =3D ",i915,i965"
> +EXTRA_DRIDRIVERS_x86-64 =3D ",i915,i965"
> DRIDRIVERS =3D "swrast"
> -DRIDRIVERS_x86 =3D "swrast,i915,i965"
> -DRIDRIVERS_x86-64 =3D "swrast,i915,i965"
> +DRIDRIVERS +=3D "${EXTRA_DRIDRIVERS}"
>=20
> EXTRA_OECONF +=3D "--with-driver=3Ddri --disable-egl --disable-gallium =
--without-gallium-drivers --with-dri-drivers=3D${DRIDRIVERS}"
>=20
> --=20
> 1.7.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



