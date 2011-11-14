Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQ06N-0002kR-Mi
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 18:13:47 +0100
Received: by bkbzs2 with SMTP id zs2so6288020bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 09:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=37dmscke+U8sJA2YLYlgMgyMu2+lNE3qYFoKXIb60gw=;
	b=pDRF+0zO2gt4pDa2L8ifA46LyIbtE/DQme1YKSkOFfYHMheqFUTIdg5UD+w+slIXhu
	dkpuiUKZ4sQC/Tz+6Arxi733Yl1MZsoh8DVeZ181VNrfuWTVM7bSE33lbE/YMrxgmKIJ
	46P1vt/2TQN1O9RyZGx1YK4DotRngG7nZK5KU=
Received: by 10.205.114.65 with SMTP id ez1mr19859318bkc.99.1321290446340;
	Mon, 14 Nov 2011 09:07:26 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm33495507bkd.7.2011.11.14.09.07.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Nov 2011 09:07:25 -0800 (PST)
Date: Mon, 14 Nov 2011 18:07:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111114170723.GC311@jama.jama.net>
References: <cover.1321244755.git.sgw@linux.intel.com>
	<20111114073943.GA3445@jama.jama.net>
	<4EC1489F.60304@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4EC1489F.60304@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/21] Updates and Fixes
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
X-List-Received-Date: Mon, 14 Nov 2011 17:13:47 -0000
X-Groupsio-MsgNum: 12443
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline

--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 08:58:07AM -0800, Saul Wold wrote:
> On 11/13/2011 11:39 PM, Martin Jansa wrote:
> > On Sun, Nov 13, 2011 at 08:27:50PM -0800, Saul Wold wrote:
> >> Richard,
> >>
> >> This set has been build tested and reviewed.  I did have to update
> >> bitbake.conf for both then gnu-config and base.bblcass changes to
> >> modify ASSUME_PROVIDED, please review this.
> >
> > Reported on IRC, but better to say it here too I guess:
> >
> > 08:36:32<  JaMa|off>  sgw: all thumb patches somehow lost the important
> > part ARM_INSTRUCTION_SET =3D "arm"
> > 08:37:02<  JaMa|off>  sgw: so your CONSOLIDATED PULL has only PR bumps
> > while jansa/pull had ARM_INSTRUCTION_SET and PR bumps
> Not sure what happened here, I will double check my contents and rebase=
=20
> as needed.
>=20
> > 08:38:07<  JaMa|off>  sgw: and subversion-native should work without
> > adding it to ASSUME_PROVIDED :/
> >
> I would like to know what your setup is and how your testing this,=20
> because every time I tried without the ASSUME_PROVIDED change, I got a=20
> circular dependency.

I'm using SHR distribution with this stack of layers:

meta-jama         =3D "master:6d89b5a42be12ce76ef0d87935d8de12ca3f1b4f"
meta-shr
meta-aurora
meta-fso          =3D "master:ec12944ae05f6a6efc28db2d8bbad88277387441"
meta-efl
meta-oe
meta-gnome
meta-gpe          =3D "shr:94aa85e1e62d32eff0cee22ffa9a0f1fbcdf9d2c"
meta-nokia
meta-htc
meta-palm
meta-openmoko
meta-samsung      =3D "master:ec12944ae05f6a6efc28db2d8bbad88277387441"
meta-handheld     =3D "jansa/spitz:5136fd456569a254b3203545af3c98d643e8b681"
meta              =3D "jansa/test:b550e4c271977c3cb9245d6106c9631b66f78a46"

But I don't see any possible _svn.bb recipe in subversion-native dependency=
 tree,
how did you notice there is circular dependency? Did bitbake say that and t=
hen failed
to find where?

I'll try to setup some builddir with only oe-core, but dayjob is crazy 7/12=
=20
lately so I have no idea when I'll find time for that :/.

Regards,

