Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 1989 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 May 2017 15:59:42 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0121.outbound.protection.outlook.com [104.47.41.121])
	by mail.openembedded.org (Postfix) with ESMTP id DF61177DE4
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ftduuZ5e+ro13lSFWqiQFVW84/NoG1ifcM2raWFTxaU=;
	b=HOAAvAFYSnzxJ2Tav2nEIrgNjIt2NKw+Lm3KXwti/6u/BrW3s8xmLJntixEpYQrS9Xraovjmm2YWJ4Epl/pp219k5eAF0m7+18lVlEg2A7XWTm7nXu+drYpz4qOt3fiStvDSiYhynd/C0hBNs8u2zMAPI5alEmto+lfuyZAWsEk=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2956.namprd05.prod.outlook.com (10.168.176.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.8; Wed, 17 May 2017 15:26:34 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.1101.011; Wed, 17 May 2017 15:26:33 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Bryan Evenson <bevenson@melinkcorp.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: eudev: opkg not automatically upgrading from udev to eudev
Thread-Index: AdLOYlpqF6Ic/6aPRBO/lUJuMAsISgAvchAQ
Date: Wed, 17 May 2017 15:26:33 +0000
Message-ID: <DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
In-Reply-To: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: melinkcorp.com; dkim=none (message not signed)
	header.d=none;melinkcorp.com; dmarc=none action=none
	header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2956;
	7:I7GRYH8lEDLZdnxdc2DzuJSUE9d+tiimyXBU5LsWc43ISicMtuF1KlJ2YgeO4y7Q33YH3uxu2Y3Bf5ndoN9Obc0yRWbglDBsOjuV5DZJMx18CERP3NUjxcqAPx3fFYemThVxzReOxRAtOJIuI6zH25iFnl+M53C0cNoSgIm1XkmtTyfr5es5mIPuikRVVwhQTiSfVWQl5qddNU1Kpts5f4KDuG6ifYue+FV/nlczhSEcSgS+30UQkfxEGSD1E39x6fDYVPR2JfgSpKCOhvbg+f9qWKTBgSewooMKwxU8E/wg2zi8gxaerIqzjBlpsf+waHcFgvEQtAt+5Sead3NWGA==
x-forefront-antispam-report: SFV:SKI; SCL:-1SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39450400003)(39830400002)(39400400002)(377454003)(13464003)(3280700002)(1720100001)(2900100001)(86362001)(76176999)(7736002)(54356999)(74316002)(38730400002)(2950100002)(3660700001)(25786009)(122556002)(33656002)(53546009)(2906002)(8676002)(50986999)(7696004)(8936002)(2501003)(229853002)(305945005)(189998001)(6506006)(81166006)(5660300001)(6436002)(6306002)(99286003)(102836003)(55016002)(3846002)(6246003)(53936002)(9686003)(66066001)(77096006)(478600001)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2956;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-ms-traffictypediagnostic: DM5PR05MB2956:
x-ms-office365-filtering-correlation-id: 205d325d-9a45-426e-977e-08d49d3919b8
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:DM5PR05MB2956; 
x-microsoft-antispam-prvs: <DM5PR05MB2956D5AE32229ED79116D7F1BBE70@DM5PR05MB2956.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700036)(100105000095)(100000701036)(100105300095)(100000702036)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(100000703036)(100105400095)(93006095)(93001095)(6041248)(20161123564025)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123555025)(6072148)(100000704036)(100105200095)(100000705036)(100105500095);
	SRVR:DM5PR05MB2956; BCL:0; PCL:0;
	RULEID:(100000800036)(100110000095)(100000801036)(100110300095)(100000802036)(100110100095)(100000803036)(100110400095)(100000804036)(100110200095)(100000805036)(100110500095);
	SRVR:DM5PR05MB2956; 
x-forefront-prvs: 0310C78181
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2017 15:26:33.5286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2956
Subject: Re: eudev: opkg not automatically upgrading from udev to eudev
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
X-List-Received-Date: Wed, 17 May 2017 15:59:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Bryan Evenson
> Sent: Tuesday, May 16, 2017 2:01 PM
> To: Openembedded-core@lists.openembedded.org
> Subject: [OE-core] eudev: opkg not automatically upgrading from udev to
> eudev
>=20
>=20
> I have an image based on core-image-minimal that uses sysvinit for init a=
nd
> opkg for package management.  I am doing some upgrade testing and I see
> an issue with eudev.  I am testing upgrading an image that was built unde=
r
> dizzy to my latest image built under morty.  I'm first testing that all t=
he correct
> packages and new dependencies are correctly being identified for upgrade
> by running "opkg update; opkg upgrade --download-only" from the
> command line and comparing what is in the opkg cache directory with what
> was available.  All packages except eudev and udev-cache are being
> downloaded for upgrade.
>=20
> I ran the opkg upgrade again with the -V4 option for additional debug out=
put
> Here's what I saw in one section regarding udev:
>=20
> pkg_hash_fetch_best_installation_candidate: Best installation candidate f=
or
> udev:
> pkg_hash_fetch_best_installation_candidate: apkg=3Dudev nprovides=3D2.
> pkg_hash_fetch_best_installation_candidate: Adding eudev to providers.
> pkg_hash_fetch_best_installation_candidate: Adding udev to providers.
> pkg_hash_fetch_best_installation_candidate: eudev arch=3Darmv5e
> arch_priority=3D41 version=3D3.2.
> pkg_hash_fetch_best_installation_candidate: udev arch=3Darm926ejste
> arch_priority=3D51 version=3D182.
> pkg_hash_fetch_best_installation_candidate: Candidate: udev 182.
> pkg_hash_fetch_best_installation_candidate: 2 matching pkgs for
> apkg=3Dudev:
> pkg_hash_fetch_best_installation_candidate: eudev 3.2 armv5e
> pkg_hash_fetch_best_installation_candidate: udev 182 arm926ejste
> opkg_upgrade_pkg: Comparing visible versions of pkg udev:
>         182-r9.9 is installed
>         182-r9.9 is available
>         0 was comparison result
> opkg_upgrade_pkg: Package udev (182-r9.9) installed in root is up to date=
.
>=20
> I'm assuming the problem is that udev is version 182 and eudev is version=
 3.2
> and that opkg doesn't think udev needs to be upgraded.  Is there an
> RDEPENDS that needs to be added somewhere so opkg sees that it needs to
> upgrade udev to eudev?

I made some changes and now both eudev and udev-cache are being pulled in o=
n upgrade.  However, I'd like a second opinion that what I did was reasonab=
le.

First, I created eudev_%.bbappend in my private layer and added "PE =3D "1"=
" to the bbappend.  Since the numbering scheme changed between udev and eud=
ev, I figured this was a reasonable move.  This brought the update udev-cac=
he in for upgrade, but not eudev.  In my private layer, I also have an imag=
e version number package.  I added eudev to the RDEPENDS list for this pack=
age since my image, which now has linux version 4.4, does depend on eudev.

Does this sound reasonable?  Is there a better way to do the same thing?

Thanks,
Bryan

>=20
> Thanks,
> Bryan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

