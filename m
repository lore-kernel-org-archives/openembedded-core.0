Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 426A17719D;
	Mon,  1 Feb 2016 10:42:47 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l66so63543720wml.0;
	Mon, 01 Feb 2016 02:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=amCAxJ8ey+EGoTR2uoFskVhTWEKV+PCwdMPnE+66ruo=;
	b=kltbwrnYOMuXJhuAIc2F/NzjBbunws17RrBt8i8vHULidDfR354bKIXBPtnoG3CiQD
	RAQ70QGodsO3aNdjw0uY5r9UkjSb7ncIF4T7a038veE/D97WGxfehVPNrzMaKT07BQdt
	LdqlsfVXe/UBoRP95Zic7Gzj6LWP/TMYJrUPOQ1et1tlqyvW1ReuTbH0k4vFs6Eiwn0z
	Hq8DG4pRDio/mGB7+Fme2ZKDQvoflsk/2fpBUGILMfoPuL/EP9JM2SCm2smP3wO/t2rp
	+YbwYZ7dKnMN+JjphpYmzmXjVtE8e8qQw6ztGoNWDtPWCh0Ab1I/Z9218lj1W8+4BQ2u
	OhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=amCAxJ8ey+EGoTR2uoFskVhTWEKV+PCwdMPnE+66ruo=;
	b=Tv48OSHF909gnq69rR0ObxR3OzUh9jOLAGS1CPBFDzTNqSQEvks1gls8D5cPaCRvwk
	SLObqNxfB1cgVZN4DqJWUP5AoX2am6amVhJVx5LbdQSoks81AQ0N5LBd0j7v6BVBkpwt
	t63WW6dmHJJ1wZHyRNNzp3ebOtwhJTerJcMb87Cz9ok9Tv8nF5k0yAiGnuYsQ/8usfgC
	PneagLiOI44/RiCHsN2jxuDGCORaZqKu7DuOty7KB+HFGAK9ntQyFJ1RmvtfgpWBr7pD
	l/frEQ/vOLJNvaN+MWwDbeGRb6HGtU1m+ziFcAnxakNUDDVlYHsbJUdy1hoTaThLlKkL
	2j5w==
X-Gm-Message-State: AG10YOTqLjTQOP5aqKkiBWsvdV2SMJle48JUAFZw/yr4LIeCWytxsv6z8X+r8w8bz3Ts1w==
X-Received: by 10.28.103.5 with SMTP id b5mr1378618wmc.5.1454323367534;
	Mon, 01 Feb 2016 02:42:47 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	e9sm28378588wja.25.2016.02.01.02.42.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 02:42:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 11:45:27 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201104527.GB2803@jama>
References: <1453200318-25633-1-git-send-email-alexandru.but@ni.com>
	<20160129180157.GA15053@jama>
	<20160201092403.GA4183@zdravan.emea.corp.natinst.com>
MIME-Version: 1.0
In-Reply-To: <20160201092403.GA4183@zdravan.emea.corp.natinst.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: linux-yocto issues Was: [oe] [meta-oe][PATCH] efivar: fix zero initializer compiler error
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
X-List-Received-Date: Mon, 01 Feb 2016 10:42:49 -0000
X-Groupsio-MsgNum: 77181
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 11:24:03AM +0200, Alexandru But wrote:
> On Fri, Jan 29, 2016 at 07:01:57PM +0100, Martin Jansa wrote:
> > On Tue, Jan 19, 2016 at 12:45:18PM +0200, Alexandru But wrote:
> > > Patch based on commit a3606c0:
> > > Sometimes the compiler doesn't like { 0,} as an initializer
> >=20
> > Probably not caused by this change, but efivar now fails to build in
> > world build for qemuarm:
> >=20
> > | linux.c: In function 'eb_nvme_ns_id':
> > | linux.c:48:27: error: 'NVME_IOCTL_ID' undeclared (first use in this f=
unction)
> > |   uint64_t ret =3D ioctl(fd, NVME_IOCTL_ID, NULL);
> > |                            ^
> > | linux.c:48:27: note: each undeclared identifier is reported only once=
 for each function it appears in
> > | make[1]: *** [linux.o] Error 1
> > | make[1]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-glibc=
/work/armv5te-oe-linux-gnueabi/efivar/0.21-r0/git/src'
> > | make: *** [src] Error 2
> > | ERROR: oe_runmake failed
> > | ERROR: Function failed: do_compile (log file is located at /home/jenk=
ins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/efivar/0.21-r=
0/temp/log.do_compile.8376)
> > NOTE: recipe efivar-0.21-r0: task do_compile: Failed
> > ERROR: Task 5672 (/home/jenkins/oe/world/shr-core/meta-openembedded/met=
a-oe/recipes-extended/efivar/efivar_0.21.bb, do_compile) failed with exit c=
ode '1'
> >=20
>=20
> Yes, I saw the error, and indeed is not related to this change. The probl=
em is
> that NVMe uapi header was renamed from nvme.h to nvme_ioctl.h. Here is the
> change:
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?i=
d=3D9d99a8dda154f38307d43d9c9aa504bd3703d596
>=20
> The Kconfig update unfortunately hasn't been change in the same time. It =
was
> commited to the kernel only recently and will most likely be present in 4=
=2E5.
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?i=
d=3Da9cf8284b45110a4d98aea180a89c857e53bf850
>=20
> In the standard/base repository that yocto uses, only the first of the ab=
ove
> changes have been pulled. The old header has a new name, so the desired m=
acro
> is no longer there. The problem could be solved from the utility point of=
 view
