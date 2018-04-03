Return-Path: <tom.hochstein@nxp.com>
X-Greylist: delayed 23658 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Apr 2018 20:26:24 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50082.outbound.protection.outlook.com [40.107.5.82])
	by mail.openembedded.org (Postfix) with ESMTP id 3747474A61
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 20:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4/ii4KHI1uwlaF0xuTn2jj7NNzaljPSqAxKhkv0sL5Y=;
	b=B4BNfZ+u6k4q3YlxGSGeUkMKxB4bJ2QtrE+3WGMZ8cThSHyDsz0uhbBkcTxrAaFqsqIbw1GYd9I3NP1WP8uOHGlX01yIXENlJUVbBN3w4N5cTMilwrFbw7GYSun0PlmlcO/YxFNbtqZd9z/gkw0v7WkdMrxdZRFbXwO/HS7oHAY=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.1) by
	AM5PR0402MB2818.eurprd04.prod.outlook.com (2603:10a6:203:99::9) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.653.12;
	Tue, 3 Apr 2018 13:52:05 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 08:51:14 -0500
Message-Id: <1522763475-16001-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [192.88.168.1]
X-ClientProxiedBy: DM5PR07CA0036.namprd07.prod.outlook.com
	(2603:10b6:3:16::22) To AM5PR0402MB2818.eurprd04.prod.outlook.com
	(2603:10a6:203:99::9)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bc586d5-0ac8-48f8-9802-08d5996a1669
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0402MB2818; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	3:Zk12njeZIJwzmOzaBaCGWvITkGz3Df37rEqe7wkB/etVDS8AZXEADGJ/uVpTkAC56T+YRilUTfz4N9WhxXkc16Nu0F3D8FdFklyexIgCF5yhzOmLH21/dhdVAB/WSaVNQDVMn3Xy0gnZSq5lw6YnnDP9dS33IRP8cK+WQi+yrxx+AWstr+Bt6c8MKSSDaNjO3N2iLkPyJAEs3dRg66cL3ttReVOyxH9Og+s5jGqmQe3dLT4pqpv5WGq1AbKbMGdt;
	25:l5mG03EstX88doLU1OCoINiFPYxRoflZwdaVwI4bi7EHGAj2nDtM1neWV8kSGtUgXVW2s+z3oNnavksd0Jm8M3u4PglNpSN1nlTKHkJMkJv5bFO0nSKPgXuBSklSTrXHJDzD4rCjaWHTBN4eta3gKlZ/EK3ClHvPQGGuJHjc3Q/8qKJ2fblKmHFQFgIuUQIMFKH1v0ttN336inZERk8bj7L3R7NOeM63QUAOd0zA9ePSrtea5sq8CmchN/GyPDoeOXVaPi4D5DkKGLCgSAUTdd96/IA/whuw/HWCJEr9tOEkhmx2AT8VkE+PSAQfmkq+miqlDHrAEv9oveuiMHRaaQ==;
	31:vnyAxHZoS91VWhIweG5XKzcGoKgjXOSw5+9IjGAqpNCR3LdG6bu3B25NZ8WrKNVYP08nf+E1a+IsmIa1hG2fFMPAF0MFAuRprIKxgkgiopBKxKoOqFSCzB7Q12TQPLgulvhJ+IUMl7Ds9thxvujzfNOjch6SQwY1Zp2Z0/NbDDBUdNmkOQjoUGBDKX8uJxSx+CuKF2+jyNEM7H1n3eQv0VP/faraJcwX+gFWGvjRy0Q=
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2818:
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	20:EfPr6Nxv6exTVW8ktViNOI7DEFSmsANMD3zXCLcmMO7hVOU4lLJzTHmj2S4XqZTusjyW1HlgCP3BaMye2Tb1lW7wtFpkguudjXje8E1CBqV6zIzrQYhHHLSNeN6NtkUxvP4KBoWvB8fs4qCztLMTVOIU8fyLk9mha03y8wwZUG0Pb+P0bVLlXj0gssNZ48G96sammT4nWyuiOvnu0KXg/kCfenqDIoeI6HjJihhxMsTETAixTXM+H9lGKi3h/fQrXgHEZMOcNKW1O2ocCuPktImmdtGII1sxHrQRnvbpj0gm0MGgJcvwKk+rtE9oJZ/TaEY/uh5k5IOdBWt8YFKf2hrP3skbgxoAXls8GzLgVthPnB8oZjeTpnVHaKgFjE5v4F72E4733J08iesLum4vWCww8sleg5FsKqTxd09RwXTgrzT9syw+kk8fswm4M+llZe/D+jtG9pTjo4f9GalL3tuNs1gzzkhnfAsfOU6YW7ZRy44zYUMbuvdF+2T3mChN;
	4:rI5KCi1mkADSJsH05RTrYG41EcaRfRtBNVmeUlhgQy1fr1dEzMmX9H4sINRNC3tkvguOJBy+Mp13toAUV/Tv1Yx5/QAAyKdQidibafcnt4v6IcRNkzbxEuA9EJdi65F2i6asvI4N3+/DbyNB1YLoewGFiBokD7GZJmwo+13hgTExxuRP5eNo0I+shWlQu8X++thZcLtjFCO4sbBEzkv5zLwTyV4Xr15uZV+hXwWjzhne+q7qk6tHhQgZ+MhE9zJn1hwmeovefDxh3HvxrzUG1tdLPlFzpq1GWmOxoqnAcwW5VqibuNgpP/nGZn17852m
