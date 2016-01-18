Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0135.outbound.protection.outlook.com [157.56.111.135])
	by mail.openembedded.org (Postfix) with ESMTP id A36D973175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:23 +0000 (UTC)
Received: from BN3PR0301CA0049.namprd03.prod.outlook.com (10.160.152.145) by
	CY1PR0301MB1177.namprd03.prod.outlook.com (10.160.165.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:39 +0000
Received: from BL2FFO11FD047.protection.gbl (2a01:111:f400:7c09::168) by
	BN3PR0301CA0049.outlook.office365.com (2a01:111:e400:401e::17) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:39 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD047.mail.protection.outlook.com (10.173.161.209) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:39 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROa015522; Mon, 18 Jan 2016 02:35:37 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:54 +0800
Message-ID: <1453109582-25485-6-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD047;
	1:s5+bnn+qnTtxpKjT3ZagE+AfavBant2HKAYKL6hoXkF51H4AAVWZnlCPtkuALRWuHvbXsjw2n/Z/qVakuaHSlvHkqfbI6XBcq5IYZ6qwRwRD7aFr3BbzHMKR8L/dWmxXSHPU1fycr1Wv3CWV85Mih092XHtBnyPefo2nmDwgdsPdjTxzDqLnCXbjZl/jcgw6y1QA/fCmkGydFgZjzfTBvgbl3WcGaCPBbvfrV8Kdki0K3OrBeoqDN/hyXsmcFEnhjfQFoHRFA2F7myhDwSc7NZBvnPWqXSqvXaTck+OtgWTcMC/5GMj2hycFU5xP7A+ACNjjt/H6de60kmoG7Q2px0MJhI92uZRk81fdKsjbR3KDCTxaBXd5G+3C41ehObgoog39BRBpWEaSSYaJintFh0I8yCwK0g31D9300kXQ2jg=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(110136002)(2351001)(450100001)(6806005)(15975445007)(5008740100001)(92566002)(5001960100002)(50226001)(5003940100001)(81156007)(97736004)(104016004)(1220700001)(4001430100002)(50466002)(77096005)(1096002)(229853001)(4326007)(230783001)(48376002)(2950100001)(2906002)(76176999)(11100500001)(33646002)(85326001)(107886002)(50986999)(189998001)(86362001)(19580395003)(106466001)(47776003)(19580405001)(87936001)(586003)(36756003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1177;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 06791e8d-3eaa-42da-1528-08d31feab9f7
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	2:vK8IHSN7GjQVTdxESxRWbXkn4byWqqkUenxouHOUFAS7nAD4j+m/+l8kv4Gm5+hUyVE49K4dLJHq4DY5PDD36Kbd60h7FW26JP0Do29/8Bue0Wvy39o1Ls51fab+6pYjo1tfeP/fnlXNZK73N97gkKYa3ICMkTVx/UaK1hXKM6seC/pSrAOW3UF+3iB0YZGB;
	3:fFF+nt5/J73ETWSqVLDmThb2Nx66xaLLnWRZgdG5LSiIPDJ2oewvZLtkxWac7umepNCjzIqjrLp21k+4EIVYqTyHpDMK/UkcNoMSD3c2JuhjXt4bpzDkuTIT3IAJ/xMcskj3cj0fV4Hlhdfn6hXjxmEqkD263mWceR5OqXH8QEW+DzmzpsI4P1sF8HRIN1WVgNbNHws4z0K3EbFGDgd599D5TQQi8lWm8lXhYluTzEw=;
	25:mqqKOQQCk5kzVIhK37lNd+ZOXviopXrsyAORW3ivuqg3d7FTaI+R7puCB+DA3cQ0sBQpqI7luZ1k/d29CLzJhFb6358qWiIVHd9VIcJoXRJCK7tVvv4YyszawynJ3oX2bgXVQ0FPEuyWd0if6FSfmxGCIUYhJtI7zP+r8ZbhKeTp6mQ79noPIEjMP4auFSoUV7F0lAgwhwOzWb6mBjubQnZ35MDO8kb97Xn5PEUU/CHHy5AFmWKuVyBi8i805dWi
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1177; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	20:YfvgNiLlLsngrrLS+iBV7sgCyWfX/dv4tJdqwU/qHR5RCq8b/FxjwJBQdaJ1O3Cd6L6A2/bFzNBZ6MIwZ1TJdgdCcneqc5gUArVom7LQxmj7jD94Hylx3lodjcZHwPWrf70h5jFtI+QNkcww2N3RwUYEaMptaTx7/QYiV8ZgFTTsB70qI7f12c5+snYUBwnmczAPZkpuqBG+vkiofz0x5oHt17RH5DS/ioovapZexFC21NbyeyrbJWskj3qMrDfrH0b1w5X9gtV+rDCJVXnqawI33UcgXrop+ussVwFn33gneFQXk2NHss47iQ4TXErlMueY6F4Ad91EwXs7n5hnjBHCADO6JNu7ZjqORlsgruaDfeE3tRxaLx3byLWZ7jgGcXbu5B7Q2U8pUFltKGOTR5LrPJk7LM2cuWtN6wDuprJYjev+Y3r1+BKXoZCOUA8g;
	4:WwdVuriVVVXI2vvlANBADYfuoHd6YIhXffZFNeW9t9kQmzdxYrk03iZYQU608gkxCkN1k4FZEMh2CcGDGCLNnNaNV03ZeqKhmQiT+3DNKaOMs9kUlL3OqYT39ASTcMZd2kVpJpNonFVtfmTlkiLzQacxdCMpl82A9JSBmfjiE8WavrhFJS8nKtVfDb6ZbHP0UpkKeSR0XfNXOo0K3w+4q2N4EHWgTCfsCDTIKRZW4Kmag5Z1iYqJsxEcmLgNqPoi8AIu8x4aJtzqcmR/aMaIa4MTMdvkMKIq1kQEx/MHIQ8POdDVY/BvBUydXc70WIshGfGRg2SKeGTBpjOizUO47Fi/DKe4pxdwL6+dS9BdZg9EXAmKmy5o19PIP5IXpFWQIXgcpDccKZFT/aeBQeYU7WNhAti0dzjvSpvTm02adubDffj23T2kVg+harHI7n6RVuvVFu1TYFbb9Sh0X4Gi/TQm3GRHe5y6d8xfoZFZJqs=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1177FBA0F3EE17A5B380B26C86C00@CY1PR0301MB1177.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(520078)(13015025)(8121501046)(13017025)(10201501046)(3002001);
	SRVR:CY1PR0301MB1177; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB1177; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1177;
	23:g94AzUhmPbUf1aq5APk472e6YuK58EXrQzpsbFL?=
	=?us-ascii?Q?h2t6C2L62EvoRc+fCQYDhSiH9BPLdm0ICODBpUipFqWt/kmORlcVRxzeJzdm?=
	=?us-ascii?Q?PoaYVRWYeHZFoHoCcEE0FtjavuXz1SWKXdIXD5lmwcFa8OqON00t6Pdrk59W?=
	=?us-ascii?Q?cXw5XW67b8QVLJzaTjTD4FzaO6b/KQgNjWOG/pziF0dBU7Aj18cX9MK2hYEY?=
	=?us-ascii?Q?Q69a3rKjToEcLMFuUBhJLvJERl8krdjECA0EH8BOj3mK44AZ2VxNkEEtW1ji?=
	=?us-ascii?Q?pD1pRe/ngJJQR38jMZ9v+MXMl4KcvlH5vJj6uSOTC2Cjm6QVYibiFgbxXjFV?=
	=?us-ascii?Q?br0nlcW1ecv80NhJ6zKX850mgzJlpnZSgMcoiyaOVJ03Xe0qDU+/+f+Z+Rw5?=
	=?us-ascii?Q?dTlyIGNHUEuId19SXOrrFx8262Uvi+CAOHEs2AcaBx22BRy4Hhqp/WBnxoJv?=
	=?us-ascii?Q?A8d6xtrsOb1fOZd3gpAY3hfLwXWyPASuIvOao0M9MREH+j/gADjrQvMbrDCR?=
	=?us-ascii?Q?H65il8Mo/CCY8pLuy/oKk/LngvdtKy+ARJ47HHO9aTlJ7K+LmwA+SNnRG+7f?=
	=?us-ascii?Q?eY/uqyDCWqOPI7YH5m9xbpesU077zTpfe4rPdSgVN1n+Tx5qfq98qT6Jw67X?=
	=?us-ascii?Q?LkoIfSS41TAXlt1AvslfxknlM7pcINu3cJe8jHaZIvtmt+Bk+VjA1RITbjmR?=
	=?us-ascii?Q?qToLhnTI4XS41ffr1EUr55rSKxmimsQa4yJ3pKWIFYodf0OPqUHgkE6T04RG?=
	=?us-ascii?Q?OxkggsAvL7ZEhetz0BDJUS2Wa53jQMmbjjcB88NHLP1u9n0n1UeASUQN1upw?=
	=?us-ascii?Q?dfIkY2/q9QE8Ab26NCmhZliXEt4jIXaFT1vTL8XOqQ3a0CwLSFxik/3ndTSP?=
	=?us-ascii?Q?s5ywT7jt6LC1tGKcxn77E82i063psww7aYuOozIiH+lDnNwzDLo8tY+yIFFY?=
	=?us-ascii?Q?9gS3t7z+wA1XbVAkPND6RN4wokPbz+AXrM5WCsb4bGPE6jMZXa/khpooZu4i?=
	=?us-ascii?Q?DtM/Lq+ngDpnm0HUKsFjlb851s0IbBK87cdRD6rv4WSeTWg+x/8MBByePIoq?=
	=?us-ascii?Q?+0KGxAGRnPFc56v135BH/hnaQvk1N7Npgs3sMmYTQouCHeq/WCIY8PqaqdQ7?=
	=?us-ascii?Q?Zul+O9GcnOR3f709UfBhAPyeaTjBH+/+gkINuuzWhrJEKzSS4YMGCFA=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1177;
	5:fPzfjwcXLklBh+0phoXqZONHAu3QXqWwzt25AutBniH6zZpuwM2IYJBi4dIn2CaOmnxtWmtOFq02bHPcQZWQ/kTawPdkbPkCYNkLi14AmcToDJ+5rT/xi0OAW5lf9HgFtr7q9XwwKivfIe0r/qoucw==;
	24:gPEnpANpTxcez6JBUGxQJsv7sX2LTcViu5SzjXtGfGMUf1fC6vvMIWpU4FkGabP7H8gn26MLHMUkCWg7v1gRwC+iilFSilqJDSLX/VOqSzE=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:39.0442 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1177
Subject: [poky][PATCH 05/13] gstreamer1.0-plugins-base: Disable orc optimization for lib video
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:24 -0000
Content-Type: text/plain

- the orc optimization for lib video in plugins base may
  cause segmentation fault.

- disalbe orc optimization for lib video and just use the c source.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-optimization-for-lib-video-in-plugins-ba.patch | 34 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch
new file mode 100755
index 0000000..9e80d96
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch
@@ -0,0 +1,34 @@
+From 51554875c2ee2714a4f80456f805cc2dfd612f78 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Thu, 10 Dec 2015 14:32:43 +0800
+Subject: [PATCH] Disable orc optimization for lib video in plugins-base
+
+- the orc optimization for lib video in plugins base may
+cause segmentation fault
+- disalbe orc optimization for lib video and just use the c source
+
+package:  gstreamer1.0-plugins-base
+Community ticket: https://bugzilla.gnome.org/show_bug.cgi?id=759286
+Upstream-Status: pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst-libs/gst/video/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
+index 5d31fa1..f91fca6 100644
+--- a/gst-libs/gst/video/Makefile.am
++++ b/gst-libs/gst/video/Makefile.am
+@@ -84,7 +84,7 @@ nodist_libgstvideo_@GST_API_VERSION@include_HEADERS = $(built_headers)
+ noinst_HEADERS = gstvideoutilsprivate.h
+ 
+ libgstvideo_@GST_API_VERSION@_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS) \
+-					$(ORC_CFLAGS)
++					$(ORC_CFLAGS) -DDISABLE_ORC
+ libgstvideo_@GST_API_VERSION@_la_LIBADD = $(GST_BASE_LIBS) $(GST_LIBS) $(ORC_LIBS) $(LIBM)
+ libgstvideo_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS) $(GST_LT_LDFLAGS)
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
index 2e7952b..c6f5d77 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.2.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://get-caps-from-src-pad-when-query-caps.patch \
             file://0005-taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://0006-handle-audio-video-decoder-error.patch \
             file://0007-gstaudiobasesink-print-warning-istead-of-return-ERRO.patch \
+            file://0008-Disable-orc-optimization-for-lib-video-in-plugins-ba.patch \
 "
 
 SRC_URI[md5sum] = "f530fbbe287edce79c55a37bd1a39fe2"
-- 
1.9.1


