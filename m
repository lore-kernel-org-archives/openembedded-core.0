Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 575386A467
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 10:33:41 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1518026eek.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2013 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RKINb7a30QFva48LCyUMGL7hPAEU9/rkCMyvtgrX7lQ=;
	b=SdKN0JpWfGA4oTHStOh1/Jql+FTpWUoxoAM5KswaNc5/tMyyOP6aOexxtwNc5ukON0
	Uc4bZZ8GB6J2HNcd13wtcaF1d64jBiKaAyZC8+bS2W28+g5g2ZIqvvSZi40Vwf/qgQbU
	wo8+iwyoAqtdR74LI9xOrGNwt4PHLRSwEk7v6cQTm+xsKTSsB+KxBqIjcvqr2JXV8C2T
	qEJh0efpii7OFLbBV8PkiyUvHD+k97EGpo6b4ApAZE1KWtW2x4+fN1Nr3a5VTBK3JVS9
	vLYCg/MYfipVvKghirvP7UJqn4vgtEss5tWQOgVJTq4yYzQjsBHm4Osv+xncImgR38dj
	TF+A==
X-Received: by 10.14.203.8 with SMTP id e8mr6944947eeo.96.1372588421696;
	Sun, 30 Jun 2013 03:33:41 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm22436184eeh.11.2013.06.30.03.33.40 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 30 Jun 2013 03:33:41 -0700 (PDT)
Date: Sun, 30 Jun 2013 12:34:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20130630103422.GA3261@jama>
References: <1371254791-8168-1-git-send-email-net147@gmail.com>
	<51CD7C66.3020702@gmail.com>
	<CA+chaQcjeX_y3c7=MOFkp5jndMdo4xKcAmgA7yWjB_bsaBMb3g@mail.gmail.com>
	<9031819.zlCvcHI3ah@helios> <20130628124534.GN3261@jama>
	<51CD8650.7050806@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51CD8650.7050806@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4e.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Sun, 30 Jun 2013 10:33:41 -0000
X-Groupsio-MsgNum: 41206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yKkvi6mMqAM+MlBZ"
Content-Disposition: inline

--yKkvi6mMqAM+MlBZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2013 at 08:49:20PM +0800, Hongxu Jia wrote:
> On 06/28/2013 08:45 PM, Martin Jansa wrote:
> > On Fri, Jun 28, 2013 at 01:40:26PM +0100, Paul Eggleton wrote:
> >> On Friday 28 June 2013 14:28:56 Martin Jansa wrote:
> >>> It's failing in my world builds too now, you can see log here:
> >>> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.2013
> >>> 0627_214856.log/bitbake.log
> >>>
> >>> Cheers,
> >>>
> >>> On Fri, Jun 28, 2013 at 2:07 PM, Jonathan Liu <net147@gmail.com> wrot=
e:
> >>>> On 15/06/2013 10:06 AM, Jonathan Liu wrote:
> >>>>> The class is inheriting qmake2.bbclass which exports OE_QMAKE_QT_CO=
NFIG
> >>>>> pointing to the qt4 qconfig.pri when it should be pointing to the
> >>>>> qt4-embedded qconfig.pri.
> >>>>>
> >>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >>>>> ---
> >>>>>
> >>>>>    meta/classes/qt4e.bbclass | 1 +
> >>>>>    1 file changed, 1 insertion(+)
> >>>>>
> >>>>> diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
> >>>>> index de2a68d..13b1050 100644
> >>>>> --- a/meta/classes/qt4e.bbclass
> >>>>> +++ b/meta/classes/qt4e.bbclass
> >>>>> @@ -9,6 +9,7 @@ QT_LIBINFIX =3D "E"
> >>>>>
> >>>>>    # override variables set by qmake-base to compile Qt/Embedded ap=
ps
> >>>>>    #
> >>>>>    export QMAKESPEC =3D "${STAGING_DATADIR}/${QT_DIR_**
> >>>>>
> >>>>> NAME}/mkspecs/${TARGET_OS}-oe-**g++"
> >>>>> +export OE_QMAKE_QT_CONFIG =3D "${STAGING_DATADIR}/${QT_DIR_**
> >>>>> NAME}/mkspecs/qconfig.pri"
> >>>>>
> >>>>>    export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/${QT_DIR_**NAME=
}"
> >>>>>    export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
> >>>>>    export OE_QMAKE_LIBS_QT =3D "qt"
> >>>> Hi Saul,
> >>>>
> >>>> Do you have a log of the error you had building qt4-embedded with th=
is
> >>>> patch?
> >> FWIW, I see the same error without this patch if I build qt4-embedded =
after
> >> building qt4-x11, so I don't know if this patch is really related to t=
he
> >> problem or not.
> > It was building fine in world builds until 1-2 weeks ago, but it's
> > possible that I was just lucky to have it in right order.
> >
>=20
> Repoduce the bug by STEPS:
>=20
> bitbake qt4-x11-free
> bitbake qt4-embedded
> and build qt4-embedded failed.
>=20
> //Hongxu

