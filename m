Return-Path: <andrew.goodbody@cambrionix.com>
X-Greylist: delayed 935 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 24 Jan 2017 14:23:21 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-he1eur01on0094.outbound.protection.outlook.com [104.47.0.94])
	by mail.openembedded.org (Postfix) with ESMTP id 44EAA77225
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:23:21 +0000 (UTC)
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM (10.166.249.144) by
	LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM (10.166.249.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.860.13; Tue, 24 Jan 2017 14:07:46 +0000
Received: from LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) by
	LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM ([10.166.249.144]) with mapi id
	15.01.0860.021; Tue, 24 Jan 2017 14:07:45 +0000
From: Andrew Goodbody <andrew.goodbody@cambrionix.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: configure error for glibc 2.25.2
Thread-Index: AdJ2St/27Lo07BMlSGusqMFehWa5Eg==
Date: Tue, 24 Jan 2017 14:07:45 +0000
Message-ID: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=andrew.goodbody@cambrionix.com; 
x-originating-ip: [46.17.166.30]
x-ms-office365-filtering-correlation-id: 9646a7bb-f2f5-4565-7e4d-08d444625f02
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:LOXP123MB0120;
x-microsoft-exchange-diagnostics: 1; LOXP123MB0120;
	7:WHHeQYMi1DMdcCUvd0zxEQbWT+6H7D7llqRZmdzETAfi97Blt0UnMW7IMj7Oh9py58sZsI/5txkAhCbtoFpNiLXtPSqj7hNuav3yfOj3Bctth8B8LyCqPOpiaOLT74bWDK8WsP3HRjFYa9f6NOaOyQBtx1PzV/VEe0rqSZSVsgBTSTld3DXaiN/sglQ+DTH73wiCOSY8YeD/HtWKmm5rDUdmEpRZ1ixjLMK9ze+Dc2n8LFj4vQr7wh+SFEGMukRrf65kpkIifax8Ssi/QeSfuxDK4XjUxOWR8gCjokqJD0MJ5fVwjW8d88D1uaSQ/kMd082d1Swopi0Sok/IwuyXjByvIz42BK10CC/jrnZSWOfcSbjQmEw0c3TrKqf31uAdgN4MCn/W7hF51zbnWYYdb/IJcUgcZ5ETW8FwgxvcYrZYpMV6NB43FQG2Vtdy5NNhHAX9S6kKYd3KUZDaEpL7qQ==
x-microsoft-antispam-prvs: <LOXP123MB0120FB88EB3321AF0A803B5A85750@LOXP123MB0120.GBRP123.PROD.OUTLOOK.COM>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(2016111802025)(6072148)(6043046);
	SRVR:LOXP123MB0120; BCL:0; PCL:0; RULEID:; SRVR:LOXP123MB0120; 
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(39830400002)(39410400002)(199003)(189002)(106356001)(450100001)(2900100001)(92566002)(101416001)(6436002)(50986999)(6506006)(77096006)(54356999)(6916009)(189998001)(107886002)(53936002)(38730400001)(105586002)(2351001)(5640700003)(110136003)(305945005)(74316002)(7736002)(7696004)(6116002)(5660300001)(3846002)(102836003)(66066001)(97736004)(2906002)(81166006)(81156014)(33656002)(8676002)(86362001)(9686003)(8936002)(122556002)(55016002)(3660700001)(68736007)(3280700002)(2501003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:LOXP123MB0120;
	H:LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: cambrionix.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: cambrionix.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2017 14:07:45.5953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6eddda96-aa38-44c8-ab83-12529d9cab1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOXP123MB0120
Subject: configure error for glibc 2.25.2
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
X-List-Received-Date: Tue, 24 Jan 2017 14:23:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I get the following configure error when trying to rebuild my tree today af=
ter doing a sync.

Is this a core issue or something wrong in my tree?

Thanks,
Andrew

| checking installed Linux kernel header files... missing or too old!
| configure: error: GNU libc requires kernel header files from
| Linux 3.2.0 or later to be installed before configuring.
| The kernel header files are found usually in /usr/include/asm and
| /usr/include/linux; make sure these directories use files from
| Linux 3.2.0 or later.  This check uses <linux/version.h>, so
| make sure that file was built correctly when installing the kernel header
| files.  To use kernel headers not from /usr/include/linux, use the
| configure option --with-headers.
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/andrew=
/src/camol3/camol/build/tmp-camol-glibc/work/armv7ahf-neon-camol-linux-gnue=
abi/glibc-initial/2.25-r0/temp/log.do_configure.30873)
ERROR: Task (/home/andrew/src/camol3/camol/layers/openembedded-core/meta/re=
cipes-core/glibc/glibc-initial_2.25.bb:do_configure) failed with exit code =
'1'
NOTE: Tasks Summary: Attempted 779 tasks of which 0 didn't need to be rerun=
 and 1 failed.
NOTE: Writing buildhistory

Summary: 1 task failed:
  /home/andrew/src/camol3/camol/layers/openembedded-core/meta/recipes-core/=
glibc/glibc-initial_2.25.bb:do_configure
Summary: There were 7 WARNING messages shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

