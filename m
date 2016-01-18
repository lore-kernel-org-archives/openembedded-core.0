Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0140.outbound.protection.outlook.com [65.55.169.140])
	by mail.openembedded.org (Postfix) with ESMTP id CD1D873175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 09:50:24 +0000 (UTC)
Received: from BN3PR0301CA0081.namprd03.prod.outlook.com (10.160.152.177) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.365.19; Mon, 18 Jan 2016 09:35:34 +0000
Received: from BL2FFO11OLC006.protection.gbl (2a01:111:f400:7c09::197) by
	BN3PR0301CA0081.outlook.office365.com (2a01:111:e400:401e::49) with
	Microsoft SMTP Server (TLS) id 15.1.365.19 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:34 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC006.mail.protection.outlook.com (10.173.160.95) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 09:35:32 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	u0I9ZROW015522; Mon, 18 Jan 2016 02:35:30 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 17:32:50 +0800
Message-ID: <1453109582-25485-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453109582-25485-1-git-send-email-b54851@freescale.com>
References: <1453109582-25485-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC006;
	1:NYMtMmTr1dFcn+GIXwieeKZVPpxvtnEq8Aa4WuU2Dtu21NYsnbeT18OO18vwg6jcJhctJuZYuqBdCmKuAr4vRKu1NCgPpzqKkSvjYSgS8gxV0HluMwK5KZG91EmbET0wrUnMsyLpNb0299yKUKS/rts+iCgQRJIQjGCYvZNcmdSA+V2yJCbLxnY6HCOh2EooWXvA8GyTbR3Ay9hfTbZyU9pIr1vYZOwpXGdlPmCXJEMVJXx2p0+11TeiJqhttdDu+kkR6zoq4vr+KYIVosr+cmmwspJn8Y2WAkr0IeP/uUPFw5MoflNndfyHtVLx/NuhdontnExFPHCMF6dB0Y1kX7XsT9uS7YsdQ/cmyQKh0x4GiOZqne8q/3+0Lfm8NfCqGuzV2xUuI1mEEFiEzgDOnnU5novgzjtrLAneAk6t0sA=
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(199003)(189002)(33646002)(87936001)(50986999)(586003)(48376002)(15975445007)(1220700001)(5003940100001)(81156007)(97736004)(2950100001)(50466002)(5001960100002)(50226001)(107886002)(19580395003)(19580405001)(189998001)(1096002)(110136002)(11100500001)(2906002)(92566002)(4326007)(6806005)(86362001)(47776003)(76176999)(104016004)(36756003)(106466001)(5008740100001)(450100001)(4001430100002)(2351001)(85326001)(575784001)(77096005)(229853001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 92a2d882-a2a5-49bc-5326-08d31feab686
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:RKqO6da+U8m6M67O1j+Y4wu+zD+ztsv38fPPs08UM1GacQ0gM977zTjfT6g86Z5pmhc1ZyNZ2+tFl8X4MnALOsZXdnKU4z/JNAHrhVWzGRezt4wVtkNe01udJAcqEROOO1XzJeRlyJ105v5AeCIzmMFLOluSoo2P/Lj8NZ5RfOVvEnjMT5SAhR7QPcg7iKhG;
	3:7UOmWE4fu3siql5LLDyK7QRsQBOkOzP//aruHada0BDk6o1gbi/URysmADuuDw5wLhvS/56ORfd7UeQNktVVhUBhUnWuKkEAudasgM79CIp5XsQDSK0N0kkX6uvvhCqHWRRE7ltlsHUzB+kd6wDETEohFFQIAbEiMTGBQxOkCgH8t8KLg7NI7LyOf6G6cVz5uKFyz7PW208Bt1oNr8k+Z1QTi4KlsYJiFc3ic5+cbMM=;
	25:zvp/yIdibxVHLnmF28Nw5Jqli4bZpYy510Khu9bx5r+rfoPVGd6yjAm7kaT1FVaR5o0RnLi7m0V6s01nbB3dTjCgYAG1ceIkffpHb1P83OFzFHYsJ8A7hqJ3mi5btpXEVCKcwX8atNJtR53kYvBP33y1zlfe1nESkc/fzSAe+n3Y127lHaZub6ihdv9lLmSSKTutMn28w5BiVC6/AJG78yddbglG05f4KKOPrl12+S8L7PUN3Ze1S6kPbs82a+JQ
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1181; UriScan:(101931422205132); 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:gq2U1mUwihefB3o/Ji3XXlDb7rTuBhvBe6/XTF6jEAfjNfcg48UNw0cENVJsexdSGTDjeYjYaMw9g1pnxzbfElv5MamxWkMuJdJFuFSDlj1C5QP4hLe/gLvR7jp6BNzP9iushSp6cKbwWqxBFx0kvyWvG6aYROtUhkUNFPA1Y/e2MRSdCKoi7myy3euLaiOBlqafgPdwMX0erL5AXCfJPGWGa3m7mg9K6gqw4qaQANhsKPmVPfdEu9YPFM7R3fVqWN5sUP6rIEhOHBmgIFse5h3WrYtRLAlaZRnIHHAzgbROf+AqLUMSkU/5YyU1Fjoy1EibPue7KgM7aDv4+iKB5myWHlakYwO6YIVksynGm2xC4yhdWEGYChhynT8RUdlgnCTgyRPHW/q0wfW2q+qMnWfsPAzMqbYuVKN1SWVSgsqYAFliBbqL/1s8Z9vlk/vm;
	4:4BWOVfVTNUFplzglL5mMRmuCrbR1TqxBDELM1Y+xm6nkNye+i/nsLUzuIpsgkol491eLHSedywHiGZuGUno27fGi5jZDNJM2GDx28oXoyGhpQQdE2jqpfKOHq3OjvPQqyc770D6JKWyKrxTEoImq4TvI3i73geULvEGjSrzm0fbueOu3L4T4nj8B+mZ7wTjXJpxpxuY0lSojmONyEayBB6oRqSe64H7ZbNTOGADf0Ri8qU8dXCZXkiLnV9PoqCAak9jKtbY+QDHlhnzSwq87cujO2Io3ZvRymOsJ8mRVBkqjdpccLh1v4F7sfZLFKhgpc+wnSq2IEXHyW2h1KgQMlypJG9UUE1Mu7RrLDC2JLfwl7DYVkfKBpa+2T1vlQiL5AyFN2LOZZz7UKxvxc2o7hLK6iSVuBWkJ+SAz8K4Ye5gdUNg2+a7pza3lG95URMo5e0lN61KWoNkpbjVgtwd8bM0ZTsilF6iFn4kFA9gCnklTtg3X9sN9/gUYvBYO7fsy
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11816B41464E90BC61E856D986C00@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(13018025)(13023023)(8121501046)(13017025)(13015025)(520078)(10201501046)(3002001);
	SRVR:DM2PR0301MB1181; BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 08252193F3
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:9zuYMnTZNt82oIhTI32jxo4+HqaDo/Jv1r8ZFCX?=
	=?us-ascii?Q?i/GU4eTUPswE8V/v9RXuoPSJycIFRxZHD/VwW0QpPvie4uJEI5rENKSuG5qn?=
	=?us-ascii?Q?G2NMDxj6wdDmH40SjI2voBU+51VwGYaOqCcup274E3QBSZ6O3+JecMcWmUVX?=
	=?us-ascii?Q?VF6xU1OaiHfWa+2Lsk99sMPwsR7F0qWrYFS9by29Nm79sf32ZDq/pKUJAO8I?=
	=?us-ascii?Q?uesFaDhMLvNBIFlhBD24mkLbD25EX3woHwW0I2nxVIL33YNgetqBsARPS/vK?=
	=?us-ascii?Q?/WE6HXu6B0CzV0GkSfp8aiVt1Q1ht/H0DLCu7x4Tz7LeCSZZeolhZaplVU5C?=
	=?us-ascii?Q?fXykuRAq1PR1HVkts2W+T0jxVZgXpKUKQlTTlsdu3F4gJs6BvXmXqwoBlQMi?=
	=?us-ascii?Q?eC9n4hwyueEhWO/+OYO5N6Mxj7g2nm3LyKwQTfSajveJxNu9WRcsNwAwH8EZ?=
	=?us-ascii?Q?Cm0f1x1FlMfWFvG4EjhArYC0HXGtQIZeKKmCczPAJK6YMISTs3Dh8GODPQZz?=
	=?us-ascii?Q?ikeHt6wpwUn/3Wjmgb6V8Rm0pwwNIcyxHUDczNqod250KpibG2I7z9BRFBHS?=
	=?us-ascii?Q?lKO8yV0tUjBNbTwzPHquKTrHXSohXcD3NonnOrk7d3FfgKtuQzdcexzq8prU?=
	=?us-ascii?Q?k+aT5hv3JsOiF35ZChjOKo4jp0HpnlvDuge9m9sc26trPRBwMCHabeyMPMzK?=
	=?us-ascii?Q?ZM2lIl4WI/KuRwzpZQEQpVsUt0NkMAcXS+5IXX8Ujx2STzcRsaoORQPoAV1c?=
	=?us-ascii?Q?O52zmtXZqptkTaibz/U1535RTsUfujQ4OYJuxix8FB9pCBerhzgMqJptnLSQ?=
	=?us-ascii?Q?25TB0mJx30pPrxyqzRUOVNxybEas4DEA3A4tyHLdUNfdwEdWwDAimaJWvsLU?=
	=?us-ascii?Q?nuRwrFRKVFGH6slgG8ETsT3l8DXpBaItb4M12xAsPHDMxFbnVniar6REG6fF?=
	=?us-ascii?Q?VippKlk5LW809md7eXx5/7rcED1qJ2L3yfs+HKTeI4HbA80GZ3UCGhv/YPjm?=
	=?us-ascii?Q?tuqqE45H/JVpT8oopg3H4pNdHqiGMg9g8MM6fxRqEuEZfXv5iZW4SjUfxGt0?=
	=?us-ascii?Q?pAxdeoiLBYc5aGm3anlcc3Mbg0fsgnpf5PhzzAGrrZWaxQ8mbvYbNZI16aYE?=
	=?us-ascii?Q?i05u1otevxD4I+iWYOYvEqzGBrgaj/uRQnDfA4qko2En7tnTtopddQg=3D?=
	=?us-ascii?Q?=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:vaEWbBJUuBY04OQm+1Zvt3kW2vsn/Cik2mXudvPphYpvVOsmxUBfaZS1sLsfmyM1dzCDpYDVBWkimxHyOViYKGLOtNzAQgvCcD/tzVCrd4fN1HYqOrghOrAmSb7TGIUH8XlvwjldyhHL+BtFokiSdA==;
	24:lu56Kdoh7wWF3iiE2I3GavqhJdS0KFTtorOa8OTEbmEcxa3pLvu2AQ9Z/BRD4lHiSA/sg+bFFJDDxg1ifYI8jxqVFa++2h4BY1S55fnYJzo=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 09:35:32.6012 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
Subject: [poky][PATCH 01/13] gstreamer1.0: [baseparse] unset FLAG_DISCONT when push to adapter
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
X-List-Received-Date: Mon, 18 Jan 2016 09:50:28 -0000
Content-Type: text/plain

Since DISCONT flag will be handled by priv->discont flag,
there is no need to copy DISCONT flag to adapter.
Otherwise, the DISCONT flag will always be set on each frame
for the first chain in buffer.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...e-unset-FLAG_DISCONT-when-push-to-adapter.patch | 34 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.6.2.bb                |  1 +
 2 files changed, 35 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch
new file mode 100755
index 0000000..a4e9909
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch
@@ -0,0 +1,34 @@
+From 90254a34f57278930bbcb3bd80cfef607157b03f Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Wed, 4 Nov 2015 18:16:52 +0800
+Subject: [PATCH] [baseparse] unset FLAG_DISCONT when push to adapter
+
+Since DISCONT flag will be handled by priv->discont flag.
+There is no need to copy DISCONT flag to adapter.
+Otherwise, the DISCONT flag will alwasys been set on each frame,
+for the first chain in buffer.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=757575
+
+Upstream-Status: Pending
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ libs/gst/base/gstbaseparse.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
+index 51d159d..184fafe 100644
+--- a/libs/gst/base/gstbaseparse.c
++++ b/libs/gst/base/gstbaseparse.c
+@@ -3026,6 +3026,7 @@ gst_base_parse_chain (GstPad * pad, GstObject * parent, GstBuffer * buffer)
+         parse->priv->discont = TRUE;
+       }
+     }
++    GST_BUFFER_FLAG_UNSET(buffer, GST_BUFFER_FLAG_DISCONT);
+     gst_adapter_push (parse->priv->adapter, buffer);
+   }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
index ba46c77..ef1e88c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.6.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
+    file://0002-baseparse-unset-FLAG_DISCONT-when-push-to-adapter.patch \
 "
 SRC_URI[md5sum] = "5e610b5a94c209487310739b39b6c464"
 SRC_URI[sha256sum] = "5896716bd8e089dba452932a2eff2bb6f6c9d58ff64a96635d157f1ffaf8feb2"
-- 
1.9.1