X-Microsoft-Antispam-PRVS: <AM5PR0402MB281814F7DD898ECF9DD69F96E2A50@AM5PR0402MB2818.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123560045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(6072148)(201708071742011);
	SRVR:AM5PR0402MB2818; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0402MB2818; 
X-Forefront-PRVS: 0631F0BC3D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(376002)(366004)(346002)(199004)(189003)(50226002)(25786009)(47776003)(105586002)(6512007)(6916009)(2906002)(6666003)(305945005)(7736002)(66066001)(53936002)(48376002)(50466002)(36756003)(478600001)(97736004)(2361001)(106356001)(2351001)(4326008)(81166006)(81156014)(186003)(51416003)(8676002)(8936002)(52116002)(16526019)(26005)(6116002)(3846002)(59450400001)(956004)(476003)(486005)(486005)(6486002)(316002)(6506007)(5660300001)(386003)(2616005)(16586007)(86362001)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0402MB2818;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM5PR0402MB2818;
	23:2HKZQ7yYbROQP0dBVkSYnEwuHpAehL7EbJiATMC?=
	=?us-ascii?Q?48Ie7SgbPpgKmVZHDrUjSHj9SVcBcGqcgDndvDDfpTFYm2F764/xtOwhIcyg?=
	=?us-ascii?Q?2LYJHnxjmC99bNfRuCqq7e7+M0LxPpDsRy4GXMoyS8B8WG4LP0GUDdZYV7Tq?=
	=?us-ascii?Q?0DoFOnhmqFd932fHDrmmZTYD7wmw6P7njZskEN0R3GlO20yRTwSCFuWtLHKv?=
	=?us-ascii?Q?9L9SzvXrN6JSluTWsWj4VShWhFx0R/cDhcu1KsTc34rP1fctOe9c+tB5xZo2?=
	=?us-ascii?Q?+rTwqWQQhKoFGn2uL8kFfhKz8hPuQ7aTNDBQd7oHR+CfRaMTNqvG6n4VV9Xl?=
	=?us-ascii?Q?VeildXg6FR9HzUJ1fOBXjUmFYaEgUJstg4FbQ7QP3hnCltEa6m3RYn0lr/eU?=
	=?us-ascii?Q?q430gRaN/pnx9LqrnG62/ltl4n9Ivu23BkczTYewwvsflO5sVvnnbkittRFO?=
	=?us-ascii?Q?/n86qHzVODZkZR+jXvB/Eh+iYR9GysaGoeSavNq4l2FRxijZvCT7mTjxqTic?=
	=?us-ascii?Q?sW61nZYtoEv70ImpgxO+4+uIexwsp1WlI3WQYDTs5n9pG9tntdD6EPZfio/r?=
	=?us-ascii?Q?sxQgG3GQFyuk3L5N5EbCMLjxJs9jo0EfAOLlSvH9nH6rbVgnYdye0oDqBxKh?=
	=?us-ascii?Q?B3kVvVxqcON7LP3kMVCjM2pAtCg1lj4PoPtqxvF5sLfs4bHy2IrmGfZRs1v+?=
	=?us-ascii?Q?UL6BYZbhTS+5tOFs3qMnELwmhrn/qPSWEyIYpeSOme6/rZDQ0bm0UURXYYcg?=
	=?us-ascii?Q?WX68jWo885+GRNfrmc9+/l7V1Q2xPLQujGizurrUGy8+al6Uv3x0vj/BIyIs?=
	=?us-ascii?Q?xpcaEnl+8pIGJiR/6RWk6URHc/umxeKVNADCV0clOFI889/wZ0/8UF7az0Gl?=
	=?us-ascii?Q?Qq0fG9RE30LDdzNciyZIwBeUziQlubsuumvK2IwUCLWzZR0FOI6In0N3+Qsy?=
	=?us-ascii?Q?0y+VBaQZZsTUEKoSWigTknLOG0NIWOEnTvqYy6vnCoFxkmzOXp7rI7Lc3Y1P?=
	=?us-ascii?Q?EJiSG/pC3kdKOLE6N/IGzP2inujvV6lbHtLYZTIb1sUUlBqH8WPZ98ShXQJa?=
	=?us-ascii?Q?7+1AgqsN3s60Ax28I06LuK4UkWup8z9+f70GoM8xRERUC9kNdi8TNEzR5Xv6?=
	=?us-ascii?Q?MD7co4R6u/4SS3DRmHHT4PDlTBU8NDTGwMGjxWAq5DI/yR4kL7sEh34JPI6v?=
	=?us-ascii?Q?jb6BvzJypEaCO0sWlKrVrtV1lJrLVvJjqJGR9?=
