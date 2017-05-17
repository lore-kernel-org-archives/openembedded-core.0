Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 79964 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 May 2017 16:29:50 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0135.outbound.protection.outlook.com [104.47.38.135])
	by mail.openembedded.org (Postfix) with ESMTP id D3BC577DD6
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 16:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=JhmDJoOnLMzfS1LZaNYmL3h2g1s+Y+nXYbAWiopeXRY=;
	b=UgQs2tv2HWhFxUUvZnU2penEK2lIhZQyCqRVHceMQIZGtKZGbMkPL+9x1Z30u0lIYVWrmkDRLcuZvw+sAxeysvopkznn3m3Ex4R17hrb+onjxX24lduiq6IBO1WSRR7LVGrkEBIqUzh2VeMSicId7LU2Z1/eXVvrIBseQSyxStc=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.8; Wed, 17 May 2017 16:14:42 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.1101.011; Wed, 17 May 2017 16:14:42 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: eudev: opkg not automatically upgrading from udev to eudev
Thread-Index: AdLOYlpqF6Ic/6aPRBO/lUJuMAsISgAvchAQAAFj/HA=
Date: Wed, 17 May 2017 16:14:42 +0000
Message-ID: <DM5PR05MB2954C1141AD8B63A4727A89DBBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
References: <BN6PR05MB29463641747B05CF02AB8AEBBBE60@BN6PR05MB2946.namprd05.prod.outlook.com>
	<DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
In-Reply-To: <DM5PR05MB2954072E97220E285EBB4860BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2954;
	7:FbS1eYpPC3tXomdJyEWETx5TYlAqQmIY3I3CBwMknKNbEc7M1u0WFkQf4QrnE8Xh745fWUd4ucFM8aHvSEyAls/O+TZPai1BKBbQaFsFY/MM5j0KU2X0EC6OexFdwMkAz+7u/5mm15Csyzmf6vtPe1hkgvgRtrG5pf46m+Agli6aY5XU6v2YmNsNYWY1RhUKKHhjZfVTPvd2c200bTKTIZmtpb3Qm/uV0/Vr9/ZLZmJ1Eo9bWflPmV+G2Gxf30rIUm/YSBKvvcwxggxuPneCgPQYziOwn1xYN36NVYFXjdArPJBd8pdk8iqp8OxV20V0XaQwpz1s7H5tB2zGxe1xlg==
x-ms-traffictypediagnostic: DM5PR05MB2954:
x-ms-office365-filtering-correlation-id: 300ae45b-43fd-439a-70fb-08d49d3fd3d7
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:DM5PR05MB2954; 
x-microsoft-antispam-prvs: <DM5PR05MB29540F9623CB46D60DF6F3C7BBE70@DM5PR05MB2954.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123562025)(20161123555025)(20161123558100)(20161123564025)(6072148);
	SRVR:DM5PR05MB2954; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2954; 
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39400400002)(39830400002)(39410400002)(39450400003)(13464003)(377454003)(8936002)(5660300001)(2900100001)(2351001)(102836003)(53936002)(5640700003)(6306002)(122556002)(3280700002)(9686003)(6436002)(6506006)(55016002)(99286003)(74316002)(2906002)(3846002)(81166006)(77096006)(189998001)(6246003)(7736002)(110136004)(305945005)(38730400002)(54356999)(50986999)(76176999)(229853002)(1720100001)(8676002)(53546009)(7696004)(86362001)(25786009)(33656002)(2501003)(478600001)(6916009)(66066001)(2950100002)(3660700001)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2954;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2017 16:14:42.6422 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2954
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
X-List-Received-Date: Wed, 17 May 2017 16:29:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

