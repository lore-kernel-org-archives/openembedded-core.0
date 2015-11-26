Return-Path: <bhuvanchandra.dv@toradex.com>
X-Greylist: delayed 1286 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Nov 2015 09:13:17 UTC
Received: from emea01-db3-obe.outbound.protection.outlook.com
	(mail-db3on0114.outbound.protection.outlook.com [157.55.234.114])
	by mail.openembedded.org (Postfix) with ESMTP id DF73F6011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 09:13:17 +0000 (UTC)
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=bhuvanchandra.dv@toradex.com; 
Received: from linuxdev-in.toradex.int (115.115.225.206) by
	DB3PR05MB265.eurprd05.prod.outlook.com (10.141.4.21) with Microsoft
	SMTP Server (TLS) id 15.1.331.20; Thu, 26 Nov 2015 09:13:13 +0000
From: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Nov 2015 14:42:35 +0530
Message-ID: <1448529155-14970-1-git-send-email-bhuvanchandra.dv@toradex.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [115.115.225.206]
X-ClientProxiedBy: MA1PR01CA0056.INDPRD01.PROD.OUTLOOK.COM (25.164.116.156) To
	DB3PR05MB265.eurprd05.prod.outlook.com (10.141.4.21)
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB265;
	2:M3GHdUfzqYszGCcGY1RLl/3kARjrG0hEgglw0rsBPrQ70i1/Rs0bp5rPSql+MOfJgPbv5nIDPdKashODNtA1Z56SZ50IMhgkmUCrS8D/9YFJ/GXpEO4+KeSzt5Fjh1AUzs85tuRm9Cu9ZLrDnhSjWg==;
	3:SGwhKiXr67/t6ze8AMRsyeFIoBWMsrNWioIkYsSXIOtoWytrm2hd4WmYilTfdO7t/HUvEMET3DENgJW3659UoqftunBgrx6k+P2N5NY7+lpUzPzMKBKU0llCuqXilGQT;
	25:cXe3GxMOkaecN7GwO+sj48jxgPUyQFf6NxQL7bzpC2QOm+mgdt61Ee3zuAHbuVkQBnx/3H5/9L0+slFP8EEIN+Wec2p0GHy2nzB6xCb2ZpeVLvTpKKSUps3VJG/+EKH8Ky5gG+JuJo1vO2Ys4p1hXka7N+2VAi8WEaOOxj3LAY6fHckIVRsWAS4536Cy4QuUBXiJ6Nyub/Iyl2KTJzEQt7a86NE07uV8MH7VNBDafcPLPTCd4dCgkya0W6ZAB0qWcLIU2rvoACO3aUm57RnbCQ==;
	20:7ft8tB3sGEGPeOtE/YU9Hu6h2V1PcFtw7UvWv0fj98KJM3wUkL0b0tWsgG9rnfuhHKPHVmxZwbrHBDMveWhdJLIzjqK4l26PVIcaY7zsogHiOAyeYs2GFuIt7JFaE+505otNoNMF8aAZ2lFXUZ9w6NG0NWhBuSVYIMIGy+svRVXglLw8qsuR6WH2PHS0HC6DYXP5f1ulF0oI+8SEQqIHAJ5N6gB7dluDB5+GDWBH1YLc70Zrtx5l3JXjkQmrUHAYucRWLRn5Cpad0fYQ2S2IqApYypSThJ7aGvUHk3NwIx9fkb+w3BZ8dgxGbFVDzPHdMuWK1KHdH7QvWJ1SQ3Qifg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DB3PR05MB265;
X-Microsoft-Antispam-PRVS: <DB3PR05MB2650A80E9C572DA678CEC4B8D040@DB3PR05MB265.eurprd05.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(90676262408878);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(10201501046)(3002001);
	SRVR:DB3PR05MB265; BCL:0; PCL:0; RULEID:; SRVR:DB3PR05MB265; 
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB265;
	4:lEDEHqOBPeGBOAscba7rXxFRtu1n2Qa4rSMF3CQb4eZNkBiRT+VY5cy6QROtgCrWLEaAdRsn6lubWZL1tBB15lISNrFlf9AwzWEBQDPkDrPz+rM5mjjV2nBymuBsjAybeqpQqI7rri4QyuyyU1iKjm4JxPU1RHKnoXIQHY19CoxjqcB5jlB47hKvEvp8GUcFM4yt7Xsl+XSjEo0QT3ElpyRi/Ypp6Ti9vJkbM4Vi2vv6zj933ltpeey3HfAQBj+vyvO1Kc6Fzg3kBh4djUhnmwL/VGqsqU1SqRFx6ikLD+6z62PvURNBkc4kDvcuVKaXAsBNypRywU91/hp+nJ8R0EHBA7w09kDqRgtwscqskdoNrBxbz+26CQIc+1I/B1dcsoS8pXE7RDLXROplXPcWPv1jaL/30umx/l8sB9j9RJPBUnUduAmd4osHyHTu/xun
