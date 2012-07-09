Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SoAsM-0005JJ-5y
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 12:07:30 +0200
Received: by weyr6 with SMTP id r6so4284165wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OK+iEGAO6B7sE5esfySktqrJvSMVFybjEfGL1UZCefQ=;
	b=CADNWMRJHlffGh0dpXq9R4Ql2yTbz4r7YoOsAqaOXfNMH8nEELGWng3BnNMiQ1fyzK
	x4uqD+1a39zlpMkyGw50xyL48AKa6jskhl8AEukWYUsiAOsoOanM0LHtuxT7xPjMcVGA
	JtGAPxyCQ5t+m6Ehmna48BBlVCL1ekYd89hN12Xq83Ti4ifyNYhr6tsvlJkJzNrrdxzz
	l04IUAXId8vUHjVC2XZNJODzZ7zDbK6+9LI3fH9P/39Utgwac6mazIy8K69TtAB7PKOT
	+ZheBudvn62sywZ4hKSznP+o0xoqVpGuYOh96U0ZMf67WemKuz40sfUSBr6Q371JpAaM
	m98Q==
Received: by 10.216.217.229 with SMTP id i79mr13577418wep.125.1341827780642;
	Mon, 09 Jul 2012 02:56:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o2sm30458093wiz.11.2012.07.09.02.56.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 02:56:19 -0700 (PDT)
Date: Mon, 9 Jul 2012 11:56:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120709095616.GC6308@jama.jama.net>
References: <cover.1341763345.git.raj.khem@gmail.com>
	<CAMKF1soHqgDKwCFBhJm62JhYK56eie2VzGFRt3p7WGeGHVHJ1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soHqgDKwCFBhJm62JhYK56eie2VzGFRt3p7WGeGHVHJ1A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH V2 00/14] eglibc 2.16
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
X-List-Received-Date: Mon, 09 Jul 2012 10:07:30 -0000
X-Groupsio-MsgNum: 24875
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6zdv2QT/q3FMhpsV"
Content-Disposition: inline

--6zdv2QT/q3FMhpsV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 08, 2012 at 09:26:12PM -0700, Khem Raj wrote:
> On Sun, Jul 8, 2012 at 9:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > V2:
> >
> > Additionally, changed gcc to use git fetcher
> > update E5500/E6500 patches for gcc and binutils (backported from mainli=
ne)
> > images form p5020ds 32/64 bit built fine. (btw. it does not build with =
eglibc-2.15)
> > Updated eglibc rpc patch needed for cross build from scratch
> > Updates the gets patch for busybox now its a backport instead of
> > home grown.
> >
> > bitbake world works clean for ppc/x86/x86_64 , for mips and arm
> > the failures are prexisting.
> > mips - webkit and pseudo fail to build
> > arm - guile-2.0 and pseudo fail to build
> >
> > V1:
> > This patch adds eglibc 2.16 recipes. I was able to build world
> > on x86 except perf which was failing with 2.15 as well.
> >
> > I have also build and run core-image-sato on all qemus
> >
> > I did not remove 2.15 to allow some soak in time.
> >
> > The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a4192=
6840:
> >
> >   bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)
> >
> > are available in the git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib kraj/eglibc-2.16
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Dkraj/eglibc-2.16
> >
> > Khem Raj (19):
> >   mirrors: Add debian archive snapshot mirrors to search list
> >   gdb: Replace struct siginfo with proper siginfo_t
> >   busybox: Include sys/resource.h for rusage definition
> >   coreutils: Fix build with eglibc 2.16
> >   diffutils: Fix build with eglibc 2.16
> >   udev: Fix build with eglibc 2.16
> >   gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16
> >   bison: Fix for gets being removed from eglibc 2.16
> >   grub,guile,cpio,tar,wget: Fix gnulib for absense of gets in eglibc
> >   boost: Upgrade recipe to 1.50.0
> >   puzzles: Fix checksums
> >   valgrind: Fix build with eglibc 2.16
> >   libpam: Fix build with eglibc 2.16
> >   gcc-cross-initial.inc: Use BFD ld as default always
> >   gcc: Switch to git SRC_URI
>=20
> more testing shows that switching to git is causing do_unpack tasks
> from various gcc recipes to have
> different checksums and that triggers rerun of do_patch do_unpack
> tasks in shared workdir and does not
> go well. so I pulled the above commit out for now until we sort the
> real reason why this is happening by just switching the fetcher
>=20
> second problem is that it messed the upgrade path since 's'vn sorts
> after 'g'it and they appear in PV

