Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0067.outbound.protection.outlook.com [104.47.2.67])
	by mail.openembedded.org (Postfix) with ESMTP id CDEE9607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 23:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=hZz40qoIlz3mGqc8nOLk3pZ+1LoUJNPI4fUe7RkNguk=;
	b=fEEZE/rrfwiTnNEsfCTvS3djTakYxn7kRicND92C/csOtYRXXv6jzUG8YvVcXse4eEa9e5bc4L2DUx5AP83yxIm4QcXIyt0a32KOn8fXf8Lrc7qvzx/IPKFOnepjHT0UMUCU2X5rIex8ccx5sM6SmtG+qvEa7IvyWmyqyb9EO3M=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AM3PR04MB308.eurprd04.prod.outlook.com (2a01:111:e400:8825::27) with
	Microsoft SMTP Server (TLS) id 15.1.506.9;
	Thu, 9 Jun 2016 23:12:48 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Jun 2016 18:09:19 -0500
Message-ID: <1465513759-9629-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: BY2PR1001CA0024.namprd10.prod.outlook.com
	(2a01:111:e400:5a6c::34) To AM3PR04MB308.eurprd04.prod.outlook.com
	(2a01:111:e400:8825::27)
X-MS-Office365-Filtering-Correlation-Id: cae5c5b8-e127-4d2a-01b5-08d390bb9347
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB308;
	2:+pm9sp2IrX2j1CFGCe7fzpohZsf9FP01EzDRCeiOg3Of9o8KZpugIt61DSWcMG1AkKxEvTmsN+9h0BH0LiB1ED3YqZxtwEEMQQZrFRi3d1guSQ9CFif7dwA7441YmF4LpNtfEfe2BQm03PLKdmYX1OGj8X2s9PeVadInCAe2TKD53x+zTNvPD3XQfFdLM4yl;
	3:kv/hOImvvBTcf/wpn2ohbB9u8ebdcJcoGWzRJ+jzOt1Ru14vJKW7PK6TlLRVaCpyVIza11PJCuXddRWJdkpZQhVgGnUA8tShBykQSfHzz40DSKtH0/UEWP214o21oU/3;
	25:QDDf718Q/B8koeZkUfibyTVSV9ZeM0YE6y5bHyJJyX34RNKVlE1j7265dOlNAV282rlTpuDz9uafC+fY+IRXc4zA7TjrWPBv6dY7p1f0iILyQA1+/l3wMGeVx/JBNv3NcvbIkq1sIOucZGg+NXdIYeueBOV+latJX5M5tiH/v9mrCHU6y6DdOKT62NtD+3Q6/nOIESRkfVCzuO1O9NbtU1GjktVmQUI3mlKroR3kUwkiYF138gD+sZnskMDZVG/MF1U8ToriiTqJd8NGGx1PrGlmVwpZgZpoYZcz7CAQBSacVxUgO2f38AwIJ7ArbRwp6Fcxhrdzmes8YFmKA/kODr2IrGtBSb1VnVCUvQFf0Gu5dRik/ylqOgORW8HYlMEafnt3tAXb7YctRV8l5W+Ns9Y8guM+lQGxqVoS6FamxbM=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB308;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB308;
	20:NQSXUYmh9xMSc/5sThNEmjR2qyWQ7sKDI+kIrM+A0ZMElSOQS1CRoPT+7GvjDxiRmJBqE/E/y3EFXFCuTarUBblcA9iknDrS/rwDADQPxA9dPU5W7K/u0/7styUZkdptEEz08hf61IjXraoJvuvpuNQkO1dPyEBbeHalZ8pVFO/XmyYQ0mRHolmIBRQie8SxS3tuPeLRtsLSpOFs1kEPKSVnlVtKPU58NCe6BbxnvAZPWyxGwWdttUPCjI8fiOCD7aFNdaEDC0/uciMY2Of0z/2y07cnDLnklkjUlFxuBcOf2cnWxK1UeRFuXtJAKQMZNoHM7mpmxrvVamGFTY9W7lcVt59lzAlkk764ahYMqm8cE9vOERAbFIdpYDkhEpp5mYQxwHSn8ZMBwWyAo8lYoPimTHD+NwdWeTp3TmufaG1q9Gyu7Bkre6taWoZIKpG8RnyoKJKZ3dPl6gzVm361s1ryXATftg3x4wk/92coReN00MSvwev95sShRnP/o5Wl;
	4:EVTOnGHhv4/KWHRZwRoagzBmrU6DNB+z0fC3CYLzyUFbjiUqfzmZPa4EMhqvJdOftJLm7qQQ/iUJRx5FCBONPm9sR1oQUmbU0rvG1MsWDneQhrlwLIUfDuQ2f/jI96gcY5TQ13qUskg78t+pS4L/hjeVnZ7O0rXAywt9u6HOTO4RF1QIxWmkVZGVPTcjIh3WTsxhLmKLZEjQmhERYX2zsBi0YwxMBnaCllnQRFnFM15Kyy+vnmSJoVJgyhIParw8AY8gGm+NhMFskKkB6lE/Ks0lsJLB/FyFoThZqaSXqBVFApq+3cKYfffzZqm72jdpGgpPvaim+F6kOy+nBHlFmIOJtkL8DaDnNcSJFb7f0BKryqNq8HGRQnmnvVu73UZ6y/RhPnA0tqL0qXCD2eoF5ODtRYNaEOOcedbNuoHzdsZxg7BmZXap0zdo/ro7FEUt
