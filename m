Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SARTY-0007zw-TW
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:45:41 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 2840AA624D;
	Wed, 21 Mar 2012 20:36:43 +0100 (CET)
Date: Wed, 21 Mar 2012 20:36:42 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Message-ID: <20120321203642.032e28a1@eb-e6520>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0137B46A@ORSMSX106.amr.corp.intel.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<bfe0a5400cad2436b7be7d35a173c62349e47c0a.1332347414.git.nitin.a.kamble@intel.com>
	<20120321180748.7cc58e67@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3C3@ORSMSX106.amr.corp.intel.com>
	<20120321185216.440a6353@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B3E3@ORSMSX106.amr.corp.intel.com>
	<20120321190208.25dc0387@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137B46A@ORSMSX106.amr.corp.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Wed, 21 Mar 2012 19:45:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Nitin,

Le Wed, 21 Mar 2012 19:04:14 +0000,
"Kamble, Nitin A" <nitin.a.kamble@intel.com> a =E9crit :
>   The sdk gdb from meta-toolchain for qemuarm is also failing similarly:
>=20
> *** glibc detected *** arm-poky-linux-gnueabi-gdb: double free or corrupt=
ion (out): 0x00007f8ef7992030 ***
> Aborted (core dumped)
>=20
can you provide more details on your configuration as it seems you
have a problem somewhere else ?

here is my config (you already have host details in the previous email)
[ebenard@eb-e6520 build]$ bitbake-layers  show-layers
Parsing recipes..done.

layer                 path                                      priority
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
meta                  /home/ebenard/OE-CORE/openembedded-core/meta =20

OE Build Configuration:
BB_VERSION        =3D "1.15.1"
TARGET_ARCH       =3D "i586"
TARGET_OS         =3D "linux"
MACHINE           =3D "qemux86"
DISTRO            =3D ""
DISTRO_VERSION    =3D "oe-core.0"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta              =3D "master:ee00c3146525e481beaefd2149c61cfe51de2797"

Eric


