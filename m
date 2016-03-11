Return-Path: <zhenhua.luo@nxp.com>
X-Greylist: delayed 4679 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Mar 2016 15:27:18 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0055.outbound.protection.outlook.com [207.46.100.55])
	by mail.openembedded.org (Postfix) with ESMTP id 16DDD606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 15:27:18 +0000 (UTC)
Received: from BY2PR03CA078.namprd03.prod.outlook.com (10.141.249.51) by
	BLUPR03MB232.namprd03.prod.outlook.com (10.255.213.25) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Fri, 11 Mar 2016 13:53:26 +0000
Received: from BY2FFO11FD021.protection.gbl (2a01:111:f400:7c0c::169) by
	BY2PR03CA078.outlook.office365.com (2a01:111:e400:2c5d::51) with
	Microsoft SMTP Server (TLS) id 15.1.434.16 via Frontend Transport;
	Fri, 11 Mar 2016 13:53:26 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD021.mail.protection.outlook.com (10.1.15.210) with Microsoft
	SMTP Server (TLS) id 15.1.434.11 via Frontend Transport;
	Fri, 11 Mar 2016 13:53:26 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2BDrNoR007883; Fri, 11 Mar 2016 06:53:25 -0700
From: Zhenhua Luo <zhenhua.luo@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Mar 2016 22:01:06 +0800
Message-ID: <1457704866-12711-1-git-send-email-zhenhua.luo@nxp.com>
X-Mailer: git-send-email 2.4.3
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131021780069396509;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(377424004)(199003)(189002)(50986999)(50226001)(48376002)(19580405001)(19580395003)(229853001)(87936001)(6806005)(85426001)(2351001)(86362001)(575784001)(5008740100001)(77096005)(36756003)(5003940100001)(105606002)(4326007)(1220700001)(47776003)(11100500001)(2906002)(1096002)(189998001)(106466001)(586003)(33646002)(104016004)(50466002)(81166005)(92566002)(110136002)(7059030);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB232;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD021;
	1:uAsgRajZeg4eIpRYmiCiwpOO4mwpfzcu+Eelsh+uIt56/2B7wIuGv+eEiP6B2VF15vLVFRkG3+iK5U2t7hBM8u3XlpNF9T39RvKrWXnuOHQeqY/q/95r27JGOKp0UWkvMKAPgkMsdpUtbWS1K2394Pv4d53pRO8Mg4zkVVx1YhMx7v/8Uw8vvPZmYDx/rK4B8yVUO5HjGsOVDg8167wHM1q4A+bOZJoJv9VQlfK960IWwFNx3JaqB3oD9tkvgTAzZW7bECjMK0Ea6Ns0Ro6DaEtw4UYIHtVmC+HBw/PipUHa5Xitb0jf/Brk7sIAni+IbqT2q5tnXYD2k0iO/nP1WYw+WLaDiQqwNfwVRrA77plMnuHpDLqRJy0s33Em1HxHQju5Ter7o1qaWymrilo6V1slvWgUKTIRkNXVfDi+DOy3MxRTigv+D+s1Kd7gQXtHKQqKqlXHYRtfwhWRHQL2cj4z2SMp6Hg5RXR5h3SMI9tGmrLXcmZe8q3tvFzV1jU4MUL+JJ8Y6iKDmF0hJ3x632zez8zl4SGQ3jCh0S+cVRU1Uo5x8Va+jjSAuQMrQz3bxeRNW57HEZIp8iJ6CnbpzCJYf+5z0zBZ9lHEGmHtmI8=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 28ec14f2-3f70-4dd9-cebc-08d349b48554
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB232;
	2:PfE3MOywPRNY8XROCeggChgE04YwQghsQ16Pej3OvBs5cSmxQT9YA44l+skrVv5um2wg3RplEyLT7HqdorEimWb8ozHzh7fGYPtEpC+5KkmeXC1ArOVWw3AD7FNv8dojuwoK25FGcyg78u/avYonx65EG4swvuAqjKFwaYUtrEesQAglyIpZF9cvOJrkhMRl;
	3:C1mcEyufjacfcYTMDjbg+X5IMNepEBOGLdHpRNrdKLjH4Un9K8xYEvfr2OEvbKpbUX+TSNhznjwkW4fFuJt3JBOm7R+biUZEr1qWqqmd8o9nBER9/9NdlFuDsyzS/lN7dJ9qaLzXGlL3Hmv9eQ/6iQvaLXMSqVV4Kb0JX+CM3k6I4DnYzSKkgiZ6iOxGaDR/AqnuBJ7q/o/sxif3c/ZQOFzapwgIgb1SiKHBd2/+7BU=;
	25:YZvyNtCXhk57Ey+Evro6XVeg8VpoY6KOI/7MrH7jJhhO/HvONRRFGUfn9t945+VBkrDETmg/Q3XRpJJP47nGF91DNVqjaPVF6scvm4X/ckv5bH3Pr14H13rNefYZm1zAhb+9Y3UEVS/xTL2AL3fvTx/Q/y6s6Ri/l7FotTPnbqh5R+/Tjq8fyRw5c90l/C4qTOfL8JP7bAhJ1Iu712qodV2WYt6nEzpJK8DWHEHcCsyHaKXRtMA19slLwqx1P3iE93GrBQZTNN4Bk3ykspxqYoCKfgDoYN4vC13EuLDAc6XH09rFepGMHOon8nffKxJjPTJuqqOpes6HUbMrgMtn8w==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB232;
