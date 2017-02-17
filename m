Return-Path: <bevenson@melinkcorp.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0125.outbound.protection.outlook.com [104.47.38.125])
	by mail.openembedded.org (Postfix) with ESMTP id 1B54D719DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 15:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=luznNSK4NReTAEaf18lSaX33VRa4LAe5/NB5yCX0HlA=;
	b=Ol46PjCTTiXrD7LN2uU5nQLcKlOaUe0t4SNqB+PehGMUSo2zVowOgT5aFRYCDwOnmAsefoT8yb+ugv2tlacr7zlCLySC432dfTAS+WHQzcSUPDaYsdwNSmKW0zYwvDaYPN3eo9YvdC9yTt3YiJutP8Hbpc1X+5mH2MRCYTZCliQ=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2955.namprd05.prod.outlook.com (10.168.176.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.919.10; Fri, 17 Feb 2017 15:13:30 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0919.013; Fri, 17 Feb 2017 15:13:30 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Andreas Oberritter <obi@opendreambox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Suggested RREPLACES/RCONFLICTS for easier kernel-image
	upgrades
Thread-Index: AdKH01RvH/dQvi5nROe3asA1z4v5aQABfb6AAB/lrnAALI1bAAAISHKg
Date: Fri, 17 Feb 2017 15:13:29 +0000
Message-ID: <DM5PR05MB2954AE4F24C7287DD78F3793BB5D0@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
	<9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
	<DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
	<20170217114628.1fd9f198@t510.zcs.saftware.de>
In-Reply-To: <20170217114628.1fd9f198@t510.zcs.saftware.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 3b92e59d-85cb-4181-2396-08d4574787f5
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2955;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2955;
	7:ZtBnKC2nLmj18/DqnMq1DOwrVtzjtMEBGYkdJU0AdEmO7huTLe1LRZzDzAxIlPqsQyU3QiDk788283sYUjYLl5CgTtq5Dz/MAu/tbSUb2PuGjvMlGmF5Rs1NXPihph2RggrlHwYh/joAOJ8UP9yzYk5i7GPpkmvYGKLv4Ni1UQiCbWPqJ8oDskG1nTl58INwqTteDvUKFwbWkQSwss2u/W8gVgcRAlzfSsohTiWcGIs/ZH7LzsSHVaU8BgdFp2vMnq9A5IArbCbPBnCyTxeAzhS3Zdab+ewsY9jM0msHJjg4jOUbCzYd4uPmUgZ2vq2kNuWIZKc/BpLlBBKZIEWEGQ==
x-microsoft-antispam-prvs: <DM5PR05MB2955F6EB956E727416E46131BB5D0@DM5PR05MB2955.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123555025)(20161123562025)(20161123560025)(20161123558025)(20161123564025)(6072148);
	SRVR:DM5PR05MB2955; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2955; 
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(377454003)(24454002)(13464003)(199003)(189002)(7736002)(76176999)(189998001)(106356001)(38730400002)(66066001)(50986999)(122556002)(54356999)(2950100002)(305945005)(229853002)(6246003)(86362001)(6506006)(3280700002)(77096006)(105586002)(966004)(53546006)(1720100001)(53936002)(3660700001)(5890100001)(93886004)(2501003)(68736007)(2900100001)(6116002)(101416001)(92566002)(102836003)(2906002)(5660300001)(25786008)(8676002)(6306002)(81156014)(33656002)(9686003)(81166006)(8936002)(99286003)(74316002)(55016002)(97736004)(3846002)(7696004)(6436002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2955;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2017 15:13:29.8904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2955
Subject: Re: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
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
X-List-Received-Date: Fri, 17 Feb 2017 15:13:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Andreas,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Andreas Oberritter
> Sent: Friday, February 17, 2017 5:46 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Suggested RREPLACES/RCONFLICTS for easier kernel-
> image upgrades
>=20
> On Thu, 16 Feb 2017 13:43:03 +0000
> Bryan Evenson <bevenson@melinkcorp.com> wrote:
>=20
> > Khem,
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> > > Of Khem Raj
> > > Sent: Wednesday, February 15, 2017 5:17 PM
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core] Suggested RREPLACES/RCONFLICTS for easier
> kernel-
> > > image upgrades
> > >
> > >
> > >
> > > On 2/15/17 1:54 PM, Bryan Evenson wrote:
> > > > For one project I'm using an Atmel AT91SAM9G25 processor, and I
> started
> > > when support for the chip wasn't fully integrated into the mainline
> kernel.
> > > As a result, I was using Atmel's Linux fork.  Support has been in the
> mainline
> > > kernel for a while now, so in the middle of doing other updates I pla=
n on
> > > switching to using one of the mainline LTS releases.  I'm using the k=
ernel
> > > recipe in the meta-sunxi layer as an example (located here:
> > > https://github.com/linux-sunxi/meta-sunxi/blob/master/recipes-
> > > kernel/linux/linux_4.4.40.bb). I also plan on keeping more up to date=
 on
