Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 61FAE60167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:34:58 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id f15so1769436eak.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 15:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l6oPHhLrd1GK3DcUly/VIS7Y0kiBf41ybIkgTqtJLwQ=;
	b=uFxaiQ6c8uFtVGAuqGNJZnnLL+uiWAVFKImjeL1XVT+GUjVVa2I0H0q7YHlbScxKBu
	YFWzqh0V4TUjEiB3kvFCI55b3uXsLJICGO6ijRhKFu82p2l8uL9DY0gCy1HbRb81uwXN
	pU/qBtyY9AJO5jSlVDzyelBU7FnGasLYXIzvLBSOjLhQ34G7/IxTRmxuIkUM4IqiMu62
	GLJu12v0f0ZZCBFuB0GFXICrKqiUr7lBWRxVH9Bs83TBeVcpDjc0x9FZ4ZpjSVHvwShL
	+mU/fvl9NZa7FFo75C5GpcRUCG+CvKOGbp8mMwZsZdZN8JFChovuUAGnrspeG8umyeiM
	Rr3g==
X-Received: by 10.15.32.73 with SMTP id z49mr5840813eeu.27.1389310499048;
	Thu, 09 Jan 2014 15:34:59 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id v1sm9799401eef.9.2014.01.09.15.34.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 15:34:58 -0800 (PST)
Date: Fri, 10 Jan 2014 00:35:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140109233510.GO3709@jama>
References: <52CEEE43.1090209@linaro.org>
	<CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4M+KG9uXtb91ANThgzMgOAb0WjiVmBvf48UszmSnX62dA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: unmaintained layers
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
X-List-Received-Date: Thu, 09 Jan 2014 23:34:59 -0000
X-Groupsio-MsgNum: 48795
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="De7JZ5cYyW/PeqB+"
Content-Disposition: inline

--De7JZ5cYyW/PeqB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 04:45:38PM -0500, Bruce Ashfield wrote:
> On Thu, Jan 9, 2014 at 1:45 PM, Trevor Woerner
> <trevor.woerner@linaro.org> wrote:
> > Hi everyone,
> >
> > At the last TSC meeting the topic of unmaintained layers came up. Here
> > is the sorted list of master layers from the layer index [1], would it
> > be possible for those in the know to indicate which layers are, or are
> > suspected of being, unmaintained?
>=20
> Wouldn't it be easier to do an initial sort based on commit activity ? Ve=
rsus an
> opt-in query ?

Some BSPs are valid for very long time without any commit in it. So I
think it will show a lot of false-possitives.

> > meta-aarch64
> > meta-acer
> > meta-ada
> > meta-android
> > meta-angstrom
> > meta-arago-distro
> > meta-arago-extras
> > meta-asus
> > meta-aurora
> > meta-baryon
> > meta-beagleboard
> > meta-beagleboard-extras
> > meta-browser
> > meta-bug
> > meta-buglabs
> > meta-chicken
> > meta-chiefriver
> > meta-clutter
> > meta-crownbay
> > meta-crystalforest
> > meta-cubox
> > meta-darwin
> > meta-eca
> > meta-efikamx
> > meta-efl
> > meta-eldk
> > meta-emenlow
> > meta-erlang
> > meta-ettus
> > meta-filesystems
> > meta-fri2
> > meta-fsl-arm
> > meta-fsl-arm-extra
> > meta-fsl-demos
> > meta-fsl-ppc
> > meta-fso
> > meta-games
> > meta-geeksphone
> > meta-gir
> > meta-gnome
> > meta-gpe
> > meta-gstreamer10
> > meta-guacamayo
> > meta-gumstix
> > meta-gumstix-community
> > meta-gumstix-extras
> > meta-hamradio
> > meta-handheld
> > meta-hipos
> > meta-htc
> > meta-igep
> > meta-initramfs
> > meta-intel
> > meta-ivi
> > meta-jasperforest
> > meta-java
> > meta-kde
> > meta-kernel-dev
>=20
> maintained.
>=20
> > meta-kirkwood
> > meta-linaro
> > meta-linaro-toolchain
> > meta-lsi
> > meta-lxcbench
> > meta-measured
> > meta-mentor
> > meta-micro
> > meta-mingw
> > meta-minnow
> > meta-mono
> > meta-multimedia
> > meta-n450
> > meta-netbookpro
> > meta-netmodule
> > meta-networking
> > meta-nokia
> > meta-nslu2
> > meta-nuc
> > meta-oe
> > meta-openmoko
> > meta-openpandora
> > meta-openstack
> > meta-openstack-compute-deploy
> > meta-openstack-controller-deploy
> > meta-openstack-qemu
>=20
> All openstack layers are maintained.
>=20
> > meta-opie
> > meta-oracle-java
> > meta-osmocombb
> > meta-ouya
> > meta-palm
> > meta-perl
> > meta-picosam9
> > meta-qt3
> > meta-qt5
> > meta-raspberrypi
> > meta-realtime
>=20
> mantained
>=20
> > meta-ro-rootfs
> > meta-romley
> > meta-ros
> > meta-ruby
> > meta-samsung
> > meta-sdr
> > meta-security
> > meta-selinux
> > meta-shr
> > meta-shr-distro
> > meta-slugos
> > meta-smalltalk
> > meta-sourcery
> > meta-sugarbay
> > meta-sunxi
> > meta-sys940x
> > meta-systemd
> > meta-telephony
> > meta-telldus
> > meta-ti
> > meta-tlk
> > meta-tracing
> > meta-virtualization
>=20
> maintained
>=20
> But I can't say if I didn't miss something I maintain in the list,
> since it is long and I scanned
> it quickly.
>=20
> Bruce
>=20
> > meta-web-kiosk
> > meta-webos
> > meta-webos-ports
> > meta-webserver
> > meta-woce
> > meta-x10
> > meta-xfce
> > meta-xilinx
> > meta-xilinx-community
> > meta-yassl
> > meta-yocto
> > meta-yocto-bsp
> > meta-zynq
> > meta-zynq-milo
> > openembedded-core
> > toolchain-layer
> >
> >
> > Thank you for your input, and best regards,
> >     Trevor
> >
> >
> >
> >
> > [1] http://layers.openembedded.org/layerindex/branch/master/layers/
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--De7JZ5cYyW/PeqB+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLPMi4ACgkQN1Ujt2V2gBwwtQCfVbs/RrqwKU0xF4JXaEQvlCd6
s04AnApwZnHn6C3Gi+DRShQqqCIimkDD
=COLA
-----END PGP SIGNATURE-----

--De7JZ5cYyW/PeqB+--
