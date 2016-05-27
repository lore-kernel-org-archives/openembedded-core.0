Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 14E9C70179;
	Fri, 27 May 2016 13:45:54 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e3so15057663wme.2;
	Fri, 27 May 2016 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n6i9J34199CJZG25GSNmMivZEEliSAkxh1h91HHcfjE=;
	b=gdjGcwa/q008xkynAR/ABwjvy6Jp5/SmkqfXeqp4Va3Xsx62YfPOaOVfo8olqtG923
	5Poz4p1AmWFFOTTUPi2E/3jIvSI+I3OdopZ1M9M92qPsRSwUSLw7btPsllFyubMnlGBn
	MwaT3uaOh/ldCzsXwkhQVMnE8ENVGYQY2UvvNvP5oGmZYGv/OCdCjwcp0le34RHMMFSD
	H+O93+zRFai4fcAsY3ZhirV8YsrpAenrHWFb8KPSW/2PSvfOGh2V4u3haVp/rDE6ghOg
	lhY+xemXi8VQoEyXjEukB3RkQYHqZZduqvOn8mtjkZaGCkGDxkV9hGEcexYsUuC/vadm
	jfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n6i9J34199CJZG25GSNmMivZEEliSAkxh1h91HHcfjE=;
	b=cSsykFuCmieMPxS9JC6bQDLiMnjtQTRM7HRK4f6MMw6zu/Cv4fBN0pTV/H4XQEXRpP
	Isn4qi8+P/kglCJzAgn+LZHgfrfSsaqv8LEh5HvTGEQhQrM7hM8imeV3ImEFo9uy4gEX
	eO/+dSBGoqsPaIyK5mWgbrKWbXgCmKNri8mdFUhlCg9qU0ctZHgKXTqRl6QMwKCCfxFh
	RmC5k7xYN0P7HPLITZ9anEiaI+cQqUmTjVf6bAA6vwQ78cUwTTbjpkFxkBnJrWJQuSCF
	VA4dWru/G8Q3T7I/i/Y7Mov/DCFCDytGXh+nDwkt5UzqJlch2mKmoJ9xmJEwRjN9/Lxh
	SNYw==
X-Gm-Message-State: ALyK8tIQkUFK9kwM2AJLubHQ00js0x1Ic7a0BhiFTaZ84wipVBMDxtPJEkgVm+xcC5wouA==
X-Received: by 10.194.191.133 with SMTP id gy5mr15868324wjc.136.1464356754898; 
	Fri, 27 May 2016 06:45:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	x124sm8722860wmg.24.2016.05.27.06.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 06:45:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 15:46:20 +0200
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160527134620.GE2570@jama>
References: <20160511093456.15363.8004@opal.openembedded.org>
	<20160511093459.4336E5043D@opal.openembedded.org>
	<20160527132201.GD2570@jama>
MIME-Version: 1.0
In-Reply-To: <20160527132201.GD2570@jama>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 09/12: classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
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
X-List-Received-Date: Fri, 27 May 2016 13:45:56 -0000
X-Groupsio-MsgNum: 82791
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G6nVm6DDWH/FONJq"
Content-Disposition: inline

--G6nVm6DDWH/FONJq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 03:22:01PM +0200, Martin Jansa wrote:
> On Wed, May 11, 2016 at 09:35:05AM +0000, git@git.openembedded.org wrote:
> > rpurdie pushed a commit to branch master
> > in repository openembedded-core.
> >=20
> > commit c269547ae8e90a78349f6003385137e4145e145f
> > Author: Paul Eggleton <paul.eggleton@linux.intel.com>
> > AuthorDate: Tue May 10 10:25:05 2016 +1200
> >=20
> >     classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
> >    =20
> >     Recipes such as images and packagegroups don't actually fetch or bu=
ild
> >     any source, so there's really no point having LIC_FILES_CHKSUM set.
> >     Forcing users to set it (as we have done for images inheriting
> >     image.bbclass) just makes things more difficult for the user for no
> >     discernable benefit. The easiest way to adjust this check is simply=
 to
