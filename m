Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RPrFM-0001mO-3f
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 08:46:28 +0100
Received: by bkbzs2 with SMTP id zs2so5776636bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Nov 2011 23:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3CekJrFMyHOLJ4PhN4DW/V11/n+XCKkvnZbHsG8QHmY=;
	b=mWbNa5YNo0cm7Eo8lecMfO2T8gl24EOIQjWN48EowGA3Pt1BFVnec9dYasq/IBtWYh
	JvEm6scYaawo+V0fBuRbFWgV3K9hmqyHUQNYFn8OXe3ruSWLzRhHb1zcMP0vMokYTa26
	KfbjgfMrRCPKqqS3uc5jfI71tEWEOn6r6DSfQ=
Received: by 10.205.124.144 with SMTP id go16mr10430148bkc.119.1321256396976; 
	Sun, 13 Nov 2011 23:39:56 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu17sm30456485bkc.9.2011.11.13.23.39.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Nov 2011 23:39:55 -0800 (PST)
Date: Mon, 14 Nov 2011 08:39:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111114073943.GA3445@jama.jama.net>
References: <cover.1321244755.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1321244755.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Mon, 14 Nov 2011 07:46:28 -0000
X-Groupsio-MsgNum: 12431
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CE+1k2dSO48ffgeK"
Content-Disposition: inline

--CE+1k2dSO48ffgeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2011 at 08:27:50PM -0800, Saul Wold wrote:
> Richard,
>=20
> This set has been build tested and reviewed.  I did have to update
> bitbake.conf for both then gnu-config and base.bblcass changes to=20
> modify ASSUME_PROVIDED, please review this.

Reported on IRC, but better to say it here too I guess:

08:36:32 < JaMa|off> sgw: all thumb patches somehow lost the important
part ARM_INSTRUCTION_SET =3D "arm"
08:37:02 < JaMa|off> sgw: so your CONSOLIDATED PULL has only PR bumps
while jansa/pull had ARM_INSTRUCTION_SET and PR bumps
08:38:07 < JaMa|off> sgw: and subversion-native should work without
adding it to ASSUME_PROVIDED :/

>=20
> Thanks
> 	Sau!
>=20
> The following changes since commit a8ed4fcd79f6283c1d45f347dce894d7841839=
00:
>=20
>   xinit: rdepends on util-linux-mcookie to avoid brining whole util-linux=
 (2011-11-11 11:00:56 +0000)
>=20
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/stage
>=20
> Martin Jansa (13):
>   libatomics-ops: force ARM mode
>   pulseaudio-0.9.23: force ARM mode
>   aspell: force ARM mode
>   webkit-gtk: force arm mode to work around binutils segfault
>   subversion: add 1.7.0 with native support and negative D_P for now
>   base.bbclass: add subversion-native to DEPENDS if there is svn:// in
>     SRC_URI
>   time: rename files dir to time-1.7 for faster lookup
>   time: drop default S and 2 useless comments
>   time: use u-a for time, conflicts with busybox
>   util-linux: use u-a for flock and blockdev, conflicts with busybox
>   util-linux: add missing u-a calls for setsid chrt
>   util-linux: bump PR after u-a changes
>   kbd: use u-a for chvt, deallocvt, fgconssole, openvt, conflicts with
>     busybox
>=20
> Otavio Salvador (1):
>   dhcp: generate initial leases files for server
>=20
> Saul Wold (5):
>   file: update to 5.09
>   gnu-config: update to git HEAD
>   boost: Update to 1.47.0 & Cleanup
>   bitbake.conf: Update ASSUME_PROVIDED
>   distro_tracking: Refect Recipe Updates & Status
>=20
> Simon Busch (1):
>   qt4-x11-free: bring back pkg-config fixups
>=20
> Xiaofeng Yan (1):
>   directfb: update to 1.4.15
>=20
>  meta/classes/base.bbclass                          |    8 +-
>  meta/conf/bitbake.conf                             |    7 +-
>  .../conf/distro/include/distro_tracking_fields.inc |   49 ++--
>  meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +-
>  meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
>  meta/recipes-core/kbd/kbd_1.15.2.bb                |   29 ++-
>  meta/recipes-core/util-linux/util-linux.inc        |   14 +-
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>  .../file/file/fix_version_check.patch              |   21 ++
>  .../file/{file_5.04.bb =3D> file_5.09.bb}            |    9 +-
>  .../gnu-config/config-guess-uclibc.patch           |  145 +++++------
>  .../{gnu-config_20080123.bb =3D> gnu-config_git.bb}  |   15 +-
>  .../subversion/subversion-1.7.0/libtool2.patch     |   15 ++
>  .../subversion/subversion_1.7.0.bb                 |   37 +++
>  .../time/{files =3D> time-1.7}/debian.patch          |    0
>  meta/recipes-extended/time/time.inc                |   10 +
>  meta/recipes-extended/time/time_1.7.bb             |    5 +-
>  .../{directfb_1.4.12.bb =3D> directfb_1.4.15.bb}     |    9 +-
>  .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 ++--
>  .../pulseaudio/libatomics-ops_1.2.bb               |    2 +-
>  .../pulseaudio/pulseaudio_0.9.23.bb                |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc               |   16 ++-
>  meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
>  meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    2 +-
>  meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
>  .../boost/boost-jam-native_3.1.18.bb               |    8 -
>  .../boost/{boost-36.inc =3D> boost.inc}              |   42 +++-
>  .../boost/{boost_1.44.0.bb =3D> boost_1.47.0.bb}     |   13 +-
>  .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 --------------=
---
>  .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
>  meta/recipes-support/boost/files/gcc41.patch       |   16 --
>  meta/recipes-support/boost/files/gcc43.patch       |  258 --------------=
------
>  .../recipes-support/boost/files/linux-uclibc.patch |   12 -
>  .../boost/files/unit_test_log10f.patch             |   22 --
>  34 files changed, 333 insertions(+), 757 deletions(-)
>  create mode 100644 meta/recipes-devtools/file/file/fix_version_check.pat=
ch
>  rename meta/recipes-devtools/file/{file_5.04.bb =3D> file_5.09.bb} (79%)
>  rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb =3D> gnu=
-config_git.bb} (73%)
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/lib=
tool2.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
>  rename meta/recipes-extended/time/{files =3D> time-1.7}/debian.patch (10=
0%)
>  rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb =3D> directfb_=
1.4.15.bb} (63%)
>  delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
>  delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.18.bb
>  rename meta/recipes-support/boost/{boost-36.inc =3D> boost.inc} (88%)
>  rename meta/recipes-support/boost/{boost_1.44.0.bb =3D> boost_1.47.0.bb}=
 (66%)
>  delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.patch
>  delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc_ato=
micity.patch
>  delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
>  delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
>  delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.patch
>  delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f.pat=
ch
>=20
> --=20
> 1.7.6.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--CE+1k2dSO48ffgeK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Axb8ACgkQN1Ujt2V2gBytfQCgnGpaVkgsSTsPZSXM7SArsOyh
a3QAoI90uC1/aPClDIRTZgoQ1M/rmhg5
=I5H1
-----END PGP SIGNATURE-----

--CE+1k2dSO48ffgeK--
