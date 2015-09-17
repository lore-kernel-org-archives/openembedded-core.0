Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0109.outbound.protection.outlook.com [157.56.110.109])
	by mail.openembedded.org (Postfix) with ESMTP id 86C8477011
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:42:45 +0000 (UTC)
Received: from BLUPR03CA008.namprd03.prod.outlook.com (10.255.124.25) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.268.17; Thu, 17 Sep 2015 14:42:44 +0000
Received: from BN1AFFO11FD032.protection.gbl (10.255.124.4) by
	BLUPR03CA008.outlook.office365.com (10.255.124.25) with Microsoft SMTP
	Server (TLS) id 15.1.274.16 via Frontend Transport;
	Thu, 17 Sep 2015 14:42:43 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD032.mail.protection.outlook.com (10.58.52.186) with
	Microsoft SMTP Server (TLS) id 15.1.274.4 via Frontend Transport;
	Thu, 17 Sep 2015 14:42:42 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t8HEgdc9026780; Thu, 17 Sep 2015 07:42:40 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 22:42:18 +0800
Message-ID: <1442500938-13048-1-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD032;
	1:0snyJPc/ItotIOt8HPTnDy3knUXE+N/YLG/47b6X7sRHrGtS7EI5IIDf8QtrIPyL2Zn9F7Frcy9AvT8S9R6y091Kj3gPYuWsf+b5L4NbFTDgo2GCf+afep5mrti33hpFwatdAPcZzjY0wYwyimcp8+4aYfp7/kxS2ptM3hWvV3w9W4FGIeMY8W2lYO4GHhquklW33VyKQrUNIsWhopFuv6bpTU6DlaZ6SlrH7RtRNFSMhrjcF9oG4J1Rdgc5gSG8OEOzt8e/5DOOZRSgKFuc16IvWv52PQnt1Zd2fJDfCjc+z+s13qIBwggYK1+dFfJvg4B7dNkGg33kUiorUW/L5X2c2kgfK6wEVTMknSBblA8C3tk23Vi0nebbKega5dpURMrJz/cXBc0qupAYr0Xlbw==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(50466002)(107886002)(110136002)(5001960100002)(5001860100001)(6806004)(85426001)(62966003)(5003940100001)(189998001)(64706001)(15975445007)(104016003)(47776003)(19580395003)(46102003)(36756003)(92566002)(50226001)(50986999)(2351001)(48376002)(87936001)(5001830100001)(97736004)(77156002)(19580405001)(5007970100001)(106466001)(81156007)(68736005)(33646002)(575784001)(4001540100001)(229853001)(105606002)(86362001)(77096005)(450100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:JJSidfOtEJ9Ie936dDBdWYSw0YLbQ3MzVfl5PyqwgE8Rg1DPOYsSvp7LAPgjlVsjPK+2hD3nLc5Ri+z92ZQgCUvxnc/4lxdqiEUcVhzu0n4PNPHkyFp3Z7jw1huInY4bv6gsBva4AxXmyMdraDdRfjI6A2R8TX4CMcQLdQeR5w8=;
	3:JY3va6wc+77wQ5Xr7EvbMOuEoVu24RlHPWKPXL3XBYQVJBu/Mx0sTnFjmp+Wru1GPzjMdbbUDQSnmg4zwfnz4e1NJRfkyRs0MsynZ4Bigg0DEtl7aQSez2LNnULl9QNGKLh69L0Igyx2P3fshelAe+ydpFlZyLyZK0qqbEikLb6OQcUETju9TM2eefHu+dnBtBmFqHwwyR+P0YYFy8DS39tTVGCYfRfNIJH3kUqjUSk=;
	25:HFsjm80D4H+V0VuZIbTYuAglA8AGkxVyXr/L1F+YijvB2A0sbt5s/AOOsfPi6qhdU06N9RbfXhxi8yzeywkaLoNWcaaie8DLTBTNidAQC7VkPJKFoJIakrmdQP6S8xZRIMe+K1sBcHH7adTxj46T15spXbOqf19JVJVkdl9hLtsUh3pTYfZP3q7dhvbYBBKkCCoYjV56evgoIPer3JwjNhEoYMqXInh36bDMVYbXQ9uyshOmSqt+lVAN28FgK1zj
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:3KTam0+WxZRfsgoIjw/CgaoAoJ2wNwCnksmEbnBW2MRleqKVw7PtVQXE5tD2X273yGDiCkVeTSgxPrf171gha6lM73n/zj6BMU7Lb0wGZ/D/zrW0GdaHYMwFPvud7oF700TEgy5+tYLurrI+ifQU7Pwac4hIINLuVJLjVQbQAVjorRLnu/pN5yq8Pd/FVUXey3Q9tGbfL7ll0KxzPwFcbVHzYi9WX9jq1O9nNdNfZzijPDita6WlUhGWKnohOx6+6z5b91G+zxdOBxGcqzqALl0d78K194i0qhjY1iIbMH1Kpu7aVbFTxRChiXQpJFNi75fHfpnnUAgGjGBYP51ND9ALzmMMO3/TWbtg3XvDheE=;
	4:b3PE41QqPtnyRMixj1d8GPddYqC82ZDjhskLNNH6IUcJoOoS5oG/lkjtLPySdUj4PuI/fm5kjriuHGWSIHKdI/TcbMLZzU8Ax5fR0kot/yJvQD8+81o7gpf8lPugHBFAonxs+uEmJ+HcH/fXyJO/cOU9zDrgclPShAkf3XPX/BeN82mNijkm71Mpt4KLEM2Uokckv/Grqo46WUbbz2TFGiSH4ufsCZMvNfFHpOgjmhxZK9aIlVugJmNeDOl7rXrF1XnQQlLnX4TrDwAgJwOS4m6oow/z8Xl9K+Cz7nmbtDqbA0LLo1IbBZUDnnfKMvFoZUyoD42/T6n8dVRa5t5zj6IRhmjwkbuobMV7nktrLw0=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11718AEF944898FC69C4BEFD865A0@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(520078)(520075)(3002001);
	SRVR:BN3PR0301MB1171; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 07025866F6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:xnMNjZNqMTZxUYLvp6e0DCzsQaBVjtUPb0AkA0Z?=
	=?us-ascii?Q?G/+8qF2JHqmZ8BM+i++8k+TWy3pVRWFAY1oljbRa7oEiUA4C2PMTp0DoUZr2?=
	=?us-ascii?Q?7ck09/6v55yF3UiI44RFq7NGC2o0ZHYZyrc3Vta9iJMpj+ymx6b6VUiS+OFp?=
	=?us-ascii?Q?pgJnYkq50MSaV2DRiu1z4gKAHWMFE3EHbjRNWZTXSJ/iIHTeS6ypvKbCeIMm?=
	=?us-ascii?Q?W64xKYp3POAkXC1F34ML4eAnPz8k3vVykERVTEzipt3M44dJVispRZyBAd4z?=
	=?us-ascii?Q?rUmgJPgs/eQeU31x7gfdrPqNeJZNT3bOqJg7xveEVbtixGxINsC7VOBCXp2k?=
	=?us-ascii?Q?8OaLxO8SVRSnBKe6pbJ9OV9hyHSo+YZVSZA9AFJ5hNma0XWloBTGylVJJ1rG?=
	=?us-ascii?Q?8Pb3+2Mu7/GNRvYLfnV0O9N02VZiyh+2fq7axuILreEYA5QuFjpRQ1VoV2tY?=
	=?us-ascii?Q?UNrw47IevpnWyj6euQch/d95BTfD5FXn+xy9NbfB5kwtCrS/pE0G4e6TCktV?=
	=?us-ascii?Q?ABrqTRZuICe1wevwLB1buxhjUQd1Damwi6eycmPYnSc3SCOW3XzYRjHsaEfz?=
	=?us-ascii?Q?58Z1tkdJpdbmHwKaSsNMlGnhzEvQKzGC9DKbi4W1gByaFB987y7GiGOLXnJ7?=
	=?us-ascii?Q?ueR+wydqr/xVSsPpGeUGiuOwcgRfzFad3wOS9G3joB2dVJs22+9RzwWR3Hha?=
	=?us-ascii?Q?okyRLb6ytzkx3wn6I6gd+nlgV7H2rkNzlinlV7NL33rGSlP/eXKhIGOdaZGE?=
	=?us-ascii?Q?F5nDbL9YujAEaLXAEfdgm2YzuNKv5M61P4zbfw0YVcZbv+Y6gVzuXMwi4RSo?=
	=?us-ascii?Q?n/FpNvRWWiK2XOilFQI3DW933sWDszr+TLy9qEp0JiNZAfvlj2s1NWKF01Ii?=
	=?us-ascii?Q?Xov0huXVomaqiuB9mjNnMV2d0EdC9tWAw2EjZNRugrCF/+QTB3Q4w/Z3gfNv?=
	=?us-ascii?Q?VQu1Ll0Pyr/UZvZ6T/R6irpJ9fnvc8gIhxsTpF30t3FBGOC1JzvKk94px2KX?=
	=?us-ascii?Q?i5I8ZpVQd0H97PyUpPYSOvKPuMqCU4DRRCP7/ZM+EZZ77EQf0BDUvawgnkR9?=
	=?us-ascii?Q?jIUGEOa96T/glUWjbhdfXNj1QQkcAOkIM38EkCQRKuWDvfKWt0TEuTwUef2r?=
	=?us-ascii?Q?zVRLdJQPh5/mDgbQ+o/Osxh7lkQqFEhk93SMmiuZCxZsA45dxJUYSyeEPcoK?=
	=?us-ascii?Q?YLOox0lO1dDWX7GkbjOXOvNbL9EvWD9KL7KI7Y2LiLuejsskLjp6x4eCeFsv?=
	=?us-ascii?Q?OaourlGzg8R7w43DVA97Ch4e9rIFf2q6cZ/GLyHpV?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:7SenAp+s5Qq4l3E9q6ebyfKf+xaJn5d1fUH72wMBDqzapvr8bhBv8n6PnjW0CODbR4aJXZCdxqHvF3pfw2Aq9U8kHRgSSbEPY8MfM4sRNsW/E0ZCtGxi+pB00KN1bsTjpBM/oAxAoTS2TZViU5U3uA==;
	24:5oVhqL+KtKa/KmoNzjeff633AWEZ4zI2F/dmAb904+Adlh30OQTsN1NS2wK1Bqd3S6F8SuofSjTtB7P5MJuNWq0IItETUAJFS/I1Y0rOuRY=;
	20:OJkWXHNXfg1PgGWhsDFYuydyP/MurmMGxUR0ps3bBVTcJzeaTGN7fffwePJjRPk0wSe6q8b3H+C4ITA4IpYx3A==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2015 14:42:42.7668 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH] gstreamer1.0: Fix basesink drop buffer error
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
X-List-Received-Date: Thu, 17 Sep 2015 14:42:47 -0000
Content-Type: text/plain

