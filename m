Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0147.outbound.protection.outlook.com [207.46.100.147])
	by mail.openembedded.org (Postfix) with ESMTP id 145286E268
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 12:42:33 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (0.160.113.12) by
	BN3PR0501MB1090.namprd05.prod.outlook.com (0.160.113.12) with Microsoft
	SMTP Server (TLS) id 15.1.136.25; Mon, 20 Apr 2015 12:42:33 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([0.160.113.12]) with mapi id
	15.01.0136.026; Mon, 20 Apr 2015 12:42:33 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Clarification on backport and bugfix patch submittal process
Thread-Index: AdB7YjSDt1uLmENcRoaM2g2r0Q7uhA==
Date: Mon, 20 Apr 2015 12:42:33 +0000
Message-ID: <BN3PR0501MB10904A52AD3FCD71C41C67B7BBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 002FD5B6009A5C002FD703
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1090;
x-microsoft-antispam-prvs: <BN3PR0501MB1090F85FA267DE1C738DB22CBBE00@BN3PR0501MB1090.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(2900100001)(50986999)(33656002)(77156002)(66066001)(122556002)(450100001)(102836002)(40100003)(62966003)(99286002)(74316001)(2501003)(107886001)(2656002)(2351001)(229853001)(92566002)(54356999)(46102003)(87936001)(76576001)(86362001)(110136001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1090;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BN3PR0501MB1090; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1090; 
x-forefront-prvs: 05529C6FDB
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2015 12:42:33.1625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1090
Subject: Clarification on backport and bugfix patch submittal process
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
X-List-Received-Date: Mon, 20 Apr 2015 12:42:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Last week I had submitted two patches (1f994e81717502fd9d3c2f69772ae8556e6d=
e4cb and 433ec67686d6991d2d5f43fd1af957968da1971c) related to problems I ha=
d been having on the dizzy branch and was happy to see they were accepted. =
 However, I only see the patches on the dizzy branch and I think these chan=
ges are suitable for backport for all supported branches since the problem =
was introduced (which I think was introduced in dora).  I think I had inclu=
ded [dizzy] as a tag in the subject for the patches since that was the bran=
ch I had been working with.

I can see that there are cases in which a patch only applies to a particula=
r branch (e.g. package version changes in the next branch, patch no longer =
applies) and there are cases in which the patch is applicable for master al=
l the way back to a particular branch.  What is the suggested way of indica=
ting the difference when submitting patches?

Thanks,
Bryan