>=20
> Sau!
>=20
>=20
> >>
> >> Thanks
> >> 	Sau!
> >>
> >> The following changes since commit a8ed4fcd79f6283c1d45f347dce894d7841=
83900:
> >>
> >>    xinit: rdepends on util-linux-mcookie to avoid brining whole util-l=
inux (2011-11-11 11:00:56 +0000)
> >>
> >> are available in the git repository at:
> >>    git://git.openembedded.org/openembedded-core-contrib sgw/stage
> >>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log=
/?h=3Dsgw/stage
> >>
> >> Martin Jansa (13):
> >>    libatomics-ops: force ARM mode
> >>    pulseaudio-0.9.23: force ARM mode
> >>    aspell: force ARM mode
> >>    webkit-gtk: force arm mode to work around binutils segfault
> >>    subversion: add 1.7.0 with native support and negative D_P for now
> >>    base.bbclass: add subversion-native to DEPENDS if there is svn:// in
> >>      SRC_URI
> >>    time: rename files dir to time-1.7 for faster lookup
> >>    time: drop default S and 2 useless comments
> >>    time: use u-a for time, conflicts with busybox
> >>    util-linux: use u-a for flock and blockdev, conflicts with busybox
> >>    util-linux: add missing u-a calls for setsid chrt
> >>    util-linux: bump PR after u-a changes
> >>    kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
> >>      busybox
> >>
> >> Otavio Salvador (1):
> >>    dhcp: generate initial leases files for server
> >>
> >> Saul Wold (5):
> >>    file: update to 5.09
> >>    gnu-config: update to git HEAD
> >>    boost: Update to 1.47.0&  Cleanup
> >>    bitbake.conf: Update ASSUME_PROVIDED
> >>    distro_tracking: Refect Recipe Updates&  Status
> >>
> >> Simon Busch (1):
> >>    qt4-x11-free: bring back pkg-config fixups
> >>
> >> Xiaofeng Yan (1):
> >>    directfb: update to 1.4.15
> >>
> >>   meta/classes/base.bbclass                          |    8 +-
> >>   meta/conf/bitbake.conf                             |    7 +-
> >>   .../conf/distro/include/distro_tracking_fields.inc |   49 ++--
> >>   meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +-
> >>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
> >>   meta/recipes-core/kbd/kbd_1.15.2.bb                |   29 ++-
> >>   meta/recipes-core/util-linux/util-linux.inc        |   14 +-
> >>   meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
> >>   .../file/file/fix_version_check.patch              |   21 ++
> >>   .../file/{file_5.04.bb =3D>  file_5.09.bb}            |    9 +-
> >>   .../gnu-config/config-guess-uclibc.patch           |  145 +++++------
> >>   .../{gnu-config_20080123.bb =3D>  gnu-config_git.bb}  |   15 +-
> >>   .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++
> >>   .../subversion/subversion_1.7.0.bb                 |   37 +++
> >>   .../time/{files =3D>  time-1.7}/debian.patch          |    0
> >>   meta/recipes-extended/time/time.inc                |   10 +
> >>   meta/recipes-extended/time/time_1.7.bb             |    5 +-
> >>   .../{directfb_1.4.12.bb =3D>  directfb_1.4.15.bb}     |    9 +-
> >>   .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 ++--
> >>   .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
> >>   .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
> >>   meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 ++-
> >>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
> >>   meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 +-
> >>   meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
> >>   .../boost/boost-jam-native_3.1.18.bb               |    8 -
> >>   .../boost/{boost-36.inc =3D>  boost.inc}              |   42 +++-
> >>   .../boost/{boost_1.44.0.bb =3D>  boost_1.47.0.bb}     |   13 +-
> >>   .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 ----------=
-------
> >>   .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
> >>   meta/recipes-support/boost/files/gcc41.patch       |   16 --
> >>   meta/recipes-support/boost/files/gcc43.patch       |  258 ----------=
----------
> >>   .../recipes-support/boost/files/linux-uclibc.patch |   12 -
> >>   .../boost/files/unit_test_log10f.patch             |   22 --
> >>   34 files changed, 333 insertions(+), 757 deletions(-)
> >>   create mode 100644 meta/recipes-devtools/file/file/fix_version_check=
=2Epatch
> >>   rename meta/recipes-devtools/file/{file_5.04.bb =3D>  file_5.09.bb} =
(79%)
> >>   rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb =3D>=
  gnu-config_git.bb} (73%)
> >>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0=
/libtool2.patch
> >>   create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0=
=2Ebb
> >>   rename meta/recipes-extended/time/{files =3D>  time-1.7}/debian.patc=
h (100%)
> >>   rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb =3D>  dire=
ctfb_1.4.15.bb} (63%)
> >>   delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
> >>   delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.1=
8.bb
> >>   rename meta/recipes-support/boost/{boost-36.inc =3D>  boost.inc} (88=
%)
> >>   rename meta/recipes-support/boost/{boost_1.44.0.bb =3D>  boost_1.47.=
0.bb} (66%)
> >>   delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.pat=
ch
> >>   delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc=
_atomicity.patch
> >>   delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
> >>   delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
> >>   delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.pat=
ch
> >>   delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f=
=2Epatch
> >>
> >> --
> >> 1.7.6.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7BSssACgkQN1Ujt2V2gByuqQCfUYx8UkFq6uo6VYDrq5Z+sgCc
rHMAoIH7aL3b6J9D8zZ4VWOdQwp+qwwv
=2IZg
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