> >     skip it if SRC_URI is not set since this is a pretty good indicator=
 that
> >     no source is being pulled in.
>=20
> I'm not sure which recent change caused it, but can we keep the QA issues
> stored in qa.log to contain all important information on single line
> which ends with [check-name]? (it can have more details on preceeding lin=
es
> like installed-not-packaged check)
>=20
> The qa.log from last world build is missing many line-feeds and
> [license-checksum] are hard to read (even worse to parse automatically)
>=20
> see:
> http://logs.nslu2-linux.org/buildlogs/oe/world//log.world.qemuarm.2016052=
3_030221.log//qa.log

It was working on 20160520
http://logs.nslu2-linux.org/buildlogs/oe/world//log.dependencies.qemuarm.20=
160520_011029.log/qa.log

so it's probably this change:

commit 0f4ec13e11bb8abe21aba2a28547dfb9372bc377
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sat May 21 12:26:45 2016 +0100

    meta/scripts: python3: rename file -> open
   =20
    file() API doesn't exist in python 3, convert to open(). Also handle
    some cases where files aren't closed. Compatible with python 2.7.
   =20
    [Contributions from Ed and Richard]
   =20
    Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 0b151c2..116abc4 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -177,9 +177,8 @@ def package_qa_write_error(type, error, d):
     logfile =3D d.getVar('QA_LOGFILE', True)
     if logfile:
         p =3D d.getVar('P', True)
-        f =3D file( logfile, "a+")
-        print >> f, "%s: %s [%s]" % (p, error, type)
-        f.close()
+        with open(logfile, "a+") as f:
+            f.write("%s: %s [%s]" % (p, error, type))
=20
 def package_qa_handle_error(error_class, error_msg, d):
     package_qa_write_error(error_class, error_msg, d)


the rest of oe-core log looks sane

OE @ ~/openembedded-core $ git log --oneline 19bd5eb28027eb86e5f9cf688fc80f=
bd98774306..d8b4dfa189a5c8492761d1c78b3cc2435b0275f7 | tee
d8b4dfa metadata-revs: provide more information
79685fa buildhistory.bbclass: metadata-revs show repo parent
6476c35 recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=3D=
mode,links"
a51f426 sstate-sysroot-cruft.sh: Extend the whitelist
1c0c3ec qemux86: Add identical qemux86copy variant for tests
0a99136 report-error: Allow to upload reports automatically
474d3aa linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt
d6241e4 useradd: Fix infinite build loop
048c901 linux-yocto-rt, core-image-rt*: Explicitly skip when PREFERRED_PROV=
IDER_virtual/kernel isn't set to linux-yocto-rt
b6c7161 scripts/bitbake-whatchanged: migrate from optparse to argparse
8016b51 core-image-{minimal, testmaster}-initramfs: set COMPATIBLE_HOST
d2b4da7 image.bbclass: additional output in create_symlinks
85855af image.bbclass: support duplicate compression types
6cc6526 coreutils: Fix rootfs creation errors
4c98c19 net-tools: Fix rootfs creation errors
52d3d9e shadow: Fix rootfs creation errors
6993e88 musl: Update to latest tip
6c18103 qemu: Upgrade to 2.6.0
33865f2 harfbuzz: update to 1.2.7
504a822 libsolv: update to 0.6.21
378608a libsoup-2.4: provide PACKAGECONFIG for gssapi
05bce1f cmake: update to 3.5.2
f4232f7 ghostscript: Update URL_SRI considered as 'old release'
73f43d8 systemd: re-enable mount propagation for udevd
9098838 package_manager: no need to output Note: in bb.note() calls
5a0b857 wipe-sysroot: fix wrong glob when removing manifests
1bfe160 scripts/oe-selftest: Remove inadvertant python3 specific change
fa2ca76 python-smartpm: Avoid locale issue with bitbake python3
833d4c0 bitbake.conf/toolchain-shar-extract: Use en_US.UTF-8 as locale
d13f0ac meta: Update to modern exception syntax
96ed92a kernel-uimage: Fix python indentation
0f4ec13 meta/scripts: python3: rename file -> open
ced1995 meta/selftest/scripts: Use print function for python3 compatibility
7a4c9c9 devtool: sdk-update: drop support for local updates
faa1229 nativesdk-glibc: Extend relocation support to locales
6993d18 glibc-locale: Enable binary locale generation for nativesdk-glibc
b06d9ad build-appliance-image: use 'lnr' instead of 'ln -sr'
be62b6b lttng-modules: Upgrade to 2.7.3 release
3ba4fd8 mkelfimage: obey LDFLAGS, sort out HOST_ flags
f74cdf8 core-image-weston: If X11 is enabled, add XWayland support
76ed534 weston-init: Use weston-launch when starting weston as the first wi=
ndowing system
4bbb5d5 weston: Add Xwayland initialization support using weston-start
3e7c4d0 weston-init: Add module support for the weston-start helper
2332f93 weston-init: Error out if loading a nested instance
1963dfb weston-init: Rework init sequence to avoid code duplication
9d745d7 weston-init: Rework do_install to use install -D option
6295197 weston: Provide a default version of weston-launch that doesn't req=
uire PAM
f16f3d6 weston: Remove XWayland dependencies on PACKAGECONFIG
b9a484b weston: Enable XWayland when X11 and Wayland support are available
a3084bd weston: Add PACKAGECONFIG option for 'clients'
32e9ef3 weston: Fix SystemD service description
9494ac0 weston: weston-launch: Handle invalid command line options

