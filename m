Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0143.outbound.protection.outlook.com [157.56.110.143])
	by mail.openembedded.org (Postfix) with ESMTP id C180775F14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 05:45:29 +0000 (UTC)
Received: from BN3PR0301CA0020.namprd03.prod.outlook.com (10.160.180.158) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 23 Jul 2015 05:30:07 +0000
Received: from BN1AFFO11FD037.protection.gbl (2a01:111:f400:7c10::156) by
	BN3PR0301CA0020.outlook.office365.com (2a01:111:e400:4000::30) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:07 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD037.mail.protection.outlook.com (10.58.52.241) with
	Microsoft SMTP Server (TLS) id 15.1.213.8 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:06 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t6N5Twkh012178;
	Wed, 22 Jul 2015 22:30:05 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 21:29:51 +0800
Message-ID: <1437658192-8322-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437658192-8322-1-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD037;
	1:cGN53Or6coU+Mx1C9qQiu4WwKSIyBMqn4DiSE+fgxcoO2/YXD7Egau9BDMNiedOHomlCoN+NUouwpsScjSWmRSphgXDShopS7wFsHNecJ5NXNWVklVp6PvIdEWZnGUZ+erWG1hQ/6VOxngjOZ73ODuGCDGcfUNvtr8buvep8NQfCYvZblvYwiwtFxql4OgjxNciJ6bt0FF/RrRXJPlTX3X5ww2CY9EpMc0/WmRu/z+abjFXwEsTQuUiUhBrFink3mw1AmMMWhRsuYgVjl6Ru20k8/kLLsd7KwDBFz2YozAajs28ptqE5nSidOf1E4xvRoTLY572UHjsSzIpQxTub6lHVQCxoeuPH904f1LnWuxhEsOCJEFQzumvzOlnKV0LOmQajf6Njls5/keFUFiiuONwqf3z3OenqTlLOsoJ+ekPoADgTUow8wJus1EQ9591A
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(50226001)(6806004)(50986999)(76176999)(19580405001)(19580395003)(15975445007)(86362001)(36756003)(77096005)(46102003)(189998001)(92566002)(50466002)(47776003)(85426001)(5003940100001)(87936001)(48376002)(106466001)(5001960100002)(107886002)(105606002)(230783001)(110136002)(2950100001)(2351001)(229853001)(104016003)(62966003)(77156002)(450100001)(33646002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:X/tHkPKw+6irbOF1i+5Q1mssRd1EymHPNsXofx7uYSlNP3CpVxe2IJTsKsnp1usGKE8Ho/TPXKP+8kd7IfzClqEnfFGBFeLV+iFCuWpwb2QvBXxbEnnY22QfVPbbHrwu4YQnR69kytiMjOfTM8rMqMKhlW/wiR2E6irTNM5RsDg=;
	3:azTp2IQJHLfpDPMT0OjSQ53qHtTamXxiwinkXmhapG+pECNFbTGkMG2LjoIrpBYBNICACpGWi5KqqfBfesTXTWOrSuQ6kbDp4G2FpF+1zBuvwX4PQziwb5KrvtOgPmSePtJHMrJG+EjW1/JhGLLiW5X7NcpmzQYbnw1+wFjqSrnpvjB/A+MlqAbt/8of0J2Jc7SqEkzSBC6G06jh2BCQMgXy+rT/+c6wkCtQVEqNKWY=;
	25:AomcKHw1swEq67+Z4vQzsUpZwOS4b0XJCkYSbqzt9eBKpLjv0lylMNEFgUz5nSGx4nblYUPIlTiD670e79BUWeVRB1IQEmO1DT4rfLy7okhtETBJWR9S07HeO6t1QTURvDpIy6+5SRPwuXb/gBdqiS1jB4fzQ+ZsPazoi1TZv648DsQxDzpKU4HXKyFNChPtkTRRQordikBRO7+J4PHkrkIpLiZlS39qr2uYrB0ussF+6eEmhCiw+Ypshf4dg4GB2lTKl/XvegSea2hVSn2cpA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:wksXJTEBAkdi43no+Zk9I0jk1jbcIbtI228CZkz/AWWvSewEOL2JbFh5Gpm+lmksPyywDuDAPz4Fjk6cnBNbzrsNxGLPt5G3w7rRHibgS7BpTbJ1L5oOyBtYWXlZucbVlYnHajUB5fXzQyWQyNSEmBN5JN1jmIpwywC4TpCYxJwtFIOe9Y72aD/woSBayXaIDj/HHkViBZ1FIKwfbd4GFbBW23sUobPO0FrnprAbvIXKnimA3GI5z26ecXxNuEXOyZaXM+P5dW98U6xG6r7mRHCAB0JGgnyPLs7Nwfga4wTj6UolV6S6EQhAQo575ygtpIAmbU7zq9vYLoDcM8/GHsfsXSDla+uK2y/4HpjUzLM=;
	4:64CnSueX8kXsir+Ep7eTn01NbCgGy4GFvLI+MFDGENTpF7BTfARj4sZJsLYSnr6CWSY/wzrm9I+aFzaN1aVaH/tqpLeB9g3/1REVk8KXHqm9hY37sEBoedgx/Vo0qa7QcZpp53HvfPwm3tHRsaQHkNtTVNCkJUNOpNie14C6CaWNOvl+SKHMveTb4T4RhNf2M9VhRfCBV0qQ+rtHt1B4qAnO4v74vuw9l6HXLQT9DMpw0/wq/kJFhrd+LrC3cs0CZ+NKRCEvYsuXBj/UKsHyqL9s2DOc7h5ZfCzC4i8rR3Q=
BN3PR0301MB1171: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11718A383F98E881AAF7B13286820@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 06469BCC91
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:ksTzJ+cZam+yFd2Nmdtco1/KXs7gHnYpCUmS4HC?=
	=?us-ascii?Q?xgoK1U9dhjDGq76UrELfq5Iw9xf1+GVVVLrVtr4KHQk2/bT4NT4mpa4ZL7Ez?=
	=?us-ascii?Q?mTKN/R1NW9stGgbtNAtD5tUvPn82jQqzHHACmsA2b/cmnSgyfTAtxKD8cA/a?=
	=?us-ascii?Q?5/MtBm6JtXecRivmA6itaifoT1u3pvs8keTC+ngmSItbNlQjjKkErqckQajx?=
	=?us-ascii?Q?U+4zs27munzHb88Fo1YgADrytoQKbW2yq/4DtTwSbv0ctwXJNSsJAVuvUbgw?=
	=?us-ascii?Q?Gv6XmV76SwCHc6+IrZdrOGigtc98Xf87dNjfbhBVZf19lP7nGPjOBdfumPRT?=
	=?us-ascii?Q?fWno5R4cfV1BEYAWy2m2/dloaX00PmpfdBBO0GudTdgHGuoS1P1q2/vcfKAr?=
	=?us-ascii?Q?b0Vdi21DFFxBt31AnkzEsFc0MuxJL/MF1pM258shm2g4zOQBGt0lsiZrh+2q?=
	=?us-ascii?Q?+eLwwvrJQHfsweHtrXzHS1CocVXzdEiuAqW9LDI4NNu680u3bx6VNmyYimVC?=
	=?us-ascii?Q?iOZz5J+LHSd48VBfeYLkbBMYHnlNyXYw1dLlIkC3dGuDOwXhudoK8lqyVqbI?=
	=?us-ascii?Q?AxQQ8tsV2W3YzPxFzRvBjVvadUUiscaXpLhQrv7nouRkCZql1KG2PaMbGdzD?=
	=?us-ascii?Q?NXdbsyzX5Ed2EFyihbHERyHdBN6KhD6ftYyjVgdarxPUpgcTNfJCyJK+StW8?=
	=?us-ascii?Q?eG79nSnk2Zmgy7dYfkeld5JPXkwmEGynACEutMrLWXhU0Xvyf/ApDGc7SOS6?=
	=?us-ascii?Q?mIhQtiGV8TIqcExS0xDTNJ19cC8o6QaUx8I2a5rsv9Yo5bQZU/NUjF29Q9rb?=
	=?us-ascii?Q?DZAR8sXapLq8IKtCWyC+O3vo7ye4HyjPVr9KCWpe1YWP6Rz3+RkKKKk8A+p1?=
	=?us-ascii?Q?BTGVJGC53lJGtpSwix3eDJsj0R8lE4WieP/271+D8iFb5RqckrcXpWd4Qzhe?=
	=?us-ascii?Q?NKzoL3prY69PhrmuDNt31FSK/aTpztL59AptgIEItg6vt50rD80JujcuOuH4?=
	=?us-ascii?Q?NF1/DHRlP/RuutSiEE8gxDGKHv/2nQCbvfcVTOniHG4Y+Hg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:0QTJfEeiDpi4kwOoHVQFx4Lg2IUNs3SGogxEpG8Db+0SsWyMq9y7FtoIa5To/ZoYewnzmoUrmU16iiZKgri7qkUaqXKPT2ANXSZXh4+z0gqMyA0BkzYGDtBRubxDDWbJM/gE5YQ+yb7hpfGqj857YQ==;
	24:Pj1qONrH1IkYsMVhuZKT3G5DaVuM1lZ8A4I8wC+F+NtwNwC2EfHdPbBdykYia7UAJuX+gHoHkBsUCA7i4Rf9czuIh2tB/IHiSTzKvqSALi4=;
	20:zSn4tQT4YDM+tQynLY/dP1FHfjWSgyz7TS8WpszjyBdOQYkgELYzTqee1cl433kqbhYduZ0DthmEJxIberoodQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2015 05:30:06.7979 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH 2/3] gstreamer1.0-plugins-good: Add patch support aacparse
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
X-List-Received-Date: Thu, 23 Jul 2015 05:45:30 -0000
Content-Type: text/plain