> with a patch that gentoo tree already has:
> https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/files/0.21=
-nvme_ioctl.h.patch
>=20
> The problem is that even with this change the new header will not be foun=
d since
> the second change is not yet in the yocto repo. I cherry-picked and creat=
ed all
> the changes above, but efivar still does not find the new header.
> Problem is that the headers from sysroot are built by linux-libc-headers =
and
> this recipe uses the static 4.4 linux release archive from kernel.org. If=
 all
> the above are pulled in and linux-libc-headers are using sources with both
> changes, than efivar build will pass.
>=20
> From my point of view the possible solutions for this problem are:
> - Push the efivar patch and blacklist the recipe until linux-libc-headers=
 points
>   to 4.5
> - Revert the rename change in the yocto kernel repo and apply the efivar =
patch
>   after 4.5 token
> - Apply the efivar patch, and a patch for linux-libc-headers
> - Escalate the problem to the kernel comunity to backport the Kconfig cha=
nge to
>   4.4
>=20
> I am not sure which is the right approach since they all have downsides.

Thanks for detailed analysis, I don't use efivar or linux-yocto, so I
was reporting the issue only because I wasn't able to even build-test
your change in jenkins.

Adding oe-core and Bruce, because the issue is in
linux-yocto/linux-libc-headers maintained there.

Regards,

> > > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > > ---
> > >  ...he-compiler-doesn-t-like-0-as-an-initiali.patch | 42 ++++++++++++=
++++++++++
> > >  meta-oe/recipes-extended/efivar/efivar_0.21.bb     |  3 +-
> > >  2 files changed, 44 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Somet=
imes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > >=20
> > > diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-th=
e-compiler-doesn-t-like-0-as-an-initiali.patch b/meta-oe/recipes-extended/e=
fivar/efivar/0001-Sometimes-the-compiler-doesn-t-like-0-as-an-initiali.patch
> > > new file mode 100644
> > > index 0000000..68cabd6
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-extended/efivar/efivar/0001-Sometimes-the-compi=
ler-doesn-t-like-0-as-an-initiali.patch
> > > @@ -0,0 +1,42 @@
> > > +From a3606c02fd271d32e364fcc540e34ba1899309f6 Mon Sep 17 00:00:00 20=
01
> > > +From: Peter Jones <pjones@redhat.com>
> > > +Date: Tue, 14 Jul 2015 09:33:54 -0400
> > > +Subject: [PATCH] Sometimes the compiler doesn't like { 0, } as an
> > > + initializer...
> > > +
> > > +Because it really wants to be { {0, },} or something, and sometimes =
the
> > > +compiler, knowing full well what we're trying to do, likes to compla=
in
> > > +about the rigor applied to our technique in doing it.
> > > +
> > > +memset() the struct ifreq to 0 instead so I don't need to figure out=
 its
> > > +internal structure just to zero it out.
> > > +
> > > +Resolves #28
> > > +
> > > +Signed-off-by: Peter Jones <pjones@redhat.com>
> > > +---
> > > + src/linux.c | 3 ++-
> > > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/src/linux.c b/src/linux.c
> > > +index 57f71f3..817b8e6 100644
> > > +--- a/src/linux.c
> > > ++++ b/src/linux.c
> > > +@@ -847,12 +847,13 @@ ssize_t
> > > + __attribute__((__visibility__ ("hidden")))
> > > + make_mac_path(uint8_t *buf, ssize_t size, const char * const ifname)
> > > + {
> > > +-	struct ifreq ifr =3D { 0, };
> > > ++	struct ifreq ifr;
> > > + 	struct ethtool_drvinfo drvinfo =3D { 0, };
> > > + 	int fd, rc;
> > > + 	ssize_t ret =3D -1, sz, off=3D0;
> > > + 	char busname[PATH_MAX+1] =3D "";
> > > +=20
> > > ++	memset(&ifr, 0, sizeof (ifr));
> > > + 	strncpy(ifr.ifr_name, ifname, IF_NAMESIZE);
> > > + 	drvinfo.cmd =3D ETHTOOL_GDRVINFO;
> > > + 	ifr.ifr_data =3D (caddr_t)&drvinfo;
> > > +--=20
> > > +2.6.1
> > > +
> > > diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb b/meta-oe=
/recipes-extended/efivar/efivar_0.21.bb
> > > index b5ef90a..1684a10 100644
> > > --- a/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
> > > @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6626bb1e20=
189cfa95f2c508ba286393"
> > >  DEPENDS_class-target =3D "popt efivar-native"
> > > =20
> > >  SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
> > > -SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
> > > +SRC_URI =3D "git://github.com/rhinstaller/efivar.git \
> > > +           file://0001-Sometimes-the-compiler-doesn-t-like-0-as-an-i=
nitiali.patch"
> > >  SRC_URI_append_class-target =3D " file://0001-efivar-fix-for-cross-c=
ompile.patch"
> > >  SRC_URI_append_class-native =3D " file://efivar-drop-options-not-sup=
ported-by-lower-version-gcc.patch"
> > > =20
> > > --=20
> > > 2.6.1
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavN0YACgkQN1Ujt2V2gBzSLwCgqGP+fRyQP01Paz2p5eStOL6h
fw4An2w2Yr6ZSJ9yPBrgqD0gXcwGKLLC
=hokz
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
