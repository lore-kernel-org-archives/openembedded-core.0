Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 1165 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Mar 2016 23:35:50 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0144.outbound.protection.outlook.com [157.56.110.144])
	by mail.openembedded.org (Postfix) with ESMTP id 1CDE7606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MC2ojyxgW0yQWBgT5J1770KuXApvennXANJSF8PO7FU=;
	b=24rnmMX4Xiyv7S8v8lnJ2Ku14NtVl1J43EFaw0LOIAcKRXSvhq3h5HAfaLdX89wgga9I7tw4SAlXaU4IJ5pOQN21vRcT+D+AgakV0cYZNdLnSMYSThQG8+oQvWsEauUKw2EVs8lRAfq/HxplMMVXylXYIC2JVxbLttTAXtUfT3o=
Received: from BLUPR03CA011.namprd03.prod.outlook.com (10.255.124.28) by
	BY1PR03MB1420.namprd03.prod.outlook.com (10.162.127.150) with Microsoft
	SMTP Server (TLS) id 15.1.447.15; Mon, 28 Mar 2016 23:02:32 +0000
Received: from BN1BFFO11FD029.protection.gbl (10.255.124.4) by
	BLUPR03CA011.outlook.office365.com (10.255.124.28) with Microsoft SMTP
	Server (TLS) id 15.1.447.15 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:31 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD029.mail.protection.outlook.com (10.58.144.92) with
	Microsoft SMTP Server (TLS) id 15.1.453.6 via Frontend Transport;
	Mon, 28 Mar 2016 23:02:31 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u2SN1iO8022049; Mon, 28 Mar 2016 16:02:31 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 18:00:01 -0500