X-Microsoft-Antispam-PRVS: <AM3PR04MB308D77B29CD18C614BD41BBE25F0@AM3PR04MB308.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:AM3PR04MB308; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB308; 
X-Forefront-PRVS: 0968D37274
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(199003)(189002)(19580395003)(105586002)(92566002)(106356001)(19580405001)(33646002)(81166006)(97736004)(50466002)(68736007)(50986999)(101416001)(450100001)(5004730100002)(586003)(6116002)(3846002)(8676002)(110136002)(229853001)(47776003)(2351001)(50226002)(5008740100001)(36756003)(4326007)(2906002)(86362001)(81156014)(42186005)(66066001)(189998001)(5003940100001)(48376002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB308;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	A:1; MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR04MB308;
	23:3Jzz4vC3Mnj1/FO74O8FZMjdGQybZ0XdNX5lcNEbwv?=
	=?us-ascii?Q?nKzKAftmx4qKXykzLa8W94Gec6U9yQ7r2oN8ABhpBOIBZxCLoyoKw/M6EyFO?=
	=?us-ascii?Q?TFPv4jSLP9GT7/IqtY5mjG0OjdvndB5664cPF0wbNAeARBgfUII3N9kZb5JZ?=
	=?us-ascii?Q?jabEskzfdOP5JbXTuluiaGX4M3HqZxK0GITP5T6fqIpzWwjV+KKF1xA4r4fR?=
	=?us-ascii?Q?Bi0q94qQ7NrowRRqGCfetOPpc9LIU12mjATJ2D1VbYPsKJ+3VEFB2rFdFuHb?=
	=?us-ascii?Q?QlYqvEbLDk700+6Ed3z4DIBuusgRI/oeywAPYGu8TwO1THqra0Qc66h2ceGN?=
	=?us-ascii?Q?Dh+KnXlFjWNoHeO55oUwBfjBTVw0TfkjiaWRSOW+BuvOyISDkmdPLyOgGNbw?=
	=?us-ascii?Q?FWoGww7jj1V5IB3d8pOmmNJC8Rx/gnzpBUZ1Le0ICuoyVi19nqXaEbw8CG0x?=
	=?us-ascii?Q?0g0R2wBFJ1U9vMXEMqaSt47npfyk5MnJYTuJ1pNz6S8BMqtXnLfu7QHHMbtm?=
	=?us-ascii?Q?2DEM0Xkr36XIc6uQ8W3dZFaQUol4S+T4PYtSzi67G8z5R/0RdsHa+JdNWYhL?=
	=?us-ascii?Q?26F/z1lCEI4rc6lAJFYzdDyxR2PbwcaR3NTfTq2lOcmU9upNGwHZEs120NBa?=
	=?us-ascii?Q?6lCbPf/6emIrtLt38EENAk5fNGDrlR84P3LyS8Cm9SPVS4AGiI/bo72jJ91y?=
	=?us-ascii?Q?wt6cglv6QqFFpoFcAiS+dXtDXqRPII75bYK4fGnJk7IyJ7/IH26AQwX7ljFz?=
	=?us-ascii?Q?xjiHgqEFNUFT0QOaiYO1wqF2oi94X2foFR/MhvhasmG/WiD1pD/hZrwOkpnx?=
	=?us-ascii?Q?vChoHKgM/QKOn65xYAy5iRA3WV71rrMwvyhMHa9W5j+dd1s2J77ftDdpYxOI?=
	=?us-ascii?Q?k/L3eCGMjHEVLPp6ho/h35lA2PWJgvoZ8sHTh3zuCax5FxXqdOKIBw4Az9OM?=
	=?us-ascii?Q?0AheoyCYp/xwxRrOocWcmDenY1Ix/CTS3JtLfCjLkSKOo+M4zGwEp5hMqNs1?=
	=?us-ascii?Q?hgt4sRHOWAdYuQvuMIPdT/?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB308;
	5:9vIwiTvE1TqExa+E2fzGGATRFkTWDIrkJsAd8kAus85E5egWFsJiRv02JY+7MCmOGRxcYAziH4BRCCWFSdq0B5StTXx+osrXXd1gZ3ah3NH/09Pputg2iaBDI2ntqUad1kZ7hFzgBfBEtV3ob1hmLw==;
	24:Kln1eNyOcTu4XNGTb09A83I0ii0r4JE8X05yVzS7nmHz+fKHI4rWeGxIjCeoL0Sjf0w0joeqyf8fE47BaStJ7BWVWJJojkRnyXEPVOhAHtM=;
	7:Qa9kRCpjLQSTK0FDkLazAd+1IKFhPeS44Zt3YsAWwqpMZPk1j0Mf3EvDFfZLpPEPeD48krCSjSXajVSboFNt69FgVmfpO952JqONlKUHbhv+nZijPnT0iF7h7db6HNlUD0ZIpiN/NowWg3pyc+3SAw+zapIBuK73kSh1SGmvQ+rOEToR9/LX6GYdL4jTuiymwqtlyLpxzzZkFHjyBTnKcG386neE8oteLsfz5AkcgS4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2016 23:12:48.5903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB308
Subject: [PATCH v2] weston: Fix bug causing the xwayland package to always be included
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
X-List-Received-Date: Thu, 09 Jun 2016 23:28:10 -0000
Content-Type: text/plain

The xwayland package was always being built due to its inclusion in
PACKAGE_BEFORE_PN. The effect was masked by making the RDEPENDS conditional.

Now we make the PACKAGE_BEFORE_PN inclusion conditional and restore
the xwayland RDEPENDS to unconditional.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---

Changes in v2:
Remove inappropriate RDEPENDS conditional.
 
 meta/recipes-graphics/wayland/weston_1.10.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.10.0.bb b/meta/recipes-graphics/wayland/weston_1.10.0.bb
index 37a4839..6b934e2 100644
--- a/meta/recipes-graphics/wayland/weston_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.10.0.bb
@@ -100,14 +100,14 @@ do_install_append() {
 	fi
 }
 
-PACKAGE_BEFORE_PN += "${PN}-xwayland"
+PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)}"
 PACKAGES += "${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 FILES_${PN}-examples = "${bindir}/*"
 
 FILES_${PN}-xwayland = "${libdir}/${BPN}/xwayland.so"
-RDEPENDS_${PN}-xwayland += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'xserver-xorg-xwayland', '', d)}"
+RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
 RRECOMMENDS_${PN} = "liberation-fonts"
-- 
1.9.1


