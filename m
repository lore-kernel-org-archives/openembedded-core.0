Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7FD6B6CD;
	Tue, 17 Sep 2013 12:29:23 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so2680272eek.4
	for <multiple recipients>; Tue, 17 Sep 2013 05:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HAZYAuEUeam8glZeLpt1XOtU1cQGyVhrwTGD7GS1Sq8=;
	b=EXrL0jXRyGnruGGjZZtPtmGrBhYbuat+JlwdgZ/GjjEcCiRZGdy/2Hy3g8BftnnuRX
	OBiRX8fPHWjMxIuAWz21N/VgXih9/M1SMlc309OW82t2+uthDXDJbWDBFGAA+jCY1QEd
	DqnDSMez5Gr8bZUIltjelu1bQ3WXHWvovyj/QCo5AoyABbcuzs6wEJ0uyf7i8BzdnEYH
	TWsOt6+Gs32z9bPiX8s0ShxCL0IyInDjEwXxfUc1OX0C+v9ct74Buq8WtrFW4Q3mStJi
	zGyEKoMiGL6BYbCUQEmWXCovJzaWL2Ms8lezEr7iLzGtAhkdPvgNbLL3OMVBf9BR/Wxm
	Xz1Q==
X-Received: by 10.14.210.195 with SMTP id u43mr1985883eeo.80.1379420964059;
	Tue, 17 Sep 2013 05:29:24 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm50534020eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 05:29:23 -0700 (PDT)
Date: Tue, 17 Sep 2013 14:30:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130917123058.GC7313@jama>
References: <20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama>
MIME-Version: 1.0
In-Reply-To: <20130811114403.GG17945@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Tue, 17 Sep 2013 12:29:24 -0000
X-Groupsio-MsgNum: 45145
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WfZ7S8PLGjBY9Voh"
Content-Disposition: inline

--WfZ7S8PLGjBY9Voh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 11, 2013 at 01:44:03PM +0200, Martin Jansa wrote:
> On Fri, Aug 09, 2013 at 12:54:19AM +0200, Martin Jansa wrote:
> > On Thu, Jul 25, 2013 at 06:23:41PM +0200, Martin Jansa wrote:
> > > On Sat, Jun 22, 2013 at 08:16:56PM +0200, Martin Jansa wrote:
> > > > On Tue, Jun 11, 2013 at 06:04:34PM +0200, Martin Jansa wrote:
> > > > Last week hero Khem, sent many world fixes, but it seems like some =
fixes weren't enough
> > > > (tk, packagekit are still failing - I hope I haven't missed some ot=
her vN)
> > > > qemuarm: Summary: 11 tasks failed:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.w=
orld.20130620_105211.log/
> > > >=20
> > > > qemux86: Summary: 14 tasks failed:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.w=
orld.20130621_023143.log/
> > > >=20
> > > > qemux86_64: Summary: 15 tasks failed:
> > > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.w=
orld.20130621_181258.log/
> > > >=20
> > > > common (9):
> > > >   openembedded-core/meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb, do_c=
ompile
> > > >   openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.=
bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-connectivity/samba/samba_3.6.8.=
bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_sv=
n.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_=
0.5.6.bb, do_compile
> > > >   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_=
compile
> > > >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-ser=
ver_git.bb, do_compile
> > > >   meta-openembedded/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.=
32.0.bb, do_compile
> > > >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_g=
it.bb, do_compile
> > > >=20
> > > > qemuarm (2):
> > > >   openembedded-core/meta/recipes-devtools/qemu/qemu_1.5.0.bb, do_co=
mpile
> > > >   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_=
git.bb, do_compile
> > > >=20
> > > > qemux86* common (4):
> > > >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-in=
tel_2.21.9.bb, do_compile
> > > >   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
> > > >   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_conf=
igure
> > > >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do=
_compile
> > > >=20
> > > > qemux86 (1):
> > > >   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video=
-geode_2.11.14.bb, do_compile
> > > >=20
> > > > qemux86-64 (2):=20
> > > >   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_co=
mpile
> > > >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/l=
ibimobiledevice_1.1.4.bb, do_configure

I haven't updated this status for few weeks because there were always
some issue deeper in the dependency tree so it was hiding a lot of other
issues, now it's good time to update all qemu* statuses. All these
builds had both my dependency-fixes patchsets included.

qemuarm: Summary: 5 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30915_024550.log

qemux86: Summary: 10 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30915_190536.log

qemux86-64: Summary: 14 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30916_160509.log

common (4):
  meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-connectivity/daq/daq_2.0.1.bb, do_insta=
ll
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

qemuarm (1):
  openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb, do_compile

qemux86* common (5):
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  meta-openembedded/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-ke=
xecboot_3.8.bb, do_package
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb, d=
o_compile

qemux86 (1):
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile

qemux86-64 (5):
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git=
=2Ebb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.=
bb, do_compile

QA (incomplete because many recipes were reused from sstate):
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging!
qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.0-r0/buil=
d/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x=
86_64-oe-linux/qtwebkit/5.1.0-r0/packages-split/qtwebkit/usr/lib/qt5/libexe=
c/QtWebPluginProcess
qtwebkit-5.1.0: package qtwebkit contains bad RPATH /home/jenkins/oe/shr-co=
re-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux/qtwebkit/5.1.0-r0/buil=
d/lib in file /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x=
86_64-oe-linux/qtwebkit/5.1.0-r0/packages-split/qtwebkit/usr/lib/qt5/libexe=
c/QtWebProcess
ed-1.9: The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package.
qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/share/q=
tcreator/qbs/lib/qbs/plugins/libqbs_qt_scanner.so
qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib/q=
bs/plugins/libqbs_cpp_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_cpp_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_qt_scanner.so
oscam-1.10+7974: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in w=
rong location: /usr/share/aurora/applications/settings/libaurora-app-settin=
gs.so
wxpython-2.9.5.0: wxpython: Files/directories were installed but not shipped
  /home
  /home/jenkins
  /home/jenkins/oe
  /home/jenkins/oe/shr-core-branches
  /home/jenkins/oe/shr-core-branches/shr-core
  /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc
chromium-29.0.1518.2: chromium: found library in wrong location: /usr/bin/c=
hrome/libffmpegsumo.so
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libff=
mpegsumo.so
lzip-1.14: The /usr/share/info/dir file is not meant to be shipped in a par=
ticular package.
atftp-0.7.1+gitAUTOINC+be3291a18c: atftp: Files/directories were installed =
but not shipped
  /etc
tracker-0.14.2: tracker: Files/directories were installed but not shipped
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.so
  /usr/lib/tracker-0.14/writeback-modules/libwriteback-taglib.la

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WfZ7S8PLGjBY9Voh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI4S4IACgkQN1Ujt2V2gByeNQCghpBlIqmm5PPXBIQDmdBVCUJt
2UoAoK6TZyutzzN4QUNs08AIZrGRW1HA
=33sG
-----END PGP SIGNATURE-----

--WfZ7S8PLGjBY9Voh--