X-Microsoft-Antispam-PRVS: <BLUPR03MB232E687E6B18E13854A6FCBEEB50@BLUPR03MB232.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(8121501046)(5005006)(3002001)(10201501046);
	SRVR:BLUPR03MB232; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB232; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB232;
	4:thR2MUtC9CXFCkYYg6f5xFDqWaJRBvem+KuNsm7O5uDAb0mXcBi5WoFb70fCqqW7O0GmvcUNGttjp2cuZHXK0EEqu7WXwfmjndaNh53RS4hko1QJk41GPZII37qX8c4RZbzJjoQEDRhqXESKfr7CMB55MepnFfXD19J/1TvquerKh582+g84l/d2TdsCYmlmI5tZ1tGp5Q+7XYjODZCQctAuBV3KstmeQ4XNn69sVUIQhXfGH2uZC+rfNtNTeIXahj3QYJBhAVUkr5XWeypY9iR3v03qJj6s663vUz8uLqzSI34NJ7taKTC0Qv7vbmcDSEV7Qqv3Un/pOiCl3LYgFtDJ1ZCF3EiVGJw0MAnON5CQEP+u97uOVbvcUimkjp77p6RtT/Z8vT4jUrhFE1gefjDTynMKarBf/JvS5rouEFftbvKBo7+VUMEgjuV9iUezD0R/F5Ya516NocjemNHC4g==