Message-ID: <1459206002-30154-4-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(2980300002)(1109001)(1110001)(339900001)(3190300001)(199003)(189002)(87936001)(230783001)(47776003)(229853001)(2351001)(105606002)(50226001)(106466001)(5003940100001)(33646002)(1220700001)(1096002)(11100500001)(50986999)(586003)(86362001)(76176999)(104016004)(6806005)(19580405001)(450100001)(189998001)(92566002)(19580395003)(2950100001)(36756003)(2906002)(48376002)(81166005)(5008740100001)(50466002)(85426001)(77096005)(4001430100002)(4326007)(110136002)(107886002)(53416004)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR03MB1420;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:ovrnspm;
	A:1; MX:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD029;
	1:dO3Wuh6sve9BugO0V373KoYyushBwojfvNY6L18hpr2vak+moZA5TgLL06Bsas+fWMKw1Nv5xXk2iDxbPF+m1n8SvcgZZ/vjQt/w6Dxq98OCd6jIuxVhvzCpsHZvBrxvB22zGGJZQajynHmHccxZnsX5ZHFZKLOmEGaZK1m0FOA//elkdXEKfAj3Yy8kf9GRA4NuZsE5XjNWFE5V7Jfx9iWJ8ys+Z6zy5ZV1/uiwqWEHJ4CuHG0ZWg0IIg8T5V16ShmQy8F4bbBbI2Dqd02ZYN2bLLda2wNPyxyVXhyEy+0hHct6ikrZK4cVGcUU/jflKARmXCGkN50oFyYEv7NMAz0qb+bC0HUzGZziXJzNWnYyhTNuwuwup6b9mnTHQyOclbz9KSFohW+4SFyRFNaIXWDmfDPGyrztC2Botj0TsydwhVuhnYhaiQKeT81zcXsBPQXJZ7HWxOr/bu2ic9wOZWnDOHxKzHr8fY4ivAF1QqGdly9VU5R933eQC3v2V/1Wm5jzxlcVR5kYW1heZ9MEJJE6UWJfpLzpNDnJw7iiSV0=
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 070bfa5f-742d-4485-ad40-08d3575d0b1d
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	2:ymnJmjS4vjuYl+b/Mi+fF+ejm0Lvj4ejxT4klRlvsUtSyJPIVkCnv5l/E0mHxAbU54KRusqKjiPOCamzSU0opTpf/pdde3eB11j5JhIY2iGvJgQCgjzDZ/yKPkTrbv24lI79N8pE1LjJB0pefsPZm4McHUMjUwffZLiixaqlUMfm00xGekRU9tbG788kDdAV;
	3:l7bvCbBys0ik0VwyLGDbY5G2JjEWU4nyyq14An2/K1fmNTmaKIrxVkbAGqytmR4KRE3OyLiiUbUp4sTMBXOEoqLetaKyKXzxxuqIEvX1Tz7s5oo6rc8UdWedNMsawLibyvq9g81bIdZZdF9Ox3CU/3udwWEIt4YACGwOsriovbPXNolKrL0TL52MuscRoRcIfolIBp92hPBiCB0ShWc2Xb98gSLAI4FEKN4ZFrPb5ho=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR03MB1420;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	25:ikRt3qcnIiT8FRUED9RvGignOWvNz7SXLn/MdlNUz4qLVXDFyYPdhF9Imbmk55AYKyj0BwJwa/+3mhalnS3ZHAenIzbl+yLGEXUEwYhuLE0J8ZJlYFOMDOoD3qIOC2P8224Dd92RRcRArZomd28/kR9YsuW76DudLZrjhMI6T5tu1SfuA3hXo6/1IZACBcoPwwWaYmr5AgTWWv8220rJYxs4wgH+uu+rbWWUyobus3tZo/uEV6HPWrGq782GQza49SCk+nqo4sIBrYSbXePmpkmWrsoqQtxEvXpcIebq2EFY2T7kSgW8kpEcVHTfLLFl55JK7EIm1Fv7lxpl7Tweepur6LykCrjO5DEWfa8LcW3P4yTB2ePuwyffgj+ELr+4/qTBGtkUNJCutWl+2hVz9lwoJLv8mu1twbSatoqbELT/6jBeNEBX8IDOFlSiWT7+Klz1ZfT8RrV1UYct0YhNmQpnLNd1vgw2E7VR0wobV4MK+Hw/vhSHsiktRRotsZwgIZCcDSREJTH2ysZTF7jcFaN1jk3h+aWmriy4eroQIIs56gvuKEuGZeFp/JmC4I9NvoukAN8JJV6NhhEYyWiu0w==
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	20:Mj55g0KdkXWmXGLM0jqTgLVI/25q36MinVR2kEdylfYjLVGhBLNLcN+QyQoR6LqXYGQXJzz9SYi7YWPxwkI3oeszQUf62O47mgmk4imI+EL1G4WR3LzgDCiX/4mM1NxR1cfqgzl1ZthZF2Sr9goaKXHDcFOWN2TmzDXfhmo/DpxbHzAL1PsOZHtpGTpgckVgULpuaKYUazy1h91QAzONCsend9hH3pACA08JMOEagmpDkSnYUzh13W+vUv4PVohagHVL2DOnwf3VT71mPU27D2JkrYfpixQ3VDaDvFQerbHSkCE3wAjyU17/cv8orbQkWcZ7MBmmY2zSMFfm3IohIMHZEx/gHglKAcMJD2I6MyhhFYQL3I/0+ssIH54oRmURVofcauznLf+y+uep/Tp7sjYJPyXvEe9Ae/f/nUYNI48VZm0nuSXHYGUTm87DjNaq;
	4:ZQXE0bg3b7PthMPjSg+pi7rwugS5r3m5le0xR92DEdN6cySQ8nYbB+JEZ8RGY6606hQMSuATtNK3sRluddJgyn3wQd3tEyeEJy0IphOGfnmP5muVQhXHGbeyg9TJu4sOKziuGReqMoj3gUvzLPHiKgmDvx3YttIslRgjLOqPNCsNmJs+mDSgzmKhbgmc7gH64btNLFSoXkMu3xMmLcXgWJ2YiywFfHCMb85iWSnt5HCUDSaGzTPq0lVbwGEvHVDcMyF7PHEmh1fQTGfjRwLz7jcbSKOomFGGk542F/uCOb3Qmr4RflqOorNVZ/rzFIMcpHRARwXc/5ScAg2MDLebGHAQAfqCdfWk7PHuCqjWVGPqIUvS/mBvmd5qP2ybM0NjOnH4ysMjpXrirmyR+ypRHdp7pYBuWqKY/Eq6zgBOfuJxvMBD5QfcPYTse8liiZuSw5U959OK02lxZXExb/rlpA==
X-Microsoft-Antispam-PRVS: <BY1PR03MB1420B3F92B3CAB9E215BCCC5E8860@BY1PR03MB1420.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13023025)(13015025)(8121501046)(13024025)(13018025)(5005006)(10201501046)(3002001);
	SRVR:BY1PR03MB1420; BCL:0; PCL:0; RULEID:; SRVR:BY1PR03MB1420; 