>=20
> libnewt-0.52.18: /usr/bin/whiptail contained in package whiptail requires=
 libnewt.so, but no providers found in RDEPENDS_whiptail? [file-rdeps]qtway=
land-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on=
 libxcomposite, but it isn't a build dependency, missing libxcomposite in D=
EPENDS or PACKAGECONFIG? [build-deps]gnome-menus-2.30.5: /usr/bin/gmenu-sim=
ple-editor contained in package gnome-menus requires /home/jenkins/oe/world=
/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/python-native/python, but=
 no providers found in RDEPENDS_gnome-menus? [file-rdeps]networkmanager-1.0=
=2E10: /usr/bin/nmtui-connect contained in package networkmanager-nmtui req=
uires libnewt.so, but no providers found in RDEPENDS_networkmanager-nmtui? =
[file-rdeps]samba-4.4.2: samba rdepends on libpam, but it isn't a build dep=
endency, missing libpam in DEPENDS or PACKAGECONFIG? [build-deps]xfsprogs-3=
=2E2.3: /usr/sbin/xfs_db contained in package xfsprogs requires libxfs.so.0=
, but no providers found in RDEPENDS_xfsprogs? [file-rdeps]xfsprogs-3.2.3: =
/sbin/mkfs.xfs contained in package xfsprogs-mkfs requires libxfs.so.0, but=
 no providers found in RDEPENDS_xfsprogs-mkfs? [file-rdeps]chkconfig-1.3.58=
: /usr/sbin/ntsysv contained in package chkconfig requires libnewt.so, but =
no providers found in RDEPENDS_chkconfig? [file-rdeps]numptyphysics-0.2+svn=
r109: /usr/share/numptyphysics/convert_all.sh contained in package numptyph=
ysics requires /bin/bash, but no providers found in RDEPENDS_numptyphysics?=
 [file-rdeps]qtcharts-5.6.99+5.7.0-beta+gitAUTOINC+8a78184181: qtcharts-exa=
