Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REJj0-0004gp-Hd
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:45:22 +0200
Received: by bkat8 with SMTP id t8so445147bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:39:38 -0700 (PDT)
Received: by 10.223.17.3 with SMTP id q3mr5556151faa.28.1318505958108;
	Thu, 13 Oct 2011 04:39:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a1sm9426849fab.4.2011.10.13.04.39.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:39:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
Date: Thu, 13 Oct 2011 13:39:11 +0200
Message-Id: <85FB45B1-2E4E-4E36-8792-3876018AF714@dominion.thruhere.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [oe-core 00/20] Xorg, mesa changes
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
X-List-Received-Date: Thu, 13 Oct 2011 11:45:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 okt. 2011, om 13:30 heeft Martin Jansa het volgende geschreven:

> Mostly cleanup in mesa directory.
>=20
> Most controversial is=20
> mesa-dri: introduce MACHINE_DRI_MODULES
> but maybe we can use it as distro variable and keep it with default =
arch.
> But then we cannot just add ie glamo dri module from meta-openmoko =
like this:
> =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Db50=
c8d00cf764c276b0792c0623b8eda3d18d343
> without distro (setting MACHINE_DRI_MODULES) depending on such bsp =
layer.
>=20
> The following changes since commit =
5ad1ca59dea6d5045f252ed7b786ad193faced64:
>=20
>  xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib jansa/x11-v4
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dj=
ansa/x11-v4
>=20
> Martin Jansa (20):
>  xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
>  xserver-xorg: move PE to xserver-xorg-common and bump it
>  xorg-driver-common: bump PE for upgrade path for meta-oe users
>  mesa-dri-glsl-native: fix LICENSE
>  mesa: move common patches which could be used in both mesa-dri and
>    mesa-xlib from mesa-dri to mesa
>  mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
>  mesa-common: MesaDemos is now separate recipes, bump PE, introduce
>    INC_PR
>  mesa-common: use glx-use-tls.inc instead of enabling glx-tls every
>    time
>  mesa-7.11: move shared DEPENDS, SRC_URI, checksums and
>    do_configure_prepend to shared .inc file
>  mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
>  mesa: package gl/egl/osmesa to separate packages
>  mesa-xlib: move shared options to .inc
>  mesa-dri: move shared options to mesa-dri.inc
>  mesa-dri: introduce MACHINE_DRI_MODULES
>  mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging
>    each lib in separate package
>  mesa-dri: drop COMPATIBLE_HOST, swrast should work for everybody
>  mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add
>    mesa-xlib_git
>  mesa-git: lower D_P a bit more then all mesa-dri
>  mesa-git: upgrade from 7.7+git to 7.11+git
>  mesa-git: fix LIC_FILES_CHKSUM

These changes all look sane to me, but I must admit I haven't tried a =
build with them yet.