> -----Original Message-----
> From: Bryan Evenson
> Sent: Wednesday, May 17, 2017 11:27 AM
> To: Bryan Evenson <bevenson@melinkcorp.com>; Openembedded-
> core@lists.openembedded.org
> Subject: RE: eudev: opkg not automatically upgrading from udev to eudev
>=20
> All,
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf Of
> > Bryan Evenson
> > Sent: Tuesday, May 16, 2017 2:01 PM
> > To: Openembedded-core@lists.openembedded.org
> > Subject: [OE-core] eudev: opkg not automatically upgrading from udev
> > to eudev
> >
> >
> > I have an image based on core-image-minimal that uses sysvinit for
> > init and opkg for package management.  I am doing some upgrade testing
> > and I see an issue with eudev.  I am testing upgrading an image that
> > was built under dizzy to my latest image built under morty.  I'm first
> > testing that all the correct packages and new dependencies are
> > correctly being identified for upgrade by running "opkg update; opkg
> > upgrade --download-only" from the command line and comparing what is
> > in the opkg cache directory with what was available.  All packages
> > except eudev and udev-cache are being downloaded for upgrade.
> >
> > I ran the opkg upgrade again with the -V4 option for additional debug
> > output Here's what I saw in one section regarding udev:
> >
> > pkg_hash_fetch_best_installation_candidate: Best installation
> > candidate for
> > udev:
> > pkg_hash_fetch_best_installation_candidate: apkg=3Dudev nprovides=3D2.
> > pkg_hash_fetch_best_installation_candidate: Adding eudev to providers.
> > pkg_hash_fetch_best_installation_candidate: Adding udev to providers.
> > pkg_hash_fetch_best_installation_candidate: eudev arch=3Darmv5e
> > arch_priority=3D41 version=3D3.2.
> > pkg_hash_fetch_best_installation_candidate: udev arch=3Darm926ejste
> > arch_priority=3D51 version=3D182.
> > pkg_hash_fetch_best_installation_candidate: Candidate: udev 182.
> > pkg_hash_fetch_best_installation_candidate: 2 matching pkgs for
> > apkg=3Dudev:
> > pkg_hash_fetch_best_installation_candidate: eudev 3.2 armv5e
> > pkg_hash_fetch_best_installation_candidate: udev 182 arm926ejste
> > opkg_upgrade_pkg: Comparing visible versions of pkg udev:
> >         182-r9.9 is installed
> >         182-r9.9 is available
> >         0 was comparison result
> > opkg_upgrade_pkg: Package udev (182-r9.9) installed in root is up to da=
te.
> >
> > I'm assuming the problem is that udev is version 182 and eudev is
> > version 3.2 and that opkg doesn't think udev needs to be upgraded.  Is
> > there an RDEPENDS that needs to be added somewhere so opkg sees that
> > it needs to upgrade udev to eudev?
>=20
> I made some changes and now both eudev and udev-cache are being pulled
> in on upgrade.  However, I'd like a second opinion that what I did was
> reasonable.
>=20
> First, I created eudev_%.bbappend in my private layer and added "PE =3D "=
1""
> to the bbappend.  Since the numbering scheme changed between udev and
> eudev, I figured this was a reasonable move.  This brought the update ude=
v-
> cache in for upgrade, but not eudev.  In my private layer, I also have an=
 image
> version number package.  I added eudev to the RDEPENDS list for this
> package since my image, which now has linux version 4.4, does depend on
> eudev.
>=20
> Does this sound reasonable?  Is there a better way to do the same thing?

Things didn't go as well when I did the upgrade.  I attempted the upgrade w=
ith "opkg upgrade" (no options) and everything worked until then end.  Then=
 I got a bunch of error messages like the following:

* check_data_file_clashes: Package eudev wants to install file /lib/udev/sc=
si_id
        But that file is already provided by package  * udev

After the upgrade neither udev nor eudev were installed on my system.  I've=
 solved similar problems in the past by adding RCONFLICTS/RREPLACES listing=
s in the new packages recipe, but since eudev is listed as providing udev I=
'm not sure what is appropriate here.  Should there be RCONFLICTS/RREPLACES=
 in the eudev recipe, or is there another solution to this problem?

Thanks,
Bryan

>=20
> Thanks,
> Bryan
>=20
> >
> > Thanks,
> > Bryan
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

