Received: from mail-pd0-f170.google.com ([209.85.192.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Uc0fC-0000DC-9O
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 23:52:23 +0200
Received: by mail-pd0-f170.google.com with SMTP id 10so4734475pdi.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OR8/If19OjfP2tj/tFRa8jdQyU4dherUIhqWVgI8inQ=;
	b=s+na9A0tmMT+4hejQB1X2Gh1dCnM+PmhIlXGU28o1yJI6m0/iXWFZCrdvbflZu7pSc
	1Gdce1tq+PcZegvGLG6GJ0Ct3yZmeV0IXzoEgO4AXqoXE7Aq5W25qtmhjBUnqy+GjT8c
	dS79AQHgSopuyjT/NyfkrW3DghDT815XyWlg2gC/uh+Rb7iHHRJ7kP/BLGRTt8cL9rFA
	f0SYOEKmkgm9H4cZNQYp9sVqL3Klfy6owK5+l6pqRMQEaAt3x2RaOsc3k4sMjFTTiVET
	tvXwlORdJxjAviwzB3p74O2KTvtt/tkTzq9tjJjZtDfBFTTOuJhEi1mr2jDRLVNpU1tX
	0j1Q==
X-Received: by 10.68.252.227 with SMTP id zv3mr31713032pbc.14.1368480839299;
	Mon, 13 May 2013 14:33:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	v5sm15371573pbz.4.2013.05.13.14.33.56 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 13 May 2013 14:33:58 -0700 (PDT)
Date: Mon, 13 May 2013 23:33:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20130513213356.GE3187@jama>
References: <519153C8.6060708@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <519153C8.6060708@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: init-ifupdown: do_package_ipk failing
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
X-List-Received-Date: Mon, 13 May 2013 21:52:26 -0000
X-Groupsio-MsgNum: 39170
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="orO6xySwJI16pVnm"
Content-Disposition: inline

--orO6xySwJI16pVnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2013 at 01:57:44PM -0700, Darren Hart wrote:
> After removing a bbappend for init-ifupdown I am seeing failures in
> do_package_ipk:
>=20
> Build Configuration:
> BB_VERSION        =3D "1.19.0"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "Ubuntu-11.10"
> TARGET_SYS        =3D "i586-poky-linux"
> MACHINE           =3D "minnow"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "1.3+snapshot-20130513"
> TUNE_FEATURES     =3D "m32 core2"
> TARGET_FPU        =3D ""
> meta-yocto        =3D "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b"
> meta-minnow       =3D "master:d474c4304dc1c9e9703fce0cd6a4329289681f92"
> meta-intel        =3D "master:624aada76d2de84bd0263065b112ed4e94798b6b"
> meta              =3D "master:94d31b0b36be389710bfb1c5d7aeacda92efad5b"
>=20
> ...
>=20
> ERROR: Error executing a python function in
> /build/yocto/master/minnow_201302231109
> 41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:
>=20
> OSError: [Errno 2] No such file or directory:
> '/build/yocto/master/minnow_201302231
> 10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split=
/init-ifup
> down-dbg'
>=20
> ERROR: Error executing a python function in
> /build/yocto/master/minnow_201302231109
> 41/poky/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb:
>=20
> OSError: [Errno 2] No such file or directory:
> '/build/yocto/master/minnow_201302231
> 10941/build/tmp/work/core2-poky-linux/init-ifupdown/1.0-r2/packages-split=
/init-ifup
> down-dbg'
>=20
> ERROR: The stack trace of python calls that resulted in this
> exception/failure was:
> ERROR:   File "do_package_ipk", line 194, in <module>
> ERROR:
> ERROR:   File "do_package_ipk", line 45, in do_package_ipk
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0190:        bb.utils.unlockfile(lf)
> ERROR:      0191:
> ERROR:      0192:
> ERROR:      0193:
> ERROR:  *** 0194:do_package_ipk(d)
> ERROR:      0195:
>=20
> ERROR: [From file: 'do_package_ipk', lineno: 194, function: <module>]
>=20
> ERROR:      0041:        basedir =3D os.path.join(os.path.dirname(root))
>=20
> ERROR:      0042:        arch =3D localdata.getVar('PACKAGE_ARCH', True)
>=20
> ERROR:      0043:        pkgoutdir =3D "%s/%s" % (outdir, arch)
>=20
> ERROR:      0044:        bb.mkdirhier(pkgoutdir)
> ERROR:  *** 0045:        os.chdir(root)
> ERROR:      0046:        from glob import glob
> ERROR:      0047:        g =3D glob('*')
> ERROR:      0048:        try:
> ERROR:      0049:            del g[g.index('CONTROL')]
> ERROR: [From file: 'do_package_ipk', lineno: 45, function: do_package_ipk]
> ERROR: Function failed: do_package_ipk
> ERROR: Logfile of failure stored in:
> /build/yocto/master/minnow_20130223110941/build/tmp/work/core2-poky-linux=
/init-ifupdown/1.0-r0/temp/log.do_package_write_ipk.16210
> ERROR: Task 1399
> (/build/yocto/master/minnow_20130223110941/poky/meta/recipes-core/init-if=
updown/init-ifupdown_1.0.bb,
> do_package_write_ipk) failed with exit code '1'
>=20
> I have done cleansstate and cleanall, but the error is repeatable.

You need to manually remove minnow init-ifupdown from runtime/pkgdata

> Is anyone else experiencing this with init-ifupdown and ipk packaging?

See
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--orO6xySwJI16pVnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlGRXEQACgkQN1Ujt2V2gBzIoACeKp2hHPHtmConS9FI997O+0G8
LzoAnR308n7vtXcP2KFFUQFvbjZL8lzt
=cRhV
-----END PGP SIGNATURE-----

--orO6xySwJI16pVnm--
