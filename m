Return-Path: <christrobridge@hotmail.com>
Received: from DUB004-OMC3S12.hotmail.com (dub004-omc3s12.hotmail.com
	[157.55.2.21])
	by mail.openembedded.org (Postfix) with ESMTP id D5C7D70179
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 07:58:14 +0000 (UTC)
Received: from DUB130-W36 ([157.55.2.7]) by DUB004-OMC3S12.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Mon, 29 Feb 2016 23:58:14 -0800
X-TMN: [UidAPs3nkV5Ol9xbNPFHi1NNQHDlWASp]
X-Originating-Email: [christrobridge@hotmail.com]
Message-ID: <DUB130-W36E2C873DA9A2A4B6B6A73DABB0@phx.gbl>
From: Chris Trobridge <christrobridge@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 1 Mar 2016 07:58:14 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2016 07:58:14.0356 (UTC)
	FILETIME=[1B748140:01D17390]
Subject: [oe] [PATCH] gpsd: Fix build when static libs disabled
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
X-List-Received-Date: Tue, 01 Mar 2016 07:58:15 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/10=
6230.html=0A=
=0A=
> Fix this build error:=0A=
>=A0SCons Error: no such option: --disable-static=0A=
>=A0Signed-off-by: Maxin B. John <maxin.john at intel.com>=0A=
>=A0---=0A=
>=A0=A0meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 1 +=0A=
>=A0=A01 file changed=2C 1 insertion(+)=0A=
>=A0diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/rec=
ipes-navigation/gpsd/gpsd_3.14.bb=0A=
>=A0index ff268b3..a300595 100644=0A=
>=A0--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb=0A=
>=A0+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb=0A=
>=A0@@ -47=2C6 +47=2C7 @@ EXTRA_OESCONS =3D " \=0A=
>=A0=A0 =A0 =A0systemd=3D'${SYSTEMD_OESCONS}' \=0A=
>=A0=A0 =A0 =A0${EXTRA_OECONF} \=0A=
>=A0=A0"=0A=
>=A0+DISABLE_STATIC =3D ""=0A=
>=A0=A0& this cannot be used=2C because then chrpath is not found and only =
static lib is built=0A=
>=A0=A0& target=3D${HOST_SYS}=0A=
>=A0=A0=0A=
>=A0--=A0=0A=
>=A02.4.0=0A=
=0A=
While this fixes the build=2C is it just fixing the symptom?=0A=
=0A=
I have a patch that copies the fix in:=0A=
=0A=
http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/10=
6251.html=0A=
=0A=
That is: use=A0EXTRA_CONF_PACKAGECONFIG instead of EXTRA_OECONF=2C as menti=
oned the above diff.=0A=
=0A=
This prevents the option being pulled in in the first place=2C which ought =
to be a more general solution.=0A=
=0A=
Regards=2C=0A=
Chris=0A=
=0A=
 		 	   		  =