X-Forefront-PRVS: 0895DF8FFD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR03MB1420;
	23:LoDmt3pGdMUwxetG8jxdFwgxOkMlhmFQxKQfBaOJn?=
	=?us-ascii?Q?Hqs3uLnnZs++w7lRrmF8QvpbogQ73wjjBLfQZMZzomN9cnd7oeagtkffzv1w?=
	=?us-ascii?Q?0IVj3DZYzYRfWMrjIcd0570ZNPZlMLVjOCKlCfXqlks0bfJZMyQgmKyhnIGu?=
	=?us-ascii?Q?czu9wQhKyRwZ+dhdRx0RrGs5s/4QG/3AmMD/lypP/kC7cQYGrpjNw3EqWw0o?=
	=?us-ascii?Q?oAMRe7pmuYLGUBO8qiszIiPuYVqxmciWfrl+ScGbXP4yrXk9iEgnHygH8aTb?=
	=?us-ascii?Q?v0p0LZ56lop2k3PGWEubN9cV12b1FIU0o/Bjvas6thj5vgWrRLd4KvFyIC09?=
	=?us-ascii?Q?xKF77oAac5chBlvQtnD5o4bzSgprxt7Jle2iOIjEYsHVvkhdTkB7/tdfXgNS?=
	=?us-ascii?Q?zWWF4LhM9rqIAYWLifRZCPto8TrkP37Vkh1q74K9bwHFIlE/AXZnSgB83g39?=
	=?us-ascii?Q?kFmvAov/QKYGKwWJQgSiXxl/VWUVByWQzextxLKjzkfzs8eEjbwC2peTGf2Z?=
	=?us-ascii?Q?lIQ2/2iiuRw4mRHjtr5L+2Y+sTdZSXpNZdigNE2WFJ+jISvX0hHPrGzMtWwW?=
	=?us-ascii?Q?OTY6AvvrHXPdxaZt4YUwVQcWGFYiRBDa/ccP+V4ZSWD+pGoashqhHstHmhyw?=
	=?us-ascii?Q?f8qlBCW9+eNJI2T4wBGBZkObYDfN6cd6scS2Bir4somUtjtGihR0qMpqbqt5?=
	=?us-ascii?Q?9PmAmCy5ZFGF1gj8exhu0ulF7iBRB+XksiqrBZNfSMJuSyKvOvDz2FsaqeV0?=
	=?us-ascii?Q?PjuJzZyNHOlHq53G03iL5WfY2MXaasjKk1rAjVe2T5jxPDt/FSvW0GRdJdyO?=
	=?us-ascii?Q?ntyWD8yjpvAa2sXaPOUoDccpvyHomhG6GXrDKceWlGu2yO7aV6t0UgjxNpX0?=
	=?us-ascii?Q?DVOY3+cvvLpjqhIZu5+LTjZMg13nvsUfTqFhkUtseiwGa65n/6Y/i/uz3ztE?=
	=?us-ascii?Q?30RLRUnb1gPOXIjZEweh8ZFAwz2h88yhyD5BDoaOCTbBTUbOrt7/kksWCoOs?=
	=?us-ascii?Q?9gnMWIcr9oULMzx0Mx0IjkSJhbjc50tAJsEUrhsiIdz3iVNUu0xYPfI8qkMH?=
	=?us-ascii?Q?qaf9hkOrql+mnKyhZObSLuzkrpysTrezqS6y05QrNz2OKHoRgcXmy9hp6M3x?=
	=?us-ascii?Q?Xf7Dj5/+ZsN3QG1JQ7x2ahPbjsLlKf6O6EwPZthSO+MdjDC5unQcLYLig/3I?=
	=?us-ascii?Q?iDLOLoW13dcdIC31YOtkeVI0i85dkFCi912Atahp7vXv6+EkXJt5qtGG8GVM?=
	=?us-ascii?Q?X3yu3CbkJhga1DbfEoc2uwy28YiAmHfbreC4kApVzW9nKryAmE3yHE+ZKjfH?=
	=?us-ascii?B?dz09?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR03MB1420;
	5:NWWbMWoW9lyRYR0U2wkPuKExCfqsLc0tksl4O/w5sQQESd6NRkumvDKE7G5W53VImZ5ZNqZVkxfTTL/mTDsmZGX+xa6HaJ3985KDZDPfSgcLvQpP1DJGXLhSazeZAy4wXBLl9PiCel5FCG0W2RBQrg==;
	24:fbFwhSGYleEXA4T3KLjolzPSrWYLb04wk9eOXYWlalE7z067x+yO1zT9KUvSgJrCizdig3NlCDJclj0MQVJcRSSuoZ2Tpez82nQvxDUhQ98=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2016 23:02:31.7725 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB1420
Subject: [PATCH v4 4/5] core-image-weston: Add XWayland support
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
X-List-Received-Date: Mon, 28 Mar 2016 23:35:51 -0000
Content-Type: text/plain

Include X11 packages when configured for XWayland.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..6dd49e7 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -8,4 +8,6 @@ inherit core-image distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "wayland"
 
-CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'xwayland', 'packagegroup-core-x11-xserver xterm', '', d)} \
+    "
-- 
2.1.4


