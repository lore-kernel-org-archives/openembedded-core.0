Return-Path: <bartlomiej.kucharczyk@nokia.com>
X-Greylist: delayed 7265 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Jun 2016 20:42:07 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0134.outbound.protection.outlook.com [157.56.112.134])
	by mail.openembedded.org (Postfix) with ESMTP id 8372860132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 20:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=E1PsYUy4O0hPBu7G41ZDw2M5ik+Kq8Z2KBU8phNDrUw=;
	b=TlNzc7Sg7M70N2GhPhezy+QpHH5bxuUfnVDaHhNoIdhjDDn0VbW1PDqqnbmJyZhF3UapRcAVGteNtL1FOqEl0bBakVrmaOSY4tbJEXF3SCog9p6Upq0hk5/l2BcgcpJVou1fcJ7mmJHx4tIxOdVpQFoftgqkvew/opNmSavc9dk=
Received: from DBXPR07MB239.eurprd07.prod.outlook.com (10.141.11.18) by
	DBXPR07MB240.eurprd07.prod.outlook.com (10.141.11.20) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Tue, 21 Jun 2016 16:08:32 +0000
Received: from DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) by
	DBXPR07MB239.eurprd07.prod.outlook.com ([10.141.11.18]) with mapi id
	15.01.0506.017; Tue, 21 Jun 2016 16:08:32 +0000
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Adding Bash to meta-toolchain.
Thread-Index: AdHL1yAURM1ClMOIQRmp0ko80GJLvg==
Date: Tue, 21 Jun 2016 16:08:32 +0000
Message-ID: <DBXPR07MB2395258466152EFCDCB4ADEF92B0@DBXPR07MB239.eurprd07.prod.outlook.com>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bartlomiej.kucharczyk@nokia.com; 
x-originating-ip: [131.228.2.27]
x-ms-office365-filtering-correlation-id: 018ca17f-783f-4695-7d72-08d399ee4ab5
x-microsoft-exchange-diagnostics: 1; DBXPR07MB240;
	5:mGtTwqwsFiPBwBktxfUWMtYe99zhr4wDhqc0uf7iw0wPO3QG97D+eoJyxxZLHEh+DX9y1VaIkKjg1Wz7TwWDOdBWEV8s4bCr3/qFXtuubemGPVaKtELg/su1RqPCz1lF6/3aAKRRFeU2z+Wum1lMyw==;
	24:22y/ff/hLuqyWJLvrXT89KnBWPxCHt8ijyA82B5YOJhsM6vb6E0OK3SSuQaEyyGSsuuScglAaoF+a1vvmg+JaYXZmHqCMmhzjq7boSbLVVU=;
	7:i3nBByMrN/qKo7ZicP/zFd/imjuLwJfnyDbMo/UaxHoWg+x9gc6gINtTbr05sEGyHqa2Vw2lUTaDe4nS45LLRVaneadCC2aMJIO7NCHrchIyUJQ0BSRVjZGLDlUSYWOJVX/2AqaTonkUxe6Cv/hb1oNIRSqhERsJg/kj5F9TWxeR182bN0tzDzX79xGIF/Te4imhmeJYbSi28O1QYrm42Q==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DBXPR07MB240;
x-microsoft-antispam-prvs: <DBXPR07MB24067379EEE9CC0FE53FDC9F92B0@DBXPR07MB240.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:DBXPR07MB240; BCL:0; PCL:0; RULEID:; SRVR:DBXPR07MB240; 
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(189002)(199003)(87936001)(106356001)(105586002)(50986999)(77096005)(5002640100001)(19580395003)(8676002)(54356999)(107886002)(3846002)(10400500002)(97736004)(68736007)(101416001)(110136002)(2906002)(8936002)(7736002)(5003600100003)(7846002)(7696003)(2900100001)(81166006)(122556002)(74316001)(11100500001)(33656002)(6116002)(586003)(81156014)(66066001)(86362001)(102836003)(3660700001)(450100001)(92566002)(189998001)(3280700002)(9686002)(76576001)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DBXPR07MB240;
	H:DBXPR07MB239.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2016 16:08:32.1546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBXPR07MB240
Subject: Adding Bash to meta-toolchain.
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
X-List-Received-Date: Tue, 21 Jun 2016 20:42:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello!

I have encountered the following issue when trying to add Bash to the SDK (=
meta-toolchain).
After SDK is installed, bash is not accessible in PATH.

_Why_
The bash binary is installed in ${base_bindir}, which is not part of PATH v=
ariable in SDK environment script.

_Possible solution_
I can try to send a patch for this, but would like to clarify first if that=
 is a good way. Please give some thoughts.

Basically my solution is to adjust "meta/recipes-extended/bash/bash.inc", a=
nd merge do_install_append (where /usr/bin/bash is moved to /bin/bash) into=
 do_install_append_class-target. Additionally ALTERNATIVE_* variables must =
be adjusted, due to:
      WARNING: bash: NOT adding alternative provide

With regards,
Bartek

