Received: from mail-pa0-f51.google.com ([209.85.220.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U3aMS-0002Ns-07; Thu, 07 Feb 2013 23:54:32 +0100
Received: by mail-pa0-f51.google.com with SMTP id hz1so1654193pad.38
	for <multiple recipients>; Thu, 07 Feb 2013 14:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=w3tOPbnfNGsoPtiZ3JBzPWgBo4f7ELF/v5l3NseEvl4=;
	b=cQOiRsISKIsgi5sPNtFmVEetKTZOewCEkyS9kbXL+t5hUYktuBqxUIdSj63eyaf08A
	8ccU1+v/0xkmgJ0vJeik37OpigEL00btsQwzBSg/u897sLY4FalSjoUHNYHy2svxJ7J3
	MEF+uGQ6PuMORSk1+LREWUKeFCQ3Cqtg/3kQ/mjy7uZNFBH8qa9CPYoPSO45rNbv3kLZ
	uuYWAde8/YIJG/3zZiHJwid1OGSTokW0s2dR9hsuOnTqwCkXOb7FkbyZY58MwOS9Wh/a
	w04OWYTldd1nZ90PCNDejYyRmV6b2lYwuXT8lWo7OTgAXSuPQon9QRSxJNbiE8pZfmFP
	4Mpg==
X-Received: by 10.66.72.97 with SMTP id c1mr77588750pav.48.1360172482522;
	Wed, 06 Feb 2013 09:41:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bi2sm39298710pab.18.2013.02.06.09.41.19
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Feb 2013 09:41:21 -0800 (PST)
Date: Wed, 6 Feb 2013 18:41:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130206174113.GB3271@jama>
References: <20130206093805.8625720BD@opal>
 <20130206123142.GU3271@jama>
MIME-Version: 1.0
In-Reply-To: <20130206123142.GU3271@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Constantin Musca : netbase: split up in netbase and init-ifupdown
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
X-List-Received-Date: Thu, 07 Feb 2013 22:54:32 -0000
X-Groupsio-MsgNum: 35134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RUh7Gb6wQL2PrpWP"
Content-Disposition: inline

--RUh7Gb6wQL2PrpWP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 01:31:42PM +0100, Martin Jansa wrote:
> On Wed, Feb 06, 2013 at 09:38:05AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 5ce5c3d1226d4a8a4997c63acc1b1b125770d005
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D5ce5c3d1226d4a8a4997c63acc1b1b125770d005
> >=20
> > Author: Constantin Musca <constantinx.musca@intel.com>
> > Date:   Mon Feb  4 19:13:20 2013 +0200
> >=20
> > netbase: split up in netbase and init-ifupdown
> >=20
> > - netbase should only include etc-rpc, etc-protocols, etc-services
> > and the hosts file
> > - the init script/configuration files should be in another package
> > (init-ifupdown)
> >=20
> > [YOCTO #2486]
> >=20
> > Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > ---
> >=20
> >  meta/conf/layer.conf                               |    1 +
> >  .../init-ifupdown/init-ifupdown-1.0/copyright      |   11 ++++++
> >  .../init-ifupdown-1.0}/init                        |    0
> >  .../init-ifupdown-1.0}/interfaces                  |    0
> >  .../init-ifupdown-1.0}/nfsroot                     |    0
> >  .../init-ifupdown-1.0}/qemuarm/interfaces          |    0
> >  .../init-ifupdown-1.0}/qemuarmv6/interfaces        |    0
> >  .../init-ifupdown-1.0}/qemuarmv7/interfaces        |    0
> >  .../init-ifupdown-1.0}/qemumips/interfaces         |    0
> >  .../init-ifupdown-1.0}/qemumips64/interfaces       |    0
> >  .../init-ifupdown-1.0}/qemuppc/interfaces          |    0
> >  .../init-ifupdown-1.0}/qemush4/interfaces          |    0
> >  .../init-ifupdown-1.0}/qemux86-64/interfaces       |    0
> >  .../init-ifupdown-1.0}/qemux86/interfaces          |    0
> >  .../init-ifupdown/init-ifupdown_1.0.bb             |   39 ++++++++++++=
++++++++
> >  meta/recipes-core/netbase/netbase_5.0.bb           |   32 ++----------=
----
> >  .../packagegroups/packagegroup-core-boot.bb        |    3 +-
> >  17 files changed, 57 insertions(+), 29 deletions(-)
> >=20
> > diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> > index 3259e5c..6e5cd0c 100644
> > --- a/meta/conf/layer.conf
> > +++ b/meta/conf/layer.conf
> > @@ -22,6 +22,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> >    shadow-securetty \
> >    opkg-config-base \
> >    netbase \
> > +  init-ifupdown \
> >    connman-conf \
> >    formfactor \
> >    xserver-xf86-config \
> > diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyrigh=
t b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> > new file mode 100644
> > index 0000000..2a8e0d1
> > --- /dev/null
> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/copyright
> > @@ -0,0 +1,11 @@
> > +This package was created by Peter Tobias tobias@et-inf.fho-emden.de on
> > +Wed, 24 Aug 1994 21:33:28 +0200 and maintained by Anthony Towns
> > +<ajt@debian.org> until 2001.
> > +It is currently maintained by Marco d'Itri <md@linux.it>.
> > +
> > +Copyright 1994-2010 Peter Tobias, Anthony Towns and Marco d'Itri
> > +
> > +The programs in this package are distributed under the terms of the GNU
> > +General Public License, version 2 as distributed by the Free Software
> > +Foundation. On Debian systems, a copy of this license may be found in
> > +/usr/share/common-licenses/GPL-2.
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/init b/meta/recipes-=
core/init-ifupdown/init-ifupdown-1.0/init
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/init
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/interfaces b/meta/re=
cipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/interfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/nfsroot b/meta/recip=
es-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/nfsroot
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/nfsroot
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarm/int=
erfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces=
 b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv6/i=
nterfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces=
 b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuarmv7/i=
nterfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces =
b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips/in=
terfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips64/interface=
s b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemumips64/=
interfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuppc/int=
erfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemush4/int=
erfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interface=
s b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86-64/=
interfaces
> > diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces b=
/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/interfaces
> > similarity index 100%
> > rename from meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
> > rename to meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemux86/int=
erfaces
> > diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/met=
a/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > new file mode 100644
> > index 0000000..7bc7058
> > --- /dev/null
> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > @@ -0,0 +1,39 @@
> > +SUMMARY =3D "Basic TCP/IP networking init scripts and configuration fi=
les"
> > +DESCRIPTION =3D "This package provides high level tools to configure n=
etwork interfaces"
> > +HOMEPAGE =3D "http://packages.debian.org/ifupdown"
> > +SECTION =3D "base"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://${WORKDIR}/copyright;md5=3D3dd6192d306f58=
2dee7687da3d8748ab"
> > +PR =3D "r0"
> > +
> > +inherit update-rc.d
> > +
> > +INITSCRIPT_NAME =3D "networking"
> > +INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> > +
> > +SRC_URI =3D "file://copyright \
> > +           file://init \
> > +           file://interfaces \
> > +           file://nfsroot"
> > +
> > +do_install () {
> > +	install -d ${D}${sysconfdir}/init.d \
> > +			${D}${sysconfdir}/network/if-pre-up.d \
> > +			${D}${sysconfdir}/network/if-up.d \
> > +			${D}${sysconfdir}/network/if-down.d \
> > +			${D}${sysconfdir}/network/if-post-down.d
> > +	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> > +	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/inter=
faces
> > +	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-u=
p.d
> > +}
> > +
> > +do_install_append_qemuall () {
> > +	# Disable network manager on machines that commonly do NFS booting
> > +	touch ${D}${sysconfdir}/network/nm-disabled-eth0
> > +}
> > +
> > +PACKAGE_ARCH_qemuall =3D "${MACHINE_ARCH}"
> > +RDEPENDS_${PN} =3D "netbase"
> > +RCONFLICTS_${PN} =3D "netbase (< 1:5.0)"
>=20
> do_rootfs failed with this:
> | Collected errors:
> |  * check_conflicts_for: The following packages conflict with
> init-ifupdown:
> |  * check_conflicts_for:       netbase *
> |  * opkg_install_cmd: Cannot install package packagegroup-core-boot.

This is caused by

