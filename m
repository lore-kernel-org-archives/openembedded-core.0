Return-Path: <zhenhua.luo@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0040.outbound.protection.outlook.com [104.47.2.40])
	by mail.openembedded.org (Postfix) with ESMTP id 2545C60722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3lvtyA4ydGq+1ldl8+LU/Nd52kJEunLNfj89+iRh0e8=;
	b=IQnaSnUDaZVOMB+3vVUqC2oYqe0hR0JDn/zGr39Vab7pg7gE4lY5zyb2w39sTk96lSZTSzT7mg2H4+g8QYg74+0XvnVwdBWgPq9DFsXSry8MYIpA3MR+AsuTtDmgWylW5xoeIrWgjWlMklvWgvqqargNNQIGXcO6C2CCqf+9kPA=
Received: from DB6PR0401MB2630.eurprd04.prod.outlook.com (10.169.225.139) by
	DB6PR0401MB2632.eurprd04.prod.outlook.com (10.169.225.141) with
	Microsoft
	SMTP Server (TLS) id 15.1.528.16; Fri, 15 Jul 2016 06:13:37 +0000
Received: from DB6PR0401MB2630.eurprd04.prod.outlook.com ([10.169.225.139]) by
	DB6PR0401MB2630.eurprd04.prod.outlook.com ([10.169.225.139]) with
	mapi id 15.01.0528.026; Fri, 15 Jul 2016 06:13:38 +0000
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
Thread-Index: AQHR1oVsqmkkzAgxYk+slMEiZoerOKAJ8ySAgADIQHCADlcykA==
Date: Fri, 15 Jul 2016 06:13:38 +0000
Message-ID: <DB6PR0401MB2630E1F43FAC79B508546405EE330@DB6PR0401MB2630.eurprd04.prod.outlook.com>
References: <1467699658-4985-1-git-send-email-zhenhua.luo@nxp.com>
	<CAMKF1soJ0_8FcopQ4ipqLv+Bgi9qFyvTOUKVshdxvcEphRi6sw@mail.gmail.com>
	<DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
In-Reply-To: <DB3PR04MB068453822CFC44651DA07C02EE3A0@DB3PR04MB0684.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@nxp.com; 
x-originating-ip: [199.59.230.102]
x-ms-office365-filtering-correlation-id: fb9807aa-d060-45f6-df95-08d3ac77293c
x-microsoft-exchange-diagnostics: 1; DB6PR0401MB2632;
	6:ejW9y1zhBB83+OjM6T/E1v3tMfqg7YL3cJ587TSu3T6Hk991E5dKx19Us5SqMaJ45m8CJZXz8/xefEO9dQgt2tAXz7K9EDbZva2vCBwTikNo9VcBn/cPOI6pl3CFzYtGzkftkkAg9DHN5M7p2mRx7fg0NTZE4S19gFh6U+wsAL0RmsteY7fgK4nY384Y5/IV8xXH2AtqOL9ZA5pjQQQXDVQOiZ4N74i/lMYMu3eIYI5WqUA5DaCt4M2ZRbvjRjOMu97XRoqG7cFYypS9K7LkmYzPKj7px87AdDhQ7PbgA91SuB6EvtSLniqlztHoibCgNs1BDVJeZAnF0L//m6ftnw==;
	5:jUqP0G6ZsCMTJZOjkky5ImVfkayuOCPYzcBhpGcKsGupOmq1ikruCNp/fKxWRR3kBg8dTyLj1AhH3I/iszPcbAuJm2DTfFmh/dOguozNGu0LtcdQfChlJy7/y2r/NWWqtSNmhtbRyfeo8J861LWnRA==;
	24:4mUEbrV0+CBtzcukXYUsyPSh9UyoGMPnD/gxClrnHezgU0Ku6q1zcWshl9lmbblRl34JinXVdKt7F5RbzBB9qPlchEub2TzrT5CPTe9i95c=;
	7:LdRO10vodjycP99JlfyAOQtr6+gupOB5HScq2SK41CmAG9t9zwdX1s8cWZk4Qk6KivqcKcAr3QYrEm/D9GU7cfzKh8GeTQFra8Pl5Kv2ECSc2P8iRY282lUX/VUkGYnTeG48HbpH0M2eW3YtrdGekeW5teTWcik6d9HMqMXOSg21ZA9ELbdXGDzndyG0yQx2tCtcxHCVWs0s2kGCTOyipx+edo0dyU2WbYluSTeaIYPEm2Idoy9df5rn3CLgmdQJ
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB6PR0401MB2632;
x-microsoft-antispam-prvs: <DB6PR0401MB2632B7A4D18FA133FE6BB983EE330@DB6PR0401MB2632.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(185117386973197)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026);
	SRVR:DB6PR0401MB2632; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0401MB2632; 
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(199003)(24454002)(13464003)(189002)(377454003)(19580405001)(2906002)(3660700001)(106116001)(450100001)(15975445007)(586003)(33656002)(77096005)(76576001)(122556002)(74316002)(19580395003)(8936002)(50986999)(3280700002)(6116002)(3846002)(105586002)(92566002)(102836003)(5002640100001)(106356001)(5003600100003)(68736007)(107886002)(110136002)(97736004)(7846002)(9686002)(86362001)(1720100001)(2900100001)(189998001)(81156014)(81166006)(8676002)(305945005)(101416001)(7696003)(76176999)(66066001)(54356999)(2950100001)(10400500002)(87936001)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0401MB2632;
	H:DB6PR0401MB2630.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2016 06:13:38.0271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2632