yes wait with svn->git switch for 4.7.2 release and corresponding SRCREV
bump

or bump PE in gcc recipes

or bump PR in a lot of packages which has runtime dependency on
libstdc++ or libgcc, but this doesn't fix upgrade path for gcc recipes
already installed on target :/.

in my tmpdir it is:
vagalume vim x11vnc xchat xinput-calibrator xserver-xorg xz udev
systemd tar sylpheed util-linux shadow samba rsync qt4-x11-free speex
sysstat pidgin pulseaudio procps polkit postgresql mysql5 php
qt-mobility-x11 openssh numptyphysics navit mplayer2 monav mesa-dri
pango powertop poppler mcnavi mtd-utils net-tools nfs-utils abiword curl
gzip mc mbuffer m4 matchbox-panel-2 matchbox-keyboard ltrace lttng-ust
live555 links links-x11 zlib webkit-gtk talloc libtheora tiff gawk gtk+3
ntp libsndfile1 icu  kmod libnl perl libsexy librsvg libproxy pixman
avahi sqlite libffi gstreamer pangomm gtk+ gst-plugins-base
gst-plugins-good expat cairo cairomm fltk gdbm gettext libglade glib-2.0
gmp imlib2 boost webkit-efl flac libpcap ode libvpx vte hdparm gwaterpas
qfsodbusxml2cpp python-pygtk python-gst python libvorbis sqlite
libsigc++-2.0 libsdl pth popt gpsd libgpewidget gnutls libfso-qt
libevent libav iputils iptables iproute2 imagemagick hdparm id3lib gtkmm
gtkmathview less aspell libass libdrm emotion evolution-data-server
gnuplot groff grep gnome-keyring git gdb fsoaudiod findutils file
evopedia evas ethumb epdfview epdf gst-plugin-bluetooth gst-plugins-ugly
aurora-daemon alsa-utils bash bind bluez-hcidump
claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl
coreutils dosfstools e-wm e2fsprogs e-wm edje eina elfutils emtooth2
enchant glibmm openssl sqlite3 tremor eglibc gtk-engines bluez4
gstreamer gtkhtml2 dconf-qt alsa-lib claws-mail libgsf libetpan fbreader
firefox libidl orbit2

Cheers,

