Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id BD9766A499
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:00:46 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id EB74E4B01B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 10:00:42 +0200 (CEST)
Date: Wed, 29 May 2013 10:00:41 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130529100041.6c4b3ddc@e6520eb>
In-Reply-To: <20130529095956.3cd5dbd8@e6520eb>
References: <20130529095956.3cd5dbd8@e6520eb>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: update_icon_cache host access
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
X-List-Received-Date: Wed, 29 May 2013 08:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Wed, 29 May 2013 09:59:56 +0200,
Eric B=C3=A9nard <eric@eukrea.com> a =C3=A9crit :

> Hi,
>=20
> while building an image I got :
>=20
> Running intercept scripts:
> > Executing update_font_cache
> > Executing update_icon_cache
> Failed to create file
> '/usr/lib/i386-linux-gnu/gdk-2.0/2.10.0/loaders.cache.K0FPXW':
> Permission denied
>=20
> apt-get remove libgdk-pixbuf2.0-0
> workaround the problem in the present case but it seems that if
> gdk-pixbuf is present on the host, it will be used instead of the one
> built by OE.
>=20
> Build Configuration:
> BB_VERSION        =3D "1.18.0"
> BUILD_SYS         =3D "i686-linux"
> NATIVELSBSTRING   =3D "Ubuntu-12.04"
> TARGET_SYS        =3D "arm-oe-linux-gnueabi"
> DISTRO            =3D "defaultsetup"
> DISTRO_VERSION    =3D "oe-core.0"
> TUNE_FEATURES     =3D "armv7a vfp neon"
> TARGET_FPU        =3D "vfp-neon"
>=20
meta              =3D "dylan:f24b4c3daeba43b352977fcdb807f1ed45c1c694"

Eric

