Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2isR-0002S6-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 13:43:27 +0100
Received: by eekc1 with SMTP id c1so1098251eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 04:34:58 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.120.210 as permitted sender) client-ip=10.14.120.210; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.120.210 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.120.210])
	by 10.14.120.210 with SMTP id p58mr37614eeh.98.1330518898919 (num_hops
	= 1); Wed, 29 Feb 2012 04:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=04oUXfvKg7mGfk2/hkerwmAjvIn1dJdukx1PmZYRWGc=;
	b=XQNxDsjEt608mrOp8mCwrBxzDEvOwTIGw4J0x/hHqqoGTdanhczJ1xcZbDNvzseivI
	ITJLJTzEmMES0iQ70Sp3jWsQwY+gRk49zX3nt2gFboRv6Z6MJLd1RsSzlYhE735BpAPT
	M5B9C2G+BF8OxAvbJLkVklKCmjLa+TkHsgGjw=
Received: by 10.14.120.210 with SMTP id p58mr29588eeh.98.1330518898782;
	Wed, 29 Feb 2012 04:34:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm82421987eem.0.2012.02.29.04.34.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 04:34:57 -0800 (PST)
Date: Wed, 29 Feb 2012 13:34:55 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120229123455.GB3844@jama.jama.net>
References: <20120229104508.GA3844@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120229104508.GA3844@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: MACHINE overrides in meta/recipes-gnome/tasks/task-sdk-gmae.inc
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
X-List-Received-Date: Wed, 29 Feb 2012 12:43:27 -0000
X-Groupsio-MsgNum: 18200
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Content-Disposition: inline

--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 29, 2012 at 11:45:08AM +0100, Martin Jansa wrote:
> Hi,
>=20
> task-sdk-gmae.inc has couple of MACHINE overrides
> SDK-EXTRAS ?=3D ""
> SDK-EXTRAS_qemux86 ?=3D " valgrind lttng-ust-dev"
> SDK-EXTRAS_qemux86-64 ?=3D " lttng-ust-dev"
> SDK-EXTRAS_qemuppc ?=3D " lttng-ust-dev"
> SDK-EXTRAS_qemuarm ?=3D " lttng-ust-dev"
>=20
> but
> meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
> meta/recipes-gnome/tasks/task-core-sdk-gmae.bb
>=20
> don't set PACKAGE_ARCH to MACHINE_ARCH, so those those SDK-EXTRAS
> overrides should be changed to TARGET_ARCH overrides or add them for all
> and exlude only arch which doesn't support valgrind || lttng-ust (seems
> like only mips is missing from supported archs).
>=20
> It also makes meta-toolchain-gmae-1.0-r6.do_populate_sdk.sigdata machine =
specific:
>=20
> OE qemux86-64copy@ ~/oe-core $ bitbake-diffsigs stamps.dir.qemux86-64/x86=
_64-oe-linux/meta-toolchain-gmae-1.0-r6.do_populate_sdk.sigdata.fc96d8788ee=
32af391fbb4dc4dfa3928 stamps.dir.qemux86-64copy/x86_64-oe-linux/meta-toolch=
ain-gmae-1.0-r6.do_populate_sdk.sigdata.f84bb156663caf2f71645227179d424d
> basehash changed from 8bf3e5df1a9bf2efd8c0c698d44f9e30 to 37f334758d4f818=
e858387d110a1c7b7
> Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from /OE/oe-core=
/tmp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_config_site.d to =
/OE/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-linux_co=
nfig_site.d
> Variable TIME value changed from 084543 to 085638
> Dependency on task linux-yocto_3.2.bb.do_package_write was added with has=
h 15cf120732c6515987793e39c29cb7f2
> Dependency on task bzip2_1.0.6.bb.do_package_write was added with hash 63=
299b3c095759819803e3b60c1cd4bd
> Dependency on task update-modules_1.0.bb.do_package_write was added with =
hash 266fe284dfd606af98605bcff02f06d8
> Dependency on task elfutils_0.148.bb.do_package_write was added with hash=
 31516d4ca2606a60f23b8a38de93d88d
> Dependency on task binutils_2.22.bb.do_package_write was added with hash =
91222ff473a45a15187bfcedff21288d
> Dependency on task module-init-tools_3.16.bb.do_package_write was added w=
ith hash 3485d645a9458516601e0c91dfd130d5
> Dependency on task lttng-ust_1.9.4.bb.do_package_write was added with has=
h cd40a9f559d53c8bf874d69bb62482cf
> Dependency on task liburcu_0.6.7.bb.do_package_write was added with hash =
22805959bb795b93fcfc87428f1164fe
> Hash for dependent task gstreamer_0.10.35.bb.do_package_write changed fro=
m 14dfff89952fba8f744946fc815931eb to 161c80d99567099d372247d584778df1
> Hash for dependent task task-core-standalone-gmae-sdk-target.bb.do_packag=
e_write changed from e8ed16a445ff08d391380d4ed7f06ea5 to aa427a924b50e0a09e=
c14124cfac02a6
> Hash for dependent task meta-environment.bb.do_package_write changed from=
 d78bee1dbc70cb372a6cf4f07b254391 to a3c3dd9dde1635a7e74a04c687387238
> Hash for dependent task task-cross-canadian.bb.do_package_write changed f=
rom c245cbf31a79c3983198ac73a70988b2 to 425abc28049ab1e5653c680141db7d8e
>=20
> I'll send patch excluding meta-environment.bb.
>=20
> Cheers,

Also for some reason runtime deps weren't properly mangled (while using deb=
ian.bbclass)

| Configuring task-core-standalone-gmae-sdk-target-dbg.
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-core-standalone-gmae-sdk-target:
|  *    telepathy-glib (=3D 0.17.4-r1) *  libgalago *     gupnp-av *      t=
elepathy-glib *        libart-lgpl *   libtelepathy *
|  * opkg_install_cmd: Cannot install package task-core-standalone-gmae-sdk=
-target.


Package: task-core-standalone-gmae-sdk-target
Version: 1.0-r13
Depends: telepathy-mission-control, gstreamer-dev, bluez4-dev, telepathy-gl=
ib-dev, libgalago, libgypsy0, pulseaudio, gupnp-av, libecal-1.2-dev, telepa=
thy-python, gnome-desktop, task-core-standalone-sdk-target, telepathy-glib,=
 libgupnp-1.0-3, libart-lgpl, dbus-dev, gupnp-tools, libglade-2.0-dev, gcon=
f-dev, libsqlite3-dev, libxi-dev, libtelepathy, libdbus-glib-1-dev, eds-dbu=
s-dev, libgssdp-1.0-2, libebook-1.2-dev, telepathy-idle, avahi-dev, gtk+-de=
v, galago-daemon
Section: base
Architecture: armv7a-vfp-neon

while correct names are:
telepathy-glib -> libtelepathy-glib0
libgalago -> libgalago3
gupnp-av -> libgupnp-av-1.0-2
libart-lgpl -> libart-lgpl-2-2
libtelepathy -> libtelepathy2

Anyone seen this?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9OG28ACgkQN1Ujt2V2gByyXwCdHxhFCy9RD9cKdBlM2vCEGcOO
ewMAoLvClj/pb2PrYUIn6xbEJzMfLlPW
=lPB0
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
