Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0133.outbound.protection.outlook.com [157.56.110.133])
	by mail.openembedded.org (Postfix) with ESMTP id D3AE771951
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:54:39 +0000 (UTC)
Received: from BN3PR0301CA0043.namprd03.prod.outlook.com (10.160.152.139) by
	DM2PR0301MB1182.namprd03.prod.outlook.com (10.160.217.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Wed, 20 Jan 2016 09:54:39 +0000
Received: from BY2FFO11FD055.protection.gbl (2a01:111:f400:7c0c::158) by
	BN3PR0301CA0043.outlook.office365.com (2a01:111:e400:401e::11) with
	Microsoft SMTP Server (TLS) id 15.1.390.13 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:38 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD055.mail.protection.outlook.com (10.1.15.192) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Wed, 20 Jan 2016 09:54:38 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0K9s9RN004523; Wed, 20 Jan 2016 02:54:36 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 17:51:40 +0800
Message-ID: <1453283501-3982-7-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453283501-3982-1-git-send-email-b54851@freescale.com>
References: <1453283501-3982-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD055;
	1:j4ubSxArOPtlNfZMA5p9A24gBG7VzfMbDGpNXq9zc+CiaguXi63fnVVbkPTraAQI2r3NoEy0fS3KwFVzja8no4q8ECWvQ1Qb1iNustDt285NP5YoOWqy7OvSdlIzz5YkF1/DtYjM/WhFLx8gxeK+lrHqBJbm2yjcZbQfMUxKI7BEmsDMrFxcuMt3zINX4hIEUr29IXBRAIhOCjngXsEYJWQCF/Nfr9Mjgrx9JhdA2NJ8uc4QhxhQndvTWPq6k7ddl7DlPSqYfVD6OZPEAB4Wem6hfd/f70zep/K8L+L8ypzL/XbbL+Fm00ZQB/rgEtD71oPuT36O0CAgzNKihT7n0PoAsxNOZCW1MII97yCGpvlzSgMohw6CdoMnOHDlY8iGIEPv/yW3egGBCwP7mEkFiYbbfe6mH23V01ccV4PQACcY16rjmNbljnB8uFQg8k9Q
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(6806005)(86362001)(230783001)(76176999)(48376002)(50466002)(33646002)(1096002)(104016004)(1220700001)(575784001)(81156007)(97736004)(586003)(50986999)(19580405001)(2950100001)(229853001)(92566002)(15975445007)(189998001)(450100001)(87936001)(110136002)(5008740100001)(2351001)(47776003)(106466001)(85326001)(5001960100002)(36756003)(77096005)(4326007)(107886002)(50226001)(19580395003)(2906002)(11100500001)(4001430100002)(5003940100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1182;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9fdf06ff-bc47-46be-e74b-08d3217fb5ce
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	2:qP+u287RgVDrPzPl05SHvVQBJslSGQPj/WLVe7ynbVup2y9+a4UPPiaJK38Mgs4wNLgXRuhxZclULM64G4lfCKjcbrpRE/u0FBZ94BlF7qvF8xCqEaCwQWXcZ7nh/19xL7Nm0SqXrvMdOg/z020RP/vIYydDohialFl55hvpybHxn+J23z/GX40O49MvtmlZ;
	3:Cw9hHUY9NEtnB55i7j6zM797QvQlKE13xQXPeHKtz9GZ1IHf/8TnZwUWZu68kX4TcjkSxThwxhTgsAhA19hYXYePx5U1Um6+cX/Qakx4w8PAdtLc+B/gntKlyNExyYqSnGTeAVh5mUNE1Qr4CFBc2zAECC9aKgCgUn81kuzupl47D9i2GKztHmgHbUtDs5YfNw3NSu8ebdw51CrkfwISlq0qEa203llMMCRuyEJmOtk=;
	25:3r5n7pP/S3LoFas45fkLi8K4BQtbOUUYtpH0sx29h/ANx2p1Fg5waARJBechXBUVkvHqdxtooP/p1WGI7bo28DlxlcuB1Ymkc1LkNVjWyLjN23/K6Ww3vKmodNbZXGor+avt0RcSVkU3hf4U/iAFjA4KarVT5pHjTNFxG8Xkq6zxu0E0UBjDJzLhUsz4Z+WTnAAEiGBs1rtblQdeESiVpm+UKWVtAH0g2EUL4zmgy6JlERdO0wJpU0Jv3u6wlhdC
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1182; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	20:RuE1NI1JpPeLMEuDzeO3owtnE6KePzLYXxfCbSz1AnxAcXfDp4l8gmBWW5nAvYHt/ssfxK/Fsx3Gvj/NPqPOXiD6oaPZpF2INfGuPNV/fwXYBWlIKL8kxF/AFqIcjeWYODPbwPgMdzvhjB9NS/KIOLPBMtCmNcip06ZqzbvDBf/ZaAPhtDgBGpJHrLja4WLJg9ynpv7paYCcFzL2Uyus44VGnLzWby5wF6CErKsSk8TvX9U3teig2f76nkwZS/leOCY3zLhOphyMYpRlHrVpigxfe/jaBqfAOk+nfGYXBov/e6VJ85AOCxb73tD3JUZnAuhiGMhx3iJvRvf/yMtMl/U+/REfpXdBEitrocrL3bbFSbevpC2S+qba2O+0Yc9afAfpyNr4ebV/vuBMPPlY5oSQJOTfcwIm/T4wp4GlpTCQ/sYS1++pI/dfO0/D3xHD
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1182EE90E18C54FB53A8568586C20@DM2PR0301MB1182.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13024025)(5005006)(8121501046)(13018025)(520078)(13023025)(13015025)(3002001)(10201501046);
	SRVR:DM2PR0301MB1182; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1182; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	4:vkO5cCM2LEtYxc8vEBZkiZvHWDia2TJPXXkt7kSmck1rPmAy0knog7GEI2Wqc0MA+VXcCtgx77yA5k0RyDBJzly6SB5SvgTymgTk9+wyPjyGYL43J+g7eG9EIae6wf1JfcpC8zJ5H0azolelLhcgFbFFz7F7f+DrhsM5IXd2tQ0clSRypdUQAD8RcJ9l53ZjxAn7FCQNn7Nv/q5uxS23XKcdH3Ko/WaJaC22oEc2ZNrLpGypfgz1nWmuCDAH9OC0Jg2oxyK+b+fNFs99I0RSQ7ypLktY36pLKxUYEx6+wvKBprks8xfLPU0o1+/wh9eUqBhC+t1bLgUOuNSd/GK9w+AfEJatL2W4/ukQu4RSyg6Fl14YRWAstKN1MQ+mUmT9yEDH+6I8lDty7Rab9awW8D2qcboyd20nPOikKQ8MBtQELQEktGrulGuMuCbXjdztpMDyi3RrPE9U1BhyemwmJK9JxGUBY3NivfQp69OgcHX3kI+ImkLyMr/0hLb7a8KOeR+jVzqDxdOybNKIun1voA==
X-Forefront-PRVS: 0827D7ACB9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1182;
	23:q2V7skE35WOS33HfgY4DPlyLLTyQ0K1O65Mc83n?=
	=?us-ascii?Q?PCqHEdtvX2KLhWdlrKu51KolGScbmc4YjI9RrPqwVEbvmcN+PsKiYhtCw8sD?=
	=?us-ascii?Q?B0YxQKoMg8w1mZ4NDvnbkkjnpEsr38Axvyq83imE8o8MlO7Y9CoC0FyF4x8g?=
	=?us-ascii?Q?7RzTupFIeGDlu54Ie6LTn2iZl1bTuKn8WpYk3IjmNkL8p28byArmm4zjxy9q?=
	=?us-ascii?Q?T9b4Vq9s9IMnb/vtForDRRiXGEy3fYA5NB/pd3jpd+KoST2nRuJ5UYrEZgSU?=
	=?us-ascii?Q?5OP5y0IdnIp6lt5dx+iCTJefbPO6wVH0cRQVownMlvVD5Lq9kWZF0Prso95C?=
	=?us-ascii?Q?e9hS8T2Qt1Z9wQc5vJFigJSgR+n6KTOBDn/jJI43yymZJxwua6AysALGvSyZ?=
	=?us-ascii?Q?btqSs0t5tRmOw2B9FyPL0QeF0uQOQRlgsFiLRgTSl3Q6lkg5YViTwJRu17FP?=
	=?us-ascii?Q?wmgwQQN4lxqCiSJS/K+hhDsYqrq53XXwPksWJtbYarZkAJCT2uMK8X404aYT?=
	=?us-ascii?Q?yzrzyk/ZILkMUyUFfo48J9oCfkUksdW95zoolcUmBBmSffqiozJ3LHWl1q2E?=
	=?us-ascii?Q?eUmcOyGJpCXzxSSpmwG8dwyVeLeq/XMDp1/CQHtNIZ9GwKT4O6XgUOfpoKmk?=
	=?us-ascii?Q?n3rORMcuQGqW1WzA38DNE1IcyG56Im6h8FH1T4uqKe/MR5RkRABPdMtWzwKJ?=
	=?us-ascii?Q?BFXP82pszoW58E8WvhBIvUjgQ3hNwESE7evhevBClfQrAQumIBxWN16WkgCA?=
	=?us-ascii?Q?ej7bznBPq7wH2FckxIwH3IMvOnVTyotbsl05cGVKqRLYo3Ztb2uLMQG+HGzk?=
	=?us-ascii?Q?y4U47+Hs0TyqRiAhfM5MduGKwkVlPh2p+6xwHvkbD2iCfvRHeq7hBCNbz41F?=
	=?us-ascii?Q?pbWcMgbM2EyOaiMbaZNdcMB54P/XqQx0VhYAjXIcxMxXyd9C36ivsFQZFeAL?=
	=?us-ascii?Q?dthSNQ12/JDx1cPKpph62vGylerbGwhNbx0U+BbIys2lWHhPnWzditDWGuq2?=
	=?us-ascii?Q?vlwERIojDY2842Reuqoc0tIz/eDISCHIRfTXeBaeEwz4n3gLFbcEFY/9CCWa?=
	=?us-ascii?Q?eWLSAGwxzCcnRZMJAOLbC6EtjUA7hg3fAqEKn9yIdYBN83Z5dDw33IhQsgp7?=
	=?us-ascii?Q?+X5C0W5jVBdwQZHWyAkGvAydXKR3Yxq5kT2bv+gsc+9Qdyf2nCTCgDCi8tZ9?=
	=?us-ascii?Q?gbsCKn0E7PTENehM=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	5:tOoWZAQv0qYGu8byE1J+AIckQ+rAdphoRCnYQIaB7O6qZt76o9wG0wCs91WtkSGphAbioDVndQjQpJArPmG7u5jlsAly5QVUcoaVK/S1D2mBKWSdDvZAxeBxZkeD9PaEiZPqo6kfYtrkXiqXyKn4tA==;
	24:OHedWHNLWXscAxVWjuxqyD4d6UuYaRapgX4n5UsHmbzQymPWgSNUwETUN1sQelQiP6Mrqn6fkQntM7G33VVtzDkpRSf4v9zvgJZBHWoJl4M=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2016 09:54:38.1986 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1182
Subject: [poky][PATCH v2 6/7] gstreamer1.0-plugins-bad: Add detecting picture coding type when drain
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
X-List-Received-Date: Wed, 20 Jan 2016 09:54:40 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...rse-Need-detect-picture-coding-type-when-.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
new file mode 100755
index 0000000..81e5f28
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch
@@ -0,0 +1,47 @@
+From 71c688f09c86b2428f58757f42d9ae1ad26227a4 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 20 May 2015 15:15:08 +0800
+Subject: [PATCH 04/10] mpegvideoparse: Need detect picture coding type when
+ drain
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Need detect picture coding type when drain
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=749617]
+
+---
+ gst/videoparsers/gstmpegvideoparse.c | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/gst/videoparsers/gstmpegvideoparse.c b/gst/videoparsers/gstmpegvideoparse.c
+index 54ee13b..c70fa6d 100644
+--- a/gst/videoparsers/gstmpegvideoparse.c
++++ b/gst/videoparsers/gstmpegvideoparse.c
+@@ -717,6 +717,22 @@ need_more:
+   if (GST_BASE_PARSE_DRAINING (parse)) {
+     GST_LOG_OBJECT (mpvparse, "draining, accepting all data");
+     off = size;
++    /* decide picture codding type */
++    if (mpvparse->pic_offset >= 0 && mpvparse->pic_offset < off) {
++      GstMpegVideoPacket header;
++
++      header.data = map.data;
++      header.type = GST_MPEG_VIDEO_PACKET_PICTURE;
++      header.offset = mpvparse->pic_offset;
++      header.size = map.size - mpvparse->pic_offset;
++      if (gst_mpeg_video_packet_parse_picture_header (&header, &mpvparse->pichdr))
++        GST_LOG_OBJECT (mpvparse, "picture_coding_type %d (%s), ending"
++            "frame of size %d", mpvparse->pichdr.pic_type,
++            picture_type_name (mpvparse->pichdr.pic_type), off - 4);
++      else
++        GST_LOG_OBJECT (mpvparse, "Couldn't parse picture at offset %d",
++            mpvparse->pic_offset);
++    }
+     ret = TRUE;
+   } else {
+     GST_LOG_OBJECT (mpvparse, "need more data");
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index 507d048..4628018 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch \
             file://0002-mpegtsmux-Need-get-pid-when-create-streams.patch \
             file://0003-mpeg4videoparse-Need-detect-picture-coding-type-when.patch \
+            file://0004-mpegvideoparse-Need-detect-picture-coding-type-when-.patch \
 "
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
-- 
1.9.1