MACHINE_ARCH -> TUNE_PKGARCH transition=20
+ not removing "old" stamps with different architecture
+ using --prefer-arch-to-version in package_ipk.bbclass:OPKG_ARGS

You have to clean netbase before upgrading metadata or=20
clean your sysroot manually:
find deploy/ipk/ -name netbase\* -exec rm {} \;
find stamps/ -name netbase -exec rm -rf {} \;
find ../sstate-cache/ -name \*netbase\* -exec rm -f {} \;

>=20
> > +
> > +CONFFILES_${PN} =3D "${sysconfdir}/network/interfaces"
> > diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-co=
re/netbase/netbase_5.0.bb
> > index 3aea874..03fdc38 100644
> > --- a/meta/recipes-core/netbase/netbase_5.0.bb
> > +++ b/meta/recipes-core/netbase/netbase_5.0.bb
> > @@ -5,44 +5,20 @@ SECTION =3D "base"
> >  LICENSE =3D "GPLv2"
> >  LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D3dd6192d306f582dee=
7687da3d8748ab"
> >  PR =3D "r0"
> > -
> > -inherit update-rc.d
> > -
> > -INITSCRIPT_NAME =3D "networking"
> > -INITSCRIPT_PARAMS =3D "start 40 S . stop 40 0 6 1 ."
> > +PE =3D "1"
> > =20
> >  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
> > -           file://init \
> > -           file://hosts \
> > -           file://interfaces \
> > -           file://nfsroot"
> > +           file://hosts"
> > =20
> >  SRC_URI[md5sum] =3D "a379d9199d44d817543eddc211a29b70"
> >  SRC_URI[sha256sum] =3D "ac9424d3cb2bd3c07b6c5bc5875c434d3bc687a73cd7c5=
4b7dc7122308afa9dc"
> > =20
> >  do_install () {
> > -	install -d ${D}${sysconfdir}/init.d \
> > -		   ${D}${mandir}/man8 \
> > -		   ${D}${sysconfdir}/network/if-pre-up.d \
> > -		   ${D}${sysconfdir}/network/if-up.d \
> > -		   ${D}${sysconfdir}/network/if-down.d \
> > -		   ${D}${sysconfdir}/network/if-post-down.d
> > -	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
> > +	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
> >  	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
> >  	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
> >  	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
> >  	install -m 0644 etc-services ${D}${sysconfdir}/services
> > -	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/inter=
faces
> > -	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-u=
p.d
> > -
> > -	# Disable network manager on machines that commonly do NFS booting
> > -	case "${MACHINE}" in
> > -		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "q=
emush*")
> > -			touch ${D}${sysconfdir}/network/nm-disabled-eth0
> > -			;;
> > -		*)
> > -			;;
> > -	esac
> >  }
> > =20
> > -CONFFILES_${PN} =3D "${sysconfdir}/hosts ${sysconfdir}/network/interfa=
ces"
> > +CONFFILES_${PN} =3D "${sysconfdir}/hosts"
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb =
b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > index edb9e74..b9183a8 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
> > @@ -6,7 +6,7 @@ SUMMARY =3D "Minimal boot requirements"
> >  DESCRIPTION =3D "The minimal set of packages required to boot the syst=
em"
> >  LICENSE =3D "MIT"
> >  DEPENDS =3D "virtual/kernel"
> > -PR =3D "r10"
> > +PR =3D "r11"
> > =20
> >  inherit packagegroup
> > =20
> > @@ -38,6 +38,7 @@ RDEPENDS_${PN} =3D "\
> >      ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIM=
E_keymaps}", "", d)} \
> >      modutils-initscripts \
> >      netbase \
> > +    init-ifupdown \
> >      ${VIRTUAL-RUNTIME_login_manager} \
> >      ${VIRTUAL-RUNTIME_init_manager} \
> >      ${VIRTUAL-RUNTIME_initscripts} \
> >=20
> >=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--RUh7Gb6wQL2PrpWP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlESlbkACgkQN1Ujt2V2gBy4eQCgtdhJ35/Ijwp/IlPgHb8V69wB
s2YAmgKcz5tOYN1RFZ8HKyN3HUHJe+lp
=W1Rz
-----END PGP SIGNATURE-----

--RUh7Gb6wQL2PrpWP--
