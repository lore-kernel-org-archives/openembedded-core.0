Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0082.outbound.protection.outlook.com
	[104.47.37.82])
	by mail.openembedded.org (Postfix) with ESMTP id 62DF771A37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:23:50 +0000 (UTC)
Received: from CY1PR03CA0038.namprd03.prod.outlook.com (10.174.128.48) by
	BN3PR03MB1416.namprd03.prod.outlook.com (10.163.34.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.659.11; Tue, 11 Oct 2016 10:49:17 +0000
Received: from BY2FFO11OLC014.protection.gbl (2a01:111:f400:7c0c::157) by
	CY1PR03CA0038.outlook.office365.com (2603:10b6:600::48) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.629.8 via Frontend Transport; Tue, 11 Oct 2016 10:49:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11OLC014.mail.protection.outlook.com (10.1.15.48) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 11 Oct 2016 10:49:17 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAnEtd015976; Tue, 11 Oct 2016 03:49:15 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:49:08 +0800
Message-ID: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565576176878;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(106466001)(92566002)(48376002)(4326007)(36756003)(586003)(5003940100001)(50226002)(85426001)(6666003)(104016004)(50466002)(8936002)(2906002)(6916009)(230783001)(86362001)(33646002)(5660300001)(97736004)(87936001)(68736007)(77096005)(50986999)(626004)(7846002)(8676002)(81156014)(305945005)(47776003)(105606002)(229853001)(189998001)(110136003)(81166006)(11100500001)(8666005)(2351001)(356003)(7059030)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR03MB1416;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC014;
	1:e219ROIlelaDZcrw4bgcM4fOYzMqw0PMzq+xC2gpXAJD2F+MK/lDPyvq0vjPONPcCkRU5qpjS4cKtj4ca4nn61JX62sGy0p9XR4rcKmBeEtPqnCB0pZU/FNgjJdVYSWI3czqk9iQNMXJIRSGlqyP2oru7yYZwfGkduf0371Q7re2LrwtO/qoL4/oCnWAJci54Zl7+KNmobChfvdzWLaUWa88OpJtF8gp/xptf+rVrLXzAGGWPSPwBopkbDzwY4Cr9bTUZmgt8wzRmIwMsLfL9toi4xR9dsDUO3C6RANLmDnIYJYVokMEYS6j3noQVnohqOIuHx0kLZ0vt95JPUNAcHzvxWykjuPjP5fu1mlisGQneMC5SwZIxDKsFCGZw+ifJ0sentzNVcIPedn3i99mlwu0ji0D/IJd3veX+uzpbSbBx2gfjME7hf9MGeUvCiJvWpxUx5q3dB+mkqDeQEbrfmzEP0Zat1JvzlWyr0a7XlksHd+DaL3FCslbnaDMpWRr5jpRDQRGwiFky9IkVNWPJFKzEgKTwZXU2i94Yup2/GXlJxk+aPcl53GEBUS+lccelSIgRodLaf5pia08BVI995S6hjNtGXk3nRjJ1eoyXaiUq8LUuzfzSgxsWJ0Mx0oRFmyH3x3u/xIMCqY5/aIZErp3dTGpQVArLvolsa3uROT2I+bnr2LkjZrZlV50LR/BtilJKf4O1j0I7AsxZSJCTzZmZgloA5hsMbgNOxBd1YI=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 32567591-4c2f-4441-88a0-08d3f1c43fbf
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	2:nDgUIryrtBHCU5YwbFnDY0e/qVRYnGf9/AjaJPdLSikr9IA1sLyyiM7wsCjGKvRVPI/Rma08yrzJQ6/vLUIiWiEaSJBnrkZw93dVXkzFOxsPOieFA6Bdxa2c5ymdGMjMDdFOffl2MichfcjsSYGRDCj+Zf/nl0ynM+qsNG70xG7LSCXIdCaQ3oloHV37dlVG8fxartY8OiLZdcch8sirQQ==;
	3:cdDo42z8TH036MOgxLBpCwZDk61DAMegZzPmABRLoULq3d/xMWTau+QtLTx75l6sYaNP9xEoCbzo3wcDaIP2fAfdzPDzs7WResRlM8M0PjoI2rE4RAk0KY05OmfAxEE/6JNUPmFsDEWV10QjF6BqGUo/SiaptCIw4dcbFR3VPGkmGCJi8k9XBMfIPRqyeQ2r/5+GcTSnJumrARtA2kOCbfwzShmpxAEnmmwCQpCxdivWIqBrswrVJ4oTq+L7p/5j;
	25:Gey1S42c1crDzgwKCk5a0bJP+L9Zb5VjmarWRjP2i6AK+CEft770i2d4vN5YyGuBcJO7BNMr92DJLH7i0LOOrYMNhX26OIPcCICwzPUekPXMqh6fyy6qmzJj8ftYYb/2JTxZdnshKg4Bcq09udeWDlEHvEYhp8l4mIyuVzBiPh+W4ulrbeF/iSVIwrvdiGCQh+mVTVs4NJMusFzqY2jqOYObllWmAiBSyLgdcYzZP/EC0iv4s0NAtfBOfA9BqwQgoLjcF8P3dvhTRcoci258415EyUcqnBubH2K82wvWrhN/mEn0XicfxjHAQuWiILPl1Qv9fgNIgNmOzs8eH7lmiT+oRboGnbYC9isvSWtM4kA7/LJSF9xUd+dNdLfzOEoy5vAh3a6r+MWs6sMWUzuud/MidASXSdnk+dhhGlM940tIhC/eaYDxkJfnJBYv83nb
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1416;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	31:SyWfLrImIg8AsMUUg/7WUxXRkCoNAaAWv2OJju+jMVyuMZXAC9WyEU4uB6W7N35XPqrshMTxnPTMssBkCC7fpPW+rwwkjFSgKRAP/5phpcqc7kNVM7eKongW8NBrgAknj3L2sI0UNM3mzfuRcbnLqK8+PwnCF/ggDTuTiNj+EvMPBMML6G/IbKfUodeZ38B6rNfGzA4L40SBZR/T5JluZrhgh9Zm1SeZl4jyOhr4Hj2rUFWJkT069XjjFO0jMx3d;
	4:ZdKYyt9g6BZB2s4RiQm9RTWWT+KhX7mOjYmOOa7clyusrL7tohwdog7qSiZdD3WEv5tNtlEC2nrd5AchckIG7tQa1a2ufoqhYoMrM3jLO7h6YJPNXL+TgEUt9CtJgE//OFtiGrkhivfJCosrod107UdNIiqh1cNolOMwNBDPL9s5+CtsNyMq5Kt4uGAMrr3xR70eoofoNIy3Ev0D9D7YxEb8QqpicFeKaHBpiSiLzfxHVZxkjaZPpAveb4aLUN3VBjtf3C6XXD6P9tLTgqchQV7z0qAvPFzunpHQw447PI75bfrMCa3Vw45I6CgWLikPJrrhHYRKh5t/yvmn8y/dH9AmXIXYxlTuleqth9p77hu7ZbokyATZOtkfmP1UIbis872c7738JKimIxkyYDxmBN3zbbYgHGfH0a9MgM2lrY+Ft0EkhhV8gMqhvh/ZYbau06Tcs2+vVs7w/ekLstKGPXnpoQ/5Iuk5sXdpyBPnhIh2p6PEjbsruCyUtaUkiS1VWpbVFVHwerOg8QlSRwKLKf28GwIIIziXyL6Y9a60ZuNar9d3aN3JvJvyLwA3wOJl
X-Microsoft-Antispam-PRVS: <BN3PR03MB1416279CA2E48024B09ED09BE9DA0@BN3PR03MB1416.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13018025)(13015025)(13024025)(13017025)(13023025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BN3PR03MB1416; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BN3PR03MB1416; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1416;
	23:b/tHUmOa4mu062KlHDQH54Mzt2lyxi3/BytnxgQ6F?=
	=?us-ascii?Q?mU85ufUGlkhk4gDvlXhUtKXB04+ruXeA3Tg3PuPlFH3+YkhTMkkrHIMZs6t8?=
	=?us-ascii?Q?s9+I4PM3HB74xo0PsRMvHhE673zgSy8ymIsJGgEGMPIgfcREnVf2V95fN7rQ?=
	=?us-ascii?Q?1rLnhM3iL62x7h8oieRSpHnV8jAqkrYKKy35Le/okTOuuy1e5sNMxb5Dr7ov?=
	=?us-ascii?Q?iCNpPQkMfj2Owj7xpyHXBx1lCI9NxsRSI1mJLBtksWqlDXePXxat32jk/r3S?=
	=?us-ascii?Q?ShHu6gNbtc+IhaZC5OsgsAUGkCoSrkqkfn1GKiJrPHrHX4sW9YrNeF+wd3qq?=
	=?us-ascii?Q?6VXHg2Jrf522vu+SGXZ+9cFVrKR/mbGjgBo1W3OIPNqdNn7q/v2FZ5H0g0j5?=
	=?us-ascii?Q?0zEJaYgzFCb1qdVWH22O+l0Q1NOv+MdwhmQwU5jQ1YEKK7gq9evy0jBzLzRi?=
	=?us-ascii?Q?+sLWGV8r+oxqmddIySYFs8R5LusIYx082mPysErrtzfnAOeB0xRwWaoW56pP?=
	=?us-ascii?Q?4qm1rN1wK4PuZLyvdyvK3Se4wNjm2NGv/HU+N3kCSAgDxRecwNs/1iEcKJrL?=
	=?us-ascii?Q?/ByUmjEVh6Tq6YpTdKYCb6l6gaP66TR9cesxXnU6ksMWJ3C+RufdxMMNdF4x?=
	=?us-ascii?Q?LDia6orTaCIPFF4gKoEeFZUFOfuq1JcHG+kCjCIYuZLIZ6ydwjQOUjXFy8ld?=
	=?us-ascii?Q?obmQn9253wWQSKYfyoyv7AORvMv2Gq0nanCnqhFxtWOkQcSrPwW8V6Dso1qE?=
	=?us-ascii?Q?L1LAa2QtU61qgbq4L6bOGiVki07cmAjTj+RR+eYLJyjQiSdc+Ssrfzn+ID0M?=
	=?us-ascii?Q?EWQh+jakRxp5/jPvJwnuElPyGW+phcpcziQRYaJa/kES/sblcTI6jV1XlueE?=
	=?us-ascii?Q?0hTS7NxTOWmsdaBY9hy6jStHVlny4frukxHOfhCmTuCyUNGI1+DfOBM1LCKZ?=
	=?us-ascii?Q?glk2+8wJzMHUBmSCXS8YKRoP9H7m10ccUK3A20gjJgrbdjIaP6lrz2rPGWVX?=
	=?us-ascii?Q?rhx9GYruKbN8CGiX/GRVljtOhbpPXeyKci/D50mKsZ3InYrIir+yHKh5jPV8?=
	=?us-ascii?Q?DYXnqhfB/x27opeiXVK2qatYjnDTh4tADNineeu3KzjMMdLad/CxuMoUZrC8?=
	=?us-ascii?Q?Y7CDtXQ0yDKGUdOxYkE8+Gy0uuIpoNk0mAtmNic2aXSEx/+N0Edpw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	6:KxHf+4E1HbnovwydSZlN+vGl/Vgx8QfqCc0egE1ExK86D0ydVtiSU70GYcNsxsd3KUEj1mHgaOPkvLPqRPqrRumwa2zdLWgI7tEvrL1JPIABz2ZabZGZmrsxelzM64KjIoFNIqnsfgPZZXK85O+4OK+zVGY6ktbRdAsZl48vhz5xezz2orS9JvuxmpeSV87rBNH4b4AVIjBfAVwJnqvGJMFaqWinlznlP4tn6Adn2AtX73qz4WCo7xNPWfXnALv2WeDvcJ2W/PQ77gqMKYKuV+Pkt8dv0ym4eAnq34XE3SqX4qqGpBqCdMaOYQfjbNDP;
	5:D/aem1p0YMvaRJh6Dwj3zRrKvcN7Lvu89ol+VQ45d5KdeuGpOCUNQGhNOtD1K/yoAHFQ08WnHX7IktCUlF67YYLb2P05mdaq7z7yLxFXP6tFMnfYlItm95GRQPqOPAgq7VZ50ZMIe7sl2keLZM3i5GBIIa/glgSZftvPctOXRBPbZA8LB0DPyl2V3Hwap8k7;
	24:ak/5BiSiWklODodrGGOW/XfvaBiomgOcN7xN5vHfnHZ2FvRlaUPjYEusFxgmrUdBxpfhCm+cbyXoerMoMVkXBqouXZNKtEz+u5VpA8RC6CA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	7:h+gDV5LzSfkUZBsRfEXoX501O0pjsuqsntxdgiqrjrY8YO6Q4+P4gMlVnwNMo21FB1ZUHtOES+iVNRDtvgTOeSMurt2erq3iY/z6KshfYeiu/+7GIXc2xDUs5/F7/xewkb103GyrjkCZ1aZ6zXPS4n1c4QeFT15AT3uITx6u2AOesm0AHuGZMw0RoGZ9cS7ijdL46isiejhZTPp3kTP13CDtZL0NhnOJMY1RPNMXEm1a+E1RcUY4E/a15JnZYrnzyOLvSWDxRxQaLrUZuhVbshLzLI4PFwToLXKzmnvYCVl9uENx6LH6qvogqXbq4mIau1o7WKghqREdN/DTRc3NeiAXbiFRAiFl6ThymwT/czo=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:49:17.1496 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1416
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Tue, 11 Oct 2016 11:23:53 -0000
Content-Type: text/plain

-Support video rotation by using transform matrix

-Fix wrong attribute list type for EGL 1.5

-Fix horizontal/vertical flip matrizes

-Fix glimagesink cannot show frame when connect to qmlglsrc

Yuqing Zhu (4):
  gstreamer1.0-plugins-bad: Support video rotation by using transform
    matrix
  gstreamer1.0-plugins-bad: Fix wrong attribute list type for EGL 1.5
  gstreamer1.0-plugins-bad: Fix horizontal/vertical flip matrizes
  gstreamer1.0-plugins-bad: Fix glimagesink cannot show frame when
    connect to qmlglsrc

 ...-glplugin-glimagesink-support-video-rotat.patch | 574 +++++++++++++++++++++
 ...Buf-Wrong-attribute-list-type-for-EGL-1.5.patch | 194 +++++++
 ...ink-Fix-horizontal-vertical-flip-matrizes.patch |  44 ++
 ...x-glimagesink-cannot-show-frame-when-conn.patch |  71 +++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |   4 +
 5 files changed, 887 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0010-glplugin-glimagesink-support-video-rotat.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0013-glwindow-Fix-glimagesink-cannot-show-frame-when-conn.patch

-- 
1.9.1