mples rdepends on qtmultimedia, but it isn't a build dependency, missing qt=
multimedia in DEPENDS or PACKAGECONFIG? [build-deps]libmodule-build-perl-0.=
31: /usr/bin/config_data contained in package libmodule-build-perl requires=
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/pe=
rl-native/perl.real, but no providers found in RDEPENDS_libmodule-build-per=
l? [file-rdeps]dvb-apps-1.1.1: /usr/bin/dvbdate contained in package dvbdat=
e requires libucsi.so, but no providers found in RDEPENDS_dvbdate? [file-rd=
eps]dvb-apps-1.1.1: /usr/bin/dvbtraffic contained in package dvbtraffic req=
uires libdvbapi.so, but no providers found in RDEPENDS_dvbtraffic? [file-rd=
eps]dvb-apps-1.1.1: /usr/bin/dvbscan contained in package dvb-scan requires=
 libdvbapi.so, but no providers found in RDEPENDS_dvb-scan? [file-rdeps]dvb=
-apps-1.1.1: /usr/bin/gotox contained in package dvb-apps requires libdvbap=
i.so, but no providers found in RDEPENDS_dvb-apps? [file-rdeps]dvb-apps-1.1=
=2E1: /usr/bin/femon contained in package dvb-femon requires libdvbapi.so, =
but no providers found in RDEPENDS_dvb-femon? [file-rdeps]dvb-apps-1.1.1: /=
usr/bin/dvbnet contained in package dvbnet requires libdvbapi.so, but no pr=
oviders found in RDEPENDS_dvbnet? [file-rdeps]libnewt-python-0.52.18: /usr/=
lib/python2.7/site-packages/_snack.so contained in package libnewt-python r=
equires libnewt.so, but no providers found in RDEPENDS_libnewt-python? [fil=
e-rdeps]packagegroup-tools-bluetooth-1.0: packagegroup-tools-bluetooth: The=
 LIC_FILES_CHKSUM does not match for file:///home/jenkins/oe/world/shr-core=
/openembedded-core/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58
> packagegroup-tools-bluetooth: The new md5 checksum is 4d92cd373abda3937c2=
bc47fbc49d690
> packagegroup-tools-bluetooth: Check if the license information has change=
d in /home/jenkins/oe/world/shr-core/openembedded-core/LICENSE to verify th=
at the LICENSE value "MIT" remains valid [license-checksum]ubx-utils-0.0.0+=
gitrAUTOINC+b63c0932dd: /usr/bin/memory-map.sh contained in package ubx-uti=
ls requires /bin/bash, but no providers found in RDEPENDS_ubx-utils? [file-=
rdeps]
>=20
> >     Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/insane.bbclass | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> > index 097dc3a..0b151c2 100644
> > --- a/meta/classes/insane.bbclass
> > +++ b/meta/classes/insane.bbclass
> > @@ -681,15 +681,15 @@ python populate_lic_qa_checksum() {
> >      import tempfile
> >      sane =3D True
> > =20
> > -    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True)
> > +    lic_files =3D d.getVar('LIC_FILES_CHKSUM', True) or ''
> >      lic =3D d.getVar('LICENSE', True)
> >      pn =3D d.getVar('PN', True)
> > =20
> >      if lic =3D=3D "CLOSED":
> >          return
> > =20
> > -    if not lic_files:
> > -        package_qa_handle_error("license-checksum", pn + ": Recipe fil=
e does not have license file information (LIC_FILES_CHKSUM)", d)
> > +    if not lic_files and d.getVar('SRC_URI', True):
> > +        package_qa_handle_error("license-checksum", pn + ": Recipe fil=
e fetches files and does not have license file information (LIC_FILES_CHKSU=
M)", d)
> >          return
> > =20
> >      srcdir =3D d.getVar('S', True)
> >=20
> > --=20
> > To stop receiving notification emails like this one, please contact
> > the administrator of this repository.
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G6nVm6DDWH/FONJq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldITUcACgkQN1Ujt2V2gBxGuQCggSNkKH1Zg8cjD1Yo2QqP1mW9
B+4AoLt516am4uXxTP2E5J4z2jVtHa8x
=8Anh
-----END PGP SIGNATURE-----

--G6nVm6DDWH/FONJq--
