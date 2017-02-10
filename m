Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 7205 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 10 Feb 2017 18:15:04 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0111.outbound.protection.outlook.com [104.47.36.111])
	by mail.openembedded.org (Postfix) with ESMTP id D0DB477496
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VaUvVwCsvgQmRL1QGvvYfKI41UTHKIx+KfMLhb8fxrc=;
	b=ZedjYqd3rSzftGwsCg+S6K6r52WSN64LjjUifHEyrQLf0Ku28ZqXuyfAQn4CWIkQCf0tfs5a02dPUIsq5B+bGQIfqg3uofysRWYYi1S3IFLhp3Mi09ZFhFoljP+Szy1PQwVz+mmtR0Yooio9nIebvhnntvtY02F2EIaSpTlpWFA=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2953.namprd05.prod.outlook.com (10.168.176.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.888.5; Fri, 10 Feb 2017 15:41:45 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0888.029; Fri, 10 Feb 2017 15:41:44 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: libcurl vs. libcurl5 vs. libcurl4
Thread-Index: AdKDsNjf+iymq+k4QQ6ihwgbAB3KWg==
Date: Fri, 10 Feb 2017 15:41:44 +0000
Message-ID: <DM5PR05MB295469CD2CBB36C236111A0DBB440@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 5dd37460-2aa0-4f3a-214f-08d451cb5147
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2953;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2953;
	7:YlnQXnOsjIqPCI5UK54Z3SzAOCciHD1Xy1FrMcNQqE9E0mfoh3jlqqV1p4aRZGDS7cYvRJDzCWHYM+LX+jkJJ5Wd+NQoyC2nVSxY/4ZPWLKv7PCJ4qFo6pE36oaiodg5A1gQb/I2eintfMKs2rGxjeIUWhH7YNBKK4lqFeVsSXV3xDqzrbpJ6p7HGlKNAbDDpQR0EXJSv/iOa/5z3Q5yi8hGYqdiJb5QGLDoCRAE+6KQePh8x9bJPs1nQ35eNHSjOZ/qpWyo/xaFAUMUZ7lqKkNZHq6lMMe9LoZepxWYD4Ddn72byV93LfsdLR3qamhZ75UrnWariVvgfpI8KR1omOR/UcRpUOwYG4KNOm8gDt2UMmRlEyZv8D/rO2VQNtZn2KfzvDYhUyO0O/Ec1ykx2ZNCqZDjfJ3sZ8tzvEeKDAHnAmelQ056zYvkxQAKYryHZTCQ6jzEPvIErZJrM6jnFT/5QUrCmeod6hdOYA8eZoZ/VJ4nczgb/7yH5yu9FNxIbKvbYKlQ7rrP3PGo99+icQ==
x-microsoft-antispam-prvs: <DM5PR05MB2953989212411EE98AB3B397BB440@DM5PR05MB2953.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123558025)(20161123560025)(6072148);
	SRVR:DM5PR05MB2953; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2953; 
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(199003)(189002)(66066001)(8936002)(101416001)(54356999)(50986999)(86362001)(2900100001)(33656002)(2351001)(53936002)(122556002)(450100001)(110136004)(38730400002)(92566002)(8676002)(77096006)(55016002)(99286003)(6436002)(9686003)(25786008)(5640700003)(2501003)(6506006)(189998001)(106356001)(105586002)(7696004)(3660700001)(2906002)(5660300001)(97736004)(81156014)(81166006)(7736002)(68736007)(305945005)(6116002)(74316002)(102836003)(6916009)(3280700002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2953;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2017 15:41:44.7847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2953
Subject: libcurl vs. libcurl5 vs. libcurl4
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
X-List-Received-Date: Fri, 10 Feb 2017 18:15:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm on the dizzy branch and I'm working on updating my build tools to use a=
 more recent branch.  I have an image built using fido and I'm doing some f=
irmware upgrade testing.  I have a package that depends on libcurl and I'm =
getting some strange version dependencies that I'm trying to sort out.

In my package recipe I have "RDEPENDS_${PN} =3D <number of unrelated packag=
es> libcurl" to pull in the runtime depenency on curl.  When I build my ima=
ge using the dizzy branch, libcurl gets built as libcurl5-7.37.1, but when =
I build my image using the fido branch libcurl gets built as libcurl4-7.40.=
0.  As a result, by checking my package dependencies with "opkg info <my_pa=
ckage_name>" I see that the package dependency has changed from "libcurl5 (=
>=3D7.37.1)" to "libcurl4 (>=3D7.40.1)".

Any ideas why the package name dropped from libcurl5 to libcurl4?  Is this =
something that has been fixed in a more recent branch?  If I'm reading the =
dependencies correctly, opkg should still install libcurl-7.40.0 since my p=
ackage depends on libcurl4, correct?

Thanks,
Bryan Evenson