Subject: Re: [PATCH] tcl: fix INCLUDE_SPEC and LIB_SPEC
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
X-List-Received-Date: Fri, 15 Jul 2016 06:13:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.=20

Is there any other comment to be addressed for the patch?=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Zhenhua Luo
> Sent: Wednesday, July 06, 2016 12:09 PM
> To: Khem Raj <raj.khem@gmail.com>
> Cc: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and LIB_SPE=
C
>=20
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Tuesday, July 05, 2016 11:16 PM
> > To: Zhenhua Luo <zhenhua.luo@nxp.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [oe-core][PATCH] tcl: fix INCLUDE_SPEC and
> > LIB_SPEC
> >
> > On Mon, Jul 4, 2016 at 11:20 PM, Zhenhua Luo <zhenhua.luo@nxp.com>
> wrote:
> > > TCL_INCLUDE_SPEC -I+<includedir> and TCL_LIB_SPEC -L+${libdir} break
> > > the cross-compile of packages which require tcl headers and libraries=
.
> > >
> > > One example is that postgresql configure failed at the following erro=
r:
> > > | checking for tcl.h... no
> > > | configure: error: header file <tcl.h> is required for Tcl
> > >
> > > Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
> > > ---
> > >  meta/recipes-devtools/tcltk/tcl_8.6.5.bb | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> > > b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> > > index 46fc8a7..d75232b 100644
> > > --- a/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> > > +++ b/meta/recipes-devtools/tcltk/tcl_8.6.5.bb
> > > @@ -56,8 +56,6 @@ do_install() {
> > >         ln -sf tclsh8.6 ${D}${bindir}/tclsh${VER}
> > >         sed -i "s+-L${B}+-L${STAGING_LIBDIR}+g" tclConfig.sh
> > >         sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
> > > -       sed -i "s,-L${libdir},-L=3D${libdir},g" tclConfig.sh
> > > -       sed -i "s,-I${includedir},-I=3D${includedir},g" tclConfig.sh
> >
> > does this now include some of your host headers in build then ?
> [Luo Zhenhua-B19537] The patch does the following changes for tclConfig.s=
h.
> Without the change, tcl.h can't be found when cross building packages(e.g=
.
> postgresql) which depend on tcl. I have cross-compiled several
> packages(postgresql, expect, ruby, tk) that have tcl dependency and see n=
o
> issue.
> 	1. tmp/sysroots/qemuarm64/usr/bin/crossscripts/tclConfig.sh
> 	# String to pass to linker to pick up the Tcl library from its
> 	 # installed directory.
> 	-TCL_LIB_SPEC=3D'-L=3D/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltcl8.6'
> 	+TCL_LIB_SPEC=3D'-L/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltcl8.6'
>=20
> 	 # String to pass to the compiler so that an extension can
> 	 # find installed Tcl headers.
> 	-TCL_INCLUDE_SPEC=3D'-I=3D/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/include/tcl8.6'
> 	+TCL_INCLUDE_SPEC=3D'-I/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/include/tcl8.6'
>=20
> 	# String to pass to linker to pick up the Tcl stub library from its
> 	 # installed directory.
> 	-TCL_STUB_LIB_SPEC=3D'-L=3D/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
> 	+TCL_STUB_LIB_SPEC=3D'-L/home/bjsimics/workspace/poky-
> os/qemuppc/tmp/sysroots/qemuarm64/usr/lib -ltclstub8.6'
>=20
> 	2. tmp/sysroots/qemuarm64/usr/lib/tclConfig.sh
> 	# String to pass to linker to pick up the Tcl library from its
> 	 # installed directory.
> 	-TCL_LIB_SPEC=3D'-L=3D/usr/lib -ltcl8.6'
> 	+TCL_LIB_SPEC=3D'-L/usr/lib -ltcl8.6'
>=20
> 	 # String to pass to the compiler so that an extension can
> 	 # find installed Tcl headers.
> 	-TCL_INCLUDE_SPEC=3D'-I=3D/usr/include/tcl8.6'
> 	+TCL_INCLUDE_SPEC=3D'-I/usr/include/tcl8.6'
>=20
> 	# String to pass to linker to pick up the Tcl stub library from its
> 	 # installed directory.
> 	-TCL_STUB_LIB_SPEC=3D'-L=3D/usr/lib -ltclstub8.6'
> 	+TCL_STUB_LIB_SPEC=3D'-L/usr/lib -ltclstub8.6'
>=20
>=20
> Best Regards,
>=20
> Zhenhua
>=20
> > >         install -d ${D}${bindir_crossscripts}
> > >         install -m 0755 tclConfig.sh ${D}${bindir_crossscripts}
> > >         install -m 0755 tclConfig.sh ${D}${libdir}
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