There is another qt4 issue which causes cmake-native to fail or was
cmake changed to require qt4 installed on host?


| CMake Warning at Modules/FindQt4.cmake:657 (message):
|   /usr/bin/qmake reported QT_INSTALL_LIBS as "/usr/lib/x86_64-linux-gnu" =
but
|   QtCore could not be found there.  Qt is NOT installed correctly for the
|   target build environment.
| Call Stack (most recent call first):
|   Tests/RunCMake/CMakeLists.txt:79 (find_package)
|=20
|=20
| -- Looking for Q_WS_X11
| -- Looking for Q_WS_X11 - not found
| -- Looking for Q_WS_WIN
| -- Looking for Q_WS_WIN - not found
| -- Looking for Q_WS_QWS
| -- Looking for Q_WS_QWS - not found
| -- Looking for Q_WS_MAC
| -- Looking for Q_WS_MAC - not found
| CMake Error at Modules/FindQt4.cmake:1032 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/RunCMake/CMakeLists.txt:79 (find_package)
|=20
|=20
| CMake Error at Modules/FindQt4.cmake:1037 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/RunCMake/CMakeLists.txt:79 (find_package)
|=20
|=20
| CMake Error at Modules/FindQt4.cmake:1040 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/RunCMake/CMakeLists.txt:79 (find_package)
|=20
|=20
| CMake Warning at Modules/FindQt4.cmake:657 (message):
|   /usr/bin/qmake reported QT_INSTALL_LIBS as "/usr/lib/x86_64-linux-gnu" =
but
|   QtCore could not be found there.  Qt is NOT installed correctly for the
|   target build environment.
| Call Stack (most recent call first):
|   Tests/CMakeLists.txt:263 (find_package)
|=20
|=20
| CMake Error at Modules/FindQt4.cmake:1032 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/CMakeLists.txt:263 (find_package)
|=20
|=20
| CMake Error at Modules/FindQt4.cmake:1037 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/CMakeLists.txt:263 (find_package)
|=20
|=20
| CMake Error at Modules/FindQt4.cmake:1040 (set_property):
|   set_property could not find TARGET Qt4::QtCore.  Perhaps it has not yet
|   been created.
| Call Stack (most recent call first):
|   Tests/CMakeLists.txt:263 (find_package)
|=20
|=20
| -- Could NOT find Qt4 (missing:  QT_MOC_EXECUTABLE QT_RCC_EXECUTABLE QT_U=
IC_EXECUTABLE QT_INCLUDE_DIR QT_LIBRARY_DIR QT_QTCORE_LIBRARY) (found versi=
on "4.8.1")
| -- Performing Test run_pic_test
| -- Performing Test run_pic_test - Success
| -- Configuring incomplete, errors occurred!
| ---------------------------------------------
| Error when bootstrapping CMake:
| Problem while running initial CMake
| ---------------------------------------------
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-linux/cmake-native/2=
=2E8.11.1-r0/temp/log.do_configure.19730)
NOTE: recipe cmake-native-2.8.11.1-r0: task do_configure: Failed


>=20
>=20
>=20
>=20
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yKkvi6mMqAM+MlBZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlHQCa4ACgkQN1Ujt2V2gBzaawCdHDOiG/AL42Rwa+XM3HZjGRTn
RfEAoJzJtoonNdG/5TZoNqE1w5/FIwDe
=pVey
-----END PGP SIGNATURE-----

--yKkvi6mMqAM+MlBZ--
