Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0103.outbound.protection.outlook.com [157.56.111.103])
	by mail.openembedded.org (Postfix) with ESMTP id 915A5766F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:42 +0000 (UTC)
Received: from CH1PR03CA002.namprd03.prod.outlook.com (10.255.156.147) by
	CY1PR0301MB1180.namprd03.prod.outlook.com (10.160.165.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:40 +0000
Received: from BL2FFO11FD045.protection.gbl (10.255.156.132) by
	CH1PR03CA002.outlook.office365.com (10.255.156.147) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:40 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD045.mail.protection.outlook.com (10.173.161.207) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Fri, 7 Aug 2015
	06:16:40 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVMx028512;
	Thu, 6 Aug 2015 23:16:38 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:35 +0800
Message-ID: <1438928203-12256-4-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD045;
	1:W7ErwBsrNLcKTvqG6HDOtwEd0UyDjyYDG+UC52113Loy9tL4yRV7CwmJ4MVdHikt1avInl8IRXtAuaxvkl8X5XXpj8DbMphCZQ/B95QQrAUcv+ZhEln6NtCSA6csW8Bk5FeVyvYDQ7dNPgWF6lPkgWwOrjUqpscKlWhDop3h38IHKPHK1oDbzFUxzOfEaBY80diyNyXyBUjh5ZPn4tP6N1xAizOdaZqjp/bipvw6J0ZpJZfeLe8jLl3tABFxNz10XyKzRjzMwu3kDEo+TKq4Cw3OdrGa0RoumxggNPXIKeIqU8gG7tsr92EAwswu2cuUy5XZG0VFPvQVBGAMYpic7Q==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(76176999)(230783001)(5003940100001)(77096005)(36756003)(575784001)(107886002)(5001830100001)(86362001)(5001860100001)(68736005)(110136002)(15975445007)(19580405001)(189998001)(50466002)(48376002)(97736004)(92566002)(229853001)(77156002)(2351001)(62966003)(46102003)(19580395003)(6806004)(33646002)(50986999)(69596002)(47776003)(64706001)(50226001)(105606002)(85426001)(87936001)(5001960100002)(4001540100001)(2950100001)(81156007)(104016003)(106466001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1180;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	2:pJXg+q/9OeyK8zjbSu+HQOFMPmrDNNpqT1qgjAZJ0ORMSf/ujc/g9jCwuoWc3JHHA1pNbuja/pk8b1DhTDGt26DYycLyIRJiISUP6vR5CY1GCczSwJyj19wAD0R0uv4zxR3jeIbmNuqX0UCEM/1N2uD7pCuwM069pqY2pgwMWko=;
	3:13663eQqAheH+vdx3AtNOtjvn+3EDLIenHLLVaZ77pQk0qhnK8i1moruMrPdB0E1luKK77nGrnFu3nxhxRpI+JKRwIiEOnj8U74qAsRtVwBKV2RpPbu72Ol5F/RNhzRLDMfAFUpsyVMolWyUjax2xLUztXCMm7KrSsMgO3Y6pG4mRLYy6+a42D35dzJIMN7aiwmkJmpWJ5CWW5dCesiatZbUg0uHJQFLhB0fm72r7e8=;
	25:wXf/YjUG5tH/3TwY8bXrckrjLldfXs2Upl7dNr23x9DeNBE0NRB02RxQMRtgdpmDJ5I+cUtLIPnsBwpX4fkTkdsQXXkVKpA1p5cNdadJtaDaJ7ZDIxYGAi4ZX2UGxPtZNKQnG9tulzCPTWnaYe9NO4rJB6kfXhfOdkz3rdHEcAYxDs8D1CZLkeDJ3k3P1zX7fOTcG0tMVZmd4ocsBDkYSuV4upsveFAkWaOEFu6/ondTFWstZxQHTkdvWOsj+bYMnYl78PN6Kne07rr8WML0eg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1180;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	20:Dt08Uu0C3/bxw3a/WjjdbJuaK+GeJHvLzQbXOzbmGi1y7XL4R2PvMY7XTvPhAFMIKxPBxrtCcxC8Bg811NyFNPnlBlWQMSV9vunJxK+CeN37eFTi59Rh/WdZxVsnanxiYC4uoLyM+tbeCBN8X5XtEuL2scmlwupLCAxMdHqtn8enNauv6jZAiMpYXTHaNh3s2Vn4UeeJpmGeXvyeblmYkGlafpNSHrxm3TCtoVQ7dWHvSkws1Ic/7zFvZ7VfQYZNarkdPIcMarasQBT4cmQ/26gRj5d0E+4hCciWlnI6/UWJhn6Rfpzea8FVv6z4XMXjiKYUCynZaPbjHOh8va2mS0iPxOo4Qx0HeaUeut0jvYQ=;
	4:FpukIxSsVCuEdCL7wW96h8QRi7wQRPyz9Zy1wstRJDrqaThMDaVwdrgPUJ5CRu8NYJLcNb989re/es6B5udiToJDgTXQ2ZbTNgv9d6hDLAnATIA6mFbry/AIUgXWw70VuXWqUs0ICpfn78VMKHlXG4knwvUOSQAkoXpYsIWHJv27aNAQePpHby2ZkYr8dEp5SWju3rv14DTfgPi+RbOkKLxCRy+l6qfis7PgsMQoEkxyU9/Xz2pU2Tt8fktLSaZKZSydFMfhNLnnVygrShAUrU4yJh3EWCHUwA3vj66477c=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1180B0E95AB01A0531AAB06986730@CY1PR0301MB1180.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1180; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1180; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1180;
	23:dqjeRPKWM3c3fKbiff4OHvuevtz4XRl/2qtyxkT?=
	=?us-ascii?Q?U/IGgah5Emw8ETIgegrHb+itwE0o0RJQa13PEtWaRSrzrBZa6NPJAoSUs+qE?=
	=?us-ascii?Q?ysqgnStRM+3bwQ8A2xmyU0C3Ptt2zLpDXJVcCIt5PnfFxOkHNhEVQyGump1m?=
	=?us-ascii?Q?5UhPJ8k3QxIJ1w9+eKafs29TyT/wCkT+w96Cd9IlbHCNgcDW16mc4oyLDty0?=
	=?us-ascii?Q?I3MhYrYhI52kwROtJDL0+AwdEamYBb21vb+ADKY15ppjfD8qTtL/f/Bg2Kwu?=
	=?us-ascii?Q?rAKRI5V58x+6fRsn1Ryg63NOd3+TmI/SsG/OIaJPfuT0lMgW7en/N5PrkkPS?=
	=?us-ascii?Q?VA9GWenSsM+vNped8Wt/2TFN3572MYV/flrucqr2bKHvl3Wp5xCNif7dLUnL?=
	=?us-ascii?Q?RqvqBLsjiHEsBVCem8azvF3OTuN0EFioTVCOp03W8fwRf2gOyTbAY64sxAkS?=
	=?us-ascii?Q?5zw+s3Ik+awDq6IJMqCbbLARbl/ewFtQEW2/pS5PsRPev601y88ELv3YgHzP?=
	=?us-ascii?Q?fupFaM8vRWY9zAnDKxJjM/Cp+NPskJedEf1XSLemogrHHkxi4FMF62/VzWIv?=
	=?us-ascii?Q?faC3g9VaGpzOULT9BftG/j/eYUMxV/Hdud8EyH+wkWJF5Ko1tNZWIJWS6+S4?=
	=?us-ascii?Q?FKMyWjYp3BSYMr8vBis9H2Va+snvEhgPz5kicJ3V3hmzW745e1roHgwoVxOT?=
	=?us-ascii?Q?ehzxUl6JNd0GRQ+4wZk1FjHIs/YnfGA8ldUZWd8Zylojhb6XgUeaD7G0Xds/?=
	=?us-ascii?Q?wZ7E2is1+hpvKiTJ5ojWx6yomX8qVXXBUpo+8FBK26UW5XwdYQQwH3queEu8?=
	=?us-ascii?Q?SgbzhxACY9fCvoY74zl9ME6sXKjfr7kre6f8E/lVVIRaWC2c7VntO59iDQUt?=
	=?us-ascii?Q?AmFe321tmDbzcEynhR55iB/AUnzwJMcF3aqiE3ee/RiJV2nsfmKWwLa5XUCx?=
	=?us-ascii?Q?tSA9hdu+6EhdgW5JKQP6Mb3mYXdDO5dOUh2jLbCdYsQUdgdtLzyR5hlLDjQH?=
	=?us-ascii?Q?obdTmIeotftvHCl49Zu+qqH2x3LpCGGhNBhGXYlYyjHg6Ptyq6i1NCJeBs4C?=
	=?us-ascii?Q?aFkBgLsfA3HZ/NnjlL6APjtN4KOOTHrVE28+2gGTOfXCyMyjqrAShHMmXEBJ?=
	=?us-ascii?Q?3uMleAd3vtoqv05R7nxJq/JqIQjxeV9YOOYZlhuIN+AKaFWPiTbDRYZHg6/+?=
	=?us-ascii?Q?9A3v5f7lx9ol3LmGUmR6KH8k4zjRqQUIfFA3lumV/aG54tv2fwBtWAeSETEA?=
	=?us-ascii?Q?HRaMeyTHvecGdti5AHbc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	5:QcMkbL8KrwbjvgAv+Nk3w0m4MwJXU7qEFKEbnVd81umm4HblxlMBUVW8rUoeLh/bfPeSVw7Ip8A1I0HDZ/ijkcAd7szoZNLbRKbURD5wYUXhRWRNQQqdJtLaWk1LqafJ5y0fBdEzGYoDG+arijAw4w==;
	24:B4vexCGfJRH3HCw+FbKdX2NQn0T6hIhEaS1qyMuc3a9rcXOmjnx63/iBfnPXeFurR+TwxEhOWEktx0m9erD+Xrs5zK91YLKbbrZH9bvpzq4=;
	20:VKRFeBvSh2+e6x6kMZWljHZGnjgdT5tw+aCkMLFhN5WDY8uRvoSldIdGXRfxC0BembD3UGTBfjHE9mcZzt01AA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:40.2992 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1180
Subject: [poky][PATCH v7 03/11] gstreamer1.0-plugins-base: update video alignment after video alignment
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:46 -0000
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
index 0000000..8cfda95
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
+Upstream-Status: Backport [1.5.1]
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


