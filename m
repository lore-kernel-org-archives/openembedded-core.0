Return-Path: <bevenson@melinkcorp.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0113.outbound.protection.outlook.com [207.46.100.113])
	by mail.openembedded.org (Postfix) with ESMTP id 3D60B6E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:26:19 +0000 (UTC)
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 15:26:20 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.014; Tue, 14 Apr 2015 15:26:20 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sysvinit upgrade woes
Thread-Index: AdB2xX/0SWNQQOrTTmqRDk7i+oHZ/Q==
Date: Tue, 14 Apr 2015 15:26:19 +0000
Message-ID: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00C412C80099A600C41415
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1090;
x-microsoft-antispam-prvs: <BN3PR0501MB10902D14B4AB5434F4220657BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(2351001)(87936001)(2501003)(74316001)(110136001)(33656002)(122556002)(40100003)(66066001)(107886001)(229853001)(2656002)(86362001)(102836002)(54356999)(92566002)(450100001)(99286002)(46102003)(76576001)(77156002)(2900100001)(62966003)(50986999)(133083001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1090;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BN3PR0501MB1090; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1090; 
x-forefront-prvs: 054642504A
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2015 15:26:19.6249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1090
Subject: sysvinit upgrade woes
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
X-List-Received-Date: Tue, 14 Apr 2015 15:26:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am using opkg for package management and sysvinit for init.  I am testing=
 a large jump on an upgrade and I have been having a few issues.  One issue=
 I have traced to sysvinit's upgrade, but I'm unsure how to remedy the solu=
tion.

At some point during the upgrade process, opkg records what the new version=
 is of all the packages getting installed.  However, when I upgrade sysvini=
t causes sysvinit to restart before opkg has recorded which packages were j=
ust installed.  So opkg thinks that it didn't upgrade anything even though =
all packages were upgraded.  I verified that if I call "opkg upgrade" for a=
ll packages that require upgrade except for sysvinit that opkg correctly re=
cords which packages were upgraded.  However, the end user doesn't have tha=
t kind of control, so upgrading in this manner is not an option.

Has anyone else seen a similar issue?  Any ideas on how to hold off sysvini=
t from restarting until after opkg has finished recording its information?

Thanks,
Bryan