>=20
> latest patch to switch the URI is here
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/mi=
sc&id=3D81b8073a82fd480e6a5d011a3c8a28ad5fbe542f
>=20
> anyone ideas ?
>=20
> >   binutils: Backport the e5500/e6500 patches from mainline
> >   gcc: Refresh support for fsl E5500/E6500
> >   qemu: Explicitly add --disable-gl-accel when gl is not enabled
> >   eglibc: Add recipes for 2.16 release
> >
> >  meta/classes/mirrors.bbclass                       |    4 +-
> >  meta/recipes-bsp/grub/grub-1.99/remove-gets.patch  |   20 +
> >  meta/recipes-bsp/grub/grub_1.99.bb                 |    3 +-
> >  .../busybox/busybox-1.19.4/sys_resource.patch      |   99 +++
> >  meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
> >  .../coreutils/coreutils-8.14/remove-gets.patch     |   23 +
> >  meta/recipes-core/coreutils/coreutils_8.14.bb      |    3 +-
> >  .../eglibc/cross-localedef-native_2.16.bb          |   44 +
> >  .../eglibc/eglibc-2.16/GLRO_dl_debug_mask.patch    |  108 +++
> >  .../eglibc/eglibc-2.16/IO-acquire-lock-fix.patch   |   17 +
> >  .../eglibc-svn-arm-lowlevellock-include-tls.patch  |   21 +
> >  .../eglibc_fix_findidx_parameters.patch            |   38 +
> >  .../eglibc/eglibc-2.16/generate-supported.mk       |   11 +
> >  .../eglibc/eglibc-2.16/initgroups_keys.patch       |   20 +
> >  .../eglibc/eglibc-2.16/ld-search-order.patch       |   56 ++
> >  .../eglibc/eglibc-2.16/mips-rld-map-check.patch    |   26 +
> >  .../eglibc/eglibc-2.16/multilib_readlib.patch      |   17 +
> >  .../recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch |  538 ++++++++++++
> >  .../eglibc/eglibc-2.16/ppc-sqrt_finite.patch       |  112 +++
> >  .../eglibc/eglibc-2.16/ppc_slow_ieee754_sqrt.patch |  123 +++
> >  .../eglibc/eglibc-2.16/rpc-bootstrap.patch         |   63 ++
> >  .../eglibc-2.16/use-sysroot-cxx-headers.patch      |   42 +
> >  meta/recipes-core/eglibc/eglibc-initial_2.16.bb    |    6 +
> >  meta/recipes-core/eglibc/eglibc-locale_2.16.bb     |    1 +
> >  meta/recipes-core/eglibc/eglibc_2.16.bb            |  146 ++++
> >  .../gettext/gettext-0.18.1.1/remove_gets.patch     |   58 ++
> >  meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
> >  meta/recipes-core/udev/udev/include_resource.patch |   31 +
> >  meta/recipes-core/udev/udev_164.bb                 |    7 +-
> >  meta/recipes-devtools/binutils/binutils-2.22.inc   |    2 +-
> >  .../binutils/binutils/binutils-powerpc-e5500.patch |  918 ++++++++++++=
+++++++-
> >  .../recipes-devtools/bison/bison/remove-gets.patch |   20 +
> >  meta/recipes-devtools/bison/bison_2.5.bb           |    6 +-
> >  meta/recipes-devtools/gcc/gcc-4.7.inc              |   17 +-
> >  .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +++
> >  .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++++++++=
++++
> >  ...pc-e5500.patch =3D> ppce5500-e6500-support.patch} |  560 ++++++++--=
--
> >  .../gcc/gcc-4.7/rs6000-tables.patch                |  135 +++
> >  meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
> >  meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
> >  meta/recipes-devtools/gdb/gdb.inc                  |    1 +
> >  meta/recipes-devtools/gdb/gdb/siginfo_t.patch      |  403 +++++++++
> >  .../recipes-devtools/guile/files/remove-gets.patch |   23 +
> >  meta/recipes-devtools/guile/guile_2.0.5.bb         |    3 +-
> >  meta/recipes-devtools/m4/m4-1.4.16.inc             |    6 +-
> >  meta/recipes-devtools/m4/m4/remove-gets.patch      |   21 +
> >  meta/recipes-devtools/qemu/qemu.inc                |    2 +-
> >  .../valgrind-3.7.0/configure-with-glibc-2.16.patch |   32 +
> >  meta/recipes-devtools/valgrind/valgrind_3.7.0.bb   |    6 +-
> >  .../augeas/augeas/remove-gets.patch                |   20 +
> >  meta/recipes-extended/augeas/augeas_0.10.0.bb      |    4 +-
> >  .../cpio/cpio-2.11/remove-gets.patch               |   20 +
> >  meta/recipes-extended/cpio/cpio_2.11.bb            |    5 +-
> >  .../diffutils/diffutils-3.2/remove-gets.patch      |   22 +
> >  meta/recipes-extended/diffutils/diffutils_3.2.bb   |    6 +-
> >  .../pam/libpam/include-sys-resource.patch          |   12 +
> >  meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 +-
> >  .../tar/tar-1.26/remove-gets.patch                 |   20 +
> >  meta/recipes-extended/tar/tar_1.26.bb              |    5 +-
> >  .../wget/wget-1.13.4/remove-gets.patch             |   23 +
> >  meta/recipes-extended/wget/wget_1.13.4.bb          |    3 +-
> >  meta/recipes-sato/puzzles/puzzles_r9561.bb         |   11 +-
> >  .../boost/{boost_1.49.0.bb =3D> boost_1.50.0.bb}     |    5 +-
> >  .../gnutls/gnutls/remove-gets.patch                |   41 +
> >  meta/recipes-support/gnutls/gnutls_2.12.20.bb      |    3 +-
> >  65 files changed, 4629 insertions(+), 248 deletions(-)
> >  create mode 100644 meta/recipes-bsp/grub/grub-1.99/remove-gets.patch
> >  create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/sys_resour=
ce.patch
> >  create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/remove-g=
ets.patch
> >  create mode 100644 meta/recipes-core/eglibc/cross-localedef-native_2.1=
6.bb
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/GLRO_dl_debug_=
mask.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/IO-acquire-loc=
k-fix.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc-svn-arm=
-lowlevellock-include-tls.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/eglibc_fix_fin=
didx_parameters.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/etc/ld.so.conf
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/generate-suppo=
rted.mk
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/initgroups_key=
s.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ld-search-orde=
r.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/mips-rld-map-c=
heck.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/multilib_readl=
ib.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc-sqrt_finit=
e.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/ppc_slow_ieee7=
54_sqrt.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/rpc-bootstrap.=
patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/use-sysroot-cx=
x-headers.patch
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-initial_2.16.bb
> >  create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.16.bb
> >  create mode 100644 meta/recipes-core/eglibc/eglibc_2.16.bb
> >  create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/remove_g=
ets.patch
> >  create mode 100644 meta/recipes-core/udev/udev/include_resource.patch
> >  create mode 100644 meta/recipes-devtools/bison/bison/remove-gets.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reser=
vation.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
> >  rename meta/recipes-devtools/gcc/gcc-4.7/{powerpc-e5500.patch =3D> ppc=
e5500-e6500-support.patch} (41%)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.pat=
ch
> >  create mode 100644 meta/recipes-devtools/gdb/gdb/siginfo_t.patch
> >  create mode 100644 meta/recipes-devtools/guile/files/remove-gets.patch
> >  create mode 100644 meta/recipes-devtools/m4/m4/remove-gets.patch
> >  create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/confi=
gure-with-glibc-2.16.patch
> >  create mode 100644 meta/recipes-extended/augeas/augeas/remove-gets.pat=
ch
> >  create mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.pa=
tch
> >  create mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remov=
e-gets.patch
> >  create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resour=
ce.patch
> >  create mode 100644 meta/recipes-extended/tar/tar-1.26/remove-gets.patch
> >  create mode 100644 meta/recipes-extended/wget/wget-1.13.4/remove-gets.=
patch
> >  rename meta/recipes-support/boost/{boost_1.49.0.bb =3D> boost_1.50.0.b=
b} (53%)
> >  create mode 100644 meta/recipes-support/gnutls/gnutls/remove-gets.patch
> >
> > --
> > 1.7.9.5
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6zdv2QT/q3FMhpsV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/6qsAACgkQN1Ujt2V2gBzB6gCgj27eNw2fyixnvze2CKtx03ha
6/gAoK/Wb3nMX0g7yM5caMKf+pRqQJTX
=y4gY
-----END PGP SIGNATURE-----

--6zdv2QT/q3FMhpsV--