X-Forefront-PRVS: 087894CD3C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB232;
	23:lUPdeVbwBxgGwoxCYGb066m2QwIVBiBT1cw8hlLtGv?=
	=?us-ascii?Q?FH+FYuZxUh4FBIinWEtoxEOlxg9aZtaHUZrbnzIyQ0tky6MBbOlGGKdSUOy7?=
	=?us-ascii?Q?dND2icCVKLbY5k8S1zqsEl0gF+L0cYsPMufU2KBg5n/y8F5+MqcBvC0IsbVr?=
	=?us-ascii?Q?wRfNAZsoQM7db05RI105Nrn5d3qr90b09ZXRA/r2ZcKuweEni8lxgPZG9aUN?=
	=?us-ascii?Q?e8ZIHUDjXqiUmKmpqVNyEKoq58MeD438F5067Q7+zlTymNOAja+Xu69YBoxh?=
	=?us-ascii?Q?XNv/bsxfhu5vb8fvwyU+wvFvnjam1boCN7PDliFgDK/beqtSbsiyNrf5Gvfi?=
	=?us-ascii?Q?twtbdylmWw4/V33sH6qvA46WJl/+zDT17IB2BmI3MIVT8qGvY05SqrACxT1E?=
	=?us-ascii?Q?YEZhSJWB4OS3Tc/IItfF38O+E5kt1Bsvc2otxZSL+PAvJcKf5ymNqE9zc21h?=
	=?us-ascii?Q?lwhIzOtOdSm3ARU74HyUGDFygeik5NZyBgb04M6vkA29UYNWuQossZ1oMUzK?=
	=?us-ascii?Q?oNLFrPQdL6GYd6We8vQVhASU0vI+ReinkdXgtk9FBOtR29Vp+KkZlN019i/d?=
	=?us-ascii?Q?Vn7U/DkyD6bKUSDw4FIa/rmCvw7RCJr1wChrbPXY/nmznjOKqmu4xN/pVrF/?=
	=?us-ascii?Q?FacnPRlzByRkGiZB79Nxur8BIb1/IteC2AIJ7qnCxzYQQKWhid86Qy/swLlN?=
	=?us-ascii?Q?eSspOdQABqKFIUQBu3UsTsThadXbY/TI5X3HsuxxSmNmDd70YZ5o9mDdlaNR?=
	=?us-ascii?Q?91WGVLen5ovATprUIZEN0lm4KNd17givpW4mKbQo4U55epLYLOXVOxgOEnAg?=
	=?us-ascii?Q?JQchYTOwEKHeFSdw/DC2RcYYdepnvBVs1PgZyogXDEFe14pq1EaHdqUzkJd3?=
	=?us-ascii?Q?wjkyx7QsrMFBDZ1k5ZclbT/GvltA+3O5VmulIoAsKuzwoXwduqgWpXz20QO2?=
	=?us-ascii?Q?9K9w9mlMIemrrlGbuHGX6aN6pp3allMkg9mSClTHquOH33Q44EBEfxd6ekTG?=
	=?us-ascii?Q?LvPyns+Y1y6Ra64CGoSka28UG+WVsyhXu+U7lqRBLyaMq98iiDr+ousv237v?=
	=?us-ascii?Q?pwVqqsBEi4GJwYo4+T96h9pBPW?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB232;
	5:N0eYLFHkOmwKIxoBOOqN8WL/+vDURXxZ8PqhQs9z626QWn4ge3RQ1tToPNBUF5+REscfy5PsNtm4XL2Cwzo0GMjjUn3BA9gjxU0NDZWrNqLF3tVPO+S1WbO5yewET5SoepVI3slcrMVj/84/OD143bJvzm5Pz2RTDLKUQmdNXU8=;
	24:jNe/2zU9T75fdUKtspWBq/S9vpJw9EoGbh+MiCb1hJd62LBMPjVdv/ZA635vBdKIOg+UjZeEyoHF1qhJ9ycw9gSrVH+bQv1lgEaDSMwQjHQ=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2016 13:53:26.7212 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB232
Subject: [PATCH] python3: fix configure issue for powerpc-spe target
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
X-List-Received-Date: Fri, 11 Mar 2016 15:27:20 -0000
Content-Type: text/plain

When confiure for powerpc-spe target, the following check will fail due to
PLATFORM_TRIPLET and MULTIARCH is not identical. PLATFORM_TRIPLET is set to
"powerpc-linux-gnuspe", MULTIARCH is "powerpc-linux-gnuspev1" which is returned
by $CC --print-multiarch. So set PLATFORM_TRIPLET to empty for powerpc-spe
target to skip the check.

Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
---
 ...ython3-fix-configure-issue-of-powerpc-spe.patch | 26 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/python3-fix-configure-issue-of-powerpc-spe.patch

diff --git a/meta/recipes-devtools/python/python3/python3-fix-configure-issue-of-powerpc-spe.patch b/meta/recipes-devtools/python/python3/python3-fix-configure-issue-of-powerpc-spe.patch
new file mode 100644
index 0000000..c18a3e6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python3-fix-configure-issue-of-powerpc-spe.patch
@@ -0,0 +1,26 @@
+configure.ac: fix configure issue for powerpc-spe target
+
+When confiure for powerpc-spe target, the following check will fail due to
+PLATFORM_TRIPLET and MULTIARCH is not identical. PLATFORM_TRIPLET is set to
+"powerpc-linux-gnuspe", MULTIARCH is "powerpc-linux-gnuspev1" which is returned
+by $CC --print-multiarch. So set PLATFORM_TRIPLET to empty for powerpc-spe
+target to skip the check.
+
+    if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
+        as_fn_error "..."
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
+
+--- Python-3.5.1/configure.ac.orig	2016-03-11 06:02:38.955270329 -0600
++++ Python-3.5.1/configure.ac	2016-03-11 06:03:05.491269382 -0600
+@@ -801,7 +801,7 @@
+ # elif defined(__or1k__)
+         or1k-linux-gnu
+ # elif defined(__powerpc__) && defined(__SPE__)
+-        powerpc-linux-gnuspe
++
+ # elif defined(__powerpc64__)
+ #  if defined(__LITTLE_ENDIAN__)
+         powerpc64le-linux-gnu
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 11f959b..3eb938a 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
+            file://python3-fix-configure-issue-of-powerpc-spe.patch \
            "
 SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
 SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
-- 
2.4.3


