Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 5722 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Feb 2017 15:18:27 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0110.outbound.protection.outlook.com [104.47.34.110])
	by mail.openembedded.org (Postfix) with ESMTP id C18D6719B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 15:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2uDjw0zGDmhuotVh7VFzmmLodRf5b6OZZM6Vq3MTjBg=;
	b=T161+K1W/cK0Dbi1zZ3hC4z3PILBZyKBZPeffcnQwByPN+D9G/gJ5yq//BvW2X8uwOuMX2THJwosFVl0uWHJ888X3tyuE2XYBLuTuwl2oosb6NB8+h6N2CZUIZTT7++Kmrt5Xp3xKG2H6L3UTXL9z5hTTEtvPrhShSSLtvfoquE=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2955.namprd05.prod.outlook.com (10.168.176.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.919.10; Thu, 16 Feb 2017 13:43:03 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0919.013; Thu, 16 Feb 2017 13:43:03 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Suggested RREPLACES/RCONFLICTS for easier kernel-image
	upgrades
Thread-Index: AdKH01RvH/dQvi5nROe3asA1z4v5aQABfb6AAB/lrnA=
Date: Thu, 16 Feb 2017 13:43:03 +0000
Message-ID: <DM5PR05MB295440589E889B60FAAEACD5BB5A0@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
	<9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
In-Reply-To: <9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 75440b7c-961b-49d2-4203-08d45671bb1e
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2955;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2955;
	7:Hjo8iT4Gtws3JnUbA4ClvCEwR0qckkGYXTdxCqtGbSh+6GFnzqo8YNLfo7AEnsO2GdwdvzSYOgE/BBsAs9ihlhmHpcEZ+L9bAns+GVFyMD/jRZJVrpCJnbrUcb3+5OazbUb+fcXOQ3ujDh/wGCs+suhLsKJ634Xsx5cTIdDVw9ovygAdOUNlTrSmszyMQAvvhSf1YOBnjgIOqwtfiuFFVvpQCrlNtQ/1aGJfEYYx9nATnso1PmVQT/J4ffX3yUrCSu2WhG80FY6uOb4VPB6xobj8MlPq3lo1t1tAihB0B+Y1fE7D/QLjTFEhoLS0T23PPf4wg0aeLqqOwPtXhj/eaw==
x-microsoft-antispam-prvs: <DM5PR05MB2955E977904FCEBE0E767979BB5A0@DM5PR05MB2955.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123555025)(20161123560025)(20161123558025)(20161123562025)(20161123564025)(6072148);
	SRVR:DM5PR05MB2955; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2955; 
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(24454002)(377454003)(13464003)(199003)(189002)(189998001)(38730400002)(39060400002)(66066001)(7736002)(229853002)(106356001)(305945005)(76176999)(53546003)(6506006)(54356999)(50986999)(966004)(2950100002)(86362001)(122556002)(6246003)(3660700001)(53936002)(3280700002)(77096006)(389900003)(105586002)(1720100001)(2501003)(2900100001)(68736007)(2906002)(101416001)(3846002)(92566002)(5660300001)(6116002)(102836003)(25786008)(8676002)(55016002)(8936002)(81156014)(99286003)(9686003)(6306002)(81166006)(74316002)(97736004)(6436002)(33656002)(7696004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2955;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2017 13:43:03.5467 (UTC)
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
X-List-Received-Date: Thu, 16 Feb 2017 15:18:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Khem Raj
> Sent: Wednesday, February 15, 2017 5:17 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Suggested RREPLACES/RCONFLICTS for easier kernel-
> image upgrades
>=20
>=20
>=20
> On 2/15/17 1:54 PM, Bryan Evenson wrote:
> > For one project I'm using an Atmel AT91SAM9G25 processor, and I started
> when support for the chip wasn't fully integrated into the mainline kerne=
l.
> As a result, I was using Atmel's Linux fork.  Support has been in the mai=
nline
> kernel for a while now, so in the middle of doing other updates I plan on
> switching to using one of the mainline LTS releases.  I'm using the kerne=
l
> recipe in the meta-sunxi layer as an example (located here:
> https://github.com/linux-sunxi/meta-sunxi/blob/master/recipes-
> kernel/linux/linux_4.4.40.bb). I also plan on keeping more up to date on
> releases.  However, due to the package naming for the kernel images, the
> RREPLACES/RCONFLICTS statements for firmware upgrade for this recipe is
> getting ridiculous.  I'm currently building for kernel version 4.1.38, an=
d here's
> what I have so far to handle all previous cases:
> >
> > RREPLACES_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-3.6.9-
> yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-
> at91"
> > RCONFLICTS_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-3.6.9=
-
> yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-
> at91"
> >
> > If it makes a difference, I'm using opkg for a package manager.  Since =
the
> kernel version is in the package name, I'm assuming that if I do keep goi=
ng
> forward and relatively up to date with LTS release, I'll have to start ad=
ding
> "kernel-image-4.1.38 kernel-image-4.1.39 kernel-image 4.1.40 ...." to the
> RREPLACES/RCONFLICTS so opkg will upgrade the kernel.
> >
> > Is there a better way to do this?  I've tried using some wildcards in t=
he
> package names without any success.
> >
>=20
> you can increment PE

I tried that and it didn't make a difference; without the specific previous=
 package names listed in RDEPENDS/RCONFLICTS, opkg does not recognize the n=
ew kernel-image as an upgrade.  From my understanding PE only affects the v=
ersion number, not the package name.  In this case, since KERNEL_VERSION is=
 part of the package name, opkg does not immediately recognize kernel-image=
-4.1.38 as an upgrade for kernel-image-3.10.0-at91.  Even though both packa=
ges provide "kernel-image", that's not what opkg is looking at when it chec=
ks for upgrades.

Could someone explain to me why KERNEL_VERSION is even in the package name =
to begin with?  I'm tempted to remove the following two lines from kernel.b=
bclass:

PKG_kernel-image =3D "kernel-image-${@legitimize_package_name('${KERNEL_VER=
SION}')}"
PKG_kernel-base =3D "kernel-${@legitimize_package_name('${KERNEL_VERSION}')=
}"

However, I don't know if this will break something else that would cause an=
 even bigger problem.

Thanks,
Bryan

>=20
> > Thanks,
> > Bryan
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

