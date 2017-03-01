Return-Path: <bevenson@melinkcorp.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0109.outbound.protection.outlook.com [104.47.36.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5162972F79
	for <Openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZSBlpFKKYfNJwLqDxIIPom7Qs01IEUquD2EuRfvMEPc=;
	b=RI2KtCgglwsUtW7Vk4Cz8bB297KHL/F/Yc9KwiytOF+IEcOSnLmtIol7Sbl7tybG6xh94L02TAdG/W2+2sOQAuq701hsY0Gn91hufUjiP8A/xeL/pmlq1mdd+iidU4eXMpQIK6U/iWzlt51jGI43unp3PFLOeuWnx3KReOLJXi0=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.947.2; Wed, 1 Mar 2017 14:22:11 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0947.012; Wed, 1 Mar 2017 14:22:11 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: util-linux: Multiple alternatives issues preventing clean
	upgrades
Thread-Index: AdKSlL/EekhaD2d4R8yKxf84gnlQRQ==
Date: Wed, 1 Mar 2017 14:22:10 +0000
Message-ID: <DM5PR05MB29543A5A58F288E89CEF7C4DBB290@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=melinkcorp.com;
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: b5492d50-e194-4467-9013-08d460ae599d
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2954;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2954;
	7:TR0njGhtr4X7fLuYC+bn70/pdDdMpoJNh51mYvjKTuqnMTViYmHqaxL8pJlTi9VPumVpvUgF8H4YVVrQGTYocsKPtQGx5gHZi6yr/AJaocIC1KFY0ts3V3mZ56QDS71J6T19j2GIfd1pIa8hY+SWeecoujyezWoylbQzVbTFwT/nDyiMrC4DoHTNdwOxZbZg559NR08M0T90ItiMwOXmAcYd9LNW3W5fbSntcLglmIi7tzX7cquyNbYOknf5ttYMMBYYa6sHFVcP59FpcgswiEpq1x9Q8Y8yoj0TSBJYEPq6TkTnLFW5u3fvXy4EoP6g6Lt6pI5SI8sr0wPljmzFLg==
x-microsoft-antispam-prvs: <DM5PR05MB2954A925F06F6A1E84C8A1C8BB290@DM5PR05MB2954.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123558025)(20161123562025)(20161123560025)(20161123555025)(20161123564025)(6072148);
	SRVR:DM5PR05MB2954; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2954; 
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(7696004)(6916009)(122556002)(66066001)(450100001)(2906002)(3280700002)(189998001)(77096006)(5660300001)(3660700001)(81166006)(6436002)(8936002)(33656002)(966004)(6506006)(7736002)(54356999)(8676002)(74316002)(2351001)(50986999)(6116002)(25786008)(102836003)(5640700003)(92566002)(9686003)(2501003)(6306002)(99286003)(86362001)(3846002)(55016002)(53936002)(110136004)(38730400002)(2900100001)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2954;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2017 14:22:10.6904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2954
Subject: util-linux: Multiple alternatives issues preventing clean upgrades
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
X-List-Received-Date: Wed, 01 Mar 2017 14:22:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am using opkg for package management, and before moving to a more recent =
branch (currently on dizzy) I'm doing some firmware upgrade tests to make s=
ure I have a clean upgrade process.  For my testing I flash an image using =
our current production image and then do firmware upgrade from the command =
line by doing "opkg update; opkg upgrade --download-only; opkg upgrade" and=
 checking what errors pop up.  I am currently testing upgrading to the jeth=
ro branch and I am seeing some errors in regards to util-linux.  I see the =
following errors during upgrade:

* check_data_file_clashes: Package util-linux-sulogin wants to install file=
 /sbin/sulogin.util-linux
        But that file is already provided by package  * util-linux
update-alternatives: Error: cannot register alternative readprofile to /usr=
/sbin/readprofile since it is already registered to /sbin/readprofile
* pkg_run_script: package "util-linux-readprofile" postinst script returned=
 status 1.
* opkg_configure: util-linux-readprofile.postinst returned 1.

The first error I traced down to being related to this commit: http://git.o=
penembedded.org/openembedded-core/commit/meta/recipes-core/util-linux?h=3Dj=
ethro&id=3D4bde182ed236243547929dd98763f1c09eddd097

The second error I traced down to being related to this commit: http://git.=
openembedded.org/openembedded-core/commit/meta/recipes-core/util-linux?h=3D=
jethro&id=3D43424eb3c8bf03a2f9ec331b78dd4040dd39eacd

I know this is all related to alternatives, but that's about as far as my k=
nowledge extends in this area.  Yes, everything is running okay but I'd lik=
e to clean up problems like this if possible.  Does anyone have any suggest=
ions on what would need to change in the util-linux recipe to clean up thes=
e errors?

Thanks,
Bryan