X-Forefront-PRVS: 0772E5DAD5
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(101416001)(586003)(5003940100001)(66066001)(47776003)(50986999)(97736004)(229853001)(81156007)(69596002)(19580395003)(19580405001)(189998001)(5004730100002)(2351001)(122386002)(77096005)(110136002)(4001430100002)(5001960100002)(3846002)(107886002)(87976001)(36756003)(50466002)(106356001)(6116002)(1096002)(48376002)(105586002)(40100003)(33646002)(86362001)(50226001)(5008740100001)(42186005)(92566002)(53416004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR05MB265;
	H:linuxdev-in.toradex.int; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: toradex.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DB3PR05MB265;
	23:abndBR1SjEx7ihC87DkOpDZM07mUE5BpDF/QKDYzE0?=
	=?us-ascii?Q?V2r7U9PVyRHscTi5FaWJmM7Nm6UXCzlwAv8VQP6acU518Hr6cG+XQsyYG3PQ?=
	=?us-ascii?Q?tc2dXouAHcgKbv+uhPN/cILqkwynxTSP82Us9kF6szPd6A6HRuTDI3HD9pNt?=
	=?us-ascii?Q?ZKLEh2fWJbtOzEY/KuPgoQ9p2o01rcwdjgfCsdzVUS2i7BuV5X9fT1K41pxq?=
	=?us-ascii?Q?EiWBrpxsZW1PQTYVXLwdFiBJbYo8F3mYDqpfQRbjgXs7Dd9nuMqJCDW1PGCJ?=
	=?us-ascii?Q?SmbDRJfF8feea01hEjLuIj1P0Quqz8c2iaktsU2yfjBhJplbTA8pT73Qd2Kl?=
	=?us-ascii?Q?Jq0rEepO1Jb6J/S/1UVRPmfgE3AmIW0kaNKXNQ2I9SlN/9Ng1zDtBeooeyRD?=
	=?us-ascii?Q?nWc5qqxnbXzGdijBROD1HdZjNO/rl91rNS7zCW1B0vOc6kiMlGMew3PnULnw?=
	=?us-ascii?Q?fvIlUGVZVHc2rUCBhP2WMgRcx+qTdCtzGUu46Sd+3JhCC/rmpaMY98R6jFAR?=
	=?us-ascii?Q?UOOAPMeclrUKP3vh5WCZWJ2XcEMiAqvSK7UXsHc+whCTmsG0nteEiDNQrCLx?=
	=?us-ascii?Q?mu/ev28+l+RDjAV/gSiaBi8cpgcMiyhDzYQ3PSu+mTFOic6D4j0doSSRDq6I?=
	=?us-ascii?Q?b7rfYGrOuM47KTPW5/OHqm9RP+w0QJRj2uaI40XuyxDyag3GhfhCmbpr7hTS?=
	=?us-ascii?Q?I/xyXZJ/vNOh3+/iXkIvM5dEJywTztjXFlV4bs4uoXKQGJiT6gMpW+ail14x?=
	=?us-ascii?Q?xGSSAjvHTA9qm5tcrSsGmCWe6za60ed39c2POWaqXL7qzbIeEFsHfIdXLHIz?=
	=?us-ascii?Q?fmCwd4JTyPMnNNRZLTjEMuICgZpbAIGqZ9jCAmwozzxD+OxfKxK1c9lVntGn?=
	=?us-ascii?Q?tYPC+hrtSk+B431+HDprMnML3xzKy7eOjviVN2g3Lk+nGyr0BtosbCBkw3Js?=
	=?us-ascii?Q?LvHUniRWa1p1zI1Ya4VO8SGhQAxrdFuW0QFJIwUrPtDEFws4wXuR02A/g/F1?=
	=?us-ascii?Q?HTy0QtYzkI8w1NMi40lTV2o6ZIGhIew3dcqvlW8Xv7RRU4pgBdRO8OW1qxQh?=
	=?us-ascii?Q?MzZ6nKpaHxdBA4CjYM2zCqFikrG9I8DQReIh+RuUxAeXlQ+Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DB3PR05MB265;
	5:9TBGnYph1LkSCRM5v5X57UdGFZ22h0C4/ewEwcnnnVC8xyx+XMSvBDQ7BQVH9/94gMDSxVOjn7yjdWzAE1pDCAzmF1zfUQpTfg0uBgzLoi+aMjElGvZAtCWNleIdpMpcg1kLReihzxnc688nOMxDNA==;
	24:DATlQBh5QTP7FIaDWzZvXqToVbHYv+e1NN0VaKyTv+uOg2Wn9/1b96PW7xpy34Z6GzpnukS2SERzCChu9ssSBP8WsffE+/rhi/yUHpiEPdg=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2015 09:13:13.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR05MB265
Subject: [PATCH] linux-firmware: rtl8192cx: Add latest available firmware
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
X-List-Received-Date: Thu, 26 Nov 2015 09:13:18 -0000
Content-Type: text/plain

Add latest available firmware binaries for RTL8192CX chipsets.
These new firmwares have been released in 2012, have been used
by the mainline kernel as preferred firmware since 3.13 and
even backported to stable branches.

Signed-off-by: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 615fbdb..3c5729d 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -260,10 +260,10 @@ FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
 "
 FILES_${PN}-rtl8192cu = " \
-  /lib/firmware/rtlwifi/rtl8192cufw.bin \
+  /lib/firmware/rtlwifi/rtl8192cufw*.bin \
 "
 FILES_${PN}-rtl8192ce = " \
-  /lib/firmware/rtlwifi/rtl8192cfw.bin \
+  /lib/firmware/rtlwifi/rtl8192cfw*.bin \
 "
 FILES_${PN}-rtl8192su = " \
   /lib/firmware/rtlwifi/rtl8712u.bin \
-- 
2.6.2


