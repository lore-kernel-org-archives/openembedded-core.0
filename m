Return-Path: <carol.zhu@nxp.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0064.outbound.protection.outlook.com
	[104.47.37.64])
	by mail.openembedded.org (Postfix) with ESMTP id 7C14F6011F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 11:22:35 +0000 (UTC)
Received: from BLUPR0301CA0030.namprd03.prod.outlook.com (10.162.113.168) by
	BL2PR03MB322.namprd03.prod.outlook.com (10.141.68.17) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.649.16; Tue, 11 Oct 2016 10:49:23 +0000
Received: from BN1AFFO11FD010.protection.gbl (2a01:111:f400:7c10::178) by
	BLUPR0301CA0030.outlook.office365.com (2a01:111:e400:5259::40) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.659.11 via
	Frontend Transport; Tue, 11 Oct 2016 10:49:22 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=fail action=none header.from=nxp.com;
	nxp.com; dkim=none (message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD010.mail.protection.outlook.com (10.58.52.70) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.629.5
	via Frontend Transport; Tue, 11 Oct 2016 10:49:22 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u9BAnEtg015976; Tue, 11 Oct 2016 03:49:21 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 18:49:11 +0800
Message-ID: <1476182952-15222-4-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131206565627632038;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(76176999)(77096005)(575784001)(19580405001)(5003940100001)(68736007)(626004)(2906002)(50226002)(48376002)(230783001)(86362001)(110136003)(586003)(19580395003)(36756003)(8936002)(4326007)(47776003)(6916009)(2950100002)(33646002)(2351001)(105606002)(305945005)(5660300001)(8676002)(6666003)(11100500001)(356003)(81166006)(106466001)(92566002)(7846002)(97736004)(104016004)(85426001)(50466002)(229853001)(87936001)(81156014)(50986999)(189998001)(15975445007)(8666005)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB322;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD010;
	1:njopg3zoyTMn0k8GB6Qi+Ic2lhyjvH3b6lRjGXxTXAODApue9Ppaq+nTeb9IYKcaSxNs3q0JIhGzDdZ+UUt1eNbg29T3G7tPyNQa2WsRzkV8XvIeGFHZDh4EofFStCawbOEzBvknxeRYnuYXazRZrBM/ROyMqjn+v9FcvqYzX7/l/fHVrQAWryfA3nij4w1INCllzC+AiYt/iDdVeuRjrsy10GVWvc93Ui1RdFQm1a2ea/t/FsnnFNSPMzIxBHsXcDhe/UHnFZQ7LzqP9vMt4pRw9E3JhScmiMkWkHajxccuhApIiREwkssbM/82dEtKxRVsf5ETVaKwxnStZizDNAOgRHaXzDjfuE7Ud3cB5iY02fET/8yBukylE2GlTKKySAi4dLhr9zazKNd2oGPPPriw4lZ9+3Mk8HFZfOl8J4YpfM/3xVsRjAJgV0WbEuADBjeQRvtSDl0YuoQ/vUozHtZnlTcSZCQxEHmW5L3MNTUq5hLCCOdVRG774YyIF88NPVCSoU/M7CTvqOQf/PVwLOiADUqFApnw0JuoaGfbFgxRzq3ZC1MpsnZDEB8fB8KMe8SoZIx12Cj9EqSuvGu5sQFVkTUXpqBhMERbeEiJXghzwEw7ILoq1ot13dcdCOMUd+7z9u01DwrXyG76ZIzBF/wTZdkD/RKgSgSiOd0gVRqZi7BrT/HGKucwVfDdxvtXMzySQvLY1eiaHLXuNs5x7zTs3XAQuCyQOrr9x+UxsoM=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1fccda3c-be47-4820-b845-08d3f1c442e3
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB322;
	2:0vlXPCEotjoUsb1EZcMu3gunFIbV3iO3AVISXwLF+DK94EOX7SHodAnM0Gp2s4Vc967wR+k3Gan8zC0iJ3ER3pFB5bFsb6SC6hP4gzjCrjutk+zC5vo8Slf/+ku0a2yW3ZbDliNNy+otxPN484bFwXjrfDIZXGjBDBPS4xhTp9yoWwVQJ16yCO/Nv5+B6TyrV2cLXCXSsMRoC5SiCtMP9Q==;
	3:rsPvUj8/80i+4lB+9GVn9HqkXeNWasPsyPlU2uFgNdCTeM6uhyh0iJPqcY4tWmNKiJbmmHgMjcsJCIgXRIynmq4/Z88jkMfta95fVGvej4F4R2RKUYmgOvkM3yzkRgC522+RDHufrwWnrv7BSN00zRLHDMR0BIhBaPH2O65HlTICCtFKxKamd6GbSquxZpG+Lo9TxuJSijOcT3S3mU1aYQ9SD7XhDeAN2CgVriLqonjYOC2ZzE+NrNatlfworgg5
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB322;
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB322;
	25:fWQmX18UBV6o/YN5xcHAISaNugkCeaGpboFN+Rf//Bh0UmAv3grK5zAuse9bIDAiqxdNwZOCGmmg1CxsBG+kI/Z/12jJ7quJPNcr4DXuDUvlSrq0epw0/4qH2fko34MwQBDlca6anw2DXTireBOXycgC8/XXjrPmVwQK43v1mH2Ep6w/6ZHw29Sj8tvn1e7ox6r1cStUu4tM9W9ZHzp0FOC58VjtCroy3/VVrhaBTLbPWnio2tV95YnSnYBDVR15rGXspZ6Ebb0PhNEIZtWsUfjDrklB3RqnTMDv7hMjYybx3sp1FqY2yYytXy9SZ2nDfcKO11OA4cVV2P2JhNXjLU/pVTXrZlzQ0lFdaGuJkiUgg6U95I8uWTkl3rMqhBC3xCAy8zQ+tiesV0r3pWL6sbbcz3aIJclwzR+INVuBzn8d1QItAi3GkyJxx9bcIuJXJoryol2xUamtvdmDraNPjqO5kkq/60NdH6OkYz5fvb4OgUvlTv4LurxjuRGvYaiCNsfjfuyWVZtm93+LB8MlRqJTHyY9IHPR0W3+QTg6z55eY4KTbyyuY6qSXK+pTwWYAo8ANx3ghEQ2igUIRpYYq1PG7xSKFnaavXaPmw9Jm+UdcRGHdYQOBsMOrxPLOeOwY2wHQUteUedIoLRkEi8kWMJO6DwTrG8SsCy3uuzuovd4f0duLV868X8HJT/qFQGSZcYTaAUeuH+JUhNLUMkCTwqdzzVwqoZ0Tw0QEPxIezle6VkUSY+0U/IosPa1WZH6rdaoMFXRvtNKlGPGgoaG9Pif0opDbeIHvNBoquUP2oASeVfun3+059UKTa6FH+4I8i9IErnvztk9IMuIAMv6qBSOhEgR0BuksSRjcGIa1x4=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB322;
	31:ZA6jfCQDqBvZ5ASQ5waepGsjMOeKnjI1AMoL5NQSo/XKSmeoe3j3TC75QS7oRQkHnOYu3m9Z7bkm4Gr2KVenNylVH0ELd8alFqh4eQVkwIwlyOmjTwnBJMPrPtZ4wYOfeEGT4zSJpJtIiocvGTLixpjNOe4X3AAmEOekz1snEafWTj3bBDCndPLVy/KjEvtvR9VRWg3Qls0AqwUArKJq4Zx+tQ3uDBUuIdySjpfYkn8jE+M62opZ0YX58UwGw03OfTKars7AHRlknnJGBSj0IA==;
	4:lnCtWJ+rwoyrzdkRCy0VZbcwyckw1KnBPAqxFMdheLZ7rw7vrVbTJky0s6CDPPnDQQoxvpAD5tsjipKtkHD4NAcFa2zbloCQNKACwXVHT3KxDU1Mxe8+0apVP1WRNJN41wjg2YjV9xRVWLEE59ZqPnHtMqnphcT4FS23K/nWSfRQHK342qxaoxFPsMPbkGzfzfxOeQsGkjkaQ/0QsxTPSr7nWslAUor3ghP954nX1aL9DjjffUsIkWWIQZrqX5VZIJGy3Uf2h74dKylmtWPStdaFRBSxprbq/Mpu1am22jtw4dtyCkoNqR/yyEzWd2EtJV6R/WFtZaL14P1AB52pHlH0LuJ1IzIliTIVzwRbgMTNXWLHJZ2utL5w9Zi4qXWAt8rh1BZnz6ARNt+a7QpelhS6jfsKE9C2DvgrjiT8UILhT8o8Ke5i9PdLUOT5W95E10VFdfbJDSXYH8j2fF5hVxD59WDy40aweae8W2GyldAY/E8mANCh5rqAzlLY3hP6rpuxMD+hsWLJdYWcq1Z4eoo8QqcGWKO4LEcS3GEEcH597MUOaohnzzZseTFnA8nT
X-Microsoft-Antispam-PRVS: <BL2PR03MB3225D243DF6C84B52CBBD70E9DA0@BL2PR03MB322.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13024025)(8121501046)(13017025)(13018025)(13015025)(5005006)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BL2PR03MB322; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BL2PR03MB322; 
X-Forefront-PRVS: 00922518D8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR03MB322;
	23:FsGF2SPuWOCWHSgz0JCBRXqKRsHa4m9ZSzkit+XGrT?=
	=?us-ascii?Q?DJQhFaPZrsb2xiFpDEeZb7F7TQZJsZK9LlAWWsFF3y6kgG2BGYH22D7yg/Ub?=
	=?us-ascii?Q?fL/GHH9sffwyy6NbMgmLvoFl2o/XEF/vADS+G9bBs+0lTpmE3UMvKLq/3hSa?=
	=?us-ascii?Q?Vz5fLjaZy6spqnDEM3r08rufBb7XKHzx/0d9mLm5PDDvpRE7EiBQEdXixDhN?=
	=?us-ascii?Q?6kxmfeAWifk9WFveigF0gx/kPwuUsIYtqqQ/sPgmYKlZeR070YLiyHgZA7ZH?=
	=?us-ascii?Q?fLA40SpkV2XAxou1SpNTa9uzKU6krEOLTwbKDcfofsnAFvfwIc/lgietVj3T?=
	=?us-ascii?Q?AY0T0QRpD+D86xi1Wn+EhSHku5yzKeJrNBRdLQ/K0lySSQifidbq2xm2nu71?=
	=?us-ascii?Q?8Eka26HIxWc0lGtkBbluctGuGST//KboRKqc+6rywKVEeqRRD5uCQo/ME8Hu?=
	=?us-ascii?Q?4vgyuBUQRBUQXiWVYHSvlDtBSIxEIEBQpVmJNcDB8zyketvXVaQkaDNpzYEd?=
	=?us-ascii?Q?UxWAT4Cg0wjYY8lGrjMZndIbQ+bg35V5pM5k0MIAjOxjebBSwct/DY5sRvGY?=
	=?us-ascii?Q?XrRShont9NQKdz4xQzx8JPl3r2FOLEB/DlrkhwSttO+95TteR7PQtqpuS0yl?=
	=?us-ascii?Q?79t7Vw8n+YGXQhIzmvXO3cu6jAk4PytCsTm4Y1yPx5F4PylbKQNdAd3WrWjt?=
	=?us-ascii?Q?sGNXcRVNC4zPTm+FL76OyFpj9ugnppKAzbdeK3Lavn2wWy/hhibi4Nql1AaY?=
	=?us-ascii?Q?KcBMwL2AqjdKVEQCK3PSPuAFG30a27Z5Pc9UIE3LuktskaFxgo+56rc2l4y1?=
	=?us-ascii?Q?EnBbgwP+Yg51lzWuOdpVcIIAUYzIlm3geNuWKMSfUqj0gzLuDjysE0fxGSgi?=
	=?us-ascii?Q?NCkMLZuIsT0TyCuckFfSlvWDblMJAc1qouEc9hH8IUSBKedVvixde+ZR1B8s?=
	=?us-ascii?Q?Nrn0XjnOvv+n+SiTxFU7a6UYI+RR3s1xHA6q3iut8igW/tS0/I6rgMv+/eI2?=
	=?us-ascii?Q?DrHBa9JwShyhepTaj+262td8jhRkL6hWf1Xs1pH2SGvhAUAVMvZad/Ijb+Av?=
	=?us-ascii?Q?qKLlBFPSn12E8rw4VTco5JnmQ3nU4V1+l+vOB5H33FEJmGkg1o5rYFbaD64o?=
	=?us-ascii?Q?bxos/ms4ZLVrOF9zlb2rjlOUXIrUe8pD6rHzLfEfChn3jLDY5Zm+FDxzCIu6?=
	=?us-ascii?Q?TUKqjfw2+wFwFxo6/z8F5vwmKQohkxEOim11bzgdLNEgZEmmuVAGGR3WZ1gN?=
	=?us-ascii?Q?pxN6plUt2j9rzv1kbcOUYn+X1+UqMtKp3rsboyagVQwwRB4D9nDSuq+vstMQ?=
	=?us-ascii?Q?=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB322;
	6:WbRNgj1Q8dJwIAujRNykplC+2PE1ou5Gt2GSBmj//Ujl1RYZnMfkiZkWWONwMzsHRsbdrL6SP+uLRhnO5W7C317dz6qCMJ4aLwA9/7Q2LhvrKzY+7Yufre/oTNdjT+RAg46MCmyNwZwfaC2typBfXyXbFFV0VwOIXVWlhj/j52fxDNRq91g6IfpkWv8FhnLpS9fXEmRzsqsAHXHfiL96YoY2hL7IoXq6jo4NWbk7BR1wQZWcsi/xKg24Wm9J+GfSH0kMQGwGbQ0/qNmaFVSxf+R8TdN9YGyCSPQl4Onebaol1QluubbTDTR0xOSM/2PO;
	5:zF5qP/mBpduS2A0AqwlAkKqy2cZuRmpgcAy7HcK+ATdCADhMmo4AIaGe6olXyWypfJS69mn3DII+mD2CdCaoaGxEacqCWCxKFu0VP/axpm446fQXRhBHBGd6T14+Tcf4ahMaeTgYKN8bviCSnLR5Ko+M34wi36e0aC2f6izshpdd2dHf0Bjhfhyrruntq1C2;
	24:ClvQKPM/ebrFX5Hxdt3Xh0/apRLnedLoGG/ijpgCiqljVoQcstf9o0x+14WCiRnKwvN6JkVEHaOAj+crrj41NqUZ+oosVIrh+gqnJi+4SG0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR03MB322;
	7:Bj9fdsWomKaXUVb04l7TNjv67Lmo/2mLSXgpLWwLBNSi24OQgXq/vVVetKLpaBXxz6uWHw+kzcRo12cEBpy9CaUK0kmNT5dw84fwVuUYMUhnub7Z8hodW+AMJvrf5XRN/0lOeT6skD6Fnm0BY/420YHxe13eAUmdb069b3Thc0U08GR7NxCmx2aG/KIwZzYsR+WPL4hNaxgRZbAQcefqeEr7I7ZfHUYgKgJTA/uUfkPvWrtzDOkRpYy6rGxTyuPryWf3jLK6Ofxx2LE/KuxuK8GWcEf+15m7cXd3hEEBM8RW2s+8qyChD0dz3UvrvYVr4FF1FNaahlgunaScoroBGShysU9hExS/QKlW4ovhsHA=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2016 10:49:22.5760 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB322
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 3/4] gstreamer1.0-plugins-bad: Fix horizontal/vertical flip matrizes
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
X-List-Received-Date: Tue, 11 Oct 2016 11:22:35 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...ink-Fix-horizontal-vertical-flip-matrizes.patch | 44 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch
new file mode 100755
index 0000000..701eaef
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch
@@ -0,0 +1,44 @@
+From 99937ea5854b6182333b9cf578db726748665ae7 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Mon, 1 Aug 2016 14:12:35 +0800
+Subject: [PATCH 1/6] glimagesink: Fix horizontal/vertical flip matrizes
+
+They were swapped.
+
+Upstream-Status: Backport [1.9.2]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=769371
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/gl/gstglimagesink.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/ext/gl/gstglimagesink.c b/ext/gl/gstglimagesink.c
+index fb60468..cd3147d 100644
+--- a/ext/gl/gstglimagesink.c
++++ b/ext/gl/gstglimagesink.c
+@@ -472,16 +472,16 @@ static const gfloat counterclockwise_matrix[] = {
+ 
+ /* horizontal-flip */
+ static const gfloat horizontal_flip_matrix[] = {
+-  1.0f, 0.0f, 0.0f, 0.0f,
+-  0.0f, -1.0f, 0.0f, 0.0f,
++  -1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, 1.0f, 0.0f, 0.0f,
+   0.0f, 0.0f, 1.0f, 0.0f,
+   0.0f, 0.0f, 0.0f, 1.0f,
+ };
+ 
+ /* vertical-flip */
+ static const gfloat vertical_flip_matrix[] = {
+-  -1.0f, 0.0f, 0.0f, 0.0f,
+-  0.0f, 1.0f, 0.0f, 0.0f,
++  1.0f, 0.0f, 0.0f, 0.0f,
++  0.0f, -1.0f, 0.0f, 0.0f,
+   0.0f, 0.0f, 1.0f, 0.0f,
+   0.0f, 0.0f, 0.0f, 1.0f,
+ };
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
index 3b57db9..2bde0a6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.8.3.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0009-glimagesink-Downrank-to-marginal.patch \
     file://0010-glplugin-glimagesink-support-video-rotat.patch \
     file://0011-EGL_DMA_Buf-Wrong-attribute-list-type-for-EGL-1.5.patch \
+    file://0012-glimagesink-Fix-horizontal-vertical-flip-matrizes.patch \
 "
 SRC_URI[md5sum] = "955281a43e98c5464563fa049e0a0911"
 SRC_URI[sha256sum] = "7899fcb18e6a1af2888b19c90213af018a57d741c6e72ec56b133bc73ec8509b"
-- 
1.9.1