> > > releases.  However, due to the package naming for the kernel images,
> the
> > > RREPLACES/RCONFLICTS statements for firmware upgrade for this recipe
> is
> > > getting ridiculous.  I'm currently building for kernel version 4.1.38=
, and
> here's
> > > what I have so far to handle all previous cases:
> > > >
> > > > RREPLACES_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-3.=
6.9-
> > > yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0=
-
> > > at91"
> > > > RCONFLICTS_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-
> 3.6.9-
> > > yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0=
-
> > > at91"
> > > >
> > > > If it makes a difference, I'm using opkg for a package manager.  Si=
nce
> the
> > > kernel version is in the package name, I'm assuming that if I do keep
> going
> > > forward and relatively up to date with LTS release, I'll have to star=
t adding
> > > "kernel-image-4.1.38 kernel-image-4.1.39 kernel-image 4.1.40 ...." to=
 the
> > > RREPLACES/RCONFLICTS so opkg will upgrade the kernel.
> > > >
> > > > Is there a better way to do this?  I've tried using some wildcards =
in the
> > > package names without any success.
> > > >
> > >
> > > you can increment PE
> >
> > I tried that and it didn't make a difference; without the specific prev=
ious
> package names listed in RDEPENDS/RCONFLICTS, opkg does not recognize
> the new kernel-image as an upgrade.  From my understanding PE only
> affects the version number, not the package name.  In this case, since
> KERNEL_VERSION is part of the package name, opkg does not immediately
> recognize kernel-image-4.1.38 as an upgrade for kernel-image-3.10.0-at91.
> Even though both packages provide "kernel-image", that's not what opkg is
> looking at when it checks for upgrades.
> >
> > Could someone explain to me why KERNEL_VERSION is even in the
> package name to begin with?  I'm tempted to remove the following two line=
s
> from kernel.bbclass:
> >
> > PKG_kernel-image =3D "kernel-image-
> ${@legitimize_package_name('${KERNEL_VERSION}')}"
> > PKG_kernel-base =3D "kernel-
> ${@legitimize_package_name('${KERNEL_VERSION}')}"
> >
> > However, I don't know if this will break something else that would caus=
e an
> even bigger problem.
>=20
> That's what I do in my kernel recipes:
>=20
> # By default, kernel.bbclass modifies package names to allow multiple
> kernels
> # to be installed in parallel. We revert this change and rprovide the ver=
sioned
> # package names instead, to allow only one kernel to be installed.
> PKG_kernel =3D "kernel"
> RPROVIDES_kernel =3D "kernel-${KERNEL_VERSION_PKG_NAME}"
> PKG_kernel-base =3D "kernel-base"
> RPROVIDES_kernel-base =3D "kernel-base-${KERNEL_VERSION_PKG_NAME}"
> RDEPENDS_kernel-base =3D ""
> PACKAGES_remove =3D "kernel-image"

I tried this approach but ran into problems during the build.  KERNEL_VERSI=
ON_PKG_NAME is not a variable that is set anywhere in my build.  Where is t=
his set for you?  To test building I changed this to KERNEL_VERSION in my r=
ecipe.

I also have a package that depends on certain kernel versions (to handle wh=
en certain hardware interfaces have changed) which I previously had handled=
 with this dependency:
RDEPENDS_${PN} =3D "kernel-image (<=3D3.10)"
Since after this change kernel-image no longer exists, I can't do this chec=
k.  What should this be instead?  "kernel" instead of "kernel-image"?  I di=
d this and it built okay.  I also noticed that if I don't have this RDEPEND=
S in place, the kernel is not installed in my image.  Did you have to do so=
mething different to get the kernel package installed in your image in the =
first place?

I have a pkg_postinstall_kernel-image_append that writes the upgraded kerne=
l to flash.   I'm assuming then I should change this to pkg_postinstall_ker=
nel_append?  The uImage also wasn't getting attached to any file so I added=
:

FILES_kernel +=3D "/boot/uImage-${KERNEL_VERSION}"

Is this what you did, or are there some other steps I'm missing?

Thanks,
Bryan

>=20
> You may need to add some RCONFLICTS+RREPLACES for your old kernels, but
> the problem would be solved for future updates.
>=20
> Note that a change landed in master recently which also places the kernel
> version in the name of every kernel module package. To avoid this, you
> need to set the following variables globally:
>=20
> KERNEL_MODULE_PACKAGE_SUFFIX =3D ""
> KERNEL_MODULE_PROVIDE_VIRTUAL =3D "0"
>=20
> Regards,
> Andreas
>=20
>=20
> >
> > Thanks,
> > Bryan
> >
> > >
> > > > Thanks,
> > > > Bryan
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

