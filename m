Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UNlts-0006qL-SL
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 17:16:29 +0200
Received: by mail-pd0-f174.google.com with SMTP id p12so1469113pdj.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2013 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=UthTU8ZA/jjczs2Z7LmKjmq+aXV25tuD9LSx1FK8w3I=;
	b=aGtsQMEq3KrQhLUZiQxM+LWKodTHfIkwf0Zl7fIwL8pEBR1X4BDMkP/Oe6gLm1GiCT
	WTyUVblAf8trRtgx5t8spSkUX/dGybLPXA0chHtmcaPIOTwfv/TQXdslrEEJ6B2tXVo5
	9iZ86bP4+n4vLM8v+5ltozGt6v4wqBomgzo11fNPZiLThqb9jcAI367mtQfZOCygt5Cf
	sj0lSjBC6JGfd9do85PX9G+f+e793QrCqU3tb1I1QMnJO1hDiLQ3fcZ6WYDyWqm+lI3h
	Svj2aej7xpqSgz+HUOaymh/pXKG/6QZOAzZ3AB6mdYssPaERovUTq/OWhfsT2llt2Uoy
	oppw==
X-Received: by 10.68.143.167 with SMTP id sf7mr9256500pbb.21.1365087555398;
	Thu, 04 Apr 2013 07:59:15 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id z1sm10512550pbw.19.2013.04.04.07.59.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Apr 2013 07:59:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
Date: Thu, 4 Apr 2013 07:59:12 -0700
Message-Id: <E88E88F5-90AE-4280-AE38-735E593E6DC6@gmail.com>
References: <1365077355-17673-1-git-send-email-mihai.prica@intel.com>
To: Mihai Prica <mihai.prica@intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] qemu: Enabled SDL when compiling for target architecture
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Apr 2013 15:16:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 4, 2013, at 5:09 AM, Mihai Prica <mihai.prica@intel.com> wrote:

> Enables qemu to run images with video output without the need for =
vncviewer.
>=20
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
> meta/recipes-devtools/qemu/qemu.inc |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc =
b/meta/recipes-devtools/qemu/qemu.inc
> index 1b5b569..06fa88b 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -1,7 +1,7 @@
> DESCRIPTION =3D "open source processor emulator"
> HOMEPAGE =3D "http://qemu.org"
> LICENSE =3D "GPLv2 & LGPLv2.1"
> -DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc"
> +DEPENDS =3D "glib-2.0 zlib alsa-lib virtual/libx11 pixman dtc libsdl"
> DEPENDS_class-native =3D "zlib-native alsa-lib-native glib-2.0-native =
pixman-native dtc-native"
> DEPENDS_class-nativesdk =3D "nativesdk-zlib nativesdk-libsdl =
nativesdk-glib-2.0 nativesdk-pixman nativesdk-dtc"
> RDEPENDS_${PN}_class-nativesdk =3D "nativesdk-libsdl"
> @@ -13,7 +13,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> # QEMU_TARGETS is overridable variable
> QEMU_TARGETS ?=3D "arm i386 mips mipsel mips64 mips64el ppc sh4 =
x86_64"
>=20
> -SDL ?=3D "--disable-sdl"
> +SDL ?=3D ""

I think this is not acceptable change. Since many systems are headless =
and its useless for them
secondly, converting this to PACKAGECONFIG and keeping the behavior as =
it was would be fine.


> SDL_class-native ?=3D ""
> SDL_class-nativesdk ?=3D ""
>=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