X-Microsoft-Antispam-Message-Info: eIE+XgMjvIlWhCZbk3oJTEDZVc4nfKOTw9HId6fvUmjFi+tv2cVImIO+r9x+SRrDtS/zFElY3diugJYBppWVz95L9C7/xFfpICrLi54qioUIjRPnUOK4XoFTkm12spfKsVj8F0wTMJGeTG+N2RX5Kul9sOhNbY2wb9TNMdUfzB6yS72gfTDzidL6tj4+aynD
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	6:jM5856g4gR4EyNJLnqRFQDc9dySjRZc7PKIimdzfdE3oqGnumwOsAr9i23K9ODce+ghkpM8+TbGs3qrqepd5VzIf0nJCZafCx4xw8pLxdpaUE1MaZQ6KwG+SHuhtazzKKOIrl0nI5bdfouF84xxxuCUv3f3nOQybv1neqQo3kefdRCop8+62lNFaZRFQc0DI/EcIEoV1+YB6qxPDDdoBtca+TDVlM2qcibiwNbTx8iyfyaQuVoqjSI9xZivPjQXFJNLmmKKKm90tB7BREglRHE7LrVhA9mT5VNpnnHLqyP2bpuYDqFLpTsGe8H6NuoKJcCr44uZUswid9ZUqGRkj/B3AQYrUL1WwnQrO6PoVNAs4NvoOwM7owgUKtLYJSeaiQPCqx75llFCCJ6qc4EiQvja87KOcbxvsE+wDx0wlNd0sdVaTUoYOYBVnBg4WIJwpKa4VGvwUTeVm2RSiJ/zfxQ==;
	5:+siSnSDYXI4KxFgH7lN5ib9VilfWKwsA03iBSbtwxW6F9jOnLt7VaK6CksfB6zZlJmaBC4h44vzRvixP8KEk+UYcI4Rjn3SdUBrd+CLXKHmv8GJKf/gOnO4UHfZYvgVIGiCxJqKylzAW6ism8VP3rmTjp6ZBl/ZFCZxdVFuWvnc=;
	24:GaHVj6aYxXiFmd6lLM70cxKd46keyq5SlMPdVbHwMrtqTvBQBjKuxOrylzWR8VOaVHQd0EiZySo8FvOA8HlHQ/WmGCipJtd1LAX0+7vqE30=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0402MB2818;
	7:EzanduakFVHfb7cRyzXMwOTUssZI1gAj+RiuChnpgleKHmnSg6yYHwWfqZ8iDMPyVvDu0CK30pEmpbocW6TCPr+u5ar+1IWRcYlLyGjD78MaFUZTbYILmWnkZZkCKC3/KMed5OqSFJjW95VJZQYPHx/BWZc6h6NfYZVA+P2lCVPjh0Pm4GY9z5lU5r+qkIrzLEwGk+O3A+l6gVEVFNmnq9q9ptlwbYVh1UP0g6D2+ikx9uIO8r50adqngXq2EpvA
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2018 13:52:05.7988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc586d5-0ac8-48f8-9802-08d5996a1669
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2818
Subject: [PATCH 1/2] archiver: Fix build errors for kernels that don't use kernel-yocto.bbclass
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
X-List-Received-Date: Tue, 03 Apr 2018 20:26:25 -0000
Content-Type: text/plain

Special handling for kernel source in work-shared was
incorrectly limited to kernel-yocto.bbclass instead
of kernel.bbclass.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/classes/archiver.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index e17e6b4..c107615 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -319,6 +319,10 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     finally:
         os.chdir(cwd)
 
+def is_work_shared(d):
+    pn = d.getVar('PN')
+    return bb.data.inherits_class('kernel', d) or pn.startswith('gcc-source')
+
 # Run do_unpack and do_patch
 python do_unpack_and_patch() {
     if d.getVarFlag('ARCHIVER_MODE', 'src') not in \
@@ -331,7 +335,7 @@ python do_unpack_and_patch() {
     pn = d.getVar('PN')
 
     # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-    if not (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source')):
+    if not is_work_shared(d):
         # Change the WORKDIR to make do_unpack do_patch run in another dir.
         d.setVar('WORKDIR', ar_workdir)
         # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
@@ -351,7 +355,7 @@ python do_unpack_and_patch() {
         oe.path.copytree(src, src_orig)
 
     # Make sure gcc and kernel sources are patched only once
-    if not (d.getVar('SRC_URI') == "" or (bb.data.inherits_class('kernel-yocto', d) or pn.startswith('gcc-source'))):
+    if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
         bb.build.exec_func('do_patch', d)
 
     # Create the patches
-- 
2.7.4


