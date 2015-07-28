Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0131.outbound.protection.outlook.com [65.55.169.131])
	by mail.openembedded.org (Postfix) with ESMTP id AF6B6763AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:43 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB0701.namprd03.prod.outlook.com (10.160.96.27) with Microsoft
	SMTP Server (TLS) id 15.1.213.14; Tue, 28 Jul 2015 09:58:43 +0000
Received: from BY2PR03CA051.namprd03.prod.outlook.com (10.141.249.24) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 09:58:41 +0000
Received: from BL2FFO11FD049.protection.gbl (2a01:111:f400:7c09::133) by
	BY2PR03CA051.outlook.office365.com (2a01:111:e400:2c5d::24) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:35 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD049.mail.protection.outlook.com (10.173.161.211) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:34 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPej017590; Tue, 28 Jul 2015 02:58:32 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:08 +0800
Message-ID: <1438106291-14986-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD049;
	1:8GEd3cc3tPgwI/ab/Q+l3uEOIV9t9PKq9hQ5gAolwzhRVuUdCYElwFcvkHKrgqd54yIs4sM2H4m2D4lv4T52sBhqd+t47uF+uim1PSvANpMcrm0yA5ewuHaYou8HxYwybmSVuNVYh0iSqfM387vY6qmuJXcMdvPK6IqJi2aMrMmxmAAgF+Vf+UhcqLv5kfaG86as4n7LNdp2Y/0SJdHakH2M5GsdCTDMDvtJcBB1q3mKHSZBSyKJDBlKdgMN8pQt3zAbCyqaiLvZtPb321B97pdAP85XkA96/rlLNjYBCJyrXFTVEJPEw5EU1D2orD5gPGL1jUhJFSdMfk/jH08Q8Q==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(2950100001)(110136002)(15975445007)(189998001)(77096005)(76176999)(107886002)(36756003)(230783001)(50986999)(106466001)(86362001)(575784001)(47776003)(19580405001)(104016003)(46102003)(6806004)(33646002)(19580395003)(92566002)(50226001)(87936001)(48376002)(5001960100002)(229853001)(85426001)(62966003)(77156002)(2351001)(50466002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:Jc7Qza86/UPvH9YHRAsVPGiFKqs9BIuNUFSnj0WHfsvxnO3AwPw9LfLTa9kSHyCuWxQpDh2GpukAoeAhwHoUPqdBhlZuvuFh2LNOS/9sKhDBB99vwUJBMdocFBEledqJVY+pn6pN8DCB2dhNbfkH42GDtPWNT/F1TN+yms4AFQA=;
	3:R6X7Swhp0gV+pBt+uEh/l2f8nkNASFT8Q8UEgvm9md39BYEgxLHpawrSQG6aXNFGPrj9b0IV4WlDxR+uNJb+pktd2PkIDWFVWhsjT6M9KHi7Pd1MuLOOTaU16S9a39FFDfvK4ZvIBlTuj8ZYoMBZQxytKlJT8NAZeevw9XezwBTdCbK3ZrMtM8BMOgdDeZZ4yAKtZdtpRtVfwUhL1L6J/T5lnxRR+xKxJG1V2XWsgIg=;
	25:62DStT4gA55/rE8jti5t4esDZcFWvZjCiD/8wgMo0ckOXCm+IM9MUUUP66HsUNBMnLfvlxjBAzalKqsKC/0+oJc8wMWmJVn5cuAHcyoh7CPg3fCREicu9U1eMDMBGu/2hyTCfcOaPQUrb/7Xk50KXFcx86md0PChJ+r2eIOKfOZQ4j8S1HygqZHRSgVhHNmcX6mVJ8GXhuqEYSYsChwNSS6au/wP9E2MFeBZ63xT17ZNvwZMqlCKpLD1F6h+y3qnm1wBTygFymE634iECyU4IQ==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0701; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:VEDwDPM4pP+2Z4pxOWDPKTqSWVCS8cqvle3qbIKKGN/XUcJv+AOlauAa2W1utyp5fCgWGyFUAGXiV7E459dmGx6raX9/sR4/SL+N8KtnUjeUveV1EO9MwlnlWaOInCI2ecVcmzGfngZKEmQYKJV/+T8cq7H8dgHXgEw0jmnLtncb2xZJzxHkhbQmQoCtc5FZiv+5setA+9qnlwI2Zy1cEsWJbAvxCWtrbOMRTH6LA8TgPLKoZRPQWG5SF0rzpSlGY1DhaqXZ53bwzE/e7QxfN4QO4iHFbfsudfz8tUq3cjVBQQPQK0hs3hyicu57LDup4k9RnA4UkUXcat2bjaXZm7InTF4GOhYqhhu6Kq5GvZg=;
	4:YTjHzO1dVjnMsDNgkDCiSpvZqPtNJ+F8WwySktpysJ2fp5cN6DJsbpZCAXsJt5P+dDRDbJm1iWE01iHahj4TfM7bFkXn/d/dv+Y1+Ih3uUSv+q8SNMU7qLdXYr6TcHzLBdxvHVgWgrG+g6MvE2AtqTiVg5VsERoBny8QqE6Ye22wF0qml0Rln4sdJP7+ibPzKG3QTx093XLg59wDLBGuBWS6pHPSbPqCDydT8mIntItMmK4NIwTsRjXpUALzImJ7u+HPr0RbjcRXiRleMdzSoKDQgrIWN1M1jv4AjxTQSRs=
DM2PR0301MB1183: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1183108308B026DC46F10333868D0@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:pooymupzc6liTHaNoFD1WZpJIc42BfEX0gYuIA8?=
	=?us-ascii?Q?u5UHzW2s28GhxyDt6cpcoDf6t4UNsIbxnKvh1h9HHX5XMYFy8PbZuMwLPV2n?=
	=?us-ascii?Q?vqeNoOjYO4+tYSAID7v3Yoe4wzbihH4RJzk9sWx9steIgrJ2/GH724fy7hNn?=
	=?us-ascii?Q?Cho9cGZYyEaT5LqFYJkCV35iFPUNgsqvqJL/vNtWGQ7z1tW/O5I7vNIfSGDr?=
	=?us-ascii?Q?wjdUUE5fWhwzaRTvO0p/ylWjIpBJ/jxsu+KplFj8cC66WAOL5hIHYFiSGVUV?=
	=?us-ascii?Q?zpqTlNgxvpeQEgCSVmMq6/XxYHOlL/ClGKr+zD38RkrwUXqe1vVp+JjHOCzL?=
	=?us-ascii?Q?dD7AEfoW9fcjzuiGTvKxv3HgwPv+poDJG5Bi4+gF2UTZ8+HhzjvVenZbMTWO?=
	=?us-ascii?Q?6fvV0kPf2R5cAAX9UJV7iOj1fKBv7+ppAopffl1UOI/CBaYDKE1bgaqm5MhB?=
	=?us-ascii?Q?BpkfxPLs63OcVwR8pbOAVEy4O+QNVr+wWXRUoirokmZOvzUxW0iRQjvQMbQg?=
	=?us-ascii?Q?IQbd/bMlEYgARZl04xDucbzSQP8JYNvZ3wx8TyY19snNE/JJZipsY0WT10/o?=
	=?us-ascii?Q?s4CD4+fdQik6hbfOZpa7r+WCQoZ5yGFuxCZMfKfYCZLBudUrJO50d5MO6kbT?=
	=?us-ascii?Q?UnHcI5ALZTVXBfj9nAsfWupYZmdxgLKO2kZZ5gYMdu4iUA9q+8+fB07Nl66U?=
	=?us-ascii?Q?RhmiG07X03un2ERwK9rkrO7FNGZMqQ/yuKkFBKDP2o/CSW7pEYNg+ZwCr8jL?=
	=?us-ascii?Q?LdePPwjCFrhPM4kD0UXoJezyAXIbCmiPIf6jjX9NJkq5Pbr0O2/UKIYj7gt9?=
	=?us-ascii?Q?shqdvFlXT6LLJpkMr9rKqsmRQbeRyGeJK4R5BfP3isGjkQYHYfn2PfJTwnFQ?=
	=?us-ascii?Q?shwiGnK9x21jw5B57oQQcoddYkIZ+9+h5+9BOvQT3skVbybxhS1xJDwKkmRE?=
	=?us-ascii?Q?faQ+pEIEk4MOdjQx5GSzPU/7G+o6PjCmn1fEk7LReeL4G5uFxQWWsV54xPv+?=
	=?us-ascii?Q?HMrQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:jOv8Inn/TFKBUFwnqNKsvXPvE85f5lVkZqrwjZr425ggM/3x4c1pZBj+8qIKztPQGR3razDYnVwDF8W68E3MNKCG4845yEzru4AdKf3qKo+dqRqooX6gQu+5kX/O04LRaxeT0SuT2VR4D+Lnz2RZVw==;
	24:zRefOW7LoAeJcQQqx27twvk8OWCrcOrvG8iPhMzmcMh5FeiomEDPk8pyRHswpftLixMIWhFI29+ktpDb0KxoVwI7Dc93TVXF/nu3QrM1d50=;
	20:s8g9fRhD12zSkodJZy7QQNe3szHBS8Ik6bXzEqQGwDs49uienvxyOv0gJqeoUFQskafhD03rjmcwOoBp5e/bFA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:34.5840 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0701;
	2:a4Q7jbhR85pKETvg5EcxwsQ6bGswtLU0oZ5Lha3ap7CYImikxFi1bdb1vnk2UKMZ;
	3:MarDxky87U/EXSjzU3QMHb9erNX2k1t5pKMkZe1E6XoAU2WTKe21jrdfWoNyxLb3u+kRQzTjGtWCjCveipWOPexLYifChrCKaN+QdwrfkHvNU5NCmmxK53/nIg0gjSSD21HOQ1fMGvKwv6ENPEWzrYHBwmtw/vwoo4PP9baxrT5ddqO116Diz5P8NHmGyp3ph5Ej68Vprwndxv67z3DxphjtnKSGQTywhgzMHzEF8F0=;
	25:1d59emFWhqwlsItJb9XgLJsOicW0VEDcXPRO4+ybhotg8v0uN3aGR3QseX2jpThc5hbYf6XnwyV8CnJaoJy32d3rMDaTtsFNxldgey6ulgZ5PB5d4IU3kKuQjj7ztuBww55ySEemlMIgh94P5pZv6GK3HD3zwh6YdxismDbL/3IwB7StdRpWuKlYGKd5+iog395KEKgkwuIdqFjEaUB+SjS1sYqSjD2dhmJ3VD+jjRxTdXNf8U8ZiUhIqoR0xIekrR2YkBqtA9iiwN6siTMSWw==;
	23:cyHcHSkD1kX5uSu6EwQ+CIgCrIXXlQFfSXe8ES42ApxeJYlhsV8WAVBPikNJKzs6jnRQWDv/EZeSZWU4BaFDVtjqj0rWgRJvZs/nHs0mo9x/GEdsalbPHXvm+QIJmUuOtILUKBGNPDEiNtktxbuyRC60Cl/tZdH9BQtogyWnSWtgO1P19MNpi1LlSp4fITZGCyjLJzwRPZv7UySwwxLSvVwFW1EdoXmNCfvR/veNCFIdfq3lAL/keoOdZ1uix1yK
X-OriginatorOrg: freescale.com
Subject: [poky v3][PATCH 3/6] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:49 -0000
Content-Type: text/plain

Video buffer pool will update video alignment to respect stride alignment
requirement. But haven't update it to video alignment in configure.
Which will cause user get wrong video alignment.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../videobuffer_updata_alignment_update.patch      | 53 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
new file mode 100755
index 0000000..ae37685
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/videobuffer_updata_alignment_update.patch
@@ -0,0 +1,53 @@
+commit 88d253ea23b06289df40401160b606323f16c910
+Author: Song Bing <b06498@freescale.com>
+Date:   Mon Dec 15 09:34:35 2014 +0800
+
+videopool: update video alignment after video alignment
+
+Video buffer pool will update video alignment to respect stride alignment
+requirement. But haven't update it to video alignment in configure.
+Which will cause user get wrong video alignment.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741501
+
+Upstream-Status: Backport [1.4.1]
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+diff --git a/gst-libs/gst/video/gstvideopool.c b/gst-libs/gst/video/gstvideopool.c
+index 4475f45..acef594 100644
+--- a/gst-libs/gst/video/gstvideopool.c
++++ b/gst-libs/gst/video/gstvideopool.c
+@@ -167,6 +167,7 @@ video_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* get an apply the alignment to the info */
+     gst_buffer_pool_config_get_video_alignment (config, &priv->video_align);
+     gst_video_info_align (&info, &priv->video_align);
++    gst_buffer_pool_config_set_video_alignment (config, &priv->video_align);
+   }
+   priv->info = info;
+
+diff --git a/sys/ximage/ximagepool.c b/sys/ximage/ximagepool.c
+index 6cc2cfa..6a1cbc9 100644
+--- a/sys/ximage/ximagepool.c
++++ b/sys/ximage/ximagepool.c
+@@ -597,6 +597,8 @@ ximage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
+diff --git a/sys/xvimage/xvimagepool.c b/sys/xvimage/xvimagepool.c
+index 244a51a..34b1ab2 100644
+--- a/sys/xvimage/xvimagepool.c
++++ b/sys/xvimage/xvimagepool.c
+@@ -124,6 +124,8 @@ xvimage_buffer_pool_set_config (GstBufferPool * pool, GstStructure * config)
+     /* do padding and alignment */
+     gst_video_info_align (&info, &priv->align);
+
++    gst_buffer_pool_config_set_video_alignment (config, &priv->align);
++
+     /* we need the video metadata too now */
+     priv->add_metavideo = TRUE;
+   } else {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index aa90179..88c3254 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
             file://fix-id3demux-utf16-to-utf8-issue.patch \
             file://handle-audio-video-decoder-error.patch \
+            file://videobuffer_updata_alignment_update.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


