Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 891 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Apr 2015 13:56:14 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0146.outbound.protection.outlook.com [157.56.111.146])
	by mail.openembedded.org (Postfix) with ESMTP id 5A5DD6AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 13:56:14 +0000 (UTC)
Received: from BN3PR0501MB1089.namprd05.prod.outlook.com (0.160.113.11) by
	BN3PR0501MB1458.namprd05.prod.outlook.com (0.160.117.155) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Mon, 20 Apr 2015 13:41:21 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (0.160.113.12) by
	BN3PR0501MB1089.namprd05.prod.outlook.com (0.160.113.11) with Microsoft
	SMTP Server (TLS) id 15.1.136.25; Mon, 20 Apr 2015 13:41:21 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) with mapi id
	15.01.0136.026; Mon, 20 Apr 2015 13:41:21 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] Clarification on backport and bugfix patch submittal
	process
Thread-Index: AdB7YjSDt1uLmENcRoaM2g2r0Q7uhAACjpQAAAA35SA=
Date: Mon, 20 Apr 2015 13:41:20 +0000
Message-ID: <BN3PR0501MB10908E971F71B5725C73D9F7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB10904A52AD3FCD71C41C67B7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<2986665.4db1flKRAu@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <2986665.4db1flKRAu@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 0065ABCA009A5C0065AD17
authentication-results: linux.intel.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1089;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1458; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(13464003)(24454002)(51704005)(164054003)(377454003)(74316001)(2656002)(87936001)(86362001)(99286002)(102836002)(15975445007)(77156002)(66066001)(62966003)(33656002)(76576001)(2900100001)(2950100001)(122556002)(50986999)(54356999)(76176999)(19580405001)(46102003)(110136001)(92566002)(40100003)(19580395003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1089;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1089390A6D1E9991774C03C5BBE00@BN3PR0501MB1089.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1089; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1089; 
x-forefront-prvs: 05529C6FDB
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2015 13:41:20.9775 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1089
X-OriginatorOrg: melinkcorp.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Clarification on backport and bugfix patch submittal process
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
X-List-Received-Date: Mon, 20 Apr 2015 13:56:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Paul,

> -----Original Message-----
> From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> Sent: Monday, April 20, 2015 9:18 AM
> To: Bryan Evenson
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Clarification on backport and bugfix patch submitt=
al
> process
>=20
> Hi Bryan,
>=20
> On Monday 20 April 2015 12:42:33 Bryan Evenson wrote:
> > Last week I had submitted two patches
> > (1f994e81717502fd9d3c2f69772ae8556e6de4cb and
> > 433ec67686d6991d2d5f43fd1af957968da1971c) related to problems I had
> > been having on the dizzy branch and was happy to see they were
> accepted.
> > However, I only see the patches on the dizzy branch and I think these
> > changes are suitable for backport for all supported branches since the
> > problem was introduced (which I think was introduced in dora).  I
> > think I had included [dizzy] as a tag in the subject for the patches
> > since that was the branch I had been working with.
>=20
> Is the patch also applicable to fido/master? Because at the moment it see=
ms
> only to have been applied to dizzy.
>=20

Yes, in my opinion these two patches are suitable for dora up through maste=
r.

> > I can see that there are cases in which a patch only applies to a
> > particular branch (e.g. package version changes in the next branch,
> > patch no longer
> > applies) and there are cases in which the patch is applicable for
> > master all the way back to a particular branch.  What is the suggested
> > way of indicating the difference when submitting patches?
>=20
> In general the policies we use for maintaining the stable branch should b=
e
> documented here:
>=20
>   https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
>=20

That page helps a lot.  I've bookmarked it for future reference when submit=
ting patches.

Thanks,
Bryan

> I would say if there is any specificity to the issue the patch fixes, par=
ticularly if
> it only applies to one of the stable branches, it should probably be note=
d in
> the commit message.
>=20
> Cheers,
> Paul
>=20
> --
>=20
> Paul Eggleton
> Intel Open Source Technology Centre

