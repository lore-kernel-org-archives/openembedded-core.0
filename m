Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0148.outbound.protection.outlook.com [65.55.169.148])
	by mail.openembedded.org (Postfix) with ESMTP id 910B175876
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:08:30 +0000 (UTC)
Received: from BN3PR03MB1365.namprd03.prod.outlook.com (10.163.34.151) by
	BN3PR03MB1509.namprd03.prod.outlook.com (10.163.35.148) with Microsoft
	SMTP Server (TLS) id 15.1.219.17; Fri, 24 Jul 2015 07:54:22 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1365.namprd03.prod.outlook.com (10.163.34.151) with Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 24 Jul 2015 07:54:21 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0225.018; Fri, 24 Jul 2015 07:54:21 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	"meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Thread-Topic: The different behavior of images built with different
	PACKAGE_CLASSES
Thread-Index: AdDF0u0XMy3p2vLRTIaaGJiOKSg/jw==
Date: Fri, 24 Jul 2015 07:54:21 +0000
Message-ID: <BN3PR03MB13679083D76EBB21AD5A1C32E4810@BN3PR03MB1367.namprd03.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [123.151.195.51]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1365;
	5:6pJzc4oqCUDWn89655qtfMkXi94m7QzGpSdaHOimMdksj037s6iFAPCQgDTOPqpCMfYtOy3xpHzFIGWeNl772g+oC53nLZ+lePRTclFC7pBoE4gxEBzh5w4FGPyj3sqhzTIW5ezji0hTpCs7XYiscQ==;
	24:az9G1BvCFL+USRrkdHBxSXW7CoTQlxoGWELeXu41gipM4TKJOcJ7ukTzUHpWgQn4b8bmRpY7ffyqRqIK9SdCLdMGuFAgZOb+OgeDaLLETvA=;
	20:TwB5f7Svzub5QDb5sSiW5LxJ5J0hyY+zzLTlA3B3xnWRjsuJLqou+3gaFxpqBF9hGwjhCbDsBaJdgL4rTOKR1g==
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1365;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1509; 
bn3pr03mb1365: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR03MB13659002FE90CDB4606CEC05E4810@BN3PR03MB1365.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR03MB1365; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR03MB1365; 
x-forefront-prvs: 0647963F84
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(53754006)(229853001)(87936001)(2501003)(86362001)(77156002)(46102003)(66066001)(62966003)(99286002)(189998001)(2656002)(92566002)(107886002)(40100003)(5001770100001)(76576001)(54356999)(50986999)(122556002)(74316001)(5002640100001)(2900100001)(77096005)(102836002)(5003600100002)(33656002)(5001960100002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1365;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2015 07:54:21.4019 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1365
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1509;
	2:dXmyIR/CH7Hzmtk1ilJyFofaVQf5U2kVtuHUIoFai34UzwIP8ggoIW1Ks/URz2Wr;
	3:6ylQpYraiwFYFif3IpGxwybvnzBGNO46UiMu+meoYcXVXJCiaiISmrOliPVKy2sZ+kVwDmmXepPkamXN3WqRG4JmuB1dj5vpF1Dhc1kn/5E9AWeN4W8yOs9GjeB9pxaPgxpJY+w9kIxA+Ttt8FH51w==;
	25:fjPsbV4qS10xS7yfBPs/gWm63tR2hOZcO1fJg10LDE9laNFGWgsabbLhbEf49aA/yq05k0aLIcK59VgySQYNDybmQhHp1fFQEBynwWhSjDUJMh+0/TQENbO3MrjQzX1s4/o2LY5ceEH/XP1neteZrFLTjI42ptjnm3RvyeMQwNFN2/t3+YlBaHf2kNu5bmQf3UnE8Am33Us/weTiyVz03l8W5p/WXloejR6Xaq1Sjm1z5c9l3zck46+Onf383zvDPQhZIY5g+eCsI+pkFSFsow==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1509;
	20:HBUzMLik3sqhSbTPA4r16gwQmjix6yokrmhH9a5MGcrlYJgtBBGLuK6LMNLI3Hm9T4hoJ2YowbCg/yClJXhEdyzTq+BWNSvDYzPSmCFuahOga8921nWnRW46dWC0/wDlRUGIDLQm0zaAtVnX6HNgheRQzw/sHwbuP2Eypur6VfBpaxCHFdNZUXCJK/kT6WslYF665NZC+Ef3A7g+aaDxFzhccdVEdWCu6FcJJjjcNT3xuk+d9H82LNVjsbMtVfE19y9aGtgbYGNsCsK1WOJP8TqD6cNxeoyWeDs82kyRZYyjKnqsdmy+WjpHXTAMCl9x88Xy9gBS/Yba63dUl5v6fOf5nzN9icW25Tg31Yo5vcSihYXz3aaC+w1VNRKBbFMupvOHtg+LoOq0fwDsZ2fXm32Fa+eOnb0INn/1wwI6vumdSiGznRRjZk00w77A2kEa3DhZtC+fBnDJowY1RcI0ufPJS6FKLZx+45XOCNcMmgzeVuJFMUUXoqkqNStLJ+v/;
	23:jKuKongReklWZiyoNcC3GZEXZMD6nv2H34ROaNjauoTWfis1cEyWvCcYhtGbjSUV84sIM0nnHXZqYPeRHpcxAXeq1YRrSi4JkTPUxrKXgtCVCAQ/sM0mkKu5MorBbjTWzaaXD5o7ZvBrayid/tgK6f/WkD6jLSjZy+tVv2doFpjJsi00PRGOtMZ5AuAbbin0f8my5y8DKFEWBMB5H6MOKRSlRTELQTZ7a+TJfmfxJ1lcRxmhOhiS6JCrHX9oonAc
BN3PR03MB1509: X-MS-Exchange-Organization-RulesExecuted
X-OriginatorOrg: freescale.com
Subject: The different behavior of images built with different PACKAGE_CLASSES
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
X-List-Received-Date: Fri, 24 Jul 2015 08:08:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,=20

I use the same Yocto build environment to generated two sets of images, one=
 is built by setting PACKAGE_CLASSES to "package_rpm", the other is built b=
y setting PACKAGE_CLASSES to "package_deb".=20

With the same uImage and dtb, the board can be boot up normally with rootfs=
 image which is built by package_rpm setting, but can't be boot up with roo=
tfs that is built with package_deb setting, it will hang with the following=
 boot logs:
RAMDISK: gzip image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
devtmpfs: mounted
Freeing unused kernel memory: 180K (804a6000 - 804d3000)
Bad inittab entry at line 5
can't open /dev/si: No such file or directory
can't open /dev/~~: No such file or directory
can't open /dev/l0: No such file or directory
can't open /dev/l1: No such file or directory
can't open /dev/l2: No such file or directory
can't open /dev/l3: No such file or directory
can't open /dev/l4: No such file or directory
can't open /dev/l5: No such file or directory
can't open /dev/l6: No such file or directory
can't open /dev/z6: No such file or directory
can't open /dev/S0: No such file or directory
can't open /dev/S1: No such file or directory

Does somebody meet the same issue previously? Can you please suggest on wha=
t's the reason and how to solve the issue?=20

I am using daisy branch and FSL ls1021atwr(armv7) board.=20


Best Regards,

Zhenhua