Basesink: Shouldn't drop buffer when sync=false

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ink-Shouldn-t-drop-buffer-when-sync-false.patch | 30 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
new file mode 100755
index 0000000..d682ee6
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch
@@ -0,0 +1,30 @@
+From 73df2b5c0aea58015788f5a94a3ec65296a688d3 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Thu, 2 Jul 2015 14:32:21 +0800
+Subject: [PATCH] basesink: Shouldn't drop buffer when sync=false
+
+Shouldn't drop buffer when sync=false
+
+Upstream-Status: Accepted
+
+https://bugzilla.gnome.org/show_bug.cgi?id=751819
+---
+ libs/gst/base/gstbasesink.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/gst/base/gstbasesink.c b/libs/gst/base/gstbasesink.c
+index d44e8fc..cd759ac 100644
+--- a/libs/gst/base/gstbasesink.c
++++ b/libs/gst/base/gstbasesink.c
+@@ -3423,7 +3423,7 @@ gst_base_sink_chain_unlocked (GstBaseSink * basesink, GstPad * pad,
+     if (G_UNLIKELY (stepped))
+       goto dropped;
+ 
+-    if (syncable && do_sync) {
++    if (syncable && do_sync && gst_base_sink_get_sync (basesink)) {
+       GstClock *clock;
+ 
+       GST_OBJECT_LOCK (basesink);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index db58754..73a4a99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
     file://inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch \
     file://0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch \
+    file://0003-basesink-Shouldn-t-drop-buffer-when-sync-false.patch \
 "
 SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
 SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-- 
1.9.1


