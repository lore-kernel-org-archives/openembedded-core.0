Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SZi2b-00023D-J3; Wed, 30 May 2012 14:30:17 +0200
Received: by wibhm14 with SMTP id hm14so3353704wib.6
	for <multiple recipients>; Wed, 30 May 2012 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KRst1KhQ2E6cK2wOQVqst6BQoM2RYE9uXOdqFT5q8QY=;
	b=Al1xFTCbta8dBQwTv77W5t6V2M7PSdAeHYfi+SMcxf9H3mQku6fVTqQBy/E3wTmPWb
	+KA0cMilzYholbSJ9sOY804Xv5MzIzDekA5j0f3peVASzLgvxMDSHfsA5QZfZDNcVrb4
	qonDqoSwrF8Zx/V13AcWflu5O9smzuYXBSSyqueTefFu2GbuPjzXR2ap+j/d8ckf1PEO
	CuD8Do6+Ky7sjtlhuNqb6BupW7ZWrpUHz/AMKHP9HhTCTTs8oa7+7wBx4y17Yqfwymlb
	4+AP5R9tuXpGuptu1q52Vdy3mB86JNZl6YPtbbu2W6kKQX0I9cSVDWw5ZGQTBtuPcZdk
	tX2g==
Received: by 10.216.226.218 with SMTP id b68mr10721773weq.167.1338380399165;
	Wed, 30 May 2012 05:19:59 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dg2sm55971908wib.4.2012.05.30.05.19.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:19:58 -0700 (PDT)
Date: Wed, 30 May 2012 14:20:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120530122007.GM3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120530120443.GL3138@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: debian.bbclass got broken today Was: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 12:30:17 -0000
X-Groupsio-MsgNum: 22960
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HL3CiL6n73+IAdG4"
Content-Disposition: inline

--HL3CiL6n73+IAdG4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 02:04:43PM +0200, Martin Jansa wrote:
> On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3Dda98266f3a228cf65f279db9810a5326c8bd5422
> >=20
> > Author: Valentin Popa <valentin.popa@intel.com>
> > Date:   Wed May 23 14:08:58 2012 +0300
> >=20
> > xz: updated to version 5.1.1alpha
>=20
> this upgrade is causing liblzma package name change
> -liblzma5_5.0.3-r1_armv4te.ipk
> +liblzma_5.1.1alpha-r0_armv4t.ipk
>=20
> so all packages which rdepends on liblzma should get PR bump, e.g.:
>  *libsystemd-journal0
>  *libpoppler18
>  *libsdl-image-1.2-0
>  *libpoppler-glib8
>  *systemd
>  *ethumb
>  *libtiff5
>  *epdf
>=20
> Cheers,

Looks like whole debian.bbclass got broken by todays merge in oe-core..

-libuuid1_2.21.1-r0_armv4t.ipk
+util-linux-libuuid_2.21.1-r1_armv4t.ipk

And this package wasn't changed between r0 and r1 except u-a changes..

And there is more.. (looks like everything what was upgraded today) e.g.:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-core-boot:
|  *    liblzma5 (>=3D 5.0.3) *   libkmod2 (>=3D 7) *       libblkid1 (>=3D=
 2.21) *   libkmod2 (>=3D 7) *       libblkid1 (>=3D 2.21) *   liblzma5 (>=
=3D 5.0.3) *   libkmod2 (>=3D 8) *       libblkid1 (>=3D 2.21.1) *         =
libblkid1 (>=3D 2.21.1) *     l
ibuuid1 (>=3D 2.21.1) *
|  * opkg_install_cmd: Cannot install package task-core-boot.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-gtk:
|  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *    =
 libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfon=
tconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig=
1 (>=3D 2.8.0) *     libuu
id1 (>=3D 2.21) *         libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 =
(>=3D 2.8.0) *
|  * opkg_install_cmd: Cannot install package task-shr-gtk.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-minimal-fso:
|  *    libfontconfig1 (>=3D 2.8.0) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-fso.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-minimal-gtk:
|  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *    =
 libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfon=
tconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig=
1 (>=3D 2.8.0) *     libfo
ntconfig1 (>=3D 2.8.0) *  libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 =
(>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2=
=2E8.0) *     libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0)=
 *     libfontconfig1 (>=3D 2.
8.0) *  libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3) *   liblzma=
5 (>=3D 5.0.3) *   libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3) =
*   libfontconfig1 (>=3D 2.8.0) *     liblzma5 (>=3D 5.0.3ERROR: Function f=
ailed: do_rootfs (see /OE/
shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image/shr-image-2.0-=
r20/temp/log.do_rootfs.16970 for further information)
| ) *   libblkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libblkid1 (>=3D=
 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libb=
lkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0)=
 *     libblkid1 (>=3D 2.21) *
        libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libblki=
d1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-gtk.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-minimal-apps:
|  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *    =
 libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=3D=
 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21.1) *    =
     libuuid1 (>=3D 2.21.1) *       libfontconfig1 (>=3D 2.8.0) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-apps.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-cli:
|  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *    =
 libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.21) *=
    libuuid1 (>=3D 2.21.1) *  libuuid1 (>=3D 2.21) *    libuuid1 (>=3D 2.21=
=2E1) *  libfontconfig1 (>=3D 2.8.0) *  libfontconfig1 (>=3D 2.8.0) *     l=
ibfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *     libuuid1=
 (>=3D 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.=
8.0) *     liblzma5 (>=3D 5.0.3) *
|  * opkg_install_cmd: Cannot install package task-shr-cli.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-minimal-x:
|  *    libfontconfig1 (>=3D 2.8.0) *     libfontconfig1 (>=3D 2.8.0) *    =
 libfontconfig1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=3D=
 2.21) *    libfontconfig1 (>=3D 2.8.0) *     libpciaccess0 (>=3D 0.12.902)=
 *   libblkid1 (>=3D 2.21) *        libuuid1 (>=3D 2.21) *    libfontconfig=
1 (>=3D 2.8.0) *     libblkid1 (>=3D 2.21) *   libuuid1 (>=3D 2.21) *    li=
bfontconfig1 (>=3D 2.8.0) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-x.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-shr-games:
|  *    liblzma5 (>=3D 5.0.3) *
|  * opkg_install_cmd: Cannot install package task-shr-games.
NOTE: package shr-image-2.0-r20: task do_rootfs: Failed

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HL3CiL6n73+IAdG4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GEHcACgkQN1Ujt2V2gBzO9QCghhyT/rErkC73P78ZkA38F3hM
xuQAoJnpRCJxW/l9zTfvJlXHJG+3bzjB
=VB+J
-----END PGP SIGNATURE-----

--HL3CiL6n73+IAdG4--
