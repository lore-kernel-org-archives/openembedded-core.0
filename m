Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2399A6E7FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 07:55:54 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id h14so139151eaj.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=OMJ07R+4jXQFuWL794MXqmAPCScn9Rx1yyyPrTST1/k=;
	b=mYswNOq3vYcIvDMEazrMMhQ5VYRKwTN5XybwC6XYzx2Q8aSkugX8f/9mfNle5H/i7z
	zXhcAWBgiEjyzJJkDSXFoiggv/nWK6NR1HQY3h0IFBEp64wEOMZFQJTCTQNHMAR+vQ5Z
	NNB7/kOgUSeXA0Q3B5i4KTvTS3HsjsQqfOr7XZI56yncASGMyCswNT6pMb1uLNl7fWvN
	taB/ocKbj7fpmrqVvlrmYigk31CPdPpJFgOPJw4U0jtr0sEiT1x2tyoap24a1lGUpE7/
	DjkwgoQE+0qw1yGwR9nDeUHUjuWRjex1z1N0yyjOJchsnu5l4Vx3p773PHN4YUfvmRbr
	9XNA==
X-Received: by 10.14.179.73 with SMTP id g49mr1892316eem.71.1392796555428;
	Tue, 18 Feb 2014 23:55:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u6sm79961420eep.11.2014.02.18.23.55.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Feb 2014 23:55:54 -0800 (PST)
Date: Wed, 19 Feb 2014 08:56:27 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20140219075627.GA3854@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: TypeError in self.pm.handle_bad_recommendations
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
X-List-Received-Date: Wed, 19 Feb 2014 07:55:55 -0000
X-Groupsio-MsgNum: 50320
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Content-Disposition: inline

--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

With latest oe-core/master I get this exception when building my images:

ERROR: Error executing a python function in /OE/recipes-core/images/my-imag=
e.bb:

The stack trace of python calls that resulted in this exception/failure was:
File: 'do_rootfs', lineno: 17, function: <module>
     0013:    # generate final images
     0014:    create_image(d)
     0015:
     0016:
 *** 0017:do_rootfs(d)
     0018:
File: 'do_rootfs', lineno: 11, function: do_rootfs
     0007:    # generate the initial manifest
     0008:    create_manifest(d)
     0009:
     0010:    # generate rootfs
 *** 0011:    create_rootfs(d)
     0012:
     0013:    # generate final images
     0014:    create_image(d)
     0015:
File: '/OE/oe-core/meta/lib/oe/rootfs.py', lineno: 594, function: create_ro=
otfs
     0590:    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
     0591:    if img_type =3D=3D "rpm":
                                                                           =
                                                                 733560,1  =
    99%
     0590:    img_type =3D d.getVar('IMAGE_PKGTYPE', True)
     0591:    if img_type =3D=3D "rpm":
     0592:        RpmRootfs(d, manifest_dir).create()
     0593:    elif img_type =3D=3D "ipk":
 *** 0594:        OpkgRootfs(d, manifest_dir).create()
     0595:    elif img_type =3D=3D "deb":
     0596:        DpkgRootfs(d, manifest_dir).create()
     0597:
     0598:    os.environ.clear()
File: '/OE/oe-core/meta/lib/oe/rootfs.py', lineno: 88, function: create
     0084:
     0085:        execute_pre_post_process(self.d, pre_process_cmds)
     0086:
     0087:        # call the package manager dependent create method
 *** 0088:        self._create()
     0089:
     0090:        sysconfdir =3D self.image_rootfs + self.d.getVar('sysconf=
dir', True)
     0091:        bb.utils.mkdirhier(sysconfdir)
     0092:        with open(sysconfdir + "/version", "w+") as ver:
File: '/OE/oe-core/meta/lib/oe/rootfs.py', lineno: 525, function: _create
     0521:        execute_pre_post_process(self.d, opkg_pre_process_cmds)
     0522:
     0523:        self.pm.update()
     0524:
 *** 0525:        self.pm.handle_bad_recommendations()
     0526:
     0527:        for pkg_type in self.install_order:
     0528:            if pkg_type in pkgs_to_install:
     0529:                # For multilib, we perform a sanity test before f=
inal install
File: '/OE/oe-core/meta/lib/oe/package_manager.py', lineno: 1169, function:=
 handle_bad_recommendations
     1165:                             "returned %d:\n%s" % (pkg_info, e.re=
turncode, e.output))
     1166:
     1167:                if output =3D=3D "":
     1168:                    bb.note("Requested ignored recommendation $i =
is "
 *** 1169:                            "not a package" % pkg)
     1170:                    continue
     1171:
     1172:                for line in output.split('\n'):
     1173:                    if line.startswith("Status:"):
Exception: TypeError: not all arguments converted during string formatting

ERROR: Function failed: do_rootfs

bitbake -e shows these bad recommendations:
BAD_RECOMMENDATIONS=3D" update-rc.d openssh kernel-vmlinux"

Complete bitbake -e history:

# $BAD_RECOMMENDATIONS [6 operations]
#   append /OE/meta-webos/conf/distro/include/webos-preferred-providers.inc=
:26
#     "update-rc.d"
#   _append[qemux86] /OE/meta-webos/conf/distro/include/webos-preferred-pro=
viders.inc:31
#     " kernel-vmlinux"
#   append /OE/meta-webos/conf/distro/include/webos.inc:34
#     "openssh"
#   set /OE/oe-core/meta/conf/documentation.conf:69
#     [doc] "A list of packages not to install despite being recommended by=
 a recipe. Support for this variable exists only when using the IPK packagi=
ng backend."
#   set? conf/bitbake.conf:743
#     ""
#   set data_smart.py:429 [finalize]
#     " update-rc.d openssh kernel-vmlinux"
# computed:
#   " update-rc.d openssh kernel-vmlinux"
BAD_RECOMMENDATIONS=3D" update-rc.d openssh kernel-vmlinux"

sigh.. and now I see the issue.. patch coming

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMEY6sACgkQN1Ujt2V2gByNSgCgiwZB0loFmVUMrA4rH+fsFh+U
JKsAnRUSGQzcTAsLJb8ccWp8ajjP0Chq
=ueMX
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