There is no need to check channel configure in adts header.
The channel could be output of decoder.
No need to return fatal error here.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...cparse-Fix-aacparse-error-tolerance-issue.patch | 34 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_1.4.5.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/aacparse-Fix-aacparse-error-tolerance-issue.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/aacparse-Fix-aacparse-error-tolerance-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/aacparse-Fix-aacparse-error-tolerance-issue.patch
new file mode 100644
index 0000000..1ce4b66
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/aacparse-Fix-aacparse-error-tolerance-issue.patch
@@ -0,0 +1,34 @@
+From 5f97dff4bb844ae17870d9dc62aefefd6dba077b Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Fri, 6 Feb 2015 11:27:47 +0800
+Subject: [PATCH] [aacparse] Fix aacpase error tolerance issue
+
+There is no need to check channel configure in adts header.
+The channel could be output of decoder.
+No need to return fatal error here.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=743332
+
+UpStream Status: Pending
+   
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ gst/audioparsers/gstaacparse.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/audioparsers/gstaacparse.c b/gst/audioparsers/gstaacparse.c
+index 2a37c37..550e304 100644
+--- a/gst/audioparsers/gstaacparse.c
++++ b/gst/audioparsers/gstaacparse.c
+@@ -831,7 +831,7 @@ gst_aac_parse_detect_stream (GstAacParse * aacparse,
+     gst_aac_parse_parse_adts_header (aacparse, data, &rate, &channels,
+         &aacparse->object_type, &aacparse->mpegversion);
+ 
+-    if (!channels || !framesize) {
++    if (!framesize) {
+       GST_DEBUG_OBJECT (aacparse, "impossible ADTS configuration");
+       return FALSE;
+     }
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
index 943ab60..f884cae 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
             file://decrease_asteriskh263_rank.patch \
+            file://aacparse-Fix-aacparse-error-tolerance-issue.patch \
 "
 SRC_URI[md5sum] = "eaf1a6daf73749bc423feac301d60038"
 SRC_URI[sha256sum] = "79b1b5f3f7bcaa8a615202eb5e176121eeb8336960f70687e536ad78dbc7e641"
-- 
1.9.1


