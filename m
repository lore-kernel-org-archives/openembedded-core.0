Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0129.outbound.protection.outlook.com [207.46.100.129])
	by mail.openembedded.org (Postfix) with ESMTP id DBE1073C0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 13:24:45 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1091.namprd05.prod.outlook.com (25.160.113.13) with
	Microsoft SMTP
	Server (TLS) id 15.1.118.21; Mon, 30 Mar 2015 13:09:59 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0125.002; Mon, 30 Mar 2015 13:09:59 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Verification on how TARGET_CFLAGS is set
Thread-Index: AdBq6sgwEqQG9EV+T/2vz5aas/+PuA==
Date: Mon, 30 Mar 2015 13:09:59 +0000
Message-ID: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [98.100.91.242]
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1091;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(52314003)(164054003)(54356999)(46102003)(92566002)(86362001)(2900100001)(99286002)(33656002)(62966003)(2351001)(2501003)(50986999)(87936001)(450100001)(77156002)(2656002)(110136001)(19580395003)(66066001)(107886001)(40100003)(122556002)(229853001)(102836002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1091;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB10918B6F1B8EF52224BEBE17BBF50@BN3PR0501MB1091.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1091; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1091; 
x-forefront-prvs: 05315CBE52
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2015 13:09:59.5362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1091
Subject: Verification on how TARGET_CFLAGS is set
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
X-List-Received-Date: Mon, 30 Mar 2015 13:24:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am about to upgrade to the dizzy branch.  I have a built a bootable image=
 on my test build machine, and now I'm going to be applying changes to the =
system I use for building production images.  I'm planning on deleting my t=
mp directory to force a re-build of everything.  Since I'm rebuilding every=
thing anyway, I'm taking a deeper look at the CFLAGS related settings and I=
'm getting a little lost in the logic.  I'd like to verify these settings b=
efore I start rebuilding everything.

If I'm following the default logic correctly in bitbake.conf, by default TA=
RGET_CFLAGS will be set to "-O2 -pipe -g -feliminate-unused-debug-types".  =
I want the default TARGET_CFLAGS for my production image to be "-O2 -pipe".=
  What's the suggested variable to change, and where, to get this final val=
ue?  Do I set TARGET_CFLAGS directly, or do I set SELECTED_OPTIMIZATIONS or=
 even FULL_OPTIMIZATIONS?  Do I set it in local.conf or should I be setting=
 it somewhere else?

Any other related tips are welcome.

Thanks,
Bryan Evenson

