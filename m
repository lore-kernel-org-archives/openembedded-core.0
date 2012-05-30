Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SZiYY-0008S9-OM; Wed, 30 May 2012 15:03:21 +0200
Received: by werg55 with SMTP id g55so3459198wer.6
	for <multiple recipients>; Wed, 30 May 2012 05:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A5FUer6icxJY4YL9ywDXwAo8bgT892Xltggfl/glO14=;
	b=EsRFoJId0EY1iBmZ4UAuW4NvP0Obl6vpaaeoj6XeHoagxjWhPdrM9caO9HpWbyMA98
	e7nzrlc3KzCfWXhPBdbq4Sc5PFDnAdZdLAae7Iah0bmDpFyzqf/++9Qo/12UdxzLCMuX
	OAiblX7Rp9EOX889cY7ckm6iXWIxp4htI2zQoaSthdnyHBjXuuvAib2Wzv8YNktazsTu
	xVjaGBCFjowfr4VRzyr3aONJgnhxD76LOi621fVgof+/wIYBC7j05tgGcBKnIfUhBIU5
	mKj9kgYzF5KOcDD3xUeSR8ZqCU1OtK6Qz7lJRDj862N0xBwdVfwhOZv/R/C2VfGAhsPt
	NK5A==
Received: by 10.216.141.164 with SMTP id g36mr10609477wej.119.1338382380313;
	Wed, 30 May 2012 05:53:00 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm56209388wia.6.2012.05.30.05.52.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:52:59 -0700 (PDT)
Date: Wed, 30 May 2012 14:53:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120530125307.GO3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
	<20120530122007.GM3138@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120530122007.GM3138@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: debian.bbclass got broken today Was: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 13:03:22 -0000
X-Groupsio-MsgNum: 22964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ncX6roZrNNHXnAbh"
Content-Disposition: inline

--ncX6roZrNNHXnAbh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 02:20:07PM +0200, Martin Jansa wrote:
> On Wed, May 30, 2012 at 02:04:43PM +0200, Martin Jansa wrote:
> > On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3Dda98266f3a228cf65f279db9810a5326c8bd5422
> > >=20
> > > Author: Valentin Popa <valentin.popa@intel.com>
> > > Date:   Wed May 23 14:08:58 2012 +0300
> > >=20
> > > xz: updated to version 5.1.1alpha
> >=20
> > this upgrade is causing liblzma package name change
> > -liblzma5_5.0.3-r1_armv4te.ipk
> > +liblzma_5.1.1alpha-r0_armv4t.ipk
> >=20
> > so all packages which rdepends on liblzma should get PR bump, e.g.:
> >  *libsystemd-journal0
> >  *libpoppler18
> >  *libsdl-image-1.2-0
> >  *libpoppler-glib8
> >  *systemd
> >  *ethumb
> >  *libtiff5
> >  *epdf
> >=20
> > Cheers,
>=20
> Looks like whole debian.bbclass got broken by todays merge in oe-core..

looking at buildhistory
http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=3D320=
a9a8a80f0d412cea31a534a8022bacf6545e6#patch330

it looks like run.package_do_shlibs also doesn't work (all RDEPENDS
detected from shlibs are gone), can someone confirm this behavior on=20
his system?

Cheers,

>=20
> -libuuid1_2.21.1-r0_armv4t.ipk
> +util-linux-libuuid_2.21.1-r1_armv4t.ipk
>=20
> And this package wasn't changed between r0 and r1 except u-a changes..
>=20
> And there is more.. (looks like everything what was upgraded today) e.g.:
>=20
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-core-boot:
> |  *    liblzma5 (>=3D 5.0.3) *   libkmod2 (>=3D 7) *       libblkid1 (>=
=3D 2.21) *   libkmod2 (>=3D 7) *       libblkid1 (>=3D 2.21) *   liblzma5 =
(>=3D 5.0.3) *   libkmod2 (>=3D 8) *       libblkid1 (>=3D 2.21.1) *       =
  libblkid1 (>=3D 2.21.1) *     l
> ibuuid1 (>=3D 2.21.1) *
> |  * opkg_install_cmd: Cannot install package task-core-boot.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-gtk:
> |  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *  =
   libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libf=
ontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconf=
ig1 (>=3D 2.8.0) *     libuu
> id1 (>=3D 2.21) *         libfontconfig1 (>=3D 2.8.0) *     libfontconfig=
1 (>=3D 2.8.0) *
> |  * opkg_install_cmd: Cannot install package task-shr-gtk.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-minimal-fso:
> |  *    libfontconfig1 (>=3D 2.8.0) *
> |  * opkg_install_cmd: Cannot install package task-shr-minimal-fso.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-minimal-gtk:
> |  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *  =
   libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libf=
ontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconf=
ig1 (>=3D 2.8.0) *     libfo
> ntconfig1 (>=3D 2.8.0) *  libfontconfig1 (>=3D 2.8.0) *     libfontconfig=
1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D=
 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0)=
 *     libfontconfig1 (>=3D 2.
> 8.0) *  libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3) *   liblz=
ma5 (>=3D 5.0.3) *   libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3=
) *   libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3ERROR: Function=
 failed: do_rootfs (see /OE/
> shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image/shr-image-2.=
0-r20/temp/log.do_rootfs.16970 for further information)
> | ) *   libblkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libblkid1 (>=
=3D 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     l=
ibblkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8=
=2E0) *     libblkid1 (>=3D 2.21) *
>         libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libbl=
kid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *
> |  * opkg_install_cmd: Cannot install package task-shr-minimal-gtk.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-minimal-apps:
> |  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *  =
   libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=
=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21.1) * =
        libuuid1 (>=3D 2.21.1) *       libfontconfig1 (>=3D 2.8.0) *
> |  * opkg_install_cmd: Cannot install package task-shr-minimal-apps.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-cli:
> |  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *  =
   libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.21)=
 *    libuuid1 (>=3D 2.21.1) *  libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.=
21.1) *  libfontconfig1 (>=3D 2.8.0) *  libfontconfig1 (>=3D 2.8.0) *     l=
ibfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libuuid1=
 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.=
8.0) *     liblzma5 (>=3D 5.0.3) *
> |  * opkg_install_cmd: Cannot install package task-shr-cli.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-minimal-x:
> |  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *  =
   libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=
=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libpciaccess0 (>=3D 0.12.9=
02) *   libblkid1 (>=3D 2.21) *        libuuid1 (>=3D 2.21) *    libfontcon=
fig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *   =
 libfontconfig1 (>=3D 2.8.0) *
> |  * opkg_install_cmd: Cannot install package task-shr-minimal-x.
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-shr-games:
> |  *    liblzma5 (>=3D 5.0.3) *
> |  * opkg_install_cmd: Cannot install package task-shr-games.
> NOTE: package shr-image-2.0-r20: task do_rootfs: Failed
>=20
> Cheers,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ncX6roZrNNHXnAbh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GGDMACgkQN1Ujt2V2gBxnsQCfeFEYd1oGgJs30x0n4sZR4PLy
3tMAoIPsk7neWKv+4tu2MWSBB127N/qU
=DAnk
-----END PGP SIGNATURE-----

--ncX6roZrNNHXnAbh--
